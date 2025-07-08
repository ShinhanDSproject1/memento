let currentIdempotencyKey = null;

function generateIdempotencyKey() {
  return crypto.randomUUID(); // 간단하고 안전
}

$(document).ready(function () {
	// ✅ 입력값이 바뀌면 멱등키 초기화
	$("input, textarea, select").on("input change", function () {
		currentIdempotencyKey = null;
	});

	// 2. 요일 선택
	const $days = $(".dayofweek .day");
	const $selectedDaysInput = $("#selectedDaysInput");
	let selectedDays = [];

	$days.on("click", function (e) {
		e.preventDefault();
		const $this = $(this);
		const dayCode = $this.data("day");
		if ($this.hasClass("selected")) {
			$this.removeClass("selected");
			selectedDays = selectedDays.filter(d => d !== dayCode);
			$this.find(".fa-check").remove();
		} else {
			$this.addClass("selected");
			selectedDays.push(dayCode);
			if (!$this.find(".fa-check").length) {
				$this.find("span").before("<i class='fa-solid fa-check'></i>");
			}
		}
		$selectedDaysInput.val(selectedDays.join(","));
		currentIdempotencyKey = null; // ✅ 요일 수정 시 멱등키 초기화
	});

	// 3. 날짜 선택 시 스타일
	$("#startDateInput, #endDateInput").on("change", function () {
		const $input = $(this);
		const $box = $input.closest(".main-selection-border");

		if ($input.val()) {
			$box.addClass("selected");
			if (!$box.find(".fa-check").length) {
				$box.append("<i class='fa-solid fa-check' style='margin-left: 10px;'></i>");
			}
		} else {
			$box.removeClass("selected");
			$box.find(".fa-check").remove();
		}
		currentIdempotencyKey = null;
	});

	// 4. 파일 업로드
	$("#logoFile").on("change", function () {
		const fileName = this.files.length ? this.files[0].name : "";
		$("#logoFileName").val(fileName);
		currentIdempotencyKey = null;
	});

	// 5. 다음 주소 API
	window.execDaumPostcode = function () {
		new daum.Postcode({
			oncomplete: function (data) {
				$("#postcode").val(data.zonecode);
				$("#roadAddress").val(data.roadAddress);
				$("#detailAddress").focus();
				currentIdempotencyKey = null;
			}
		}).open();
	};

	// 6. 드롭다운
	function initializeDropdownBox($dropdownBox) {
		const $label = $dropdownBox.find(".dropdown-label");
		const $dropdown = $dropdownBox.find(".type-dropdown");
		const $hiddenInput = $dropdownBox.find("input[type=hidden]");

		$dropdownBox.off("click").on("click", function (e) {
			e.preventDefault();
			e.stopPropagation();
			$(".type-dropdown").not($dropdown).addClass("hidden");

			if ($dropdown.hasClass("hidden")) {
				$dropdown.removeClass("hidden");
			} else {
				$dropdown.addClass("hidden");
			}
		});

		$dropdown.find("li").off("click").on("click", function (e) {
			e.stopPropagation();
			const value = $(this).data("value");
			const text = $(this).text();
			$label.text(text).attr("data-value", value);
			if ($hiddenInput.length) $hiddenInput.val(value);
			$dropdown.addClass("hidden");
			currentIdempotencyKey = null;
		});
	}
	$(".dropdown-box").each(function () {
		initializeDropdownBox($(this));
	});
	$(document).on("click", function () {
		$(".type-dropdown").addClass("hidden");
	});

	// 7. 만들기 버튼
	$(".mentos-leader-make-btn").on("click", function (e) {
		e.preventDefault();

		if (typeof oEditors !== "undefined" && oEditors.length > 0) {
			oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
		}

		if (!currentIdempotencyKey) {
			currentIdempotencyKey = generateIdempotencyKey(); // ✅ 최초 요청 시에만 생성
		}

		const fullAddress = $("#roadAddress").val().trim();
		const spaceIndex = fullAddress.indexOf(" ");
		const regionGroup = spaceIndex !== -1 ? fullAddress.substring(0, spaceIndex) : fullAddress;
		const regionSubgroup = spaceIndex !== -1 ? fullAddress.substring(spaceIndex + 1).trim() : "";

		const data = {
			title: $("#title").val(),
			simpleContent: $("#simpleContent").val(),
			mentoId: mentoId,
			minMember: Number($("#minMember").val()),
			maxMember: Number($("#maxMember").val()),
			startDay: $("#startDateInput").val(),
			endDay: $("#endDateInput").val(),
			startTime: $("#startTimeInput").val(),
			endTime: $("#endTimeInput").val(),
			selectedDays: $("#selectedDaysInput").val(),
			price: Number($("#price").val()),
			times: Number($("#sessionCountValue").val()),
			categoryId: Number($("#categoryValue").val()),
			languageId: Number($("#languageValue").val()),
			regionGroup: regionGroup,
			regionSubgroup: regionSubgroup,
			regionDetail: $("#detailAddress").val(),
			content: $("#editorTxt").val(),
			matchTypeFirst: Number($(".preferred-type-value1").val()),
			matchTypeSecond: Number($(".preferred-type-value2").val()),
			matchTypeThird: Number($(".preferred-type-value3").val())
		};

		const formData = new FormData();
		const file = $("#logoFile")[0].files[0];
		if (file) formData.append("image", file);
		formData.append("data", new Blob([JSON.stringify(data)], { type: "application/json" }));

		$.ajax({
			url: "http://localhost:9999/memento/mentos",
			type: "POST",
			data: formData,
			processData: false,
			contentType: false,
			headers: {
				"Idempotency-Key": currentIdempotencyKey
			},
			success: function (response) {
				setTimeout(() => {
					currentIdempotencyKey = null;
				}, 30000); // 서버의 TTL과 동일하게 30초 유지

				const modal = document.querySelector("#submitLayer");
				modal.classList.remove("hidden");
				modal.querySelector(".confirm-btn").addEventListener("click", function () {
					modal.classList.add("hidden");
					window.location.href = "/memento/mentos/full";
				});
			},
			error: function (xhr) {
				console.error("에러 발생:", xhr.responseText);
				alert("생성 실패 😢");
				// 실패 시엔 멱등키 유지 → 재시도 가능
			}
		});
	});

	// 8. 취소 버튼
	$(".mentos-leader-cancel-btn").on("click", function (e) {
		const modal = document.querySelector("#cancelLayer");
		modal.classList.remove("hidden");
		modal.querySelector(".confirm-btn").addEventListener("click", function () {
			modal.classList.add("hidden");
			window.location.href = "/mentos/full";
		});
	});
});
