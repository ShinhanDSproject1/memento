<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap"%>

<%
List<Map<String, Object>> matchupList = new ArrayList<Map<String, Object>>();

for (int i = 1; i <= 8; i++) {
	Map<String, Object> m = new HashMap<String, Object>();
	m.put("title", "🔥 알고리즘 스터디 " + i);
	m.put("startDate", "2025/06/2" + i); // 2025/06/21 ~ 2025/06/28
	m.put("endDate", "2025/06/2" + (i + 1));
	m.put("startTime", "14:00");
	m.put("endTime", "16:00");
	m.put("region", "서울 강남구");
	m.put("memberCount", String.format("%02d/%02d", i + 2, 10)); // "05/10" 형식
	m.put("price", 20000 + (i * 1000)); // ₩가격
	/* m.put("imgId", i);  // profile_1.png ~ profile_8.png */
	m.put("tags", "#Java #알고리즘");
	m.put("badge", i % 2 == 0 ? "모집중" : "마감임박🚨");

	matchupList.add(m);
}

request.setAttribute("matchupList", matchupList);
%>

<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>me:mento</title>
<link rel="stylesheet" href="${cpath}/resources/css/matchupList.css">
<link rel="stylesheet" href="${cpath}/resources/css/vars.css">
</head>
<body>
	<div class="div">
		<div class="frame-3657">
			<div class="frame-390">
				<div class="keepgoing-filter-and-make">
					<div class="detail-select">
						<div class="detail-select-li">
							<div class="location">
								<div class="detail-select-li-text">
									<span> <span class="detail-select-li-text-span">내</span>
										<span class="detail-select-li-text-span2"></span> <span
										class="detail-select-li-text-span">지역</span>
									</span>
								</div>
								<img class="vector"
									src="${cpath}/resources/images/icon-down.svg" />
							</div>
						</div>
						<div class="detail-select-li">
							<div class="order-option">
								<div class="frame-40">
									<div class="detail-select-li-text2">인기순</div>
									<img class="vuesax-linear-arrow-3"
										src="${cpath}/resources/images/arrow-3.svg" />
								</div>
							</div>
						</div>
						<div class="detail-select-li2">
							<div class="match-type">
								<div class="detail-select-li-text2">학습유형</div>
								<img class="vector"
									src="${cpath}/resources/images/icon-down.svg" />
							</div>
						</div>
						<div class="detail-select-li">
							<div class="frame-31">
								<div class="detail-select-li-text2">요일</div>
								<img class="vector"
									src="${cpath}/resources/images/icon-down.svg" />
							</div>
						</div>
						<div class="detail-select-li">
							<div class="time">
								<div class="detail-select-li-text2">시간</div>
								<img class="vector"
									src="${cpath}/resources/images/icon-down.svg" />
							</div>
						</div>
						<div class="detail-select-li">
							<div class="language">
								<div class="detail-select-li-text2">언어</div>
								<img class="vector"
									src="${cpath}/resources/images/icon-down.svg" />
							</div>
						</div>
					</div>
				</div>
				<button class="group-389" type="button"
					onclick="location.href='${pageContext.request.contextPath}/createMatchup'">
					새로운 매치업 작성하기</button>

			</div>
			<div class="frame-3694">
				<c:forEach var="matchup" items="${matchupList}">
				
					<div class="matchup-cardview" onclick="location.href='${cpath}/matchupDetail'">
						<div class="rectangle-48"></div>
						<div class="rectangle-210"></div>
						<div class="div3">${matchup.region}</div>
						<div class="icon-time-04">
							<img class="icon-time-clock-outlined"
								src="${cpath}/resources/images/icon_time.svg" />
						</div>
						<div class="_2025-06-13-2025-06-20">${matchup.startDate}-
							${matchup.endDate}</div>
						<div class="_15-00-17-00">${matchup.startTime}-
							${matchup.endTime}</div>
						<div class="icon-time-02">
							<img class="icon-time-calendar-01"
								src="${cpath}/resources/images/icon-calendar.svg" />
						</div>
						<div class="_03-05">${matchup.memberCount}</div>
						<div class="_70-000">₩${matchup.price}</div>
						<div class="div4">모집인원</div>
						<div class="icon-user-05">
							<img class="user-users-group"
								src="${cpath}/resources/images/icon-user.svg" />
						</div>
						<div class="div5">${matchup.title}</div>
						<div class="rectangle-60"></div>
						<div class="icon-maps-04">
							<img class="icon-maps-map-pin"
								src="${cpath}/resources/images/icon-map-black.svg" />
						</div>
						<img class="_1" src="${cpath}/resources/images/profile.svg" />
						<div class="group-414">
							<div class="rectangle-209"></div>
							<div class="java-c">${matchup.tags}</div>
						</div>
						<div class="group-413">
							<div class="rectangle-82"></div>
							<div class="div6">${matchup.badge}</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="pagemove-list">
				<div class="page-back-btn">
					<img class="vuesax-linear-arrow-left"
						src="vuesax-linear-arrow-left0.svg" />
				</div>
				<div class="page-li-btn-seleted-page">
					<div class="d-2-b-12-white">1</div>
				</div>
				<div class="page-li-btn">
					<div class="d-2-r-12-black">2</div>
				</div>
				<div class="page-li-btn">
					<div class="d-2-r-12-black">3</div>
				</div>
				<div class="page-li-btn">
					<div class="d-2-r-12-black">4</div>
				</div>
				<div class="page-li-btn">
					<div class="d-2-r-12-black">5</div>
				</div>
				<div class="page-li-btn">
					<div class="d-2-r-12-black">6</div>
				</div>
				<div class="page-li-btn">
					<div class="d-2-r-12-black">7</div>
				</div>
				<div class="page-li-btn">
					<div class="d-2-r-12-black">8</div>
				</div>
				<div class="page-li-btn">
					<div class="d-2-r-12-black">9</div>
				</div>
				<div class="page-after-btn">
					<img class="vuesax-linear-arrow-right"
						src="vuesax-linear-arrow-right0.svg" />
				</div>
			</div>
		</div>
	</div>

</body>
</html>