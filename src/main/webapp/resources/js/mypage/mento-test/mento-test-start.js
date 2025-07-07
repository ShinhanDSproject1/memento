$(function () {
  console.log("[LOG] 페이지 로드 시작");
  const protocol = location.protocol === 'https:' ? 'wss' : 'ws';
  const socketUrl = `${protocol}://${location.host}${cpath}/ws/mentotest`;
  let socket = null;
  let isSubmitted = false;

  const $list = $('#mento-question-list');
  const $timer = $('#countdown-timer');
  const DURATION_MINUTES =15;
  connectWebSocket(userId);

  $.ajax({
    url: cpath + '/api/mypage/mento-test-start',
    method: 'POST',
    contentType: 'application/json',
    success: function (res) {
      const problems = res.result.problems;
      const rawStartTime = res.result.startTime;

      const startTime = parseStartTime(rawStartTime);
      if (!startTime) {
        alert("시험 시작 시간 오류입니다.");
        return;
      }

      renderProblems(problems);
      sessionStorage.setItem('mentoTestStartTime', startTime.toISOString());
      startCountdown(startTime);
    },
    error: function () {
      alert('오늘 이미 멘토테스트를 응시하셨습니다.');
    }
  });

  //제출 버튼 클릭
  $('#submit-btn').click(function () {
    submitAnswers(false);
  });

  //문제 렌더링
  function renderProblems(problems) {
    $list.empty();

    problems.forEach((p, idx) => {
      const choicesHTML = p.choices.map((choice, i) => `
        <label class="mento-test-choice">
          <input type="radio" name="q${p.problemId}" value="${i}" />
          ${String.fromCharCode(65 + i)}. ${choice}
        </label><br/>
      `).join('');

      const problemHTML = `
        <li class="mento-test-question">
          <p>${idx + 1}. ${p.questionText}</p>
          ${choicesHTML}
        </li>
      `;

      $list.append(problemHTML);
    });
  }

  //타이머 시작
  function startCountdown(startTime) {
    const endTime = new Date(startTime.getTime() + DURATION_MINUTES * 60000);

    const interval = setInterval(() => {
      const now = new Date();
      const diffMs = endTime - now;

      if (diffMs <= 0) {
        clearInterval(interval);
        $timer.text("시간 종료 - 서버 응답 대기중...");
        return;
      }

      const minutes = Math.floor(diffMs / 60000);
      const seconds = Math.floor((diffMs % 60000) / 1000);
      $timer.text(`남은시간 : ${minutes}분 ${seconds < 10 ? '0' : ''} ${seconds}초 `);
    }, 1000);
  }

  
  function submitAnswers(isAutoSubmit) {
    if(isSubmitted) return;
    isSubmitted = true;  

    const answers = [];
    let unansweredCount = 0; // ✅ 선언 필요

    $('li.mento-test-question').each(function () {
      const $question = $(this);
      const input = $question.find('input[type=radio]');
      const questionId = input.attr('name').replace('q', '');
      const selected = $question.find('input[type=radio]:checked').val();
  
        // 응답 체크
      if (selected === undefined) {
        unansweredCount++;
      }

      answers.push({
        problemId: parseInt(questionId),
        answerIndex: selected !== undefined ? parseInt(selected) : -1
      });
  });

    // 선택사항: 미응답 문항 있을 경우 사용자에게 확인
    if (unansweredCount > 0 && !isAutoSubmit) {
      const confirmSubmit = confirm(`응답하지 않은 문항이 ${unansweredCount}개 있습니다. 그래도 제출하시겠습니까?`);
      if (!confirmSubmit) {
        isSubmitted = false;
        return;
      }
    }
    console.log("test2323");
    $.ajax({
      url: cpath + '/api/mypage/mento-test-result',
      method: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({
        isAutoSubmit,
        answers,
      }),
      success: function (res) {
        window.location.href = cpath + '/mypage/mento-test/mento-test-result';
      },
      error: function (xhr) {
        alert("제출 실패: " + xhr.responseJSON?.message || '서버 오류');
      }
    });
  }


  //서버 시간 파싱
  function parseStartTime(rawStartTime) {
    // case 1. 배열 [2025, 7, 4, 10, 52, 2, 147263000]
    if (Array.isArray(rawStartTime)) {
      const [year, month, day, hour, minute, second] = rawStartTime;
      return new Date(year, month - 1, day, hour, minute, second);
    }

    // case 2. 문자열 "2025-07-04T10:47:06.949354"
    if (typeof rawStartTime === "string") {
      let trimmed = rawStartTime;
      if (trimmed.includes(".")) {
        trimmed = trimmed.split(".")[0]; // 소수점 제거
      }
      const parsedDate = new Date(trimmed);
      return isNaN(parsedDate.getTime()) ? null : parsedDate;
    }

    // case 3. 예외
    return null;
  }

  //소켓 연결
  function connectWebSocket(userId){
    socket = new WebSocket(socketUrl);
  
    socket.onopen = function(){
      console.log("webSocket 연결 성공");
    };
  
    socket.onmessage = function(envent) {
      const message = envent.data;
      console.log("수신 메세지 : ", message);
  
      if(message === 'time_over'){
        alert("시간 종료 - 자동 제출됩니다.");
        submitAnswers(true);
      };
    };
  
    socket.onclose = function(){
      console.log("webSocket 연결 종료");
    };
  
    socket.onerror = function(error){
      console.error("webSocket 에러 발생", error);
    };
  }

});