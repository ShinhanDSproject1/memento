<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 삭제 완료 알림 모달 -->
<div id="delete-complete-modal" class="modal-overlay"
	style="display: none;">
	<div class="modal-content"
		style="text-align: center; padding: 40px 24px;">

		<!-- 이미지 -->
		<img
			src="${pageContext.request.contextPath}/resources/images/deleteconfirm-icon.svg"
			alt="완료 아이콘" width="36" class="image-61" style="margin-bottom: 16px;" />

		<!-- 텍스트 -->
		<div class="modal-title" style="margin-bottom: 24px;">삭제 완료!</div>

		<!-- 확인 버튼 -->
		<div class="modal-buttons" style="justify-content: center;">
			<button class="confirm-btn" onclick="hideDeleteCompleteModal()">확인</button>
		</div>
	</div>
</div>
