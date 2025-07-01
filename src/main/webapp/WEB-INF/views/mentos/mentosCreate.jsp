<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
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

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MentosInsert</title>


<link rel="stylesheet"
	href="<c:url value='/resources/css/mentos/mentosCreate.css'/>">

<script src="<c:url value='/resources/js/mentos/mentosCreate.js'/>"></script>


<script src="<c:url value='/resources/js/keepgoing/HuskyEZCreator.js'/>"
	charset="utf-8"></script>
</head>
<body>
	<%@ include file="../common/logout_header.jsp"%>
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
									class="number-input" />
							</div>
						</div>
						<div class="main-selection">
							<div class="title">최대 수강 인원</div>
							<div class="main-selection-border">
								<input type="number" id="maxMember" name="maxMember" min="1"
									class="number-input" />
							</div>
						</div>
					</div>
					<div class="flexrow content-line flexgap-20">
						<div class="main-selection">
							<div class="title">시작일</div>
							<div class="main-selection-border">
								<input type="date" id="startDateInput" name="startDate"
									class="date-input" />
							</div>
						</div>
						<div class="main-selection">
							<div class="title">마감일</div>
							<div class="main-selection-border">
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
							<div class="title">마감 시간</div>
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

					<div class="main-selection">
						<label for="title">총 진행 횟수</label>
						<div class="last-select-border">
							<select id="Mainselection" name="Mainselection">
								<option>선택하세요</option>
								<option value="">선택하세요</option>
								<option value="1회">1회</option>
								<option value="2회">2회</option>
								<option value="3회">3회</option>
								<option value="4회">4회</option>
								<option value="5회">5회</option>
							</select>
						</div>
					</div>
			</section>
			<section class="together-type-section">
				<div class="last-select content-line">
					<div class="main-selection">
						<label for="title">카테고리</label>
						<div class="last-select-border">
							<select id="Mainselection" name="Mainselection">
								<option>선택하세요</option>
								<option value="Interview">면접 준비</option>
								<option value="OS">운영체제</option>
								<option value="DB">데이터베이스</option>
								<option value="Network">네트워크</option>
								<option value="C">자료구조</option>
								<option value="HTML/CSS">알고리즘</option>
								<option value="JavaScript">자격증</option>


							</select>
						</div>
					</div>

					<div class="main-selection">
						<label for="title">언어</label>
						<div class="last-select-border">
							<select id="Mainselection" name="Mainselection">
								<option>선택하세요</option>
								<option value="Python">파이썬(Python)</option>
								<option value="Java">자바(Java)</option>
								<option value="C++">C++</option>
								<option value="C#">C#</option>
								<option value="C">C</option>
								<option value="HTML/CSS">HTML / CSS</option>
								<option value="JavaScript">JavaScript</option>
								<option value="None">사용하는 언어 없음</option>


							</select>
						</div>
					</div>

					<div class="main-selection">
						<label for="title">가격</label>
						<div class="last-select-border">
							<input id="price" name="price" type="number" placeholder="무료"
								step="100">
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
					<div class="together-type-section">
						<div class="label">함께 하고 싶은 유형</div>

						<div class="dropdown-row">
							<div class="dropdown-box">
								<div class="dropdown-label">선택 필수</div>
								<img class="dropdown-icon"
									src="${cpath}/resources/images/icon-down.svg" alt="화살표" />
								<ul class="type-dropdown hidden">
									<li data-value="active">활발한 개발자</li>
									<li data-value="quite">조용한 몰입형 개발자</li>
									<li data-value="creative">창의적 실험가 개발자</li>
									<li data-value="constructor">구조화 좋아하는 개발자</li>
									<li data-value="cozy">느긋한 꾸준형 개발자</li>
									<li data-value="goal">목표지향 개발자</li>
								</ul>
							</div>
							<div class="dropdown-box">
								<div class="dropdown-label">선택 필수</div>
								<img class="dropdown-icon"
									src="${cpath}/resources/images/icon-down.svg" alt="화살표" />
								<ul class="type-dropdown hidden">
									<li data-value="active">활발한 개발자</li>
									<li data-value="quite">조용한 몰입형 개발자</li>
									<li data-value="creative">창의적 실험가 개발자</li>
									<li data-value="constructor">구조화 좋아하는 개발자</li>
									<li data-value="cozy">느긋한 꾸준형 개발자</li>
									<li data-value="goal">목표지향 개발자</li>
								</ul>
							</div>
							<div class="dropdown-box">
								<div class="dropdown-label">선택 필수</div>
								<img class="dropdown-icon"
									src="${cpath}/resources/images/icon-down.svg" alt="화살표" />
								<ul class="type-dropdown hidden">
									<li data-value="active">활발한 개발자</li>
									<li data-value="quite">조용한 몰입형 개발자</li>
									<li data-value="creative">창의적 실험가 개발자</li>
									<li data-value="constructor">구조화 좋아하는 개발자</li>
									<li data-value="cozy">느긋한 꾸준형 개발자</li>
									<li data-value="goal">목표지향 개발자</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="mentos-make-buttons">
					<!-- 1. 팝업 트리거 체크박스 각각 분리 -->
					<input type="checkbox" id="cancelPopup" style="display: none;" />
					<input type="checkbox" id="submitPopup" style="display: none;" />

					<!-- 2. 버튼 각각 연결 -->
					<div class="mentos-make-buttons">
						<label for="cancelPopup" class="mentos-leader-cancel-btn">
							<div class="d-2-r-18-blue">취소하기</div>
						</label> <label for="submitPopup" class="mentos-leader-make-btn">
							<div class="d-2-r-18-white">만들기</div>
						</label>
					</div>

					<!-- 3. 취소 팝업 -->
					<div class="popup-layer" id="cancelLayer">
						<div class="rectangle-294">
							<div class="frame-3783">
								<div class="emoji">❌</div>
								<div class="popup-title">작성이 취소되었습니다</div>
								<div class="popup-desc">작성한 내용은 저장되지 않아요</div>
								<div class="confirm-btn-box">
									<label for="cancelPopup" class="confirm-btn">확인</label>
								</div>
							</div>
						</div>
					</div>

					<!-- 4. 만들기 팝업 -->
					<div class="popup-layer" id="submitLayer">
						<div class="rectangle-294">
							<div class="frame-3783">
								<div class="emoji">👍</div>
								<div class="popup-title">멘토스가 성공적으로 개설되었습니다</div>
								<div class="confirm-btn-box">
									<label for="submitPopup" class="confirm-btn">확인</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script>
            	let oEditors=[]
            	
            	nhn.husky.EZCreator.createInIFrame({
            		 oAppRef: oEditors,
            		 elPlaceHolder: "editorTxt",
            		 sSkinURI: "<c:url value='/resources/smarteditor2/SmartEditor2Skin.html'/>",
            		 htParams: {
            			    
            	          },
            		 fCreator: "createSEditor2"
            	});        	
           
			$("#cancel-btn").on("click",
					()=>{
						console.log("click")
						location.href = "<c:url value='/keepgoing/keepgoinglist.do' />";
					}
					)
					
					
					//다음 주소 API 실행 함수
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById('roadAddress').value = data.roadAddress;
							document.getElementById('jibunAddress').value = data.jibunAddress;
							document.getElementById('detailAddress').focus();
						}
					}).open();
		}
		document.querySelectorAll('.dropdown-box').forEach(box => {
			  const dropdown = box.querySelector('.type-dropdown');
			  const label = box.querySelector('.dropdown-label');

			  box.addEventListener('click', (e) => {
			    e.stopPropagation();

			    // 드롭다운 토글
			    document.querySelectorAll('.type-dropdown').forEach(menu => {
			      if (menu !== dropdown) menu.classList.add('hidden');
			    });
			    dropdown.classList.toggle('hidden');
			  });

			  dropdown.querySelectorAll('li').forEach(item => {
			    item.addEventListener('click', (e) => {
			      e.stopPropagation();
			      label.textContent = item.textContent;
			      dropdown.classList.add('hidden');
			    });
			  });
			});

			// 바깥 클릭 시 모든 드롭다운 닫기
			document.addEventListener('click', () => {
			  document.querySelectorAll('.type-dropdown').forEach(menu => {
			    menu.classList.add('hidden');
			  });
			});

					
		</script>
		</form>
	</section>

</body>

</html>