function closeModal() {
	      document.getElementById("loginModal").style.display = "none";
	      document.getElementById("modalBackdrop").style.display = "none";
		  document.getElementById("notificationModal").style.display = "none";
	    }

document.addEventListener("DOMContentLoaded", function () {
	
	notiFlag = 0;
	
	const notiModal = document.getElementById("notificationModal");
	const layoutWrapper = document.getElementById("layoutWrapper");
	
	const notiBtn = document.getElementById("notification-icon");
	
	function openLoginModal() {
	    const modal = document.getElementById("loginModal");
		closeNotiModal();
	    const backdrop = document.getElementById("modalBackdrop");
		modal.style.display = "block";
		backdrop.style.display = "block";
	    
	  }
	  
	 function closeNotiModal() {
		if(notiFlag == 1) {
			notiFlag = 0;
			notiModal.style.display = "none";
		}
	 }
	 
	 function openNotiModal() {
	 		if(notiFlag==1) {
	 			notiModal.style.display = "none";
	 			notiFlag = 0;	
	 		} else {
	 			notiModal.style.display = "block";
	 			notiFlag = 1;	
	 		}
	 	}		

	document.body.addEventListener("click", function (e) {
	// 모달 바깥을 클릭한 경우에만 닫기
	if (
		 !notiModal.contains(e.target)
		 & !notiBtn.contains(e.target)
		 ) {
			closeNotiModal();
	}
	});
		
	
	const loginBtn = document.getElementById("loginBtn");
		const loginModalCloseBtn = document.getElementById("loginModalCloseBtn");
		if (loginBtn) {
			loginModalCloseBtn.addEventListener("click", closeModal);
			loginBtn.addEventListener("click", openLoginModal);
		} else {
			console.warn("로그인 버튼 (#loginBtn)을 찾을 수 없습니다.");
		}
		
	
	notiBtn.addEventListener("click", openNotiModal)
	
  const slider = document.getElementById("slider");
  const slides = slider.children;
  const gap = 45;
  let currentIndex = 1;
  let intervalId;

  // 슬라이드 복제 (앞뒤로)
  const firstSlide = slides[0].cloneNode(true);
  const lastSlide = slides[slides.length - 1].cloneNode(true);
  slider.appendChild(firstSlide);
  slider.insertBefore(lastSlide, slides[0]);

  const itemWidth = slides[0].offsetWidth + gap;
  slider.style.transition = "none";
  slider.style.transform = `translateX(-${itemWidth}px)`;

  function slideTo(index) {
    slider.style.transition = "transform 0.5s ease";
    slider.style.transform = `translateX(-${itemWidth * index}px)`;
    currentIndex = index;
  }

  window.slideNext = function () {
    if (currentIndex < slider.children.length - 1) {
      slideTo(currentIndex + 1);
    }
  };

  window.slidePrev = function () {
    if (currentIndex > 0) {
      slideTo(currentIndex - 1);
    }
  };

  slider.addEventListener("transitionend", () => {
    if (currentIndex === slider.children.length - 1) {
      slider.style.transition = "none";
      currentIndex = 1;
      slider.style.transform = `translateX(-${itemWidth}px)`;
    }
    if (currentIndex === 0) {
      slider.style.transition = "none";
      currentIndex = slider.children.length - 2;
      slider.style.transform = `translateX(-${itemWidth * currentIndex}px)`;
    }
  });

  // 자동 슬라이드
  function startAutoSlide() {
    intervalId = setInterval(() => {
      slideNext();
    }, 4000);
  }

  function stopAutoSlide() {
    clearInterval(intervalId);
  }

  const sliderWrapper = document.querySelector(".slider-wrapper");
  sliderWrapper.addEventListener("mouseenter", stopAutoSlide);
  sliderWrapper.addEventListener("mouseleave", startAutoSlide);

  startAutoSlide();

  // 키보드 지원
  document.addEventListener("keydown", function (e) {
    if (e.key === "ArrowLeft") {
      slidePrev();
    } else if (e.key === "ArrowRight") {
      slideNext();
    }
  });
});