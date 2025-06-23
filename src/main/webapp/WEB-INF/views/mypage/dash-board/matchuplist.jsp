<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />	

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/dash-board/mypageMatchupListStyle.css" />

<div class="page-container">
	<section class="matchup-list">
		<div class="matchup-list__container">
			<h2 class="matchup-list__title">나의 매치업 목록</h2>

			<div class="matchup-list__cards">
				<!-- Card 1: In Progress, Leader -->
				<article class="matchup-card">
					<div class="matchup-card__content">
						<img src="${cpath}/resources/images/mypage/dash-board/matchup-list/vector0.svg" alt="Avatar" class="matchup-card__avatar">
						<div class="matchup-card__details">
							<header class="matchup-card__header">
								<div class="matchup-card__tags">
									<span class="tag">#알고리즘 #C</span>
								</div>
								<span class="matchup-card__session-count">3/5회</span>
							</header>
							<h3 class="matchup-card__title">C언어로 운영체제 뜯어보는 스터디</h3>
							<footer class="matchup-card__footer">
								<div class="matchup-card__meta">
									<span class="matchup-card__schedule">화 17:00 - 19:00</span>
									<span class="matchup-card__location">마포구</span>
								</div>
								<div class="matchup-card__mentor">
									<img src="${cpath}/resources/images/mypage/dash-board/matchup-list/microphone-20.svg" alt="Mentor Icon" class="matchup-card__mentor-icon">
									<span class="matchup-card__mentor-name">조상호 멘토</span>
								</div>
								<span class="matchup-card__role matchup-card__role--leader">방장</span>
							</footer>
						</div>
					</div>
				</article>

				<!-- Card 2: In Progress, Member -->
				<article class="matchup-card">
					<div class="matchup-card__content">
						<img src="${cpath}/resources/images/mypage/dash-board/matchup-list/vector0.svg" alt="Avatar" class="matchup-card__avatar">
						<div class="matchup-card__details">
							<header class="matchup-card__header">
								<div class="matchup-card__tags">
									<span class="tag">#알고리즘 #Java</span>
								</div>
								<span class="matchup-card__session-count">1/7회</span>
							</header>
							<h3 class="matchup-card__title">Java로 알아보는 객체지향 프로그래밍</h3>
							<footer class="matchup-card__footer">
								<div class="matchup-card__meta">
									<span class="matchup-card__schedule">수 18:00 - 20:00</span>
									<span class="matchup-card__location">강남구</span>
								</div>
								<div class="matchup-card__mentor">
									<%-- No mentor info for this card --%>
								</div>
								<span class="matchup-card__role matchup-card__role--member">팀원</span>
							</footer>
						</div>
					</div>
				</article>

				<!-- Card 3: Waiting -->
				<article class="matchup-card">
					<div class="matchup-card__content">
						<img src="${cpath}/resources/images/mypage/dash-board/matchup-list/vector0.svg" alt="Avatar" class="matchup-card__avatar">
						<div class="matchup-card__details">
							<header class="matchup-card__header">
								<div class="matchup-card__tags">
									<span class="tag">#알고리즘 #C</span>
								</div>
								<span class="matchup-card__session-count matchup-card__session-count--waiting">대기중</span>
							</header>
							<h3 class="matchup-card__title">C언어로 운영체제 뜯어보는 스터디</h3>
							<footer class="matchup-card__footer">
								<div class="matchup-card__meta">
									<span class="matchup-card__schedule">화 17:00 - 19:00</span>
									<span class="matchup-card__location">마포구</span>
								</div>
								<div class="matchup-card__mentor">
									<img src="${cpath}/resources/images/mypage/dash-board/matchup-list/microphone-20.svg" alt="Mentor Icon" class="matchup-card__mentor-icon">
									<span class="matchup-card__mentor-name matchup-card__mentor-name--unconfirmed">미확정</span>
								</div>
								<span class="matchup-card__role matchup-card__role--leader">방장</span>
							</footer>
						</div>
					</div>
				</article>

				<!-- Card 4: Completed -->
				<article class="matchup-card">
					<div class="matchup-card__content">
						<img src="${cpath}/resources/images/mypage/dash-board/matchup-list/vector0.svg" alt="Avatar" class="matchup-card__avatar">
						<div class="matchup-card__details">
							<header class="matchup-card__header">
								<div class="matchup-card__tags">
									<span class="tag">#알고리즘 #C</span>
								</div>
								<span class="matchup-card__session-count matchup-card__session-count--completed">수료</span>
							</header>
							<h3 class="matchup-card__title">C언어로 운영체제 뜯어보는 스터디</h3>
							<footer class="matchup-card__footer">
								<div class="matchup-card__meta">
									<span class="matchup-card__schedule">화 17:00 - 19:00</span>
									<span class="matchup-card__location">마포구</span>
								</div>
								<div class="matchup-card__mentor">
									<img src="${cpath}/resources/images/mypage/dash-board/matchup-list/microphone-20.svg" alt="Mentor Icon" class="matchup-card__mentor-icon">
									<span class="matchup-card__mentor-name">정진 멘토</span>
								</div>
								<span class="matchup-card__role matchup-card__role--leader">방장</span>
							</footer>
						</div>
					</div>
					<!-- Action buttons are now inside the relevant card -->
					<div class="matchup-card__actions">
						<button class="action-button action-button--approve">
							<img src="${cpath}/resources/images/mypage/dash-board/matchup-list/rectangle-3050.svg" alt="" class="action-button__background">
							<span class="action-button__text">킵고잉 찬성</span>
						</button>
						<button class="action-button action-button--review">
							<img src="${cpath}/resources/images/mypage/dash-board/matchup-list/rectangle-3051.svg" alt="" class="action-button__background">
							<span class="action-button__text">리뷰 쓰기</span>
						</button>
					</div>
				</article>
			</div>
		</div>
	</section>
</div>
