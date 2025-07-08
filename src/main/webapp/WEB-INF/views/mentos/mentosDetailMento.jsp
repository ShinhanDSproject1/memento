<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=508d0978b8a40544a729f282b6187bd0&libraries=services&autoload=false"></script>
<body data-mentos-id="${mentosId}"
	data-member-id="${sessionScope.loginUser.memberId}"
	data-cpath="${cpath}">
	<%@ include file="../common/logout_header.jsp"%>
	<%@ include file="../mainpage/notificationModal.jsp"%>
	<%@ include file="../mentos/deleteModal.jsp"%>
	<div class="container">
		<div class="class-wrapper-frame">
			<div class="class-main-info">
				<div class="frame-429">
					<div class="hover-tag category">#백엔드</div>
					<div class="hover-tag language">#AWS</div>
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
								onclick="location.href='${cpath}/mentos/editPage?mentosId=${mentosId}'">수정하기</div>
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
				<div class="div15">비슷한 다른 멘토스 둘러보기</div>
				<div class="mentos-all-class-row">
					<!-- 템플릿용 (JS에서 clone 후 데이터만 채워넣음) -->
					<div id="mentosCardTemplate"
						class="mentos-class-cardview mentos-hover-guide"
						style="display: none;">
						<div class="mentos-class">
							<div class="mentos-text">
								<div class="frame-37862">
									<div class="frame-413">
										<div class="">D-</div>
										<div class="day-left">2</div>
									</div>
									<div class="frame-414">
										<div class="remain-seat"></div>
									</div>
								</div>
								<div class="aws" id="mentos-title">비전공자도 이해할 수 있는 AWS
									입문/실전</div>
								<div class="frame-406">

									<div class="frame-407">
										<img class="user-user"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
										<div class="text" id="mento-name">김코딩</div>
										<div class="group-371">
											<div class="pre-mento">pre-mento</div>
										</div>
									</div>
									<div class="frame-408">
										<img class="icon-time-calendar"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
										<div class="text" id="startDay">2025/06/23</div>
										<div class="text">-</div>
										<div class="text" id="endDay">2025/06/23</div>
									</div>
									<div class="frame-409">
										<img class="icon-time-clock-outlined"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
										<div class="text" id="startTime">15시</div>
										<div class="text">-</div>
										<div class="text" id="endTime">17시</div>
										<div class="text" id="days">(화)</div>
									</div>
									<div class="frame-410">
										<img class="icon-maps-map-pin"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
										<div class="text" id="place">역삼</div>
									</div>
									<div class="frame-3659">
										<div class="_45-000" id="price">무료</div>
									</div>
								</div>
							</div>
							<img class="image"
								src="${pageContext.request.contextPath}/resources/images/mentosFull/class4.png" />
							<div class="mentos-hover-popup">
								<div class="hover-inner">
									<div class="hover-title">
										비전공자도 이해할 수 있는<br />입문/실전
									</div>
									<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
									<div class="hover-tags">
										<span class="hover-tag category">#AWS</span> <span class="hover-tag language">#클라우드</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script src="${cpath }/resources/js/notification.js"></script>
	<script src="${cpath}/resources/js/header.js"></script>
	<script src="${cpath}/resources/js/mentos/mentosDetail.js"></script>
</body>
</html>