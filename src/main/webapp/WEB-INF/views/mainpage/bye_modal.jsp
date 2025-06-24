<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 모달</title>

  <!-- CSS 연결 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainpage/bye_modal.css" />

  <!-- Inter -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- D2Coding -->
  <link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2107@1.1/D2Coding.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="bye-modal">
  <div class="rectangle-175"></div>
  <div class="div">정말 탈퇴하시겠습니까?</div>
  <div class="rectangle-176"></div>
  <div class="div2">
    <span>
      <span class="div-2-span">정말</span>
      <span class="div-2-span2">탈퇴</span>
      <span class="div-2-span">
        하시겠어요?
        <br />
        <br />
        탈퇴하시면 아래 정보가 모두
      </span>
      <span class="div-2-span2">삭제</span>
      <span class="div-2-span">
        되며 아래와 같은 사항들을 복구할 수 없습니다.
        <br />
        <br />
      </span>
      <ul class="div-2-span3">
        <li>나의 활동 내역 (킵고잉, 멘토스, 매치업)</li>
        <li>프로필 및 랭킹 정보</li>
        <li>즐겨찾기 및 설정 정보</li>
      </ul>
      <span class="div-2-span">
        <br />
      </span>
      <span class="div-2-span2">⚠</span>
      <span class="div-2-span">️</span>
      <span class="div-2-span4">
        또한, 탈퇴 이후 동일한 이메일로 재가입하더라도 기존 데이터는 복원되지
        않으며, 새로운 계정으로 처음부터 다시 시작해야 합니다.
        <br />
      </span>
      <span class="div-2-span">
        <br />
        신중하게 결정해 주세요. 😢
      </span>
    </span>
  </div>


<div class="frame-64">
  <div class="frame-62">
    <button class="bye-button cancel">취소</button>
  </div>
  <div class="frame-63">
    <button class="bye-button confirm">탈퇴</button>
  </div>
</div>



</body>
</html>