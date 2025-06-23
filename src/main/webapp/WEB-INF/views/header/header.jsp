<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!-- 빈 파비콘 (브라우저 요청 방지) -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${cpath}/resources/css/header/header.css" />
<div class="frame-3600">
	<img class="image-17" src="${cpath}/resources/images/header/image-170.png" /> 
	<img class="me-mento-2" src="${cpath}/resources/images/header/me-mento-20.png" />
	<div class="frame-6">
		<div class="frame-5">
			<div class="div7">매치업</div>
		</div>
		<div class="frame-62">
			<div class="div7">멘토스</div>
		</div>
		<div class="frame-7">
			<div class="div7">킵고잉</div>
		</div>
		<div class="frame-8">
			<div class="div7">어부바</div>
		</div>
		<div class="frame-9">
			<div class="div7">큐알코딩</div>
		</div>
	</div>
	<div class="rectangle-33">
		<img class="rectangle-332" src="${cpath}/resources/images/header/rectangle-331.svg" />
		<div class="icon-search-01">
			<img class="interface-search-magnifying-glass" src="${cpath}/resources/images/header/interface-search-magnifying-glass0.svg" />
		</div>
		<div class="div8">나의 성장을 도와줄 멘토를 찾아보세요</div>
	</div>
	<div class="frame-11">
		<div class="div9">로그인</div>
	</div>
	<img class="vuesax-linear-coin" src="${cpath}/resources/images/header/vuesax-linear-coin0.svg" />
	<img class="icon-alert-notification-bell-new" src="${cpath}/resources/images/header/icon-alert-notification-bell-new0.svg" />
	<div class="vuesax-linear-profile-circle" onclick="location.href='page1'">
    	<a class="profile-circle" href="${cpath}/mypage/page1"><img src="${cpath}/resources/images/header/profile-circle0.svg" /></a>
  	</div>
</div>