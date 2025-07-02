<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />

<link rel="stylesheet"
	href="${cpath}/resources/css/mypage/spark-test/spark-test.css" />


<div class="spark-test-container">
	<div class="spark-test__container--title"
	style="
        background-image: url('${cpath}/resources/images/mypage/spark-test/img-spark-test.png');
        background-size: 80% auto;
        background-position: center;
        background-repeat: no-repeat;
     ">
		<h4 class="spark-test__title--text">SPARK TEST</h4>
	</div>

	<section class="spark-test__contatiner--subtitle">
		<h4 class="spark-test__subtitle--text">너의 매치업 성향이 궁금해?</h4>
	</section>

	<section class="spark-test__container--button">
		<button data-url="${cpath}/mypage/spark-test/spark-test-start"
			class="spark-test__button spark-test__button--teststart page-link">
			테스트 시작하기</button>
		<button data-url="${cpath}/mypage/spark-test/spark-test-type-check"
			class="spark-test__button spark-test__button--showtype page-link">
			학습 유형 보러가기</button>
	</section>
</div>


