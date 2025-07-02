<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />	
<script
	src="${cpath}/resources/js/mypage/pay/payment.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/pay/mypagePayStyle.css" />
<input type="hidden" id="sessionMemberId" value="${sessionScope.loginMember.memberId}">
<div class="page-container">
	<section id="payment-history" class="payment-history-section">
		<div class="payment-history-container">
			<h1 class="main-title">결제 / 사용 내역</h1>
			<div id="payment-list" class="payment-items-list">
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
								src="${cpath}/resources/images/mypage/pay/line-412.svg"
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
								src="${cpath}/resources/images/mypage/pay/line-412.svg"
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
								src="${cpath}/resources/images/mypage/pay/line-412.svg"
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
								src="${cpath}/resources/images/mypage/pay/line-412.svg"
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
								src="${cpath}/resources/images/mypage/pay/line-412.svg"
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
								src="${cpath}/resources/images/mypage/pay/line-412.svg"
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