$('#start-mento-test-button').click(function () {
  $.ajax({
    url: cpath + '/api/mypage/mento-test-check-expiration',
    method: 'POST',
    contentType: 'application/json',
    success: function (res) {
      if (res.result.expiration === 'success') {
        window.location.href = cpath + '/mypage/mento-test/mento-test-start';
      } else {
        alert('오늘은 이미 응시하셨습니다.');
      }
    },
    error: function () {
      alert('서버 오류 또는 로그인 필요');
    }
  });
});