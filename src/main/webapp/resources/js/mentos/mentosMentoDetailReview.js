$(document).ready(() => {
  loadReviews(); // 한 번만 호출
});

function getMentoId() {
  const params = new URLSearchParams(window.location.search);
  return params.get("mentoId") || 0;
}

function formatDateTime(input) {
  const date = new Date(input);
  const pad = (n) => n.toString().padStart(2, '0');
  return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())} ` +
         `${pad(date.getHours())}:${pad(date.getMinutes())}:${pad(date.getSeconds())}`;
}

function loadReviews() {
  $.ajax({
    url: "/memento/mentodetail/review",
    method: "GET",
    data: {
      mentoId: getMentoId(),
      lastCreatedAt: null // 한 번만 불러오기
    },
    dataType: "json",
    success: function (res) {
      if (res.code === 1000 && res.result.length > 0) {
        renderReviewCards(res.result);
      }
    },
    error: function () {
      alert("리뷰 데이터를 불러오는 데 실패했습니다.");
    },
  });
}

function renderReviewCards(list) {
  const $container = $("#reviewContainer");

  $.each(list, function (_, item) {
    const stars = generateStars(item.score);
    const card = `
      <div class="review-table">
        <img class="image" src="/memento/resources/images/mentosFull/${item.reviewImg}" />
        <div class="group-344">
          <div class="vote">${stars}</div>
          <div class="text">${item.reviewerName} | ${item.createdAt}</div>
          <div class="title">${item.title}</div>
          <div class="review">${item.reviewComment}</div>
        </div>
      </div>
    `;
    $container.append(card);
  });
}

function generateStars(score) {
  const fullStar = '<span>★</span>';
  const emptyStar = '<span>☆</span>';
  const rounded = Math.round(score);
  return fullStar.repeat(rounded) + emptyStar.repeat(5 - rounded);
}
