// 정상 진입 시 localStorage 플래그 설정
if (!localStorage.getItem("enteredSparkTest")) {
  localStorage.setItem("enteredSparkTest", "true");
}

const navType = window.navType || (window.navType = performance.getEntriesByType("navigation")[0]?.type);

if (navType === "reload" || navType === "back_forward") {
  alert("테스트가 초기화되어 처음부터 다시 시작합니다.");
  location.replace("/memento/mypage/spark-test"); // 테스트 시작 페이지로 강제 이동
}

// 2. 뒤로가기 등 이탈 감지 → 앞으로가기 차단을 위한 플래그 저장
window.addEventListener("beforeunload", function () {
  sessionStorage.setItem("exitedSparkTest", "true");
});

// 3. 앞으로가기 접근 감지 후 차단
window.addEventListener("pageshow", function (event) {
  const fromForward = sessionStorage.getItem("exitedSparkTest");

  // 브라우저가 캐시에서 페이지를 복원했거나, 플래그가 있는 경우
  if (event.persisted || navType === "back_forward") {
    if (fromForward === "true") {
      alert("앞으로가기로는 테스트에 다시 접근할 수 없습니다.");
      sessionStorage.removeItem("exitedSparkTest");
      location.replace("/memento/mypage/spark-test");
    }
  }
});

