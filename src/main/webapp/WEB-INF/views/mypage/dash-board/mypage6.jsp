<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 매치업 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageMatchupListStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageVars.css" />
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/sidebar.css" />
</head>
<body>
	<div class="layout-wrapper">
		<%@ include file="../../header/header.jsp"%>
		<div class="main-content-wrapper">
			<%@ include file="../../sidebar/sidebar.jsp"%>
			<div class="page-container">
				<section id="matchup-list-section"
					class="matchup-list-section style_1">
					<div class="matchup-list-container">
						<h2 class="page-title style_2">나의 매치업 목록</h2>
						<div class="cards-list">
							<article class="matchup-card style_4">
								<div class="card-content-wrapper">
									<img
										src="${cpath}/resources/images/mypage/mypage6/vector0.svg"
										alt="Avatar" class="avatar style_10">
									<div class="details-column">
										<div class="top-section">
											<div class="tags-container style_11">
												<span class="tag style_13"><span
													class="tag-text style_14">#알고리즘 #C</span></span>
											</div>
											<span class="session-count style_9">3/5회</span>
										</div>
										<h3 class="study-title style_6">C언어로 운영체제 뜯어보는 스터디</h3>
										<div class="bottom-section">
											<div class="schedule-location-container style_15">
												<span class="schedule style_16">화 17:00 - 19:00</span> <span
													class="location style_17">마포구</span>
											</div>
											<div class="mentor-info">
												<img
													src="${cpath}/resources/images/mypage/mypage6/microphone-20.svg"
													alt="Role Icon" class="mic-icon style_18"> <span
													class="mentor-name style_7">조상호 멘토</span>
											</div>
											<span class="user-role style_8">방장</span>
										</div>
									</div>
								</div>
							</article>

							<article class="matchup-card style_4">
								<div class="card-content-wrapper">
									<img
										src="${cpath}/resources/images/mypage/mypage6/vector0.svg""
										alt="Avatar" class="avatar style_20">
									<div class="details-column">
										<div class="top-section">
											<div class="tags-container style_11">
												<span class="tag style_13"><span
													class="tag-text style_14">#알고리즘 #Java</span></span>
											</div>
											<span class="session-count style_9">1/7회</span>
										</div>
										<h3 class="study-title style_6">C언어로 운영체제 뜯어보는 스터디</h3>
										<div class="bottom-section">
											<div class="schedule-location-container style_15">
												<span class="schedule style_16">화 17:00 - 19:00</span> <span
													class="location style_17">마포구</span>
											</div>
											<div class="mentor-info"></div>
											<span class="user-role style_19">팀원</span>
										</div>
									</div>
								</div>
							</article>

							<article class="matchup-card style_4">
								<div class="card-content-wrapper">
									<img
										src="${cpath}/resources/images/mypage/mypage6/vector0.svg"
										alt="Avatar" class="avatar style_23">
									<div class="details-column">
										<div class="top-section">
											<div class="tags-container style_11">
												<span class="tag style_13"><span
													class="tag-text style_14">#알고리즘 #C</span></span>
											</div>
											<span class="session-count style_22">대기중</span>
										</div>
										<h3 class="study-title style_6">C언어로 운영체제 뜯어보는 스터디</h3>
										<div class="bottom-section">
											<div class="schedule-location-container style_15">
												<span class="schedule style_16">화 17:00 - 19:00</span> <span
													class="location style_17">마포구</span>
											</div>
											<div class="mentor-info">
												<img
													src="${cpath}/resources/images/mypage/mypage6/microphone-20.svg"
													alt="Role Icon" class="mic-icon style_24"> <span
													class="mentor-name style_21">미확정</span>
											</div>
											<span class="user-role style_8">방장</span>
										</div>
									</div>
								</div>
							</article>

							<article class="matchup-card style_4">
								<div class="card-content-wrapper">
									<img
										src="${cpath}/resources/images/mypage/mypage6/vector0.svg"
										alt="Avatar" class="avatar style_26">
									<div class="details-column">
										<div class="top-section">
											<div class="tags-container style_11">
												<span class="tag style_13"><span
													class="tag-text style_14">#알고리즘 #C</span></span>
											</div>
											<span class="session-count style_25">수료</span>
										</div>
										<h3 class="study-title style_6">C언어로 운영체제 뜯어보는 스터디</h3>
										<div class="bottom-section">
											<div class="schedule-location-container style_15">
												<span class="schedule style_16">화 17:00 - 19:00</span> <span
													class="location style_17">마포구</span>
											</div>
											<div class="mentor-info">
												<img
													src="${cpath}/resources/images/mypage/mypage6/microphone-20.svg"
													alt="Role Icon" class="mic-icon style_27"> <span
													class="mentor-name style_7">정진 멘토</span>
											</div>
											<span class="user-role style_8">방장</span>
										</div>
									</div>
								</div>
							</article>
						</div>
						<div class="action-buttons-container style_28">
							<button class="action-button style_28">
								<img
									src="${cpath}/resources/images/mypage/mypage6/rectangle-3050.svg"
									alt="킵고잉 찬성 배경" class="button-background style_29"> <span
									class="button-text style_30">킵고잉 찬성</span>
							</button>
							<button class="action-button style_28">
								<img
									src="${cpath}/resources/images/mypage/mypage6/rectangle-3051.svg"
									alt="리뷰 쓰기 배경" class="button-background style_31"> <span
									class="button-text style_30">리뷰 쓰기</span>
							</button>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>