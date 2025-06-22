<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />

<div class="frame-3650">
  <div class="group-75">
    <div class="ellipse-1"></div>
    <div class="sideBar_name">코딩하는 뭉뭉이</div>
    <div class="ellipse-2"></div>
 <img class="vuesax-linear-export" src="${cpath}/resources/static/images/mypage/sideLineBox.svg" alt="Export icon" />
    <img class="avatar-default" src="${cpath}/resources/static/images/mypage/defualt-profile.svg" alt="Avatar" />
    <div class="mento">mento</div>
    <div class="cash">Cash :</div>
    <div class="point">
      <span>
        <span class="point-span">Point</span>
        <span class="point-span2">:</span>
      </span>
    </div>
    <div class="_53-000">53,000</div>
    <div class="_530-p">530 P</div>
  </div>
  
  <div class="line-6"></div> 
   
	  <div class="frame-409">
	      <ul class="div-2-span">
	      <li>
	       <button 
			 data-url="${cpath}/mypage/dashBoard"
			  class="page-link">
			  Dash Board
	  		 </button>
	  		 </li>
	      </ul>
	      <ul class="div-3-span">
	        <li>
	        <button
			 data-url="${cpath}/mypage/cash-recharge"
			  class="page-link" >
			  캐시충전
	  		 </button>
	  		 </li>
	      </ul>
	      <ul class="div-4-span">
	        <li>결제내역</li>
	      </ul>
	      <ul>
	        <li>
	      	 <button 
	      	 data-url="${cpath}/mypage/spark-test"
	      	 class="page-link">
	 	     Spark Test
	  		 </button>
	        </li>
	      </ul>
 			<ul class="div-5-span">
	        <li>
	         <button 
	      	 data-url="${cpath}/mypage/mento-test"
	      	 class="page-link">
	 	     멘토 자격시험
	  		 </button>
	        </li>
	      </ul>
	  </div>
</div>