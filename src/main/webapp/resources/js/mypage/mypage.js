
// DOM 로딩 후 스크린에 initial page 로드
$(function () {
  $('#screen').load(initialPage);
  fetchSideBarInfo()
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
      imgtag.src = '/mememto' + `${srcUrl}`
    } else {
      imgtag.src = srcUrl
    }
  } else {
    imgtag.src = '/memento/resources/images/logo.png'
    imgtag.style.background = 'white';
  }
}

async function fetchSideBarInfo() {
  const sideBar = document.getElementById('profile-page')

  const API_URL = 'http://localhost:9999/memento/api/mypage/sidebar-info'

  try {
    const response = await fetch(API_URL)

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`)
    }

    const data = await response.json()

    const sideBarData = data.result;

    console.log(sideBarData)

    const profileImg = document.getElementById('profileImg')
    const userNicknameDiv = document.getElementById('userNickname')
    const userBalanceSpan = document.getElementById('userBalance')
    const userPointSpan = document.getElementById('userPoint')
    const userTypeDiv = document.getElementById('userType')

    if (sideBarData.profileImageUrl != 'null') {
      if (sideBarData.profileImageUrl[0] == '/') {
        profileImg.src = '/mememto' + sideBarData.profileImageUrl
      } else {
        profileImg.src = sideBarData.profileImageUrl
      }
    } else {
      profileImg.src = '/memento/resources/images/logo.png'
    }
    userNicknameDiv.textContent = `${sideBarData.nickname}`
    userBalanceSpan.textContent = `${(sideBarData.balance).toLocaleString()}`
    userPointSpan.textContent = `${sideBarData.point}P`
    userTypeDiv.textContent = `${sideBarData.userType}`

  } catch (error) {
    console.log(error)

  }
}
