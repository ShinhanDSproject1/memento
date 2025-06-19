<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>마이페이지 대시보드</title>

<!-- 스타일 시트 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageDashboardStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypageDashboardVars.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/sidebar.css" />
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="div">
	<%@ include file="../common/sidebar.jsp"%>
		<div class="frame-139">
			<div class="rectangle-180"></div>
			<div class="frame-372">
				<div class="mentos">Mentos</div>
			</div>
			<div class="frame-3722">
				<div class="div7">얄팍한 코딩사전</div>
				<div class="icon-maps-01">
					<img class="icon-maps-compass" src="${cpath}/resources/images/mypage/mypage1/icon-maps-compass0.svg" />
				</div>
				<div class="div8">파이썬? 야 너두 할 수 있어</div>
				<div class="rectangle-138"></div>
				<div class="div9">수강중</div>
			</div>
			<div class="frame-3723">
				<div class="mentor">Mentor</div>
				<img class="icon-fill-type-43" src="${cpath}/resources/images/mypage/mypage1/icon-fill-type-430.svg" />
				<div class="div10">봄이 오겠냐? 스프링</div>
				<div class="rectangle-139"></div>
				<div class="div11">현재 진행중</div>
			</div>
			<div class="frame-3724">
				<div class="div12">흥달쌤</div>
				<div class="icon-maps-012">
					<img class="icon-maps-compass2" src="${cpath}/resources/images/mypage/mypage1/icon-maps-compass1.svg" />
				</div>
				<div class="div13">손쉬운 정보처리기사</div>
				<div class="rectangle-140"></div>
				<div class="div14">수강중</div>
			</div>
			<div class="frame-3725">
				<div class="div15">멘토스 목록</div>
				<img class="vuesax-linear-logout" src="${cpath}/resources/images/mypage/mypage1/vuesax-linear-logout0.svg" />
			</div>
		</div>
		<div class="frame-3726">
			<div class="rectangle-183"></div>
			<div class="frame-3727">
				<div class="match-up">Match Up</div>
			</div>
			<div class="div16" onclick="location.href='page6'">매치업 목록</div>
			<img class="vuesax-linear-logout2" src="${cpath}/resources/images/mypage/mypage1/vuesax-linear-logout1.svg" />
			<div class="ellipse-5"></div>
			<img class="avatar-man-01" src="${cpath}/resources/images/mypage/mypage1/avatar-man-010.svg" />
			<div class="div17">개발새발 코딩 스터디</div>
			<div class="icon-time-02">
				<img class="icon-time-calendar-01" src="${cpath}/resources/images/mypage/mypage1/icon-time-calendar-010.svg" />
			</div>
			<div class="_2-3">2 / 3회 진행 중</div>
			<div class="leader">(Leader)</div>
			<img class="icon-fill-type-87" src="${cpath}/resources/images/mypage/mypage1/icon-fill-type-870.svg" />
			<div class="icon-time-022">
				<img class="icon-time-calendar-012" src="${cpath}/resources/images/mypage/mypage1/icon-time-calendar-011.svg" />
			</div>
			<div class="ellipse-6"></div>
			<img class="avatar-man-04" src="${cpath}/resources/images/mypage/mypage1/avatar-man-040.svg" />
			<div class="div18">쉽게 배우는 자바</div>
			<div class="_4-5">4 / 5회 진행 중</div>
			<div class="follower">(follower)</div>
			<img class="icon-fill-type-88" src="${cpath}/resources/images/mypage/mypage1/icon-fill-type-880.svg" />
			<div class="icon-time-023">
				<img class="icon-time-calendar-013" src="${cpath}/resources/images/mypage/mypage1/icon-time-calendar-012.svg" />
			</div>
			<div class="ellipse-7"></div>
			<img class="vector" src="vector0.svg" />
			<div class="div19">알고리즘 마스터 반</div>
			<div class="_2-32">2 / 3회 진행 중</div>
			<div class="follower2">(follower)</div>
			<img class="icon-fill-type-872" src="${cpath}/resources/images/mypage/mypage1/icon-fill-type-871.svg" />
		</div>
		<div class="frame-311">
			<div class="frame-3649">
				<div class="frame-373">
					<div class="keep-going">Keep Going</div>
				</div>
				<div class="frame-3652">
					<div class="frame-391">
						<div class="div20">눈누입니다</div>
						<div class="users">
							<div class="user-icon-and-count">
								<img class="vector2" src="${cpath}/resources/images/mypage/mypage1/vector1.svg" />
								<div class="users-count-text">33</div>
							</div>
						</div>
						<div class="_19-00-21-00">화, 목 (19:00 ~ 21:00)</div>
					</div>
					<div class="frame-383">
						<div class="div21">채팅하기</div>
					</div>
				</div>
				<div class="frame-3732">
					<div class="div22">킵고잉 목록</div>
					<img class="vuesax-linear-logout3" src="${cpath}/resources/images/mypage/mypage1/vuesax-linear-logout2.svg" />
				</div>
				<div class="frame-3653">
					<div class="frame-3912">
						<div class="div23">넌너입니다</div>
						<div class="users2">
							<div class="user-icon-and-count">
								<img class="vector3" src="${cpath}/resources/images/mypage/mypage1/vector2.svg" />
								<div class="users-count-text">33</div>
							</div>
						</div>
						<div class="_19-00-21-002">월, 수 (19:00 ~ 21:00)</div>
					</div>
					<div class="frame-3832">
						<div class="div21">채팅하기</div>
					</div>
				</div>
			</div>
			<div class="frame-3651">
				<div class="frame-4092">
					<div class="frame-3632">
						<img class="icon-fill-type-50" src="${cpath}/resources/images/mypage/mypage1/icon-fill-type-500.svg" />
						<div class="div24">명예의 전당</div>
						<img class="icon-fill-type-502" src="${cpath}/resources/images/mypage/mypage1/icon-fill-type-501.svg" />
					</div>
					<div class="frame-407">
						<img class="frame" src="${cpath}/resources/images/mypage/mypage1/frame0.svg" />
						<div class="ellipse-23"></div>
						<div class="ellipse-27"></div>
						<div class="ellipse-20"></div>
						<div class="ellipse-24"></div>
						<div class="ellipse-28"></div>
					</div>
					<div class="frame-408">
						<div class="ellipse-21"></div>
						<div class="ellipse-25"></div>
						<div class="ellipse-29"></div>
						<div class="ellipse-22"></div>
						<div class="ellipse-26"></div>
						<div class="ellipse-30"></div>
					</div>
				</div>
			</div>
			<div class="frame-381">
				<div class="frame-3812">
					<div class="div25">
						<span> <span class="div-25-span"> 목표러 코취치 <br />
						</span> <span class="div-25-span2">(목표지향 개발자)</span>
						</span>
					</div>
				</div>
				<div class="frame-380">
					<div class="spark-type">Spark Type</div>
				</div>
			</div>
			<div class="frame-3802">
				<div class="frame-3813">
					<img class="login" src="${cpath}/resources/images/mypage/mypage1/login0.svg" />
					<div class="div26">Git을 활용한 프로젝트 생성해보기</div>
					<div class="free">(Free)</div>
				</div>
				<div class="frame-3803">
					<img class="login2" src="${cpath}/resources/images/mypage/mypage1/login1.svg" />
					<div class="div26">리액트 한큐에 배우기</div>
					<div class="_20-000">(20,000)</div>
				</div>
				<div class="frame-382">
					<img class="login3" src="${cpath}/resources/images/mypage/mypage1/login2.svg" />
					<div class="div26">Figma 어렵지 않아요</div>
					<div class="_35-000">(35,000)</div>
				</div>
				<div class="frame-3804">
					<div class="div27">내가 찜한 목록</div>
					<div class="frame-3805">
						<img class="vuesax-linear-import" src="${cpath}/resources/images/mypage/mypage1/vuesax-linear-import0.svg" />
						<div class="more">More</div>
					</div>
				</div>
			</div>
			<div class="frame-3822">
				<div class="_2025-6-2">2025년 6월 2주</div>
				<div class="frame-406">
					<img class="vuesax-linear-import2" src="${cpath}/resources/images/mypage/mypage1/vuesax-linear-import1.svg" />
					<div class="div28">월간 달력 보기</div>
				</div>
				<div class="frame-3823">
					<div class="frame-3806">
						<div class="frame-4062">
							<div class="div29">월</div>
						</div>
						<div class="frame-4063">
							<div class="div30">화</div>
						</div>
						<div class="frame-4064">
							<div class="div31">수</div>
							<div class="rectangle-162"></div>
						</div>
						<div class="frame-4065">
							<div class="div20">목</div>
						</div>
						<div class="frame-4066">
							<div class="rectangle-163"></div>
							<div class="div32">금</div>
						</div>
						<div class="frame-4067">
							<div class="div33">토</div>
						</div>
						<div class="frame-4068">
							<div class="div33">일</div>
						</div>
					</div>
					<div class="frame-3807">
						<div class="rectangle-167"></div>
						<div class="rectangle-168"></div>
						<div class="rectangle-170"></div>
						<div class="rectangle-171"></div>
						<div class="rectangle-172"></div>
						<div class="rectangle-173"></div>
						<img class="icon-fill-type-08" src="${cpath}/resources/images/mypage/mypage1/icon-fill-type-080.svg" /> <img
							class="icon-fill-type-082" src="${cpath}/resources/images/mypage/mypage1/icon-fill-type-081.svg" />
						<div class="rectangle-169"></div>
						<img class="icon-fill-type-95" src="${cpath}/resources/images/mypage/mypage1/icon-fill-type-950.svg" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>