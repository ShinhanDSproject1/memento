// page4-detail.js

// 페이지의 HTML이 모두 로드되면 실행합니다.
document.addEventListener('DOMContentLoaded', () => {
    // 1. sessionStorage에서 저장했던 orderId를 가져옵니다.
    const orderId = sessionStorage.getItem('detailOrderId');

    // 2. orderId가 없으면 아무것도 하지 않습니다. (잘못된 접근)
    if (!orderId) {
        console.error('주문 ID를 찾을 수 없습니다.');
        // 에러 메시지를 화면에 표시하는 로직 추가 가능
        document.getElementById('order-detail-container').innerHTML = '<p>주문 정보를 불러올 수 없습니다.</p>';
        return;
    }

    // 3. orderId가 있으면 RestController에 데이터 요청 함수를 호출합니다.
    fetchOrderDetail(orderId);
});

async function fetchOrderDetail(orderId) {
    // 4. RestController에 GET 방식으로 데이터를 요청합니다.
    // RestController는 이 주소로 요청을 기다리고 있어야 합니다.
    const API_URL = `/memento/api/mypage/paymentdetail?orderId=${orderId}`; 
    
    try {
        const response = await fetch(API_URL);
        const data = await response.json(); // JSON 데이터 수신

        // 5. 받아온 데이터로 HTML 페이지의 내용을 채웁니다.
        document.getElementById('order-id-display').textContent = data.orderId;
        document.getElementById('order-date-display').textContent = data.orderDate;
        document.getElementById('order-amount-display').textContent = `${data.amount.toLocaleString()}원`;
        // ... 이런 식으로 페이지의 각 요소를 채워나갑니다.

    } catch (error) {
        console.error('상세 내역 로딩 실패:', error);
    }
}