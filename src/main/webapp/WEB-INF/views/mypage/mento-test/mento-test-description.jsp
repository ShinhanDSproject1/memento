<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="ImgPath" value="/resources/images/mypage/mento-test" />
<link rel="stylesheet" href="${cpath}/resources/css/mypage/mento-test/mento-test-description.css" />

<div class="frame-3706">
  <div class="frame-3705"></div>
  <div class="rectangle-311"></div>
  <div class="rectangle-312"></div>
  <button 
  data-url="${cpath}/mypage/mento-test/mento-test-start"
  class="page-link div">
  시작하기
  </button>
  <img class="_1" src="${ImgPath}/box.png" />
  <div class="cs-15-12-10">
    <span>
      <span class="cs-15-12-10-span">
        시험 설명
        <br />
        <br />
        <br />
      </span>
      <span class="cs-15-12-10-span2">
        <br />
      </span>
      <ol class="cs-15-12-10-span3">
        1.CS문제 15문제가 출제됩니다
      </ol>
      <span class="cs-15-12-10-span2">
        <br />
      </span>
      <ol class="cs-15-12-10-span3">
        2.12문제 통과하면 예비 멘토 자격이주어 집니다.
      </ol>
      <span class="cs-15-12-10-span2">
        <br />
      </span>
      <ol class="cs-15-12-10-span3">
        3.제한 시간은 10분입니다.
      </ol>
      <span class="cs-15-12-10-span2">
        <br />
      </span>
      <ol class="cs-15-12-10-span3">
        4.하루에 한 번만 도전할 수 있습니다.
      </ol>
    </span>
  </div>
</div>
