<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토스 전체조회</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mentos/mentosFullStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mentos/mentosFullVars.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainpage/login.css">	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/js/mentos/mentosFull.js"></script>
<body>
	<div class="header-fixed">
		<c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<%@ include file="../common/logout_header.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="../common/login_header.jsp"%>
			</c:otherwise>
		</c:choose>
		<%@ include file="../mainpage/notificationModal.jsp"%>
		<div id="modalBackdrop"
			style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 999;"
			onclick="closeModal()"></div>
		<div id="loginModal"
			style="display: none; position: fixed; top: 20%; left: 39%; transform: translateX(-50%); z-index: 1000;">
			<%@ include file="../mainpage/login.jsp"%>
			<script src="${pageContext.request.contextPath}/resources/js/notification.js"></script>
		</div>
	</div>
	<div class="container">
		<div class="full-detail-select">
			<div class="detail-select">
				<div id="region-filter-container" class="filter-dropdown"></div>
				<div id="matchType-filter-container" class="filter-dropdown"></div>
				<div id="category-filter-container" class="filter-dropdown"></div>
				<div id="language-filter-container" class="filter-dropdown"></div>
			</div>

			<button class="mentos-create-button"
				onclick="location.href='${cpath}/mentos/create'">멘토스 생성하기</button>
		</div>

		<div class="mentos-all-class">
		    <img class="advertisement" src="${cpath}/resources/images/mentosFull/2025memento.png" />
		
		    <div id="premento-list-container" class="premento-row-container">
		        </div>
		
		    <div id="mentos-list-container" class="mentos-all-class-row"></div>
		    <div id="pagination-container" class="pagination-container"></div>
		</div>
	</div>
	<script>
		const cpath = "${cpath}";
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
</body>
</html>