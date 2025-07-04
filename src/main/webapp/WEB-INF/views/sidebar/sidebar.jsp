<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
</script>

<aside class="sidebar">
	<div class="profile-section">
		<a href="${cpath}/mypage/page2">
			<div class="profile-card">
				<div class="profile-avatar-wrapper">
					<img class="avatar-image"
						src="${cpath}/resources/images/sidebar/avatar-default0.svg" />
					<div class="edit-profile-button-wrapper">
						<a class="edit-profile-link" href="${cpath}/mypage/page2">
							<img class="edit-profile-icon"
							src="${cpath}/resources/images/sidebar/vuesax-linear-export0.svg" />
						</a>
					</div>
				</div>
				<div class="user-nickname">코딩하는 뭉뭉이</div>
				<div class="user-role">mento</div>
				<div class="user-assets">
					<div class="asset-item">
						<span class="asset-label cash-label">Cash :</span>
						<span id="userBalance" class="asset-value">53,000</span>
					</div>
					<div class="asset-item">
						<span class="asset-label point-label">Point :</span>
						<span class="asset-value">530 P</span>
					</div>
				</div>
			</div>
		</a>
		<hr class="divider">
	</div>
	<nav class="sidebar-nav">
		<ul class="nav-menu">
			<li class="nav-item">
				<button data-url="${cpath}/mypage/page1" class="page-link">
					대시보드</button>
			</li>
			<li class="nav-item">
				<button data-url="${cpath}/mypage/cash-recharge" class="page-link">
					캐시 충전</button>
			</li>
			<li class="nav-item">
				<button data-url="${cpath}/mypage/page3" class="page-link">
					결제내역</button>
			</li>
			<li class="nav-item">
				<button data-url="${cpath}/mypage/spark-test" class="page-link">
					Spark Test</button>
			</li>
			<li class="nav-item">
				<button data-url="${cpath}/mypage/mento-test" class="page-link">
					멘토 자격시험</button>
			</li>
		</ul>
	</nav>
</aside>