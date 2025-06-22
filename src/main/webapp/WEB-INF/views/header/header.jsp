<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${cpath}/resources/static/css/header/header.css" />

<title>header</title>
</head>
<body>
	<header class="header">
	    <img class="header__img--logo" src="${cpath}/resources/static/images/header/logo.png" /> 
	    <img class="header__img--title" src="${cpath}/resources/static/images/header/title.png" />
    
	    <section class="header__section__button">
	        <button class="header__button header__button--matchup">매치업</button>
	        <button class="header__button header__button--mentos">멘토스</button>
	        <button class="header__button header__button--keepgoing">킵고잉</button>
	    </section>
    
    <section class="header__section__searchForm">
      <form class="header__searchform">
        <input 
        		type="text" 
        		id="search-input" 
        		class="header__searchform--input" 
        		placeholder="나의 성장을 도와줄 멘토를 찾아보세요" 
        />
    	<button type="submit" class="header__button--search">
       		<img 
       			src="${cpath}/resources/static/icons/header/search-icon.svg"
       			alt="검색" 
       		/>
      	</button>
      </form>
    </section>
    
    <section class="header__section__loginbox">
      <button class="header__button--login">로그인</button>
    </section>
    <div class="header__section__profile">
      <img class="header__button--profile" src="${cpath}/resources/static/icons/header/mypage-icon.svg" />
    </div>
    <img class="header__button--alarm" src="${cpath}/resources/static/icons/header/alarm-icon.svg" />
  </header>


</body>
</html>