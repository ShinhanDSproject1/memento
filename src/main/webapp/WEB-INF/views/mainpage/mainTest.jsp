<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  
  <title>me:mento 메인 페이지</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage/mainTest.css" />
  

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
  <div class="home-page-2">
    <div class="container">
      <div class="stats-title">
        Meet Our Students<br />
        숫자가 증명하는 <span class="stats-highlight">me:mento</span>
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
  </div>
  
      <!-- Rankings Section -->
    <section class="rankings" id="rankings">
        <div class="container">
            <h2>🏆 실시간 랭킹</h2>
            <div class="ranking-grid">
                <!-- 인기 멘토 랭킹 -->
                <div class="ranking-card">
                    <h3 class="ranking-title">🏆 인기 멘토 랭킹</h3>
                    
                    <!-- 시상대 (1-3등) -->
                    <div class="podium">
                        <div class="podium-place second">
                            <div class="podium-profile">
                                <div class="podium-avatar">세</div>
                                <div class="podium-name">세븐하이</div>
                                <div class="podium-score">⭐ 4.7</div>
                            </div>
                            <div class="podium-step">
                                <span class="medal">🥈</span>
                                2
                            </div>
                        </div>
                        
                        <div class="podium-place first">
                            <div class="podium-profile">
                                <div class="podium-avatar">혐</div>
                                <div class="podium-name">혐규</div>
                                <div class="podium-score">⭐ 5.0</div>
                            </div>
                            <div class="podium-step">
                                <span class="trophy">🏆</span>
                                1
                            </div>
                        </div>
                        
                        <div class="podium-place third">
                            <div class="podium-profile">
                                <div class="podium-avatar">에</div>
                                <div class="podium-name">에듀윌</div>
                                <div class="podium-score">⭐ 4.7</div>
                            </div>
                            <div class="podium-step">
                                <span class="medal">🥉</span>
                                3
                            </div>
                        </div>
                    </div>

                    <!-- 4-7등 리스트 -->
                    <div class="ranking-list">
                        <div class="ranking-item">
                            <div class="rank-number">4</div>
                            <div class="profile-pic">벗</div>
                            <div class="rank-info">
                                <div class="rank-name">벗나무</div>
                                <div class="rank-score">⭐ 4.7</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 열정 멘티 랭킹 -->
                <div class="ranking-card">
                    <h3 class="ranking-title">🏆 열정 멘티 랭킹</h3>
                    
                    <!-- 시상대 (1-3등) -->
                    <div class="podium">
                        <div class="podium-place second">
                            <div class="podium-profile">
                                <div class="podium-avatar">라</div>
                                <div class="podium-name">라이츄</div>
                                <div class="podium-score">⭐ 5.0</div>
                            </div>
                            <div class="podium-step">
                                <span class="medal">🥈</span>
                                2
                            </div>
                        </div>
                        
                        <div class="podium-place first">
                            <div class="podium-profile">
                                <div class="podium-avatar">파</div>
                                <div class="podium-name">파이리</div>
                                <div class="podium-score">⭐ 5.0</div>
                            </div>
                            <div class="podium-step">
                                <span class="trophy">🏆</span>
                                1
                            </div>
                        </div>
                        
                        <div class="podium-place third">
                            <div class="podium-profile">
                                <div class="podium-avatar">피</div>
                                <div class="podium-name">피카츄</div>
                                <div class="podium-score">⭐ 5.0</div>
                            </div>
                            <div class="podium-step">
                                <span class="medal">🥉</span>
                                3
                            </div>
                        </div>
                    </div>

                    <!-- 4-7등 리스트 -->
                    <div class="ranking-list">
                        <div class="ranking-item">
                            <div class="rank-number">4</div>
                            <div class="profile-pic">딥</div>
                            <div class="rank-info">
                                <div class="rank-name">딥카페라떼</div>
                                <div class="rank-score">⭐ 4.7</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 인기 언어 랭킹 -->
                <div class="ranking-card">
                    <h3 class="ranking-title">🏆 인기 언어 랭킹</h3>
                    
                    <!-- 시상대 (1-3등) -->
                    <div class="podium">
                        <div class="podium-place second">
                            <div class="podium-profile">
                                <div class="podium-avatar" style="background: linear-gradient(45deg, #3776ab, #ffd43b);">🐍</div>
                                <div class="podium-name">Python</div>
                                <div class="podium-score">⭐ 4.0</div>
                            </div>
                            <div class="podium-step">
                                <span class="medal">🥈</span>
                                2
                            </div>
                        </div>
                        
                        <div class="podium-place first">
                            <div class="podium-profile">
                                <div class="podium-avatar" style="background: linear-gradient(45deg, #f39c12, #e67e22);">☕</div>
                                <div class="podium-name">Java</div>
                                <div class="podium-score">⭐ 4.0</div>
                            </div>
                            <div class="podium-step">
                                <span class="trophy">🏆</span>
                                1
                            </div>
                        </div>
                        
                        <div class="podium-place third">
                            <div class="podium-profile">
                                <div class="podium-avatar" style="background: linear-gradient(45deg, #e34c26, #f06529);">🌐</div>
                                <div class="podium-name">HTML</div>
                                <div class="podium-score">⭐ 4.0</div>
                            </div>
                            <div class="podium-step">
                                <span class="medal">🥉</span>
                                3
                            </div>
                        </div>
                    </div>

                    <!-- 4-7등 리스트 -->
                    <div class="ranking-list">
                        <div class="ranking-item">
                            <div class="rank-number">4</div>
                            <div class="profile-pic" style="background: linear-gradient(45deg, #61dafb, #21a1c4);">⚛️</div>
                            <div class="rank-info">
                                <div class="rank-name">React</div>
                                <div class="rank-score">⭐ 4.0</div>
                            </div>
                        </div>
                        <div class="ranking-item">
                            <div class="rank-number">5</div>
                            <div class="profile-pic" style="background: linear-gradient(45deg, #6db33f, #4a7c59);">🍃</div>
                            <div class="rank-info">
                                <div class="rank-name">Spring</div>
                                <div class="rank-score">⭐ 4.0</div>
                            </div>
                        </div>
                        <div class="ranking-item">
                            <div class="rank-number">6</div>
                            <div class="profile-pic" style="background: linear-gradient(45deg, #f7df1e, #f0d000);">📜</div>
                            <div class="rank-info">
                                <div class="rank-name">JavaScript</div>
                                <div class="rank-score">⭐ 4.0</div>
                            </div>
                        </div>
                        <div class="ranking-item">
                            <div class="rank-number">7</div>
                            <div class="profile-pic" style="background: linear-gradient(45deg, #1572b6, #33a9dc);">🎨</div>
                            <div class="rank-info">
                                <div class="rank-name">CSS</div>
                                <div class="rank-score">⭐ 4.0</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>deg, #f39c12, #e67e22);">
                            <span style="line-height: 40px;">☕</span>
                        </div>
                        <div class="rank-info">
                            <div class="rank-name">Java</div>
                            <div class="rank-score">⭐ 4.0</div>
                        </div>
                    </div>
                    <div class="ranking-item">
                        <div class="rank-number">2</div>
                        <div class="profile-pic" style="background: linear-gradient(45deg, #3776ab, #ffd43b);">
                            <span style="line-height: 40px;">🐍</span>
                        </div>
                        <div class="rank-info">
                            <div class="rank-name">Python</div>
                            <div class="rank-score">⭐ 4.0</div>
                        </div>
                    </div>
                    <div class="ranking-item">
                        <div class="rank-number">3</div>
                        <div class="profile-pic" style="background: linear-gradient(45deg, #e34c26, #f06529);">
                            <span style="line-height: 40px;">🌐</span>
                        </div>
                        <div class="rank-info">
                            <div class="rank-name">HTML</div>
                            <div class="rank-score">⭐ 4.0</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



 
