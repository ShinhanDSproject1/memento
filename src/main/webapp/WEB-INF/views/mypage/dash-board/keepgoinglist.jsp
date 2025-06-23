<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<div class="page-container">
	<section class="keepgoing-list">
		<h2 class="keepgoing-list__title">나의 킵고잉 목록</h2>
		<div class="keepgoing-list__items-wrapper">
			<article class="keepgoing-item">
				<img class="keepgoing-item__icon"
					src="${cpath}/resources/images/mypage/dash-board/keepgoing-list/keepgoing-icon0.png"
					alt="Keepgoing Study Icon">
				<div class="keepgoing-item__details">
					<div class="keepgoing-item__badge">
						<img
							src="${cpath}/resources/images/mypage/dash-board/keepgoing-list/vector0.svg"
							alt="User Icon" class="keepgoing-item__badge-icon"> <span
							class="keepgoing-item__badge-count">33</span>
					</div>
					<h3 class="keepgoing-item__title">눈누입니다</h3>
					<div class="keepgoing-item__meta">
						<p class="keepgoing-item__schedule">화, 목 (19:00 ~ 21:00)</p>
						<p class="keepgoing-item__location">마포구</p>
					</div>
				</div>
				<div class="keepgoing-item__actions">
					<button class="btn btn--chat">채팅하기</button>
					<button class="btn btn--leave">탈퇴</button>
				</div>
			</article>
			<article class="keepgoing-item">
				<img class="keepgoing-item__icon"
					src="${cpath}/resources/images/mypage/dash-board/keepgoing-list/keepgoing-icon0.png"
					alt="Keepgoing Study Icon">
				<div class="keepgoing-item__details">
					<div class="keepgoing-item__badge">
						<img
							src="${cpath}/resources/images/mypage/dash-board/keepgoing-list/vector0.svg"
							alt="User Icon" class="keepgoing-item__badge-icon"> <span
							class="keepgoing-item__badge-count">25</span>
					</div>
					<h3 class="keepgoing-item__title">자바스크립트 완전 정복</h3>
					<div class="keepgoing-item__meta">
						<p class="keepgoing-item__schedule">월, 수 (20:00 ~ 22:00)</p>
						<p class="keepgoing-item__location">강남구</p>
					</div>
				</div>
				<div class="keepgoing-item__actions">
					<button class="btn btn--chat">채팅하기</button>
					<button class="btn btn--leave">탈퇴</button>
				</div>
			</article>
		</div>
	</section>
</div>
