$(document).ready(function () {
  $(".rectangle-224 .group-167, .group-168, .group-169, .group-170, .group-171").click(function () {
    $(".group-167, .group-168, .group-169, .group-170, .group-171").removeClass("selected");
    $(this).addClass("selected");
  });
});

function changeRectangleColor(event) {
    // 모든 클릭 상태를 초기화
    document.querySelectorAll('.rectangle-224, .rectangle-225, .rectangle-2242, .rectangle-2252, .rectangle-2253, .rectangle-2254, .rectangle-2255, .rectangle-2243, .rectangle-2244, .rectangle-2245')
        .forEach(rect => rect.classList.remove('clicked'));

    // 클릭된 그룹 내 도형만 클릭 상태로 변경
    const rectangles = event.currentTarget.querySelectorAll('.rectangle-224, .rectangle-225, .rectangle-2242, .rectangle-2252, .rectangle-2253, .rectangle-2254, .rectangle-2255, .rectangle-2243, .rectangle-2244, .rectangle-2245');
    
    rectangles.forEach(rectangle => {
        rectangle.classList.add('clicked');
    });
}

$(document).ready(function () {
  $(".rectangle-226").click(function () {
    $(".rectangle-226").removeClass("selected");
    $(this).addClass("selected");
  });
});

function changeButtonColor(event) {
    // 모든 버튼 도형 클릭 해제
    document.querySelectorAll('.rectangle-226').forEach(rect => rect.classList.remove('clicked'));

    // 클릭된 그룹 내의 도형만 클릭 상태로 변경
    const rectangles = event.currentTarget.querySelectorAll('.rectangle-226');
    
    rectangles.forEach(rectangle => {
        rectangle.classList.add('clicked');
    });
}