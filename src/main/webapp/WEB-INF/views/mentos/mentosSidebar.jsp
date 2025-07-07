<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<input type="hidden" id="cpath" value="${cpath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
	
</script>
<link rel="stylesheet"
	href="${cpath}/resources/css/mentos/MentosSidebar.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/mentos/mentosSidebar.js"></script>
<aside class="sidebar">
	<div class="profile-section">
		<div class="profile-avatar-wrapper">
			<img id="profileImage"
				src="/resources/images/sidebar/avatar-default0.svg" />
		</div>
		<div id="sidebar-area">
			<div class="mento-sidebar" id="mentoName"></div>
			<div class="edit-profile-button-wrapper">
				<div class="frame-371">
					<div class="user-nicknaprofile-cardme" id="userType"></div>
				</div>
			</div>
			<div class="group-327">
				<div class="_30-000">
					<span>수강생수 <br /></span> <span id="studentCount"></span>
				</div>
				<div class="_300">
					<span>수강평수 <br /></span> <span id="reviewCount"></span>
				</div>
				<div class="_5-0">
					<span>강의평점 <br /></span> <span id="avgScore"></span>
				</div>
			</div>
		</div>
	</div>

	<ul class="nav-menu">
		<li class="nav-item">
			<button type="button" class="page-link dynamic-link"
				data-url-template="${cpath}/mentos/mentodetail?mentoId=">홈</button>
		</li>
		<li class="nav-item">
			<button type="button" class="page-link dynamic-link"
				data-url-template="${cpath}/mentos/mentodetaillist?mentoId=">진행한
				멘토스 내역</button>
		</li>
		<li class="nav-item">
			<button type="button" class="page-link dynamic-link"
				data-url-template="${cpath}/mentos/mentodetailreview?mentoId=">리뷰</button>
		</li>
	</ul>

</aside>