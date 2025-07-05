// 페이지 로드가 완료되면 스크립트를 실행합니다.
$(() => {
	// 데이터 로딩 및 화면 표시 함수를 호출합니다.
	fetchPaymentData();

	/**
	 * 서버에서 결제 내역 데이터를 가져와 그룹화하고,
	 * 각 주문별로 DOM 요소를 생성하여 화면에 표시하는 메인 함수입니다.
	 */
	async function fetchPaymentData() {
		const container = document.getElementById('payment-list');
		const API_URL = 'http://localhost:9999/memento/api/mypage/paymentlist';
		const sessionMemberId = document.getElementById('sessionMemberId').value;
		try {
			// 1. API를 통해 결제 데이터를 비동기적으로 가져옵니다.
			const response = await fetch(API_URL);
			if (!response.ok) {
				throw new Error(`HTTP error! status: ${response.status}`);
			}
			const data = await response.json();
			const paymentList = data.result;

			// 2. 가져온 데이터를 orderId 기준으로 그룹핑합니다.
			const groupedOrders = paymentList.reduce((acc, payment) => {
				const { orderId } = payment;
				if (!acc[orderId]) {
					acc[orderId] = [];
				}
				acc[orderId].push(payment);
				return acc;
			}, {});

			// 기존에 표시되던 내용을 초기화합니다.
			container.innerHTML = '';

			// 3. 그룹화된 각 주문을 순회하며 화면에 표시할 요소를 만듭니다.
			for (const orderId in groupedOrders) {
				const items = groupedOrders[orderId]; // 해당 주문에 속한 모든 상품 배열

				// =================================================================
				// ✨ 로직 시작: 주문 분석
				// =================================================================

				// 3-1. 주문 내 각 상품의 개수, 총 금액, 사용 포인트를 정확히 집계합니다.
				const counts = { matchup: 0, mentos: 0, keepgoing: 0 };
				let price = 0;
				let point = 0;

				items.forEach(item => {
					if (item.matchupId != 0) counts.matchup++;
					if (item.mentosId != 0) counts.mentos++;
					if (item.keepgoingId != 0) counts.keepgoing++;
					price += item.amount;
					point += item.usedPoint || 0;
				});

				const totalProductCount = counts.matchup + counts.mentos + counts.keepgoing;

				// 3-2. 집계된 개수를 바탕으로 주문의 전체 성격(태그)을 결정합니다.
				let orderInfo = {};
				const isCancelled = items.some(item => item.paymentStatus === 'INACTIVE');
				const productTypesPresent = Object.values(counts).filter(count => count > 0).length;

				if (isCancelled) {
					orderInfo = { text: '주문취소', className: ' tag-cancelled' };
				} else if (totalProductCount === 0) {
					orderInfo = { text: '충전', className: ' tag-charge' };
				} else if (productTypesPresent > 1 || totalProductCount > items.length) {
					// 상품 종류가 2개 이상이거나, 한 아이템에 여러 상품이 있어도 '복합'
					orderInfo = { text: '꾸러미', className: ' tag-mix' };
				} else {
					if (counts.matchup > 0) orderInfo = { text: '매치업', className: ' tag-matchup' };
					else if (counts.mentos > 0) orderInfo = { text: '멘토스', className: ' tag-mentos' };
					else if (counts.keepgoing > 0) orderInfo = { text: '킵고잉', className: ' tag-keepgoing' };
				}

				// 3-3. 주문 성격에 맞는 대표 상품명을 '000 외 N건' 방식으로 생성합니다.
				let representativeName = '';

				if (isCancelled) {
					const firstItemWithTitle = items.find(i => i.matchupTitle || i.mentosTitle || i.keepgoingName) || items[0];
					const title = firstItemWithTitle.matchupTitle || firstItemWithTitle.mentosTitle || firstItemWithTitle.keepgoingName || '상품';
					if (totalProductCount > 1) {
						representativeName = `${title} 외 ${totalProductCount - 1}건 (주문취소)`;
					} else if (totalProductCount === 1) {
						representativeName = `${title} (주문취소)`;
					} else {
						representativeName = '캐시충전 (주문취소)';
					}
				} else if (totalProductCount === 0) {
					representativeName = '캐시충전';
				} else { // '복합', '매치업' 등 모든 상품 구매 케이스
					const firstItemWithTitle = items.find(i => i.matchupTitle || i.mentosTitle || i.keepgoingName) || items[0];
					const representativeTitle = firstItemWithTitle.matchupTitle || firstItemWithTitle.mentosTitle || firstItemWithTitle.keepgoingName || '상품';

					if (totalProductCount > 1) {
						representativeName = `${representativeTitle} 외 ${totalProductCount - 1}건`;
					} else {
						representativeName = representativeTitle;
					}
				}

				// =================================================================
				// ✨ DOM 요소 생성 및 조립 시작
				// =================================================================

				const itemArticle = document.createElement('article');
				itemArticle.className = 'payment-item';

				const itemMain = document.createElement('div');
				itemMain.className = 'item-main-info';

				const itemRow = document.createElement('div');
				itemRow.className = 'item-row-1';

				const orderNumWrapper = document.createElement('div');
				orderNumWrapper.className = 'order-number-wrapper';

				const orderNumText = document.createElement('span');
				orderNumText.className = 'order-number-text';
				orderNumText.textContent = `주문번호 : ${orderId}`;

				const tagWrapper = document.createElement('div');
				tagWrapper.className = 'tag-wrapper' + orderInfo.className;

				const tagText = document.createElement('span');
				tagText.className = 'tag-text';
				tagText.textContent = orderInfo.text;

				const itemName = document.createElement('p');
				const styleSuffix = orderInfo.className.trim().split('-')[1] || 'default';
				itemName.className = 'item-name' + ` style-${styleSuffix}`;
				itemName.textContent = representativeName;

				const itemPriceDetail = document.createElement('div')
				itemPriceDetail.className = "item-price-details"

				const priceBreakDown = document.createElement('div')
				priceBreakDown.className = 'price-breakdown'

				const priceLineAmount = document.createElement('div')
				priceLineAmount.className = 'price-line'

				const labelAmonut = document.createElement('span')
				labelAmonut.className = 'label' + ' amount'
				labelAmonut.textContent = '금액:'

				const amountValue = document.createElement('span')
				amountValue.className = 'value'
				amountValue.textContent = `${price.toLocaleString()}원`;

				const priceLinePoint = document.createElement('div')
				priceLinePoint.className = 'price-line'

				const labelPoint = document.createElement('span')
				labelPoint.className = 'label' + ' points'
				labelPoint.textContent = '포인트:'

				const pointValue = document.createElement('span')
				pointValue.className = 'value'
				pointValue.textContent = `${point.toLocaleString()}원`;

				const priceDivider = document.createElement('img')
				priceDivider.src = '/memento/resources/images/mypage/pay/line-412.svg'
				priceDivider.alt = 'price divider'
				priceDivider.className = 'price-divider-svg'

				const priceLineTotal = document.createElement('div')
				priceLineTotal.className = 'price-line'

				const labelTotal = document.createElement('span')
				labelTotal.className = 'label' + ' total'
				labelTotal.textContent = '합계:'

				const totalValue = document.createElement('span')
				totalValue.className = 'value'
				totalValue.textContent = `${(price - point).toLocaleString()}원`;

				const showDetail = document.createElement('a')
				showDetail.href = '#';
				showDetail.className = 'details-link'
				showDetail.textContent = '상세 내역 보기 >'

				// 클릭 이벤트를 추가합니다.
				showDetail.addEventListener('click', (event) => {
					// a 태그의 기본 동작(페이지 이동)을 막습니다.
					event.preventDefault();

					// sessionStorage에 클릭된 orderId를 저장합니다.
					// (sessionStorage는 브라우저 탭을 닫으면 사라지는 임시 저장소입니다)
					sessionStorage.setItem('detailOrderId', orderId);

					// ID 없는 URL로 페이지를 이동시킵니다.
					window.location.href = '/memento/mypage/page4';
				});

				// 3-5. 생성된 DOM 요소들을 조립합니다.
				priceLineTotal.append(labelTotal, totalValue)
				priceLineAmount.append(labelAmonut, amountValue)
				priceLinePoint.append(labelPoint, pointValue)
				priceBreakDown.append(priceLineAmount, priceLinePoint, priceDivider, priceLineTotal)
				itemPriceDetail.append(priceBreakDown, showDetail)

				orderNumWrapper.appendChild(orderNumText);
				tagWrapper.appendChild(tagText);
				itemRow.append(orderNumWrapper, tagWrapper);
				itemMain.append(itemRow, itemName);

				itemArticle.append(itemMain, itemPriceDetail);

				container.appendChild(itemArticle);
			}

		} catch (error) {
			console.error("데이터를 불러오는 중 오류 발생:", error);
			container.innerHTML = '<p>결제 내역을 불러올 수 없습니다.</p>';
		}
	}
});