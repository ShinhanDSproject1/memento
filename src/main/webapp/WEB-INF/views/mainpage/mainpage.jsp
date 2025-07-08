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
		<c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<%@ include file="../common/logout_header.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="../common/login_header.jsp"%>
			</c:otherwise>
		</c:choose>
		<div class="page-container">
			<%@ include file="notificationModal.jsp"%>
			<div id="loginModal"
				style="display: none; position: fixed; top: 20%; left: 39%; transform: translateX(-50%); z-index: 1000;">

				<%@ include file="login.jsp"%>
			</div>
			<div id="modalBackdrop"
				style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 999;"
				onclick="closeModal()"></div>
			<script src="${pageContext.request.contextPath}/resources/js/notification.js"></script>

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
								<div class="spring-content" onclick="location.href='${cpath}/mentos/detail?mentosid=${banner.mentosId}&memberId=${loginId}'">
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
			    <div class="ranking-section mentor-ranking">
			        <div class="section-title">🏆 인기 멘토 랭킹</div>
			        <div class="podium" id="mentorPodium">
			            </div>
			        <div class="ranking-table">
			            <div class="ranking-header">
			                <div>순위</div>
			                <div>멘토</div>
			                <div>평점</div>
			            </div>
			            <div id="mentorTableBody"></div>
			        </div>
			    </div>
			
			    <div class="ranking-section mentee-ranking">
			        <div class="section-title">🏆 열정 멘티 랭킹</div>
			        <div class="podium" id="mentiPodium">
			            </div>
			        <div class="ranking-table">
			            <div class="ranking-header">
			                <div>순위</div>
			                <div>멘티</div>
			                <div>열정도</div>
			            </div>
			            <div id="mentiTableBody"></div>
			        </div>
			    </div>
			
			    <div class="ranking-section language-ranking">
			        <div class="section-title">🏆 인기 언어 랭킹</div>
			        <div class="podium" id="languagePodium">
			            </div>
			        <div class="ranking-table">
			            <div class="ranking-header">
			                <div>순위</div>
			                <div>언어</div>
			                <div>인기도</div>
			            </div>
			            <div id="languageTableBody"></div>
			        </div>
			    </div>
			
			</div>
	<!-- layout-wrapper 닫기 -->
	<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
	<script>
	    const CPATH = "${cpath}";
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/mainpage.js"></script>
</body>

<!-- 푸터 영역 -->
<footer class="container-fluid mt-5 px-5">
	<div class="row mb-4">
		<div class="col-md-3 mb-3">
			<div class="footer-links mt-2">
				<span>개인정보처리방침</span> <span>
					이용약관</span>
			</div>
		</div>
		<div class="col-md-5 footer-info">
			<strong>(주)me:mento</strong><br> 대표자: 김신한<br> 사업자번호:
			123-45-67890 <span style="text-decoration: underline;">사업자 정보 확인</span><br>
			통신판매업: 2025-서울마포-0001<br> 개인정보보호책임자: 신한DS<br> E-mail:
			shinhanDS@memento.com
		</div>
		<div class="col-md-4 footer-contact">
			전화번호: 070-1234-5678<br> 주소: 서울특별시 중구 남대문로10길 29<br> 고객센터:
			평일 10:00 ~ 18:00 (점심시간 12:00 ~ 13:00)
		</div>
	</div>
	<div class="footer-bottom text-center">© 2025 MENTORMENTEE LAB.
		ALL RIGHTS RESERVED.</div>
</footer>