</body>

  <!-- 푸터 -->
  <footer>
    <div class="container">
      <div class="row mb-4">
        <div class="col-md-3 mb-3">
          <div class="footer-links">
            <a href="#">개인정보처리방침</a>
            <a href="#">이용약관</a>
          </div>
        </div>
        <div class="col-md-5 footer-info mb-3">
          <strong>(주)me:mento</strong><br />
          대표자: 김신한<br />
          사업자번호: 123-45-67890 <a href="#">사업자 정보 확인</a><br />
          통신판매업: 2025-서울마포-0001<br />
          개인정보보호책임자: 신한DS<br />
          이메일: info@mentormentee.com
        </div>
        <div class="col-md-4 footer-contact">
          전화번호: 070-1234-5678<br />
          주소: 서울특별시 중구 남대문로10길 29<br />
          고객센터: 평일 10:00 ~ 18:00 (점심시간 12:00 ~ 13:00)
        </div>
      </div>
      <div class="footer-bottom">
        © 2025 MENTORMENTEE LAB. ALL RIGHTS RESERVED.
      </div>
    </div>
  </footer>

  <!-- 슬라이더 JavaScript -->
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const slider = document.getElementById("slider");
      let currentIndex = 0;
      let intervalId;

      function slideTo(index) {
        const gap = 45;
        const itemWidth = slider.children[0].offsetWidth + gap;
        slider.style.transform = `translateX(-${itemWidth * index}px)`;
        currentIndex = index;
      }

      window.slideNext = function () {
        if (currentIndex < slider.children.length - 1) {
          slideTo(currentIndex + 1);
        } else {
          slideTo(0);
        }
      };

      window.slidePrev = function () {
        if (currentIndex > 0) {
          slideTo(currentIndex - 1);
        } else {
          slideTo(slider.children.length - 1);
        }
      };

      // 자동 슬라이드
      function startAutoSlide() {
        intervalId = setInterval(slideNext, 4000);
      }

      function stopAutoSlide() {
        clearInterval(intervalId);
      }

      // 마우스 호버 시 자동 슬라이드 정지
      const sliderWrapper = document.querySelector('.slider-wrapper');
      sliderWrapper.addEventListener("mouseenter", stopAutoSlide);
      sliderWrapper.addEventListener("mouseleave", startAutoSlide);

      // 자동 슬라이드 시작
      startAutoSlide();

      // 키보드 네비게이션
      document.addEventListener('keydown', function(e) {
        if (e.key === 'ArrowLeft') {
          slidePrev();
        } else if (e.key === 'ArrowRight') {
          slideNext();
        }
      });
    });

    // 스무스 스크롤
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
      anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
          target.scrollIntoView({
            behavior: 'smooth',
            block: 'start'
          });
        }
      });
    });
  </script>
</body>
</html>