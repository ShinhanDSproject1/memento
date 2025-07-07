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
	href="${pageContext.request.contextPath}/resources/css/common/login_header.css">
	
<div class="header">
<a href="${cpath}/mainpage/main1" class="header-logo">
  <img class="header-image-17" src="${cpath}/resources/images/header/image-170.png" />
  <img class="header-me-mento-2" src="${cpath}/resources/images/header/me-mento-20.png" />
</a>
	
	<div class="frame-6">
		<a href="${cpath}/matchup/matchupList" class="match-up">
			<div class="sub-title">매치업</div>
		</a>
		<a href="${cpath}/mentos/full" class="mentos">
			<div class="sub-title">멘토스</div>
		</a> 
		<a href="${cpath}/keepgoing/keepgoinglist.do" class="keepgoing">
			<div class="sub-title">킵고잉</div>
		</a>
		<a href="${cpath}/mainpage/already" class="abovar">
			<div class="sub-title">어부바</div>
		</a> 
		<a href="${cpath}/mainpage/already" class="QRCoding">
			<div class="sub-title">큐알코딩</div>
		</a>

	</div>

	<form action="${cpath}/search" method="get" class="search-bar">
		<input type="text" name="query" class="search-input"
			placeholder="나의 성장을 도와줄 멘토를 찾아보세요" />
		<button type="submit" class="search-icon">
			<img class="search-img"
				src="${cpath}/resources/images/header/interface-search-magnifying-glass0.svg"
				alt="검색" />
		</button>
	</form>
	<div class="login-button" style="cursor: pointer;" onclick="location.href='${cpath}/mainpage/logout'">
		<div class="login-text">로그아웃</div>
	</div>
	<a class= "vuesax-linear-coin" href= "${cpath}/mypage/cash-recharge">
	<img class = "coin-icon" src="${cpath}/resources/images/header/vuesax-linear-coin0.svg" /></a>
	<img id="notification-icon" class="icon-alert-notification-bell-new" src="${cpath}/resources/images/header/icon-alert-notification-bell-new0.svg" style="cursor: pointer;" />
	


	<div class="vuesax-linear-profile-circle">
    	<a class="profile-circle" href="${cpath}/mypage/page1"><img src="${cpath}/resources/images/header/profile-circle0.svg" /></a>
  	</div>
</div>