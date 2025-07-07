<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="ImgPath" value="/resources/images/mypage/mento-test" />
<link rel="stylesheet"
	href="${cpath}/resources/css/mypage/mento-test/mento-test-main.css" />

<div class="mento-test-main">
	<div class="mento-test-image-wrapper">
		<%-- <img class="mento-test-background-img" src="${ImgPath}/background.png" /> --%>
		<div class="mento-test-title-wrapper">
			<span class="mento-title-emph">mento</span> 
			<span class="mento-title-text">자격시험</span>
		</div>
	</div>
	<img class="mento-test-character-img" src="${ImgPath}/test.png" />

	<div class="mento-test-button-wrapper">
		<button data-url="${cpath}/mypage/mento-test/mento-test-description"
			class="mento-test-button page-link">시험보기</button>
	</div>
</div>