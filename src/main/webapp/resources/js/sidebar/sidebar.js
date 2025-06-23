function s_click(word) {
  $('.menu-item').removeClass('active');

  switch (word) {
    case 'dashboard':
      $(".div3").addClass('active');
      localStorage.setItem('activeMenu', 'dashboard');
      location.href = basePath + '/mypage/page1';
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