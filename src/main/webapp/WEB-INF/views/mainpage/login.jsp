<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- login_modal.jsp -->
<div id="loginModal" class="login-modal" style="display:block;">
  <div class="rectangle-174">

    <!-- 닫기 버튼 -->
    <button class="icon-menu-06" id="loginModalCloseBtn" onclick="closeModal()"">
      <img class="menu-close-md" id="loginModalCloseBtn" src="${pageContext.request.contextPath}/resources/images/main1/close.svg" alt="닫기" />
    </button>

    <!-- 로고 영역 -->
    <div class="logo-area">
      <img class="image-19" src="${pageContext.request.contextPath}/resources/images/main1/logo.png" />
      <img class="me-mento-2" src="${pageContext.request.contextPath}/resources/images/main1/memento_logo.png" />
    </div>

    <!-- 텍스트 메시지 -->
    <div class="me-mento">
      <span>
        <span class="me-mento-span">me:</span>
        <span class="me-mento-span2">mento</span>
        <span class="me-mento-span3">
          와
          <br />
          함께 성장해보세요!
        </span>
      </span>
    </div>
	<a class="div2" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=dd889aeee45cfc71c810b8d5b41a800f&redirect_uri=http://localhost:9999/memento/api/auth/kakao/callback">
	  <img src="${pageContext.request.contextPath}/resources/images/main1/kakaotalk.png" alt="카카오 로그인" />
	</a>


  </div>
</div>
