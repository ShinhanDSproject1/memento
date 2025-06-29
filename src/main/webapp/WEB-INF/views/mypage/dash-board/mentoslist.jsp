<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/dash-board/mypageMentosListStyle.css" />
<script>
  	window.cpath = '${cpath}';
</script>
<script
	src="${cpath}/resources/js/mypage/dash-board/mypagementoslist.js"></script>
<div class="page-container">
	<section class="my-mentors">
		<div class="my-mentors__wrapper">
			<h1 class="my-mentors__title">나의 멘토스 목록</h1>
			    <div id="mentos-list-container" class="card-grid"></div>
				
			
			<div class="my-mentors__container">
				<div class="mentors-grid">
					<!-- Card 1: Waiting -->
					<article class="mentor-card mentor-card--waiting">
						<img
							src="${cpath}/resources/images/mypage/dash-board/mentos-list/image0.png"
							alt="코딩 인터뷰 실전 패키지" class="mentor-card__image">
						<div class="mentor-card__content">
							<h2 class="mentor-card__title">국내는 기본, 해외까지 노리는 코딩 인터뷰 실전
								패키지</h2>
							<div class="mentor-card__info">
								<span class="mentor-card__schedule">화 13:00-17:00</span> <span
									class="mentor-card__location">강남</span>
							</div>
							<div class="mentor-card__status-group">
								<span class="mentor-card__status mentor-card__status--waiting">대기중</span>
								<div class="mentor-card__mentor-details">
									<img
										src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-microphone0.svg"
										alt="mentor icon" class="mentor-card__mentor-icon"> <span
										class="mentor-card__mentor-name">최다희 멘토</span>
								</div>
							</div>
						</div>
					</article>

					<!-- Card 2: In Progress -->
					<article class="mentor-card">
						<img
							src="${cpath}/resources/images/mypage/dash-board/mentos-list/image1.png"
							alt="자료구조 (with JS)" class="mentor-card__image">
						<div class="mentor-card__content">
							<h2 class="mentor-card__title">비전공자의 전공자 따라잡기 자료구조 (with JS)</h2>
							<div class="mentor-card__info">
								<span class="mentor-card__schedule">화 16:00-18:00</span> <span
									class="mentor-card__location">역삼</span>
							</div>
							<div class="mentor-card__status-group">
								<span class="mentor-card__status">3회 / 5회</span>
								<div class="mentor-card__mentor-details">
									<img
										src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-microphone0.svg"
										alt="mentor icon" class="mentor-card__mentor-icon"> <span
										class="mentor-card__mentor-name">홍길동 멘토</span>
								</div>
							</div>
						</div>
					</article>

					<!-- Card 3: In Progress -->
					<article class="mentor-card">
						<img
							src="${cpath}/resources/images/mypage/dash-board/mentos-list/image2.png"
							alt="AWS 입문/실전" class="mentor-card__image">
						<div class="mentor-card__content">
							<h2 class="mentor-card__title">비전공자도 이해할 수 있는 AWS 입문/실전</h2>
							<div class="mentor-card__info">
								<span class="mentor-card__schedule">수 18:00-20:00</span>
								<%-- Corrected typo from 30:00 --%>
								<span class="mentor-card__location">홍대</span>
							</div>
							<div class="mentor-card__status-group">
								<span class="mentor-card__status">0회 / 5회</span>
								<div class="mentor-card__mentor-details">
									<img
										src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-microphone0.svg"
										alt="mentor icon" class="mentor-card__mentor-icon"> <span
										class="mentor-card__mentor-name">차민건 멘토</span>
								</div>
							</div>
						</div>
					</article>

					<!-- Card 4: In Progress -->
					<article class="mentor-card">
						<img
							src="${cpath}/resources/images/mypage/dash-board/mentos-list/image3.png"
							alt="스프링 부트와 리액트로 구현하는 소셜 로그인" class="mentor-card__image">
						<div class="mentor-card__content">
							<h2 class="mentor-card__title">스프링 부트와 리액트로 구현하는 소셜 로그인</h2>
							<div class="mentor-card__info">
								<span class="mentor-card__schedule">금 19:00-21:00</span> <span
									class="mentor-card__location">화성</span>
							</div>
							<div class="mentor-card__status-group">
								<span class="mentor-card__status">4회 / 5회</span>
								<div class="mentor-card__mentor-details">
									<img
										src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-microphone0.svg"
										alt="mentor icon" class="mentor-card__mentor-icon"> <span
										class="mentor-card__mentor-name">김대현 멘토</span>
								</div>
							</div>
						</div>
					</article>

					<!-- Card 5: Completed -->
					<article class="mentor-card mentor-card--completed">
						<img
							src="${cpath}/resources/images/mypage/dash-board/mentos-list/image4.png"
							alt="파이썬으로 봇 만들기 with ChatGPT" class="mentor-card__image">
						<div class="mentor-card__content">
							<h2 class="mentor-card__title">파이썬으로 봇 만들기 with ChatGPT</h2>
							<div class="mentor-card__info">
								<span class="mentor-card__schedule">화 16:00-18:00</span> <span
									class="mentor-card__location">역삼</span>
							</div>
							<div class="mentor-card__status-group">
								<!-- <span class="mentor-card__status mentor-card__status--completed">완료</span> -->
								<button class="btn btn--review" onclick="openModal()">
									<span>리뷰 쓰기</span>
								</button>
								<div class="mentor-card__mentor-details">
									<img
										src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-microphone0.svg"
										alt="mentor icon" class="mentor-card__mentor-icon"> <span
										class="mentor-card__mentor-name">안가연 멘토</span>
								</div>
							</div>
						</div>
					</article>

					<!-- Card 6: In Progress -->
					<article class="mentor-card">
						<img
							src="${cpath}/resources/images/mypage/dash-board/mentos-list/image5.png"
							alt="스프링 부트 심화 버전" class="mentor-card__image">
						<div class="mentor-card__content">
							<h2 class="mentor-card__title">신한 DS에서 배우는 스프링 부트 심화 버전</h2>
							<div class="mentor-card__info">
								<span class="mentor-card__schedule">수 18:00-20:00</span>
								<%-- Corrected typo from 30:00 --%>
								<span class="mentor-card__location">홍대</span>
							</div>
							<div class="mentor-card__status-group">
								<span class="mentor-card__status">3회 / 7회</span>
								<div class="mentor-card__mentor-details">
									<img
										src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-microphone0.svg"
										alt="mentor icon" class="mentor-card__mentor-icon"> <span
										class="mentor-card__mentor-name">정진 멘토</span>
								</div>
							</div>
						</div>
					</article>
				</div>
			</div>
		</div>
	</section>
