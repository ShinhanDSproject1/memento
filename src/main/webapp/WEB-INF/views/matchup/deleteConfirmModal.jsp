<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="delete-confirm-modal" class="modal-overlay" style="display: none;">
	<div class="modal-content">
		<div style="text-align: center;">
			<img src="${pageContext.request.contextPath}/resources/images/delete-icon.svg" width="36" />
		</div>
		<div class="modal-title">정말로 삭제하시겠어요?</div>
		<div class="modal-buttons">
			<button class="cancel-btn" onclick="hideDeleteConfirmModal()">취소</button>
			
			<button class="confirm-btn" onclick="handleConfirmDelete()">확인</button>
		</div>
	</div>
</div>
