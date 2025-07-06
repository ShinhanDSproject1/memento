$(document).ready(function () {
	// 2. 요일 선택 (check 아이콘 포함)
	const $days = $(".dayofweek .day");
	const $selectedDaysInput = $("#selectedDaysInput");
	let selectedDays = [];

	$days.on("click", function (e) {
		e.preventDefault();
		const $this = $(this);
		const dayCode = $this.data("day");
		console.log(dayCode);
		if ($this.hasClass("selected")) {
			$this.removeClass("selected");
			selectedDays = selectedDays.filter(d => d !== dayCode);
			$this.find(".fa-check").remove();
		} else {
			$this.addClass("selected");
			selectedDays.push(dayCode);

			// 중복 아이콘 방지
			if (!$this.find(".fa-check").length) {
				$this.find("span").before("<i class='fa-solid fa-check'></i>");
			}
		}

		$selectedDaysInput.val(selectedDays.join(","));
	});
	
	// ✅ 날짜 선택 시 스타일 추가
	$("#startDateInput, #endDateInput").on("change", function () {
		const $input = $(this);
		const $box = $input.closest(".main-selection-border");
	
		if ($input.val()) {
			$box.addClass("selected");
			// 체크 아이콘 추가 (중복 방지)
			if (!$box.find(".fa-check").length) {
				$box.append("<i class='fa-solid fa-check' style='margin-left: 10px;'></i>");
			}
		} else {
			$box.removeClass("selected");
			$box.find(".fa-check").remove();
		}
	});

	// 3. 파일 업로드
	$("#logoFile").on("change", function () {
		const fileName = this.files.length ? this.files[0].name : "";
		$("#logoFileName").val(fileName);
	});

	// 4. 다음 주소 API
	window.execDaumPostcode = function () {
		new daum.Postcode({
			oncomplete: function (data) {
				$("#postcode").val(data.zonecode);
				$("#roadAddress").val(data.roadAddress);
				$("#detailAddress").focus();
			}
		}).open();
	};

	// 5. 드롭다운 초기화
	function initializeDropdownBox($dropdownBox) {
	const $label = $dropdownBox.find(".dropdown-label");
	const $dropdown = $dropdownBox.find(".type-dropdown");
	const $hiddenInput = $dropdownBox.find("input[type=hidden]");

	// ✅ 기존 이벤트 제거 후 다시 바인딩
	$dropdownBox.off("click").on("click", function (e) {
		e.preventDefault();
		e.stopPropagation();
		$(".type-dropdown").not($dropdown).addClass("hidden");

		if ($dropdown.hasClass("hidden")) {
			console.log("⬇️ 드롭다운 열림");
			$dropdown.removeClass("hidden");
		} else {
			console.log("⬆️ 드롭다운 닫힘");
			$dropdown.addClass("hidden");
		}
	});

	$dropdown.find("li").off("click").on("click", function (e) {
		e.stopPropagation();
		const value = $(this).data("value");
		const text = $(this).text();

		$label.text(text);
		$label.attr("data-value", value);
		if ($hiddenInput.length) $hiddenInput.val(value);
		$dropdown.addClass("hidden");
	});
	}

	// 드롭다운 전체 적용
	$(".dropdown-box").each(function () {
		initializeDropdownBox($(this));
	});

	// 6. 외부 클릭 시 드롭다운 닫기
	$(document).on("click", function () {
		$(".type-dropdown").addClass("hidden");
	});

	// 7. 만들기 버튼 → 모달 + 이동
	$(".mentos-leader-make-btn").on("click", function (e) {
		e.preventDefault();
	
		// 스마트에디터 동기화
		if (typeof oEditors !== "undefined" && oEditors.length > 0) {
			oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
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

		console.log("보낼 데이터:", data);
	
		// 서버로 POST 요청
		$.ajax({
			url: "http://localhost:9999/memento/mentos",
			type: "POST",
			data: formData,
			processData: false,
			contentType: false,
			success: function (response) {
			   // ✅ 'hidden' 클래스 제거해서 보이게 하기
			   const modal = document.querySelector("#submitLayer");
			   modal.classList.remove("hidden");
			
			    // ✅ 확인 버튼 눌렀을 때 다시 숨기고 이동
			    modal.querySelector(".confirm-btn").addEventListener("click", function () {
			        modal.classList.add("hidden");
			        window.location.href = "/mentos/full";
			    });
			},
			error: function (xhr) {
				console.error("에러 발생:", xhr.responseText);
				alert("생성 실패 😢");
			}
		});
	});

	// 8. 취소 버튼 → 모달 + 이동
	$(".mentos-leader-cancel-btn").on("click", function (e) {
		 // ✅ 'hidden' 클래스 제거해서 보이게 하기
			   const modal = document.querySelector("#cancelLayer");
			   modal.classList.remove("hidden");
			
			    // ✅ 확인 버튼 눌렀을 때 다시 숨기고 이동
			    modal.querySelector(".confirm-btn").addEventListener("click", function () {
			        modal.classList.add("hidden");
			        window.location.href = "/mentos/full";
			    });
	});
});
