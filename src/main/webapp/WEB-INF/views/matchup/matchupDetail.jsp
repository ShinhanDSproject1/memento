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
	<div class="div">
		<div class="top-bar">
			<div class="top-bar-tag">
			    <c:if test="${!matchupDetail.hasMento}">
			        멘토 모집중
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
					<div class="_1">${matchupDetail.count}회</div>
				</div>
				<img class="line" src="${cpath}/resources/images/line0.svg" />
				<div class="group-478">
					<div class="_70-000">₩${matchupDetail.formattedPrice}</div>
		<c:if test="${matchupDetail.count < matchupDetail.maxMember}">
	  <button class="apply-btn" id="apply-btn" type="button">
	    <span class="rectangle-298"></span>
	    <span class="div7">
	      <c:choose>
	        <c:when test="${isApplied}">참여취소</c:when>
	        <c:otherwise>신청하기</c:otherwise>
	      </c:choose>
	    </span>
	  </button>
	</c:if>
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
								<span> <span class="_1-1-2-3-1-3-or-1-span">${matchupDetail.content} 
								</span>
									<ul class="_1-1-2-3-1-3-or-1-span2">
										<li>매일 문제 2~3개 선정 → 각자 풀이 후 리뷰</li>
										<li>문제는 백준/프로그래머스 기준, 난이도는 레벨1~3까지 다양하게 조정</li>
										<li>리뷰는 디스코드 음성 or 채팅으로 진행 (시간 협의)</li>
										<li>하루 1시간 정도 투자 예상 (풀이 + 리뷰 포함)</li>
										<li>리뷰는 설명 중심, 서로 모르는 부분은 꼭 짚고 넘어가기!</li>
										<li>희망 시 코드 리뷰 자료는 깃허브 공유</li>
									</ul> <span class="_1-1-2-3-1-3-or-1-span"> <br /> <br />
										알고리즘을 다시 잡고 싶은 분 <br /> 코딩 테스트를 앞두고 있는 분 <br /> 루틴을 만들며 단기간
										집중하고 싶은 분 <br /> 작심삼일 끝판왕… 누군가랑 함께해야 동기부여 되는 분 <br /> <br />
										혼자보다 함께라면 더 멀리 갈 수 있어요!!!! <br /> 시작이 반! 같이 해요 <br />
								</span> 
								<span class="_1-1-2-3-1-3-or-1-span3"> <br /> <br />
								</span>
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
						<div class="div13">멘토를 기다리고 있어요</div>

						<div class="frame-3668">
							<a href="/user/123" class="profile-link"> <img
								class="image-47" src="${cpath}/resources/images/logo.png"
								alt="유저 프로필" />
							</a>
						</div>
						<div class="div13">알고리즘뿌셔뿌셔</div>
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
							<div class="div15">마포구</div>
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
							<div class="div15">마포구</div>
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
							<div class="div15">마포구</div>
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
<script>
document.addEventListener('DOMContentLoaded', function() {
    const applyBtn = document.getElementById('apply-btn');
    if (!applyBtn) {
        console.error('apply-btn 요소 찾지 못함');
        return;
    }
    
    const btnTextSpan = applyBtn.querySelector('.div7');
    if (!btnTextSpan) {
        console.error('apply-btn 내부에 .div7 요소를 찾지 못함');
        return;
    }
    
    const matchupId = "${matchupDetail.matchupId}";
    const memberId = 1; // 실제 로그인된 회원 ID로 변경 필요
    
    applyBtn.addEventListener('click', function() {
        const action = btnTextSpan.textContent.trim();
        
        if (action === '신청하기') {
            fetch('${cpath}/matchup/apply', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    matchupId: matchupId,
                    memberId: memberId
                })
            })
            .then(response => response.json())
            .then(data => {
                alert(data.message || '신청 완료');
                if (!data.isError) {
                    btnTextSpan.textContent = '참여취소';
                }
            })
            .catch(() => alert('신청 실패'));
        } else if (action === '참여취소') {
            fetch('${cpath}/matchup/cancelApplication', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    matchupId: matchupId,
                    memberId: memberId
                })
            })
            .then(response => response.json())
            .then(data => {
                alert(data.message || '취소 완료');
                if (!data.isError) {
                    btnTextSpan.textContent = '신청하기';
                }
            })
            .catch(() => alert('취소 실패'));
        }
    });
});
    
    function openMemberModal() {
        document.getElementById("member-modal").style.display = "flex";
    }

    function closeMemberModal() {
        document.getElementById("member-modal").style.display = "none";
    }

    function openMentoModal() {
        document.getElementById("mento-modal").style.display = "flex";
    }

    function closeMentoModal() {
        document.getElementById("mento-modal").style.display = "none";
    }

    function showDeleteConfirmModal() {
        document.getElementById("delete-confirm-modal").style.display = "flex";
    }

    function hideDeleteConfirmModal() {
        document.getElementById("delete-confirm-modal").style.display = "none";
    }

    function showDeleteCompleteModal() {
        const completeModal = document.getElementById("delete-complete-modal");
        completeModal.style.display = "flex";
    }

    function hideDeleteCompleteModalAndRedirect() {
        document.getElementById("delete-complete-modal").style.display = "none";
        window.location.href = cpath + "/matchup/matchupList";
    }


    // AJAX 통신 함수
    async function handleConfirmDelete() {
        // JSP에서 전달받은 전역 변수 matchupDetail 사용
        const matchupId = matchupDetail.matchupId;
        const leaderId = matchupDetail.leaderId;

        const params = new URLSearchParams();
        params.append('matchupId', matchupId);
        params.append('leaderId', leaderId);

        hideDeleteConfirmModal();

        try {
            const response = await fetch(cpath + '/matchup/deleteMatchup', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: params
            });

            const result = await response.json();

            if (result.code == 1000) { 
                showDeleteCompleteModal();
            } else {
                alert(result.message || '매치업 삭제에 실패했습니다.');
            }

        } catch (error) {
            console.error('Error during fetch:', error);
            alert('오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
        }
    }


    // 페이지 로드 시 이벤트 리스너 설정 
    document.addEventListener("DOMContentLoaded", () => {
        const updateBtn = document.getElementById('update-btn');
        if (updateBtn) {
            updateBtn.addEventListener('click', () => {
                alert('수정 버튼이 클릭되었습니다!');
            });
        }

        const openMemberBtn = document.getElementById("select-memberlist-btn");
        if (openMemberBtn) {
            openMemberBtn.addEventListener("click", openMemberModal);
        }

        const openMentoBtn = document.getElementById("select-mentolist-btn");
        if (openMentoBtn) {
            openMentoBtn.addEventListener("click", openMentoModal);
        }
    });

    $('#cancel-btn').click(function() {
        $.post('/memento/matchup/cancelApplication', {memberId: 1, matchupId: 3}, function(response) {
            alert(response.message);
        });
    });
</script>



</body>
</html>