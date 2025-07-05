<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
   import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap"%>

<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>me:mento</title>
<link rel="stylesheet" href="${cpath}/resources/css/matchupList.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainpage/notificationModal.css">
</head>
<body>

	<div class="header-fixed">
	   <%@ include file="../common/logout_header.jsp"%>
	</div>
	  <jsp:include page="../mainpage/notificationModal.jsp" />
<div class="container">
 <div class="content-wrap">
   <div class="div">
      <div class="frame-3657">
         <div class="frame-390">
            <div class="keepgoing-filter-and-make">
                 <div class="detail-select">
                     <div class="detail-select-li">
                         <select name="regionGroup" class="filter-select" onchange="applyFilters()">
                             <option value="">   지역 (전체)   </option>
                         <c:forEach var="region" items="${regionGroups}">
                            <option value="${region}" ${param.regionGroup == region ? 'selected' : ''}>${region}</option>
                         </c:forEach>
                         </select>
                     </div>
                     <div class="detail-select-li2">
                         <select name="categoryId" class="filter-select" onchange="applyFilters()">
                             <option value="">   학습유형 (전체)   </option>
                             <c:forEach var="cat" items="${categories}">
                            <option value="${cat.categoryId}" ${param.categoryId == cat.categoryId ? 'selected' : ''}>${cat.categoryName}</option>
                         </c:forEach>
                         </select>
                     </div>
                     <div class="detail-select-li">
                          <select name="selectedDays" class="filter-select" onchange="applyFilters()">
                             <option value="">   요일 (전체)   </option>
                             <option value="MON" ${param.selectedDays == 'MON' ? 'selected' : ''}>월요일</option>
                             <option value="TUE" ${param.selectedDays == 'TUE' ? 'selected' : ''}>화요일</option>
                             <option value="WED" ${param.selectedDays == 'WED' ? 'selected' : ''}>수요일</option>
                             <option value="THU" ${param.selectedDays == 'THU' ? 'selected' : ''}>목요일</option>
                             <option value="FRI" ${param.selectedDays == 'FRI' ? 'selected' : ''}>금요일</option>
                             <option value="SAT" ${param.selectedDays == 'SAT' ? 'selected' : ''}>토요일</option>
                             <option value="SUN" ${param.selectedDays == 'SUN' ? 'selected' : ''}>일요일</option>
                         </select>
                     </div>
                     <div class="detail-select-li">
                         <select name="languageId" class="filter-select" onchange="applyFilters()">
                             <option value="">   언어 (전체)   </option>
                             <c:forEach var="lang" items="${languages}">
                            <option value="${lang.languageId}" ${param.languageId == lang.languageId ? 'selected' : ''}>${lang.languageName}</option>
                         </c:forEach>
                         </select>
                     </div>
                 </div>
            </div>
            <button class="group-389" type="button"
               onclick="location.href='${pageContext.request.contextPath}/matchup/createMatchup'">
               새로운 매치업 작성하기</button>
         </div>
         <div class="frame-3694">
            <c:forEach var="matchup" items="${matchupList}">
               <div class="matchup-cardview" onclick="location.href='${cpath}/matchup/matchupDetail?id=${matchup.matchupId}'">
                  <div class="rectangle-48"></div>
                  <div class="div3">${matchup.regionGroup}</div>
                  <div class="icon-time-04">
                     <img class="icon-time-clock-outlined"
                        src="${cpath}/resources/images/icon_time.svg" />
                  </div>
                  <div class="_2025-06-13-2025-06-20">${matchup.formattedStartDate}-
                     ${matchup.formattedEndDate}</div>
                  <div class="_15-00-17-00">${matchup.formattedStartTime}-
                     ${matchup.formattedEndTime}</div>
                  <div class="icon-time-02">
                     <img class="icon-time-calendar-01"
                        src="${cpath}/resources/images/icon-calendar.svg" />
                  </div>
                  <div class="_03-05">${matchup.formattedMemberCount}</div>
                  <div class="_70-000">₩${matchup.formattedPrice}</div>
                  <div class="div4">모집인원</div>
                  <div class="icon-user-05">
                     <img class="user-users-group"
                        src="${cpath}/resources/images/icon-user.svg" />
                  </div>
                  <div class="div5">${matchup.title}</div>
                  <div class="icon-maps-04">
                     <img class="icon-maps-map-pin"
                        src="${cpath}/resources/images/icon-map-black.svg" />
                  </div>
                  <img class="_1" src="${cpath}/resources/images/profile.svg" />
                  <div class="group-414">
                     <div class="java-c">#${matchup.languageName} #${matchup.categoryName}</div>
                  </div>
                  <div class="badges-wrapper">
                      <c:if test="${not empty matchup.recruit}">
                          <c:choose>
                              <c:when test="${matchup.recruit == '마감임박'}">
                                  <div class="badge badge-urgent">${matchup.recruit}</div>
                              </c:when>
                              <c:when test="${matchup.recruit == '모집완료'}">
                                  <div class="badge badge-completed">${matchup.recruit}</div>
                              </c:when>
                              <c:otherwise>
                                  <div class="badge badge-recruiting">${matchup.recruit}</div>
                              </c:otherwise>
                          </c:choose>
                      </c:if>
                      <c:if test="${matchup.hasMento}">
						<c:choose>
						  <c:when test="${matchup.mentoId != null && matchup.mentoId > 0}">
						      <div class="badge badge-mentor-completed">멘토 선정 완료</div>
						  </c:when>
						  <c:otherwise>
						      <div class="badge badge-mentor">멘토 모집중</div>
						  </c:otherwise>
						</c:choose>
                      </c:if>
                  </div>
               </div>
            </c:forEach>
         </div>
         <div class="pagemove-list">
		    <c:if test="${paginationResult.pagination.page > 1}">
		        <div class="page-back-btn" onclick="applyFilters(${paginationResult.pagination.page - 1})">
		            <img class="vuesax-linear-arrow-left" src="${cpath}/resources/images/arrow-left.svg" />
		        </div>
		    </c:if>
		
		    <c:forEach var="page" begin="${paginationResult.startPage}" end="${paginationResult.endPage}">
		        <div class="${page == paginationResult.pagination.page ? 'page-li-btn-seleted-page' : 'page-li-btn'}" onclick="applyFilters(${page})">
		            <div class="${page == paginationResult.pagination.page ? 'd-2-b-12-white' : 'd-2-r-12-black'}">${page}</div>
		        </div>
		    </c:forEach>
		
		    <c:if test="${paginationResult.pagination.page < paginationResult.totalPageCount}">
		        <div class="page-after-btn" onclick="applyFilters(${paginationResult.pagination.page + 1})">
		            <img class="vuesax-linear-arrow-right" src="${cpath}/resources/images/arrow-right.svg" />
		        </div>
		    </c:if>
		 </div>
      </div>
   </div>
   </div>
</div>
   
<script>
   const cpath = '${cpath}';
</script>

<script src="${cpath}/resources/js/matchup/matchupList.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/js/notification.js"></script>
</body>
</html>