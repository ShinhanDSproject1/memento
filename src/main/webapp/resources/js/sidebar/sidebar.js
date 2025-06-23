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
     location.href = basePath + '/mypage/cash-recharge';
      break;
    case 'pay':
      $(".div5").addClass('active');
      localStorage.setItem('activeMenu', 'pay');
      location.href = basePath + '/mypage/page3';
      break;
    case 'spark':
      $(".div7").addClass('active');
      localStorage.setItem('activeMenu', 'spark');
      location.href = basePath + '/mypage/spark-test';
      break;
    case 'm_test':
      $(".div6").addClass('active');
      localStorage.setItem('activeMenu', 'm_test');
      location.href = basePath + '/mypage/mento-test';
      break;
  }
}

$(document).ready(function() {
  var activeMenu = localStorage.getItem('activeMenu');
  if (activeMenu) {
    $('.menu-item').removeClass('active');
    switch (activeMenu) {
      case 'dashboard':
        $(".div111").addClass('active');
        break;
      case 'cash':
        $(".div4").addClass('active');
        break;
      case 'pay':
        $(".div5").addClass('active');
        break;
      case 'spark':
        $(".spark-test2").addClass('active');
        break;
      case 'm_test':
        $(".div6").addClass('active');
        break;
    }
  }
});