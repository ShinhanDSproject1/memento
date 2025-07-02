<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<div class="modal-overlay" id="member-modal" style="display: none;">
    <div class="modal-content">
        <h2 class="modal-title">팀원 리스트</h2>
        <ul class="member-list" id="member-list-ul"></ul>
        <div class="modal-buttons">
            <button type="button" class="cancel-btn" onclick="closeMemberModal()">닫기</button>
        </div>
    </div>
</div>