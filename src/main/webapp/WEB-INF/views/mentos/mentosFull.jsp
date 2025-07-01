<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>me:mento</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mentos/mentosFull.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/resources/js/mentosFull.js"></script>
<body>
<%@ include file="../common/logout_header.jsp"%>
	<div class="container">
		<div class="full-detail-select">
			<div class="detail-select">
				<div class="detail-select-li">
					<div class="detail-select-li-text ">
						<div class="detail-select-li-text">멘토스오픈 순</div>
					</div>
				</div>
				<div class="detail-select-li">
					<div class="detail-select-li-text">
						<div class="detail-select-li-text">내 지역</div>
					</div>
				</div>
				<div class="detail-select-li">
					<div class="detail-select-li-text ">
						<div class="detail-select-li-text">학습유형</div>
					</div>
				</div>
				<div class="detail-select-li">
					<div class="detail-select-li-text ">
						<div class="detail-select-li-text">요일</div>
					</div>
				</div>
				<div class="detail-select-li">
					<div class="detail-select-li-text ">
						<div class="detail-select-li-text">시간</div>
					</div>
				</div>
				<div class="detail-select-li">
					<div class="detail-select-li-text ">
						<div class="detail-select-li-text">카테고리</div>
					</div>
				</div>
				<div class="detail-select-li">
					<div class="detail-select-li-text ">
						<div class="detail-select-li-text">언어</div>
					</div>
				</div>
			</div>
			<button class="mentos-create-button"
				onclick="location.href='${cpath}/mentos/insert'">멘토스 생성하기</button>
		</div>



		<div class="mentos-all-class">
			<img class="advertisement"
				src="${pageContext.request.contextPath}/resources/images/mentosFull/2025memento.png" />
			<div class="mentos-all-class-row">
				<div class="scroll-container">

					<div class="mentos-class-cardview mentos-hover-guide"
						onclick="location.href='${cpath}/mentos/detail'">
						<div class="mentos-class">
							<div class="mentos-text">
								<div class="frame-37862">
									<div class="frame-413">
										<div class="d">D-</div>
										<div class="d">2</div>
									</div>
									<div class="frame-414">
										<div class="d">확정까지</div>
										<div class="d">3</div>
										<div class="d">명</div>
									</div>
								</div>
								<div class="aws">비전공자도 이해할 수 있는 AWS 입문/실전</div>
								<div class="frame-406">

									<div class="frame-407">
										<img class="user-user"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
										<div class="text">김코딩</div>
										<div class="group-371">
											<div class="pre-mento">pre-mento</div>
										</div>
									</div>
									<div class="frame-408">
										<img class="icon-time-calendar"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
										<div class="text">2025/06/23</div>
										<div class="text">-</div>
										<div class="text">2025/06/23</div>
									</div>
									<div class="frame-409">
										<img class="icon-time-clock-outlined"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
										<div class="text">15시-17시(화)</div>
									</div>
									<div class="frame-410">
										<img class="icon-maps-map-pin"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
										<div class="text">역삼</div>
									</div>
									<div class="frame-3659">
										<div class="_45-000">무료</div>
									</div>
								</div>
							</div>
							<img class="image"
								src="${pageContext.request.contextPath}/resources/images/mentosFull/class4.png" />


							<div class="mentos-hover-popup">
								<div class="hover-inner">
									<div class="hover-title">
										비전공자도 이해할 수 있는<br />입문/실전
									</div>
									<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
									<div class="hover-tags">
										<span class="hover-tag">#AWS</span> <span class="hover-tag">#클라우드</span>
									</div>
								</div>
							</div>
						</div>

					</div>


					<div class="mentos-class-cardview mentos-hover-guide"
						onclick="location.href='${cpath}/mentos/detail'">
						<div class="mentos-class">
							<div class="mentos-text">
								<div class="frame-37862">
									<div class="frame-413">
										<div class="d">D-</div>
										<div class="d">2</div>
									</div>
									<div class="frame-414">
										<div class="d">확정까지</div>
										<div class="d">3</div>
										<div class="d">명</div>
									</div>
								</div>
								<div class="aws">비전공자도 이해할 수 있는 AWS 입문/실전</div>
								<div class="frame-406">

									<div class="frame-407">
										<img class="user-user"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
										<div class="text">김코딩</div>
										<div class="group-371">
											<div class="pre-mento">pre-mento</div>
										</div>
									</div>
									<div class="frame-408">
										<img class="icon-time-calendar"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
										<div class="text">2025/06/23</div>
										<div class="text">-</div>
										<div class="text">2025/06/23</div>
									</div>
									<div class="frame-409">
										<img class="icon-time-clock-outlined"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
										<div class="text">15시-17시(화)</div>
									</div>
									<div class="frame-410">
										<img class="icon-maps-map-pin"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
										<div class="text">역삼</div>
									</div>
									<div class="frame-3659">
										<div class="_45-000">무료</div>
									</div>
								</div>
							</div>
							<img class="image"
								src="${pageContext.request.contextPath}/resources/images/mentosFull/class4.png" />


							<div class="mentos-hover-popup">
								<div class="hover-inner">
									<div class="hover-title">
										비전공자도 이해할 수 있는<br />입문/실전
									</div>
									<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
									<div class="hover-tags">
										<span class="hover-tag">#AWS</span> <span class="hover-tag">#클라우드</span>
									</div>
								</div>
							</div>
						</div>

					</div>



					<div class="mentos-class-cardview mentos-hover-guide"
						onclick="location.href='${cpath}/mentos/detail'">
						<div class="mentos-class">
							<div class="mentos-text">
								<div class="frame-37862">
									<div class="frame-413">
										<div class="d">D-</div>
										<div class="d">2</div>
									</div>
									<div class="frame-414">
										<div class="d">확정까지</div>
										<div class="d">3</div>
										<div class="d">명</div>
									</div>
								</div>
								<div class="aws">비전공자도 이해할 수 있는 AWS 입문/실전</div>
								<div class="frame-406">

									<div class="frame-407">
										<img class="user-user"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
										<div class="text">김코딩</div>
										<div class="group-371">
											<div class="pre-mento">pre-mento</div>
										</div>
									</div>
									<div class="frame-408">
										<img class="icon-time-calendar"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
										<div class="text">2025/06/23</div>
										<div class="text">-</div>
										<div class="text">2025/06/23</div>
									</div>
									<div class="frame-409">
										<img class="icon-time-clock-outlined"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
										<div class="text">15시-17시(화)</div>
									</div>
									<div class="frame-410">
										<img class="icon-maps-map-pin"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
										<div class="text">역삼</div>
									</div>
									<div class="frame-3659">
										<div class="_45-000">무료</div>
									</div>
								</div>
							</div>
							<img class="image"
								src="${pageContext.request.contextPath}/resources/images/mentosFull/class4.png" />


							<div class="mentos-hover-popup">
								<div class="hover-inner">
									<div class="hover-title">
										비전공자도 이해할 수 있는<br />입문/실전
									</div>
									<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
									<div class="hover-tags">
										<span class="hover-tag">#AWS</span> <span class="hover-tag">#클라우드</span>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="mentos-class-cardview mentos-hover-guide"
						onclick="location.href='${cpath}/mentos/detail'">
						<div class="mentos-class">
							<div class="mentos-text">
								<div class="frame-37862">
									<div class="frame-413">
										<div class="d">D-</div>
										<div class="d">2</div>
									</div>
									<div class="frame-414">
										<div class="d">확정까지</div>
										<div class="d">3</div>
										<div class="d">명</div>
									</div>
								</div>
								<div class="aws">비전공자도 이해할 수 있는 AWS 입문/실전</div>
								<div class="frame-406">

									<div class="frame-407">
										<img class="user-user"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
										<div class="text">김코딩</div>
										<div class="group-371">
											<div class="pre-mento">pre-mento</div>
										</div>
									</div>
									<div class="frame-408">
										<img class="icon-time-calendar"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
										<div class="text">2025/06/23</div>
										<div class="text">-</div>
										<div class="text">2025/06/23</div>
									</div>
									<div class="frame-409">
										<img class="icon-time-clock-outlined"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
										<div class="text">15시-17시(화)</div>
									</div>
									<div class="frame-410">
										<img class="icon-maps-map-pin"
											src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
										<div class="text">역삼</div>
									</div>
									<div class="frame-3659">
										<div class="_45-000">무료</div>
									</div>
								</div>
							</div>
							<img class="image"
								src="${pageContext.request.contextPath}/resources/images/mentosFull/class4.png" />


							<div class="mentos-hover-popup">
								<div class="hover-inner">
									<div class="hover-title">
										비전공자도 이해할 수 있는<br />입문/실전
									</div>
									<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
									<div class="hover-tags">
										<span class="hover-tag">#AWS</span> <span class="hover-tag">#클라우드</span>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="mentos-all-class-row">
				<div class="mentos-class-cardview mentos-hover-guide"
					onclick="location.href='${cpath}/mentos/detail'">
					<div class="mentos-class">
						<div class="mentos-text">
							<div class="frame-37862">
								<div class="frame-413">
									<div class="d">D-</div>
									<div class="d">2</div>
								</div>
								<div class="frame-414">
									<div class="d">확정까지</div>
									<div class="d">3</div>
									<div class="d">명</div>
								</div>
							</div>
							<div class="aws">비전공자도 이해할 수 있는 AWS 입문/실전</div>
							<div class="frame-406">

								<div class="frame-407">
									<img class="user-user"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
									<div class="text">정진</div>
									<div class="group-371">
										<div class="mento">mento</div>
									</div>
								</div>
								<div class="frame-408">
									<img class="icon-time-calendar"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
									<div class="text">2025/06/23</div>
									<div class="text">-</div>
									<div class="text">2025/06/30</div>
								</div>
								<div class="frame-409">
									<img class="icon-time-clock-outlined"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
									<div class="text">15시-17시(화)</div>
								</div>
								<div class="frame-410">
									<img class="icon-maps-map-pin"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
									<div class="text">홍대</div>
								</div>
								<div class="frame-3659">
									<div class="_45-000">₩45,000</div>
								</div>
							</div>
						</div>
						<img class="image"
							src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />


						<div class="mentos-hover-popup">
							<div class="hover-inner">
								<div class="hover-title">
									비전공자도 이해할 수 있는<br />입문/실전
								</div>
								<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
								<div class="hover-tags">
									<span class="hover-tag">#AWS</span> <span class="hover-tag">#클라우드</span>
								</div>
							</div>
						</div>
					</div>

				</div>



				<div class="mentos-class-cardview mentos-hover-guide"
					onclick="location.href='${cpath}/mentos/detail'">
					<div class="mentos-class">
						<div class="mentos-text">
							<div class="frame-37862">
								<div class="frame-413">
									<div class="d">D-</div>
									<div class="d">2</div>
								</div>
								<div class="frame-414">
									<div class="d">확정까지</div>
									<div class="d">3</div>
									<div class="d">명</div>
								</div>
							</div>
							<div class="aws">비전공자도 이해할 수 있는 AWS 입문/실전</div>
							<div class="frame-406">

								<div class="frame-407">
									<img class="user-user"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
									<div class="text">정진</div>
									<div class="group-371">
										<div class="mento">mento</div>
									</div>
								</div>
								<div class="frame-408">
									<img class="icon-time-calendar"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
									<div class="text">2025/06/23</div>
									<div class="text">-</div>
									<div class="text">2025/06/30</div>
								</div>
								<div class="frame-409">
									<img class="icon-time-clock-outlined"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
									<div class="text">15시-17시(화)</div>
								</div>
								<div class="frame-410">
									<img class="icon-maps-map-pin"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
									<div class="text">홍대</div>
								</div>
								<div class="frame-3659">
									<div class="_45-000">₩45,000</div>
								</div>
							</div>
						</div>
						<img class="image"
							src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />


						<div class="mentos-hover-popup">
							<div class="hover-inner">
								<div class="hover-title">
									비전공자도 이해할 수 있는<br />입문/실전
								</div>
								<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
								<div class="hover-tags">
									<span class="hover-tag">#AWS</span> <span class="hover-tag">#클라우드</span>
								</div>
							</div>
						</div>
					</div>

				</div>

				<div class="mentos-class-cardview mentos-hover-guide"
					onclick="location.href='${cpath}/mentos/detail'">
					<div class="mentos-class">
						<div class="mentos-text">
							<div class="frame-37862">
								<div class="frame-413">
									<div class="d">D-</div>
									<div class="d">2</div>
								</div>
								<div class="frame-414">
									<div class="d">확정까지</div>
									<div class="d">3</div>
									<div class="d">명</div>
								</div>
							</div>
							<div class="aws">비전공자도 이해할 수 있는 AWS 입문/실전</div>
							<div class="frame-406">

								<div class="frame-407">
									<img class="user-user"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
									<div class="text">정진</div>
									<div class="group-371">
										<div class="mento">mento</div>
									</div>
								</div>
								<div class="frame-408">
									<img class="icon-time-calendar"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
									<div class="text">2025/06/23</div>
									<div class="text">-</div>
									<div class="text">2025/06/30</div>
								</div>
								<div class="frame-409">
									<img class="icon-time-clock-outlined"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
									<div class="text">15시-17시(화)</div>
								</div>
								<div class="frame-410">
									<img class="icon-maps-map-pin"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
									<div class="text">홍대</div>
								</div>
								<div class="frame-3659">
									<div class="_45-000">₩45,000</div>
								</div>
							</div>
						</div>
						<img class="image"
							src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />


						<div class="mentos-hover-popup">
							<div class="hover-inner">
								<div class="hover-title">
									비전공자도 이해할 수 있는<br />입문/실전
								</div>
								<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
								<div class="hover-tags">
									<span class="hover-tag">#AWS</span> <span class="hover-tag">#클라우드</span>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>


			<div class="mentos-all-class-row">
				<div class="mentos-class-cardview mentos-hover-guide"
					onclick="location.href='${cpath}/mentos/detail'">
					<div class="mentos-class">
						<div class="mentos-text">
							<div class="frame-37862">
								<div class="frame-413">
									<div class="d">D-</div>
									<div class="d">2</div>
								</div>
								<div class="frame-414">
									<div class="d">확정까지</div>
									<div class="d">3</div>
									<div class="d">명</div>
								</div>
							</div>
							<div class="aws">비전공자도 이해할 수 있는 AWS 입문/실전</div>
							<div class="frame-406">

								<div class="frame-407">
									<img class="user-user"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
									<div class="text">정진</div>
									<div class="group-371">
										<div class="mento">mento</div>
									</div>
								</div>
								<div class="frame-408">
									<img class="icon-time-calendar"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
									<div class="text">2025/06/23</div>
									<div class="text">-</div>
									<div class="text">2025/06/30</div>
								</div>
								<div class="frame-409">
									<img class="icon-time-clock-outlined"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
									<div class="text">15시-17시(화)</div>
								</div>
								<div class="frame-410">
									<img class="icon-maps-map-pin"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
									<div class="text">홍대</div>
								</div>
								<div class="frame-3659">
									<div class="_45-000">₩45,000</div>
								</div>
							</div>
						</div>
						<img class="image"
							src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />


						<div class="mentos-hover-popup">
							<div class="hover-inner">
								<div class="hover-title">
									비전공자도 이해할 수 있는<br />입문/실전
								</div>
								<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
								<div class="hover-tags">
									<span class="hover-tag">#AWS</span> <span class="hover-tag">#클라우드</span>
								</div>
							</div>
						</div>
					</div>

				</div>



				<div class="mentos-class-cardview mentos-hover-guide"
					onclick="location.href='${cpath}/mentos/detail'">
					<div class="mentos-class">
						<div class="mentos-text">
							<div class="frame-37862">
								<div class="frame-413">
									<div class="d">D-</div>
									<div class="d">2</div>
								</div>
								<div class="frame-414">
									<div class="d">확정까지</div>
									<div class="d">3</div>
									<div class="d">명</div>
								</div>
							</div>
							<div class="aws">비전공자도 이해할 수 있는 AWS 입문/실전</div>
							<div class="frame-406">

								<div class="frame-407">
									<img class="user-user"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
									<div class="text">정진</div>
									<div class="group-371">
										<div class="mento">mento</div>
									</div>
								</div>
								<div class="frame-408">
									<img class="icon-time-calendar"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
									<div class="text">2025/06/23</div>
									<div class="text">-</div>
									<div class="text">2025/06/30</div>
								</div>
								<div class="frame-409">
									<img class="icon-time-clock-outlined"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
									<div class="text">15시-17시(화)</div>
								</div>
								<div class="frame-410">
									<img class="icon-maps-map-pin"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
									<div class="text">홍대</div>
								</div>
								<div class="frame-3659">
									<div class="_45-000">₩45,000</div>
								</div>
							</div>
						</div>
						<img class="image"
							src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />


						<div class="mentos-hover-popup">
							<div class="hover-inner">
								<div class="hover-title">
									비전공자도 이해할 수 있는<br />입문/실전
								</div>
								<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
								<div class="hover-tags">
									<span class="hover-tag">#AWS</span> <span class="hover-tag">#클라우드</span>
								</div>
							</div>
						</div>
					</div>

				</div>

				<div class="mentos-class-cardview mentos-hover-guide"
					onclick="location.href='${cpath}/mentos/detail'">
					<div class="mentos-class">
						<div class="mentos-text">
							<div class="frame-37862">
								<div class="frame-413">
									<div class="d">D-</div>
									<div class="d">2</div>
								</div>
								<div class="frame-414">
									<div class="d">확정까지</div>
									<div class="d">3</div>
									<div class="d">명</div>
								</div>
							</div>
							<div class="aws">비전공자도 이해할 수 있는 AWS 입문/실전</div>
							<div class="frame-406">

								<div class="frame-407">
									<img class="user-user"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
									<div class="text">정진</div>
									<div class="group-371">
										<div class="mento">mento</div>
									</div>
								</div>
								<div class="frame-408">
									<img class="icon-time-calendar"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
									<div class="text">2025/06/23</div>
									<div class="text">-</div>
									<div class="text">2025/06/30</div>
								</div>
								<div class="frame-409">
									<img class="icon-time-clock-outlined"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
									<div class="text">15시-17시(화)</div>
								</div>
								<div class="frame-410">
									<img class="icon-maps-map-pin"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
									<div class="text">홍대</div>
								</div>
								<div class="frame-3659">
									<div class="_45-000">₩45,000</div>
								</div>
							</div>
						</div>
						<img class="image"
							src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />


						<div class="mentos-hover-popup">
							<div class="hover-inner">
								<div class="hover-title">
									비전공자도 이해할 수 있는<br />입문/실전
								</div>
								<div class="hover-desc">초보자도 쉽게 따라올 수 있게, 실무 중심으로 강의해요!</div>
								<div class="hover-tags">
									<span class="hover-tag">#AWS</span> <span class="hover-tag">#클라우드</span>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>