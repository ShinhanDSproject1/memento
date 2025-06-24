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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Keepgoing</title>
<link rel="stylesheet"
	href="${cpath}/resources/css/keepgoing/keepgoing-list.css">

<link rel="stylesheet"
	href="<c:url value='/resources/css/keepgoing/keepgoing-var.css' />">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/choices.js/public/assets/styles/choices.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/choices.js/public/assets/scripts/choices.min.js"></script>
<link rel="stylesheet" href="${cpath}/resources/css/keepgoing/keepgoing-detail.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${cpath}/resources/js/keepgoing/keepgoing-list.js"></script>
<script>
    // JavaScript 변수로 컨텍스트 패스 정의
    const contextPath = "<c:url value='/' />"; // JSP에 의해 올바르게 해석되도록 보장
</script>

</head>

<body class="container">

	<section class="filter">
		<div class="filter-item">
			<button type="button" id="location-btn" data-bs-toggle="modal"
				data-bs-target="#myModal"  data-content-type="location">지역</button>
		</div>
		<div class="filter-item">
			<select id="orderby" name="orderby" class="form-select order">
				<option value="lastest">최신순</option>
				<option value="popular">인기순</option>
			</select>
		</div>

		<div class="filter-item">
			<select id="studyType" name="studyType" class="form-select" multiple>
				<option value="java">Java</option>
				<option value="python">Python</option>
				<option value="js">JavaScript</option>
			</select>
		</div>

		<div class="filter-item">
			<select id="dayofweek" name="dayofweek" class="form-select" multiple>
				<option value="java">Java</option>
				<option value="python">Python</option>
				<option value="js">JavaScript</option>
			</select>
		</div>
		<div class="filter-item">
			<select id="time" name="time" class="form-select" multiple>
				<option value="java">Java</option>
				<option value="python">Python</option>
				<option value="js">JavaScript</option>
			</select>
		</div>
		<div class="filter-item">
			<select id="category" name="category" class="form-select" multiple>
				<option value="java">Java</option>
				<option value="python">Python</option>
				<option value="js">JavaScript</option>
			</select>
		</div>
		<div class="filter-item">
			<select id="languageSelect" name="languageSelect" class="form-select"
				multiple>
				<option value="java">Java</option>
				<option value="python">Python</option>
				<option value="js">JavaScript</option>
			</select>
		</div>
		<div class="filter-item">
			<button type="button" id="reset-btn">reset</button>
		</div>
	</section>
	<section class="selected-result-area">
		<strong>선택된 값:</strong>

		<div id="selectedValues" class="selected-values"></div>
	</section>

	<section class="main">
		<div class="list-line">
			<a data-bs-toggle="modal" data-bs-target="#myModal" data-content-type="register">
				<div class="card-item">
					
					<div class="logo-info">
						<div class="logos">
							<img class="keepgoing-logo" src="${cpath}/resources/images/nunnu_icon.webp">
						</div>

						<div class="keepgoing-info">
							<div class="name-membercount">
								<span class="name">눈누입니다</span>
								<div class="membercount">
									<i class="fa-regular fa-user"></i> <span class="countvalue">33</span>
								</div>
							</div>

							<div class="location-detail">
								<span class="location">서울시 마포구</span>
								<!--${locatino} ${region} -->
								<i class="fa-solid fa-circle graydot"></i> <span class="detail">꼬모레</span>
							</div>

							<div class="studyinfo">
								<span class="studytype">코드폭탄 해피빈</span> <i
									class="fa-solid fa-circle graydot"></i> <span
									class="category-language">알고리즘(JAVA)</span>
								<!--${category}(${language}) -->
							</div>

							<div class="day-time">
								<i class="fa-solid fa-calendar"></i>
								<div class="daylist">화,목</div>
								<i class="fa-solid fa-circle bluedot"></i>
								<div class="start-endtime">오후7시 ~ 오후9시</div>
							</div>
						</div>
					</div>
				</div>
			</a>
			
			<a data-bs-toggle="modal" data-bs-target="#myModal" data-content-type="member">
				<div class="card-item">
					<div class="logo-info">
						
						<div class="logos">
							<img class="keepgoing-logo" src="${cpath}/resources/images/aa.png">
						</div>
	
						<div class="keepgoing-info">
							<div class="name-membercount">
								<span class="name">눈누입니다</span>
								<div class="membercount">
									<i class="fa-regular fa-user"></i> <span class="countvalue">33</span>
								</div>
							</div>
	
							<div class="location-detail">
								<span class="location">서울시 마포구</span>
								<!--${locatino} ${region} -->
								<i class="fa-solid fa-circle graydot"></i> <span class="detail">꼬모레</span>
							</div>
	
							<div class="studyinfo">
								<span class="studytype">코드폭탄 해피빈</span> <i
									class="fa-solid fa-circle graydot"></i> <span
									class="category-language">알고리즘(JAVA)</span>
								<!--${category}(${language}) -->
							</div>
	
							<div class="day-time">
								<i class="fa-solid fa-calendar"></i>
								<div class="daylist">화,목</div>
								<i class="fa-solid fa-circle bluedot"></i>
								<div class="start-endtime">오후7시 ~ 오후9시</div>
							</div>
	
						</div>
					</div>
				</div>
			</a>

			<a data-bs-toggle="modal" data-bs-target="#myModal" data-content-type="register">
				<div class="card-item">
					<div class="logo-info">
	
						<div class="keepgoing-info">
							<div class="name-membercount">
								<span class="name">눈누입니다</span>
								<div class="membercount">
									<i class="fa-regular fa-user"></i> <span class="countvalue">33</span>
								</div>
							</div>
	
							<div class="location-detail">
								<span class="location">서울시 마포구</span>
								<!--${locatino} ${region} -->
								<i class="fa-solid fa-circle graydot"></i> <span class="detail">꼬모레</span>
							</div>
	
							<div class="studyinfo">
								<span class="studytype">코드폭탄 해피빈</span> <i
									class="fa-solid fa-circle graydot"></i> <span
									class="category-language">알고리즘(JAVA)</span>
								<!--${category}(${language}) -->
							</div>
	
							<div class="day-time">
								<i class="fa-solid fa-calendar"></i>
								<div class="daylist">화,목</div>
								<i class="fa-solid fa-circle bluedot"></i>
								<div class="start-endtime">오후7시 ~ 오후9시</div>
							</div>
							
						</div>
						
						<div class="logos">
							<img class="keepgoing-logo" src="${cpath}/resources/images/aa.png">
						</div>
					</div>
				</div>
			</a>
			
		</div>
				<div class="list-line">
			<a data-bs-toggle="modal" data-bs-target="#myModal" data-content-type="register">
				<div class="card-item">
					
					<div class="logo-info">
						<div class="logos">
							<img class="keepgoing-logo" src="${cpath}/resources/images/nunnu_icon.webp">
						</div>

						<div class="keepgoing-info">
							<div class="name-membercount">
								<span class="name">눈누입니다</span>
								<div class="membercount">
									<i class="fa-regular fa-user"></i> <span class="countvalue">33</span>
								</div>
							</div>

							<div class="location-detail">
								<span class="location">서울시 마포구</span>
								<!--${locatino} ${region} -->
								<i class="fa-solid fa-circle graydot"></i> <span class="detail">꼬모레</span>
							</div>

							<div class="studyinfo">
								<span class="studytype">코드폭탄 해피빈</span> <i
									class="fa-solid fa-circle graydot"></i> <span
									class="category-language">알고리즘(JAVA)</span>
								<!--${category}(${language}) -->
							</div>

							<div class="day-time">
								<i class="fa-solid fa-calendar"></i>
								<div class="daylist">화,목</div>
								<i class="fa-solid fa-circle bluedot"></i>
								<div class="start-endtime">오후7시 ~ 오후9시</div>
							</div>
						</div>
					</div>
				</div>
			</a>
			
			<a data-bs-toggle="modal" data-bs-target="#myModal" data-content-type="member">
				<div class="card-item">
					<div class="logo-info">
						
						<div class="logos">
							<img class="keepgoing-logo" src="${cpath}/resources/images/aa.png">
						</div>
	
						<div class="keepgoing-info">
							<div class="name-membercount">
								<span class="name">눈누입니다</span>
								<div class="membercount">
									<i class="fa-regular fa-user"></i> <span class="countvalue">33</span>
								</div>
							</div>
	
							<div class="location-detail">
								<span class="location">서울시 마포구</span>
								<!--${locatino} ${region} -->
								<i class="fa-solid fa-circle graydot"></i> <span class="detail">꼬모레</span>
							</div>
	
							<div class="studyinfo">
								<span class="studytype">코드폭탄 해피빈</span> <i
									class="fa-solid fa-circle graydot"></i> <span
									class="category-language">알고리즘(JAVA)</span>
								<!--${category}(${language}) -->
							</div>
	
							<div class="day-time">
								<i class="fa-solid fa-calendar"></i>
								<div class="daylist">화,목</div>
								<i class="fa-solid fa-circle bluedot"></i>
								<div class="start-endtime">오후7시 ~ 오후9시</div>
							</div>
	
						</div>
					</div>
				</div>
			</a>

			<a data-bs-toggle="modal" data-bs-target="#myModal" data-content-type="register">
				<div class="card-item">
					<div class="logo-info">
	
						<div class="keepgoing-info">
							<div class="name-membercount">
								<span class="name">눈누입니다</span>
								<div class="membercount">
									<i class="fa-regular fa-user"></i> <span class="countvalue">33</span>
								</div>
							</div>
	
							<div class="location-detail">
								<span class="location">서울시 마포구</span>
								<!--${locatino} ${region} -->
								<i class="fa-solid fa-circle graydot"></i> <span class="detail">꼬모레</span>
							</div>
	
							<div class="studyinfo">
								<span class="studytype">코드폭탄 해피빈</span> <i
									class="fa-solid fa-circle graydot"></i> <span
									class="category-language">알고리즘(JAVA)</span>
								<!--${category}(${language}) -->
							</div>
	
							<div class="day-time">
								<i class="fa-solid fa-calendar"></i>
								<div class="daylist">화,목</div>
								<i class="fa-solid fa-circle bluedot"></i>
								<div class="start-endtime">오후7시 ~ 오후9시</div>
							</div>
							
						</div>
						
						<div class="logos">
							<img class="keepgoing-logo" src="${cpath}/resources/images/aa.png">
						</div>
					</div>
				</div>
			</a>
			
		</div>
				<div class="list-line">
			<a data-bs-toggle="modal" data-bs-target="#myModal" data-content-type="register">
				<div class="card-item">
					
					<div class="logo-info">
						<div class="logos">
							<img class="keepgoing-logo" src="${cpath}/resources/images/nunnu_icon.webp">
						</div>

						<div class="keepgoing-info">
							<div class="name-membercount">
								<span class="name">눈누입니다</span>
								<div class="membercount">
									<i class="fa-regular fa-user"></i> <span class="countvalue">33</span>
								</div>
							</div>

							<div class="location-detail">
								<span class="location">서울시 마포구</span>
								<!--${locatino} ${region} -->
								<i class="fa-solid fa-circle graydot"></i> <span class="detail">꼬모레</span>
							</div>

							<div class="studyinfo">
								<span class="studytype">코드폭탄 해피빈</span> <i
									class="fa-solid fa-circle graydot"></i> <span
									class="category-language">알고리즘(JAVA)</span>
								<!--${category}(${language}) -->
							</div>

							<div class="day-time">
								<i class="fa-solid fa-calendar"></i>
								<div class="daylist">화,목</div>
								<i class="fa-solid fa-circle bluedot"></i>
								<div class="start-endtime">오후7시 ~ 오후9시</div>
							</div>
						</div>
					</div>
				</div>
			</a>
			
			<a data-bs-toggle="modal" data-bs-target="#myModal" data-content-type="member">
				<div class="card-item">
					<div class="logo-info">
						
						<div class="logos">
							<img class="keepgoing-logo" src="${cpath}/resources/images/aa.png">
						</div>
	
						<div class="keepgoing-info">
							<div class="name-membercount">
								<span class="name">눈누입니다</span>
								<div class="membercount">
									<i class="fa-regular fa-user"></i> <span class="countvalue">33</span>
								</div>
							</div>
	
							<div class="location-detail">
								<span class="location">서울시 마포구</span>
								<!--${locatino} ${region} -->
								<i class="fa-solid fa-circle graydot"></i> <span class="detail">꼬모레</span>
							</div>
	
							<div class="studyinfo">
								<span class="studytype">코드폭탄 해피빈</span> <i
									class="fa-solid fa-circle graydot"></i> <span
									class="category-language">알고리즘(JAVA)</span>
								<!--${category}(${language}) -->
							</div>
	
							<div class="day-time">
								<i class="fa-solid fa-calendar"></i>
								<div class="daylist">화,목</div>
								<i class="fa-solid fa-circle bluedot"></i>
								<div class="start-endtime">오후7시 ~ 오후9시</div>
							</div>
	
						</div>
					</div>
				</div>
			</a>

			<a data-bs-toggle="modal" data-bs-target="#myModal" data-content-type="register">
				<div class="card-item">
					<div class="logo-info">
	
						<div class="keepgoing-info">
							<div class="name-membercount">
								<span class="name">눈누입니다</span>
								<div class="membercount">
									<i class="fa-regular fa-user"></i> <span class="countvalue">33</span>
								</div>
							</div>
	
							<div class="location-detail">
								<span class="location">서울시 마포구</span>
								<!--${locatino} ${region} -->
								<i class="fa-solid fa-circle graydot"></i> <span class="detail">꼬모레</span>
							</div>
	
							<div class="studyinfo">
								<span class="studytype">코드폭탄 해피빈</span> <i
									class="fa-solid fa-circle graydot"></i> <span
									class="category-language">알고리즘(JAVA)</span>
								<!--${category}(${language}) -->
							</div>
	
							<div class="day-time">
								<i class="fa-solid fa-calendar"></i>
								<div class="daylist">화,목</div>
								<i class="fa-solid fa-circle bluedot"></i>
								<div class="start-endtime">오후7시 ~ 오후9시</div>
							</div>
							
						</div>
						
						<div class="logos">
							<img class="keepgoing-logo" src="${cpath}/resources/images/aa.png">
						</div>
					</div>
				</div>
			</a>
			
		</div>


	</section>
	<section class="paging">페이지이동</section>

	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-xl modal-dialog-centered" style="width: fit-content;">
			<div class="modal-content" style="width:fit-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">지역</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" style="width:fit-content">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>

</body>

</html>