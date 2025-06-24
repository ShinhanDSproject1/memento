<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />

<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common/header.css">
	
<div class="header">
	<img class="header-image-17" src="${cpath}/resources/images/header/image-170.png" /> 
	<img class="header-me-mento-2" src="${cpath}/resources/images/header/me-mento-20.png" />
	
	<div class="frame-6">
		<a href="${cpath}/matchup" class="match-up">
			<div class="sub-title">매치업</div>
		</a>
		<a href="${cpath}/mentos" class="mentos">
			<div class="sub-title">멘토스</div>
		</a> 
		<a href="${cpath}/keepgoing" class="keepgoing">
			<div class="sub-title">킵고잉</div>
		</a>
		<a href="${cpath}/abovar" class="abovar">
			<div class="sub-title">어부바</div>
		</a> 
		<a href="${cpath}/qrcoding" class="QRCoding">
			<div class="sub-title">큐알코딩</div>
		</a>

	</div>

	<div class="search-bar">
		<img class="search"
			src="${cpath}/resources/images/header/rectangle-331.svg" />
		<div class="search-icon">
			<img class="interface-search-magnifying-glass"
				src="${cpath}/resources/images/header/interface-search-magnifying-glass0.svg" />
		</div>
		<div class="search-placeholder">나의 성장을 도와줄 멘토를 찾아보세요</div>
	</div>
	<div class="login-button" id="loginBtn" style="cursor: pointer;">
		<div class="login-text">로그인</div>
	</div>
	<img class="vuesax-linear-coin" src="${cpath}/resources/images/header/vuesax-linear-coin0.svg" />
	<img id="notification-icon" class="icon-alert-notification-bell-new" src="${cpath}/resources/images/header/icon-alert-notification-bell-new0.svg" style="cursor: pointer;" />
	
	<div class="vuesax-linear-profile-circle" onclick="gotoDashboard()">
		<img class="profile-circle" src="${cpath}/resources/images/header/profile-circle0.svg" />
	</div>
</div>