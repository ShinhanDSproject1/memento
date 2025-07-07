<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:set var="needMento" value="true" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>me:mento</title>

<link rel="stylesheet"
	href="${cpath}/resources/css/matchupDetailLeader.css">
<link rel="stylesheet" href="${cpath}/resources/css/vars.css">
</head>
<body>
	<%@ include file="../common/logout_header.jsp"%>

	<div class="container">
		<jsp:include page="/WEB-INF/views/matchup/memberListModal.jsp" />
		<jsp:include page="/WEB-INF/views/matchup/mentoListModal.jsp" />
		<jsp:include page="/WEB-INF/views/matchup/deleteConfirmModal.jsp" />
		<jsp:include page="/WEB-INF/views/matchup/deleteModal.jsp" />

		<div class="main-content-wrapper">
			<div class="main-content">
				<div class="top-info-area">
					<div class="top-info">
						<div class="top-info-tags">
							<c:if test="${matchupDetail.hasMento}">
								<c:choose>
									<c:when
										test="${matchupDetail.mentoId != null && matchupDetail.mentoId > 0}">
										<div class="top-info-mento completed">멘토 선정 완료</div>
									</c:when>
									<c:otherwise>
										<div class="top-info-mento">멘토 모집중</div>
									</c:otherwise>
								</c:choose>
							</c:if>
							<div class="top-info-category">
								<div class="java-c">#${matchupDetail.languageName}
									#${matchupDetail.categoryName}</div>
							</div>
						</div>
						<div class="div3">${matchupDetail.title}</div>
						<div class="info-grid">
							<div class="group-item">
								<div class="div4">현재 모집인원</div>
								<div class="_3-5">
									<span class="now-member-cnt">${matchupDetail.formattedMemberCount}</span>
								</div>
							</div>
							<div class="group-item">
								<div class="div5">모집 시간</div>
								<div class._15-00-17-00>
									<span class="start-time">${matchupDetail.formattedStartTime}</span> 
									<span class="dash">-</span> <span class="end-time">${matchupDetail.formattedEndTime}</span>
								</div>
							</div>
							<div class="group-item">
								<div class="div6">스터디 횟수</div>
								<div class="_1">${matchupDetail.totalCount}회</div>
							</div>
						</div>
						<div class="top-info-line"></div>
						<div class="price-and-buttons">
							<div class="price-text">₩${matchupDetail.formattedPrice}</div>
							<div class="button-group">
								<button class="select-memberlist-btn" id="select-memberlist-btn"
									type="button">
									<span class="rectangle-298"></span> <span class="div8">팀원
										리스트 보기</span>
								</button>
								<c:if
									test="${matchupDetail.hasMento && (matchupDetail.mentoId == null || matchupDetail.mentoId == 0)}">
									<button class="select-mentolist-btn" id="select-mentolist-btn"
										type="button">
										<span class="rectangle-298"></span> <span class="div8">요청중인
											멘토 보기</span>
									</button>
								</c:if>
								<button class="update-btn" id="update-btn" type="button">
									<span class="rectangle-299"></span> <span class="div7">수정하기</span>
								</button>
								<button class="delete-btn" id="delete-btn" type="button"
									onclick="showDeleteConfirmModal()">
									<span class="rectangle-300"></span> <span class="div9">삭제하기</span>
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="middle-area">
					<div class="middle-area-left">
						<%-- 멘토링 소개 전체를 감싸는 큰 박스 --%>
						<div class="section-box">
							<div class="frame-3764">
								<div class="div100">💡 멘토링 소개</div>
								<div class="_1-1-2-3-1-3-or-1">
									<span class="_1-1-2-3-1-3-or-1-span">
										${matchupDetail.content} </span>
								</div>
							</div>
							<div class="div11">✋ 이런 분과 함께하고 싶어요</div>
							<div class="type-circle-wrapper">
							
							    <%-- 첫 번째 항목 --%>
							    <div class="type-item-box">
							        <div class="type-circle">
							            <c:set var="typeName" value="${matchupDetail.matchTypeFirstName}" />
							            <c:choose>
							                <c:when test="${typeName == '타닥냥'}"><img src="${cpath}/resources/images/mypage/spark-test/tadakNyang-icon.png" alt="타닥냥" class="type-image"></c:when>
							                <c:when test="${typeName == '코취치'}"><img src="${cpath}/resources/images/mypage/spark-test/coachChee-icon.png" alt="코취치" class="type-image"></c:when>
							                <c:when test="${typeName == '깃요미'}"><img src="${cpath}/resources/images/mypage/spark-test/gitYomi-icon.png" alt="깃요미" class="type-image"></c:when>
							                <c:when test="${typeName == '컴정이'}"><img src="${cpath}/resources/images/mypage/spark-test/comZung-icon.png" alt="컴정이" class="type-image"></c:when>
							                <c:when test="${typeName == '해피빈'}"><img src="${cpath}/resources/images/mypage/spark-test/happyBeen-icon.png" alt="해피빈" class="type-image"></c:when>
							                <c:when test="${typeName == '슬로우곰'}"><img src="${cpath}/resources/images/mypage/spark-test/slowGom-icon.png" alt="슬로우곰" class="type-image"></c:when>
							                <c:otherwise><div class="type-emoji">💡</div></c:otherwise>
							            </c:choose>
							            <div class="type-text">${typeName}</div>
							        </div>
							    </div>
							
							    <%-- 두 번째 항목 --%>
							    <div class="type-item-box">
							        <div class="type-circle">
							            <c:set var="typeName" value="${matchupDetail.matchTypeSecondName}" />
							            <c:choose>
							                <c:when test="${typeName == '타닥냥'}"><img src="${cpath}/resources/images/mypage/spark-test/tadakNyang-icon.png" alt="타닥냥" class="type-image"></c:when>
							                <c:when test="${typeName == '코취치'}"><img src="${cpath}/resources/images/mypage/spark-test/coachChee-icon.png" alt="코취치" class="type-image"></c:when>
							                <c:when test="${typeName == '깃요미'}"><img src="${cpath}/resources/images/mypage/spark-test/gitYomi-icon.png" alt="깃요미" class="type-image"></c:when>
							                <c:when test="${typeName == '컴정이'}"><img src="${cpath}/resources/images/mypage/spark-test/comZung-icon.png" alt="컴정이" class="type-image"></c:when>
							                <c:when test="${typeName == '해피빈'}"><img src="${cpath}/resources/images/mypage/spark-test/happyBeen-icon.png" alt="해피빈" class="type-image"></c:when>
							                <c:when test="${typeName == '슬로우곰'}"><img src="${cpath}/resources/images/mypage/spark-test/slowGom-icon.png" alt="슬로우곰" class="type-image"></c:when>
							                <c:otherwise><div class="type-emoji">💡</div></c:otherwise>
							            </c:choose>
							            <div class="type-text">${typeName}</div>
							        </div>
							    </div>
							
							    <%-- 세 번째 항목 --%>
							    <div class="type-item-box">
							        <div class="type-circle">
							            <c:set var="typeName" value="${matchupDetail.matchTypeThirdName}" />
							            <c:choose>
							                <c:when test="${typeName == '타닥냥'}"><img src="${cpath}/resources/images/mypage/spark-test/tadakNyang-icon.png" alt="타닥냥" class="type-image"></c:when>
							                <c:when test="${typeName == '코취치'}"><img src="${cpath}/resources/images/mypage/spark-test/coachChee-icon.png" alt="코취치" class="type-image"></c:when>
							                <c:when test="${typeName == '깃요미'}"><img src="${cpath}/resources/images/mypage/spark-test/gitYomi-icon.png" alt="깃요미" class="type-image"></c:when>
							                <c:when test="${typeName == '컴정이'}"><img src="${cpath}/resources/images/mypage/spark-test/comZung-icon.png" alt="컴정이" class="type-image"></c:when>
							                <c:when test="${typeName == '해피빈'}"><img src="${cpath}/resources/images/mypage/spark-test/happyBeen-icon.png" alt="해피빈" class="type-image"></c:when>
							                <c:when test="${typeName == '슬로우곰'}"><img src="${cpath}/resources/images/mypage/spark-test/slowGom-icon.png" alt="슬로우곰" class="type-image"></c:when>
							                <c:otherwise><div class="type-emoji">💡</div></c:otherwise>
							            </c:choose>
							            <div class="type-text">${typeName}</div>
							        </div>
							    </div>
							
							</div>
						</div>
					</div>
					<div class="middle-area-right">
						<%-- 지도 영역을 감싸는 큰 박스 --%>
						<div class="section-box">
							<div class="frame-3766">
								<div class="frame-3666">
									<img class="icon-maps-map-pin"
										src="${cpath}/resources/images/icon-map-red.svg" alt="위치 아이콘" />
									<div class="_4-77-1-f">${matchupDetail.formattedRegion}</div>
								</div>
								<div id="map" class="map-placeholder"></div>
							</div>
						</div>
						<div class="section-box">
							<div class="frame-3670 profile-section-box">
								<%-- 프로필 박스 추가 --%>
								<c:choose>
									<%-- 애초에 멘토가 없는 매치업 --%>
									<c:when test="${!matchupDetail.hasMento}">
										<div class="profile-title">멘토가 없는 매치업이에요!</div>
										<a href="#" class="profile-link"><img class="profile-img"
											src="${cpath}/resources/images/memento-logo.png" alt="기본 프로필" /></a>
									</c:when>

									<%-- 멘토가 있는 매치업 --%>
									<c:otherwise>
										<%-- 멘토가 선정되었는지, 모집 중인지 확인 --%>
										<c:choose>
											<c:when
												test="${matchupDetail.mentoId != null && matchupDetail.mentoId > 0}">
												<div class="profile-title" id="mento-status-text">멘토가
													선정되었어요!</div>
												<a href="/user/${matchupDetail.mentoId}"
													class="profile-link"> <img id="mento-profile-img"
													class="profile-img"
													src="${not empty matchupDetail.mentoProfileImageUrl ? matchupDetail.mentoProfileImageUrl : cpath.concat('/resources/images/memento-logo.png')}"
													alt="멘토 프로필" />
												</a>
												<div class="profile-nickname" id="mento-nickname">${matchupDetail.mentoNickname}</div>
											</c:when>
											<c:otherwise>
												<div class="profile-title" id="mento-status-text">멘토를
													기다리고 있어요</div>
												<a href="#" class="profile-link"> <img
													id="mento-profile-img" class="profile-img"
													src="${cpath}/resources/images/memento-logo.png" alt="기본 프로필" />
												</a>
												<div class="profile-nickname" id="mento-nickname"></div>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<div class="line-7"></div>
								<div class="div15">매치업을 주선한 방장이에요</div>
								<div class="profile-circle-wrapper">
									<img class="image-47"
										src="${not empty matchupDetail.leaderProfileImageUrl ? matchupDetail.leaderProfileImageUrl : cpath.concat('/resources/images/logo.png')}"
										alt="방장 프로필" />
								</div>
								<div class="div15">${matchupDetail.leaderNickname}</div>
							</div>
						</div>
					</div>
				</div>
				<%-- 하단 비슷한 매치업 카드 --%>
				<div class="bottom-area">
					<div class="divider"></div>
					<h3 class="section-title">비슷한 다른 매치업 둘러보기</h3>
					<div class="card-list-container">
						<c:forEach var="matchup" items="${similarList}">
							<a href="${cpath}/matchup/matchupDetail?id=${matchup.matchupId}"
								class="card-link">
								<div class="matchup-card">
									<div class="card-main-content">
										<div class="card-header">
											<div class="card-location">
												<img src="${cpath}/resources/images/icon-map-black.svg"
													alt="위치" /> <span>${matchup.regionSubgroup}</span>
											</div>
											<div class="card-badge ${matchup.newMatchup ? 'new' : ''}">
												<c:choose>
													<c:when test="${matchup.newMatchup}">신규등록🔥</c:when>
													<c:otherwise>마감임박🚨</c:otherwise>
												</c:choose>
											</div>

										</div>
										<h3 class="card-title">${matchup.title}</h3>
										<div class="card-details">
											<div class="detail-item">
												<img src="${cpath}/resources/images/icon-calendar.svg"
													alt="날짜" /> <span>${matchup.formattedStartDate} -
													${matchup.formattedEndDate}</span>
											</div>
											<div class="detail-item">
												<img src="${cpath}/resources/images/icon_time.svg" alt="시간" />
												<span>${matchup.formattedStartTime} -
													${matchup.formattedEndTime}</span>
											</div>
											<div class="detail-item">
												<img src="${cpath}/resources/images/icon-user.svg" alt="인원" />
												<span>모집인원 ${matchup.count}/${matchup.maxMember}</span>
											</div>
										</div>
									</div>
									<div class="card-side-content">
										<img class="profile-image"
											src="${cpath}/resources/images/profile.svg" alt="프로필" />
									</div>
									<div class="card-footer">
										<div class="card-tags">#${matchup.languageName}
											#${matchup.categoryName}</div>


										<div class="card-price">₩${matchup.formattedPrice}</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=508d0978b8a40544a729f282b6187bd0&libraries=services&autoload=false"></script>
	<script>
		kakao.maps
				.load(function() {
					// 1. 지도를 담을 영역의 DOM 레퍼런스
					const mapContainer = document.getElementById('map');

					// 2. 서버로부터 받은 주소 데이터
					const address = "${matchupDetail.formattedRegion}";

					// 주소 데이터가 비어있으면 실행하지 않습니다.
					if (!address) {
						console.warn("지도에 표시할 주소 정보가 없습니다.");
						return;
					}

					// 3. 주소-좌표 변환 객체를 생성합니다
					const geocoder = new kakao.maps.services.Geocoder();

					// 4. 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									address,
									function(result, status) {

										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK) {

											const coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);

											// 지도 옵션 설정
											const mapOption = {
												center : coords, // 검색된 좌표를 지도의 중심으로 설정
												level : 3
											// 지도의 확대 레벨
											};

											// 지도를 생성합니다    
											const map = new kakao.maps.Map(
													mapContainer, mapOption);

											// 결과 좌표에 마커를 생성하고 표시합니다
											const marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});

										} else {
											// 주소 검색에 실패했을 경우, 지도 컨테이너에 메시지를 표시합니다.
											console.warn('주소 검색에 실패했습니다:',
													status);
											mapContainer.innerHTML = '<div style="text-align:center; padding-top: 70px; color: #888;">정확한 위치를 찾을 수 없어요.</div>';
										}
									});
				});
	</script>
	<script>
		const cpath = '${cpath}';
		const matchupDetail = {
			matchupId : '${matchupDetail.matchupId}',
			leaderId : '${matchupDetail.leaderId}'
		};
	</script>
	 
	<script
		src="${cpath}/resources/js/matchup/matchupDetailLeader.js?v=<%= new java.util.Date().getTime() %>"></script>
</body>
</html>