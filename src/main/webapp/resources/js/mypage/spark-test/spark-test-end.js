(function () {
  console.log("[spark-test-end.js] 결과 페이지 스크립트 실행됨 ✅");

  const rawScore = localStorage.getItem("sparkTypeScore");

  if (!rawScore) {
    alert("결과 정보가 없습니다. 테스트를 먼저 진행해주세요.");
    location.replace("/memento/mypage/spark-test");
    return;
  }

  const typeScore = JSON.parse(rawScore);
  console.log("✅ 불러온 점수 정보:", typeScore);

  const total = Object.values(typeScore).reduce((a, b) => a + b, 0);
  const percentages = Object.fromEntries(
    Object.entries(typeScore).map(([type, score]) => [
      type,
      Math.round((score / total) * 100)
    ])
  );

  // 가장 높은 점수 유형 찾기
  const topType = Object.entries(typeScore).sort((a, b) => b[1] - a[1])[0][0];

  // 유형별 설명 매핑
  const typeDescriptions = {
    해피빈: {
      subtitle: "활발한 개발자",
      info1: "말도 많고 리액션도 풍부해서 사람들과 있을 때 에너지가 올라가는 유형",
      info2: "함께 공부해야 동기부여, 실시간 피드백 소통중심 스터디 선호",
      info3: "공감형 멘토 or 실시간 소통 중심 멘토에게 잘 맞음",
      img: "/memento/resources/images/mypage/spark-test/happyBeen.png",
      icon1: "/memento/resources/images/mypage/spark-test/comZung-icon.png",
      icon2: "/memento/resources/images/mypage/spark-test/slowGom-icon.png",
      icon3: "/memento/resources/images/mypage/spark-test/gitYomi-icon.png"
    },
    슬로우곰:{
      subtitle: "조용한 몰입형 개발자",
      info1: "조용하고 신중하며 혼자 집중하는 걸 좋아하는 내향적 타입. 속도는 느리지만 꾸준함은 최강!",
      info2: "혼자 학습, 기록형 노트 학습 선호.",
      info3: "일대일 피드백형 멘토링, 질문을 쌓아두고 정리해서 물어볼 수 있는 스타일",
      img: "/memento/resources/images/mypage/spark-test/slowGom.png",
      icon1: "/memento/resources/images/mypage/spark-test/tadakNyang-icon.png",
      icon2: "/memento/resources/images/mypage/spark-test/comZung-icon.png",
      icon3: "/memento/resources/images/mypage/spark-test/happyBeen-icon.png"
    },
    깃요미:{
      subtitle: "창의적 실험가 개발자",
      info1: "아이디어와 창의력이 폭발하는 타입. 기획이나 재미있는 걸 좋아하며 감각적으로 움직임.",
      info2: "다양한 주제를 빠르게 훑는 걸 선호. 멋진 결과물로 성취감을 느낀다",
      info3: "피드백 중심보단 함께 만들어보는 프로젝트형,다양한 주제를 다뤄주는 멘토와 궁함 좋음",
      img: "/memento/resources/images/mypage/spark-test/gitYomi.png",
      icon1: "/memento/resources/images/mypage/spark-test/happyBeen-icon.png",
      icon2: "/memento/resources/images/mypage/spark-test/comZung-icon.png",
      icon3: "/memento/resources/images/mypage/spark-test/coachChee-icon.png"
    },
    컴정이:{
      subtitle: "구조화 좋아하는 개발자",
      info1: "계획표 없이는 불안한 체계형. 규칙, 정리, 단계적 진도에 안정감을 느끼는 유형.",
      info2: "강의순서, 커리큘럼 따르기, 한 번 듣고 넘어가기보다 정리와 복습 중시",
      info3: "목표 설정이 명확한 구조적 멘토링, 강의형 + 피드백 중심 멘토와 잘 맞음",
      img: "/memento/resources/images/mypage/spark-test/comZung.png",
      icon1: "/memento/resources/images/mypage/spark-test/slowGom-icon.png",
      icon2: "/memento/resources/images/mypage/spark-test/coachChee-icon.png",
      icon3: "/memento/resources/images/mypage/spark-test/gitYomi-icon.png"
    },
    타닥냥:{
      subtitle: "느긋한 꾸준형 개발자",
      info1: "느긋하고 감성적인 타입. 즉흥성과 자유로움이 있지만, 몰입하면 강력한 집중력을 발휘!",
      info2: "하고 싶을 때 몰아치는 타입, 커뮤니티보다는 혼자 조용히 하는 거 서혼",
      info3: "강요하지 않고 기다려주는 스타일, 감정적으로 부담 없는 멘토와의 관계가 중요",
      img: "/memento/resources/images/mypage/spark-test/tadakNyang.png",
      icon1: "/memento/resources/images/mypage/spark-test/happyBeen-icon.png",
      icon2: "/memento/resources/images/mypage/spark-test/comZung-icon.png",
      icon3: "/memento/resources/images/mypage/spark-test/coachChee-icon.png"
    },
    코취치:{
       subtitle: "목표 지향적 개발자",
      info1: "목표 지향적이고 실전에 진심인 타입, 실습, 프로젝트, 포트폴리오 중심으로 결과를 중시",
      info2: "실습 위주 학습, 시간이 아깝다고 느끼면 중단",
      info3: "실전 예제, 코드 리뷰 중심, 결과 중심의 멘토에게 잘 맞음",
      img: "/memento/resources/images/mypage/spark-test/coachChee.png",
      icon1: "/memento/resources/images/mypage/spark-test/happyBeen-icon.png",
      icon2: "/memento/resources/images/mypage/spark-test/comZung-icon.png",
      icon3: "/memento/resources/images/mypage/spark-test/tadakNyang-icon.png"
    }
  };

  const desc = typeDescriptions[topType];
  if (!desc) {
    alert("유형 설명이 존재하지 않습니다.");
    return;
  }
  
    console.log("🔍 최종 확정될 topType:", topType);

  // DOM 요소에 데이터 삽입
  document.getElementById("resultType").textContent = topType;
  document.getElementById("resultSubtitle").textContent = desc.subtitle;
  document.getElementById("resultInfo1").textContent = desc.info1;
  document.getElementById("resultInfo2").textContent = desc.info2;
  document.getElementById("resultInfo3").textContent = desc.info3;
  document.getElementById("characterImage").src = desc.img;
  document.getElementById("icon1").src = desc.icon1;
  document.getElementById("icon2").src = desc.icon2;
  document.getElementById("icon3").src = desc.icon3;

  // 퍼센트 바 렌더링
const barRoot = document.getElementById("percentageBars");
barRoot.innerHTML = Object.entries(percentages)
  .map(([type, percent]) => {
    const isTop = type === topType;
    const displayPercent = isTop ? Math.min(percent + 5, 100) : percent; // 바 넓이 +5%, 최대 100 제한
    const displayLabel = isTop ? `${displayPercent}%` : `${percent}%`;  // 텍스트도 +5%로 표시
    const highlightClass = isTop ? "highlight" : "";

    return `
      <div class="spark-test-percentage-bar-group">
        <div class="spark-test-percentage-bar-background">
          <div class="spark-test-percentage-bar-fill ${highlightClass}" style="width: ${displayPercent}%"></div>
        </div>
        <div class="spark-test-type-label">${type} <span class="score-label">${displayLabel}</span></div>
      </div>
    `;
  })
  .join("");

  // ✅ 확정하기 버튼 이벤트 등록
  const confirmBtn = document.querySelector(".spark-test-button--confirm");
  
  confirmBtn.addEventListener("click", () => {
    fetch("/memento/api/mypage/spark-test-result", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ sparkResultType: topType })
    })
     .then(res => {
      if (!res.ok) throw new Error("서버 오류");
      return res.json();
    })
    .then(data => {
      const resultValue = data?.result?.result;
      if (resultValue === "success") {
        alert("✅ SPARK 유형이 성공적으로 저장되었습니다!");
        location.href = "/memento/mypage/spark-test";
      } else {
        console.error("❌ 확정 실패 (서버 응답값):", resultValue);
        location.href = "/memento/mypage/spark-test";
      }
    })
    .catch(err => {
      console.error("❌ 확정 실패 (예외):", err);
      location.href = "/memento/mypage/spark-test";
    });
});
})();