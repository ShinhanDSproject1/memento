$(document).ready(function () {
	// 2. 요일 선택 (check 아이콘 포함)
	const $days = $(".dayofweek .day");
	const $selectedDaysInput = $("#selectedDaysInput");
	let selectedDays = [];
	
	const mentosId = $("body").data("mentos-id");
	const memberId = $("body").data("member-id");

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

	// 7. 수정하기 버튼 → 모달 + 이동
	$(".mentos-leader-update-btn").on("click", function (e) {
	    e.preventDefault();
	
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
	        mentoId: memberId,
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
	
	    const mentosId = $("body").data("mentos-id");
	
	    $.ajax({
	        url: `http://localhost:9999/memento/mentos/edit?mentosId=${mentosId}`,
	        type: "PATCH",
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function (response) {
	            const modal = document.querySelector("#submitLayer");
	            modal.classList.remove("hidden");
	
	            modal.querySelector(".confirm-btn").addEventListener("click", function () {
	                modal.classList.add("hidden");
	                window.location.href = "/memento/mentos/full";
	            });
	        },
	        error: function (xhr) {
	            console.error("에러 발생:", xhr.responseText);
	            alert("수정 실패 😢");
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
	
	function applySelectedDays(dayString) {
	  const selectedDays = dayString.split(","); // ["TUE", "WED"]
	
	  selectedDays.forEach(dayCode => {
	    const $dayItem = $(`.day[data-day='${dayCode}']`);
	    if (!$dayItem.hasClass("selected")) {
	      $dayItem.addClass("selected");
	    }
	
	    // 아이콘이 이미 없는 경우만 추가
	    if (!$dayItem.find(".fa-check").length) {
	      $dayItem.find("span").before("<i class='fa-solid fa-check'></i>");
	    }
	  });

	  // hidden input에도 저장
	  $("#selectedDaysInput").val(dayString);
	}
	
	// 처음 호출해왔을 때 데이터 뽑아주기
	  $.ajax({
	    url: `/memento/mentos/detail/edit?mentosId=${mentosId}&memberId=${memberId}`,
	    type: 'GET',
	    dataType: 'json',
	    success: function(response) {
	    	const data = response.result;
		    $('#title').val(data.title);
		    $('#simpleContent').val(data.simpleContent);
		    $('#minMember').val(data.minMember);
		    $('#maxMember').val(data.maxMember);
		    $('#startDateInput').val(data.startDay);
		    $('#endDateInput').val(data.endDay);
		    $('#startTimeInput').val(data.startTime);
		    $('#endTimeInput').val(data.endTime);
		    applySelectedDays(data.selectedDays);
		    $('#logoFileName').val(data.image);

			const labelText = $(`#sessionCountDropdown li[data-value='${data.times}']`).text();
			$("#selectedSessionCount").text(labelText);
			
		 	$("#categoryValue").val(data.categoryId);
		 	$('#selectedCategory').text($(`#categoryDropdown li[data-value='${data.categoryId}']`).text());
		 	$("#languageValue").val(data.languageId);
		 	$('#selectedLanguage').text($(`#languageDropdown li[data-value='${data.languageId}']`).text());
		 	
		 	$('#price').val(data.price);
		 	$('#roadAddress').val(`${data.regionGroup} ${data.regionSubgroup}`);
		 	$('#detailAddress').val(data.regionDetail);
		 	$('#editorTxt').val(data.content);
		 	const matchTypes = [
			  data.matchTypeFirst,
			  data.matchTypeSecond,
			  data.matchTypeThird
			];
			
			matchTypes.forEach((value, index) => {
			  const i = index + 1; // 1부터 시작
			  $(`.preferred-type-value${i}`).val(value);
			
			  const labelText = $(`.preferred-type-value${i}`)
			    .closest(".dropdown-box")
			    .find(`.type-dropdown li[data-value='${value}']`)
			    .text();
			
			  $(`.preferred-type-value${i}`)
			    .closest(".dropdown-box")
			    .find(".dropdown-label")
			    .text(labelText);
			});
		 }
	  });
});
