// mentosMentoDetailClassList.js
let isLoading = false;
let lastCreatedAt = null;

$(document).ready(() => {
  loadMoreData();

  $(window).on('scroll', function () {
    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 900) {
      loadMoreData();
    }
  });
});

function getMentoId() {
  const params = new URLSearchParams(window.location.search);
  return params.get("mentoId") || 0;
}

function loadMoreData() {
  if (isLoading) return;
  isLoading = true;

  $.ajax({
    url: "/memento/mentodetail/classlist",
    method: "GET",
    data: {
      mentoId: getMentoId(),
      lastCreatedAt: null 
    },

    dataType: "json",
    success: function (res) {
    console.log("응답 데이터:", res);
     if (res.code === 1000 && res.result.length > 0) {
  renderMentosCards(res.result);
  lastCreatedAt = res.result[res.result.length - 1].createdAt;
} else {
  console.log("데이터 없음 또는 실패");
}
      isLoading = false;
    },
    error: function () {
      alert("데이터 로딩 실패");
      isLoading = false;
    }
  });
}

function renderMentosCards(list) {
  const $container = $("#mentosCardContainer");
console.log("카드 추가 중:", list);
console.log("카드 붙일 위치:", $("#mentosCardContainer").length);
  $.each(list, function (_, item) {
    const card = `
      <div class="mentos-class-cardview mentos-hover-guide" onclick="location.href='/memento/mentos/detail?mentosId=${item.mentosId}'">
        <div class="mentos-class">
          <div class="mentos-text">
            <div class="frame-37862">
              <div class="frame-413"><div class="d">D-</div><div class="d">2</div></div>
              <div class="frame-414"><div class="d">확정까지</div><div class="d">3</div><div class="d">명</div></div>
            </div>
            <div class="aws">${item.title}</div>
            <div class="frame-406">
              <div class="frame-407">
                <img class="user-user" src="/memento/resources/images/mentosFull/mento.svg" />
                <div class="text">${item.mentoName}</div>
                <div class="group-371"><div class="mento">${item.userType}</div></div>
              </div>
              <div class="frame-408">
                <img class="icon-time-calendar" src="/memento/resources/images/mentosFull/day.svg" />
                <div class="text">${item.startDay}</div>
                <div class="text">-</div>
                <div class="text">${item.endDay}</div>
              </div>
              <div class="frame-409">
                <img class="icon-time-clock-outlined" src="/memento/resources/images/mentosFull/time.svg" />
                <div class="text">${item.startTime} - ${item.endTime} (${item.selectedDays})</div>
              </div>
              <div class="frame-410">
                <img class="icon-maps-map-pin" src="/memento/resources/images/mentosFull/maps.svg" />
                <div class="text">${item.region}</div>
              </div>
              <div class="frame-3659">
                <div class="_45-000">₩${Number(item.price).toLocaleString()}</div>
              </div>
            </div>
          </div>
          <img class="image" src="/memento/resources/images/mentos1/${item.mentosImg}" />
        </div>
      </div>
    `;
    $container.append(card);
  });
}