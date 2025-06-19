<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>찜바구니</title>

  <!-- CSS 연결 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage/payment.css" />

  <!-- Inter -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <!-- D2Coding -->
  <link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2107@1.1/D2Coding.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="div">
  <%@ include file="../common/header.jsp" %>

  <main class="cart-container">
  <!-- 왼쪽: 결제 목록 -->
  <section class="cart-left">
    <h2 class="cart-title">결제바구니</h2>

    <div class="cart-actions">
      <label><input type="checkbox"> 전체 선택</label>
      <button class="delete-button">선택 삭제</button>
    </div>

    <div class="cart-item">
      <img src="${pageContext.request.contextPath}/resources/images/main1/lecture.png" alt="강의 이미지" class="item-image" />
      <div class="item-info">
        <p class="item-title">스프링 부트와 리액트로 구현하는 소셜 로그인</p>
        <div class="item-meta">
          <span class="meta-date">06/16(월)</span>
          <span class="meta-time">08:00</span>
          <span class="meta-count">3회</span>
          <span class="meta-place">신한DS 카페</span>
        </div>
      </div>
      <div class="item-price">₩18,000</div>
    </div>
  </section>

  <!-- 오른쪽: 구매자 정보 + 결제 영역 -->
  <section class="cart-right">
    <div class="user-summary">
      <h3>구매자 정보</h3>
      <div class="buyer-info-box">
        <span>이름</span>
        <span>안가연</span>
      </div>
    </div>

    <div class="point-cash">
      <div class="point">
        <label>POINT</label>
        <input type="number" placeholder="1000P 이상 사용" />
      </div>
      <div class="cash">
        <label>CASH</label>
        <input type="number" placeholder="₩ 입력" />
      </div>
    </div>

    <div class="total-price">
      <span>총 결제 금액</span>
      <strong>₩18,000</strong>
    </div>

    <div class="agreement">
      회원 본인은 주문 내용을 확인했으며,<br>
      구매조건 및 개인정보처리방침과 결제에 동의합니다.
    </div>

    <div class="action-buttons">
      <button class="btn cancel">취소하기</button>
      <button class="btn pay">결제하기</button>
    </div>
  </section>
</main>
</div>
</body>
</html>
