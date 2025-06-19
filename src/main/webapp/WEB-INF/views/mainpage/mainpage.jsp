<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>me:mento 메인 페이지</title>
    
    <!-- External CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage/main.css">
    

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  
  <!-- D2Coding -->
    <link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2107@1.1/D2Coding.css" rel="stylesheet" type="text/css">
</head>
<body>
 <!-- 슬라이드 배너 영역 -->
  <div class="slider-wrapper">
    <button class="slider-btn left" onclick="slidePrev()" aria-label="이전 슬라이드">‹</button>

    <div id="slider-container">
      <div class="home-page-1" id="slider">
        <!-- 슬라이드 1 - SPARK TEST -->
        <div class="page-1-com-1">
          <div class="spark-icon">⚡</div>
          <div class="spark-title">SPARK TEST</div>
          <div class="mbti-title">
            <span class="emoji">💻</span>개발자도 MBTI가 필요하다면?
          </div>
          <div class="mbti-subtitle">
            나만의 학습 성향을 진단하고<br />더 빠르게 성장해보세요!
          </div>
          <a href="#" class="cta-button">🚀 지금 테스트하러 가기</a>
        </div>

        <!-- 슬라이드 2 - Spring 멘토링 -->
        <div class="page-1-com-12">
          <div class="spring-content">
            <div class="spring-text">
              <div class="spring-title">
                취업을 <span class="number">365</span>일 앞당겨주는<br />
                <span class="highlight">Spring</span> 속성 멘토링
              </div>
              <div class="spring-info">
                <div class="info-row">
                  <div class="info-label">강사</div>
                  <div class="info-value">안가연</div>
                </div>
                <div class="info-row">
                  <div class="info-label">일시</div>
                  <div class="info-value">6/15일 오전 9시</div>
                </div>
              </div>
            </div>
            <div class="spring-image">👩‍💻</div>
          </div>
        </div>

        <!-- 슬라이드 3 - React 멘토링 -->
        <div class="page-1-com-13">
          <div class="spring-content">
            <div class="spring-text">
              <div class="spring-title">
                실무 중심의<br />
                <span class="highlight">React</span> 마스터클래스
              </div>
              <div class="spring-info">
                <div class="info-row">
                  <div class="info-label">강사</div>
                  <div class="info-value">김민수</div>
                </div>
                <div class="info-row">
                  <div class="info-label">일시</div>
                  <div class="info-value">6/20일 오후 2시</div>
                </div>
              </div>
            </div>
            <div class="spring-image">⚛️</div>
          </div>
        </div>
      </div>
    </div>

    <button class="slider-btn right" onclick="slideNext()" aria-label="다음 슬라이드">›</button>
  </div>

    <!-- 통계 섹션 -->
    <section class="home-page-2">
        <div class="container">
            <div class="stats-title">
                Meet Our Students<br>
                숫자가 증명하는 
                <span class="stats-highlight">
                    <span class="me-color">me</span>:<span class="mento-color">mento</span>
                </span>
            </div>
            <div class="stats-container">
                <div class="stat-item">
                    <div class="stat-icon">📚</div>
                    <div class="stat-label">멘토링 수강 수</div>
                    <div class="stat-value">100만명</div>
                </div>
                <div class="stat-item">
                    <div class="stat-icon">🤝</div>
                    <div class="stat-label">매칭 현황</div>
                    <div class="stat-value">100건+</div>
                </div>
                <div class="stat-item">
                    <div class="stat-icon">🔥</div>
                    <div class="stat-label">누적 매치업</div>
                    <div class="stat-value">100건+</div>
                </div>
                <div class="stat-item">
                    <div class="stat-icon">🏢</div>
                    <div class="stat-label">제휴업체</div>
                    <div class="stat-value">100개+</div>
                </div>
                <div class="stat-item">
                    <div class="stat-icon">👥</div>
                    <div class="stat-label">누적 방문수</div>
                    <div class="stat-value">100만명</div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 서비스 소개 페이지 -->
<div class="home-page-3">
  <div class="div">서비스 소개</div>
  <div class="me-mento">
    <span>
      <span class="me-mento-span">우리</span>
      <span class="me-mento-span2">me:</span>
      <span class="me-mento-span3">mento</span>
      <span class="me-mento-span">
        에 적합한
        <br />
        교육을 선택해서 운영
      </span>
    </span>
  </div>
  <div class="device-macbook-pro">
    <div class="shadow"></div>
    <div class="top">
      <div class="lid"></div>
      <div class="dark-screen"></div>
      <div class="screen-wrap">
        <div class="screen"></div>
        <div class="insert-your-design-here">Insert Your Design Here</div>
      </div>
    </div>
    <img class="bottom" src="${pageContext.request.contextPath}/resources/images/main1/bottom.svg" />
  </div>
  <img class="image-55" src="${pageContext.request.contextPath}/resources/images/main1/serviceinner.png" />
</div>

</body>

    <!-- 푸터 영역 -->
    <footer class="container mt-5">
        <div class="row mb-4">
            <div class="col-md-3 mb-3">
                <div class="footer-links mt-2">
                    <a href="#" class="footer-link">개인정보처리방침</a>
                    <a href="#" class="footer-link">이용약관</a>
                </div>
            </div>
            <div class="col-md-5 footer-info">
                <strong>(주)me:mento</strong><br>
                대표자: 김신한<br>
                사업자번호: 123-45-67890 <a href="#" class="business-link">사업자 정보 확인</a><br>
                통신판매업: 2025-서울마포-0001<br>
                개인정보보호책임자: 신한DS<br>
                이메일: info@mentormentee.com
            </div>
            <div class="col-md-4 footer-contact">
                전화번호: 070-1234-5678<br>
                주소: 서울특별시 중구 남대문로10길 29<br>
                고객센터: 평일 10:00 ~ 18:00 (점심시간 12:00 ~ 13:00)
            </div>
        </div>
        <div class="footer-bottom text-center">
            © 2025 MENTORMENTEE LAB. ALL RIGHTS RESERVED.
        </div>
    </footer>

  <!-- 슬라이더 JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/js/mainslider.js">
  </script>
</body>
</html>