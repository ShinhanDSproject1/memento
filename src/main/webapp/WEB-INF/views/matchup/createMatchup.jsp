<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>me:mento</title>
<link rel="stylesheet" href="${cpath}/resources/css/createMatchup.css">
<link rel="stylesheet" href="${cpath}/resources/css/vars.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/matchup/createConfirmModal.jsp" />
	<div class="create-matchup-container">
		<div class="top-area">
			<div class="div">어떤 매치업을 만들까요?</div>
		</div>
		<div class="title-area">
			<div class="title">
				<div class="div2">매치업명</div>
			</div>
			<div class="insert-title">
				<div id="matchupTitle" class="editable-title" contenteditable="true"
					data-placeholder="매치업명이 짧을수록 이해하기 쉬워요."></div>
				<!-- 전송용 hidden input -->
				<input type="hidden" id="matchupTitleHidden" name="matchupTitle"
					value="">
			</div>
		</div>
		<div class="content-area">
			<div class="content">
				<div class="div2">소개글</div>
			</div>
			<div class="insert-content">
				<div class="_2">활동 중심으로 소개해주세요. 소개를 잘 작성한 매치업은 2배 많은 인원이 가입해요!
				</div>
			</div>
		</div>
		<div class="address">
			<div class="div2">모임 장소</div>
		</div>
		<div class="address-area">
			<div class="postal-code-area">
				<input type="text" id="postcode" class="postal-code"
					placeholder="우편번호" readonly />
				<button type="button" class="postal-code-btn"
					onclick="execDaumPostcode()">우편번호 찾기</button>
			</div>

			<input type="text" id="roadAddress" class="road-name-address"
				placeholder="도로명 주소" readonly /> <input type="text"
				id="jibunAddress" class="street-number-address" placeholder="지번 주소"
				readonly /> <input type="text" id="detailAddress"
				name="detailAddress" class="detail-address"
				placeholder="상세 주소를 입력하세요" />
		</div>
		<div class="select-area">
			<div class="select-top">
				<!-- 1열: 사용 언어 -->
				<div class="language-area">
					<div class="label">사용 언어</div>
					<div class="select-language-box" id="languageSelectBox">
						<div id="selectedLanguage" class="java">자바(Java)</div>
						<div class="icon-caret-05" id="languageToggle">
							<img class="icon-caret-01-single-down"
								src="${cpath}/resources/images/icon-down.svg" />
						</div>
					</div>

					<!-- 드롭다운 메뉴 -->
					<ul class="language-dropdown hidden" id="languageDropdown">
						<li data-value="Python">파이썬(Python)</li>
						<li data-value="Java">자바(Java)</li>
						<li data-value="C++">C++</li>
						<li data-value="C#">C#</li>
						<li data-value="C">C</li>
						<li data-value="HTML/CSS">HTML / CSS</li>
						<li data-value="JavaScript">JavaScript</li>
						<li data-value="None">사용하는 언어 없음</li>
					</ul>

					<!-- 서버 전송용 -->
					<input type="hidden" id="languageValue" name="language"
						value="Java">
				</div>

				<!-- 2열: 카테고리 -->
				<div class="category-area">
					<div class="label">카테 고리</div>
					<div class="select-category-box" id="categorySelectBox">
						<div id="selectedCategory" class="div7">알고리즘</div>
						<div class="icon-caret-05" id="categoryToggle">
							<img class="icon-caret-01-single-down"
								src="${cpath}/resources/images/icon-down.svg" />
						</div>
					</div>

					<!-- 드롭다운 메뉴 -->
					<ul class="category-dropdown hidden" id="categoryDropdown">
						<li data-value="Interview">면접 준비</li>
						<li data-value="OS">운영체제</li>
						<li data-value="DB">데이터베이스</li>
						<li data-value="Network">네트워크</li>
						<li data-value="C">자료구조</li>
						<li data-value="HTML/CSS">알고리즘</li>
						<li data-value="JavaScript">자격증</li>
					</ul>

					<!-- 서버 전송용 -->
					<input type="hidden" id="categoryValue" name="category"
						value="알고리즘">
				</div>

				<!-- 3열: 시작일 -->
				<div class="start-date-area">
					<div class="label">시작일</div>
					<div class="start-date-box">
						<%-- <div class="icon-time-02">
							<img class="icon-time-calendar-01"
								src="${cpath}/resources/images/icon-calendar.svg" />
						</div> --%>
						<input type="date" id="startDateInput" name="startDate"
							class="date-input" />
					</div>
				</div>

				<!-- 4열: 종료일 -->
				<div class="end-date-area">
					<div class="label">종료일</div>
					<div class="end-date-box">
						<%-- <div class="icon-time-02">
							<img class="icon-time-calendar-01"
								src="${cpath}/resources/images/icon-calendar.svg" />
						</div> --%>
						<input type="date" id="endDateInput" name="endDate"
							class="date-input" />
					</div>
				</div>

				<!-- 5열: 시작 시간 -->
				<div class="start-time-area">
					<div class="label">시작시간</div>
					<div class="start-time-box">
						<input type="time" id="startTimeInput" name="startTime"
							class="time-input" required />
					</div>
				</div>

				<!-- 6열: 종료 시간 -->
				<div class="end-time-area">
					<div class="label">종료시간</div>
					<div class="end-time-box">
						<input type="time" id="endTimeInput" name="endTime"
							class="time-input" required />
					</div>
				</div>
			</div>

			<div class="select-bottom">
				<!-- 아래 항목들: 한 줄에 하나씩 정렬 -->
				<div class="total-cnt-area">
					<div class="label">총 진행 횟수</div>
					<div class="total-cnt-box">
						<div class="_22">2회</div>
						<div class="icon-caret-052">
							<img class="icon-caret-01-single-down"
								src="${cpath}/resources/images/icon-down.svg" />
						</div>

						<!-- 드롭다운 메뉴 -->
						<ul class="cnt-dropdown hidden" id="cntDropdown">
							<li data-value="one">1회</li>
							<li data-value="two">2회</li>
							<li data-value="three">3회</li>
							<li data-value="four">4회</li>
							<li data-value="five">5회</li>
						</ul>

						<!-- 서버 전송용 -->
						<input type="hidden" id="cntValue" name="cnt" value="1회">
					</div>

				</div>

				<div class="type-area">
					<div class="label">학습 성향</div>
					<div class="select-type-box">
						<div class="div8">목표지향 코치지</div>
						<div class="icon-caret-052">
							<img class="icon-caret-01-single-down"
								src="${cpath}/resources/images/icon-down.svg" />
						</div>
						<!-- 드롭다운 메뉴 -->
						<ul class="type-dropdown hidden" id="typeDropdown">
							<li data-value="active">활발한 개발자</li>
							<li data-value="quite">조용한 몰입형 개발자</li>
							<li data-value="creative">창의적 실험가 개발자</li>
							<li data-value="constructor">구조화 좋아하는 개발자</li>
							<li data-value="cozy">느긋한 꾸준형 개발자</li>
							<li data-value="goal">목표지향 개발자</li>
						</ul>

						<!-- 서버 전송용 -->
						<input type="hidden" id="typeValue" name="type" value="active">
					</div>

				</div>
				<div class="mento-area">
					<div class="label">멘토 유무</div>
					<div class="select-mento-box">
						<button type="button" class="mento-btn" data-value="유">유</button>
						<div class="mento-divider"></div>
						<button type="button" class="mento-btn" data-value="무">무</button>
					</div>
					<!-- 선택값 전달용 hidden input -->
					<input type="hidden" id="mentoYn" name="mentoYn" value="유">
				</div>

				<div class="min-member-area">
					<div class="label">최소 인원</div>
					<div class="min-member-box">
						<input type="number" id="minMember" name="minMember" min="1"
							class="number-input" />
						<!--  <span class="unit-label">명</span> -->
					</div>
				</div>

				<div class="max-member-area">
					<div class="label">최대 인원</div>
					<div class="max-member-box">
						<input type="number" id="maxMember" name="maxMember" min="1"
							class="number-input" />
						<!-- <span class="unit-label">명</span> -->
					</div>
				</div>

				<div class="price-area">
					<div class="label">가격</div>
					<div class="price-box">
						<input type="number" id="price" name="price" min="1"
							class="number-input" />
					</div>
				</div>
			</div>
		</div>
		<div class="create-btn">
			<div class="div10">개설하기</div>
		</div>
	</div>

	<script>
	// 멘토 유무 토글 버튼
	document.querySelectorAll('.mento-btn').forEach(btn => {
	  btn.addEventListener('click', () => {
	    const wrapper = btn.closest('.select-mento-box');
	    wrapper.querySelectorAll('.mento-btn').forEach(b => b.classList.remove('active'));
	    btn.classList.add('active');

	    const selectedValue = btn.dataset.value;
	    document.getElementById('mentoYn').value = selectedValue;
	  });
	});

	// 매치업명 입력 감지 및 제한
	const matchupTitle = document.getElementById('matchupTitle');
	const matchupTitleHiddenInput = document.getElementById('matchupTitleHidden');

	matchupTitle.addEventListener('input', () => {
	  let text = matchupTitle.innerText.trim();

	  // 글자 수 30자 제한
	  if (text.length > 30) {
	    text = text.slice(0, 30);
	    matchupTitle.innerText = text;

	    // 커서 맨 끝으로 이동
	    const range = document.createRange();
	    const sel = window.getSelection();
	    range.selectNodeContents(matchupTitle);
	    range.collapse(false);
	    sel.removeAllRanges();
	    sel.addRange(range);
	  }

	  // hidden input에 반영
	  matchupTitleHiddenInput.value = text;
	});

	// 다음 주소 API 실행 함수
	function execDaumPostcode() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      document.getElementById('postcode').value = data.zonecode;
	      document.getElementById('roadAddress').value = data.roadAddress;
	      document.getElementById('jibunAddress').value = data.jibunAddress;
	      document.getElementById('detailAddress').focus();
	    }
	  }).open();
	}

	// 사용 언어 드롭다운
	const languageToggleBtn = document.getElementById("languageToggle");
	const languageDropdown = document.getElementById("languageDropdown");
	const languageSelectedDisplay = document.getElementById("selectedLanguage");
	const languageHiddenInput = document.getElementById("languageValue");

	// 토글 버튼 클릭 → 드롭다운 열기/닫기
	languageToggleBtn.addEventListener("click", () => {
	  languageDropdown.classList.toggle("hidden");
	});

	// 드롭다운 항목 클릭 → 텍스트 반영 + 드롭다운 닫기
	languageDropdown.querySelectorAll("li").forEach(item => {
	  item.addEventListener("click", () => {
	    const value = item.dataset.value;
	    languageSelectedDisplay.textContent = item.textContent;
	    languageHiddenInput.value = value;
	    languageDropdown.classList.add("hidden");
	  });
	});

	// 바깥 클릭 시 드롭다운 닫기
	document.addEventListener("click", (e) => {
	  if (!document.getElementById("languageSelectBox").contains(e.target) &&
	      !languageDropdown.contains(e.target)) {
	    languageDropdown.classList.add("hidden");
	  }
	});
	
	// 🟡 카테고리 드롭다운
	const categoryToggleBtn = document.getElementById("categoryToggle");
	const categoryDropdown = document.getElementById("categoryDropdown");
	const categorySelectedDisplay = document.getElementById("selectedCategory");
	const categoryHiddenInput = document.getElementById("categoryValue");

	categoryToggleBtn.addEventListener("click", () => {
	  categoryDropdown.classList.toggle("hidden");
	});

	categoryDropdown.querySelectorAll("li").forEach(item => {
	  item.addEventListener("click", () => {
	    const value = item.dataset.value;
	    categorySelectedDisplay.textContent = item.textContent;
	    categoryHiddenInput.value = value;
	    categoryDropdown.classList.add("hidden");
	  });
	});

	document.addEventListener("click", (e) => {
	  if (!document.getElementById("categorySelectBox").contains(e.target) &&
	      !categoryDropdown.contains(e.target)) {
	    categoryDropdown.classList.add("hidden");
	  }
	});

	// 🟡 학습 성향 드롭다운
	const typeToggleBtn = document.querySelector(".type-area .icon-caret-052");
	const typeDropdown = document.getElementById("typeDropdown");
	const typeSelectedDisplay = document.querySelector(".type-area .div8");
	const typeHiddenInput = document.getElementById("typeValue");

	typeToggleBtn.addEventListener("click", () => {
	  typeDropdown.classList.toggle("hidden");
	});

	typeDropdown.querySelectorAll("li").forEach(item => {
	  item.addEventListener("click", () => {
	    const value = item.dataset.value;
	    typeSelectedDisplay.textContent = item.textContent;
	    typeHiddenInput.value = value;
	    typeDropdown.classList.add("hidden");
	  });
	});

	document.addEventListener("click", (e) => {
	  if (!document.querySelector(".type-area").contains(e.target) &&
	      !typeDropdown.contains(e.target)) {
	    typeDropdown.classList.add("hidden");
	  }
	});

	// 🟡 총 진행 횟수 드롭다운
	const cntToggleBtn = document.querySelector(".total-cnt-box .icon-caret-052");
	const cntDropdown = document.getElementById("cntDropdown");
	const cntSelectedDisplay = document.querySelector(".total-cnt-box ._22");
	const cntHiddenInput = document.getElementById("cntValue");

	cntToggleBtn.addEventListener("click", () => {
	  cntDropdown.classList.toggle("hidden");
	});

	cntDropdown.querySelectorAll("li").forEach(item => {
	  item.addEventListener("click", () => {
	    const value = item.textContent;
	    cntSelectedDisplay.textContent = value;
	    cntHiddenInput.value = value;
	    cntDropdown.classList.add("hidden");
	  });
	});

	document.addEventListener("click", (e) => {
	  if (!document.querySelector(".total-cnt-area").contains(e.target) &&
	      !cntDropdown.contains(e.target)) {
	    cntDropdown.classList.add("hidden");
	  }
	});
	document.querySelector(".create-btn").addEventListener("click", () => {
		  document.getElementById("createConfirmModal").classList.remove("hidden");
		});
	
	document.querySelector(".modal-close-btn").addEventListener("click", () => {
		  document.getElementById("createConfirmModal").classList.add("hidden");
		});

</script>
</body>
</html>
