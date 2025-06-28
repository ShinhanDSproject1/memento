function openMemberModal() {
    document.getElementById("member-modal").style.display = "flex";
}

function closeMemberModal() {
    document.getElementById("member-modal").style.display = "none";
}

function openMentoModal() {
    document.getElementById("mento-modal").style.display = "flex";
}

function closeMentoModal() {
    document.getElementById("mento-modal").style.display = "none";
}

function showDeleteConfirmModal() {
    document.getElementById("delete-confirm-modal").style.display = "flex";
}

function hideDeleteConfirmModal() {
    document.getElementById("delete-confirm-modal").style.display = "none";
}

function showDeleteCompleteModal() {
    const completeModal = document.getElementById("delete-complete-modal");
    completeModal.style.display = "flex";
}

function hideDeleteCompleteModalAndRedirect() {
    document.getElementById("delete-complete-modal").style.display = "none";
    window.location.href = cpath + "/matchup/matchupList";
}


// AJAX 통신 함수
async function handleConfirmDelete() {
    // JSP에서 전달받은 전역 변수 matchupDetail 사용
    const matchupId = matchupDetail.matchupId;
    const leaderId = matchupDetail.leaderId;

    const params = new URLSearchParams();
    params.append('matchupId', matchupId);
    params.append('leaderId', leaderId);

    hideDeleteConfirmModal();

    try {
        const response = await fetch(cpath + '/matchup/deleteMatchup', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params
        });

        const result = await response.json();

        if (result.code == 1000) { 
            showDeleteCompleteModal();
        } else {
            alert(result.message || '매치업 삭제에 실패했습니다.');
        }

    } catch (error) {
        console.error('Error during fetch:', error);
        alert('오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
    }
}


// 페이지 로드 시 이벤트 리스너 설정 
document.addEventListener("DOMContentLoaded", () => {
    const updateBtn = document.getElementById('update-btn');
    if (updateBtn) {
        updateBtn.addEventListener('click', () => {
            alert('수정 버튼이 클릭되었습니다!');
        });
    }

    const openMemberBtn = document.getElementById("select-memberlist-btn");
    if (openMemberBtn) {
        openMemberBtn.addEventListener("click", openMemberModal);
    }

    const openMentoBtn = document.getElementById("select-mentolist-btn");
    if (openMentoBtn) {
        openMentoBtn.addEventListener("click", openMentoModal);
    }
});