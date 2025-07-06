<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:set var="mentosId" value="${mentosId}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>me:mento</title>
<link rel="stylesheet"
	href="${cpath }/resources/css/mainpage/notificationModal.css">
<link rel="stylesheet"
	href="${cpath}/resources/css/mentos/mentosDetailMento.css" />
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<jsp:include page="/WEB-INF/views/mentos/deletePopup.jsp" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=508d0978b8a40544a729f282b6187bd0&libraries=services&autoload=false"></script>
<body>
	<%@ include file="../common/logout_header.jsp"%>
	<%@ include file="../mainpage/notificationModal.jsp"%>

	<div class="container">
		<div class="class-wrapper-frame">
			<div class="class-main-info">
				<div class="frame-429">
					<div class="hover-tag">#백엔드</div>
					<div class="hover-tag">#AWS</div>
				</div>
				<div class="class-title">비전공자도 이해할 수 있는 AWS 입문/실전</div>
				<div class="class-description">비전공자 입장에서도 쉽게 이해할 수 있고, 실전에서 바로
					적용 가능한 AWS 입문 강의를 만들어봤습니다!</div>
			</div>
			<div class="class-main-frame">
				<div class="class-detail-info">
					<div class="class-detail-list">
						<div class="detail-row">
							<div class="detail-label">모집 인원</div>
							<div class="detail-value">
								<span id="currentMemberCnt">1</span>/<span id="maxMember">5</span>
							</div>
						</div>
						<div class="detail-row">
							<div class="detail-label">참여 기간</div>
							<div class="detail-value">
								<span id="startDay">06/23</span>-<span id="endDay">06/30</span>
								<span id="startTime">15:00</span>-<span id="endTime">17:00</span>
							</div>
						</div>
						<div class="detail-row">
							<div class="detail-label">참여 요일</div>
							<div class="detail-value" id="selectedDays">화</div>
						</div>
						<div class="detail-row">
							<div class="detail-label">멘토스 횟수</div>
							<div class="detail-value" id="times">2회</div>
						</div>
						<div class="detail-row">
							<div class="detail-label">장소</div>
							<div class="detail-value" id="place">투썸플레이스 홍대입구역점</div>
						</div>
					</div>
					<div class="divider-line"></div>
					<div class="price-and-button">
						<div class="class-price" id="price">₩70,000</div>
						<div class="two-button">
							<div class="class-apply-btn"
								onclick="location.href='${cpath}/mentos/edit?mentosId=${mentos.mentosId}'">수정하기</div>
							<label for="popupTrigger" class="mentos-delete-btn">
								<div class="class-apply-btn">삭제하기</div>
							</label>
						</div>
					</div>
				</div>

				<div class="class-detail-content">
					<!-- 태그/주제 영역 -->
					<div class="class-meta-section">
						<!-- 강의 소개/개요 -->
						<div class="class-summary-section"></div>
						<!-- 함께하고 싶은 유형 -->
						<div class="class-partner-section">
							<div class="class-list-title">✋이런 분들과 함께하고 싶어요</div>
							<div class="partner-list">
								<div class="partner-card">
									<div class="partner-circle">
										<div class="partner-name1">
											🔥<br />코드폭탄<br />해피빈
										</div>
									</div>
								</div>
								<div class="partner-card">
									<div class="partner-circle">
										<div class="partner-name2">
											🔥<br />코드폭탄<br />해피빈
										</div>
									</div>
								</div>
								<div class="partner-card">
									<div class="partner-circle">
										<div class="partner-name3">
											🔥<br />코드폭탄<br />해피빈
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 우측 정보 및 관리 영역 -->
					<div class="class-side-section">
						<div class="class-location-info">
							<div class="mentos-class-image-frame">
								<img class="mentos-class-image"
									src="${pageContext.request.contextPath}/resources/images/mentosFull/class5.png" />
							</div>
							<div class="location-detail">
								<div class="location-row">
									<img class="icon"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
									<div class="location-address">서울 마포구 월드컵북로2길 57 1층</div>
								</div>
								<div class="mentos-class-image-frame">
									<div class="location-label">
										<div id="mentosMap" style="width: 100%; height: 200px;"></div>
									</div>
								</div>
							</div>
							<!--누르면 멘토 상세페이지로 이동 -->
							<div class="class-mentor-section"
								onclick="location.href='${cpath}/mentos/mentodetail?mentoId='"
								style="cursor: pointer;">

								<div class="mentor-profile">
									<img class="mentor-image"
										src="${pageContext.request.contextPath}/resources/images/mentosDetail/profile.png" />
								</div>
								<div class="mentor-info-box">
									<div class="mentor-info-main">
										<div class="mentor-name">정진</div>
										<div class="mentor-role-label">mento</div>
									</div>
									<div class="mentor-type">🧩 계획왕 컴정이</div>
									<div class="mentor-rating-section">
										<div class="mentor-rating-label">별점</div>
										<div class="vote" data-rating="${mentos.avgRating}">
											<!-- JS로 동적으로 별을 채울 예정 -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="similar-mentos-wrapper">
				<div class="section-title">비슷한 다른 멘토스 둘러보기</div>
				<div class="mentos-card-list" id="similarMentosListContainer">
					<!-- 여기에 JS로 반복 렌더링 -->
				</div>
			</div>
		</div>
	</div>
	<script src="${cpath }/resources/js/notification.js"></script>
	<script src="${cpath}/resources/js/header.js"></script>
	<script src="${cpath}/resources/js/mentos/mentosDetail.js"></script>
</body>
</html>