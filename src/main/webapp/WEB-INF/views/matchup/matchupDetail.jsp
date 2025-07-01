<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>me:mento</title>
<link rel="stylesheet" href="${cpath}/resources/css/matchupDetail.css">
<link rel="stylesheet" href="${cpath}/resources/css/vars.css">
</head>
<body>
<%@ include file="../common/logout_header.jsp"%>
<div class = "container">
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
            <img class="line" src="${cpath}/resources/images/line0.svg" />
			<div class="group-478">
			  <div class="_70-000">₩${matchupDetail.formattedPrice}</div>
			  <div class="button-area">
			  	<c:if test="${matchupDetail.hasMento && (matchupDetail.mentoId == null || matchupDetail.mentoId == 0)}">
			        <c:choose>
			            <c:when test="${matchupDetail.mentoApplicationPending}">
			                <button class="mento-apply-btn pending" disabled>멘토 신청 중</button>
			            </c:when>
			            <c:otherwise>
			                <button class="mento-apply-btn" id="mento-apply-btn" type="button" data-matchup-id="${matchupDetail.matchupId}">멘토 신청하기</button>
			            </c:otherwise>
			        </c:choose>
			    </c:if>
			    <button class="apply-btn" id="apply-btn" type="button">신청하기</button>
			  </div>
			</div>
         </div>
      </div>
      <div class="middle-area">
         <div class="frame-3767">
            <div class="middle-area-left">
               <div class="frame-3764">
                  <div class="div8">멘토링 소개</div>
                  <div class="frame-3665">
                     <div class="_1-1-2-3-1-3-or-1">
                        <span class="_1-1-2-3-1-3-or-1-span">${matchupDetail.content} 
                        </span>
                     </div>
                  </div>
                  <div class="div9">✋ 이런 분과 함께하고 싶어요</div>
                  <div class="frame-480">
                     <div class="group-479">
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
                  <div class="div13">매치업을 주선한 방장이에요</div>
                  <div class="frame-3669">
                     <a href="/user/123" class="profile-link"> <img
                        class="image-47" src="${cpath}/resources/images/logo.png"
                        alt="유저 프로필" />
                     </a>
                  </div>
                  <div class="div13">알고리즘뿌셔뿌셔</div>
               </div>
            </div>
         </div>
      </div>
      <div class="bottom-area">
         <div class="line-10"></div>
         <div class="div9">비슷한 다른 매치업 둘러보기</div>
         <div class="frame-3770">
            <a href="${cpath}/matchupDetail" class="card-link">
               <div class="frame-3769">
                  <div class="group-413">
                     <div class="rectangle-82"></div>
                     <div class="div14">마감임박🚨</div>
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
                     <div class="div16">모집인원</div>
                     <div class="icon-user-05">
                        <img class="user-users-group"
                           src="${cpath}/resources/images/icon-user.svg" />
                     </div>
                     <div class="div17">일주일 단기 알고리즘 스터디원 모집중🔥</div>
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
            </a> <a href="${cpath}/matchupDetail" class="card-link">
               <div class="frame-37702">
                  <div class="group-413">
                     <div class="rectangle-82"></div>
                     <div class="div14">마감임박🚨</div>
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
                     <div class="div16">모집인원</div>
                     <div class="icon-user-05">
                        <img class="user-users-group"
                           src="${cpath}/resources/images/icon-user.svg" />
                     </div>
                     <div class="div17">일주일 단기 알고리즘 스터디원 모집중🔥</div>
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
            </a> <a href="${cpath}/matchupDetail" class="card-link">
               <div class="frame-3771">
                  <div class="group-413">
                     <div class="rectangle-82"></div>
                     <div class="div14">마감임박🚨</div>
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
                     <div class="div16">모집인원</div>
                     <div class="icon-user-05">
                        <img class="user-users-group"
                           src="${cpath}/resources/images/icon-user.svg" />
                     </div>
                     <div class="div17">일주일 단기 알고리즘 스터디원 모집중🔥</div>
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
      const loggedInMemberId = "${sessionScope.loginUser.memberId}"; 
   
      document.addEventListener('DOMContentLoaded', function() {
         
    	  const mentoApplyBtn = document.getElementById('mento-apply-btn');
          if (mentoApplyBtn) {
              mentoApplyBtn.addEventListener('click', function() {
                  
                  if (!loggedInMemberId) {
                      alert('로그인이 필요한 기능입니다.');

                      return;
                  }

                  if (!confirm('멘토로 신청하시겠습니까?')) {
                      return;
                  }

                  const matchupId = this.dataset.matchupId;
                  const data = {
                      memberId: loggedInMemberId,
                      matchupId: matchupId
                  };

                  fetch('${cpath}/matchup/applyMentoMatchup', {
                      method: 'POST',
                      headers: {
                          'Content-Type': 'application/json',
                      },
                      body: JSON.stringify(data)
                  })
                  .then(response => response.json())
                  .then(result => {
                      if (result.code === 1000) { 
                          this.textContent = '멘토 신청 중';
                          this.disabled = true;
                          this.classList.add('pending');
                          this.id = '';
                          alert('멘토 신청이 완료되었습니다.');

                      } else {
                          alert(result.message || '신청에 실패했습니다.');
                      }
                  })
                  .catch(error => {
                      console.error('Error:', error);
                      alert('오류가 발생했습니다. 다시 시도해주세요.');
                  });
              });
          }
          
    	  document.getElementById('apply-btn').addEventListener('click',
                  function() {
                     alert('신청하기 버튼이 클릭되었습니다!');
                  });
      });
   </script>
</body>
</html>