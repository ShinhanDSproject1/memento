<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:set var="mentoId" value="${sessionScope.loginUser.memberId}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/019caa6bf2.js"
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${cpath}/resources/css/mainpage/notificationModal.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>멘토스 생성하기</title>
<link rel="stylesheet"
	href="${cpath}/resources/css/mentos/mentosCreate.css">
<script src="<c:url value='/resources/js/keepgoing/HuskyEZCreator.js'/>"
	charset="utf-8"></script>
<!-- 3. 취소 팝업 -->
<jsp:include page="/WEB-INF/views/mentos/cancelPopup.jsp" />
<!-- 4. 만들기 팝업 -->
<jsp:include page="/WEB-INF/views/mentos/submitPopup.jsp" />
</head>
<body>
	<%@ include file="../common/logout_header.jsp"%>
	<%@ include file="../mainpage/notificationModal.jsp" %>
	<script>
		const mentoId = "${mentoId}";
	</script>
	<section class="container">
		<div class="page-title">멘토스 만들기</div>
		<form action="${cpath}/mentos/create" method="post">
			<section class="insert-main">
				<div class="main-name-info">
					<div class="content-line">
						<label class="title">제목</label>
						<div class="textarea-border">
							<textarea id="title" name="title" rows="1"
								placeholder="영어, 한글, 숫자 사용가능(30자 이내)"></textarea>
						</div>
					</div>
					<div class="content-line">
						<label class="title">간단 소개글</label>
						<div class="textarea-border">
							<textarea id="simpleContent" name="simpleContent" rows="1"
								placeholder="영어, 한글, 숫자 사용가능(100자 이내)"></textarea>
						</div>
					</div>
					<div class="flexrow content-line flexgap-20">
						<div class="main-selection">
							<div class="title">최소 수강인원</div>
							<div class="main-selection-border">
								<input type="number" id="minMember" name="minMember" min="1"
									class="number-input" placeholder = "1"/>
							</div>
						</div>
						<div class="main-selection">
							<div class="title">최대 수강 인원</div>
							<div class="day-main-selection-border">
								<input type="number" id="maxMember" name="maxMember" min="1"
									class="number-input" placeholder = "10"/>
							</div>
						</div>
					</div>
					<div class="flexrow content-line flexgap-20">
						<div class="main-selection">
							<div class="title">시작일</div>
							<div class="day-main-selection-border">
								<input type="date" id="startDateInput" name="startDate"
									class="date-input" />
							</div>
						</div>
						<div class="main-selection">
							<div class="title">마감일</div>
							<div class="day-main-selection-border">
								<input type="date" id="endDateInput" name="endDate"
									class="date-input" />
							</div>
						</div>
					</div>
					<div class="flexrow content-line flexgap-20">
						<div class="main-selection">
							<div class="title">시작시간</div>
							<div class="main-selection-border">
								<input type="time" id="startTimeInput" name="startTime"
									class="time-input" required />
							</div>
						</div>
						<div class="main-selection">
							<div class="title">종료시간</div>
							<div class="main-selection-border">
								<input type="time" id="endTimeInput" name="endTime"
									class="time-input" required />
							</div>
						</div>
					</div>
					<div class="flexrow content-line flexgap-20">
						<div class="main-selection">
							<label for="title">활동요일</label>
							<ul class="flexrow dayofweek">
								<li class="day" data-day="MON"><span>월요일</span></li>
								<li class="day" data-day="TUE"><span>화요일</span></li>
								<li class="day" data-day="WED"><span>수요일</span></li>
								<li class="day" data-day="THU"><span>목요일</span></li>
								<li class="day" data-day="FRI"><span>금요일</span></li>
								<li class="day" data-day="SAT"><span>토요일</span></li>
								<li class="day" data-day="SUN"><span>일요일</span></li>
							</ul>
							<input type="hidden" name="selectedDays" id="selectedDaysInput"
								value="">
						</div>
					</div>
				</div>
				<div class="main-logo">
					<label>멘토스 이미지</label>
					<div class="drag-logo-file">
						<i class="fa-solid fa-file-arrow-up"></i>
						<div class="drag-text">
							<h4>Drag files to upload</h4>
						</div>
					</div>
					<div class="input-file">
						<label class="upload-label" for="logoFile">파일찾기</label> <input
							type="file" id="logoFile" name="logoFile" class="upload-file">
						<input readonly id="logoFileName" class="upload-name" value=""
							placeholder="첨부파일">
					</div>
					<!-- 드롭다운 박스 -->
					<label for="title">총 진행 횟수</label>
					<div class="dropdown-box" id="sessionCountSelectBox">
						<div class="dropdown-label" id="selectedSessionCount">선택 필수</div>
						<img class="dropdown-icon"
							src="${cpath}/resources/images/icon-down.svg" alt="화살표" />
						<ul class="type-dropdown hidden" id="sessionCountDropdown">
							<li data-value="1">1회</li>
							<li data-value="2">2회</li>
							<li data-value="3">3회</li>
							<li data-value="4">4회</li>
							<li data-value="5">5회</li>
						</ul>
						<input type="hidden" id="sessionCountValue" name="sessionCount"
							value="" />
					</div>
				</div>

			</section>

			<div class="last-select content-line">
				<div class="main-selection">
					<label for="title">카테고리</label>
					<div class="dropdown-box" id="categorySelectBox">
						<div class="dropdown-label" id="selectedCategory">선택 필수</div>
						<img class="dropdown-icon"
							src="${cpath}/resources/images/icon-down.svg" alt="화살표" />
						<ul class="type-dropdown hidden" id="categoryDropdown">
							<c:forEach var="cat" items="${categories}">
								<li data-value="${cat.categoryId}">${cat.categoryName}</li>
							</c:forEach>
						</ul>
						<input type="hidden" id="categoryValue" name="category" value="" />
					</div>
				</div>
				<div class="main-selection">
					<label for="title">언어</label>
					<div class="dropdown-box" id="languageSelectBox">
						<div class="dropdown-label" id="selectedLanguage">선택 필수</div>
						<img class="dropdown-icon"
							src="${cpath}/resources/images/icon-down.svg" alt="화살표" />
						<ul class="type-dropdown hidden" id="languageDropdown">
							<c:forEach var="lang" items="${languages}">
								<li data-value="${lang.languageId}">${lang.languageName}</li>
							</c:forEach>
							<li data-value="">언어 없음</li>
						</ul>
						<input type="hidden" id="languageValue" name="language" value="" />
					</div>
				</div>

				<div class="main-selection">
					<label for="title">가격</label>
					<div class="last-select-border">
						<input id="price" name="price" type="number" placeholder="무료"
							step="100" min="0">
					</div>
				</div>
			</div>
			<div class="frame-3504">
				<div class="title">도로명 주소</div>
				<div class="address-area">
					<div class="postal-code-area">
						<input type="text" id="postcode" class="postal-code"
							placeholder="우편번호" readonly />
						<button type="button" class="postal-code-btn"
							onclick="execDaumPostcode()">우편번호 찾기</button>
					</div>

					<input type="text" id="roadAddress" class="road-name-address"
						placeholder="도로명 주소" readonly /><input type="text"
						id="detailAddress" name="detailAddress" class="detail-address"
						placeholder="상세 주소를 입력하세요" />
				</div>
			</div>
			<div class="content-line">
				<h5>소개글</h5>
				<div id="smarteditor">
					<textarea name="editorTxt" style="width: 100%;" rows="20"
						cols="100" id="editorTxt" placeholder="300자 이내로 입력해주세요."></textarea>
				</div>
				<section class="together-type-section">
					<div class="together-type-section">
						<div class="label">함께 하고 싶은 유형</div>

						<div class="dropdown-row">
							<c:forEach var="i" begin="1" end="3">
								<div class="dropdown-box reverse">
									<div class="dropdown-label">선택 필수</div>
									<img class="dropdown-icon"
										src="${cpath}/resources/images/icon-down.svg" alt="화살표" />
									<ul class="type-dropdown hidden">
										<c:forEach var="type" items="${matchTypes}">
						        			<li data-value="${type.matchTypeId}">${type.matchTypeName}</li>
						    			</c:forEach>
									</ul>
									<input type="hidden" name="preferredTypes"
										class="preferred-type-value${i}" />
								</div>
							</c:forEach>
						</div>

					</div>
				</section>
			</div>
			<div class="mentos-make-buttons">
				<!-- 2. 버튼 각각 연결 -->
				<div class="mentos-make-buttons">
					<label for="cancelPopup" class="mentos-leader-cancel-btn">
						<div class="d-2-r-18-blue">취소하기</div>
					</label> <label for="submitPopup" class="mentos-leader-make-btn">
						<div class="d-2-r-18-white">만들기</div>
					</label>
				</div>
			</div>
			<script>
				let oEditors = []

				nhn.husky.EZCreator
						.createInIFrame({
							oAppRef : oEditors,
							elPlaceHolder : "editorTxt",
							sSkinURI : "<c:url value='/resources/smarteditor2/SmartEditor2Skin.html'/>",
							htParams : {

							},
							fCreator : "createSEditor2"
						});

				// SmartEditor 내용과 함께 폼 제출을 처리하는 새로운 함수
				function submitMentosForm() {
					// 이 줄은 SmartEditor에게 'editorTxt' textarea로 내용을 다시 쓰라고 지시합니다.
					oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);

					// 이제 프로그래밍 방식으로 폼을 제출할 수 있습니다.
					// 폼에 대한 참조를 가져와야 합니다. 폼에 ID가 없다면 ID를 부여하거나,
					// 페이지에 폼이 하나뿐이라면 태그 이름으로 선택할 수 있습니다.
					// 예를 들어, <form> 태그에 id="mentosCreateForm"을 추가했다면:
					document.querySelector('form').submit(); // 또는 document.getElementById('mentosCreateForm').submit();
				}
			</script>
		</form>
	</section>
	<script src="${cpath}/resources/js/mentos/mentosCreate.js"></script>
	<script src="${cpath}/resources/js/notification.js"></script>
<script src="${cpath}/resources/js/header.js"></script>
</body>

</html>