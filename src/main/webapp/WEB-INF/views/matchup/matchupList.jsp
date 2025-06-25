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
<link rel="stylesheet" href="${cpath}/resources/css/vars.css">
</head>
<body>
   <div class="div">
      <div class="frame-3657">
         <div class="frame-390">
            <div class="keepgoing-filter-and-make">
                 <div class="detail-select">
                     <div class="detail-select-li">
                         <select name="region_group" class="filter-select" onchange="applyFilters()">
                             <option value="">-- 지역 (전체) --</option>
                             <option value="서울" ${param.region_group == '서울' ? 'selected' : ''}>서울</option>
                             <option value="부산" ${param.region_group == '부산' ? 'selected' : ''}>부산</option>
                             <option value="대전" ${param.region_group == '대전' ? 'selected' : ''}>대전</option>
                             <option value="대구" ${param.region_group == '대구' ? 'selected' : ''}>대구</option>
                         </select>
                     </div>
                     <div class="detail-select-li2">
                         <select name="category_id" class="filter-select" onchange="applyFilters()">
                             <option value="">-- 학습유형 (전체) --</option>
                             <option value="1" ${param.category_id == '1' ? 'selected' : ''}>면접준비</option>
                             <option value="2" ${param.category_id == '2' ? 'selected' : ''}>운영체제</option>
                             <option value="3" ${param.category_id == '3' ? 'selected' : ''}>데이터베이스</option>
                             <option value="4" ${param.category_id == '4' ? 'selected' : ''}>네트워크</option>
                             <option value="5" ${param.category_id == '5' ? 'selected' : ''}>자료구조</option>
                             <option value="6" ${param.category_id == '6' ? 'selected' : ''}>알고리즘</option>
                             <option value="7" ${param.category_id == '7' ? 'selected' : ''}>자격증</option>
                         </select>
                     </div>
                     <div class="detail-select-li">
                          <select name="selected_days" class="filter-select" onchange="applyFilters()">
                             <option value="">-- 요일 (전체) --</option>
                             <option value="MON" ${param.selected_days == 'MON' ? 'selected' : ''}>월요일</option>
                             <option value="TUE" ${param.selected_days == 'TUE' ? 'selected' : ''}>화요일</option>
                             <option value="WED" ${param.selected_days == 'WED' ? 'selected' : ''}>수요일</option>
                             <option value="THU" ${param.selected_days == 'THU' ? 'selected' : ''}>목요일</option>
                             <option value="FRI" ${param.selected_days == 'FRI' ? 'selected' : ''}>금요일</option>
                             <option value="SAT" ${param.selected_days == 'SAT' ? 'selected' : ''}>토요일</option>
                             <option value="SUN" ${param.selected_days == 'SUN' ? 'selected' : ''}>일요일</option>
                         </select>
                     </div>
                     <div class="detail-select-li">
                         <select name="language_id" class="filter-select" onchange="applyFilters()">
                             <option value="">-- 언어 (전체) --</option>
                             <option value="1" ${param.language_id == '1' ? 'selected' : ''}>Python</option>
                             <option value="2" ${param.language_id == '2' ? 'selected' : ''}>Java</option>
                             <option value="3" ${param.language_id == '3' ? 'selected' : ''}>C++</option>
                             <option value="4" ${param.language_id == '4' ? 'selected' : ''}>C#</option>
                             <option value="5" ${param.language_id == '5' ? 'selected' : ''}>C</option>
                             <option value="6" ${param.language_id == '6' ? 'selected' : ''}>HTML/CSS</option>
                             <option value="7" ${param.language_id == '7' ? 'selected' : ''}>JavaScript</option>
                         </select>
                     </div>
                 </div>
            </div>
            <button class="group-389" type="button"
               onclick="location.href='${pageContext.request.contextPath}/createMatchup'">
               새로운 매치업 작성하기</button>
         </div>
         <div class="frame-3694">
            <c:forEach var="matchup" items="${matchupList}">
               <div class="matchup-cardview" onclick="location.href='${cpath}/matchup/matchupDetail?id=${matchup.matchup_id}'">
                  <div class="rectangle-48"></div>
                  <div class="rectangle-210"></div>
                  <div class="div3">${matchup.region_group}</div>
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
                  <div class="rectangle-60"></div>
                  <div class="icon-maps-04">
                     <img class="icon-maps-map-pin"
                        src="${cpath}/resources/images/icon-map-black.svg" />
                  </div>
                  <img class="_1" src="${cpath}/resources/images/profile.svg" />
                  <div class="group-414">
                     <div class="rectangle-209"></div>
                     <div class="java-c">${matchup.tags}</div>
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
                      <c:if test="${!matchup.has_mento}">
                          <div class="badge badge-mentor">멘토모집중</div>
                      </c:if>
                  </div>
               </div>
            </c:forEach>
         </div>
         <div class="pagemove-list">
            <div class="page-back-btn">
               <img class="vuesax-linear-arrow-left"
                  src="${cpath}/resources/images/arrow-left.svg" />
            </div>
            <div class="page-li-btn-seleted-page">
               <div class="d-2-b-12-white">1</div>
            </div>
            <div class="page-li-btn">
               <div class="d-2-r-12-black">2</div>
            </div>
            <div class="page-li-btn">
               <div class="d-2-r-12-black">3</div>
            </div>
            <div class="page-li-btn">
               <div class="d-2-r-12-black">4</div>
            </div>
            <div class="page-li-btn">
               <div class="d-2-r-12-black">5</div>
            </div>
            <div class="page-li-btn">
               <div class="d-2-r-12-black">6</div>
            </div>
            <div class="page-li-btn">
               <div class="d-2-r-12-black">7</div>
            </div>
            <div class="page-li-btn">
               <div class="d-2-r-12-black">8</div>
            </div>
            <div class="page-li-btn">
               <div class="d-2-r-12-black">9</div>
            </div>
            <div class="page-after-btn">
               <img class="vuesax-linear-arrow-right"
                  src="${cpath}/resources/images/arrow-right.svg" />
            </div>
         </div>
      </div>
   </div>
<script>
   const cpath = '${cpath}';
</script>
<script src="${cpath}/resources/js/matchup/matchupList.js"></script>
</body>
</html>