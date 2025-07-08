<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토스 상세페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mentos/mentosDetailStyle.css" />
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/resources/js/mentos/mentosDetail.js"></script>

<body 
    data-mentos-id="${mentosId}" 
    data-member-id="${sessionScope.loginUser.memberId}"
    data-cpath="${pageContext.request.contextPath}">
	<div class="container">
		<div class="class-header-bg"></div>
		<div class="full">
			<div class="class-wrapper-frame">
				<div class="class-main-frame">
					<div class="class-main-info">
						<div class="class-title-wrap">
							<div class="class-title">비전공자도 이해할 수 있는 AWS 입문/실전</div>
						</div>
						<div class="class-description">비전공자 입장에서도 쉽게 이해할 수 있고, 실전에서
							바로 적용 가능한 AWS 입문 강의를 만들어봤습니다!</div>
					</div>
					<div class="class-detail-info">
						<div class="class-detail-list">
							<div class="detail-row">
								<div class="detail-label">모집 인원</div>
								<div class="detail-value">1/5</div>
							</div>
							<div class="detail-row">
								<div class="detail-label">모집 시간</div>
								<div class="detail-value">06/23-06/30 15:00-17:00</div>
							</div>
							<div class="detail-row">
								<div class="detail-label">참여 요일</div>
								<div class="detail-value">화</div>
							</div>
							<div class="detail-row">
								<div class="detail-label">횟수</div>
								<div class="detail-value">2회</div>
							</div>
							<div class="detail-row">
								<div class="detail-label">장소</div>
								<div class="detail-value">투썸플레이스 홍대입구역점</div>
							</div>
						</div>
						<div class="class-action-area">
							<div class="divider-line"></div>
							<div class="price-and-button">
								<div class="class-price">₩70,000</div>

								<!-- 1. 체크박스 -->
								<input type="checkbox" id="popupTrigger" style="display: none;" />

								<!-- 2. 신청 버튼 (label) -->
								<label for="popupTrigger" class="class-apply-btn-wrap">
									<div class="class-apply-btn">신청하기</div>
								</label>

								<!-- 3. 팝업 바로 붙여줌 (중간에 다른 태그 없음) -->
								<div id="layer_bg">
									<div class="rectangle-294">
										<div class="frame-3783">
											<div class="emoji" style="font-size: 48px;">👍</div>
											<div class="popup-title">멘토스가 성공적으로 신청되었어요!</div>
											<div class="popup-desc">멘토 확인 후 수강인원이 채워지면 수강확정알림을
												보내드립니다</div>
											<div class="confirm-btn-box">
												<label for="popupTrigger" class="confirm-btn">확인</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="class-detail-content">
					<!-- 태그/주제 영역 -->
					<div class="class-meta-section">
						<div class="frame-429">
							<div class="hover-tag">#백엔드</div>
							<div class="hover-tag">#AWS</div>
						</div>
						<!-- 강의 소개/개요 -->
						<div class="class-summary-section">
							<div class="class-summary-text">
								<span> <span class="summary-main"> 입문자를 위해 준비한<br />
										[데브옵스 · 인프라, 백엔드] 강의입니다.
								</span>
								</span>
							</div>
							<!-- 커리큘럼 소개 -->
							<div class="class-curriculum">
								<div class="class-list-title">🔥이런 걸 배울 수 있어요</div>
								<ul class="class-list">
									<li>EC2를 활용한 백엔드 API 서버 배포</li>
									<li>Route53을 활용한 도메인 연결</li>
									<li>ELB를 활용한 HTTPS 적용</li>
									<li>RDS를 활용한 데이터베이스 연결</li>
									<li>S3를 활용한 파일 및 이미지 업로드</li>
									<li>S3, CloudFront를 활용한 웹 페이지 배포</li>
								</ul>
							</div>
							<div class="class-curriculum">
								<div class="class-list-title">✨ 강의를 만들면서 신경 쓴 4가지 Point</div>
								<ul class="class-list">
									<li>비전공자도 이해할 수 있도록 AWS를 쉽게 설명하려고 했다.</li>
									<li>실무에 바로 쓸 수 있는 실전 위주 강의를 만들려고 했다.</li>
									<li>현업에서 자주 사용하는 AWS 서비스만 선별해서 목차를 구성했다.</li>
									<li>AWS의 전체 구조와 아키텍처 이해도를 포함하여 설명한다.</li>
								</ul>
							</div>
						</div>
						<!-- 함께하고 싶은 유형 -->
						<div class="class-partner-section">
							<div class="class-point-title">✋이런 분들과 함께하고 싶어요</div>
							<div class="partner-list">
								<div class="partner-card">
									<div class="partner-circle">
										<div class="partner-name">
											🔥<br />코드폭탄<br />해피빈
										</div>
									</div>
								</div>
								<div class="partner-card">
									<div class="partner-circle">
										<div class="partner-name">
											🔥<br />코드폭탄<br />해피빈
										</div>
									</div>
								</div>
								<div class="partner-card">
									<div class="partner-circle">
										<div class="partner-name">
											🔥<br />코드폭탄<br />해피빈
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 우측 정보 및 관리 영역 -->
					<div class="class-side-section">
						<div class="class-action-bar">
							<div class="action-frame">
								<button class="like-heart-btn" type="button"></button>
							</div>
							<div class="action-frame">
								<button class="action-label"
									onclick="location.href='${cpath}/memento/mentos/edit'">수정
									하기</button>
							</div>
							<div class="action-frame">
								<!-- 1. 체크박스: 팝업 트리거 -->
								<!-- <input type="checkbox" id="cancelPopup" style="display: none;" /> -->

								<!-- 2. 삭제 버튼 (label) -->
								<div class="action-frame">
								<button class="action-label">삭제하기</button>
							</div>
								<!-- <label for="cancelPopup" class="mentos-leader-cancel-btn">
									<div class="action-label">삭제하기</div>
								</label> -->

								<!-- 3. 팝업 -->
								<!-- <div class="popup-layer" id="cancelLayer">
									<div class="popup-content">
										<div class="emoji">❌</div>
										<div class="popup-title">삭제되었습니다</div>
										<div class="confirm-btn-box">
											<label for="cancelPopup" class="confirm-btn">확인</label>
										</div>
									</div>
								</div> -->
							</div>
						</div>
						<div class="class-location-info">
							<div class="mentos-class-image-frame">
								<img class="mentos-class-image"
									src="${pageContext.request.contextPath}/resources/images/mentosFull/class5.png" />
							</div>
							<div class="location-detail">
								<div class="location-row">
									<img class="icon"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />
									<div class="location-address">서울 마포구 월드컵북로2길 57 1층</div>
								</div>
								<div class="class-mentor-section">
									<div id="mentosMap" class="location-label">장소</div>
								</div>
							</div>
							<!--누르면 멘토 상세페이지로 이동 -->
							<div class="class-mentor-section" style="cursor: pointer;">

								<div class="mentor-profile">
									<img class="mentor-image"
										src="${pageContext.request.contextPath}/resources/images/mentosDetail/profile.png" />
								</div>
								<div class="mentor-info-box">
									<div class="mentor-info-main">
										<div class="mentor-name">정진</div>
										<div class="mentor-role">
											<div class="mentor-role-label">mento</div>
										</div>
									</div>
									<div class="mentor-type">🧩 계획왕 컴정이</div>
									<div class="mentor-rating-section">
										<div class="mentor-rating-label">
											<span>별점</span>
										</div>
										<div class="vote">
											<!-- 별 아이콘들 여기! -->
											<span>★</span><span>★</span><span>★</span><span>★</span><span>☆</span>
										</div>
									</div>
								</div>
							</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="divider-line"></div>
				<div class="div15">비슷한 다른 멘토스 둘러보기</div>
			<div class="frame-407">
				<div class="mentos-all-class-row">
				<div class="scroll-container">

					<div class="mentos-class-cardview mentos-hover-guide"
						onclick="location.href='${cpath}/mentos/detail'">
						<div class="frame-3786">
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

											<div class="div3">정진</div>
											<div class="group-371">
												<div class="rectangle-279"></div>
												<div class="mento">mento</div>
											</div>
										</div>
										<div class="frame-408">
											<div class="icon-time-02">
												<img class="icon-time-calendar"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
											</div>
											<div class="_2025">
												<span> <span class="_2025-span">2025</span> <span
													class="_2025-span2"></span>
												</span>
											</div>
											<div class="div3">/</div>
											<div class="_06">06</div>
											<div class="div3">/</div>
											<div class="_23">23</div>
											<div class="div3">-</div>
											<div class="_20252">2025</div>
											<div class="div3">/</div>
											<div class="_06">06</div>
											<div class="div3">/</div>
											<div class="_30">30</div>
										</div>
										<div class="frame-409">
											<div class="icon-time-04">
												<img class="icon-time-clock-outlined"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />


											</div>
											<div class="_15">15</div>
											<div class="div3">시</div>
											<div class="div4">
												<span> <span class="div-4-span">-</span> <span
													class="div-4-span2"></span>
												</span>
											</div>
											<div class="_17">
												<span> <span class="_17-span">17</span> <span
													class="_17-span2"></span>
												</span>
											</div>
											<div class="div3">시</div>
											<div class="div3">(</div>
											<div class="div4">
												<span> <span class="div-4-span">화</span> <span
													class="div-4-span2"></span>
												</span>
											</div>
											<div class="div3">)</div>
										</div>
										<div class="frame-410">
											<div class="icon-maps-04">
												<img class="icon-maps-map-pin"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />

											</div>
											<div class="div3">홍대</div>
										</div>
										<div class="frame-3659">
											<div class="_45-000">₩45,000</div>
										</div>
									</div>
								</div>
								<div class="frame-3778">
									<img class="image"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
								</div>
								<div class="mentos-hover-popup">
									<div class="hover-inner">
										<div class="hover-title">
											비전공자도 이해할 수 있는<br />AWS 입문/실전
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


					<div class="mentos-class-cardview mentos-hover-guide"
						onclick="location.href='${cpath}/mentos/detail'">
						<div class="frame-3786">
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

											<div class="div3">정진</div>
											<div class="group-371">
												<div class="rectangle-279"></div>
												<div class="mento">mento</div>
											</div>
										</div>
										<div class="frame-408">
											<div class="icon-time-02">
												<img class="icon-time-calendar"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
											</div>
											<div class="_2025">
												<span> <span class="_2025-span">2025</span> <span
													class="_2025-span2"></span>
												</span>
											</div>
											<div class="div3">/</div>
											<div class="_06">06</div>
											<div class="div3">/</div>
											<div class="_23">23</div>
											<div class="div3">-</div>
											<div class="_20252">2025</div>
											<div class="div3">/</div>
											<div class="_06">06</div>
											<div class="div3">/</div>
											<div class="_30">30</div>
										</div>
										<div class="frame-409">
											<div class="icon-time-04">
												<img class="icon-time-clock-outlined"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />


											</div>
											<div class="_15">15</div>
											<div class="div3">시</div>
											<div class="div4">
												<span> <span class="div-4-span">-</span> <span
													class="div-4-span2"></span>
												</span>
											</div>
											<div class="_17">
												<span> <span class="_17-span">17</span> <span
													class="_17-span2"></span>
												</span>
											</div>
											<div class="div3">시</div>
											<div class="div3">(</div>
											<div class="div4">
												<span> <span class="div-4-span">화</span> <span
													class="div-4-span2"></span>
												</span>
											</div>
											<div class="div3">)</div>
										</div>
										<div class="frame-410">
											<div class="icon-maps-04">
												<img class="icon-maps-map-pin"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />

											</div>
											<div class="div3">홍대</div>
										</div>
										<div class="frame-3659">
											<div class="_45-000">₩45,000</div>
										</div>
									</div>
								</div>
								<div class="frame-3778">
									<img class="image"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
								</div>
								<div class="mentos-hover-popup">
									<div class="hover-inner">
										<div class="hover-title">
											비전공자도 이해할 수 있는<br />AWS 입문/실전
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




					<div class="mentos-class-cardview mentos-hover-guide"
						onclick="location.href='${cpath}/mentos/detail'">
						<div class="frame-3786">
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

											<div class="div3">정진</div>
											<div class="group-371">
												<div class="rectangle-279"></div>
												<div class="mento">mento</div>
											</div>
										</div>
										<div class="frame-408">
											<div class="icon-time-02">
												<img class="icon-time-calendar"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
											</div>
											<div class="_2025">
												<span> <span class="_2025-span">2025</span> <span
													class="_2025-span2"></span>
												</span>
											</div>
											<div class="div3">/</div>
											<div class="_06">06</div>
											<div class="div3">/</div>
											<div class="_23">23</div>
											<div class="div3">-</div>
											<div class="_20252">2025</div>
											<div class="div3">/</div>
											<div class="_06">06</div>
											<div class="div3">/</div>
											<div class="_30">30</div>
										</div>
										<div class="frame-409">
											<div class="icon-time-04">
												<img class="icon-time-clock-outlined"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />


											</div>
											<div class="_15">15</div>
											<div class="div3">시</div>
											<div class="div4">
												<span> <span class="div-4-span">-</span> <span
													class="div-4-span2"></span>
												</span>
											</div>
											<div class="_17">
												<span> <span class="_17-span">17</span> <span
													class="_17-span2"></span>
												</span>
											</div>
											<div class="div3">시</div>
											<div class="div3">(</div>
											<div class="div4">
												<span> <span class="div-4-span">화</span> <span
													class="div-4-span2"></span>
												</span>
											</div>
											<div class="div3">)</div>
										</div>
										<div class="frame-410">
											<div class="icon-maps-04">
												<img class="icon-maps-map-pin"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />

											</div>
											<div class="div3">홍대</div>
										</div>
										<div class="frame-3659">
											<div class="_45-000">₩45,000</div>
										</div>
									</div>
								</div>
								<div class="frame-3778">
									<img class="image"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
								</div>
								<div class="mentos-hover-popup">
									<div class="hover-inner">
										<div class="hover-title">
											비전공자도 이해할 수 있는<br />AWS 입문/실전
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
					<div class="mentos-class-cardview mentos-hover-guide"
						onclick="location.href='${cpath}/mentos/detail'">
						<div class="frame-3786">
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

											<div class="div3">정진</div>
											<div class="group-371">
												<div class="rectangle-279"></div>
												<div class="mento">mento</div>
											</div>
										</div>
										<div class="frame-408">
											<div class="icon-time-02">
												<img class="icon-time-calendar"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/day.svg" />
											</div>
											<div class="_2025">
												<span> <span class="_2025-span">2025</span> <span
													class="_2025-span2"></span>
												</span>
											</div>
											<div class="div3">/</div>
											<div class="_06">06</div>
											<div class="div3">/</div>
											<div class="_23">23</div>
											<div class="div3">-</div>
											<div class="_20252">2025</div>
											<div class="div3">/</div>
											<div class="_06">06</div>
											<div class="div3">/</div>
											<div class="_30">30</div>
										</div>
										<div class="frame-409">
											<div class="icon-time-04">
												<img class="icon-time-clock-outlined"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/time.svg" />


											</div>
											<div class="_15">15</div>
											<div class="div3">시</div>
											<div class="div4">
												<span> <span class="div-4-span">-</span> <span
													class="div-4-span2"></span>
												</span>
											</div>
											<div class="_17">
												<span> <span class="_17-span">17</span> <span
													class="_17-span2"></span>
												</span>
											</div>
											<div class="div3">시</div>
											<div class="div3">(</div>
											<div class="div4">
												<span> <span class="div-4-span">화</span> <span
													class="div-4-span2"></span>
												</span>
											</div>
											<div class="div3">)</div>
										</div>
										<div class="frame-410">
											<div class="icon-maps-04">
												<img class="icon-maps-map-pin"
													src="${pageContext.request.contextPath}/resources/images/mentosFull/maps.svg" />

											</div>
											<div class="div3">홍대</div>
										</div>
										<div class="frame-3659">
											<div class="_45-000">₩45,000</div>
										</div>
									</div>
								</div>
								<div class="frame-3778">
									<img class="image"
										src="${pageContext.request.contextPath}/resources/images/mentosFull/class1.png" />
								</div>
								<div class="mentos-hover-popup">
									<div class="hover-inner">
										<div class="hover-title">
											비전공자도 이해할 수 있는<br />AWS 입문/실전
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
			</div>
		</div>
	</div>


</body>
</html>