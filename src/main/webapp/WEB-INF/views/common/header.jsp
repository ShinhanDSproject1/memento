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
<style>
.div,
.div * {
  box-sizing: border-box;
}
.div {
  background: #FFFFFF;
  height: 1132px;
  position: relative;
  overflow: hidden;
}
.frame-3600 {
  background: #FFFFFF;
  /* padding: 16px 34px 16px 34px; */
  display: flex;
  flex-direction: row;
  gap: 22px;
  align-items: center;
  justify-content: center;
  width: 100%;
  min-width: 0;
  height: 100px;
  position: fixed;
  left: 0;
  top: 0;
  z-index: 1000;
  box-shadow: 0px 4px 4px 0px rgba(118, 115, 115, 0.25);
  overflow-x: auto;
}
.image-17 {
  flex-shrink: 0;
  width: 51.67px;
  height: 45.81px;
  position: relative;
  object-fit: cover;
  aspect-ratio: 51.67/45.81;
}
.me-mento-2 {
  flex-shrink: 0;
  width: 144px;
  height: 19.73px;
  position: relative;
  object-fit: cover;
  aspect-ratio: 144/19.73;
}
.frame-6 {
  padding: 10px 10px 0px 10px;
  flex-shrink: 0;
  width: 650px;
  height: 65px;
  position: relative;
}
.frame-5 {
  padding: 10px;
  width: 81px;
  height: 47px;
  position: absolute;
  left: 36px;
  top: 9px;
}
.div7 {
  color: #404042;
  text-align: left;
  font-family: "Inter-SemiBold", sans-serif;
  font-size: 22px;
  font-weight: 600;
  position: absolute;
  left: 10px;
  top: 10px;
}
.frame-62 {
  padding: 10px;
  width: 81px;
  height: 47px;
  position: absolute;
  left: 161px;
  top: 9px;
}
.frame-7 {
  padding: 10px;
  width: 81px;
  height: 47px;
  position: absolute;
  left: 287px;
  top: 9px;
}
.frame-8 {
  padding: 10px;
  width: 81px;
  height: 47px;
  position: absolute;
  left: 413px;
  top: 9px;
}
.frame-9 {
  padding: 10px;
  width: 81px;
  height: 47px;
  position: absolute;
  left: 539px;
  top: 9px;
}
.rectangle-33 {
  border-radius: 6px;
  border-style: solid;
  border-color: #CED4DA;
  border-width: 1px;
  flex-shrink: 0;
  width: 437px;
  height: 35px;
  position: relative;
  overflow: hidden;
}
.rectangle-332 {
  opacity: 0.5;
  width: 100%;
  height: 100%;
  position: absolute;
  right: 0%;
  left: 0%;
  bottom: 0%;
  top: 0%;
  overflow: visible;
}
.icon-search-01 {
  width: 4.35%;
  height: 62.5%;
  position: absolute;
  right: 1.83%;
  left: 93.82%;
  bottom: 18.75%;
  top: 18.75%;
}
.interface-search-magnifying-glass {
  width: 100%;
  height: 100%;
  position: absolute;
  right: 0%;
  left: 0%;
  bottom: 0%;
  top: 0%;
  overflow: visible;
}
.div8 {
  color: #949494;
  text-align: left;
  font-family: "Inter-Medium", sans-serif;
  font-size: 15px;
  font-weight: 500;
  position: absolute;
  left: calc(50% - 202.5px);
  top: 50%;
  translate: 0 -50%;
  width: 240px;
  height: 16px;
}
.frame-11 {
  background: #FFFFFF;
  border-radius: 6px;
  border-style: solid;
  border-color: #CED4DA;
  border-width: 1px;
  padding: 7px 15px 7px 15px;
  flex-shrink: 0;
  width: 78px;
  height: 25px;
  position: relative;
}
.div9 {
  color: #000000;
  text-align: left;
  font-family: "Inter-Medium", sans-serif;
  font-size: 15px;
  font-weight: 500;
  position: absolute;
  left: 30px;
  top: 8.5px;
}
.vuesax-linear-profile-circle {
  flex-shrink: 0;
  width: 30px;
  height: 30px;
  position: relative;
}
.profile-circle {
  width: 100%;
  height: 100%;
  position: absolute;
  right: 0%;
  left: 0%;
  bottom: 0%;
  top: 0%;
  overflow: visible;
}
.icon-alert-notification-bell-new {
  flex-shrink: 0;
  width: 25px;
  height: 25px;
  position: relative;
  overflow: visible;
}
.vuesax-linear-profile-circle {
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: center;
  justify-content: flex-start;
  flex-shrink: 0;
  position: relative;
}
.profile-circle {
  flex-shrink: 0;
  width: 30px;
  height: 30px;
  position: relative;
  overflow: visible;
}
</style>
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
	<img id="notification-icon" class="icon-alert-notification-bell-new" src="${cpath}/resources/images/header/icon-alert-notification-bell-new0.svg" />


	<div class="vuesax-linear-profile-circle" onclick="location.href='page1'">
    	<img class="profile-circle" src="${cpath}/resources/images/header/profile-circle0.svg" />
  	</div>
</div>