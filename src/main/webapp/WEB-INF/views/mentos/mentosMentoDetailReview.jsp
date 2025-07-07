<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 프로필 (리뷰)</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mentos/mentosMentoDetailReview.css" />
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainpage/notificationModal.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/mentos/mentosMentoDetailReview.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/notification.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<body>
	<%@ include file="../common/logout_header.jsp"%>
	<%@ include file="../mainpage/notificationModal.jsp"%>
	<div class=container-sidebar>
		<%@ include file="../mentos/mentosSidebar.jsp"%>

		<div class="container">
			<div class="frame-342">
				<div class="div4">수강평</div>
				<div id="reviewContainer"></div>
			</div>
		</div>
	</div>
</body>
</html>