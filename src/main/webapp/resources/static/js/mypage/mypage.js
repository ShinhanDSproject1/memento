$(function () {
  $('#screen').load(initialPage);
});

function loadPage(url) {
  if (!url) return;

  $('#screen').fadeOut(150, function () {
    $(this).html('<p>로딩 중입니다...</p>');

    $('#screen').load(url, function (response, status) {
      if (status === 'error') {
        $(this).html('<p>페이지를 불러올 수 없습니다 😢</p>');
      } else {
        history.pushState(null, '', url);

        // spark-test 페이지일 경우 전용 스크립트 불러오기
        if (url.includes('spark-test')) {
          $.getScript(`${cpath}/resources/static/js/mypage/spark-test/spark-test.js`)
            .done(function () {
             // 핵심: DOM 노드를 polling 방식으로 기다림
              const interval = setInterval(() => {
                if (document.getElementById("question-text")) {
                  clearInterval(interval);
                  if (typeof renderQuestion === 'function') {
                    renderQuestion();
                  }
                }
              }, 30); // 30ms마다 검사
            })
            .fail(function () {
              console.error('spark-test.js 로드 실패');
            });
        }
      }

      $(this).fadeIn(150);
    });
  });
}

window.onpopstate = function () {
  $('#screen').fadeOut(100, function () {
    $('#screen').load(location.pathname, function () {
      $(this).fadeIn(100);
    });
  });
};

// 동적 링크 클릭 처리
$(document).on('click', '.page-link', function () {
  const url = $(this).data('url');
  if (url) loadPage(url);
});