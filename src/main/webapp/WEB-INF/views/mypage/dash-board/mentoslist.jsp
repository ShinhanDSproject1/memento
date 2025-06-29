<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/dash-board/mypageMentosListStyle.css" />
<script>
  	window.cpath = '${cpath}';
</script>

<script
	src="${cpath}/resources/js/mypage/dash-board/mypagementoslist.js"></script>
<div class="page-container">
	<section class="my-mentors">
		<h2>나의 멘토스 목록</h2>
		<div id="my-mentos-list" class="mentos-list">
		
		</div>
	</section>
</div>

<div class="modal-overlay" id="reviewModal">
	<div class="modal-content">
		<div>
			<label>별점</label>
			<div id="star-container" style="margin-top: 8px;">
				<img
					src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg"
					class="star" data-value="1"> <img
					src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg"
					class="star" data-value="2"> <img
					src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg"
					class="star" data-value="3"> <img
					src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg"
					class="star" data-value="4"> <img
					src="${cpath}/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg"
					class="star" data-value="5">
			</div>
		</div>
		<div class="line-53"></div>
		<div>
			<label>이미지</label> <input type="file" id="reviewImage"
				accept="image/*" style="margin-top: 8px;">
		</div>
		<div class="line-53"></div>
		<div>
			<label>내용</label>
			<textarea id="reviewContent" rows="6"
				style="width: 100%; margin-top: 8px;"></textarea>
		</div>
		<div
			style="margin-top: 10px; display: flex; justify-content: flex-end; gap: 10px;">
			<button onclick="submitReview()">작성 완료</button>
			<button onclick="closeModal()">닫기</button>
		</div>
	</div>
</div>