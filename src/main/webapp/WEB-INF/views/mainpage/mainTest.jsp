<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>me:mento 메인 페이지</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage/mainTest.css" />
</head>
<body>
<div class="home-page-3">
  <div class="home-page-3-inner">
    <div class="text-area">
      <div class="title">서비스 소개</div>
      <div class="me-mento">
        <span>
          <span>우리 </span>
          <span class="me-mento-span2">me:</span>
          <span class="me-mento-span3">mento</span>
          <br />
          <span>
            와 함께<br />
            성장하세요!
          </span>
        </span>
      </div>
    </div>
    <div class="image-area">
      <div class="device-macbook-pro">
        <div class="shadow"></div>
        <div class="top">
          <div class="lid"></div>
          <div class="dark-screen"></div>
          <div class="screen-wrap">
            <div class="screen"></div>
            <div class="insert-your-design-here">Insert Your Design Here</div>
          </div>
        </div>
        <img class="bottom" src="${pageContext.request.contextPath}/resources/images/main1/bottom.svg" alt="bottom" />
      </div>
      <img
        class="image-55"
        src="${pageContext.request.contextPath}/resources/images/main1/serviceinner.png"
        alt="service inner"
      />
    </div>
  </div>
</div>



</body>
</html>
