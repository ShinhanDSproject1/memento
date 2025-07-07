<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 프로필(진행한 멘토스)</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mentos/mentosMentoDetailClassList.css" />
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/mainpage/notificationModal.css">
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/mentos/mentosMentoDetailClassList.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/notification.js"></script>
<script src="${pageContext.request.contextPath}/js/notification.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<body>
	<%@ include file="../common/logout_header.jsp"%>
	<%@ include file="../mainpage/notificationModal.jsp"%>
	<div class="sidebar-main">
		<%@ include file="../mentos/mentosSidebar.jsp"%>
		<div class="container">
			<div class="frame-3773">
				<div class="div7">진행한 멘토스 내역</div>
				<div class="line-50"></div>
			</div>
			<div class="frame-36442">
				<div id="mentosCardContainer"></div>
			</div>
		</div>
	</div>
</body>
</html>