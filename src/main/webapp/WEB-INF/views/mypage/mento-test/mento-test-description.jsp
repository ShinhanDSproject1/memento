<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="ImgPath" value="/resources/images/mypage/mento-test" />
<link rel="stylesheet"
	href="${cpath}/resources/css/mypage/mento-test/mento-test-description.css" />

<div class="mento-desc-container">
	<div class="mento-desc-textbox">
		<span class="mento-highlight">mento</span> 자격시험 안내
	</div>

	<div class="mento-desc-content">
		<ul class="mento-desc-list">
			<li>CS문제 15문제가 출제됩니다.</li>
			<li>12문제 이상 맞추면 예비 멘토 자격이 주어집니다.</li>
			<li>제한 시간은 15분입니다.</li>
			<li>하루에 한 번만 응시할 수 있습니다.</li>
		</ul>

		<div class="mento-desc-button-wrapper">
		<button id="start-mento-test-button" class="mento-desc-button">
		  시작하기
		</button>
		</div>
	</div>
</div>

<script src="${cpath}/resources/js/mypage/mento-test/mento-test-description.js"></script>