document.getElementById("start-button").addEventListener("click", function () {
  fetch("/memento/mypage/spark-test/session-start", { method: "POST" })
    .then(() => {
      $("#screen").load("/memento/mypage/spark-test/spark-test-start");
    })
    .catch((err) => {
      alert("세션 설정 중 오류가 발생했습니다. 다시 시도해 주세요.");
      console.error(err);
    });
});