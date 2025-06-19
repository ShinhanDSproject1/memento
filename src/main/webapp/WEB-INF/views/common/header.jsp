<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />

<!-- 빈 파비콘 (브라우저 요청 방지) -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Inter 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
/* ===== 고정 헤더 ===== */
.frame-3600 {
  background: #ffffff;
  padding: 16px 34px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  min-width: 1440px;
  height: 104px;
  position: fixed;
  top: 0;
  left: 0;
  box-shadow: 0px 4px 8px rgba(118, 115, 115, 0.15);
  z-index: 1000;
}

/* ===== 로고 ===== */
.frame-3600 img {
  height: 30px;
}

/* ===== 메뉴 영역 (매치업, 멘토스, 킵고잉) ===== */
.frame-6 {
  display: flex;
  gap: 30px;
  align-items: center;
  margin-left: 20px;
}

.frame-5, .frame-62, .frame-7 {
  cursor: pointer;
}

.div7 {
  font-weight: 600;
  font-size: 16px;
  color: #333;
  white-space: nowrap;
}

/* ===== 검색창 영역 ===== */
.rectangle-33 {
  position: relative;
  width: 280px;
  height: 40px;
  border-radius: 20px;
  background-color: #f1f1f1;
  display: flex;
  align-items: center;
  padding: 0 16px;
}

.rectangle-33 img {
  height: 20px;
  width: 20px;
  margin-right: 10px;
}

.div8 {
  color: #888;
  font-size: 14px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* ===== 로그인 및 아이콘 ===== */
.frame-11 {
  margin-left: 20px;
}

.div9 {
  font-weight: 500;
  font-size: 15px;
  color: #333;
  cursor: pointer;
}

.vuesax-linear-profile-circle img,
.icon-alert-notification-bell-new {
  height: 24px;
  width: 24px;
  margin-left: 20px;
  cursor: pointer;
}
</style>

<!-- ===== 고정 헤더 바 구조 ===== -->
<div class="frame-3600">
  <!-- 로고 -->
  <img class="image-17" src="${cpath}/resources/images/header/image-180.png" />
  <img class="me-mento-2" src="${cpath}/resources/images/header/me-mento-20.png" />

  <!-- 메뉴 항목 -->
  <div class="frame-6">
    <div class="frame-5"><div class="div7">매치업</div></div>
    <div class="frame-62"><div class="div7">멘토스</div></div>
    <div class="frame-7"><div class="div7">킵고잉</div></div>
  </div>

  <!-- 검색창 -->
  <div class="rectangle-33">
    <img src="${cpath}/resources/images/header/rectangle-331.svg" />
    <div class="icon-search-01">
      <img class="interface-search-magnifying-glass"
        src="${cpath}/resources/images/header/interface-search-magnifying-glass0.svg" />
    </div>
    <div class="div8">나의 성장을 도와줄 멘토를 찾아보세요</div>
  </div>

  <!-- 로그인 및 알림 -->
  <div class="frame-11"><div class="div9">로그인</div></div>
  <div class="vuesax-linear-profile-circle">
    <img class="profile-circle" src="${cpath}/resources/images/header/profile-circle0.svg" />
  </div>
  <img class="icon-alert-notification-bell-new"
    src="${cpath}/resources/images/header/icon-alert-notification-bell-new0.svg" />
</div>
