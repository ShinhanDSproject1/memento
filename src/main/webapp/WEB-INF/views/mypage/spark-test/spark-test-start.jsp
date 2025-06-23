<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="sparkImgPath" value="/resources/images/mypage/spark-test" />
<link rel="stylesheet" href="${cpath}/resources/css/mypage/spark-test/spark-test-start.css" />


  <div class="screen">
  <div class="frame-3712">
    <div class="frame-3711">
      <div class="frame-3700">
        <div class="rectangle-172"></div>
      </div>
      <div id="question-text" class="q">질문 로딩중...</div>

<div class="button" onclick="selectChoice(0)">
  <div class="label">
    <div class="label-span" id="choice-0"></div>
  </div>
</div>

<div class="button" onclick="selectChoice(1)">
  <div class="label">
    <div class="label-span" id="choice-1"></div>
  </div>
</div>

<div class="button" onclick="selectChoice(2)">
  <div class="label">
    <div class="label-span" id="choice-2"></div>
  </div>
</div>

<div class="button" onclick="selectChoice(3)">
  <div class="label">
    <div class="label-span" id="choice-3"></div>
  </div>
</div>
     <div class="button3-wrapper" style="display: flex; gap: 12px;">
  <div class="button3" id="prev-button" style="display: none;" onclick="prevQuestion()">
    <div class="label1">이전문제</div>
  </div>
  <div class="button3" id="next-button">
    <div class="label2" >다음문제</div>
  </div>
</div>

    </div>

    <div class="frame-3710"
         style="background: url('${cpath}/resources/images/mypage/spark-test/img-spark-test.png'); background-size: cover; background-repeat: no-repeat;">
      <div class="spark-test2">SPARK TEST</div>
    </div>
  </div>
</div>

  <script src="${cpath}/resources/js/mypage/spark-test/spark-test.js"></script>
