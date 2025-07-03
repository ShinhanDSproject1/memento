<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />		

<link rel="stylesheet" href="${cpath}/resources/css/mypage/profile/mypageProfileStyle.css" />
<script src = "${cpath}/resources/js/mypage/profile/profile-detail.js"></script>
<div class="page-container">
	<section id="profile-page" class="profile-row-section">
		<main class="profile-edit-card">

			<form method="post" id="profileForm" class="profile-form-content" action="#" enctype="multipart/form-data">
				<header class="profile-edit-header-content">
					<h1 class="page-title">프로필 정보 수정</h1>
					<div class="action-buttons">
						<button type="reset" class="btn btn-cancel">취소</button>
						<button type="submit" class="btn btn-save">저장</button>
					</div>
				</header>
				<div class="form-row form-row-image">
					<label for="profile-image-input" class="form-label">이미지</label>
					<div class="form-value">
						<div class="avatar-container">
							<img src="${cpath}/resources/images/mypage/profile/avatar-default0.svg"
								alt="Avatar default" class="avatar-svg-inner"
								id="profile-image-input">
							<label for = "profile-img" class="file-upload-label"><i class="fa-solid fa-up-right-from-square"></i></label>
							<input type="file" id = "profile-img">
						</div>
					</div>
				</div>

				<div class="form-row">
					<label for="nickname" class="form-label">닉네임</label>
					<div class="form-value">
						<input type="text" class="form-input-field form-input-text" id="nickname"/>
					</div>
				</div>

				<div class="form-row">
					<label for="interests" class="form-label">관심사</label>
					<div class="form-value">
						<input type="text" id='interestNames' class="form-input-field form-input-text tag"/>
					</div>
				</div>

				<div class="form-row">
					<label for="address" class="form-label">주소 관리</label>
					<div class="form-value">
							<input type="text" class="form-input-field form-input-text" id="address"/>
					</div>
				</div>

				<div class="form-row">
					<label for="phone" class="form-label">휴대폰 번호</label>
					<div class="form-value">
						<input type="tel" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" class="form-input-field form-input-text" id="phone"/>
					</div>
				</div>

				<div class="form-row form-row-intro">
					<label for="introduction" class="form-label">소개 정보</label>
					<div class="form-value">
						<div class="form-input-field form-input-textarea">
							<textarea maxlength="200" class="form-input-text" id="introduction"></textarea>
						</div>
					</div>
				</div>
			</form>
		</main>
	</section>
</div>