<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
								<c:when test="${matchupDetail.mentoId != null && matchupDetail.mentoId > 0}">
									<div class="top-info-mento completed">멘토 선정 완료</div>
								</c:when>
								<c:otherwise>
									<div class="top-info-mento">멘토 모집중</div>
								</c:otherwise>
							</c:choose>
						</c:if>
						<div class="top-info-category">
							<div class="java-c">#${matchupDetail.languageName} #${matchupDetail.categoryName}</div>
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
								<span class="dash">-</span>
								<span class="end-time">${matchupDetail.formattedEndTime}</span>
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
							<button class="select-memberlist-btn" id="select-memberlist-btn" type="button">
								<span class="rectangle-298"></span> <span class="div8">팀원 리스트 보기</span>
							</button>
							<c:if test="${matchupDetail.hasMento && (matchupDetail.mentoId == null || matchupDetail.mentoId == 0)}">
								<button class="select-mentolist-btn" id="select-mentolist-btn" type="button">
									<span class="rectangle-298"></span> <span class="div8">요청중인 멘토 보기</span>
								</button>
							</c:if>
							<button class="update-btn" id="update-btn" type="button">
								<span class="rectangle-299"></span> <span class="div7">수정하기</span>
							</button>
							<button class="delete-btn" id="delete-btn" type="button"
							        onclick="showDeleteConfirmModal()">
								<span class="rectangle-300"></span>
								<span class="div9">삭제하기</span>
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
									${matchupDetail.content}
								</span>
							</div>
						</div>
						<div class="div11">✋ 이런 분과 함께하고 싶어요</div>
							<div class="type-circle-wrapper">
							    
							    <%-- 첫 번째 항목 --%>
							    <div class="type-item-box">
							        <div class="type-circle">
							            <%-- type-text 태그 안에 이모티콘과 데이터를 넣어주세요 --%>
							            <div class="type-text">🔥 ${matchupDetail.matchTypeFirstName}</div>
							        </div>
							    </div>
							
							    <%-- 두 번째 항목 --%>
							    <div class="type-item-box">
							        <div class="type-circle">
							            <div class="type-text">🎯 ${matchupDetail.matchTypeSecondName}</div>
							        </div>
							    </div>
							
							    <%-- 세 번째 항목 --%>
							    <div class="type-item-box">
							        <div class="type-circle">
							            <div class="type-text">🤝 ${matchupDetail.matchTypeThirdName}</div>
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
							<div class="map-placeholder"></div>
						</div>
					</div>
					<div class="section-box">
						<div class="frame-3670 profile-section-box"> <%-- 프로필 박스 추가 --%>
							<c:choose>
								<%-- 멘토가 이미 선정된 경우 --%>
								<c:when test="${matchupDetail.mentoId != null && matchupDetail.mentoId > 0}">
									<div class="div15" id="mento-status-text">멘토가 선정되었어요!</div>
									<div class="profile-circle-wrapper">
										<a href="/user/${matchupDetail.mentoId}" class="profile-link">
											<img id="mento-profile-img" class="image-47" src="${cpath}/resources/images/logo.png"
												alt="선정된 멘토 프로필" />
										</a>
									</div>
									<div class="div15" id="mento-nickname">${matchupDetail.mentoNickname}</div>
								</c:when>

								<%-- 멘토를 아직 기다리는 경우 --%>
								<c:otherwise>
									<div class="div15" id="mento-status-text">멘토를 기다리고 있어요</div>
									<div class="profile-circle-wrapper">
										<a href="#" class="profile-link">
											<img id="mento-profile-img" class="image-47" src="${cpath}/resources/images/logo.png" alt="유저 프로필" />
										</a>
									</div>
									<div class="div15" id="mento-nickname">알고리즘뿌셔뿌셔</div>
								</c:otherwise>
							</c:choose>
							<div class="line-7"></div>
							<div class="div15">매치업을 주선한 방장이에요</div>
							<div class="profile-circle-wrapper">
								<a href="/user/123" class="profile-link">
								<img class="image-47" src="${cpath}/resources/images/logo.png"
									alt="유저 프로필" />
								</a>
							</div>
							<div class="div15">코딩마스터</div> <%-- 방장 닉네임 수정 --%>
						</div>
					</div>
				</div>
			</div>

