$(()=>{
	fetchPaymentData()
	
	async function fetchPaymentData() {
		const container = document.getElementById('payment-list');
		
		const API_URL = 'http://localhost:9999/memento/api/mypage/paymentlist';
	
		try{
			const response = await fetch(API_URL);
			
			if (!response.ok) {
	            throw new Error(`HTTP error! status: ${response.status}`);
	        }
	        
	         // 3. JSON 데이터를 JavaScript 객체로 변환합니다.
	        const data = await response.json();
	
	        // 4. 실제 데이터가 담긴 `result` 배열을 가져옵니다.
	        const paymentList = data.result;
	        
	        // 5. container(데이터 넣을 곳) 리셋
	        //container.innerHTML = '';
	        
	        //데이터를 orderId 기준으로 그룹핑합니다.
        	const groupedOrders = paymentList.reduce((acc, payment) => {
	            const { orderId } = payment;
	            // acc에 해당 orderId가 없으면 빈 배열로 초기화
	            if (!acc[orderId]) {
	                acc[orderId] = [];
	            }
	            // 해당 orderId 배열에 현재 결제 항목 추가
	            acc[orderId].push(payment);
	            return acc;
        	}, {});
        	
        	
        	
        	
	        
		}
		//catch (error){
		//console.error("데이터를 불러오는 중 오류 발생:", error);
        //container.innerHTML = '<p>매치업 목록을 불러올 수 없습니다.</p>';
		//}
	}
	
	
})