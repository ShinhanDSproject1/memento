<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:set var="userId" value = "${loginUser.memberId}"/>
<c:url var="ImgPath" value="/resources/images/mypage/mento-test" />
<link rel="stylesheet"
	href="${cpath}/resources/css/mypage/mento-test/mento-test-start.css" />

<div class="mento-test-container">
	<div class="mento-test-header"></div>

	<!-- ✅ 시험 타이틀 영역 -->
	<div class="mento-test-title-wrapper">
		<span class="mento-title-emph">mento</span> 
		<span class="mento-title-text">자격시험 문제</span>
	</div>

	<!-- ✅ 타이머 영역 추가 -->
	<div id="countdown-timer" class="mento-test-timer">남은시간 : 15분 00초</div>

	<!-- ✅ 문제 목록 -->
	<ol id="mento-question-list" class="mento-test-list"></ol>

	<!-- ✅ 구분선 -->
	<div class="mento-test-divider"></div>

	<!-- ✅ 제출 버튼 -->
	<button id="submit-btn" class="mento-test-submit-btn">제출하기</button>

	<!-- ✅ 섹션 라벨 -->
	<div class="mento-test-section-label">멘토 자격시험</div>
</div>
<script>
	const userId =	'${userId}';
</script>
<script
	src="${cpath}/resources/js/mypage/mento-test/mento-test-start.js"></script>