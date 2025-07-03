<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>me:mento 메인 페이지</title>

<!-- External CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainpage/main.css">

<script
	src="${pageContext.request.contextPath}/resources/js/maincount.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainpage/login.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainpage/notificationModal.css">
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- D2Coding -->
<link
	href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2107@1.1/D2Coding.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="layout-wrapper" id="layoutWrapper">
		<div class="left"></div>
		<%@ include file="../common/logout_header.jsp"%>
		<div class="page-container">
			<%@ include file="notificationModal.jsp"%>
			<div id="loginModal"
				style="display: none; position: fixed; top: 20%; left: 39%; transform: translateX(-50%); z-index: 1000;">

				<%@ include file="login.jsp"%>
			</div>
			<div id="modalBackdrop"
				style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 999;"
				onclick="closeModal()"></div>
			<script src="${pageContext.request.contextPath}/js/notification.js"></script>

			<!-- 슬라이드 배너 영역 -->
			<div class="slider-wrapper">
				<button class="slider-btn left" onclick="slidePrev()"
					aria-label="이전 슬라이드">‹</button>

				<div id="slider-container">
					<div class="home-page-1" id="slider">
						<!-- 슬라이드 1 - SPARK TEST -->
						<div class="page-1-com-1">
							<div class="group-391">
								<div class="spark-image-container">
									<img class="spark-icon"
										src="${pageContext.request.contextPath}/resources/images/main1/image-92.png" />
								</div>
							</div>
							<div class="mbti-title">
								<span class="emoji">💻</span>개발자도 MBTI가 필요하다면?
							</div>
							<div class="mbti-subtitle">
								나만의 학습 성향을 진단하고<br />더 빠르게 성장해보세요!
							</div>
							<a href="${cpath}/mypage/spark-test" class="cta-button">🚀 지금
								테스트하러 가기</a>
						</div>
						<c:forEach var="banner" items="${bannerList}">
							<div class="page-1-com-12">
								<div class="spring-content" onclick="location.href='${cpath}/mentos/detail?mentosid='+ ${banner.mentosId}">
									<div class="spring-text">
										<div class="spring-title">${banner.title}</div>
										<div class="spring-info">
											<div class="info-row">
												<div class="info-label">강사</div>
												<div class="info-value">${banner.nickname}</div>
											</div>
											<div class="info-row">
												<div class="info-label">일시</div>
												<div class="info-value">
													<fmt:formatDate value="${banner.startTime}"
														pattern="M/d(E) a hh:mm" />
												</div>
											</div>
										</div>
									</div>
									<c:if test="${banner.image != null}">
										<img
											src="${cpath}/resources/images/mentosDetail/${banner.image}"
											class="spring-image" alt="멘토 이미지">
									</c:if>
									<c:if test="${banner.image == null}">
										<div class="spring-image">👩‍💻</div>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<button class="slider-btn right" onclick="slideNext()"
					aria-label="다음 슬라이드">›</button>
			</div>

			<!-- 통계 섹션 -->
			<section class="home-page-2">
				<div class="container">
					<div class="stats-title">
						Meet Our Students<br> 숫자가 증명하는 <span class="stats-highlight">
							<span class="me-color">me</span>:<span class="mento-color">mento</span>
						</span>
					</div>
					<div class="stats-container">
						<div class="stat-item">
							<div class="stat-icon">📚</div>
							<div class="stat-label">멘토링 수강 수</div>
							<div class="stat-value"
								data-count="${counts.totalMentoringCount}">0</div>
						</div>
						<div class="stat-item">
							<div class="stat-icon">🤝</div>
							<div class="stat-label">매칭 현황</div>
							<div class="stat-value" data-count="${counts.totalActiveCount}">0</div>
						</div>
						<div class="stat-item">
							<div class="stat-icon">🔥</div>
							<div class="stat-label">누적 매치업</div>
							<div class="stat-value" data-count="${counts.totalMatchupCount}">0</div>
						</div>
						<div class="stat-item">
							<div class="stat-icon">🏢</div>
							<div class="stat-label">제휴업체</div>
							<div class="stat-value" data-count="${counts.partnerCount}">0</div>
						</div>
						<div class="stat-item">
							<div class="stat-icon">👥</div>
							<div class="stat-label">누적 방문수</div>
							<div class="stat-value" data-count="${counts.visitorCount}">0</div>
						</div>
					</div>
				</div>
			</section>

			<!-- 서비스 소개 페이지 -->
			<div class="home-page-3">
				<div class="home-page-3-inner">
					<div class="main-div">서비스 소개</div>

					<div class="service-me-mento">
						<span> <span class="service-me-mento-span2">me:</span> <span
							class="service-me-mento-span3">mento</span> <span
							class="service-me-mento-span"> 와 함께 <br /> 내게 꼭 맞는 교육을
								선택하세요!
						</span>
						</span>
					</div>
					<div class="device-macbook-pro">
						<div class="shadow"></div>
						<!-- 상단 뚜껑 (lid) 포함하는 top -->
						<div class="top">
							<div class="lid"></div>
							<div class="dark-screen">
								<div class="screen-wrap">
									<div class="screen">

										<img class="image-55"
											src="${cpath}/resources/images/main1/serviceinner.png" />
									</div>
								</div>
							</div>
						</div>

						<!-- 하단 받침대 이미지 -->
						<img class="bottom"
							src="${cpath}/resources/images/main1/bottom.svg" />
					</div>
				</div>
			</div>
			<!-- RANKING 페이지 -->
			<div class="ranking-container">

				<!-- 🏆 인기 멘토 랭킹 -->
				<div class="ranking-section mentor-ranking">
					<div class="section-title">🏆 인기 멘토 랭킹</div>
					<div class="podium">
						<!-- 2등 -->
						<div class="podium-place second">
							<div class="winner-info">
								<div class="winner-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_2-10.png"
										alt="김신한">
								</div>
								<div class="winner-name">김신한</div>
								<div class="winner-rating">⭐ 4.9</div>
							</div>
							<div class="medal">🥈</div>
							<div class="podium-base second">2</div>
						</div>
						<!-- 1등 -->
						<div class="podium-place first">
							<div class="winner-info">
								<div class="winner-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_1-10.png"
										alt="위치콤보">
								</div>
								<div class="winner-name">위치콤보</div>
								<div class="winner-rating">⭐ 5.0</div>
							</div>
							<div class="medal">🥇</div>
							<div class="podium-base first">1</div>
						</div>
						<!-- 3등 -->
						<div class="podium-place third">
							<div class="winner-info">
								<div class="winner-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_3-10.png"
										alt="길동햄">
								</div>
								<div class="winner-name">길동햄</div>
								<div class="winner-rating">⭐ 4.8</div>
							</div>
							<div class="medal">🥉</div>
							<div class="podium-base third">3</div>
						</div>
					</div>

					<!-- 랭킹 테이블 -->
					<div class="ranking-table">
						<div class="ranking-header">
							<div>순위</div>
							<div>멘토</div>
							<div>평점</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">4</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_4-40.png"
										alt="벗나무">
								</div>
								<div class="participant-name">벗나무</div>
							</div>
							<div class="rating">⭐ 4.7</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">5</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_4-30.png"
										alt="에듀윌">
								</div>
								<div class="participant-name">에듀윌</div>
							</div>
							<div class="rating">⭐ 4.7</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">6</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_4-20.png"
										alt="세븐하이">
								</div>
								<div class="participant-name">세븐하이</div>
							</div>
							<div class="rating">⭐ 4.7</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">7</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_4-10.png"
										alt="혐규">
								</div>
								<div class="participant-name">혐규</div>
							</div>
							<div class="rating">⭐ 5.0</div>
						</div>
					</div>
				</div>

				<!-- 🧠 열정 멘티 랭킹 -->
				<div class="ranking-section mentee-ranking">
					<div class="section-title">🏆 열정 멘티 랭킹</div>
					<div class="podium">
						<div class="podium-place second">
							<div class="winner-info">
								<div class="winner-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_210.png"
										alt="김핑구">
								</div>
								<div class="winner-name">김핑구</div>
								<div class="winner-rating">🔥 4.8</div>
							</div>
							<div class="medal">🥈</div>
							<div class="podium-base second">2</div>
						</div>
						<div class="podium-place first">
							<div class="winner-info">
								<div class="winner-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_14.png"
										alt="코딩개">
								</div>
								<div class="winner-name">코딩개</div>
								<div class="winner-rating">🔥 5.0</div>
							</div>
							<div class="medal">🥇</div>
							<div class="podium-base first">1</div>
						</div>
						<div class="podium-place third">
							<div class="winner-info">
								<div class="winner-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_33.png"
										alt="홍길동">
								</div>
								<div class="winner-name">홍길동</div>
								<div class="winner-rating">🔥 4.5</div>
							</div>
							<div class="medal">🥉</div>
							<div class="podium-base third">3</div>
						</div>
					</div>

					<div class="ranking-table">
						<div class="ranking-header">
							<div>순위</div>
							<div>멘티</div>
							<div>열정도</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">4</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_42.png"
										alt="딥카페라떼">
								</div>
								<div class="participant-name">딥카페라떼</div>
							</div>
							<div class="rating">🔥 5.0</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">5</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/_211.png"
										alt="피카츄">
								</div>
								<div class="participant-name">피카츄</div>
							</div>
							<div class="rating">🔥 5.0</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">6</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/chat-gpt-image-2025-5-12-04-46-27-10.png"
										alt="라이츄">
								</div>
								<div class="participant-name">라이츄</div>
							</div>
							<div class="rating">🔥 5.0</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">7</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/ellipse-411.svg"
										alt="파이리">
								</div>
								<div class="participant-name">파이리</div>
							</div>
							<div class="rating">🔥 4.0</div>
						</div>
					</div>
				</div>

				<!-- 💻 인기 언어 랭킹 -->
				<div class="ranking-section language-ranking">
					<div class="section-title">🏆 인기 언어 랭킹</div>
					<div class="podium">
						<div class="podium-place second">
							<div class="winner-info">
								<div class="winner-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/python-10.png"
										alt="Python" class="language-icon">
								</div>
								<div class="winner-name">Python</div>
								<div class="winner-rating">❤️ 4.7</div>
							</div>
							<div class="medal">🥈</div>
							<div class="podium-base second">2</div>
						</div>
						<div class="podium-place first">
							<div class="winner-info">
								<div class="winner-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/java-10.png"
										alt="Java" class="language-icon">
								</div>
								<div class="winner-name">Java</div>
								<div class="winner-rating">❤️ 5.0</div>
							</div>
							<div class="medal">🥇</div>
							<div class="podium-base first">1</div>
						</div>
						<div class="podium-place third">
							<div class="winner-info">
								<div class="winner-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/html-10.png"
										alt="HTML" class="language-icon">
								</div>
								<div class="winner-name">HTML</div>
								<div class="winner-rating">❤️ 4.5</div>
							</div>
							<div class="medal">🥉</div>
							<div class="podium-base third">3</div>
						</div>
					</div>

					<div class="ranking-table">
						<div class="ranking-header">
							<div>순위</div>
							<div>언어</div>
							<div>인기도</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">4</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/react-10.png"
										alt="React" class="language-icon">
								</div>
								<div class="participant-name">React</div>
							</div>
							<div class="rating">❤️ 4.0</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">5</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/spring-10.png"
										alt="Spring" class="language-icon">
								</div>
								<div class="participant-name">Spring</div>
							</div>
							<div class="rating">❤️ 4.0</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">6</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/javascript-10.png"
										alt="JavaScript" class="language-icon">
								</div>
								<div class="participant-name">JavaScript</div>
							</div>
							<div class="rating">❤️ 4.0</div>
						</div>
						<div class="ranking-item">
							<div class="rank-number">7</div>
							<div class="participant-info">
								<div class="participant-avatar">
									<img
										src="${pageContext.request.contextPath}/resources/images/main1/css-10.png"
										alt="CSS" class="language-icon">
								</div>
								<div class="participant-name">CSS</div>
							</div>
							<div class="rating">❤️ 4.0</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- page-container 닫기 -->
		<div class="right"></div>
	</div>
	<!-- layout-wrapper 닫기 -->
	<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>

</body>

<!-- 푸터 영역 -->
<footer class="container-fluid mt-5 px-5">
	<div class="row mb-4">
		<div class="col-md-3 mb-3">
			<div class="footer-links mt-2">
				<a href="#" class="footer-link">개인정보처리방침</a> <a href="#"
					class="footer-link">이용약관</a>
			</div>
		</div>
		<div class="col-md-5 footer-info">
			<strong>(주)me:mento</strong><br> 대표자: 김신한<br> 사업자번호:
			123-45-67890 <a href="#" class="business-link">사업자 정보 확인</a><br>
			통신판매업: 2025-서울마포-0001<br> 개인정보보호책임자: 신한DS<br> 이메일:
			info@mentormentee.com
		</div>
		<div class="col-md-4 footer-contact">
			전화번호: 070-1234-5678<br> 주소: 서울특별시 중구 남대문로10길 29<br> 고객센터:
			평일 10:00 ~ 18:00 (점심시간 12:00 ~ 13:00)
		</div>
	</div>
	<div class="footer-bottom text-center">© 2025 MENTORMENTEE LAB.
		ALL RIGHTS RESERVED.</div>
</footer>

<!-- 슬라이더 JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/js/mainslider.js"></script>
</html>