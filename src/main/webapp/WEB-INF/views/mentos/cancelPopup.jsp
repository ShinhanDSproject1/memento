<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="cancelLayer" class="modal hidden">
	<div class="modal-content">
		<img class="modal-image"
			src="${pageContext.request.contextPath}/resources/images/icon_error.svg"
			alt="실패 아이콘" />

		<div class="modal-text">작성이 취소되었습니다</div>
		<div class="modal-text">작성한 내용은 저장되지 않아요</div>
		<button class="confirm-btn">확인</button>
	</div>
</div>