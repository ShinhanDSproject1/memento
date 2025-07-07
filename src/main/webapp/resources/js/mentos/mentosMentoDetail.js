$(document).ready(function () {
  const mentoId = new URLSearchParams(window.location.search).get("mentoId");

  $.ajax({
    url: `/memento/mentodetail/home`,
    method: "GET",
    data: { mentoId },
    success: function (res) {
      const data = res.result;
      updateIntroduce(data.introduceComment);
      renderMentosCards(data.inProgressMentos);
    },
    error: function () {
      console.error("멘토 프로필 데이터를 불러오는 데 실패했습니다.");
    }
  });
});

function updateIntroduce(comment) {
  $(".mento-pr").text(comment || "소개글이 없습니다.");
}

function renderMentosCards(mentosList) {
  const container = $(".scroll-container");
  container.empty();

  if (!mentosList || mentosList.length === 0) {
    container.append("<div>진행중인 멘토스가 없습니다.</div>");
    return;
  }

  mentosList.forEach((mentos) => {
    const card = `
      <div class="mentos-class-cardview mentos-hover-guide" onclick="location.href='/memento/mentos/detailPage?mentosId=${mentos.mentosId}'">
        <div class="mentos-class">
          <div class="mentos-text">
            <div class="frame-37862">
              <div class="frame-413">
                <div class="d">D-</div><div class="d">${mentos.daysBetween}</div>
              </div>
              <div class="frame-414">
                <div class="d">${mentos.remainMemberCnt}</div>
              </div>
            </div>
            <div class="aws">${mentos.title}</div>
            <div class="frame-406">
              <div class="frame-407">
                <img class="user-user" src="/memento/resources/images/mentosFull/mento.svg" />
                <div class="text">${mentos.mentoName}</div>
                <div class="group-371">
                  <div class="mento">mento</div>
                </div>
              </div>
              <div class="frame-408">📅 <div class="text">${mentos.startDay} ~ ${mentos.endDay}</div></div>
              <div class="frame-409">⏰ <div class="text">${mentos.startTime} - ${mentos.endTime} (${mentos.selectedDays})</div></div>
              <div class="frame-410">📍 <div class="text">${mentos.location}</div></div>
              <div class="frame-3659">
                <div class="_45-000">₩${Number(mentos.price).toLocaleString()}</div>
              </div>
            </div>
          </div>
          <img class="image" src="/memento/resources/images/mentosFull/class1.png" />
        </div>
      </div>
    `;

    container.append(card);
  });
}
