document.addEventListener("DOMContentLoaded", () => {
  const loginBtn = document.getElementById("loginBtn");
  console.log("🔍 loginBtn:", loginBtn);
});



// ===================== 검색바 엔터 쳐도 페이지 전환 X =====================
  $(document).ready(function () {
    $('.search-bar').on('submit', function (e) {
      e.preventDefault(); // 기본 동작(페이지 이동) 막기
    });
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
