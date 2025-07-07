<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shinhan.memento.dto.MentoTestResultResponseDTO" %>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${cpath}/resources/css/mypage/mento-test/mento-test-result.css" />

<%
  MentoTestResultResponseDTO result = (MentoTestResultResponseDTO) session.getAttribute("mentoTestResult");
  if (result != null) {
    request.setAttribute("score", result.getScore());
    request.setAttribute("passed", result.isPassed());
  }
%>



<div class="mento-result-container">
    <h1>멘토 테스트 시험 결과</h1>
    <div class="result-box">
        <p><strong>점수:</strong> <span id="score">${score}</span>점</p>
        <p><strong>결과 메시지:</strong>
            <span id="resultMessage">
                <c:choose>
                    <c:when test="${passed}">축하합니다! 합격입니다 🎯</c:when>
                    <c:otherwise>아쉽지만 불합격입니다. 내일 다시 도전해 주세요!</c:otherwise>
                </c:choose>
            </span>
        </p>
    </div>
    <div class="btn-box">
        <a href="${cpath}/mypage/page1" class="btn">마이페이지로 돌아가기</a>
    </div>
</div>