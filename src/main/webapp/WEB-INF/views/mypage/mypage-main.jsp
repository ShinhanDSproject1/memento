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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
	 const cpath = '${cpath}';
	  const initialPage = '${initialPage != null ? initialPage : cpath + "/mypage/dashBoard"}';
</script>


	<script src="${cpath}/resources/static/js/mypage/mypage.js"></script>
	
<title>me:mento mypage</title>
<link rel="stylesheet" href="${cpath}/resources/static/css/mypage/mypage-layout.css" />
<link rel="stylesheet" href="${cpath}/resources/static/css/mypage/sideBar.css" />
	
</head>
<body>
	<%@ include file="../header/header.jsp" %>
	
	<div class="container">
		<div class="mypage--layout">
			<div id = "sidebar" class = "sidebar"> <%@ include file="../mypage/sideBar.jsp" %> </div>
			<div id = "screen" class = "screen"></div>
		</div>
	</div>

</body>
</html>