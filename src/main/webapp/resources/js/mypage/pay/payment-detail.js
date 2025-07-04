$(() => {
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
        const paymentDetail = data.result

        const counts = { matchup: 0, mentos: 0, keepgoing: 0 };
        let price = 0;
        let point = 0;

        paymentDetail.forEach(item => { // paymentDetail을 직접 반복합니다.
            if (item.matchupId != 0) {
                counts.matchup++;
                price += item.matchupPrice;
            }
            if (item.mentosId != 0) {
                counts.mentos++;
                price += item.mentosPrice;
            }

            if (item.keepgoingId != 0) {
                counts.keepgoing++;
                price += item.keepgoingPrice;
            }

            point += item.usedPoint || 0; // usedPoint가 null/undefined일 수 있다고 가정합니다.
        });

        const totalProductCount = counts.matchup + counts.mentos + counts.keepgoing;

        let orderInfo = {};
        const isCancelled = paymentDetail.some(item => item.status === 'INACTIVE' || item.payType === 'REFUND');
        const productTypesPresent = Object.values(counts).filter(count => count > 0).length;

        if (isCancelled) {
            orderInfo = { text: '주문취소', className: ' tag-cancelled' };
        } else if (totalProductCount === 0) {
            orderInfo = { text: '충전', className: ' tag-charge' };
        } else if (productTypesPresent > 1 || totalProductCount > paymentDetail.length) {
            // 상품 종류가 2개 이상이거나, 한 아이템에 여러 상품이 있어도 '복합'
            orderInfo = { text: '꾸러미', className: ' tag-mix' };
        } else {
            if (counts.matchup > 0) orderInfo = { text: '매치업', className: ' tag-matchup' };
            else if (counts.mentos > 0) orderInfo = { text: '멘토스', className: ' tag-mentos' };
            else if (counts.keepgoing > 0) orderInfo = { text: '킵고잉', className: ' tag-keepgoing' };
        }

        // ... 이런 식으로 페이지의 각 요소를 채워나갑니다.
        console.log(paymentDetail); // paymentDetail을 직접 로깅합니다.

        const detailMeta = document.getElementById('detailMeta');
        detailMeta.innerHTML = '';

        const orderIdTag = document.createElement('div');
        orderIdTag.className = 'order-tag';

        const orderIdText = document.createElement('span');
        orderIdText.className = 'order-tag__text';
        orderIdText.textContent = `주문번호 : ${orderId}`;

        const orderTag = document.createElement('div');
        orderTag.className = 'order-tag' + orderInfo.className; // 결정된 orderInfo.className을 사용합니다.

        const orderTagText = document.createElement('span');
        orderTagText.className = 'order-tag__text';
        orderTagText.textContent = orderInfo.text; // 결정된 orderInfo.text를 사용합니다.

        orderIdTag.appendChild(orderIdText);
        orderTag.appendChild(orderTagText);
        detailMeta.append(orderIdTag, orderTag);

        const productList = document.getElementById('productList')
        productList.innerHTML = ''
        const countText = document.createElement('p')
        countText.className = 'product-list__count'
        countText.textContent = `구매한 상품 건수 : ${totalProductCount}`
        productList.append(countText)

        paymentDetail.forEach(item => {
            // 1. 각 상품 유형에 대한 플래그를 설정하여 어떤 유형의 상품이 있는지 확인
            const isMatchup = item.matchupId != 0;
            const isMentos = item.mentosId != 0;
            const isKeepgoing = item.keepgoingId != 0;
            const isCharge = item.payType == 'CHARGE';
            const isRefund = item.payType == 'REFUND';

            // 2. 단일 항목으로 처리되는 경우 (충전, 환불)
            if (isCharge || isRefund) {
                const card = document.createElement('article');
                card.className = 'product-item';
                const productImg = document.createElement('img');
                productImg.className = 'product-item__image';
                productImg.alt = '상품 이미지';
                const productDetails = document.createElement('div');
                productDetails.className = 'product-item__details';
                const itemName = document.createElement('h2');
                itemName.className = 'product-item__name';
                const itemPrice = document.createElement('p');
                productDetails.append(itemName, itemPrice);
                card.append(productImg, productDetails);

                productImg.src = '/memento/resources/images/logo.png';
                productImg.style.background = 'white';
                if (isCharge) {
                    itemName.textContent = '캐시충전';
                    itemName.style.color = '#0864FF'
                    itemPrice.textContent = `₩${item.amount.toLocaleString()}`;
                } else { // isRefund
                    itemName.textContent = '주문취소';
                    itemName.style.color = '#E0671F'
                    itemPrice.textContent = `₩${item.amount.toLocaleString()}`;
                }
                productList.append(card);
            } else {
                // 3. 복합 상품 (매치업, 멘토스, 킵고잉 중 하나 이상)
                // 각 유형별로 별도의 카드를 생성합니다.
                if (isMatchup) {
                    const card = document.createElement('article');
                    card.className = 'product-item';
                    const productImg = document.createElement('img');
                    productImg.className = 'product-item__image';
                    productImg.alt = '상품 이미지';
                    const productDetails = document.createElement('div');
                    productDetails.className = 'product-item__details';
                    const itemName = document.createElement('h2');
                    itemName.className = 'product-item__name';
                    const itemPrice = document.createElement('p');
                    productDetails.append(itemName, itemPrice);
                    card.append(productImg, productDetails);

                    if (item.memberProfileImageUrl) {
                        productImg.src = item.memberProfileImageUrl.startsWith('/') ? '/memento' + item.memberProfileImageUrl : item.memberProfileImageUrl;
                    } else {
                        productImg.src = '/memento/resources/images/logo.png';
                        productImg.style.background = 'white';
                    }
                    itemName.textContent = `${item.matchupTitle}`;
                    itemName.style.color = '#a8c3db'
                    itemPrice.textContent = `₩${item.matchupPrice.toLocaleString()}`;
                    productList.append(card);
                }

                if (isMentos) {
                    const card = document.createElement('article');
                    card.className = 'product-item';
                    const productImg = document.createElement('img');
                    productImg.className = 'product-item__image';
                    productImg.alt = '상품 이미지';
                    const productDetails = document.createElement('div');
                    productDetails.className = 'product-item__details';
                    const itemName = document.createElement('h2');
                    itemName.className = 'product-item__name';
                    const itemPrice = document.createElement('p');
                    productDetails.append(itemName, itemPrice);
                    card.append(productImg, productDetails);

                    if (item.mentosImage) {
                        productImg.src = item.mentosImage.startsWith('/') ? '/memento' + item.mentosImage : item.mentosImage;
                    } else {
                        productImg.src = '/memento/resources/images/logo.png';
                        productImg.style.background = 'white';
                    }
                    itemName.textContent = `${item.mentosTitle}`;
                    itemName.style.color = '#668985'
                    itemPrice.textContent = `₩${item.mentosPrice.toLocaleString()}`;
                    productList.append(card);
                }

                if (isKeepgoing) {
                    const card = document.createElement('article');
                    card.className = 'product-item';
                    const productImg = document.createElement('img');
                    productImg.className = 'product-item__image';
                    productImg.alt = '상품 이미지';
                    const productDetails = document.createElement('div');
                    productDetails.className = 'product-item__details';
                    const itemName = document.createElement('h2');
                    itemName.className = 'product-item__name';
                    const itemPrice = document.createElement('p');
                    productDetails.append(itemName, itemPrice);
                    card.append(productImg, productDetails);

                    if (item.keepgoingImgLogo) {
                        productImg.src = item.keepgoingImgLogo.startsWith('/') ? '/memento' + item.keepgoingImgLogo : item.keepgoingImgLogo;
                    } else {
                        productImg.src = '/memento/resources/images/logo.png';
                        productImg.style.background = 'white';
                    }
                    itemName.textContent = `${item.keepgoingName}`;
                    itemName.style.color = '#49779f'
                    itemPrice.textContent = `₩${item.keepgoingPrice.toLocaleString()}`;
                    productList.append(card);
                }
            }
        });
        const totalPay = document.getElementById('totalPay')
        if (totalProductCount == 0) {
            totalPay.textContent = `₩${(paymentDetail[0].amount / 1.05).toLocaleString()}`
        } else {
            totalPay.textContent = `₩${(price - point).toLocaleString()}`
        }
        const totalPrice = document.getElementById('totalPrice')
        totalPrice.textContent = `₩${price.toLocaleString()}`
        const discountTotal = document.getElementById('discountTotal')
        discountTotal.textContent = `-₩${point.toLocaleString()}`
        const discountPoint = document.getElementById('discountPoint')
        discountPoint.textContent = `-₩${point.toLocaleString()}`
        const discountCoupon = document.getElementById('discountCoupon')

        const payType = document.getElementById('payType')
        const payAt = document.getElementById('payAt')
        let payTypeText = ''
        if (paymentDetail[0].payType == 'USE') {
            payTypeText = '결제 완료'
        }
        if (paymentDetail[0].payType == 'CHARGE') {
            payTypeText = '충전 완료'
            payType.style.color = '#0864FF'
        }

        if (paymentDetail[0].payType == 'REFUND') {
            payTypeText = '환불 완료'
            payType.style.color = '#E0671F'
        }
        const dateTimeString = paymentDetail[0].payAt
        const parts = dateTimeString.split(':')
        const paytime = parts[0] + ':' + parts[1];
        payAt.textContent = paytime
        payType.textContent = payTypeText

        let status = 0
        const refundBtn = document.getElementById('refundBtn')
        paymentDetail.forEach(payment => {

            if (payment.payType == 'REFUND') {
                status = 1
                console.log('status update')
            }

            if (payment.matchupCount >= 1) {
                status = 1
                console.log('status update')
            }

            if (payment.mentosStartDay != null && payment.mentosStartDay != '') {
                const mentosStartDay = new Date(payment.mentosStartDay)
                let today = new Date()
                if (today.getTime() > mentosStartDay.getTime()) {
                    status = 1
                    console.log('status update')
                }
            }
        })
        console.log(status)
        hideRefundBtn(status)

    } catch (error) {
        console.error('상세 내역 로딩 실패:', error);
    }

    function hideRefundBtn(status) {
        const refundBtn = document.getElementById('refundBtn')
        if (status == 1) {
            refundBtn.style.display = 'none'
        } else {
            refundBtn.style.display = 'block'
        }
    }
}