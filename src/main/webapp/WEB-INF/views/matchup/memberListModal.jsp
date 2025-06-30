<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 팀원 리스트 모달 -->
<div class="modal-overlay" id="member-modal" style="display: none;">
  <div class="modal-content">
    <h2 class="modal-title">팀원 리스트</h2>
    <!-- 팀원 목록 -->
    <ul class="member-list">
      <li class="member-item">
        <img src="${pageContext.request.contextPath}/resources/images/member-icon.png" alt="팀원" />
        <span>팀원 닉네임</span>
      </li>
      <li class="member-item">
        <img src="${pageContext.request.contextPath}/resources/images/member-icon.png" alt="팀원" />
        <span>팀원 닉네임</span>
      </li>
      <li class="member-item">
        <img src="${pageContext.request.contextPath}/resources/images/member-icon.png" alt="팀원" />
        <span>팀원 닉네임</span>
      </li>
    </ul>

    <!-- 버튼 영역 -->
    <div class="modal-buttons">
      <button type="button" class="cancel-btn" onclick="closeMemberModal()">취소하기</button>
    </div>
  </div>
</div>
<!-- dfkj -->