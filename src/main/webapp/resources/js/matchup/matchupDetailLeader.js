// ===================================================================
// 모달 열기/닫기 관련 함수들
// ===================================================================

function openMemberModal() {
    document.getElementById("member-modal").style.display = "flex";
}

function closeMemberModal() {
    document.getElementById("member-modal").style.display = "none";
}

// [수정] openMentoModal 함수는 아래의 새로운 async 함수로 대체됩니다.
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
    document.getElementById("delete-complete-modal").style.display = "flex";
}

function hideDeleteCompleteModalAndRedirect() {
    document.getElementById("delete-complete-modal").style.display = "none";
    window.location.href = cpath + "/matchup/matchupList";
}


// ===================================================================
// [신규 추가] '요청중인 멘토 보기' 버튼 클릭 시 실행되는 메인 로직
// ===================================================================
async function openMentoListModal() {
    const matchupId = matchupDetail.matchupId; // JSP에서 이미 만들어 둔 JS 객체 활용

    try {
        // 1. 서버에 멘토 리스트 요청
        // Controller에서 getPendingMentos -> getWaitingMentoList 로 변경하셨으므로 URL을 수정했습니다.
        const response = await fetch(`${cpath}/matchup/getWaitingMentoList?matchupId=${matchupId}`);
        const result = await response.json();

        // [수정] isSuccess가 아닌 code 값으로 성공 여부를 판단합니다.
        if (result.code !== 1000) { 
            alert(result.message || '멘토 목록을 불러오는데 실패했습니다.');
            return;
        }

        const mentoList = result.result; // BaseResponse의 result 필드에서 데이터 추출
        const modalListElement = document.querySelector('#mento-modal .member-list');
        
        // 2. 기존 목록을 초기화
        modalListElement.innerHTML = '';

        // 3. 받아온 데이터로 목록 생성
        if (mentoList && mentoList.length > 0) {
            mentoList.forEach((mento, index) => {
                const profileImg = mento.profileImageUrl || `${cpath}/resources/images/member-icon.png`;
                const isChecked = index === 0 ? 'checked' : '';

                const mentoItemHTML = `
                    <li class="member-item">
                      <img src="${profileImg}" alt="멘토" />
                      <span>${mento.nickname}</span>
                      <input type="radio" name="selectedMember" value="${mento.memberId}" ${isChecked} />
                    </li>
                `;
                modalListElement.insertAdjacentHTML('beforeend', mentoItemHTML);
            });
        } else {
            // 신청자가 없을 경우
            modalListElement.innerHTML = '<li class="no-members">요청중인 멘토가 없습니다.</li>';
        }

        // 4. 모달창을 보여줌
        document.getElementById('mento-modal').style.display = 'flex';

    } catch (error) {
        console.error('멘토 목록 조회 중 오류 발생:', error);
        alert('오류가 발생했습니다.');
    }
}


// ===================================================================
// 매치업 삭제 관련 AJAX 통신 함수
// ===================================================================
async function handleConfirmDelete() {
    const matchupId = matchupDetail.matchupId;
    const leaderId = matchupDetail.leaderId;
    const params = new URLSearchParams();
    params.append('matchupId', matchupId);
    params.append('leaderId', leaderId);

    hideDeleteConfirmModal();

    try {
        const response = await fetch(cpath + '/matchup/deleteMatchup', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
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


// ===================================================================
// 페이지 로드 시 이벤트 리스너 설정 
// ===================================================================
document.addEventListener("DOMContentLoaded", () => {
    // 수정하기 버튼
    const updateBtn = document.getElementById('update-btn');
    if (updateBtn) {
        updateBtn.addEventListener('click', () => {
            window.location.href = cpath + "/matchup/updateMatchup?id=" + matchupDetail.matchupId;
        });
    }

    // 팀원 리스트 보기 버튼
    const openMemberBtn = document.getElementById("select-memberlist-btn");
    if (openMemberBtn) {
        openMemberBtn.addEventListener("click", openMemberModal);
    }

    // [수정] 요청중인 멘토 보기 버튼에 새로운 함수 연결
    const openMentoBtn = document.getElementById("select-mentolist-btn");
    if (openMentoBtn) {
        openMentoBtn.addEventListener("click", openMentoListModal);
    }
});