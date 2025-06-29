function generateRandomString() {
  return window.btoa(Math.random()).slice(0, 20);
}

// 1. 페이지 진입(ajax로 로딩되든 직접 진입하든)하면 cashProductInfo를 읽어서 화면 먼저 업데이트
const infoRaw = sessionStorage.getItem('cashProductInfo');
const info = infoRaw ? JSON.parse(infoRaw) : null;

if (info) {
  document.querySelector('.payment-number').textContent = `결제 금액: ${info.amount.toLocaleString()}원`;
  const totalAmount = info.amount + (info.bonus || 0);
  document.querySelector('.cash-number').textContent = `충전 금액: ${totalAmount.toLocaleString()}원`;
}else {
  document.querySelector('.payment-number').textContent = "결제 정보 없음";
}


// 2. Toss 위젯 렌더 함수 (amount에 info.amount 사용)
function renderTossWidget() {
  const paymentMethod = document.getElementById("payment-method");
  const agreement = document.getElementById("agreement");
  if (paymentMethod) paymentMethod.innerHTML = "";
  if (agreement) agreement.innerHTML = "";

  const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
  const customerKey = generateRandomString();
  const tossPayments = TossPayments(clientKey);
  const widgets = tossPayments.widgets({ customerKey });

  // 반드시 info.amount가 존재하는지 체크
  if (info && info.amount) {
    widgets.setAmount({ currency: "KRW", value: info.amount })
      .then(() => widgets.renderPaymentMethods({ selector: "#payment-method", variantKey: "DEFAULT" }))
      .then(() => widgets.renderAgreement({ selector: "#agreement", variantKey: "AGREEMENT" }));

    document.getElementById("payment-button").onclick = function() {
      widgets.requestPayment({
        orderId: generateRandomString(),
        orderName: info.description || "me:캐시 충전",
successUrl: window.location.origin + "/memento/mypage/cash-recharge/success",
failUrl: window.location.origin + "/memento/mypage/cash-recharge/fail",
        customerEmail: "customer123@gmail.com",
        customerName: "김토스",
        customerMobilePhone: "01012341234",
      });
    };
  } else {
    // 에러 안내
    document.querySelector('.payment-number').textContent = "결제 금액 정보를 불러오지 못했습니다.";
    document.getElementById("payment-button").disabled = true;
  }
}

// ajax로 결제페이지가 삽입된 뒤
renderTossWidget();