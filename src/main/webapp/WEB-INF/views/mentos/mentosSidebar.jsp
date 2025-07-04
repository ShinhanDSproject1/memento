<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
	
</script>
<link rel="stylesheet"
	href="${cpath}/resources/css/mentos/MentosSidebar.css" />
<aside class="sidebar">
	<div class="profile-section">
		<div class="profile-card">
			<div class="profile-avatar-wrapper">
				<img class="avatar-image"
					src="${cpath}/resources/images/sidebar/avatar-default0.svg" />
				<div class="edit-profile-button-wrapper">
					<a class="edit-profile-link" href="${cpath}/mypage/page2"> <img
						class="edit-profile-icon"
						src="${cpath}/resources/images/sidebar/vuesax-linear-export0.svg" />
					</a>
				</div>
			</div>
			<div class="user-nicknaprofile-cardme">정진</div>
			<div class="frame-371">
				<div class="mento-sidebar">mento</div>
			</div>
			<div class="group-327">
				<div class="_30-000">
					<span> 수강생수 <br /></span> <span>30,000</span>
				</div>
				<div class="_300">
					<span> 수강평수 <br /></span> <span>300</span>
				</div>
				<div class="_5-0">
					<span> 강의평점 <br /></span> <span>5.0</span>
				</div>
			</div>
		</div>
	</div>
	<nav class="sidebar-nav">
		<ul class="nav-menu">
			<li class="nav-item">
				<button data-url="${cpath}/memento/mentos/mentodetail"
					class="page-link">홈</button>
			</li>
			<li class="nav-item">
				<button data-url="${cpath}/memento/mentos/mentodetailclasslist"
					class="page-link">진행한 멘토스 내역</button>
			</li>
			<li class="nav-item">
				<button data-url="${cpath}/memento/mentos/mentodetailreview"
					class="page-link">리뷰</button>
			</li>
		</ul>
	</nav>
</aside>