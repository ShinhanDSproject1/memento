<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 결제내역 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypagePayDetailStyle.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypagePayDetailVars.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/sidebar.css" />
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<div class="div">
		<%@ include file="../common/sidebar.jsp"%>
		<div class="div10">결제 / 사용 상세 내역</div>
		<div class="rectangle-304"></div>
		<div class="rectangle-305"></div>
		<div class="frame-352">
			<div class="_12345678">주문번호 : 12345678</div>
		</div>
		<div class="frame-3606">
			<div class="div11">파이썬? 야 너두 할 수 있어</div>
			<div class="_20-000">20,000</div>
			<div class="rectangle-293"></div>
		</div>
		<div class="_2">구매한 상품 건수 : 2</div>
		<div class="frame-3651">
			<div class="json">JSON? 나 없이 쉽지 않을걸?</div>
			<div class="_15-000">15,000</div>
			<div class="rectangle-293"></div>
		</div>
		<div class="frame-3522">
			<div class="div12">멘토스</div>
		</div>
		<img class="rectangle-3052" src="${cpath}/resources/images/mypage/mypage4/rectangle-3051.svg" />
		<div class="div13" onclick="location.href='page3'">돌아가기</div>
		<img class="rectangle-3053" src="${cpath}/resources/images/mypage/mypage4/rectangle-3052.svg" />
		<div class="div14" onclick="location.href='page5'">환불 신청하기</div>
		<div class="div15">총 결제 금액</div>
		<div class="div16">결제 상태</div>
		<div class="_2025-06-16-17-20">2025.06.16 17:20</div>
		<div class="div17">결제 시간</div>
		<div class="div18">결제 완료</div>
		<div class="div19">상품 금액</div>
		<div class="div20">할인 금액</div>
		<div class="div21">
			<ul class="div-21-span">
				<li>포인트 할인</li>
			</ul>
		</div>
		<div class="div22">
			<ul class="div-22-span">
				<li>쿠폰 할인</li>
			</ul>
		</div>
		<div class="_32-000">₩32,000</div>
		<div class="_35-000">₩35,000</div>
		<div class="_3-000">-₩3,000</div>
		<div class="_3-0002">-₩3,000</div>
		<div class="_0">-₩0</div>
		<div class="line-52"></div>
	</div>
</body>
</html>