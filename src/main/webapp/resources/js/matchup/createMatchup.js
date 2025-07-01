document.addEventListener('DOMContentLoaded', function () {

    //모든 드롭다운을 구조 기반으로 찾아 일괄적으로 초기화하는 단일 함수
    function initializeAllDropdowns() {
        const dropdownContainers = document.querySelectorAll('.field-input-wrapper');

        dropdownContainers.forEach(container => {
            const trigger = container.querySelector('.dropdown-trigger-box');
            const dropdownList = container.querySelector('.dropdown-list');

            if (!trigger || !dropdownList) return;

            const display = trigger.querySelector('.selected-value-text');
            const hiddenInput = container.querySelector('input[type="hidden"]');
            
            if (!display || !hiddenInput) return;

            // 드롭다운 열기/닫기 이벤트
            trigger.addEventListener('click', (event) => {
                event.stopPropagation();
                
                const isHidden = dropdownList.classList.contains('hidden');

                // 모든 드롭다운 닫기
                document.querySelectorAll('.dropdown-list').forEach(d => d.classList.add('hidden'));

                // 현재 드롭다운만 상태 토글
                if (isHidden) {
                    dropdownList.classList.remove('hidden');
                }
            });

            // 드롭다운 항목 선택 이벤트
            dropdownList.querySelectorAll('li').forEach(item => {
                item.addEventListener('click', () => {
                    display.textContent = item.textContent;
                    hiddenInput.value = item.dataset.value;
                    dropdownList.classList.add('hidden');
                });
            });
        });
    }

    // 단 한 번의 호출로 모든 드롭다운을 초기화합니다.
    initializeAllDropdowns();

    // 바깥 영역 클릭 시 모든 드롭다운 닫기
    document.addEventListener('click', () => {
        document.querySelectorAll('.dropdown-list').forEach(d => d.classList.add('hidden'));
    });

    // 활동 요일 다중 선택 기능
    const daySelector = document.querySelector('.dayofweek');
    if (daySelector) {
        const selectedDaysInput = document.getElementById('selectedDaysInput');
        daySelector.querySelectorAll('.day').forEach(day => {
            day.addEventListener('click', () => {
                day.classList.toggle('selected');
                const selectedDays = Array.from(daySelector.querySelectorAll('.day.selected'))
                                          .map(d => d.dataset.day);
                selectedDaysInput.value = selectedDays.join(',');
            });
        });
    }


    // 멘토 유무 토글 버튼
    const mentoGroup = document.querySelector('.mento-toggle-group');
    if (mentoGroup) {
        mentoGroup.querySelectorAll('.mento-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                mentoGroup.querySelectorAll('.mento-btn').forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                document.getElementById('mentoYn').value = btn.dataset.value;
            });
        });
    }


    // contenteditable 입력 처리 (매치업명, 소개글)
    function setupEditableContent(divId, hiddenInputId, maxLength) {
        const editableDiv = document.getElementById(divId);
        const hiddenInput = document.getElementById(hiddenInputId);

        if (!editableDiv || !hiddenInput) return;

        editableDiv.addEventListener('input', () => {
            let text = editableDiv.innerText;
            if (text.length > maxLength) {
                text = text.slice(0, maxLength);
                editableDiv.innerText = text;
                const range = document.createRange();
                const sel = window.getSelection();
                range.selectNodeContents(editableDiv);
                range.collapse(false);
                sel.removeAllRanges();
                sel.addRange(range);
            }
            hiddenInput.value = text.trim();
        });
    }

    setupEditableContent('matchupTitle', 'matchupTitleHidden', 30);
    setupEditableContent('matchupContent', 'matchupContentHidden', 500);
    

    // 매치업 생성 AJAX 요청
    const createBtn = document.getElementById('createMatchupBtn');
    if (createBtn) {
        createBtn.addEventListener('click', function() {
            const startDate = document.querySelector('input[name="startDate"]').value;
            const startTime = document.querySelector('input[name="startTime"]').value;
            const endDate = document.querySelector('input[name="endDate"]').value;
            const endTime = document.querySelector('input[name="endTime"]').value;
        
            const combinedStartDay = startDate && startTime ? `${startDate}T${startTime}` : null;
            const combinedEndDay = endDate && endTime ? `${endDate}T${endTime}` : null;
        
            const fullAddress = document.getElementById('roadAddress').value;
            const addressParts = fullAddress.split(' ');
            const regionGroup = addressParts.slice(0, 2).join(' ');
            const regionSubgroup = addressParts.slice(2).join(' ');
    
            const matchupData = {
                leaderId: 1, // 추후 수정 필요
                matchupCount: 0,
                kgCount: 0,
                title: document.getElementById('matchupTitleHidden').value,
                content: document.getElementById('matchupContentHidden').value,
                regionGroup: regionGroup,
                regionSubgroup: regionSubgroup,
                regionDetail: document.getElementById('detailAddress').value,
                languageId: parseInt(document.getElementById('languageValue').value, 10),
                categoryId: parseInt(document.getElementById('categoryValue').value, 10),
                hasMento: document.getElementById('mentoYn').value === 'Y',
                startDay: document.querySelector('input[name="startDate"]').value,
                endDay: document.querySelector('input[name="endDate"]').value,
                startTime: combinedStartDay,
                endTime: combinedEndDay,
                count: parseInt(document.getElementById('sessionCountValue').value, 10),
                price: parseInt(document.querySelector('input[name="price"]').value, 10) || 0,
                minMember: parseInt(document.querySelector('input[name="minMember"]').value, 10) || 1,
                maxMember: parseInt(document.querySelector('input[name="maxMember"]').value, 10) || 1,
                selectedDays: document.getElementById('selectedDaysInput').value,
                matchTypeFirst: parseInt(document.querySelectorAll('.preferred-type-value')[0].value, 10) || null,
                matchTypeSecond: parseInt(document.querySelectorAll('.preferred-type-value')[1].value, 10) || null,
                matchTypeThird: parseInt(document.querySelectorAll('.preferred-type-value')[2].value, 10) || null,
                status: 'ACTIVE'
            };

            fetch(window.cpath + '/matchup/postCreateMatchup', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(matchupData)
            })
            .then(response => {
                if (!response.ok) throw new Error('Server response was not ok.');
                return response.json();
            })
            .then(data => {
                if (data.code === 1000) {
                    document.getElementById('createConfirmModal').classList.remove('hidden');
                    document.querySelector(".modal-close-btn").addEventListener("click", () => {
                        location.href = window.cpath + "/matchup/matchupList";
                    });
                } else {
                    alert(data.message || '매치업 생성에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('매치업 생성 요청 실패:', error);
                alert('오류가 발생했습니다. 다시 시도해주세요.');
            });
        });
    }

    // * 모달 창 닫기 로직
    const closeModalBtn = document.querySelector(".modal-close-btn");
    if (closeModalBtn) {
        closeModalBtn.addEventListener("click", () => {
            document.getElementById("createConfirmModal").classList.add("hidden");
        });
    }
});


// 다음 주소 API (전역 함수로 유지)
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById('roadAddress').value = data.roadAddress;
            document.getElementById('jibunAddress').value = data.jibunAddress;
            document.getElementById('detailAddress').focus();
        }
    }).open();
}