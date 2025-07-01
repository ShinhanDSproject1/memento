/* 전역 변수 선언 (재선언 방지) */
if (typeof window.selectedProductId === "undefined") {
  window.selectedProductId = null;
}
if (typeof window.selectedAmount === "undefined") {
  window.selectedAmount = 0;
}

/* 금액 옵션 클릭 이벤트 등록 */
document.querySelectorAll('.option').forEach(option => {
  option.addEventListener('click', function() {
    document.querySelectorAll('.option').forEach(opt => opt.classList.remove('selected'));
    this.classList.add('selected');
    const amountText = this.querySelector('.amount').textContent.replace(/[^0-9]/g, '');
    window.selectedAmount = Number(amountText);
    window.selectedProductId = this.getAttribute('data-id');
    document.querySelector('.balance-amount').textContent = selectedAmount.toLocaleString() + '원';
    document.getElementById('open-modal-btn').disabled = false;
  });
});

/* 충전하기 버튼 클릭 시 POST로 서버에 금액 전송 (jQuery AJAX 버전) */
$('#open-modal-btn').on('click', function (e) {
    /* 선택 금액 없으면 리턴 */
    if (!window.selectedAmount) {
        e.preventDefault();
        return false;
    }

    /* 클릭 스타일 효과 */
    $(this).addClass('clicked');

    /* POST로 데이터 전송 */
	$.ajax({
	url: $(this).data('url'),
	type: 'POST',
	contentType: 'application/json; charset=utf-8',
	data: JSON.stringify({cashProductID: window.selectedProductId}),
	success: function (response) {
	console.log('서버 응답:', response);
    // 세션스토리지에 저장
    sessionStorage.setItem('cashProductInfo', JSON.stringify(response.result));
    // 결제페이지로 이동
    window.location.href = cpath + '/mypage/cash-recharge/checkout';
	},
	error: function () {$('#screen').html('<p>충전 페이지를 불러오지 못했습니다 😢</p>');}
	});

	e.preventDefault(); // 기본 submit 막기
});


/* 페이지 새로고침&뒤로가기 시 초기화 */
window.addEventListener('pageshow', function() {
  selectedAmount = null;
  document.getElementById('open-modal-btn').disabled = true;
  document.querySelectorAll('.option').forEach(opt => opt.classList.remove('selected'));
  document.querySelector('.balance-amount').textContent = '0원';
});
