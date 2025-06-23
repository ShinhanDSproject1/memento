<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>500 서버 오류 페이지</title>

  <!-- CSS 연결 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage/500error.css">

  <!-- Inter -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- D2Coding -->
  <link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2107@1.1/D2Coding.css" rel="stylesheet">
</head>
<body>
  <div class="error-container">
    <div class="error-code">
      <span class="digit">5</span>
      <span class="digit highlight">0</span>
      <span class="digit">0</span>
    </div>
    <div class="error-text">서버 내부 오류가 발생했습니다</div>
    <div class="error-subtext">요청을 처리하는 도중 문제가 발생하였습니다. 잠시 후 다시 시도해주세요.</div>
    <a href="${pageContext.request.contextPath}/mainpage/main1" class="error-button">홈으로 이동</a>
  </div>
</body>
</html>
