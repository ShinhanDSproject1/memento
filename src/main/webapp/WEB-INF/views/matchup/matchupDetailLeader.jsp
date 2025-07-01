<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<%-- 이 부분 주석 처리 해제하면 멘토가 필요한 부분에 대한 화면 확인 가능 --%>
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
	<div class="div">
		<div class="top-bar">
			<div class="top-bar-tag">
				<c:if test="${matchupDetail.hasMento}">
					<c:choose>
		                <c:when test="${matchupDetail.mentoId != null && matchupDetail.mentoId > 0}">
		                    <div class="top-bar-mento completed">멘토 선정 완료</div>
		                </c:when>
		                <c:otherwise>
		                    <div class="top-bar-mento">멘토 모집중</div>
		                </c:otherwise>
		            </c:choose>
				</c:if>
				<div class="top-bar-category">
					<div class="java-c">#${matchupDetail.languageName} #${matchupDetail.categoryName}</div>
				</div>
			</div>
			<div class="div3">${matchupDetail.title}</div>
		</div>
		<div class="top-info-area">
			<div class="top-info">
				<div class="group-475">
					<div class="div4">현재 모집인원</div>
					<div class="_3-5">
						<span class="now-member-cnt">${matchupDetail.formattedMemberCount}</span>
					</div>
				</div>
				<div class="group-476">
					<div class="div5">모집 시간</div>
					<div class="_15-00-17-00">
						<span class="start-time">${matchupDetail.formattedStartTime}</span> 
						<span class="dash">-</span>
						<span class="end-time">${matchupDetail.formattedEndTime}</span>
					</div>
				</div>
				<div class="group-477">
					<div class="div6">스터디 횟수</div>
					<div class="_1">${matchupDetail.totalCount}회</div>
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
			<div class="frame-3767">
				<div class="middle-area-left">
					<div class="frame-3764">
						<div class="div10">멘토링 소개</div>
						<div class="frame-3665">
							<div class="_1-1-2-3-1-3-or-1">
								<span class="_1-1-2-3-1-3-or-1-span">
									${matchupDetail.content}
								</span>
							</div>
						</div>
						<div class="div11">✋ 이런 분과 함께하고 싶어요</div>
						<div class="frame-480">
							<div class="type-circle-wrapper">
								<div class="type-circle">
									<img class="ellipse-147"
		                              src="${cpath}/resources/images/ellipse.svg" />
		                            <div class="div10">
		                              🔥 ${matchupDetail.matchTypeFirstName}
		                            </div>
								</div>
								<div class="type-circle">
		                           <img class="ellipse-1472"
		                              src="${cpath}/resources/images/ellipse.svg" />
		                           <div class="div11">
		                              🔥 ${matchupDetail.matchTypeSecondName}
		                           </div>
		                        </div>
								<div class="type-circle">
									<img class="ellipse-1473"
		                              src="${cpath}/resources/images/ellipse.svg" />
		                            <div class="div12">
		                              🔥 ${matchupDetail.matchTypeThirdName}
		                            </div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="middle-area-right">
					<div class="frame-3766">
						<div class="frame-3666">
							<img class="icon-maps-map-pin"
								src="${cpath}/resources/images/icon-map-red.svg" />
							<div class="_4-77-1-f">${matchupDetail.formattedRegion}</div>
						</div>
						<div class="rectangle-189"></div>
					</div>
					<div class="frame-3670">
				       <c:choose>
				            <%-- 멘토가 이미 선정된 경우 --%>
				            <c:when test="${matchupDetail.mentoId != null && matchupDetail.mentoId > 0}">
				                <div class="div15" id="mento-status-text">멘토가 선정되었어요!</div>
				                <div class="frame-3668">
				                    <a href="/user/${matchupDetail.mentoId}" class="profile-link">
				                        <img id="mento-profile-img" class="image-47" 
				                             src="${not empty matchupDetail.mentoProfileImageUrl ? matchupDetail.mentoProfileImageUrl : cpath.concat('/resources/images/member-icon.png')}" 
				                             alt="선정된 멘토 프로필" />
				                    </a>
				                </div>
				                <div class="div15" id="mento-nickname">${matchupDetail.mentoNickname}</div>
				            </c:when>
				            
				            <%-- 멘토를 아직 기다리는 경우 --%>
				            <c:otherwise>
				                <div class="div15" id="mento-status-text">멘토를 기다리고 있어요</div>
				                <div class="frame-3668">
				                    <a href="#" class="profile-link"> 
				                        <img id="mento-profile-img" class="image-47" src="${cpath}/resources/images/logo.png" alt="유저 프로필" />
				                    </a>
				                </div>
				                <div class="div15" id="mento-nickname">알고리즘뿌셔뿌셔</div>
				            </c:otherwise>
				        </c:choose>
						<div class="line-7"></div>
						<div class="div15">매치업을 주선한 방장이에요</div>
						<div class="frame-3669">
							<a href="/user/123" class="profile-link"> 
							<img class="image-47" src="${cpath}/resources/images/logo.png"
								alt="유저 프로필" />
							</a>
						</div>
						<div class="div15">알고리즘뿌셔뿌셔</div>
					</div>
				</div>
			</div>
		</div>
		<div class="bottom-area">
			<div class="line-10"></div>
			<br style="border: 0.3px solid #ccc; margin: 40px 0;">
			<div class="div11">비슷한 다른 매치업 둘러보기</div>

			<div class="frame-3770">
				<a href="/match-id=12" class="card-link">
					<div class="frame-3769">
						<div class="group-413">
							<div class="rectangle-82"></div>
							<div class="div16">마감임박🚨</div>
						</div>
						<div class="group-480">
							<div class="div17">마포구</div>
							<div class="icon-time-04">
								<img class="icon-time-clock-outlined"
									src="${cpath}/resources/images/icon_time.svg" />
							</div>
							<div class="_2025-06-13-2025-06-20">
								<span class="start-date">2025/06/13</span> <span class="dash">-</span>
								<span class="end-date">2025/06/20</span>
							</div>
							<div class="_15-00-17-002">
								<span class="start-time">15:00</span> <span class="dash">-</span>
								<span class="end-time">17:00</span>
							</div>
							<div class="icon-time-02">
								<img class="icon-time-calendar-01"
									src="${cpath}/resources/images/icon-calendar.svg" />
							</div>
							<div class="_03-05">
								<span class="now-member-cnt">3</span> <span class="dash">/</span>
								<span class="max-member-cnt">5</span>
							</div>
							<div class="_70-0002">₩70,000</div>
							<div class="div18">모집인원</div>
							<div class="icon-user-05">
								<img class="icon-maps-map-pin2"
									src="${cpath}/resources/images/icon-map-black.svg" />
							</div>
							<div class="div19">일주일 단기 알고리즘 스터디원 모집중🔥</div>
							<div class="icon-maps-04">
								<img class="icon-maps-map-pin2"
									src="${cpath}/resources/images/icon-map-black.svg" />
							</div>
							<img class="_12" src="${cpath}/resources/images/profile.svg" />
							<div class="frame-414">
								<div class="java-c2">#알고리즘 #Java #C</div>
							</div>
						</div>
					</div>
				</a> <a href="/match-id=12" class="card-link">
					<div class="frame-37702">
						<div class="group-413">
							<div class="rectangle-82"></div>
							<div class="div16">마감임박🚨</div>
						</div>
						<div class="group-480">
							<div class="div17">마포구</div>
							<div class="icon-time-04">
								<img class="icon-time-clock-outlined"
									src="${cpath}/resources/images/icon_time.svg" />
							</div>
							<div class="_2025-06-13-2025-06-20">
								<span class="start-date">2025/06/13</span> <span class="dash">-</span>
								<span class="end-date">2025/06/20</span>
							</div>
							<div class="_15-00-17-002">
								<span class="start-time">15:00</span> <span class="dash">-</span>
								<span class="end-time">17:00</span>
							</div>
							<div class="icon-time-02">
								<img class="icon-time-calendar-01"
									src="${cpath}/resources/images/icon-calendar.svg" />
							</div>
							<div class="_03-05">
								<span class="now-member-cnt">3</span> <span class="dash">/</span>
								<span class="max-member-cnt">5</span>
							</div>
							<div class="_70-0002">₩70,000</div>
							<div class="div18">모집인원</div>
							<div class="icon-user-05">
								<img class="user-users-group"
									src="${cpath}/resources/images/icon-user.svg" />
							</div>
							<div class="div19">일주일 단기 알고리즘 스터디원 모집중🔥</div>
							<div class="icon-maps-04">
								<img class="icon-maps-map-pin2"
									src="${cpath}/resources/images/icon-map-black.svg" />
							</div>
							<img class="_12" src="${cpath}/resources/images/profile.svg" />
							<div class="frame-414">
								<div class="java-c2">#알고리즘 #Java #C</div>
							</div>
						</div>
					</div>
				</a> <a href="/match-id=12" class="card-link">
					<div class="frame-3771">
						<div class="group-413">
							<div class="rectangle-82"></div>
							<div class="div16">마감임박🚨</div>
						</div>
						<div class="group-480">
							<div class="div17">마포구</div>
							<div class="icon-time-04">
								<img class="icon-time-clock-outlined"
									src="${cpath}/resources/images/icon_time.svg" />
							</div>
							<div class="_2025-06-13-2025-06-20">
								<span class="start-date">2025/06/13</span> <span class="dash">-</span>
								<span class="end-date">2025/06/20</span>
							</div>
							<div class="_15-00-17-002">
								<span class="start-time">15:00</span> <span class="dash">-</span>
								<span class="end-time">17:00</span>
							</div>
							<div class="icon-time-02">
								<img class="icon-time-calendar-01"
									src="${cpath}/resources/images/icon-calendar.svg" />
							</div>
							<div class="_03-05">
								<span class="now-member-cnt">3</span> <span class="dash">/</span>
								<span class="max-member-cnt">5</span>
							</div>
							<div class="_70-0002">₩70,000</div>
							<div class="div18">모집인원</div>
							<div class="icon-user-05">
								<img class="user-users-group"
									src="${cpath}/resources/images/icon-user.svg" />
							</div>
							<div class="div19">일주일 단기 알고리즘 스터디원 모집중🔥</div>
							<div class="icon-maps-04">
								<img class="icon-maps-map-pin2"
									src="${cpath}/resources/images/icon-map-black.svg" />
							</div>
							<img class="_12" src="${cpath}/resources/images/profile.svg" />
							<div class="frame-414">
								<div class="java-c2">#알고리즘 #Java #C</div>
							</div>
						</div>
					</div>
				</a>
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