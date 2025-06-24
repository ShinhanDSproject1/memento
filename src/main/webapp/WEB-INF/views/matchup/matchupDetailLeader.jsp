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
	<jsp:include page="/WEB-INF/views/matchup/memberListModal.jsp" />
	<jsp:include page="/WEB-INF/views/matchup/mentoListModal.jsp" />
	<jsp:include page="/WEB-INF/views/matchup/deleteConfirmModal.jsp" />
	<jsp:include page="/WEB-INF/views/matchup/deleteModal.jsp" />
	<jsp:include page="/WEB-INF/views/matchup/deleteConfirmModal.jsp" />
	<div class="div">
		<div class="top-bar">
			<div class="top-bar-tag">
				<div class="top-bar-mento">
					<div class="div2">멘토 모집중</div>
				</div>
				<div class="top-bar-category">
					<div class="java-c">#알고리즘 #Java #C</div>
				</div>
			</div>
			<div class="div3">일주일 단기 알고리즘 스터디원 모집 중 🔥</div>
		</div>
		<div class="top-info-area">
			<div class="top-info">
				<div class="group-475">
					<div class="div4">현재 모집인원</div>
					<div class="_3-5">
						<span class="now-member-cnt">3</span> <span class="dash">/</span>
						<span class="max-member-cnt">5</span>
					</div>
				</div>
				<div class="group-476">
					<div class="div5">모집 시간</div>
					<div class="_15-00-17-00">
						<span class="start-time">15:00</span> <span class="dash">-</span>
						<span class="end-time">17:00</span>
					</div>
				</div>
				<div class="group-477">
					<div class="div6">스터디 횟수</div>
					<div class="_1">1회</div>
				</div>
				<div class="top-info-line"></div>
				<div class="price-and-buttons">
					<div class="price-text">₩70,000</div>

					<div class="button-group">
						<button class="select-memberlist-btn" id="select-memberlist-btn"
							type="button">
							<span class="rectangle-298"></span> <span class="div8">팀원
								리스트 보기</span>
						</button>
						<c:if test="${needMento eq true}">
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
							onclick="showDeleteModal()">
							<span class="rectangle-300"></span> <span class="div9">삭제하기</span>
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
								<span> <span class="_1-1-2-3-1-3-or-1-span"> “잠깐
										몰입해서, 확실히 성장하자” <br /> <br /> 안녕하세요! <br /> 짧고 굵게, 진짜 집중해서
										알고리즘 실력을 끌어올리고 싶은 분들을 위해 <br /> ‘1주일 단기 알고리즘 집중 스터디’를 모집합니다.
										<br /> <br /> &quot;계속 미루고만 있던 알고리즘 공부, 이번 기회에 딱 1주일만 진짜
										해봅시다!&quot; <br /> <br /> <br /> 진행방식 <br /> <br />
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
								</span> <span class="_1-1-2-3-1-3-or-1-span3"> <br /> <br />
								</span>
								</span>
							</div>
						</div>
						<div class="div11">✋ 이런 분과 함께하고 싶어요</div>
						<div class="frame-480">
							<div class="type-circle-wrapper">
								<div class="type-circle">
									<div class="circle-text">
										🔥 <br /> 코드폭탄 <br /> 해피빈
									</div>
								</div>
								<div class="type-circle">
									<div class="circle-text">
										🔥 <br /> 코드폭탄 <br /> 해피빈
									</div>
								</div>
								<div class="type-circle">
									<div class="circle-text">
										🔥 <br /> 코드폭탄 <br /> 해피빈
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
							<div class="_4-77-1-f">마포구 월드컵북로 4길 77 1F</div>
						</div>
						<div class="rectangle-189"></div>
					</div>
					<div class="frame-3670">
						<div class="div15">멘토를 기다리고 있어요</div>
						<div class="frame-3668">
							<a href="/user/123" class="profile-link"> <img
								class="image-47" src="${cpath}/resources/images/logo.png"
								alt="유저 프로필" />
							</a>
						</div>
						<div class="div15">알고리즘뿌셔뿌셔</div>
						<div class="line-7"></div>
						<div class="div15">매치업을 주선한 방장이에요</div>
						<div class="frame-3669">
							<a href="/user/123" class="profile-link"> <img
								class="image-47" src="${cpath}/resources/images/logo.png"
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


	<script>
		document.addEventListener('DOMContentLoaded', function() {
			document.getElementById('update-btn').addEventListener('click',
					function() {
						alert('업데이트 버튼이 클릭되었습니다!');
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
		  
		  function showDeleteModal() {
		    document.getElementById("delete-confirm-modal").style.display = "flex";
		  }

		  function hideDeleteModal() {
		    document.getElementById("delete-confirm-modal").style.display = "none";
		  }
		  
		  function showDeleteCompleteModal(){
			  document.getElementById("delete-complete-modal").style.display="flex";
		  }
		  function hideDeleteCompleteModal(){
			  document.getElementById("delete-complete-modal").style.display="none";
		  }

		  function confirmDelete() {
		    hideDeleteModal();
		    showDeleteCompleteModal();
		  }

		  document.addEventListener("DOMContentLoaded", () => {
		    const openMemberBtn = document.getElementById("select-memberlist-btn");
		    const openMentoBtn = document.getElementById("select-mentolist-btn");
		    if (openMemberBtn) {
		    	openMemberBtn.addEventListener("click", openMemberModal);
		    }
		    if(openMentoBtn){
		    	openMentoBtn.addEventListener("click", openMentoModal);
		    }
		  });
	</script>
</body>
</html>