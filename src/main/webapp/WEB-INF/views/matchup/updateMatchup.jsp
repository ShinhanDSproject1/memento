<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>me:mento</title>
<link rel="stylesheet" href="${cpath}/resources/css/createMatchup.css">
<link rel="stylesheet" href="${cpath}/resources/css/vars.css">
<script
    src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/matchup/updateConfirmModal.jsp" />

    <div class="create-matchup-container">
        <div class="top-area">
            <div class="div">어떤 항목을 수정할까요?</div>
            <input type="hidden" id="matchupId" value="${matchupDetail.matchupId}">
        </div>

        <div class="title-area">
            <div class="form-label-wrapper">
                <div class="form-label">매치업명</div>
            </div>
            <div class="input-container">
                <div id="matchupTitle" class="editable-title" contenteditable="true" data-placeholder="매치업명이 짧을수록 이해하기 쉬워요.">${matchupDetail.title}</div>
            </div>
        </div>

        <div class="content-area">
            <div class="form-label-wrapper">
                <div class="form-label">소개글</div>
            </div>
            <div class="input-container textarea-container">
                <div id="matchupContent" class="editable-title" contenteditable="true" data-placeholder="활동 중심으로 소개해주세요.">${matchupDetail.content}</div>
            </div>
        </div>

        <div class="address-area-wrapper">
            <div class="form-label-wrapper">
                <div class="form-label">모임 장소</div>
            </div>
            <div class="address-area">
                <div class="postal-code-area">
                    <input type="text" id="postcode" class="address-input-field" placeholder="우편번호" readonly />
                    <button type="button" class="postal-code-btn" onclick="execDaumPostcode()">우편번호 찾기</button>
                </div>
                <input type="text" id="roadAddress" class="address-input-field" placeholder="도로명 주소" value="${matchupDetail.regionGroup} ${matchupDetail.regionSubgroup}" readonly />
                <input type="text" id="jibunAddress" class="address-input-field" placeholder="지번 주소" readonly style="display:none;" />
                <input type="text" id="detailAddress" class="address-input-field" placeholder="상세 주소를 입력하세요" value="${matchupDetail.regionDetail}" />
            </div>
        </div>

        <div class="select-area">
            <div class="form-field">
                <div class="field-label">사용 언어</div>
                <div class="field-input-wrapper">
                    <div class="dropdown-trigger-box" id="languageSelectBox">
                        <span class="selected-value-text" id="selectedLanguage">선택</span>
                        <img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" />
                    </div>
                    <ul class="dropdown-list hidden" id="languageDropdown">
                        <c:forEach var="lang" items="${languages}">
                            <li data-value="${lang.languageId}">${lang.languageName}</li>
                        </c:forEach>
                        <li data-value="">언어 없음</li>
                    </ul>
                    <input type="hidden" id="languageValue" name="languageId" value="${matchupDetail.languageId}">
                </div>
            </div>

            <div class="form-field">
                <div class="field-label">카테고리</div>
                <div class="field-input-wrapper">
                    <div class="dropdown-trigger-box" id="categorySelectBox">
                        <span class="selected-value-text" id="selectedCategory">선택</span>
                        <img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" />
                    </div>
                    <ul class="dropdown-list hidden" id="categoryDropdown">
                        <c:forEach var="cat" items="${categories}">
                            <li data-value="${cat.categoryId}">${cat.categoryName}</li>
                        </c:forEach>
                    </ul>
                    <input type="hidden" id="categoryValue" name="categoryId" value="${matchupDetail.categoryId}">
                </div>
            </div>

            <div class="form-field"><div class="field-label">시작일</div><div class="field-input-wrapper input-box"><input type="date" name="startDay" class="date-time-input" value="${matchupDetail.formattedStartDate}" /></div></div>
            <div class="form-field"><div class="field-label">종료일</div><div class="field-input-wrapper input-box"><input type="date" name="endDay" class="date-time-input" value="${matchupDetail.formattedEndDate}" /></div></div>
            <div class="form-field"><div class="field-label">시작시간</div><div class="field-input-wrapper input-box"><input type="time" name="startTime" class="date-time-input" value="${matchupDetail.formattedStartTime}" required /></div></div>
            <div class="form-field"><div class="field-label">종료시간</div><div class="field-input-wrapper input-box"><input type="time" name="endTime" class="date-time-input" value="${matchupDetail.formattedEndTime}" required /></div></div>

            <div class="form-field">
                <div class="field-label">총 진행 횟수</div>
                <div class="field-input-wrapper">
                    <div class="dropdown-trigger-box" id="sessionCountSelectBox">
                        <span class="selected-value-text" id="selectedSessionCount">선택</span>
                        <img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" />
                    </div>
                    <ul class="dropdown-list hidden" id="sessionCountDropdown">
                        <li data-value="1">1회</li> <li data-value="2">2회</li> <li data-value="3">3회</li> <li data-value="4">4회</li> <li data-value="5">5회</li>
                    </ul>
                    <input type="hidden" id="sessionCountValue" name="count" value="${matchupDetail.totalCount}">
                </div>
            </div>
            
            <div class="form-field">
                <div class="field-label">활동 요일</div>
                <div class="field-input-wrapper">
                    <ul class="dayofweek">
                        <li class="day" data-day="MON">월</li> <li class="day" data-day="TUE">화</li> <li class="day" data-day="WED">수</li> <li class="day" data-day="THU">목</li> <li class="day" data-day="FRI">금</li> <li class="day" data-day="SAT">토</li> <li class="day" data-day="SUN">일</li>
                    </ul>
                    <input type="hidden" name="selectedDays" id="selectedDaysInput" value="${matchupDetail.selectedDays}">
                </div>
            </div>

            <div class="form-field">
                <div class="field-label">멘토 유무</div>
                <div class="field-input-wrapper">
                    <div class="mento-toggle-group">
                        <button type="button" class="mento-btn" data-value="true">유</button>
                        <div class="mento-divider"></div>
                        <button type="button" class="mento-btn" data-value="false">무</button>
                    </div>
                    <input type="hidden" id="hasMento" name="hasMento" value="${matchupDetail.hasMento}">
                </div>
            </div>

            <div class="form-field"><div class="field-label">가격</div><div class="field-input-wrapper input-box"><input type="number" name="price" min="0" class="number-input" value="${matchupDetail.price}" /></div></div>
            <div class="form-field"><div class="field-label">최소 인원</div><div class="field-input-wrapper input-box"><input type="number" name="minMember" min="1" class="number-input" value="${matchupDetail.minMember}" /></div></div>
            <div class="form-field"><div class="field-label">최대 인원</div><div class="field-input-wrapper input-box"><input type="number" name="maxMember" min="1" class="number-input" value="${matchupDetail.maxMember}" /></div></div>
        </div>

		<div class="together-type-section">
		    <div class="form-label" style="padding: 10px 0;">함께 하고 싶은 유형</div>
		    <div class="type-dropdown-row">
		        <div class="field-input-wrapper">
		            <div class="dropdown-trigger-box"><span class="selected-value-text">선택</span><img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" /></div>
		            <ul class="dropdown-list hidden">
			            <c:forEach var="type" items="${matchTypes}"><li data-value="${type.matchTypeId}">${type.matchTypeName}</li></c:forEach>
		            </ul>
		            <input type="hidden" class="preferred-type-value" name="matchTypeFirst" value="${matchupDetail.matchTypeFirst}">
		        </div>
		        <div class="field-input-wrapper">
		            <div class="dropdown-trigger-box"><span class="selected-value-text">선택</span><img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" /></div>
		            <ul class="dropdown-list hidden">
			            <c:forEach var="type" items="${matchTypes}"><li data-value="${type.matchTypeId}">${type.matchTypeName}</li></c:forEach>
		            </ul>
		            <input type="hidden" class="preferred-type-value" name="matchTypeSecond" value="${matchupDetail.matchTypeSecond}">
		        </div>
		        <div class="field-input-wrapper">
		            <div class="dropdown-trigger-box"><span class="selected-value-text">선택</span><img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" /></div>
		            <ul class="dropdown-list hidden">
			            <c:forEach var="type" items="${matchTypes}"><li data-value="${type.matchTypeId}">${type.matchTypeName}</li></c:forEach>
		            </ul>
		            <input type="hidden" class="preferred-type-value" name="matchTypeThird" value="${matchupDetail.matchTypeThird}">
		        </div>
		    </div>
		</div>

        <button type="button" id="updateMatchupBtn" class="create-btn">
            <div class="div10">수정하기</div>
        </button>
    </div>
    
    <script>
        window.matchupDetail = {
            languageId: '${matchupDetail.languageId}',
            categoryId: '${matchupDetail.categoryId}',
            count: '${matchupDetail.totalCount}',
            selectedDays: '${matchupDetail.selectedDays}',
            hasMento: ${matchupDetail.hasMento},
            matchTypeFirst: '${matchupDetail.matchTypeFirst}',
            matchTypeSecond: '${matchupDetail.matchTypeSecond}',
            matchTypeThird: '${matchupDetail.matchTypeThird}'
        };
    </script>    
    <script src="${cpath}/resources/js/matchup/updateMatchup.js?v=<%= new java.util.Date().getTime() %>"></script>
</body>
</html>