<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>마이페이지 대시보드</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/dash-board/mypageDashboardStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/dash-board/mypageVars.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/sidebar/sidebar.css" />
</head>
<body>
	<div class="layout-wrapper">
		<%@ include file="../../header/header.jsp"%>
		<div class="main-content-wrapper">
			<%@ include file="../../sidebar/sidebar.jsp"%>
			<div class="page-container">
				<section id="dashboard-row-1" class="dashboard-row-section">
					<article id="matchup-card" class="card style_103">
						<h2 class="style_135">Match Up</h2>
						<hr class="style_7">
						<div class="matchup-items">
							<div class="card-list-item">
								<img
									src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg"
									alt="Avatar" class="avatar-img style_84">
								<div class="item-details">
									<span class="style_86">개발새발 코딩 스터디</span>
									<div class="item-row">
										<div class="merged-icon-container style_88"
											style="width: 13px; height: 13px;">
											<img
												src="${cpath}/resources/images/mypage/dash-board/icon-time-calendar-010.svg"
												alt="Calendar part"
												style="left: 1.08px; top: 1.62px; width: 10.83px; height: 10.83px;">
										</div>
										<span class="style_134">2 / 3회 진행 중</span>
									</div>
								</div>
								<span class="style_86 item-status">(Leader)</span> 
								<a href="#">
									<img src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-logout1.svg" alt="Icon" class="style_105">
								</a>
							</div>
							<div class="card-list-item">
								<img
									src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg"
									alt="Avatar" class="avatar-img style_84">
								<div class="item-details">
									<span class="style_86">쉽게 배우는 자바</span>
									<div class="item-row">
										<div class="merged-icon-container style_88"
											style="width: 13px; height: 13px;">
											<img
												src="${cpath}/resources/images/mypage/dash-board/icon-time-calendar-010.svg"
												alt="Calendar part"
												style="left: 1.08px; top: 1.62px; width: 10.83px; height: 10.83px;">
										</div>
										<span class="style_134">4 / 5회 진행 중</span>
									</div>
								</div>
								<span class="style_86 item-status">(follower)</span> 
								<a href="#">
									<img src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-logout1.svg" alt="Icon" class="style_105">
								</a>
							</div>
							<div class="card-list-item">
								<img
									src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg"
									alt="Avatar" class="avatar-img style_84">
								<div class="item-details">
									<span class="style_86">알고리즘 마스터반</span>
									<div class="item-row">
										<div class="merged-icon-container style_88"
											style="width: 13px; height: 13px;">
											<img
												src="${cpath}/resources/images/mypage/dash-board/icon-time-calendar-010.svg"
												alt="Calendar part"
												style="left: 1.08px; top: 1.62px; width: 10.83px; height: 10.83px;">
										</div>
										<span class="style_134">2 / 3회 진행 중</span>
									</div>
								</div>
								<span class="style_86 item-status">(Leader)</span> 
								<a href="#">
									<img src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-logout1.svg" alt="Icon" class="style_105">
								</a>
							</div>
						</div>
						<a href="${cpath}/mypage/page6" class="card-footer-link style_26"> 매치업 목록 <img
							src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-logout1.svg"
							alt="Arrow" class="style_104">
						</a>
					</article>

					<article id="mentos-card" class="card style_83">
						<h2 class="style_85">Mentos</h2>
						<hr class="style_7">
						<div class="mentos-items">
							<div class="card-list-item">
								<img
									src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg"
									alt="Avatar" class="avatar-img style_84">
								<div class="item-details">
									<span class="style_86">봄이 오겠냐? 스프링</span>
									<div class="item-row">
										<div class="merged-icon-container style_88"
											style="width: 18px; height: 18px;">
											<img
												src="${cpath}/resources/images/mypage/dash-board/icon-maps-compass0.svg"
												alt="Compass part"
												style="left: 0.75px; top: 0.75px; width: 16.5px; height: 16.5px;">
										</div>
										<span class="style_94">얄팍한 코딩사전</span>
									</div>
								</div>
								<span class="style_87 item-status">수강중</span>
							</div>
							<div class="card-list-item">
								<img
									src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg"
									alt="Avatar" class="avatar-img style_84">
								<div class="item-details">
									<span class="style_86">파이썬? 야 너두 할 수 있어</span>
									<div class="item-row">
										<img
											src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-430.svg"
											alt="Mentor Icon" class="style_97"> <span
											class="style_98">Mentor</span>
									</div>
								</div>
								<span class="style_96 item-status">현재 진행중</span>
							</div>
							<div class="card-list-item">
								<img
									src="${cpath}/resources/images/mypage/dash-board/avatar-man-010.svg"
									alt="Avatar" class="avatar-img style_84">
								<div class="item-details">
									<span class="style_86">손쉬운 정보처리기사</span>
									<div class="item-row">
										<div class="merged-icon-container style_88"
											style="width: 18px; height: 18px;">
											<img
												src="${cpath}/resources/images/mypage/dash-board/icon-maps-compass0.svg"
												alt="Compass part"
												style="left: 0.75px; top: 0.75px; width: 16.5px; height: 16.5px;">
										</div>
										<span class="style_94">흥달쌤</span>
									</div>
								</div>
								<span class="style_87 item-status">수강중</span>
							</div>
						</div>
						<a href="${cpath}/mypage/page7" class="card-footer-link style_26"> 멘토스 목록 <img
							src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-logout1.svg"
							alt="Arrow" class="style_102">
						</a>
					</article>
				</section>
				<section id="dashboard-row-2" class="dashboard-row-section">
					<article id="keepgoing-card" class="card style_103">
						<div class="style_5">
							<h2 class="style_6">Keep Going</h2>
							<hr class="style_7">
						</div>
						<div class="style_8">
							<div class="style_10">
								<div class="style_11">
									<div class="style_12">
										<span class="style_13">넌너입니다</span>
										<div class="style_14">
											<div class="style_15">
												<img
													src="${cpath}/resources/images/mypage/dash-board/vector0.svg"
													alt="User icon" class="style_16"> <span
													class="style_17">33</span>
											</div>
										</div>
									</div>
									<span class="style_18">화, 목 (19:00~21:00)</span>
								</div>
								<a href="#" class="style_19"><span class="style_20">채팅하기</span>
								</a>
							</div>
							<div class="style_10">
								<div class="style_11">
									<div class="style_22">
										<span class="style_13">넌너입니다</span>
										<div class="style_14">
											<div class="style_15">
												<img
													src="${cpath}/resources/images/mypage/dash-board/vector0.svg"
													alt="User icon" class="style_23"> <span
													class="style_17">33</span>
											</div>
										</div>
									</div>
									<span class="style_18">화, 목 (19:00~21:00)</span>
								</div>
								<a href="#" class="style_24"><span class="style_20">채팅하기</span>
								</a>
							</div>
						</div>
						<a href="${cpath}/mypage/page8" class="card-footer-link style_26"> 킵고잉 목록 <img
							src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-logout1.svg"
							alt="Arrow" class="style_102">
						</a>
					</article>

					<article id="sparktest-card" class="card style_103">
						<div class="style_5">
							<h2 class="style_31">Spark Test</h2>
							<hr class="style_7">
						</div>
						<div class="style_32">
							<h3 class="style_33">목표러 코취치</h3>
							<p class="style_34">(목표지향 개발자)</p>
						</div>
					</article>
				</section>
				<section id="dashboard-row-3" class="dashboard-row-section">
					<article id="halloffame-card" class="card style_52">
						<div class="style_54">
							<img
								src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-500.svg"
								alt="Crown" class="style_55">
							<h2 class="style_56">명예의 전당</h2>
							<img
								src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-500.svg"
								alt="Crown" class="style_57">
						</div>
						<hr class="style_7">
						<div class="style_58 hall-of-fame-avatars">
							<div class="style_59">
								<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar" class="style_61"> <img
									src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar placeholder" class="style_62"> <img
									src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar placeholder" class="style_63"> <img
									src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar placeholder" class="style_64"> <img
									src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar placeholder" class="style_65"> <img
									src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar placeholder" class="style_66">
							</div>
							<div class="style_59">
								<img src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar" class="style_61"> <img
									src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar placeholder" class="style_62"> <img
									src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar placeholder" class="style_63"> <img
									src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar placeholder" class="style_64"> <img
									src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar placeholder" class="style_65"> <img
									src="${cpath}/resources/images/mypage/dash-board/frame0.svg"
									alt="Avatar placeholder" class="style_66">
							</div>
						</div>
					</article>

					<article id="mywishlist-card" class="card style_35">
						<div class="style_37">
							<h2 class="style_38">내가 찜한 목록</h2>
							<hr class="style_7">
						</div>
						<div class="style_39">
							<div class="style_40">
								<div class="style_41">
									<span class="style_34">리엑트 한큐에 배우기</span> <span
										class="style_42">(20,000)</span>
								</div>
								<img src="${cpath}/resources/images/mypage/dash-board/login1.svg"
									alt="Action icon" class="style_43">
							</div>
							<div class="style_44">
								<div class="style_45">
									<span class="style_34">Git을 활용한 프로젝트 생성해보기</span> <span
										class="style_46">(Free)</span>
								</div>
								<img src="${cpath}/resources/images/mypage/dash-board/login1.svg"
									alt="Action icon" class="style_47">
							</div>
							<div class="style_48">
								<div class="style_49">
									<span class="style_34">Figma 어렵지 않아요</span> <span
										class="style_50">(35,000)</span>
								</div>
								<img src="${cpath}/resources/images/mypage/dash-board/login1.svg"
									alt="Action icon" class="style_51">
							</div>
						</div>
					</article>
				</section>
				<section id="dashboard-row-4" class="dashboard-row-section">
					<article id="attendance-card" class="card style_68">
						<div class="style_69">
							<div class="style_70">
								<h2 class="style_56">이번주 출석체크</h2>
								<a href="#" class="style_71"> <img
									src="${cpath}/resources/images/mypage/dash-board/vuesax-linear-import0.svg"
									alt="Calendar icon" class="style_72"> <span
									class="style_73">월간 달력 보기</span>
								</a>
							</div>
							<div class="attendance-days style_2">
								<div class="style_74">
									<div class="style_75">
										<span class="style_76">월</span>
										<hr class="style_77">
										<img
											src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-080.svg"
											alt="Attendance status" class="style_78 attendance-day-icon">
									</div>
								</div>
								<div class="style_74">
									<div class="style_75">
										<span class="style_76">화</span>
										<hr class="style_77">
										<img
											src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-080.svg"
											alt="Attendance status" class="style_79 attendance-day-icon">
									</div>
								</div>
								<div class="style_74">
									<div class="style_75">
										<span class="style_76">수</span>
										<hr class="style_77">
										<img
											src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-080.svg"
											alt="Attendance status" class="style_80 attendance-day-icon">
									</div>
								</div>
								<div class="style_74" id="attendance-check">
								  	<div class="style_75">
								    	<span class="style_76">목</span>
								    	<hr class="style_77">
								    	<img
									      src="${cpath}/resources/images/mypage/dash-board/icon-fill-type-950.svg"
									      alt="Attendance status"
									      class="style_82 attendance-day-icon">
								  </div>
								</div>
								<div class="style_74">
									<div class="style_75">
										<span class="style_76">금</span>
										<hr class="style_77">
									</div>
								</div>
								<div class="style_74">
									<div class="style_75">
										<span class="style_76">토</span>
										<hr class="style_77">
									</div>
								</div>
								<div class="style_74">
									<div class="style_75">
										<span class="style_76">일</span>
										<hr class="style_77">
									</div>
								</div>
							</div>
						</div>
					</article>
				</section>
			</div>
		</div>
	</div>
</body>
<script>
  const basePath = '${pageContext.request.contextPath}';
</script>	
<script src="${pageContext.request.contextPath}/resources/js/dash-board.js"></script>
</html>