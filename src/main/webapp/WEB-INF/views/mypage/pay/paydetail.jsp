<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/pay/mypagePayDetailStyle.css" />

<div class="page-container">
	<section class="order-details">
		<header class="order-details__header">
			<h1 class="order-details__title">결제 / 사용 상세 내역</h1>
			<div id="detailMeta" class="order-details__meta">
				<div class="order-tag"> 
				<span class="order-tag__text">주문번호 : 12345678</span>
				</div> 
				<div class="order-tag tag-mentos"> 
					<span class="order-tag__text">멘토스</span>
				</div>
			</div>
		</header>

		<div class="order-details__body">
			<main class="order-details__main-content">
				<div id="productList" class="product-list">
					<p id="productCount"class="product-list__count">구매한 상품 건수 : 2</p>
					<article class="product-item">
						<div class="product-item__image"></div>
						<div class="product-item__details">
							<h2 class="product-item__name">파이썬? 야 너두 할 수 있어</h2>
							<p class="product-item__price">20,000</p>
						</div>
					</article>
					<article class="product-item">
						<div class="product-item__image"></div>
						<div class="product-item__details">
							<h2 class="product-item__name">JSON? 나 없이 쉽지 않을걸?</h2>
							<p class="product-item__price">15,000</p>
						</div>
					</article>
				</div>

				<div class="order-details__actions">
					<button class="action-button"
						onclick="location.href='${cpath}/mypage/page3'">
						<img
							src="${cpath}/resources/images/mypage/pay/pay-detail/rectangle-3051.svg"
							alt="돌아가기 배경" class="action-button__background"> <span
							class="action-button__text">돌아가기</span>
					</button>
					<button class="action-button" id="refundBtn"
						onclick="location.href='${cpath}/mypage/page5'">
						<img
							src="${cpath}/resources/images/mypage/pay/pay-detail/rectangle-3052.svg"
							alt="환불 신청하기 배경" class="action-button__background"> <span
							class="action-button__text">환불 신청하기</span>
					</button>
				</div>
			</main>

			<aside class="payment-summary">
				<div class="summary-item">
					<span class="summary-item__label --total">총 결제 금액</span> <span
						id='totalPay' class="summary-item__value --total">₩32,000</span>
				</div>
				<div class="summary-item">
					<span class="summary-item__label">상품 금액</span> <span
						id='totalPrice' class="summary-item__value">₩35,000</span>
				</div>
				<div class="summary-item">
					<span class="summary-item__label">할인 금액</span> <span
						id='discountTotal' class="summary-item__value">-₩3,000</span>
				</div>
				<div class="summary-item summary-item--indented">
					<span class="summary-item__label">포인트 할인</span> <span
						id='discountPoint' class="summary-item__value">-₩3,000</span>
				</div>
				<div class="summary-item summary-item--indented">
					<span class="summary-item__label">쿠폰 할인</span> <span
						id='discountCoupon' class="summary-item__value">-₩0</span>
				</div>

				<hr class="payment-summary__divider">

				<div class="summary-item">
					<span class="summary-item__label --status">결제 상태</span> <span
						id="payType" class="summary-item__value --status-completed">결제 완료</span>
				</div>
				<div class="summary-item">
					<span class="summary-item__label --status">결제 시간</span> <span
						id="payAt" class="summary-item__value">2025.06.16 17:20</span>
				</div>
			</aside>
		</div>
	</section>
</div>

<script src="${cpath}/resources/js/mypage/pay/payment-detail.js"></script>