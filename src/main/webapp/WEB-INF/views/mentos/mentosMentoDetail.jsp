<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 프로필(홈)</title>
<link rel="stylesheet"
	href="${cpath}/resources/css/mentos/mentosMentoDetail.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${cpath}/resources/css/mainpage/notificationModal.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${cpath}/resources/js/mentos/mentosMentoDetail.js"></script>
<script src="${cpath}/resources/js/notification.js"></script>
<script src="${cpath}/resources/js/header.js"></script>
</head>
<body>
	<%@ include file="../common/logout_header.jsp"%>
	<%@ include file="../mainpage/notificationModal.jsp"%>

	<div class="div1">
		<%@ include file="../mentos/mentosSidebar.jsp"%>
		<div class="container">
			<!-- 소개글 -->
			<div class="frame-3639">
				<div class="div7">소개글</div>
				<div class="line-50"></div>
				<div class="mento-pr">로딩 중...</div>
			</div>

			<!-- 멘토스 내역 -->
			<div class="frame-340">
				<div class="div4">진행중인 멘토스 내역</div>
				<div class="line-50"></div>
				<div class="frame-407">

						<div class="scroll-container">
							<!-- JS에서 동적으로 카드들이 삽입될 위치 -->
						</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
