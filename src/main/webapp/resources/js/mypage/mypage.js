
// DOM 로딩 후 스크린에 initial page 로드
$(function () {
  $('#screen').load(initialPage);
});

// 동적 링크 클릭 처리
$(document).on('click', '.page-link', function () {
  const url = $(this).data('url');
  if (url) loadPage(url);
});

function loadPage(url) {
  if (!url) return;

  // 오버레이 표시
  $('#loading-overlay').show();

  // 페이지 비동기 로드
  $('#screen').load(url, function (response, status) {
    $('#loading-overlay').hide(); // 로딩 완료 후 숨김

    if (status === 'error') {
      $('#screen').html('<p>페이지를 불러올 수 없습니다 😢</p>');
    } else {
      history.pushState(null, '', url);

      if (url.includes('spark-test')) {
        $.getScript(`${cpath}/resources/js/mypage/spark-test/spark-test.js`)
          .done(function () {
            const interval = setInterval(() => {
              if (document.getElementById("question-text")) {
                clearInterval(interval);
                if (typeof renderQuestion === 'function') {
                  renderQuestion();
                }
              }
            }, 30);
          })
          .fail(function () {
            console.error('spark-test.js 로드 실패');
          });
      }
    }
  });
}

// 브라우저 히스토리 상태 변경 시 처리
window.onpopstate = function () {
  // 현재 페이지의 URL 로드
  $('#screen').load(location.pathname, function () {
    // 페이지 로드 후 추가 작업 없음
  });
};

function imgUrl(imgtag, srcUrl) {
  if (srcUrl) {
    if (srcUrl[0] == '/') {
      imgtag.src = '/mememto' + srcUrl
    } else {
      imgtag.src = srcUrl
    }
  } else {
    imgtag.src = '/memento/resources/images/logo.png'
    imgtag.style.background = 'white';
  }
}
