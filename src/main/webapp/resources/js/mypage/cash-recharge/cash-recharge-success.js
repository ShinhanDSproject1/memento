// 1. 결제 승인에 필요한 쿼리 파라미터 추출
const urlParams = new URLSearchParams(window.location.search);
const paymentKey = urlParams.get("paymentKey");
const orderId = urlParams.get("orderId");
const amount = urlParams.get("amount");

// 2. 결제 상세 정보 화면에 표출
document.getElementById("paymentKey").textContent = paymentKey;
document.getElementById("orderId").textContent = orderId;
document.getElementById("amount").textContent = `${amount}원`;
document.getElementById("cash").textContent = "서버 처리중";
document.getElementById("status").textContent = "PROCESSING";
document.getElementById("message").textContent = "서버 처리중";

// 3. 결제 승인(검증) 함수: 서버에 결제 정보를 POST로 전송
async function confirmPayment() {
  /* 결제 승인 요청에 사용할 데이터 생성 */
  const requestData = {
    paymentKey,
    orderId,
    amount,
  };

  try {
    /* 서버에 결제 승인 요청 */
    const response = await fetch(cpath + "/api/mypage/confirm-cash", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(requestData),
    });
    const json = await response.json();

    if (!response.ok) {
      // 결제 실패 처리: 실패 페이지로 이동
      window.location.href = cpath + "/mypage/cash-recharge/fail?message=" + encodeURIComponent(json.message) + "&code=" + encodeURIComponent(json.code);
      return;
    }

document.getElementById("cash").textContent = json.result.cash + "원";
    document.getElementById("status").textContent = json.result.status;
    document.getElementById("message").textContent = json.result.message;
    
  } catch (err) {
    document.getElementById("message").textContent = "서버 통신 오류가 발생했습니다.";
    document.getElementById("cash").textContent = "서버 통신 오류가 발생했습니다.";
    document.getElementById("status").textContent = "FAIL";
    console.error(err);
  }
}

// 4. 페이지 로드 시 결제 승인 함수 실행
confirmPayment();