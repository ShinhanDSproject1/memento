<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 멘토 리스트 모달 -->
<div class="modal-overlay" id="mento-modal" style="display: none;">
  <div class="modal-content">
    <h2 class="modal-title">승인 대기중인 멘토 리스트</h2>

    <!-- 검색창 -->
   <%--  <div class="modal-search">
      <input type="text" placeholder="검색" class="search-input" />
      <img src="${pageContext.request.contextPath}/resources/images/search-icon.svg" alt="검색 아이콘" class="search-icon" />
    </div> --%>

    <!-- 멘토 목록 -->
    <ul class="member-list">
      <li class="member-item">
        <img src="${pageContext.request.contextPath}/resources/images/member-icon.png" alt="멘토" />
        <span>멘토 닉네임</span>
        <input type="radio" name="selectedMember" checked />
      </li>
      <li class="member-item">
        <img src="${pageContext.request.contextPath}/resources/images/member-icon.png" alt="멘토" />
        <span>멘토 닉네임</span>
        <input type="radio" name="selectedMember" />
      </li>
      <li class="member-item">
        <img src="${pageContext.request.contextPath}/resources/images/member-icon.png" alt="멘토" />
        <span>멘토 닉네임</span>
        <input type="radio" name="selectedMember" />
      </li>
    </ul>

    <!-- 버튼 영역 -->
    <div class="modal-buttons-mento">
      <button type="button" class="confirm-btn">승인하기</button>
      <button type="button" class="cancel-btn" onclick="closeMentoModal()">취소하기</button>
    </div>
  </div>
</div>
