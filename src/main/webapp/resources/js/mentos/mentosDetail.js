// 1. 좋아요 기능
document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.like-heart-btn').forEach(function (btn) {
    btn.addEventListener('click', function (e) {
      e.preventDefault();
      e.stopPropagation();
      btn.classList.toggle('liked');
    });
  });

  // 2. 삭제 버튼 클릭 시 → 팝업 표시
  const deleteBtn = document.querySelector('.mentos-delete-btn .class-apply-btn');
  const deleteModal = document.getElementById('delete-confirm-modal');

  if (deleteBtn && deleteModal) {
    deleteBtn.addEventListener('click', function () {
      deleteModal.style.display = 'flex';
    });
  }

  // 3. 취소 버튼 → 팝업 숨기기
  window.hideDeleteConfirmModal = function () {
    deleteModal.style.display = 'none';
  };

  // 4. 확인 버튼 → 삭제 API 호출 후 이동
  window.handleConfirmDelete = function () {
    const mentosId = '${mentos.mentosId}'; // JSTL에서 전달받은 멘토스 ID

    fetch(`/memento/mentos/delete?mentosId=${mentosId}`, {
      method: 'GET',
    })
      .then(response => {
        if (response.ok) {
          alert('삭제가 완료되었습니다.');
          window.location.href = '/mentos/full';
        } else {
          throw new Error('삭제 실패');
        }
      })
      .catch(error => {
        alert('삭제 중 오류가 발생했습니다: ' + error.message);
        deleteModal.style.display = 'none';
      });
  };
});
