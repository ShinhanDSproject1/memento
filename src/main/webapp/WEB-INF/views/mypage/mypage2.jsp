<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 프로필 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypageProfileStyle.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypageProfileVars.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/sidebar.css" />
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="div">
	<%@ include file="../common/sidebar.jsp"%>
		<div class="frame-3650">
			<div class="group-497">
				<div class="group-3780">
					<div class="group-75">
						<div class="group-4972">
							<img class="avatar-default" src="${cpath}/resources/images/mypage/mypage2/avatar-default0.svg" />
							<div class="frame-497">
								<img class="vuesax-linear-export"
									src="${cpath}/resources/images/mypage/mypage2/vuesax-linear-export0.svg" />
							</div>
						</div>
						<div class="div2">코딩하는 뭉뭉이</div>
						<div class="mento">mento</div>
						<div class="group-4973">
							<div class="group-4974">
								<div class="cash">Cash :</div>
								<div class="_53-000">53,000</div>
							</div>
							<div class="group-4975">
								<div class="point">
									<span> <span class="point-span">Point</span> <span
										class="point-span2">:</span>
									</span>
								</div>
								<div class="_530-p">530 P</div>
							</div>
						</div>
					</div>
					<div class="line-6"></div>
				</div>
			</div>
			<div class="frame-409">
				<div class="div3">
					<ul class="div-3-span">
						<li>대시보드</li>
					</ul>
				</div>
				<div class="div4">
					<ul class="div-4-span">
						<li>캐시 충전</li>
					</ul>
				</div>
				<div class="div5">
					<ul class="div-5-span">
						<li>결제내역</li>
					</ul>
				</div>
				<div class="spark-test">
					<ul class="spark-test-span">
						<li>Spark Test</li>
					</ul>
				</div>
				<div class="div6">
					<ul class="div-6-span">
						<li>멘토 자격시험</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="frame-3592">
			<div class="div10">프로필 정보 수정</div>
			<div class="frame-3593">
				<div class="frame-310">
					<div class="div11">취소</div>
				</div>
				<div class="frame-309">
					<div class="div11">저장</div>
				</div>
			</div>
			<div class="div12">이미지</div>
			<img class="group-450" src="${cpath}/resources/images/mypage/mypage2/group-4500.svg" />
			<div class="div13">닉네임</div>
			<div class="rectangle-262"></div>
			<div class="div14">상냥한 예민 보스</div>
			<div class="div15">관심사</div>
			<div class="rectangle-263"></div>
			<div class="java">#JAVA</div>
			<div class="sql">#SQL</div>
			<div class="algorithm">#Algorithm</div>
			<div class="div16">주소 관리</div>
			<div class="div17">휴대폰 번호</div>
			<div class="rectangle-2632"></div>
			<div class="rectangle-264"></div>
			<div class="_6">서울시 마포구 새창로6가길</div>
			<div class="div18">소개 정보</div>
			<div class="rectangle-261"></div>
			<div class="div19">상냥한 예민 보스입니다! 정규 멘토가 되는게 꿈이에요...! 잘 부탁드립니다
				^^</div>
			<div class="_010-1234-5678">010 - 1234 - 5678</div>
		</div>
	</div>
</body>
</html>