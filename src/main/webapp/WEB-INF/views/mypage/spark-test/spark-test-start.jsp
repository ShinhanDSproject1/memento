<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="sparkImgPath" value="/resources/images/mypage/spark-test" />
<link rel="stylesheet"
	href="${cpath}/resources/css/mypage/spark-test/spark-test-start.css" />


<div class="spark-test-wrapper">
	<div class="spark-test-main-content">
		<div class="spark-test-question-section">
			<div class="spark-test-progress-bar"></div>
		</div>

			<div id="question-text" class="spark-test-question-text">질문
				로딩중...</div>

		<div class="spark-test-start-main-section">
			<div class="spark-test-choice-button" onclick="selectChoice(0)">
				<div class="spark-test-choice-label">
					<div class="spark-test-choice-text" id="choice-0"></div>
				</div>
			</div>

			<div class="spark-test-choice-button" onclick="selectChoice(1)">
				<div class="spark-test-choice-label">
					<div class="spark-test-choice-text" id="choice-1"></div>
				</div>
			</div>

			<div class="spark-test-choice-button" onclick="selectChoice(2)">
				<div class="spark-test-choice-label">
					<div class="spark-test-choice-text" id="choice-2"></div>
				</div>
			</div>

			<div class="spark-test-choice-button" onclick="selectChoice(3)">
				<div class="spark-test-choice-label">
					<div class="spark-test-choice-text" id="choice-3"></div>
				</div>
			</div>
			<div class="spark-test-navigation-buttons"
				style="display: flex; gap: 12px;">
				<div class="spark-test-nav-button spark-test-nav-button--prev"
					id="prev-button" style="display: none;" onclick="prevQuestion()">
					<div class="spark-test-nav-label">이전문제</div>
				</div>
				<div class="spark-test-nav-button spark-test-nav-button--next"
					id="next-button">
					<div class="spark-test-nav-label">다음문제</div>
				</div>
			</div>

		</div>
	</div>

	<div class="spark-test-sidebar"
		style="
       background-image: url('${cpath}/resources/images/mypage/spark-test/img-spark-test.png');
        background-size: contain;
        background-position: center;
        background-repeat: no-repeat;">
		<div class="spark-test-title">SPARK TEST</div>
	</div>
</div>

<script src="${cpath}/resources/js/mypage/spark-test/spark-test.js"></script>