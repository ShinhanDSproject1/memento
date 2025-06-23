<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>킵고잉 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageKeepGoingStyle.css" />
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
				<section id="my-keepgoing-list" class="keepgoing-list-section">
					<h2 class="keepgoing-list-section__title">나의 킵고잉 목록</h2>
					<div class="keepgoing-list-section__items-wrapper">

						<article class="keepgoing-item">
							<div class="keepgoing-item__icon-container">
								<img class="keepgoing-item__icon"
									src="${cpath}/resources/images/mypage/mypage8/keepgoing-icon0.png"
									alt="Keepgoing Icon">
							</div>
							<div class="keepgoing-item__details">
								<div class="keepgoing-item__user-stats">
									<div class="keepgoing-item__user-stats-badge">
										<img
											src="${cpath}/resources/images/mypage/mypage8/vector0.svg"
											alt="User Icon" class="keepgoing-item__user-stats-icon">
										<span class="keepgoing-item__user-stats-count">33</span>
									</div>
								</div>
								<h3 class="keepgoing-item__title">눈누입니다</h3>
								<div class="keepgoing-item__meta">
									<p class="keepgoing-item__schedule">화, 목 (19:00 ~ 21:00)</p>
									<p class="keepgoing-item__location">마포구</p>
								</div>
							</div>
							<div class="keepgoing-item__actions">
								<button class="btn btn--chat">채팅하기</button>
								<button class="btn btn--leave">탈퇴</button>
							</div>
						</article>

						<article class="keepgoing-item">
							<div class="keepgoing-item__icon-container">
								<img class="keepgoing-item__icon"
									src="${cpath}/resources/images/mypage/mypage8/keepgoing-icon0.png"
									alt="Keepgoing Icon">
							</div>
							<div class="keepgoing-item__details">
								<div class="keepgoing-item__user-stats">
									<div class="keepgoing-item__user-stats-badge">
										<img
											src="${cpath}/resources/images/mypage/mypage8/vector0.svg"
											alt="User Icon" class="keepgoing-item__user-stats-icon">
										<span class="keepgoing-item__user-stats-count">33</span>
									</div>
								</div>
								<h3 class="keepgoing-item__title">눈누입니다</h3>
								<div class="keepgoing-item__meta">
									<p class="keepgoing-item__schedule">화, 목 (19:00 ~ 21:00)</p>
									<p class="keepgoing-item__location">마포구</p>
								</div>
							</div>
							<div class="keepgoing-item__actions">
								<button class="btn btn--chat">채팅하기</button>
								<button class="btn btn--leave">탈퇴</button>
							</div>
						</article>

						<article class="keepgoing-item">
							<div class="keepgoing-item__icon-container">
								<img class="keepgoing-item__icon"
									src="${cpath}/resources/images/mypage/mypage8/keepgoing-icon0.png"
									alt="Keepgoing Icon">
							</div>
							<div class="keepgoing-item__details">
								<div class="keepgoing-item__user-stats">
									<div class="keepgoing-item__user-stats-badge">
										<img
											src="${cpath}/resources/images/mypage/mypage8/vector0.svg"
											alt="User Icon" class="keepgoing-item__user-stats-icon">
										<span class="keepgoing-item__user-stats-count">33</span>
									</div>
								</div>
								<h3 class="keepgoing-item__title">눈누입니다</h3>
								<div class="keepgoing-item__meta">
									<p class="keepgoing-item__schedule">화, 목 (19:00 ~ 21:00)</p>
									<p class="keepgoing-item__location">마포구</p>
								</div>
							</div>
							<div class="keepgoing-item__actions">
								<button class="btn btn--chat">채팅하기</button>
								<button class="btn btn--leave">탈퇴</button>
							</div>
						</article>

						<article class="keepgoing-item">
							<div class="keepgoing-item__icon-container">
								<img class="keepgoing-item__icon"
									src="${cpath}/resources/images/mypage/mypage8/keepgoing-icon0.png"
									alt="Keepgoing Icon">
							</div>
							<div class="keepgoing-item__details">
								<div class="keepgoing-item__user-stats">
									<div class="keepgoing-item__user-stats-badge">
										<img
											src="${cpath}/resources/images/mypage/mypage8/vector0.svg"
											alt="User Icon" class="keepgoing-item__user-stats-icon">
										<span class="keepgoing-item__user-stats-count">33</span>
									</div>
								</div>
								<h3 class="keepgoing-item__title">눈누입니다</h3>
								<div class="keepgoing-item__meta">
									<p class="keepgoing-item__schedule">화, 목 (19:00 ~ 21:00)</p>
									<p class="keepgoing-item__location">마포구</p>
								</div>
							</div>
							<div class="keepgoing-item__actions">
								<button class="btn btn--chat">채팅하기</button>
								<button class="btn btn--leave">탈퇴</button>
							</div>
						</article>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>