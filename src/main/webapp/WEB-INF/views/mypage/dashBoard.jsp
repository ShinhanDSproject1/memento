<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />

<!-- ⚠️ HTML 구조는 제거하고, 콘텐츠 영역만 남깁니다 -->
<section class="dashboard-view">
	<h2>📊 Dash Board</h2>
	<p>이곳에 대시보드 요약 정보, 최근 활동, 공지 등을 넣을 수 있어요.</p>
	<button 
		data-url="${cpath}/mypage/dashBoard/calender" 
		class="page-link">
		월간달력보기
	</button>
</section>