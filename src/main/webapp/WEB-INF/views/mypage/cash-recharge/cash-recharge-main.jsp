<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="cashImgPath" value="/resources/images/mypage/cash-recharge" />
<link rel="stylesheet" href="${cpath}/resources/css/mypage/cash-recharge/cash-recharge-main.css" />

<div class="cash-recharge-container">
    <!-- 상단 타이틀 -->
    <div class="recharge-header">
        <div class="title">
            <span class="brand">me</span>
            <span class="action">캐시충전</span>
        </div>
        <div class="cash-recharge-divider"></div>
    </div>
    <!-- 배너/공지 -->
    <div class="banner">지금 충전하면 <b>추가적립 5~10%</b>를 드려요!</div>
    <div class="desc">me캐시는 모든 활동에 쓸 수 있어요!</div>
    <img class="brand-logo" src="${cashImgPath}/logo.png" alt="me:mento 캐시 로고" />

    <!-- 충전 금액 선택 -->
    <div class="recharge-options">
        <div class="option" data-id="1">
            <div class="option-bg"></div>
            <img class="option-icon" src="${cashImgPath}/won.svg" alt="5,000원" />
            <div class="amount">₩ 5,000</div>
            <div class="option-info"><ul><li>추가 캐시 250원 제공(5%)</li></ul></div>
        </div>
        <div class="option" data-id="2">
            <div class="option-bg"></div>
            <img class="option-icon" src="${cashImgPath}/won.svg" alt="10,000원" />
            <div class="amount">₩ 10,000</div>
            <div class="option-info"><ul><li>추가 캐시 500원 제공(5%)</li></ul></div>
        </div>
        <div class="option" data-id="3">
            <div class="option-bg"></div>
            <img class="option-icon" src="${cashImgPath}/won.svg" alt="30,000원" />
            <div class="amount">₩ 30,000</div>
            <div class="option-info"><ul><li>추가 캐시 1,500원 제공(10%)</li></ul></div>
        </div>
        <div class="option" data-id="4">
            <div class="option-bg"></div>
            <img class="option-icon" src="${cashImgPath}/won.svg" alt="50,000원" />
            <div class="amount">₩ 50,000</div>
            <div class="option-info"><ul><li>추가 캐시 5,000원 제공(10%)</li></ul></div>
        </div>
        <div class="option" data-id="5">
            <div class="option-bg"></div>
            <img class="option-icon" src="${cashImgPath}/won.svg" alt="100,000원" />
            <div class="amount">₩ 100,000</div>
            <div class="option-info"><ul><li>추가 캐시 10,000원 제공(10%)</li></ul></div>
        </div>
    </div>

    <!-- 잔액/상세정보 -->
    <section class="balance-section">
        <div class="balance-header">
            <span class="label">결제</span>
            <span class="brand">me</span>
            <span class="label">캐시</span>
        </div>
        <div class="balance-amount">0원</div>
        <div class="cash-recharge-divider"></div>
        <div class="balance-details">
            <div>현재 보유 me캐시: <span class="amount">0원</span></div>
            <div>5000원</div>
            <div>5250원</div>
            <div>250원</div>
            <div class="info">충전 금액, 추가 적립, 이벤트, 총 me캐시</div>
            <div class="cash-recharge-divider"></div>
        </div>
    </section>


  
    <!-- 충전하기 버튼 + 안내문구 -->
    <div class="submit-section">
        <button class="submit-btn" id="open-modal-btn" 
            data-url="${cpath}/api/mypage/validate-cash" disabled>
            <span class="brand">me</span> 캐시 충전하기
        </button>
    </div>
    <div class="amount-guide-msg">※ 충전 금액을 선택하면 버튼이 활성화됩니다.</div>

    <!-- 결제 동의 체크 -->
    <div class="agreement-section">
        <span>충전하기 버튼을 누르시면 아래 주의사항에 대해 동의한 것으로 확인합니다.</span>
        <img class="agree-check" src="${cashImgPath}/check.svg" alt="동의" />
    </div>
    
    <!-- 안내/설명 영역 -->
    <section class="info-section">
        <h2>꼭 확인해주세요</h2>
        <div class="info-cash-recharge-divider"></div>
        <div class="info-content">
            <p><strong>me캐시란?</strong></p>
            <ul>
                <li>한 번 충전하면 손쉽게 사용 가능한 ‘me:mento만의 간편한 결제 수단’입니다.</li>
                <li>충전한 me캐시는 me:mento에서만 사용할 수 있습니다.</li>
            </ul>
            <p><strong>사용 순서</strong></p>
            <ul>
                <li>이벤트me캐시 &gt; 추가적립me캐시 &gt; 충전me캐시 순서로 사용됩니다.</li>
            </ul>
            <p><strong>충전 취소 및 환불</strong></p>
            <ul>
                <li>충전 후 한 번도 사용하지 않은 경우, 결제수단에 따라 충전일로부터 7일 이내에 [me캐시충전&gt;충전/사용내역]에서 직접 결제취소 하실 수 있습니다.</li>
                <li>충전일로부터 7일이 경과 한 후 충전취소와 예치금환불은 고객센터로 문의 주시기 바랍니다.</li>
                <li>단, iOS앱에서 충전한 me캐시의 취소는 애플 정책에 따라 애플 고객센터(080-333-4000)를 통해서만 가능합니다.</li>
                <li>단, Google Play로 충전한 me캐시는 구글 정책에 따라 결제 후 48시간 이내에는 Google Play 고객센터를 통해, 48시간 이후에는 교보문고 고객센터(1:1 문의하기)를 통해 취소할 수 있습니다.</li>
            </ul>
            <p>
                ※ me캐시의 상세 안내 내용은 <span class="link">이용안내</span> 및 <span class="link">이용약관</span> 페이지에서 확인해주세요.
            </p>
        </div>
    </section>
</div>
<script src="${cpath}/resources/js/mypage/cash-recharge/cash-recharge-main.js"></script>
