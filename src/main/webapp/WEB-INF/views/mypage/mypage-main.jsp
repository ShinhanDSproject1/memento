<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://kit.fontawesome.com/019caa6bf2.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	const cpath = '${cpath}';
	const initialPage = '${initialPage != null ? initialPage : cpath + "/mypage/dashBoard"}';
</script>
<script src="${cpath}/resources/js/mypage/mypage.js"></script>
<title>마이페이지 메인 화면</title>
<link rel="stylesheet"
	href="${cpath}/resources/css/mypage/mypage-layout.css" />
<link rel="stylesheet"
	href="${cpath}/resources/css/mypage/mypageVars.css" />
<link rel="stylesheet" href="${cpath}/resources/css/sidebar/sidebar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage/notificationModal.css">
</head>
<body>
<%@ include file="../mainpage/notificationModal.jsp"%>
	<div class="layout-wrapper">
	   <c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<%@ include file="../common/logout_header.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="../common/login_header.jsp"%>
			</c:otherwise>
		</c:choose>
		<div class="main-content-wrapper">
			<%@ include file="../sidebar/sidebar.jsp"%>
			<div id="screen" class="screen page-container"></div>
		</div>
	</div>
	<script src="https://js.tosspayments.com/v2/standard"></script>
	<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/notification.js"></script>
</body>
</html>