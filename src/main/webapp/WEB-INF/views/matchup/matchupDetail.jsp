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
						<div
							class="info-tag mento <c:if test='${matchupDetail.mentoId > 0}'>completed</c:if>">
							${matchupDetail.mentoId > 0 ? '멘토 선정 완료' : '멘토 모집중'}</div>
					</c:if>
					<div class="info-tag category">#${matchupDetail.languageName}
						#${matchupDetail.categoryName}</div>
				</div>
				<h2 class="matchup-title">${matchupDetail.title}</h2>
				<div class="info-grid">
					<div class="info-item">
						<span class="info-item-title">현재 모집인원</span> <span
							id="current-member-count" class="info-item-content">${matchupDetail.formattedMemberCount}</span>
					</div>
					<div class="info-item">
						<span class="info-item-title">모집 시간</span> <span
							class="info-item-content">${matchupDetail.formattedStartTime} -
							${matchupDetail.formattedEndTime}</span>
					</div>
					<div class="info-item">
						<span class="info-item-title">스터디 횟수</span> <span
							class="info-item-content">${matchupDetail.totalCount}회</span>
					</div>
				</div>
				<div class="price-and-buttons">
					<div class="price-text">₩${matchupDetail.formattedPrice}</div>
					<div class="button-group">
						<c:if
							test="${matchupDetail.hasMento && (matchupDetail.mentoId == null || matchupDetail.mentoId == 0)}">
							<c:choose>
								<c:when test="${matchupDetail.mentoApplicationPending}">
									<%-- 이미 신청한 경우: '멘토 신청 중' 버튼을 비활성화 상태로 보여줌 --%>
									<button class="custom-btn danger pending" disabled>멘토
										신청 중</button>
								</c:when>
								<c:otherwise>
									<%-- 아직 신청하지 않은 경우: '멘토 신청하기' 버튼을 보여줌 --%>
									<button class="custom-btn danger" id="mento-apply-btn"
										data-matchup-id="${matchupDetail.matchupId}">멘토 신청하기</button>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:choose>
							<%-- 조건 1: 내가 이 매치업의 방장인 경우 --%>
							<c:when
								test="${sessionScope.loginUser.memberId == matchupDetail.leaderId}">
								<button class="custom-btn" disabled>방장</button>
							</c:when>

							<%-- 조건 2: 내가 이미 멘티로 참여 신청한 경우 --%>
							<c:when test="${matchupDetail.alreadyAppliedAsMenti}">
								<button class="custom-btn" disabled>참여 신청 완료</button>
							</c:when>

							<%-- 조건 3: 모집 인원이 마감된 경우 --%>
							<c:when
								test="${matchupDetail.matchupCount >= matchupDetail.maxMember}">
								<button class="custom-btn" disabled>모집마감</button>
							</c:when>

							<%-- 그 외: 신청 가능 --%>
							<c:otherwise>
								<button class="custom-btn" id="applyMentiBtn" type="button"
									data-matchup-id="${matchupDetail.matchupId}">참여 신청하기</button>
							</c:otherwise>
						</c:choose>
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
						
						    <%-- 첫 번째 항목 --%>
						    <div class="type-item">
						        <div class="type-circle">
						            <c:set var="typeName" value="${matchupDetail.matchTypeFirstName}" />
						            <c:choose>
							                <c:when test="${typeName == '타닥냥'}"><img src="${cpath}/resources/images/mypage/spark-test/tadakNyang-icon.png" alt="타닥냥" class="type-image"></c:when>
							                <c:when test="${typeName == '코취치'}"><img src="${cpath}/resources/images/mypage/spark-test/coachChee-icon.png" alt="코취치" class="type-image"></c:when>
							                <c:when test="${typeName == '깃요미'}"><img src="${cpath}/resources/images/mypage/spark-test/gitYomi-icon.png" alt="깃요미" class="type-image"></c:when>
							                <c:when test="${typeName == '컴정이'}"><img src="${cpath}/resources/images/mypage/spark-test/comZung-icon.png" alt="컴정이" class="type-image"></c:when>
							                <c:when test="${typeName == '해피빈'}"><img src="${cpath}/resources/images/mypage/spark-test/happyBeen-icon.png" alt="해피빈" class="type-image"></c:when>
							                <c:when test="${typeName == '슬로우곰'}"><img src="${cpath}/resources/images/mypage/spark-test/slowGom-icon.png" alt="슬로우곰" class="type-image"></c:when>
						                <c:otherwise><div class="circle-emoji">🔥</div></c:otherwise>
						            </c:choose>
						            <div class="circle-text">${typeName}</div>
						        </div>
						    </div>
						
						    <%-- 두 번째 항목 --%>
						    <div class="type-item">
						        <div class="type-circle">
						            <c:set var="typeName" value="${matchupDetail.matchTypeSecondName}" />
						            <c:choose>
							                <c:when test="${typeName == '타닥냥'}"><img src="${cpath}/resources/images/mypage/spark-test/tadakNyang-icon.png" alt="타닥냥" class="type-image"></c:when>
							                <c:when test="${typeName == '코취치'}"><img src="${cpath}/resources/images/mypage/spark-test/coachChee-icon.png" alt="코취치" class="type-image"></c:when>
							                <c:when test="${typeName == '깃요미'}"><img src="${cpath}/resources/images/mypage/spark-test/gitYomi-icon.png" alt="깃요미" class="type-image"></c:when>
							                <c:when test="${typeName == '컴정이'}"><img src="${cpath}/resources/images/mypage/spark-test/comZung-icon.png" alt="컴정이" class="type-image"></c:when>
							                <c:when test="${typeName == '해피빈'}"><img src="${cpath}/resources/images/mypage/spark-test/happyBeen-icon.png" alt="해피빈" class="type-image"></c:when>
							                <c:when test="${typeName == '슬로우곰'}"><img src="${cpath}/resources/images/mypage/spark-test/slowGom-icon.png" alt="슬로우곰" class="type-image"></c:when>
						                <c:otherwise><div class="circle-emoji">🎯</div></c:otherwise>
						            </c:choose>
						            <div class="circle-text">${typeName}</div>
						        </div>
						    </div>
						
						    <%-- 세 번째 항목 --%>
						    <div class="type-item">
						        <div class="type-circle">
						            <c:set var="typeName" value="${matchupDetail.matchTypeThirdName}" />
						            <c:choose>
							                <c:when test="${typeName == '타닥냥'}"><img src="${cpath}/resources/images/mypage/spark-test/tadakNyang-icon.png" alt="타닥냥" class="type-image"></c:when>
							                <c:when test="${typeName == '코취치'}"><img src="${cpath}/resources/images/mypage/spark-test/coachChee-icon.png" alt="코취치" class="type-image"></c:when>
							                <c:when test="${typeName == '깃요미'}"><img src="${cpath}/resources/images/mypage/spark-test/gitYomi-icon.png" alt="깃요미" class="type-image"></c:when>
							                <c:when test="${typeName == '컴정이'}"><img src="${cpath}/resources/images/mypage/spark-test/comZung-icon.png" alt="컴정이" class="type-image"></c:when>
							                <c:when test="${typeName == '해피빈'}"><img src="${cpath}/resources/images/mypage/spark-test/happyBeen-icon.png" alt="해피빈" class="type-image"></c:when>
							                <c:when test="${typeName == '슬로우곰'}"><img src="${cpath}/resources/images/mypage/spark-test/slowGom-icon.png" alt="슬로우곰" class="type-image"></c:when>
						                <c:otherwise><div class="circle-emoji">🤝</div></c:otherwise>
						            </c:choose>
						            <div class="circle-text">${typeName}</div>
						        </div>
						    </div>
						
						</div>
					</div>
				</div>
				<div class="middle-area-right">
					<div class="section-box">
						<div class="location-info">
							<img id="pin-icon"
								src="${cpath}/resources/images/icon-map-red.svg" alt="위치 아이콘" />
							<span>${matchupDetail.formattedRegion}</span>
						</div>
						<div id="map" class="map-placeholder"></div>

					</div>
					<div class="section-box profile-box">
						<div class="profile-group">
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
									<c:when test="${matchupDetail.mentoId != null && matchupDetail.mentoId > 0}">
										<div class="profile-title">멘토가 선정되었어요!</div>
										<a href="/user/${matchupDetail.mentoId}" class="profile-link"><img
											class="profile-img"
											src="${not empty matchupDetail.mentoProfileImageUrl ? matchupDetail.mentoProfileImageUrl : cpath.concat('/resources/images/memento-logo.png')}"
											alt="멘토 프로필" /></a>
										<div class="profile-nickname">${matchupDetail.mentoNickname}</div>
									</c:when>
									<c:otherwise>
										<div class="profile-title">멘토를 기다리고 있어요</div>
										<a href="#" class="profile-link"><img class="profile-img"
											src="${cpath}/resources/images/memento-logo.png" alt="기본 프로필" /></a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
						<div class="divider"></div>
						<div class="profile-group">
						<div class="profile-title">매치업을 주선한 방장이에요</div>
						<div class="profile-circle-wrapper">
							<a href="${cpath}/user/${matchupDetail.leaderId}"
								class="profile-link"> <img class="profile-img"
								src="${not empty matchupDetail.leaderProfileImageUrl ? matchupDetail.leaderProfileImageUrl : cpath.concat('/resources/images/memento-logo.png')}"
								alt="방장 프로필" />
							</a>
						</div>
						<div class="profile-nickname">${matchupDetail.leaderNickname}</div>
					</div>
				</div>
			</div>
			</div>

			<%-- 하단 비슷한 매치업 카드 --%>
			<div class="bottom-area">
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
	<script>
      const loggedInMemberId = "${sessionScope.loginUser.memberId}";
      const cpath = "${cpath}";
      const maxMember = ${matchupDetail.maxMember};
   
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
          
          const applyMentiBtn = document.getElementById('applyMentiBtn');
          if(applyMentiBtn) {
              applyMentiBtn.addEventListener('click', function() {
                  // 1. 로그인 여부 확인
                  if (!loggedInMemberId) {
                      alert('로그인이 필요한 기능입니다.');
                      return;
                  }

                  // 2. 신청 의사 확인
                  if (!confirm('해당 매치업에 참여 신청하시겠습니까?')) {
                      return;
                  }

                  // 3. 서버에 전송할 데이터 준비
                  const matchupId = this.dataset.matchupId;
                  const requestData = {
                      matchupId: parseInt(matchupId)
                  };

                  // 4. fetch API로 서버에 신청 요청
                  fetch(cpath + '/matchup/applyMentiMatchup', {
                      method: 'POST',
                      headers: {
                          'Content-Type': 'application/json'
                      },
                      body: JSON.stringify(requestData)
                  })
                  .then(response => response.json())
                  .then(data => {
                	    if(data.result && data.result.message) {
                	        alert(data.result.message);
                	    } else {
                	        alert(data.message);
                	    }

                	    if (data.code === 1000) {
                	        const clickedButton = document.getElementById('applyMentiBtn');
                	        if (clickedButton) {
                	            clickedButton.textContent = '참여 신청 완료';
                	            clickedButton.disabled = true;
                	            clickedButton.id = '';
                	        }

                	        const countSpan = document.getElementById('current-member-count');
                	        const newMemberCount = data.result.newMemberCount;
                	        
                	        if(countSpan && newMemberCount) {
                	            countSpan.textContent = String(newMemberCount).padStart(2, '0') + '/' + String(maxMember).padStart(2, '0');
                	        }
                	    }
                  })
                  .catch(error => {
                      console.error('Error:', error);
                      alert('요청 처리 중 오류가 발생했습니다.');
                  });
              });
          }
      });
   </script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=508d0978b8a40544a729f282b6187bd0&libraries=services&autoload=false"></script>
<script>
    kakao.maps.load(function() {
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
        geocoder.addressSearch(address, function(result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
                
                const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 지도 옵션 설정
                const mapOption = {
                    center: coords, // 검색된 좌표를 지도의 중심으로 설정
                    level: 3 // 지도의 확대 레벨
                };

                // 지도를 생성합니다    
                const map = new kakao.maps.Map(mapContainer, mapOption); 

                // 결과 좌표에 마커를 생성하고 표시합니다
                const marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

            } else {
                // 주소 검색에 실패했을 경우, 지도 컨테이너에 메시지를 표시합니다.
                console.warn('주소 검색에 실패했습니다:', status);
                mapContainer.innerHTML = '<div style="text-align:center; padding-top: 70px; color: #888;">정확한 위치를 찾을 수 없어요.</div>';
            }
        });
    });
</script>
</body>
</html>