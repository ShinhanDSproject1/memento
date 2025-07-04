<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토스 수정하기</title>

<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/css/mentos/mentosInsertStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mentos/mentosInsertVars.css" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="${cpath}/resources/css/mentos/mentosInsert.js"></script>
<body>
	<div class="container">
		<div class="mentos-make-page">
			<div class="mentos-write-body">
				<div class="mentos-page-text">멘토스 수정하기</div>
				<div class="mentos-page-form">
					<div class="mentos-make-top-section">
						<div class="mentos-make-input">
							<div class="mentos-make-name">
								<div class="title">제목</div>
								<div id="mentosTitle" class="editable-title"
									contenteditable="true"
									data-placeholder="영어, 한글, 숫자 사용가능(30자 이내)"></div>
								<!-- 전송용 hidden input -->
								<input type="hidden" id="mentosTitleHidden" name="mentosTitle"
									value="">

							</div>

							<div class="mentos-make-name">
								<div class="title">간단 소개글</div>
								<div id="mentosSubTitle" class="editable-title"
									contenteditable="true"
									data-placeholder="영어, 한글, 숫자 사용가능(50자 이내)"></div>
								<!-- 전송용 hidden input -->
								<input type="hidden" id="mentosSubTitleHidden"
									name="mentosSubTitle" value="">
							</div>
							<div class="mentos-make-location">
								<div class="mentos-make-city">
									<div class="title">최소 수강인원</div>
									<div class="min-member-box">
										<input type="number" id="minMember" name="minMember" min="1"
											class="number-input" />
									</div>
								</div>
								<div class="mentos-make-region">
									<div class="title">최대 수강 인원</div>
									<div class="max-member-box">
										<input type="number" id="maxMember" name="maxMember" min="1"
											class="number-input" />
									</div>
								</div>
							</div>
							<div class="mentos-make-location">
								<div class="mentos-make-city">
									<div class="title">시작일</div>
									<div class="start-date-box">
										<input type="date" id="startDateInput" name="startDate"
											class="date-input" />
									</div>
								</div>
								<div class="mentos-make-region">
									<div class="title">마감일</div>
									<div class="end-date-box">
										<input type="date" id="endDateInput" name="endDate"
											class="date-input" />
									</div>
								</div>
							</div>
							<div class="mentos-make-location">
								<div class="mentos-make-city">
									<div class="title">시작시간</div>
									<div class="start-time-box">
										<input type="time" id="startTimeInput" name="startTime"
											class="time-input" required />
									</div>
								</div>
								<div class="mentos-make-region">
									<div class="title">마감 시간</div>
									<div class="end-time-box">
										<input type="time" id="endTimeInput" name="endTime"
											class="time-input" required />
									</div>
								</div>
							</div>
						</div>

						<div class="logo-upload">
							<div class="mentos-logo-drag-upload">
								<div class="title">멘토스 사진</div>
								<div class="mentos-logo-drag-section">
									<div class="drag-logo-info">
										<div class="iconly-light-outline-paper-upload">
											<div class="iconly-light-outline-paper-upload2">
												<img class="paper-upload"
													src="${cpath }/resources/images/icon_thumb.svg" />
											</div>
										</div>
										<div class="d-2-r-14-black">Drag files to upload</div>
									</div>
								</div>
							</div>
							<div class="mentos-logo-file-upload">
								<div class="logo-file-select-btn">
									<div class="file-select">파일 선택</div>
								</div>
								<div class="logo-file-value">선택된 파일 없음.</div>
							</div>
						</div>

					</div>
					<div class="frame-3491">
						<div class="frame-3497">
							<div class="title">활동 요일</div>
						</div>
						<div class="div5">
							<div class="frame-3477">
								<div class="div6">월요일</div>
							</div>
							<div class="frame-3477">
								<div class="div6">화요일</div>
							</div>
							<div class="frame-3477">
								<div class="div6">수요일</div>
							</div>
							<div class="frame-3477">
								<div class="div6">목요일</div>
							</div>
							<div class="frame-3477">
								<div class="div6">금요일</div>
							</div>
							<div class="frame-3477">
								<div class="div6">토요일</div>
							</div>
							<div class="frame-3477">
								<div class="div6">일요일</div>
							</div>
						</div>
					</div>
					<div class="frame-3504">
						<div class="title">도로명 주소</div>
						<div class="address-area">
							<div class="postal-code-area">
								<input type="text" id="postcode" class="postal-code"
									placeholder="우편번호" readonly />
								<button type="button" class="postal-code-btn"
									onclick="execDaumPostcode()">우편번호 찾기</button>
							</div>

							<input type="text" id="roadAddress" class="road-name-address"
								placeholder="도로명 주소" readonly /> <input type="text"
								id="jibunAddress" class="street-number-address"
								placeholder="지번 주소" readonly /> <input type="text"
								id="detailAddress" name="detailAddress" class="detail-address"
								placeholder="상세 주소를 입력하세요" />
						</div>
					</div>

					<div class="frame-3505">
						<div class="title">소개글</div>
						<div class="input">
							<div class="detail">300자 이상 입력해주세요!</div>
						</div>
					</div>

					<div class="together-type-section">
						<div class="label">함께 하고 싶은 유형</div>

						<div class="dropdown-row">
							<div class="dropdown-box">
								<div class="dropdown-label">선택 필수</div>
								<img class="dropdown-icon"
									src="${cpath}/resources/images/icon-down.svg" alt="화살표" />
								<ul class="type-dropdown hidden">
									<li data-value="active">활발한 개발자</li>
									<li data-value="quite">조용한 몰입형 개발자</li>
									<li data-value="creative">창의적 실험가 개발자</li>
									<li data-value="constructor">구조화 좋아하는 개발자</li>
									<li data-value="cozy">느긋한 꾸준형 개발자</li>
									<li data-value="goal">목표지향 개발자</li>
								</ul>
							</div>
							<div class="dropdown-box">
								<div class="dropdown-label">선택 필수</div>
								<img class="dropdown-icon"
									src="${cpath}/resources/images/icon-down.svg" alt="화살표" />
								<ul class="type-dropdown hidden">
									<li data-value="active">활발한 개발자</li>
									<li data-value="quite">조용한 몰입형 개발자</li>
									<li data-value="creative">창의적 실험가 개발자</li>
									<li data-value="constructor">구조화 좋아하는 개발자</li>
									<li data-value="cozy">느긋한 꾸준형 개발자</li>
									<li data-value="goal">목표지향 개발자</li>
								</ul>
							</div>
							<div class="dropdown-box">
								<div class="dropdown-label">선택 필수</div>
								<img class="dropdown-icon"
									src="${cpath}/resources/images/icon-down.svg" alt="화살표" />
								<ul class="type-dropdown hidden">
									<li data-value="active">활발한 개발자</li>
									<li data-value="quite">조용한 몰입형 개발자</li>
									<li data-value="creative">창의적 실험가 개발자</li>
									<li data-value="constructor">구조화 좋아하는 개발자</li>
									<li data-value="cozy">느긋한 꾸준형 개발자</li>
									<li data-value="goal">목표지향 개발자</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="mentos-make-buttons">
						<!-- 1. 팝업 트리거 체크박스 각각 분리 --> 
						<input type="checkbox" id="cancelPopup"
							style="display: none;" /> <input type="checkbox"
							id="submitPopup" style="display: none;" />

						<!-- 2. 버튼 각각 연결 -->
						<div class="mentos-make-buttons">
							<label for="cancelPopup" class="mentos-leader-cancel-btn">
								<div class="d-2-r-18-blue">삭제하기</div>
							</label> <label for="submitPopup" class="mentos-leader-make-btn">
								<div class="d-2-r-18-white">수정하기</div>
							</label>
						</div>

						<!-- 3. 취소 팝업 -->
						<div class="popup-layer" id="cancelLayer">
							<div class="rectangle-294">
								<div class="frame-3783">
									<div class="emoji">❌</div>
									<div class="popup-title">정말로 삭제하시겠습니까?</div>
									<div class="popup-desc">지금까지 작성하신 내용이 전부 삭제됩니다.</div>
									<div class="confirm-btn-box">
										<label for="cancelPopup" class="confirm-btn">확인</label>
									</div>
								</div>
							</div>
						</div>

						<!-- 4. 만들기 팝업 -->
						<div class="popup-layer" id="submitLayer">
							<div class="rectangle-294">
								<div class="frame-3783">
									<div class="emoji">👍</div>
									<div class="popup-title">수정이 완료되었습니다</div>
									<div class="confirm-btn-box">
										<label for="submitPopup" class="confirm-btn">확인</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//다음 주소 API 실행 함수
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById('roadAddress').value = data.roadAddress;
							document.getElementById('jibunAddress').value = data.jibunAddress;
							document.getElementById('detailAddress').focus();
						}
					}).open();
		}
		document.querySelectorAll('.dropdown-box').forEach(box => {
			  const dropdown = box.querySelector('.type-dropdown');
			  const label = box.querySelector('.dropdown-label');

			  box.addEventListener('click', (e) => {
			    e.stopPropagation();

			    // 드롭다운 토글
			    document.querySelectorAll('.type-dropdown').forEach(menu => {
			      if (menu !== dropdown) menu.classList.add('hidden');
			    });
			    dropdown.classList.toggle('hidden');
			  });

			  dropdown.querySelectorAll('li').forEach(item => {
			    item.addEventListener('click', (e) => {
			      e.stopPropagation();
			      label.textContent = item.textContent;
			      dropdown.classList.add('hidden');
			    });
			  });
			});

			// 바깥 클릭 시 모든 드롭다운 닫기
			document.addEventListener('click', () => {
			  document.querySelectorAll('.type-dropdown').forEach(menu => {
			    menu.classList.add('hidden');
			  });
			});

	</script>
</body>
</html>