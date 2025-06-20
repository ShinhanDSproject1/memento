$(document).ready(function() {
  $('#notification-icon').click(function() {
    $('#notificationModal').toggle();  // 토글
  });

  // 모달 바깥 클릭 시 모달 닫기
  $(document).mouseup(function(e) {
    var container = $("#notificationModal");
    var icon = $("#notification-icon");
    if (!container.is(e.target) && container.has(e.target).length === 0 && !icon.is(e.target)) {
      container.hide();
    }
  });
});

$(document).ready(function() {
  console.log('jQuery ready!');

  $('#notification-icon').click(function() {
    console.log('아이콘 클릭됨!');
    $('#notificationModal').toggle();
  });

  $(document).mouseup(function(e) {
    var container = $("#notificationModal");
    var icon = $("#notification-icon");
    if (!container.is(e.target) && container.has(e.target).length === 0 && !icon.is(e.target)) {
      container.hide();
    }
  });
});