if (typeof window.sparkTestLoaded === 'undefined') {
 localStorage.setItem("sparkTestInProgress", "true");
  
  
  window.sparkTestLoaded = true;

  const questions = [
    {
      question: "Q. 공부할 때 더 집중되는 환경은?",
      choices: [
        "활기찬 공간에서 같이 공부할 때",
        "혼자 조용한 분위기에서 집중",
        "노트북 열고 즉흥적으로 카페에서",
        "계획한 시간표대로 움직일 때"
      ]
    },
    {
      question: "Q. 프로젝트 시작할 때 나는?",
      choices: [
        "자료조사부터, 구조 설계가 먼저지",
        "당장 코드부터 짜고 보자",
        "팀원들이랑 이야기 나누면서 방향 잡아야지",
        "기능 구현이 우선이지"
      ]
    },
    {
      question: "Q. 피드백을 받을 때 나는?",
      choices: [
        "실질적인 조언 위주가 좋아요",
        "함께 고민해주고 공감해주는 스타일이 좋아요",
        "감정 상하지 않게 부드러운 톤이 좋아요",
        "냉정하고 논리적인 분석도 괜찮아요"
      ]
    },
    {
      question: "Q. 새로운 아이디어가 떠오르면?",
      choices: [
        "머리속에 그려놓고 바로 구현",
        "브레인스토밍을 친구들과 함께",
        "일단 메모하고 천천히 구상",
        "그게 지금 실용적인가? 먼저 판단"
      ]
    },
    {
      question: "Q. 강의나 스터디를 고를 때 기준은?",
      choices: [
        "나랑 잘 맞는 분위기의 사람들과 함께",
        "명확한 커리큘럼과 목표가 있는지",
        "실무적인 내용을 얼마나 다루는지",
        "새롭고 흥미로운 주제인지"
      ]
    },
    {
      question: "Q. 공부 일정을 짜는 방법은?",
      choices: [
        "아침에 느긋하게 시작하는 편",
        "정해진 시간에 계획적으로 하는 편",
        "필요하면 밤을 세워서라도 해보는 편",
        "집중 잘 되는 시간에 자유롭게 하는 편"
      ]
    },
    {
      question: "Q. 누군가랑 협업할 때 나는?",
      choices: [
        "적극적으로 소통하며 맞춰간다",
        "역할만 나누고 각자 집중한다",
        "깃허브나 도구 사용에 익숙해서 편하다",
        "대화중 아이디어가 팍팍 떠오르는 편이다"
      ]
    },
    {
      question: "Q. 개발하면서 가장 중요하게 생각하는 건?",
      choices: [
        "실용성! 실제로 쓸 수 있는가",
        "창의성과 재미! 내가 만들고 싶은 것",
        "나만의 속도와 감정 리듬",
        "에러가 나도 침착하게 성공"
      ]
    },
    {
      question: "Q. 커뮤니티에 참여할 때 나는?",
      choices: [
        "적극적으로 의견을 나누며 성장해요",
        "정보를 수집하고 정리하는게 즐거워요",
        "눈에 띄는 주제를 먼저 눌러봐요",
        "천천히 읽고 상황에 따라 참여해요"
      ]
    }
  ];

  const typeMap = [
    ["해피빈", "슬로우곰", "타닥냥", "컴정이"],
    ["컴정이", "깃요미", "해피빈", "코취치"],
    ["코취치", "해피빈", "타닥냥", "컴정이"],
    ["깃요미", "해피빈", "슬로우곰", "코취치"],
    ["타닥냥", "컴정이", "코취치", "깃요미"],
    ["타닥냥", "컴정이", "코취치", "슬로우곰"],
    ["해피빈", "슬로우곰", "코취치", "깃요미"],
    ["코취치", "깃요미", "타닥냥", "슬로우곰"],
    ["해피빈", "컴정이", "깃요미", "슬로우곰"]
  ];

  const typeScore = {
    해피빈: 0,
    슬로우곰: 0,
    타닥냥: 0,
    컴정이: 0,
    깃요미: 0,
    코취치: 0
  };

  let currentIndex = 0;
  const answers = [];

  window.renderQuestion = function () {
    const q = questions[currentIndex];
    // 질문 텍스트 업데이트
    document.querySelector(".spark-test-question-text").innerText = q.question;

    for (let i = 0; i < q.choices.length; i++) {
      const choiceEl = document.getElementById(`choice-${i}`);
      choiceEl.innerText = q.choices[i];
      // 선택 버튼 클래스 토글
      const button = choiceEl.closest('.spark-test-choice-button');
      if (button) {
        button.classList.toggle("clicked", answers[currentIndex] === i);
      }
    }

    // 이전 버튼 가시성 제어
    const prevBtn = document.getElementById("prev-button");
    if (prevBtn) {
      prevBtn.style.display = currentIndex === 0 ? "none" : "flex";
    }

    // 다음/결과보기 버튼 텍스트 및 클릭 이벤트 제어
    const nextBtnLabel = document.querySelector(".spark-test-nav-button--next .spark-test-nav-label");
    const nextBtnContainer = document.getElementById("next-button"); // 다음 버튼 컨테이너 자체
    
    if (nextBtnLabel && nextBtnContainer) {
      if (currentIndex === questions.length - 1) {
        nextBtnLabel.innerText = "결과보기";
        nextBtnContainer.onclick = function () { // 컨테이너에 직접 이벤트 부여
          if (typeof answers[currentIndex] === 'undefined') {
            alert("선택을 해주세요!");
            return;
          }
          const result = Object.entries(typeScore).sort((a, b) => b[1] - a[1])[0];
          const [topType] = result;
          localStorage.setItem("sparkTypeScore", JSON.stringify(typeScore));
		  location.href = "spark-test-end";
        };
      } else {
        nextBtnLabel.innerText = "다음문제";
        nextBtnContainer.onclick = window.nextQuestion; // 컨테이너에 직접 이벤트 부여
      }
    }
  };

  window.selectChoice = function (index) {
    const prevIndex = answers[currentIndex];
    if (typeof prevIndex !== 'undefined') {
      const prevType = typeMap[currentIndex][prevIndex];
      typeScore[prevType]--;
    }

    answers[currentIndex] = index;
    const selectedType = typeMap[currentIndex][index];
    typeScore[selectedType]++;

    // 모든 선택 버튼의 'clicked' 클래스 업데이트
    const choiceButtons = document.querySelectorAll('.spark-test-choice-button');
    for (let i = 0; i < choiceButtons.length; i++) {
      choiceButtons[i].classList.toggle('clicked', i === index);
    }
  };

  window.nextQuestion = function () {
    if (typeof answers[currentIndex] === 'undefined') {
      alert("선택을 해주세요!");
      return;
    }
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      renderQuestion();
    }
  };

  window.prevQuestion = function () {
    if (currentIndex > 0) {
      currentIndex--;
      renderQuestion();
    }
  };

  // 문서 전체 클릭 이벤트 리스너 (선택 버튼 위임)
  document.addEventListener("click", function (e) {
    // 모든 선택 버튼 요소를 가져와서 이벤트를 처리
    const choiceButtons = document.querySelectorAll('.spark-test-choice-button');
    for (let i = 0; i < choiceButtons.length; i++) {
      // 클릭된 요소 또는 그 부모 중에 해당 버튼이 있는지 확인
      if (choiceButtons[i].contains(e.target)) {
        selectChoice(i);
        break; // 올바른 버튼을 찾았으면 루프 종료
      }
    }
  });


  window.addEventListener("load", function () {
    setTimeout(renderQuestion, 0);
  });
}