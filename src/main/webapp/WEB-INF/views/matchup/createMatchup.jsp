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

<script
    src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${cpath}/resources/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
	<%@ include file="../common/logout_header.jsp"%>
    <jsp:include page="/WEB-INF/views/matchup/createConfirmModal.jsp" />
<div class="container">
	    <div class="create-matchup-container">
	        <div class="top-area">
	            <div class="div">어떤 매치업을 만들까요?</div>
	        </div>
	
	        <div class="title-area">
	            <div class="form-label-wrapper">
	                <div class="form-label">매치업명</div>
	            </div>
	            <div class="input-container">
	                <div id="matchupTitle" class="editable-title" contenteditable="true" data-placeholder="매치업명이 짧을수록 이해하기 쉬워요."></div>
	                <input type="hidden" id="matchupTitleHidden" name="matchupTitle" value="">
	            </div>
	        </div>
	
			<div class="content-area">
			  <div class="form-label-wrapper">
			    <div class="form-label">소개글</div>
			  </div>
			  <div class="input-container textarea-container">
			     <textarea id="matchupContent" name="matchupContent">
			    </textarea>
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
	                <input type="text" id="roadAddress" class="address-input-field" placeholder="도로명 주소" readonly />
	                <input type="text" id="jibunAddress" name="jibunAddress" class="address-input-field" placeholder="지번 주소" readonly style="display:none;" />
	                <input type="text" id="detailAddress" name="detailAddress" class="address-input-field" placeholder="상세 주소를 입력하세요" />
	            </div>
	        </div>
	
	        <div class="select-area">
	            <div class="form-field">
	                <div class="field-label">사용 언어</div>
	                <div class="field-input-wrapper">
	                    <div class="dropdown-trigger-box" id="languageSelectBox">
	                        <span class="selected-value-text" id="selectedLanguage">자바(Java)</span>
	                        <img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" />
	                    </div>
	                    <ul class="dropdown-list hidden" id="languageDropdown">
	                        <c:forEach var="lang" items="${languages}">
						        <li data-value="${lang.languageId}">${lang.languageName}</li>
						    </c:forEach>
	                        <li data-value="">언어 없음</li>
	                    </ul>
	                    <input type="hidden" id="languageValue" name="language" value="2">
	                </div>
	            </div>
	
	            <div class="form-field">
	                <div class="field-label">카테고리</div>
	                <div class="field-input-wrapper">
	                    <div class="dropdown-trigger-box" id="categorySelectBox">
	                        <span class="selected-value-text" id="selectedCategory">알고리즘</span>
	                        <img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" />
	                    </div>
	                    <ul class="dropdown-list hidden" id="categoryDropdown">
	                        <c:forEach var="cat" items="${categories}">
						        <li data-value="${cat.categoryId}">${cat.categoryName}</li>
						    </c:forEach>
	                    </ul>
	                    <input type="hidden" id="categoryValue" name="category" value="1">
	                </div>
	            </div>
	
	            <div class="form-field"><div class="field-label">시작일</div><div class="field-input-wrapper input-box"><input type="date" name="startDate" class="date-time-input" /></div></div>
	            <div class="form-field"><div class="field-label">종료일</div><div class="field-input-wrapper input-box"><input type="date" name="endDate" class="date-time-input" /></div></div>
	
	            <div class="form-field"><div class="field-label">시작시간</div><div class="field-input-wrapper input-box"><input type="time" name="startTime" class="date-time-input" required /></div></div>
	            <div class="form-field"><div class="field-label">종료시간</div><div class="field-input-wrapper input-box"><input type="time" name="endTime" class="date-time-input" required /></div></div>
	
	            <div class="form-field">
	                <div class="field-label">총 진행 횟수</div>
	                <div class="field-input-wrapper">
	                    <div class="dropdown-trigger-box" id="sessionCountSelectBox">
	                        <span class="selected-value-text" id="selectedSessionCount">2회</span>
	                        <img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" />
	                    </div>
	                    <ul class="dropdown-list hidden" id="sessionCountDropdown">
	                        <li data-value="1">1회</li> 
	                        <li data-value="2">2회</li> 
	                        <li data-value="3">3회</li> 
	                        <li data-value="4">4회</li> 
	                        <li data-value="5">5회</li>
	                    </ul>
	                    <input type="hidden" id="sessionCountValue" name="sessionCount" value="2">
	                </div>
	            </div>
	            
	            <div class="form-field">
	                <div class="field-label">활동 요일</div>
	                <div class="field-input-wrapper">
	                    <ul class="dayofweek">
	                        <li class="day" data-day="MON">월</li> <li class="day" data-day="TUE">화</li> <li class="day" data-day="WED">수</li> <li class="day" data-day="THU">목</li> <li class="day" data-day="FRI">금</li> <li class="day" data-day="SAT">토</li> <li class="day" data-day="SUN">일</li>
	                    </ul>
	                    <input type="hidden" name="selectedDays" id="selectedDaysInput" value="">
	                </div>
	            </div>
	
	            <div class="form-field">
	                <div class="field-label">멘토 유무</div>
	                <div class="field-input-wrapper">
	                    <div class="mento-toggle-group">
	                        <button type="button" class="mento-btn active" data-value="Y">유</button>
	                        <div class="mento-divider"></div>
	                        <button type="button" class="mento-btn" data-value="N">무</button>
	                    </div>
	                    <input type="hidden" id="mentoYn" name="mentoYn" value="Y">
	                </div>
	            </div>
	
	            <div class="form-field"><div class="field-label">가격</div><div class="field-input-wrapper input-box"><input type="number" name="price" min="0" class="number-input" placeholder="0" /></div></div>
	
	            <div class="form-field"><div class="field-label">최소 인원</div><div class="field-input-wrapper input-box"><input type="number" name="minMember" min="1" class="number-input" placeholder="1" /></div></div>
	            <div class="form-field"><div class="field-label">최대 인원</div><div class="field-input-wrapper input-box"><input type="number" name="maxMember" min="1" class="number-input" placeholder="10" /></div></div>
	        </div>
	
			<div class="together-type-section">
			    <div class="form-label" style="padding: 10px 0;">함께 하고 싶은 유형</div>
			    <div class="type-dropdown-row">
			        <div class="field-input-wrapper">
			            <div class="dropdown-trigger-box"><span class="selected-value-text">선택</span><img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" /></div>
			            <ul class="dropdown-list hidden">
				            <c:forEach var="type" items="${matchTypes}">
						        <li data-value="${type.matchTypeId}">${type.matchTypeName}</li>
						    </c:forEach>
			            </ul>
			            <input type="hidden" class="preferred-type-value" name="preferredTypes">
			        </div>
			        <div class="field-input-wrapper">
			            <div class="dropdown-trigger-box"><span class="selected-value-text">선택</span><img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" /></div>
			            <ul class="dropdown-list hidden">
				            <c:forEach var="type" items="${matchTypes}">
						        <li data-value="${type.matchTypeId}">${type.matchTypeName}</li>
						    </c:forEach>
			            </ul>
			            <input type="hidden" class="preferred-type-value" name="preferredTypes">
			        </div>
			        <div class="field-input-wrapper">
			            <div class="dropdown-trigger-box"><span class="selected-value-text">선택</span><img class="dropdown-arrow-icon" src="${cpath}/resources/images/icon-down.svg" /></div>
			            <ul class="dropdown-list hidden">
				            <c:forEach var="type" items="${matchTypes}">
						        <li data-value="${type.matchTypeId}">${type.matchTypeName}</li>
						    </c:forEach>
			            </ul>
			            <input type="hidden" class="preferred-type-value" name="preferredTypes">
			        </div>
			    </div>
			</div>
	
	        <button type="button" id="createMatchupBtn" class="create-btn">
	            <div class="div10">개설하기</div>
	        </button>
	    </div>
	  </div>
<script>
   window.cpath = '${cpath}';
</script>    
<script src="${cpath}/resources/js/matchup/createMatchup.js"></script>

<script type="text/javascript">
  var oEditors = [];

  nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "matchupContent",  // textarea id
    sSkinURI: cpath + "/resources/smarteditor2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
  });
</script>
</body>
</html>