<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="cashImgPath" value="/resources/images/mypage/cash-recharge" />

    <meta charset="utf-8" />
    <link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/mypage/cash-recharge/cash-recharge-checkout.css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>토스페이먼츠</title>

    <!-- 주문서 영역 -->
    <div class="wrapper">
      <div class="box_section" style="padding: 40px 30px 50px 30px; margin-top: 30px; margin-bottom: 50px">
       <div class="payment-number">결제 금액</div>
        <div class="cash-number">충전 금액</div>
        <!-- 결제 UI -->
        <div id="payment-method"></div>
        
        <!-- 이용약관 UI -->
        <div id="agreement"></div>
        
        <!-- 결제하기 버튼 -->
        <div class="result wrapper">
          <button class="button" id="payment-button" style="margin-top: 30px"> 결제하기 </button>
        </div>
      </div>
</div>
<script src="${cpath}/resources/js/mypage/cash-recharge/cash-recharge-checkout.js"></script>