<div class="bottom-area">
    <div class="line-10"></div>
    <div class="section-title">비슷한 다른 매치업 둘러보기</div>
    <div class="frame-3770">
        <%-- Card 1 --%>
        <a href="/match-id=12" class="card-link">
            <div class="matchup-card">
                <div class="card-main">
                    <div class="card-header">
                        <div class="card-location">
                            <img src="${cpath}/resources/images/icon-map-black.svg" alt="위치"/>
                            <span>강남구</span>
                        </div>
                        <div class="card-badge">마감임박🚨</div>
                    </div>
                    <h3 class="card-title">React 심화 프로젝트 스터디</h3>
                    <div class="card-details">
                        <div class="detail-item">
                            <img src="${cpath}/resources/images/icon-calendar.svg" alt="날짜"/>
                            <span>2025/06/13 - 2025/06/20</span>
                        </div>
                        <div class="detail-item">
                            <img src="${cpath}/resources/images/icon_time.svg" alt="시간"/>
                            <span>15:00 - 17:00</span>
                        </div>
                        <div class="detail-item">
                            <img src="${cpath}/resources/images/icon-user.svg" alt="인원"/>
                            <span>모집인원 2/4</span>
                        </div>
                    </div>
                </div>
                <div class="card-side">
                    <img class="profile-image" src="${cpath}/resources/images/profile.svg" alt="프로필"/>
                </div>
                <div class="card-footer">
                    <div class="card-tags">#React #프로젝트</div>
                    <div class="card-price">₩80,000</div>
                </div>
            </div>
        </a>

        <%-- Card 2 --%>
        <a href="/match-id=12" class="card-link">
            <div class="matchup-card">
                <div class="card-main">
                    <div class="card-header">
                        <div class="card-location">
                            <img src="${cpath}/resources/images/icon-map-black.svg" alt="위치"/>
                            <span>서초구</span>
                        </div>
                        <div class="card-badge">마감임박🚨</div>
                    </div>
                    <h3 class="card-title">Python 데이터 분석 스터디</h3>
                    <div class="card-details">
                        <div class="detail-item">
                            <img src="${cpath}/resources/images/icon-calendar.svg" alt="날짜"/>
                            <span>2025/06/15 - 2025/06/22</span>
                        </div>
                        <div class="detail-item">
                            <img src="${cpath}/resources/images/icon_time.svg" alt="시간"/>
                            <span>19:00 - 21:00</span>
                        </div>
                        <div class="detail-item">
                            <img src="${cpath}/resources/images/icon-user.svg" alt="인원"/>
                            <span>모집인원 3/5</span>
                        </div>
                    </div>
                </div>
                <div class="card-side">
                    <img class="profile-image" src="${cpath}/resources/images/profile.svg" alt="프로필"/>
                </div>
                <div class="card-footer">
                    <div class="card-tags">#Python #데이터분석</div>
                    <div class="card-price">₩90,000</div>
                </div>
            </div>
        </a>

        <%-- Card 3 --%>
        <a href="/match-id=12" class="card-link">
            <div class="matchup-card">
                <div class="card-main">
                    <div class="card-header">
                        <div class="card-location">
                            <img src="${cpath}/resources/images/icon-map-black.svg" alt="위치"/>
                            <span>홍대구</span>
                        </div>
                        <div class="card-badge new">신규등록🔥</div>
                    </div>
                    <h3 class="card-title">JavaScript 심화 스터디</h3>
                    <div class="card-details">
                        <div class="detail-item">
                            <img src="${cpath}/resources/images/icon-calendar.svg" alt="날짜"/>
                            <span>2025/06/20 - 2025/06/27</span>
                        </div>
                        <div class="detail-item">
                            <img src="${cpath}/resources/images/icon_time.svg" alt="시간"/>
                            <span>14:00 - 16:00</span>
                        </div>
                        <div class="detail-item">
                            <img src="${cpath}/resources/images/icon-user.svg" alt="인원"/>
                            <span>모집인원 1/4</span>
                        </div>
                    </div>
                </div>
                <div class="card-side">
                    <img class="profile-image" src="${cpath}/resources/images/profile.svg" alt="프로필"/>
                </div>
                <div class="card-footer">
                    <div class="card-tags">#JavaScript</div>
                    <div class="card-price">₩75,000</div>
                </div>
            </div>
        </a>
    </div>
</div>
		</div>
	</div>
</div>
<script>
	const cpath = '${cpath}';
	const matchupDetail = {
	    matchupId: '${matchupDetail.matchupId}',
	    leaderId: '${matchupDetail.leaderId}'
	};
</script>
 <script src="${cpath}/resources/js/matchup/matchupDetailLeader.js?v=<%= new java.util.Date().getTime() %>"></script>
</body>
</html>