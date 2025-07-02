// page4-detail.js
$(()=>{
 	const orderId = sessionStorage.getItem('detailOrderId');
 	console.log(orderId)
 	if (!orderId) {
        console.error('주문 ID를 찾을 수 없습니다.');
        // 에러 메시지를 화면에 표시하는 로직 추가 가능
        document.getElementById('order-detail-container').innerHTML = '<p>주문 정보를 불러올 수 없습니다.</p>';
        return;
    }

    // 3. orderId가 있으면 RestController에 데이터 요청 함수를 호출합니다.
    fetchOrderDetail(orderId);
})

async function fetchOrderDetail(orderId) {
    // 4. RestController에 GET 방식으로 데이터를 요청합니다.
    // RestController는 이 주소로 요청을 기다리고 있어야 합니다.
    const API_URL = `/memento/api/mypage/paymentdetail?orderId=${orderId}`;
    
    try {
        const response = await fetch(API_URL);
        const data = await response.json(); // JSON 데이터 수신

        // 5. 받아온 데이터로 HTML 페이지의 내용을 채웁니다.
       	console.log(data)
        // ... 이런 식으로 페이지의 각 요소를 채워나갑니다.

    } catch (error) {
        console.error('상세 내역 로딩 실패:', error);
    }
}