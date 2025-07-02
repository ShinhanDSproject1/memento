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
    <div class="container">
        <div class="main-content">
            <%-- 상단 정보 영역 --%>
            <div class="top-info">
                <div class="info-tags">
                    <c:if test="${matchupDetail.hasMento}">
                        <div class="info-tag mento <c:if test='${matchupDetail.mentoId > 0}'>completed</c:if>">
                            ${matchupDetail.mentoId > 0 ? '멘토 선정 완료' : '멘토 모집중'}
                        </div>
                    </c:if>
                    <div class="info-tag category">#${matchupDetail.languageName} #${matchupDetail.categoryName}</div>
                </div>
                <h2 class="matchup-title">${matchupDetail.title}</h2>
                <div class="info-grid">
                    <div class="info-item">
                        <span class="info-item-title">현재 모집인원</span>
                        <span class="info-item-content">${matchupDetail.formattedMemberCount}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-item-title">모집 시간</span>
                        <span class="info-item-content">${matchupDetail.formattedStartTime} - ${matchupDetail.formattedEndTime}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-item-title">스터디 횟수</span>
                        <span class="info-item-content">${matchupDetail.totalCount}회</span>
                    </div>
                </div>
                <div class="price-and-buttons">
                    <div class="price-text">₩${matchupDetail.formattedPrice}</div>
                    <div class="button-group">
                        <c:if test="${matchupDetail.hasMento && (matchupDetail.mentoId == null || matchupDetail.mentoId == 0)}">
                             <button class="custom-btn danger" id="mento-apply-btn" data-matchup-id="${matchupDetail.matchupId}">멘토 신청하기</button>
                        </c:if>
                        <button class="custom-btn" id="apply-btn">신청하기</button>
                    </div>
                </div>
            </div>

            <%-- 중간 콘텐츠 영역 --%>
            <div class="middle-area">
                <div class="middle-area-left">
                    <div class="section-box">
                        <h3 class="section-title">💡 멘토링 소개</h3>
                        <div class="section-content">${matchupDetail.content}</div>
                        <h3 class="section-title">✋ 이런 분과 함께하고 싶어요</h3>
                        <div class="type-circle-wrapper">
                        	<div class="type-item">
                        		<div class="type-circle">
                        			<div class="circle-emoji">🔥</div>
                            	  	<div class="circle-text">${matchupDetail.matchTypeFirstName}</div>
                            	</div>
                            </div>
                            <div class="type-item">
                            	<div class="type-circle">
                            	  <div class="circle-emoji">🎯</div>
                             	  <div class="circle-text">${matchupDetail.matchTypeSecondName}</div>
                            	</div><!--  -->
                            </div>
                            <div class="type-item">
                               <div class="type-circle">
                               	<div class="circle-emoji">🤝</div>
                             	<div class="circle-text">${matchupDetail.matchTypeThirdName}</div>
                        </div>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="middle-area-right">
                    <div class="section-box">
                        <div class="location-info">
                            <img src="${cpath}/resources/images/icon-map-red.svg" alt="위치 아이콘" />
                            <span>${matchupDetail.formattedRegion}</span>
                        </div>
                        <div class="map-placeholder"></div>
                    </div>
                    <div class="section-box profile-box">
                         <c:choose>
                            <c:when test="${matchupDetail.mentoId != null && matchupDetail.mentoId > 0}">
                                <div class="profile-title">멘토가 선정되었어요!</div>
                                <a href="/user/${matchupDetail.mentoId}" class="profile-link"><img class="profile-img" src="${not empty matchupDetail.mentoProfileImageUrl ? matchupDetail.mentoProfileImageUrl : cpath.concat('/resources/images/member-icon.png')}" alt="멘토 프로필" /></a>
                                <div class="profile-nickname">${matchupDetail.mentoNickname}</div>
                            </c:when>
                            <c:otherwise>
                                <div class="profile-title">멘토를 기다리고 있어요</div>
                                <a href="#" class="profile-link"><img class="profile-img" src="${cpath}/resources/images/logo.png" alt="기본 프로필" /></a>
                            </c:otherwise>
                        </c:choose>
                        <div class="divider"></div>
                        <div class="profile-title">매치업을 주선한 방장이에요</div>
                        <a href="/user/123" class="profile-link"><img class="profile-img" src="${cpath}/resources/images/logo.png" alt="방장 프로필" /></a>
                        <div class="profile-nickname">알고리즘뿌셔뿌셔</div>
                    </div>
                </div>
            </div>

            <%-- 하단 비슷한 매치업 카드 --%>
            <div class="bottom-area">
                 <div class="divider"></div>
                <h3 class="section-title">비슷한 다른 매치업 둘러보기</h3>
                <div class="card-list-container">
                    <%-- 카드 1 --%>
                    <a href="#" class="card-link">
                        <div class="matchup-card">
                            <div class="card-main-content">
                                <div class="card-header"><div class="card-location"><img src="${cpath}/resources/images/icon-map-black.svg" alt="위치"/><span>강남구</span></div><div class="card-badge">마감임박🚨</div></div>
                                <h3 class="card-title">React 심화 프로젝트 스터디</h3>
                                <div class="card-details">
                                    <div class="detail-item"><img src="${cpath}/resources/images/icon-calendar.svg" alt="날짜"/><span>2025/06/13 - 2025/06/20</span></div>
                                    <div class="detail-item"><img src="${cpath}/resources/images/icon_time.svg" alt="시간"/><span>15:00 - 17:00</span></div>
                                    <div class="detail-item"><img src="${cpath}/resources/images/icon-user.svg" alt="인원"/><span>모집인원 2/4</span></div>
                                </div>
                            </div>
                            <div class="card-side-content"><img class="profile-image" src="${cpath}/resources/images/profile.svg" alt="프로필"/></div>
                            <div class="card-footer"><div class="card-tags">#React #프로젝트</div><div class="card-price">₩80,000</div></div>
                        </div>
                    </a>
                    <%-- 카드 2 --%>
                    <a href="#" class="card-link">
                        <div class="matchup-card">
                            <div class="card-main-content">
                                <div class="card-header"><div class="card-location"><img src="${cpath}/resources/images/icon-map-black.svg" alt="위치"/><span>서초구</span></div><div class="card-badge">마감임박🚨</div></div>
                                <h3 class="card-title">Python 데이터 분석 스터디</h3>
                                <div class="card-details">
                                    <div class="detail-item"><img src="${cpath}/resources/images/icon-calendar.svg" alt="날짜"/><span>2025/06/15 - 2025/06/22</span></div>
                                    <div class="detail-item"><img src="${cpath}/resources/images/icon_time.svg" alt="시간"/><span>19:00 - 21:00</span></div>
                                    <div class="detail-item"><img src="${cpath}/resources/images/icon-user.svg" alt="인원"/><span>모집인원 3/5</span></div>
                                </div>
                            </div>
                            <div class="card-side-content"><img class="profile-image" src="${cpath}/resources/images/profile.svg" alt="프로필"/></div>
                            <div class="card-footer"><div class="card-tags">#Python #데이터분석</div><div class="card-price">₩90,000</div></div>
                        </div>
                    </a>
                    <%-- 카드 3 --%>
                    <a href="#" class="card-link">
                        <div class="matchup-card">
                             <div class="card-main-content">
                                <div class="card-header"><div class="card-location"><img src="${cpath}/resources/images/icon-map-black.svg" alt="위치"/><span>홍대구</span></div><div class="card-badge new">신규등록🔥</div></div>
                                <h3 class="card-title">JavaScript 심화 스터디</h3>
                                <div class="card-details">
                                    <div class="detail-item"><img src="${cpath}/resources/images/icon-calendar.svg" alt="날짜"/><span>2025/06/20 - 2025/06/27</span></div>
                                    <div class="detail-item"><img src="${cpath}/resources/images/icon_time.svg" alt="시간"/><span>14:00 - 16:00</span></div>
                                    <div class="detail-item"><img src="${cpath}/resources/images/icon-user.svg" alt="인원"/><span>모집인원 1/4</span></div>
                                </div>
                            </div>
                            <div class="card-side-content"><img class="profile-image" src="${cpath}/resources/images/profile.svg" alt="프로필"/></div>
                            <div class="card-footer"><div class="card-tags">#JavaScript</div><div class="card-price">₩75,000</div></div>
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