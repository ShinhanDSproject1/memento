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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KeepgoingInsert</title>
<link rel="stylesheet"
	href="<c:url value='/resources/css/keepgoing/keepgoing-insert.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/keepgoing/keepgoing-var.css' />">
<script src="<c:url value='/resources/js/keepgoing/keepgoing-insert.js'/>"></script>
<script src="<c:url value='/resources/js/keepgoing/HuskyEZCreator.js'/>"
	charset="utf-8"></script>
</head>
<body>
	<section class="container">
		<div class="page-title">킵고잉 만들기</div>
		<form action="${cpath}/keepgoing/keepgoinginsert.do" method="post">
			<section class="insert-main">
				<div class="main-logo">
					<label>킵고잉 로고</label>
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
				</div>

				<div class="main-name-info">
					<div class="content-line">
						<label>킵고잉 이름</label>
						<div class="textarea-border">
							<textarea id="keepgoingName" name="keepgoingName" rows="1"
								placeholder="영어, 한글, 숫자 사용가능(30자 이내)"></textarea>
						</div>
					</div>

					<div class="flexrow content-line flexgap-20">
						<div class="main-selection">
							<label for="location">도시</label>
							<div class="main-selection-border">
								<select id="location" name="location">
									<option value="서울">서울</option>
								</select>
							</div>

						</div>
						<div class="main-selection">
							<label for="region">지역</label>
							<div class="main-selection-border">
								<select id="region" name="region">
									<option value="마포구">마포구</option>
								</select>
							</div>
						</div>
					</div>
					<div class="content-line">
						<div class="icon-label">
							<i class="fa-solid fa-calendar-days"></i> <label
								for="selectedDaysInputs">활동요일</label>
						</div>

						<div>
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

					<div class="flexrow flexgap-20">
						<div>
							<div class="icon-label">
								<i class="fa-solid fa-clock"></i> <label>활동 시간</label>
							</div>
							<div class="flexrow time">
								<input id="activityStartTime" name="activityStartTime"
									type='time' value='09:00' required> ~ <input
									id="activityEndTime" name="activityEndTime" type="time"
									value='13:00' required>
							</div>
						</div>

						<div class="main-selection">
							<label for="studyType">선호 유형</label>
							<div class="main-selection-border">
								<select id="studyType" name="studyType">
									<option value="코드폭탄 해피빈">코드폭탄 해피빈</option>
									<option value="혼코딩 스로우곰">혼코딩 스로우곰</option>
									<option value="아이디어 요정 깃요미">아이디어 요정 깃요미</option>
									<option value="계획왕 컴정이">계획왕 컴정이</option>
									<option value="느긋한 타닥냥">느긋한 타닥냥</option>
									<option value="목표러 코취치">목표러 코취치</option>
								</select>
							</div>
						</div>
					</div>
				</div>

			</section>

			<section class="detail_location-introduce_text">
				<div class="content-line">
					<div class="active-img">
						<label>활동사진</label>
						<div class="input-file">
							<label class="upload-label" for="activityFile">파일찾기</label>
							<input type="file" id="activityFile" name="activityFile"
								class="upload-file"> <input readonly
								id="activityFileName" class="upload-name" value=""
								placeholder="첨부파일">
						</div>
					</div>
				</div>

				<div class="content-line">
					<label>도로명주소</label>
					<div class="textarea-border">
						<textarea id="detailLocation" name="detailLocation" rows="1"
							placeholder="서울시 마포구..."></textarea>
						<i class="fa-solid fa-magnifying-glass"></i>
					</div>
				</div>

				<div class="content-line">
					<h5>소개글</h5>
					<div id="smarteditor">
						<textarea name="editorTxt" style="width: 100%;" rows="20"
							cols="100" id="editorTxt" placeholder="300자 이내로 입력해주세요."></textarea>
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
            </script>

				<div class="last-select content-line">
					<div class="flexcol">
						<label for="category">카테고리</label>
						<div class="last-select-border">
							<select id="category" name="category">
								<option>백엔드</option>
							</select>
						</div>
					</div>

					<div class="flexcol">
						<label for="language">언어</label>
						<div class="last-select-border">
							<select id="language" name="language">
								<option>Java</option>
							</select>
						</div>
					</div>

					<div class="flexcol">
						<label for="price">가격</label>
						<div class="last-select-border">
							<input id="price" name="price" type="number" placeholder="무료">
						</div>
					</div>
				</div>
			</section>

			<section class="bottom-buttons">
				<button type="button" id="cancel-btn" class="cancel-btn">취소하기</button>
				<button type="submit" id="make-btn" class="make-btn">만들기</button>
			</section>
			<script>
			$("#cancel-btn").on("click",
					()=>{
						console.log("click")
						location.href = "<c:url value='/keepgoing/keepgoinglist.do' />";
					}
					)
		</script>
		</form>
	</section>

</body>

</html>