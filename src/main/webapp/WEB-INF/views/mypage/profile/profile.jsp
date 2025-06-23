<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 프로필 수정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/profile/mypageProfileStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageVars.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/sidebar/sidebar.css" />
</head>
<body>
	<div class="layout-wrapper">
		<%@ include file="../../header/header.jsp"%>
		<div class="main-content-wrapper">
			<%@ include file="../../sidebar/sidebar.jsp"%>
			<div class="page-container">
				<section id="profile-page" class="profile-row-section">
					<main class="profile-edit-card">
						<header class="profile-edit-header-content">
							<h1 class="page-title">프로필 정보 수정</h1>
							<div class="action-buttons">
								<button type="button" class="btn btn-cancel">취소</button>
								<button type="button" class="btn btn-save">저장</button>
							</div>
						</header>

						<form class="profile-form-content">
							<div class="form-row form-row-image">
								<label for="profile-image-input" class="form-label">이미지</label>
								<div class="form-value">
									<div class="avatar-container">
										<img
											src="${cpath}/resources/images/mypage/profile/group-4500.svg"
											alt="Avatar border" class="avatar-svg-outer"> <img
											src="${cpath}/resources/images/mypage/profile/avatar-default0.svg"
											alt="Avatar default" class="avatar-svg-inner"
											id="profile-image-input">
									</div>
								</div>
							</div>

							<div class="form-row">
								<label for="nickname" class="form-label">닉네임</label>
								<div class="form-value">
									<div class="form-input-field">
										<span class="form-input-text" id="nickname">상냥한 예민 보스</span>
									</div>
								</div>
							</div>

							<div class="form-row">
								<label for="interests" class="form-label">관심사</label>
								<div class="form-value">
									<div class="form-input-field">
										<span class="form-input-text tag" id="interests">#JAVA</span>
										<span class="form-input-text tag">#SQL</span> <span
											class="form-input-text tag">#Algorithm</span>
									</div>
								</div>
							</div>

							<div class="form-row">
								<label for="address" class="form-label">주소 관리</label>
								<div class="form-value">
									<div class="form-input-field">
										<span class="form-input-text" id="address">서울시 마포구
											새창로6가길</span>
									</div>
								</div>
							</div>

							<div class="form-row">
								<label for="phone" class="form-label">휴대폰 번호</label>
								<div class="form-value">
									<div class="form-input-field">
										<span class="form-input-text" id="phone">010 - 1234 -
											5678</span>
									</div>
								</div>
							</div>

							<div class="form-row form-row-intro">
								<label for="introduction" class="form-label">소개 정보</label>
								<div class="form-value">
									<div class="form-input-field form-input-textarea">
										<span class="form-input-text" id="introduction">상냥한 예민
											보스입니다! 정규 멘토가 되는게 꿈이에요...! 잘 부탁드립니다 ^^</span>
									</div>
								</div>
							</div>
						</form>
					</main>
				</section>
			</div>
		</div>
	</div>
</body>
</html>