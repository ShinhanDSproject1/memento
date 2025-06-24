$(document).ready(function() {
  $('#attendance-check').on('click', function() {
    if (confirm('출석체크하시겠습니까?')) {
      $(this).find('img').attr('src', basePath + '/resources/images/mypage/dash-board/vector2.svg');
    }
  });
});