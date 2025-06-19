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
    	  console.log("slidePrev................")
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
    	  console.log(e.key);
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
