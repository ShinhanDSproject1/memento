<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 결제내역</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypagePayStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageVars.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/sidebar.css" />
</head>
<body>
	<div class="layout-wrapper">
		<%@ include file="../common/header.jsp"%>
		<div class="main-content-wrapper">
			<%@ include file="../common/sidebar.jsp"%>
			<div class="page-container">
				<section id="payment-history" class="payment-history-section">
					<div class="payment-history-container">
						<h1 class="main-title">결제 / 사용 내역</h1>
						<div class="payment-items-list">
							<article class="payment-item">
								<div class="item-main-info">
									<div class="item-row-1">
										<div class="order-number-wrapper">
											<span class="order-number-text">주문번호 : 12345678</span>
										</div>
										<div class="tag-wrapper tag-mentos">
											<span class="tag-text">멘토스</span>
										</div>
									</div>
									<p class="item-name">
										<span class="item-name-main style-6-variant">파이썬? 야 너두
											할 수 있어</span> <span class="item-name-extra style-6-variant">
											외 1건</span>
									</p>
								</div>
								<div class="item-price-details">
									<div class="price-breakdown">
										<div class="price-line">
											<span class="label amount">금액:</span> <span class="value">35,000</span>
										</div>
										<div class="price-line">
											<span class="label points">포인트:</span> <span class="value">2,000</span>
										</div>
										<div>
										<img
											src="/page/fafed4a0-cb5b-4d18-828f-a087ba6477a6/images/298_17407.svg"
											alt="price divider" class="price-divider-svg" />
										</div>
										<div class="price-line">
											<span class="label total">합계:</span> <span class="value">33,000</span>
										</div>
									</div>
									<a href="${cpath}/mypage/page4" class="details-link">상세 내역 보기 ></a>
								</div>
							</article>

							<article class="payment-item">
								<div class="item-main-info">
									<div class="item-row-1">
										<div class="order-number-wrapper">
											<span class="order-number-text">주문번호 : 12345678</span>
										</div>
										<div class="tag-wrapper tag-matchup-1">
											<span class="tag-text">매치업</span>
										</div>
									</div>
									<p class="item-name style-22">개발새발 코딩 스터디</p>
								</div>
								<div class="item-price-details">
									<div class="price-breakdown">
										<div class="price-line">
											<span class="label amount">금액:</span> <span class="value">35,000</span>
										</div>
										<div class="price-line">
											<span class="label points">포인트:</span> <span class="value">2,000</span>
										</div>
										<img
											src="/page/fafed4a0-cb5b-4d18-828f-a087ba6477a6/images/298_17423.svg"
											alt="price divider" class="price-divider-svg" />
										<div class="price-line">
											<span class="label total">합계:</span> <span class="value">33,000</span>
										</div>
									</div>
									<a href="${cpath}/mypage/page4" class="details-link">상세 내역 보기 ></a>
								</div>
							</article>

							<article class="payment-item">
								<div class="item-main-info">
									<div class="item-row-1">
										<div class="order-number-wrapper">
											<span class="order-number-text">주문번호 : 12345678</span>
										</div>
										<div class="tag-wrapper tag-cancelled">
											<span class="tag-text">주문취소</span>
										</div>
									</div>
									<p class="item-name style-25">손쉬운 정보처리기사</p>
								</div>
								<div class="item-price-details">
									<div class="price-breakdown">
										<div class="price-line">
											<span class="label amount">금액:</span> <span class="value">35,000</span>
										</div>
										<div class="price-line">
											<span class="label points">포인트:</span> <span class="value">2,000</span>
										</div>
										<img
											src="/page/fafed4a0-cb5b-4d18-828f-a087ba6477a6/images/298_17439.svg"
											alt="price divider" class="price-divider-svg" />
										<div class="price-line">
											<span class="label total">합계:</span> <span class="value">33,000</span>
										</div>
									</div>
									<a href="${cpath}/mypage/page4" class="details-link">상세 내역 보기 ></a>
								</div>
							</article>

							<article class="payment-item">
								<div class="item-main-info">
									<div class="item-row-1">
										<div class="order-number-wrapper">
											<span class="order-number-text">주문번호 : 12345678</span>
										</div>
										<div class="tag-wrapper tag-matchup-2">
											<span class="tag-text">매치업</span>
										</div>
									</div>
									<p class="item-name style-22">알고리즘 마스터반(교재)</p>
								</div>
								<div class="item-price-details">
									<div class="price-breakdown">
										<div class="price-line">
											<span class="label amount">금액:</span> <span class="value">35,000</span>
										</div>
										<div class="price-line">
											<span class="label points">포인트:</span> <span class="value">2,000</span>
										</div>
										<img
											src="/page/fafed4a0-cb5b-4d18-828f-a087ba6477a6/images/298_17455.svg"
											alt="price divider" class="price-divider-svg" />
										<div class="price-line">
											<span class="label total">합계:</span> <span class="value">33,000</span>
										</div>
									</div>
									<a href="${cpath}/mypage/page4" class="details-link">상세 내역 보기 ></a>
								</div>
							</article>

							<article class="payment-item">
								<div class="item-main-info">
									<div class="item-row-1">
										<div class="order-number-wrapper">
											<span class="order-number-text">주문번호 : 12345678</span>
										</div>
										<div class="tag-wrapper tag-mentos">
											<span class="tag-text">멘토스</span>
										</div>
									</div>
									<p class="item-name style-25">봄이오겠냐? 스프링</p>
								</div>
								<div class="item-price-details">
									<div class="price-breakdown">
										<div class="price-line">
											<span class="label amount">금액:</span> <span class="value">35,000</span>
										</div>
										<div class="price-line">
											<span class="label points">포인트:</span> <span class="value">2,000</span>
										</div>
										<img
											src="/page/fafed4a0-cb5b-4d18-828f-a087ba6477a6/images/298_17471.svg"
											alt="price divider" class="price-divider-svg" />
										<div class="price-line">
											<span class="label total">합계:</span> <span class="value">33,000</span>
										</div>
									</div>
									<a href="${cpath}/mypage/page4" class="details-link">상세 내역 보기 ></a>
								</div>
							</article>

							<article class="payment-item">
								<div class="item-main-info">
									<div class="item-row-1">
										<div class="order-number-wrapper">
											<span class="order-number-text">주문번호 : 12345678</span>
										</div>
										<div class="tag-wrapper tag-mentos">
											<span class="tag-text">멘토스</span>
										</div>
									</div>
									<p class="item-name style-25">봄이오겠냐? 스프링</p>
								</div>
								<div class="item-price-details">
									<div class="price-breakdown">
										<div class="price-line">
											<span class="label amount">금액:</span> <span class="value">35,000</span>
										</div>
										<div class="price-line">
											<span class="label points">포인트:</span> <span class="value">2,000</span>
										</div>
										<img
											src="/page/fafed4a0-cb5b-4d18-828f-a087ba6477a6/images/298_17487.svg"
											alt="price divider" class="price-divider-svg" />
										<div class="price-line">
											<span class="label total">합계:</span> <span class="value">33,000</span>
										</div>
									</div>
									<a href="${cpath}/mypage/page4" class="details-link">상세 내역 보기 ></a>
								</div>
							</article>

						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>