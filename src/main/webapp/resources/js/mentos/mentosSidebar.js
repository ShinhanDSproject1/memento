$(document).ready(function () {
  const mentoId = new URLSearchParams(window.location.search).get("mentoId");
  console.log("▶ 가져온 mentoId:", mentoId); // 여기 추가

  $('.dynamic-link').on('click', function () {
    const baseUrl = $(this).data('url-template');
    console.log("▶ 클릭된 버튼의 baseUrl:", baseUrl); // 여기 추가

    if (mentoId) {
      const fullUrl = baseUrl + mentoId;
      console.log("▶ 최종 이동 주소:", fullUrl); // 여기 추가
      location.href = fullUrl;
    } else {
      alert("mentoId 없음");
    }
  });

  $('.page-link:not(.dynamic-link)').on('click', function () {
    const url = $(this).data('url');
    console.log("▶ 일반 버튼 클릭, 이동 주소:", url); // 여기 추가
    if (url) location.href = url;
  });
});


