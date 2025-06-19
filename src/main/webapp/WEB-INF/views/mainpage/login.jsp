<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인 모달</title>

  <!-- CSS 연결 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage/login.css" />

  <!-- Inter -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- D2Coding -->
  <link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2107@1.1/D2Coding.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div class="login-modal">
  <div class="rectangle-174">

    <!-- 닫기 버튼 -->
    <button class="icon-menu-06">
      <img class="menu-close-md" src="${pageContext.request.contextPath}/resources/images/main1/close.svg" alt="닫기" />
    </button>

    <!-- 로고 영역 -->
    <div class="logo-area">
      <img class="image-19" src="${pageContext.request.contextPath}/resources/images/main1/logo.png" />
      <img class="me-mento-2" src="${pageContext.request.contextPath}/resources/images/main1/memento_logo.png" />
    </div>

    <!-- 텍스트 메시지 -->
    <div class="me-mento">
      <span>
        <span class="me-mento-span">me:</span>
        <span class="me-mento-span2">mento</span>
        <span class="me-mento-span3">
          와
          <br />
          함께 성장해보세요!
        </span>
      </span>
    </div>

 	<div class="button-image">
      <button class="div2">
        <img src="${pageContext.request.contextPath}/resources/images/main1/kakaotalk.png" alt="카카오 로그인" />
      </button>
      <button class="div">
        <img src="${pageContext.request.contextPath}/resources/images/main1/naver.png" alt="네이버 로그인" />
      </button>
    </div>

  </div>
</div>

</body>
</html>
