<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 프로필(진행한 멘토스)</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mentos/mentosMentoDetailClassListStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mentos/mentosMentoDetailClassListVars.css" />
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/resources/js/mentosMentoDetailClassList.js"></script>

<body>
	<div class="container">
		<div class="frame-3644">
			<div class="frame-331">
				<div class="group-322">
					<div class="mentor-profile">
						<img class="mentor-image"
							src="${pageContext.request.contextPath}/resources/images/mentosDetail/profile.png" />
					</div>
				</div>
				<div class="frame-3678">
					<div class="div2">정진</div>
					<div class="azalea">@azalea</div>
					<div class="frame-371">
						<div class="mento">mento</div>
					</div>
				</div>
				<div class="group-327">
					<div class="rectangle-282"></div>
					<div class="_30-000">
						<span> <span class="_30-000-span"> 수강생수 <br />
						</span> <span class="_30-000-span2">30,000</span> <span
							class="_30-000-span3"></span>
						</span>
					</div>
					<div class="_300">
						<span> <span class="_300-span"> 수강평수 <br />
						</span> <span class="_300-span2">300</span> <span class="_300-span3"></span>
						</span>
					</div>
					<div class="_5-0">
						<span> <span class="_5-0-span"> 강의평점 <br />
						</span> <span class="_5-0-span2">5.0</span>
						</span>
					</div>
				</div>
				<div class="div3">
					<ul class="div-3-span">
					<li class="mentos-list-link"
							onclick="location.href='${cpath}/memento/mentos/mentodetail'">
							홈</li>
						<li class="mentos-list-link"
							onclick="location.href='${cpath}/memento/mentos/mentodetailclasslist'">
							진행한 멘토스 내역</li>
						<li class="mentos-list-link"
							onclick="location.href='${cpath}/memento/mentos/mentodetailreview'">
							리뷰</li>
					</ul>
				</div>
			</div>
			<div class="frame-3774">
				<div class="frame-3773">
					<div class="div7">진행한 멘토스 내역</div>
					<div class="line-50"></div>
				</div>
				<div class="frame-36442">
					<div class="frame-3643">
						<div class="frame-3640">
							<div class="frame-337">
								<div class="frame-3680">
									<div class="frame-341">
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
									</div>

									<div class="frame-338">
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
									</div>
									<div class="frame-339">
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
									</div>
									<div class="frame-340">
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
										<div class="mentos-class-cardview mentos-hover-guide"
											onclick="location.href='${cpath}/memento/mentos/detail'">
											<div class="mentos-class-cardview-before">
												<div class="mentos-class-image-frame">
													<img class="mentos-class-image"
														src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
												</div>
												<div class="class-title">파이썬으로 나만의 블로그 자동화 프로그램 만들기</div>
												<div class="class-detail-text-full">
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/mento.svg" />
														<div class="class-detail-text">김코딩</div>
														<div class="pre-mento-frame">
															<div class="pre-mento">pre-mento</div>
														</div>
													</div>
													<div class="class-detail-icon-text">
														<div class="icon">
															<img class="icon-time-calendar"
																src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
														</div>
														<div class="class-detail-text">2025/06/02</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">2025/06/02</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />
														<div class="class-detail-text">13시</div>
														<div class="class-detail-text">-</div>
														<div class="class-detail-text">15시</div>
														<div class="class-detail-text">(화)</div>
													</div>
													<div class="class-detail-icon-text">
														<img class="icon"
															src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
														<div class="class-detail-text">여의도</div>
													</div>
													<div class="class-detail-text-fee">무료</div>
												</div>
											</div>
										</div>
									</div>
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