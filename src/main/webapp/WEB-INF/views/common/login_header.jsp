<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />

<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/login_header.css">

<div class="header">

  <!-- 로고 -->
  <a href="${cpath}/mainpage/main1" class="header-logo">
    <img class="header-image-17" src="${cpath}/resources/images/header/image-170.png" />
    <img class="header-me-mento-2" src="${cpath}/resources/images/header/me-mento-20.png" />
  </a>

  <!-- 메뉴 -->
  <div class="frame-6">
    <a href="${cpath}/matchup" class="match-up"><div class="sub-title">매치업</div></a>
    <a href="${cpath}/mentos" class="mentos"><div class="sub-title">멘토스</div></a>
    <a href="${cpath}/keepgoing" class="keepgoing"><div class="sub-title">킵고잉</div></a>
    <a href="${cpath}/abovar" class="abovar"><div class="sub-title">어부바</div></a>
    <a href="${cpath}/qrcoding" class="QRCoding"><div class="sub-title">큐알코딩</div></a>
  </div>

  <!-- 검색창 -->
  <form action="${cpath}/search" method="get" class="search-bar">
    <input type="text" name="query" class="search-input" placeholder="나의 성장을 도와줄 멘토를 찾아보세요" />
    <button type="submit" class="search-icon">
      <img class="search-img" src="${cpath}/resources/images/header/interface-search-magnifying-glass0.svg" alt="검색" />
    </button>
  </form>

  <!-- 로그인 버튼 -->
  <div class="login-button" id="loginBtn" style="cursor: pointer;">
    <div class="login-text">로그인</div>
  </div>

</div>
