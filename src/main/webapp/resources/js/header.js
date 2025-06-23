// ===================== 로그인 모달 =====================
function closeModal() {
  document.getElementById("loginModal").style.display = "none";
  document.getElementById("modalBackdrop").style.display = "none";
  document.getElementById("notificationModal").style.display = "none";
}

function openLoginModal() {
  const modal = document.getElementById("loginModal");
  closeNotiModal();
  const backdrop = document.getElementById("modalBackdrop");
  modal.style.display = "block";
  backdrop.style.display = "block";
}

document.addEventListener("DOMContentLoaded", () => {
  const loginBtn = document.getElementById("loginBtn");
  const loginModalCloseBtn = document.getElementById("loginModalCloseBtn");

  if (loginBtn) {
    loginBtn.addEventListener("click", openLoginModal);
  } else {
    console.error("#loginBtn 찾을 수 없음 — header.jsp가 main보다 나중에 로드되었나요?");
  }

  if (loginModalCloseBtn) {
    loginModalCloseBtn.addEventListener("click", closeModal);
  } else {
    console.warn("#loginModalCloseBtn 찾을 수 없습니다.");
  }
});

// ===================== 알림 모달 =====================
document.addEventListener("DOMContentLoaded", function () {
  let notiFlag = 0;

  const notiBtn = document.getElementById("notification-icon");
  const notiModal = document.getElementById("notificationModal");

  function openNotiModal() {
    if (notiFlag === 1) {
      notiModal.style.display = "none";
      notiFlag = 0;
    } else {
      notiModal.style.display = "block";
      notiFlag = 1;
    }
  }

  function closeNotiModal() {
    if (notiFlag === 1) {
      notiModal.style.display = "none";
      notiFlag = 0;
    }
  }

  // 버튼 클릭 시 열기
  if (notiBtn) {
    notiBtn.addEventListener("click", openNotiModal);
  }

  // 바깥 클릭 시 닫기
  document.body.addEventListener("click", function (e) {
    if (
      notiModal &&
      notiBtn &&
      !notiModal.contains(e.target) &&
      !notiBtn.contains(e.target)
    ) {
      closeNotiModal();
    }
  });
});


// ===================== 마이페이지(대시보드) 모달 =====================
function gotoDashboard() {
	  localStorage.setItem('activeMenu', 'dashboard');
	  location.href = cpath + '/mypage/page1';
}