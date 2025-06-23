$(document).ready(function () {
  $(".rectangle-224 .group-167, .group-168, .group-169, .group-170, .group-171").click(function () {
    $(".group-167, .group-168, .group-169, .group-170, .group-171").removeClass("selected");
    $(this).addClass("selected");
  });
});

// 그룹을 클릭했을 때, 도형만 색상이 변하도록 하는 함수
function changeRectangleColor(event) {
    const rectangles = event.currentTarget.querySelectorAll('.rectangle-224, .rectangle-225');
    // 도형만 색상 변경
    rectangles.forEach(rectangle => {
        rectangle.classList.toggle('clicked');
    });
}

$(document).ready(function () {
  $(".rectangle-226").click(function () {
    $(".rectangle-226").removeClass("selected");
    $(this).addClass("selected");
  });
});

// 그룹을 클릭했을 때, 도형만 색상이 변하도록 하는 함수
function changeButtonColor(event) {
    // 해당 그룹 내 도형만 찾아서 색상을 변경합니다.
    const rectangles = event.currentTarget.querySelectorAll('rectangle-226');
    
    // 도형만 색상 변경
    rectangles.forEach(rectangle => {
        rectangle.classList.toggle('clicked');
    });
}