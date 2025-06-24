document.addEventListener("DOMContentLoaded", () => {
  const loginBtn = document.getElementById("loginBtn");
  console.log("🔍 loginBtn:", loginBtn); // ← 여기에 null 나오면 바인딩 안 된 거야
});


// ===================== 로그인 모달 =====================


// header.js
document.addEventListener("DOMContentLoaded", function () {
  const loginBtn = document.getElementById("loginBtn");
  const loginModal = document.getElementById("loginModal");
  const modalBackdrop = document.getElementById("modalBackdrop");

  if (loginBtn && loginModal && modalBackdrop) {
    loginBtn.addEventListener("click", function () {
      loginModal.style.display = "block";
      modalBackdrop.style.display = "block";
    });
  }
});

function closeModal() {
  const loginModal = document.getElementById("loginModal");
  const modalBackdrop = document.getElementById("modalBackdrop");

  if (loginModal && modalBackdrop) {
    loginModal.style.display = "none";
    modalBackdrop.style.display = "none";
  }
}

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