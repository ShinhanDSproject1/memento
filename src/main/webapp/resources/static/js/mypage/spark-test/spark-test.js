if (typeof window.sparkTestLoaded === 'undefined') {
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
    document.getElementById("question-text").innerText = q.question;

    for (let i = 0; i < q.choices.length; i++) {
      const choiceEl = document.getElementById(`choice-${i}`);
      choiceEl.innerText = q.choices[i];
      const button = choiceEl.closest(".button");
      if (button) {
        button.classList.toggle("clicked", answers[currentIndex] === i);
      }
    }

    const prevBtn = document.getElementById("prev-button");
    if (prevBtn) {
      prevBtn.style.display = currentIndex === 0 ? "none" : "flex";
    }

    const nextBtn = document.querySelector(".button3 .label2");
    if (nextBtn) {
      if (currentIndex === questions.length - 1) {
        nextBtn.innerText = "결과보기";
        nextBtn.onclick = function () {
          if (typeof answers[currentIndex] === 'undefined') {
            alert("선택을 해주세요!");
            return;
          }
          const result = Object.entries(typeScore).sort((a, b) => b[1] - a[1])[0];
          const [topType] = result;
          location.href = `spark-test-end?type=${encodeURIComponent(topType)}`;
        };
      } else {
        nextBtn.innerText = "다음문제";
        nextBtn.onclick = window.nextQuestion;
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

    for (let i = 0; i < 4; i++) {
      const button = document.querySelectorAll('.button')[i];
      button.classList.toggle('clicked', i === index);
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

  document.addEventListener("click", function (e) {
    for (let i = 0; i < 4; i++) {
      const el = document.getElementById(`choice-${i}`);
      if (el && (e.target === el || el.contains(e.target))) {
        selectChoice(i);
      }
    }
  });

  window.addEventListener("load", function () {
    setTimeout(renderQuestion, 0);
  });
}
