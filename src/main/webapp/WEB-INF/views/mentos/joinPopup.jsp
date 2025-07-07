<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="joinLayer" class="modal-overlay" style="display: none;">
	<div class="custom-modal-content">
		<div style="text-align: center;">
			<img
				src="${pageContext.request.contextPath}/resources/images/delete-icon.svg"
				width="36" />
		</div>

		<div class="custom-modal-title">멘토스가 성공적으로 신청되었어요!</div>
		<!-- <div class="custom-modal-title">멘토 확인 후 수강인원이 채워지면 수강 확정 알림을
			보내드립니다</div> -->
		<div class="modal-buttons">
			<button class="confirm-btn" onclick="hideJoinModal()">확인</button>
		</div>
	</div>
</div>