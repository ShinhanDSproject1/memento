<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 결제내역 상세</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/pay/mypagePayDetailStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageVars.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/sidebar/sidebar.css" />
</head>
<body>
	<div class="layout-wrapper">
		<%@ include file="../../header/header.jsp"%>
		<div class="main-content-wrapper">
			<%@ include file="../../sidebar/sidebar.jsp"%>
			<div class="page-container">
				<section id="order-details" class="order-details-page style_1_root">
					<header class="order-header">
						<h1 class="order-title style_2_text">결제 / 사용 상세 내역</h1>
						<div class="order-meta">
							<span class="order-number-tag style_4_frame"> <span
								class="style_5_text">주문번호 : 12345678</span>
							</span> <span class="mentor-tag style_11_frame"> <span
								class="style_12_text">멘토스</span>
							</span>
						</div>
					</header>

					<div class="order-content-columns">
						<div class="left-column">
							<div class="product-list-container style_3_panel">
								<p class="items-count style_10_text">구매한 상품 건수 : 2</p>
								<article class="product-item style_6_item">
									<div
										class="product-image-placeholder style_9_image_placeholder"></div>
									<div class="product-details">
										<h2 class="product-name style_7_text">파이썬? 야 너두 할 수 있어</h2>
										<p class="product-price style_8_text">20,000</p>
									</div>
								</article>
								<article class="product-item style_6_item">
									<div
										class="product-image-placeholder style_9_image_placeholder"></div>
									<div class="product-details">
										<h2 class="product-name style_7_text">JSON? 나 없이 쉽지 않을걸?</h2>
										<p class="product-price style_8_text">15,000</p>
									</div>
								</article>
							</div>

							<div class="action-buttons">
								<div class="button-wrapper style_13_group" id="group_298_17560" onclick="location.href='${cpath}/mypage/page3'">
									<img
										src="${cpath}/resources/images/mypage/pay/pay-detail/rectangle-3051.svg"
										alt="돌아가기 배경" class="button-background style_14_svg"> <span
										class="button-text style_15_text">돌아가기</span>
								</div>
								<div class="button-wrapper style_13_group" id="group_298_17563" onclick="location.href='${cpath}/mypage/page5'">
									<img
										src="${cpath}/resources/images/mypage/pay/pay-detail/rectangle-3052.svg"
										alt="환불 신청하기 배경" class="button-background style_16_svg">
									<span class="button-text style_15_text">환불 신청하기</span>
								</div>
							</div>
						</div>

						<aside class="payment-summary-container style_3_panel">
							<div class="summary-item">
								<span class="summary-label style_2_text">총 결제 금액</span> <span
									class="summary-value style_2_text">₩32,000</span>
							</div>
							<div class="summary-item">
								<span class="summary-label style_20_text">상품 금액</span> <span
									class="summary-value style_20_text">₩35,000</span>
							</div>
							<div class="summary-item">
								<span class="summary-label style_20_text">할인 금액</span> <span
									class="summary-value style_20_text">-₩3,000</span>
							</div>
							<div class="summary-item summary-item-indented">
								<span class="summary-label style_20_text">포인트 할인</span> <span
									class="summary-value style_20_text">-₩3,000</span>
							</div>
							<div class="summary-item summary-item-indented">
								<span class="summary-label style_20_text">쿠폰 할인</span> <span
									class="summary-value style_20_text">-₩0</span>
							</div>
							<hr class="summary-divider style_21_line">
							<div class="summary-item">
								<span class="summary-label style_17_text">결제 상태</span> <span
									class="summary-value status-completed style_19_text">결제
									완료</span>
							</div>
							<div class="summary-item">
								<span class="summary-label style_17_text">결제 시간</span> <span
									class="summary-value style_18_text">2025.06.16 17:20</span>
							</div>
						</aside>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>