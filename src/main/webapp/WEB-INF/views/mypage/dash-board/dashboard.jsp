<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />

<div class="dashboard-container">

	<!-- Row 1 -->
	<div class="dashboard-row">
		<!-- Match Up Card -->
		<article class="dash-card dash-card--matchup">
			<header class="dash-card__header">
				<h2 class="dash-card__title">Match Up</h2>
			</header>
			<div class="dash-card__body">
				<ul class="dash-list">
					<li class="dash-list__item">
						<img src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg" alt="Avatar" class="dash-list__avatar">
						<div class="dash-list__details">
							<span class="dash-list__title-text">개발새발 코딩 스터디</span>
							<div class="dash-list__meta">
								<img src="${cpath}/resources/images/mypage/dash-board/icon-time-calendar-010.svg" alt="Calendar" class="dash-list__icon">
								<span class="dash-list__meta-text">2 / 3회 진행 중</span>
							</div>
						</div>
						<span class="dash-list__status">(Leader)</span>
						<a href="#" class="dash-list__action">
							<img src="${cpath}/resources/images/mypage/dash-board/no-mento.svg" alt="No Mento">
						</a>
					</li>
					<li class="dash-list__item">
						<img src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg" alt="Avatar" class="dash-list__avatar">
						<div class="dash-list__details">
							<span class="dash-list__title-text">쉽게 배우는 자바</span>
							<div class="dash-list__meta">
								<img src="${cpath}/resources/images/mypage/dash-board/icon-time-calendar-010.svg" alt="Calendar" class="dash-list__icon">
								<span class="dash-list__meta-text">4 / 5회 진행 중</span>
							</div>
						</div>
						<span class="dash-list__status">(follower)</span>
						<a href="#" class="dash-list__action">
							<img src="${cpath}/resources/images/mypage/dash-board/yes-mento.svg" alt="Yes Mento">
						</a>
					</li>
					<li class="dash-list__item">
						<img src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg" alt="Avatar" class="dash-list__avatar">
						<div class="dash-list__details">
							<span class="dash-list__title-text">알고리즘 마스터반</span>
							<div class="dash-list__meta">
								<img src="${cpath}/resources/images/mypage/dash-board/icon-time-calendar-010.svg" alt="Calendar" class="dash-list__icon">
								<span class="dash-list__meta-text">2 / 3회 진행 중</span>
							</div>
						</div>
						<span class="dash-list__status">(Leader)</span>
						<a href="#" class="dash-list__action">
							<img src="${cpath}/resources/images/mypage/dash-board/no-mento.svg" alt="No Mento">
						</a>
					</li>
				</ul>
			</div>
			<footer class="dash-card__footer">
				<a href="${cpath}/mypage/page6" class="dash-card__footer-link">
					매치업 목록
					<img src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-logout1.svg" alt="Arrow">
				</a>
			</footer>
		</article>

		<!-- Mentos Card -->
		<article class="dash-card dash-card--mentos">
			<header class="dash-card__header">
				<h2 class="dash-card__title">Mentos</h2>
			</header>
			<div class="dash-card__body">
				<ul class="dash-list">
					<li class="dash-list__item">
						<img src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg" alt="Avatar" class="dash-list__avatar">
						<div class="dash-list__details">
							<span class="dash-list__title-text">봄이 오겠냐? 스프링</span>
							<div class="dash-list__meta">
								<img src="${cpath}/resources/images/mypage/dash-board/icon-maps-compass0.svg" alt="Mentor" class="dash-list__icon">
								<span class="dash-list__meta-text">얄팍한 코딩사전</span>
							</div>
						</div>
						<span class="dash-list__status dash-list__status--enrolled">수강중</span>
					</li>
					<li class="dash-list__item">
						<img src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg" alt="Avatar" class="dash-list__avatar">
						<div class="dash-list__details">
							<span class="dash-list__title-text">파이썬? 야 너두 할 수 있어</span>
							<div class="dash-list__meta">
								<img src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-430.svg" alt="Mentor Icon" class="dash-list__icon">
								<span class="dash-list__meta-text dash-list__meta-text--mentor">Mentor</span>
							</div>
						</div>
						<span class="dash-list__status dash-list__status--in-progress">현재 진행중</span>
					</li>
					<li class="dash-list__item">
						<img src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg" alt="Avatar" class="dash-list__avatar">
						<div class="dash-list__details">
							<span class="dash-list__title-text">손쉬운 정보처리기사</span>
							<div class="dash-list__meta">
								<img src="${cpath}/resources/images/mypage/dash-board/icon-maps-compass0.svg" alt="Mentor" class="dash-list__icon">
								<span class="dash-list__meta-text">흥달쌤</span>
							</div>
						</div>
						<span class="dash-list__status dash-list__status--enrolled">수강중</span>
					</li>
				</ul>
			</div>
			<footer class="dash-card__footer">
				<a href="${cpath}/mypage/page7" class="dash-card__footer-link">
					멘토스 목록
					<img src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-logout1.svg" alt="Arrow">
				</a>
			</footer>
		</article>
	</div>

	<!-- Row 2 -->
	<div class="dashboard-row">
		<!-- Keep Going Card -->
		<article class="dash-card dash-card--keepgoing">
			<header class="dash-card__header">
				<h2 class="dash-card__title">Keep Going</h2>
			</header>
			<div class="dash-card__body">
				<ul class="dash-list dash-list--keepgoing">
					<li class="dash-list__item">
						<div class="dash-list__details">
							<div class="keepgoing-item__header">
								<span class="dash-list__title-text">넌너입니다</span>
								<div class="keepgoing-item__badge">
									<img src="${cpath}/resources/images/mypage/dash-board/vector0.svg" alt="User icon" class="keepgoing-item__badge-icon">
									<span class="keepgoing-item__badge-count">33</span>
								</div>
							</div>
							<span class="dash-list__meta-text">화, 목 (19:00~21:00)</span>
						</div>
						<a href="#" class="btn btn--chat">채팅하기</a>
					</li>
					<li class="dash-list__item">
						<div class="dash-list__details">
							<div class="keepgoing-item__header">
								<span class="dash-list__title-text">넌너입니다</span>
								<div class="keepgoing-item__badge">
									<img src="${cpath}/resources/images/mypage/dash-board/vector0.svg" alt="User icon" class="keepgoing-item__badge-icon">
									<span class="keepgoing-item__badge-count">33</span>
								</div>
							</div>
							<span class="dash-list__meta-text">화, 목 (19:00~21:00)</span>
						</div>
						<a href="#" class="btn btn--chat">채팅하기</a>
					</li>
				</ul>
			</div>
			<footer class="dash-card__footer">
				<a href="${cpath}/mypage/page8" class="dash-card__footer-link">
					킵고잉 목록
					<img src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-logout1.svg" alt="Arrow">
				</a>
			</footer>
		</article>

		<!-- Spark Test Card -->
		<article class="dash-card dash-card--sparktest">
			<header class="dash-card__header">
				<h2 class="dash-card__title">Spark Test</h2>
			</header>
			<div class="dash-card__body dash-card__body--centered">
				<h3 class="spark-test__title">목표러 코취치</h3>
				<p class="spark-test__subtitle">(목표지향 개발자)</p>
			</div>
		</article>
	</div>

	<!-- Row 3 -->
	<div class="dashboard-row">
		<!-- Hall of Fame Card -->
		<article class="dash-card dash-card--fame">
			<header class="dash-card__header dash-card__header--centered">
				<img src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-500.svg" alt="Crown" class="fame__crown">
				<h2 class="dash-card__subtitle">명예의 전당</h2>
				<img src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-500.svg" alt="Crown" class="fame__crown">
			</header>
			<div class="dash-card__body">
				<div class="fame__grid">
					<!-- Repeat this block for each member -->
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
					<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg" alt="Avatar" class="fame__avatar">
				</div>
			</div>
		</article>

		<!-- My Wishlist Card -->
		<article class="dash-card dash-card--wishlist">
			<header class="dash-card__header">
				<h2 class="dash-card__subtitle">내가 찜한 목록</h2>
			</header>
			<div class="dash-card__body">
				<ul class="dash-list">
					<li class="dash-list__item">
						<div class="dash-list__details">
							<span class="dash-list__title-text">리엑트 한큐에 배우기</span>
							<span class="wishlist__price">(20,000)</span>
						</div>
						<a href="#"><img src="${cpath}/resources/images/mypage/dash-board/login1.svg" alt="Action icon" class="wishlist__action-icon"></a>
					</li>
					<li class="dash-list__item">
						<div class="dash-list__details">
							<span class="dash-list__title-text">Git을 활용한 프로젝트 생성해보기</span>
							<span class="wishlist__price wishlist__price--free">(Free)</span>
						</div>
						<a href="#"><img src="${cpath}/resources/images/mypage/dash-board/login1.svg" alt="Action icon" class="wishlist__action-icon"></a>
					</li>
					<li class="dash-list__item">
						<div class="dash-list__details">
							<span class="dash-list__title-text">Figma 어렵지 않아요</span>
							<span class="wishlist__price">(35,000)</span>
						</div>
						<a href="#"><img src="${cpath}/resources/images/mypage/dash-board/login1.svg" alt="Action icon" class="wishlist__action-icon"></a>
					</li>
				</ul>
			</div>
		</article>
	</div>

	<!-- Row 4 -->
	<div class="dashboard-row">
		<!-- Attendance Card -->
		<article class="dash-card dash-card--attendance">
			<div class="attendance__container">
				<header class="attendance__header">
					<h2 class="dash-card__subtitle">이번주 출석체크</h2>
					<a href="${cpath}/mypage/dashBoard/calender" class="attendance__calendar-link">
						<img src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-import0.svg" alt="Calendar icon">
						<span>월간 달력 보기</span>
					</a>
				</header>
				<div class="attendance__days">
					<div class="attendance__day">
						<span class="attendance__day-label">월</span>
						<img src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-080.svg" alt="Checked" class="attendance__day-status">
					</div>
					<div class="attendance__day">
						<span class="attendance__day-label">화</span>
						<img src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-080.svg" alt="Checked" class="attendance__day-status">
					</div>
					<div class="attendance__day">
						<span class="attendance__day-label">수</span>
						<img src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-080.svg" alt="Checked" class="attendance__day-status">
					</div>
					<div class="attendance__day attendance__day--today">
						<span class="attendance__day-label">목</span>
						<img src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-950.svg" alt="Today Checked" class="attendance__day-status">
					</div>
					<div class="attendance__day">
						<span class="attendance__day-label">금</span>
					</div>
					<div class="attendance__day">
						<span class="attendance__day-label">토</span>
					</div>
					<div class="attendance__day">
						<span class="attendance__day-label">일</span>
					</div>
				</div>
			</div>
		</article>
	</div>

</div>
<script>
	const basePath = '${cpath}';
</script>
<script src="${cpath}/resources/js/dash-board/dash-board.js"></script>
