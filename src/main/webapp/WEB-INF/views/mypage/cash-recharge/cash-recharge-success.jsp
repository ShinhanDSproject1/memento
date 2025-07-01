<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="cashImgPath" value="/resources/images/mypage/cash-recharge" />

    <meta charset="utf-8" />
<link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/mypage/cash-recharge/cash-recharge-checkout.css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <div class="box_section" style="width: 600px">
      <img width="100px" src="https://static.toss.im/illusts/check-blue-spot-ending-frame.png" />
      <h2>결제를 완료했어요</h2>

      <div class="p-grid typography--p" style="margin-top: 50px">
        <div class="p-grid-col text--left"><b>결제금액</b></div>
        <div class="p-grid-col text--right" id="amount"></div>
      </div>
      <div class="p-grid typography--p" style="margin-top: 10px">
        <div class="p-grid-col text--left"><b>충전캐시</b></div>
        <div class="p-grid-col text--right" id="cash"></div>
      </div> 
      <div class="p-grid typography--p" style="margin-top: 10px">
        <div class="p-grid-col text--left"><b>상태</b></div>
        <div class="p-grid-col text--right" id="status"></div>
      </div>
      <div class="p-grid typography--p" style="margin-top: 10px">
        <div class="p-grid-col text--left"><b>메세지</b></div>
        <div class="p-grid-col text--right" id="message"></div>
      </div>
      <div class="p-grid typography--p" style="margin-top: 10px">
        <div class="p-grid-col text--left"><b>paymentKey</b></div>
        <div class="p-grid-col text--right" id="paymentKey" style="white-space: initial; width: 250px"></div>
      </div>
      <div class="p-grid typography--p" style="margin-top: 10px">
        <div class="p-grid-col text--left"><b>주문번호</b></div>
        <div class="p-grid-col text--right" id="orderId"></div>
      </div>
      <div class="p-grid" style="margin-top: 30px">
        <button class="button p-grid-col5"  onclick="location.href='${cpath}/mypage/cash-recharge';">돌아 가기</button>
      </div>
    </div>

  <script src="${cpath}/resources/js/mypage/cash-recharge/cash-recharge-success.js"></script>