<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="ImgPath" value="/resources/images/mypage/mento-test" />
<link rel="stylesheet"
	href="${cpath}/resources/css/mypage/mento-test/mento-test-main.css" />

		<div class="mento-test-container">
			<div class="frame-3706">
				<div class="frame-3705"></div>
				<img class="photoroom-1" src="${ImgPath}/background.png" />
				<div class="div_mento">멘토 자격시험</div>
				<img class="_2-1" src="${ImgPath}/test.png" />
				<div class="rectangle-311"></div>
				<div class="rectangle-312"></div>
				<button
					data-url="${cpath}/mypage/mento-test/mento-test-description"
					class="div2_mento page-link">
					시험보기
				</button>
			</div>
		</div>