</div>
<script>
        const userListElem = $('.mentors-grid');

        // JSP를 통해 동적으로 Context Path가 포함된 URL을 생성
        const API_URL = '${pageContext.request.contextPath}/api/mypage/page7?memberId=2';
        
        console.log("생성된 API URL:", API_URL); // 브라우저 콘솔에서 확인해보세요.

        async function fetchUsers() {
            try {
                const response = await fetch(API_URL);
                const users = await response.json();
				console.log(users)
                userListElem.innerHTML = '';
                users.forEach(user => {
                    const li = document.createElement('li');
                    li.textContent = `ID: ${result}`;
                    userListElem.appendChild(li);
                });
            } catch (error) {
                console.error('Error:', error);
            }
        }

        document.addEventListener('DOMContentLoaded', fetchUsers);
    </script>


<div class="modal-overlay" id="reviewModal">
	<div class="modal-content">
		<div>
			<label>별점</label>
			<div id="star-container" style="margin-top: 8px;">
				<img
					src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg"
					class="star" data-value="1"> <img
					src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg"
					class="star" data-value="2"> <img
					src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg"
					class="star" data-value="3"> <img
					src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg"
					class="star" data-value="4"> <img
					src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg"
					class="star" data-value="5">
			</div>
		</div>
		<div class="line-53"></div>
		<div>
			<label>이미지</label> <input type="file" id="reviewImage"
				accept="image/*" style="margin-top: 8px;">
		</div>
		<div class="line-53"></div>
		<div>
			<label>내용</label>
			<textarea id="reviewContent" rows="6"
				style="width: 100%; margin-top: 8px;"></textarea>
		</div>
		<div
			style="margin-top: 10px; display: flex; justify-content: flex-end; gap: 10px;">
			<button onclick="submitReview()">작성 완료</button>
			<button onclick="closeModal()">닫기</button>
		</div>
	</div>
</div>