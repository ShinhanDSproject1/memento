<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="sparkImgPath" value="/resources/images/mypage/spark-test" />

<link rel="stylesheet" href="${cpath}/resources/css/mypage/spark-test/spark-test-end.css" />

<div class="spark-test-wrapper">
  <div class="spark-test-main-content">

    <div class="spark-test-title">나의 SPARK 유형 결과</div>

    <img class="spark-test-result-character-image" src="${sparkImgPath}/happyBeen.png" id="characterImage" alt="결과 캐릭터" />

    <div class="spark-test-result-heading">
      <span class="spark-test-result-icon">유형:</span>
      <span class="spark-test-result-type" id="resultType">-</span>
    </div>
    <div class="spark-test-result-subtitle" id="resultSubtitle">-</div>

    <div class="spark-test-result-description">
      <p class="spark-test-description-text" id="resultInfo1">-</p>
      <h4 class="spark-test-learning-style-title">학습 스타일</h4>
      <ul class="spark-test-learning-style-list">
        <li id="resultInfo2">-</li>
      </ul>
      <h4 class="spark-test-mentoring-recommendation-title">추천 멘토링</h4>
      <ul class="spark-test-mentoring-recommendation-list">
        <li id="resultInfo3">-</li>
      </ul>
    </div>

    <div class="spark-test-type-percentages" id="percentageBars"></div>

    <div class="spark-test-compatible-partners-section">
      <div class="spark-test-compatible-partners-title">잘 맞는 파트너</div>
      <div class="spark-test-partner-icons">
        <img class="spark-test-partner-icon" src="${sparkImgPath}/comZung-icon.png" id= "icon1" />
        <img class="spark-test-partner-icon" src="${sparkImgPath}/happyBeen-icon.png" id= "icon2" />
        <img class="spark-test-partner-icon" src="${sparkImgPath}/tadakNyang-icon.png" id= "icon3" />
      </div>
    </div>

    <div class="spark-test-action-buttons">
      <button data-url="${cpath}/mypage/spark-test" class="spark-test-button spark-test-button--retake page-link">
        <div class="spark-test-button-label">다시 테스트하기</div>
      </button>
      <button class="spark-test-button spark-test-button--confirm">
        <div class="spark-test-button-label">확정하기</div>
      </button>
    </div>
  </div>
</div>

<script src="${cpath}/resources/js/mypage/spark-test/spark-test-end.js"></script>