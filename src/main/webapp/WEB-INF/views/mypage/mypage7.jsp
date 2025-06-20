<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토스 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageMentosListStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageVars.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/sidebar.css" />
</head>
</head>
<body>
	<div class="layout-wrapper">
		<%@ include file="../common/header.jsp"%>
		<div class="main-content-wrapper">
			<%@ include file="../common/sidebar.jsp"%>
			<div class="page-container">
				<section id="my-mentors" class="my-mentors-section">
					<div class="page-wrapper">
						<h1 class="page-title">나의 멘토스 목록</h1>
						<div class="mentors-outer-container">
							<div class="mentors-grid">
								<article class="mentor-card mentor-card--waiting">
									<img
										src="${cpath}/resources/images/mypage/mypage7/image0.png"
										alt="국내는 기본, 해외까지 노리는 코딩 인터뷰 실전 패키지" class="card-image">
									<div class="card-content-wrapper">
										<h2 class="card-title">국내는 기본, 해외까지 노리는 코딩 인터뷰 실전 패키지</h2>
										<div class="card-info-group schedule-group">
											<p class="schedule-location-text">
												<span class="schedule-text">화 13:00-17:00</span> <span
													class="location-text">강남</span>
											</p>
										</div>
										<div class="card-info-group status-group">
											<p class="status-mentor-text">
												<span class="status-text status-text--waiting">대기중</span> <span
													class="mentor-details"> <img
													src="${cpath}/resources/images/mypage/mypage7/vuesax-linear-microphone0.svg"
													alt="mentor icon" class="mentor-icon"> <span
													class="mentor-name">최다희 멘토</span>
												</span>
											</p>
										</div>
									</div>
								</article>

								<article class="mentor-card mentor-card--default">
									<img
										src="${cpath}/resources/images/mypage/mypage7/image1.png"
										alt="비전공자의 전공자 따라잡기 자료구조 (with JS)" class="card-image">
									<div class="card-content-wrapper">
										<h2 class="card-title">비전공자의 전공자 따라잡기 자료구조 (with JS)</h2>
										<div class="card-info-group schedule-group">
											<p class="schedule-location-text">
												<span class="schedule-text">화 16:00-18:00</span> <span
													class="location-text">역삼</span>
											</p>
										</div>
										<div class="card-info-group status-group">
											<p class="status-mentor-text">
												<span class="status-text">3회 / 5회</span> <span
													class="mentor-details"> <img
													src="${cpath}/resources/images/mypage/mypage7/vuesax-linear-microphone0.svg"
													alt="mentor icon" class="mentor-icon"> <span
													class="mentor-name">홍길동 멘토</span>
												</span>
											</p>
										</div>
									</div>
								</article>

								<article class="mentor-card mentor-card--default">
									<img
										src="${cpath}/resources/images/mypage/mypage7/image2.png"
										alt="비전공자도 이해할 수 있는 AWS 입문/실전" class="card-image">
									<div class="card-content-wrapper">
										<h2 class="card-title">비전공자도 이해할 수 있는 AWS 입문/실전</h2>
										<div class="card-info-group schedule-group">
											<p class="schedule-location-text">
												<span class="schedule-text">수 18:00-30:00</span>
												<span class="location-text">홍대</span>
											</p>
										</div>
										<div class="card-info-group status-group">
											<p class="status-mentor-text">
												<span class="status-text">0회 / 5회</span> <span
													class="mentor-details"> <img
													src="${cpath}/resources/images/mypage/mypage7/vuesax-linear-microphone0.svg"
													alt="mentor icon" class="mentor-icon"> <span
													class="mentor-name">차민건 멘토</span>
												</span>
											</p>
										</div>
									</div>
								</article>

								<article class="mentor-card mentor-card--default">
									<img
										src="${cpath}/resources/images/mypage/mypage7/image3.png"
										alt="스프링 부트와 리액트로 구현하는 소셜 로그인" class="card-image">
									<div class="card-content-wrapper">
										<h2 class="card-title">스프링 부트와 리액트로 구현하는 소셜 로그인</h2>
										<div class="card-info-group schedule-group">
											<p class="schedule-location-text">
												<span class="schedule-text">금 19:00-21:00</span> <span
													class="location-text">화성</span>
											</p>
										</div>
										<div class="card-info-group status-group">
											<p class="status-mentor-text">
												<span class="status-text">4회 / 5회</span> <span
													class="mentor-details"> <img
													src="${cpath}/resources/images/mypage/mypage7/vuesax-linear-microphone0.svg"
													alt="mentor icon" class="mentor-icon"> <span
													class="mentor-name">김대현 멘토</span>
												</span>
											</p>
										</div>
									</div>
								</article>

								<article class="mentor-card mentor-card--completed">
									<img
										src="${cpath}/resources/images/mypage/mypage7/image4.png"
										alt="파이썬으로 봇 만들기 with ChatGPT" class="card-image">
									<div class="card-content-wrapper">
										<h2 class="card-title">파이썬으로 봇 만들기 with ChatGPT</h2>
										<div class="card-info-group schedule-group">
											<p class="schedule-location-text">
												<span class="schedule-text">화 16:00-18:00</span> <span
													class="location-text">역삼</span>
											</p>
										</div>
										<div class="card-info-group status-group">
											<p class="status-mentor-text">
												<span class="status-text status-text--completed">완료</span> <span
													class="mentor-details"> <img
													src="${cpath}/resources/images/mypage/mypage7/vuesax-linear-microphone0.svg"
													alt="mentor icon" class="mentor-icon"> <span
													class="mentor-name">안가연 멘토</span>
												</span>
											</p>
										</div>
									</div>
								</article>

								<article class="mentor-card mentor-card--default">
									<img
										src="${cpath}/resources/images/mypage/mypage7/image5.png"
										alt="신한 DS에서 배우는 스프링 부트 심화 버전" class="card-image">
									<div class="card-content-wrapper">
										<h2 class="card-title">신한 DS에서 배우는 스프링 부트 심화 버전</h2>
										<div class="card-info-group schedule-group">
											<p class="schedule-location-text">
												<span class="schedule-text">수 18:00-30:00</span>
												<span class="location-text">홍대</span>
											</p>
										</div>
										<div class="card-info-group status-group">
											<p class="status-mentor-text">
												<span class="status-text">3회 / 7회</span> <span
													class="mentor-details"> <img
													src="${cpath}/resources/images/mypage/mypage7/vuesax-linear-microphone0.svg"
													alt="mentor icon" class="mentor-icon"> <span
													class="mentor-name">정진 멘토</span>
												</span>
											</p>
										</div>
									</div>
								</article>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>