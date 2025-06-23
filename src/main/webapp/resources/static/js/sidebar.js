function s_click(word) {
  $('.menu-item').removeClass('active');

  switch (word) {
    case 'dashboard':
      $(".div3").addClass('active');
      localStorage.setItem('activeMenu', 'dashboard');
      location.href = basePath + '/mypage/dashBoard';
      break;
    case 'cash':
      $(".div4").addClass('active');
      localStorage.setItem('activeMenu', 'cash');
      alert('캐시 충전 준비중');
      break;
    case 'pay':
      $(".div5").addClass('active');
      localStorage.setItem('activeMenu', 'pay');
      location.href = basePath + '/mypage/page3';
      break;
    case 'spark':
      $(".spark-test").addClass('active');
      localStorage.setItem('activeMenu', 'spark');
      alert('Spark Test 준비중');
      break;
    case 'm_test':
      $(".div6").addClass('active');
      localStorage.setItem('activeMenu', 'm_test');
      alert('멘토 자격시험 준비중');
      break;
  }
}

$(document).ready(function() {
  var activeMenu = localStorage.getItem('activeMenu');
  if (activeMenu) {
    $('.menu-item').removeClass('active');
    switch (activeMenu) {
      case 'dashboard':
        $(".div3").addClass('active');
        break;
      case 'cash':
        $(".div4").addClass('active');
        break;
      case 'pay':
        $(".div5").addClass('active');
        break;
      case 'spark':
        $(".spark-test").addClass('active');
        break;
      case 'm_test':
        $(".div6").addClass('active');
        break;
    }
  }
});

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

  // 로딩 중 메시지 표시
  $('#screen').html('<p>로딩 중입니다...</p>');

  // URL 로드
  $('#screen').load(url, function (response, status) {
    if (status === 'error') {
      $(this).html('<p>페이지를 불러올 수 없습니다 😢</p>');
    } else {
      // 히스토리 추가
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
  });
}

// 브라우저 히스토리 상태 변경 시 처리
window.onpopstate = function () {
  // 현재 페이지의 URL 로드
  $('#screen').load(location.pathname, function () {
    // 페이지 로드 후 추가 작업 없음
  });
};
