// ===================================================================
// 모달 열기/닫기 관련 함수들
// ===================================================================

function openMemberModal() {
    document.getElementById("member-modal").style.display = "flex";
}

function closeMemberModal() {
    document.getElementById("member-modal").style.display = "none";
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
    document.getElementById("delete-complete-modal").style.display = "flex";
}

function hideDeleteCompleteModalAndRedirect() {
    document.getElementById("delete-complete-modal").style.display = "none";
    window.location.href = cpath + "/matchup/matchupList";
}


// ===================================================================
// '요청중인 멘토 보기' 버튼 클릭 시 실행되는 메인 로직
// ===================================================================
async function openMentoListModal() {
    const matchupId = matchupDetail.matchupId; // JSP에서 이미 만들어 둔 JS 객체 활용

    try {
        const response = await fetch(`${cpath}/matchup/getWaitingMentoList?matchupId=${matchupId}`);
        const result = await response.json();

        if (result.code !== 1000) { 
            alert(result.message || '멘토 목록을 불러오는데 실패했습니다.');
            return;
        }

        const mentoList = result.result; // BaseResponse의 result 필드에서 데이터 추출
        const modalListElement = document.querySelector('#mento-modal .member-list');
        
        modalListElement.innerHTML = '';

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

        // 모달창을 보여줌
        document.getElementById('mento-modal').style.display = 'flex';

    } catch (error) {
        console.error('멘토 목록 조회 중 오류 발생:', error);
        alert('오류가 발생했습니다.');
    }
}

// ===================================================================
// [신규 추가] 멘토 승인하기 버튼 클릭 시 실행되는 로직
// ===================================================================
async function handleApproveMento() {
    const selectedRadio = document.querySelector('input[name="selectedMember"]:checked');

    if (!selectedRadio) {
        alert('승인할 멘토를 선택해주세요.');
        return;
    }

    const memberId = selectedRadio.value;
    const matchupId = matchupDetail.matchupId;
    
    if (!confirm('해당 멘토를 최종 승인하시겠습니까? 승인 후에는 변경할 수 없습니다.')) {
        return;
    }

    try {
        const response = await fetch(`${cpath}/matchup/approveMento`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ matchupId, memberId })
        });
        const result = await response.json();

        if (result.code !== 1000) {
            alert(result.message || '멘토 승인에 실패했습니다.');
            return;
        }

        // --- 승인 성공 후 UI 즉시 업데이트 ---
        const approvedMento = result.result;
        
        // 1. 멘토 정보 업데이트
        document.getElementById('mento-status-text').textContent = '멘토가 선정되었어요!';
        document.getElementById('mento-profile-img').src = approvedMento.profileImageUrl || `${cpath}/resources/images/member-icon.png`;
        document.getElementById('mento-nickname').textContent = approvedMento.nickname;

        // 2. '요청중인 멘토 보기' 버튼 숨기기 또는 비활성화
        const mentoListBtn = document.getElementById('select-mentolist-btn');
        if (mentoListBtn) {
            mentoListBtn.style.display = 'none';
        }
        
        // 3. 모달 닫기
        closeMentoModal();
        alert('멘토가 최종 선정되었습니다!');

    } catch (error) {
        console.error('멘토 승인 중 오류 발생:', error);
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

    // 요청중인 멘토 보기 버튼에 새로운 함수 연결
    const openMentoBtn = document.getElementById("select-mentolist-btn");
    if (openMentoBtn) {
        openMentoBtn.addEventListener("click", openMentoListModal);
    }
    
    // 멘토 승인하기 버튼 이벤트 리스너
    const approveBtn = document.getElementById("approve-mento-btn");
    if(approveBtn) {
        approveBtn.addEventListener("click", handleApproveMento);
    }
    
});