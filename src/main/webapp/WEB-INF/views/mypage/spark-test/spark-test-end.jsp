<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="sparkImgPath"
	value="/resources/images/mypage/spark-test" />
<c:set var="type" value="${param.type}" />
<link rel="stylesheet" href="${cpath}/resources/css/mypage/spark-test/spark-test-end.css" />


<div class="spark-test-result-page">
	<div class="spark-test-result-content">
		<div class="spark-test-header-top-bar">
			<div class="spark-test-header-progress-indicator"></div>
		</div>
		<div class="spark-test-sidebar-header"
			style="background: url('${cpath}/resources/images/mypage/spark-test/img-spark-test.png'); background-size: cover; background-repeat: no-repeat;">
			<div class="spark-test-title">SPARK TEST</div>
		</div>
		<div class="spark-test-user-image-container"></div>
		<div class="spark-test-action-buttons">
  <button data-url="${cpath}/mypage/spark-test" class="spark-test-button spark-test-button--retake page-link">
    <div class="spark-test-button-label">다시 테스트하기</div>
  </button>
  <button class="spark-test-button spark-test-button--confirm">
    <div class="spark-test-button-label">확정하기</div>
  </button>
</div>
		<div class="spark-test-result-heading">
			<span> <span class="spark-test-result-icon">☕목표러
					코취치</span> <span class="spark-test-result-type">${type}</span>
			</span>
		</div>
		<div class="spark-test-result-subtitle">느긋한 꾸준형 개발자</div>
		<div class="spark-test-result-description">
			<span> <span class="spark-test-description-text"> 목표 지향적이고 실전에 진심인 타입. <br />
					실습, 프로젝트, 포트폴리오 중심으로 결과를 중시. <br /> <br />
			</span> <span class="spark-test-learning-style-title"> 학습 스타일 <br />
			</span>
				<ul class="spark-test-learning-style-list">
					<li>실습 위주 학습</li>
					<li>시간이 아깝다고 느끼면 중단</li>
					<li>이직, 포트폴리오, 자격증 등 뚜렷한 목표 있음</li>
				</ul> <span class="spark-test-description-text"> <br />
			</span> <span class="spark-test-mentoring-recommendation-title"> 추천 멘토링 <br />
			</span>
				<ul class="spark-test-mentoring-recommendation-list">
					<li>실전 예제, 코드 리뷰 중심</li>
					<li>결과 중심의 멘토 or 실무형 멘토에게 잘 맞음</li>
				</ul>
			</span>
		</div>
		<div class="spark-test-type-percentages">
			<div class="spark-test-percentage-bar-group">
				<div class="spark-test-percentage-bar-background"></div>
				<div class="spark-test-percentage-bar-fill spark-test-percentage-bar-fill--40"></div>
				<div class="spark-test-type-label">코드폭탄 해피빈 40%</div>
			</div>
			<div class="spark-test-percentage-bar-group">
				<div class="spark-test-percentage-bar-background"></div>
				<div class="spark-test-percentage-bar-fill spark-test-percentage-bar-fill--20"></div>
				<div class="spark-test-type-label">아이디어 요정 깃요미 20%</div>
			</div>
			<div class="spark-test-percentage-bar-group">
				<div class="spark-test-percentage-bar-background"></div>
				<div class="spark-test-percentage-bar-fill spark-test-percentage-bar-fill--50"></div>
				<div class="spark-test-type-label">계획왕 컴정이 50%</div>
			</div>
			<div class="spark-test-percentage-bar-group">
				<div class="spark-test-percentage-bar-background"></div>
				<div class="spark-test-percentage-bar-fill spark-test-percentage-bar-fill--30"></div>
				<div class="spark-test-type-label">느긋한 타닥냥 30%</div>
			</div>
			<div class="spark-test-percentage-bar-group">
				<div class="spark-test-percentage-bar-background"></div>
				<div class="spark-test-percentage-bar-fill spark-test-percentage-bar-fill--30-2"></div>
				<div class="spark-test-type-label">느긋한 타닥냥 30%</div>
			</div>
			<div class="spark-test-percentage-bar-group">
				<div class="spark-test-percentage-bar-background"></div>
				<div class="spark-test-percentage-bar-fill spark-test-percentage-bar-fill--70"></div>
				<div class="spark-test-type-label">목표러 코취치 70%</div>
			</div>
		</div>
		<div class="spark-test-partner-divider"></div>
	</div>
	<img class="spark-test-result-character-image" src="${sparkImgPath}/coachChee.png" alt="Coach Chee Character" />
	<div class="spark-test-compatible-partners-title">잘 맞는 파트너</div>
	<img class="spark-test-partner-icon spark-test-partner-icon--comzung" src="${sparkImgPath}/comZung-icon.png" alt="ComZung Icon" /> 
	<img class="spark-test-partner-icon spark-test-partner-icon--happybean" src="${sparkImgPath}/happyBeen-icon.png" alt="HappyBeen Icon" /> 
	<img class="spark-test-partner-icon spark-test-partner-icon--tadaknyang" src="${sparkImgPath}/tadakNyang-icon.png" alt="TadakNyang Icon" />
</div>