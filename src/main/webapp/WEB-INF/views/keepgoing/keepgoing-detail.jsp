<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Keepgoing-detail</title>
</head>
<body >
	<section class="modal-mock-up">
        <section class="detail_info">
            <div class="logo-name">
                <div class="logo"><img src="${cpath}/resources/images/nunnu_icon.webp"></div>
                <div class="name">눈누입니다</div>
                <div class="studyinfo">
                    <span class="studytype">코드폭탄 해피빈</span>
                    <i class="fa-solid fa-circle graydot"></i>
                    <span class="language">JAVA</span>
                </div>
            </div>
            <div class="info">
                <div class="members">
                    <i class="fa-regular fa-user"></i>
                    <span class="info-text">33</span>
                </div>
                <div class="leader">
                    <i class="fa-solid fa-crown"></i>
                    <span class="info-text">눈누</span>
                </div>
                <div class="price">
                    <i class="fa-solid fa-coins"></i>
                    <span class="info-text">10000</span>
                </div>
            </div>
            <div class="study-style">
                <canvas id="myChart"></canvas>
            </div>

            <div class="location-img">
                <img src="${cpath}/resources/images/location.png">
            </div>
            <div class="location-text">
                <i class="fa-solid fa-location-dot"></i>
                <span>서울 마포구 월드컵북로4길 65 1층</span>
            </div>
        </section>
        <section class="main">
        	<div id="dynamicKeepgoing">
	            <div class="activity-img">
	                <img src="${cpath}/resources/images/study_img.jpg">
	            </div>
	            <div class="introduce-info">
	                <div class="introduce-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere molestias iure expedita quia quo neque dignissimos totam libero natus. Rem veritatis nesciunt velit maiores error tempora id ut, soluta et!</div>
	                <div class="bottom-info">
	                    <div class="update-at">
	                        <span>수정일:2025.06.22</span>
	                    </div>
	                    <div class="price-button">
	                        <span>₩10000</span>
	                        <button>신청하기</button>
	                    </div>
	                </div>
	            </div>
	    	</div>
        </section>
        </section>
</body>
</html>