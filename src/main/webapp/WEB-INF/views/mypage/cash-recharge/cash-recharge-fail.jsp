<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="cashImgPath" value="/resources/images/mypage/cash-recharge" />

    <h2> 결제 실패 </h2>
    <p id="code"></p>
    <p id="message"></p>