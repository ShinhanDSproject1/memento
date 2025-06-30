// 페이지의 모든 HTML 요소가 로드된 후 스크립트를 실행
document.addEventListener("DOMContentLoaded", () => {
    initializeForm();
    setupEventListeners();
    
    const updateBtn = document.getElementById('updateMatchupBtn');
    if (updateBtn) {
        updateBtn.addEventListener('click', handleUpdate);
    }
});


// 수정 페이지 로드 시, 기존 데이터로 UI 요소들을 설정하는 함수
function initializeForm() {
    if (typeof matchupDetail === 'undefined') {
        console.error("matchupDetail 객체가 JSP에서 전달되지 않았습니다.");
        return;
    }

    // 1. 커스텀 드롭다운들의 현재 값을 화면에 표시
    updateDropdownUI('languageDropdown', 'selectedLanguage', matchupDetail.languageId);
    updateDropdownUI('categoryDropdown', 'selectedCategory', matchupDetail.categoryId);
    updateDropdownUI('sessionCountDropdown', 'selectedSessionCount', matchupDetail.totalCount); // totalCount 사용

    const typeDropdowns = document.querySelectorAll('.type-dropdown-row .field-input-wrapper');
    if (typeDropdowns.length >= 3) {
        updateDropdownUI(typeDropdowns[0].querySelector('.dropdown-list'), typeDropdowns[0].querySelector('.selected-value-text'), matchupDetail.matchTypeFirst);
        updateDropdownUI(typeDropdowns[1].querySelector('.dropdown-list'), typeDropdowns[1].querySelector('.selected-value-text'), matchupDetail.matchTypeSecond);
        updateDropdownUI(typeDropdowns[2].querySelector('.dropdown-list'), typeDropdowns[2].querySelector('.selected-value-text'), matchupDetail.matchTypeThird);
    }

    // 2. '멘토 유무' 토글 버튼의 상태를 설정
    const mentoBtns = document.querySelectorAll('.mento-btn');
    mentoBtns.forEach(btn => {
        btn.classList.remove('active'); 
        btn.classList.remove('selected');
        if (String(btn.dataset.value) === String(matchupDetail.hasMento)) {
            btn.classList.add('active'); // mento-btn은 active를 사용하므로 유지
        }
    });

    // 3. '활동 요일' 버튼들의 상태를 설정
    const dayBtns = document.querySelectorAll('.dayofweek .day');
    const selectedDaysArray = (matchupDetail.selectedDays || "").trim().split(',');
    
    dayBtns.forEach(btn => {
        btn.classList.remove('selected'); 
        if (selectedDaysArray.includes(btn.dataset.day)) {
            btn.classList.add('selected');
        }
    });
}


// 드롭다운의 현재 값을 UI에 반영하는 헬퍼 함수
function updateDropdownUI(list, displayElement, value) {
    const ul = (typeof list === 'string') ? document.getElementById(list) : list;
    const display = (typeof displayElement === 'string') ? document.getElementById(displayElement) : displayElement;

    if (!ul || !display) return;

    const selectedLi = ul.querySelector(`li[data-value="${value}"]`);

    if (selectedLi) {
        display.textContent = selectedLi.textContent;
    } else {
        display.textContent = '선택';
    }

    const wrapper = ul.closest('.field-input-wrapper');
    if (wrapper) {
        const hiddenInput = wrapper.querySelector('input[type="hidden"]');
        if (hiddenInput) {
            hiddenInput.value = value;
        }
    }
}


// 수정하기 버튼 클릭 시, 서버로 데이터를 전송하는 메인 함수
async function handleUpdate() {
    const data = collectFormData();
    if (!data.title || !data.content) {
        alert('매치업명과 소개글은 필수 항목입니다.');
        return;
    }
    try {
        const response = await fetch('/memento/matchup/updateMatchup', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        });

        // 서버의 응답을 JSON 형태로 파싱
        const result = await response.json();

        // 서버로부터 성공 응답(code: 1000)을 받았을 경우
        if (result.code === 1000) {
            const confirmModal = document.getElementById("editConfirmModal");
            
            if (confirmModal) {
                confirmModal.classList.remove('hidden');

                const closeBtn = confirmModal.querySelector('.modal-close-btn');
                if (closeBtn) {
                    closeBtn.onclick = () => {
                        window.location.href = `/memento/matchup/matchupDetail?id=${data.matchupId}`;
                    };
                }
            }
        } else {
            alert(result.message || '수정에 실패했습니다.');
        }
    } catch (error) {
        console.error('Error:', error);
        alert('오류가 발생했습니다.');
    }
}

// 폼의 모든 입력 값을 수집하여 서버로 보낼 객체 형태로 반환하는 함수
function collectFormData() {
    const roadAddr = document.getElementById('roadAddress').value;
    const addrParts = roadAddr.split(' ');
    const regionGroup = addrParts.length > 0 ? addrParts[0] : "";
    const regionSubgroup = addrParts.length > 1 ? addrParts.slice(1).join(' ') : "";

    const matchupData = {
        matchupId: document.getElementById('matchupId').value,
        title: document.getElementById('matchupTitle').innerText,
        content: document.getElementById('matchupContent').innerText,
        languageId: document.querySelector('input[name="languageId"]').value,
        categoryId: document.querySelector('input[name="categoryId"]').value,
        startDay: document.querySelector('input[name="startDay"]').value,
        endDay: document.querySelector('input[name="endDay"]').value,
        startTime: document.querySelector('input[name="startTime"]').value,
        endTime: document.querySelector('input[name="endTime"]').value,
        count: document.querySelector('input[name="count"]').value,
        selectedDays: document.querySelector('input[name="selectedDays"]').value,
        hasMento: document.querySelector('input[name="hasMento"]').value === 'true',
        price: document.querySelector('input[name="price"]').value,
        minMember: document.querySelector('input[name="minMember"]').value,
        maxMember: document.querySelector('input[name="maxMember"]').value,
        regionGroup: regionGroup,
        regionSubgroup: regionSubgroup,
        regionDetail: document.getElementById('detailAddress').value,
        matchTypeFirst: document.querySelector('input[name="matchTypeFirst"]').value,
        matchTypeSecond: document.querySelector('input[name="matchTypeSecond"]').value,
        matchTypeThird: document.querySelector('input[name="matchTypeThird"]').value,
    };
    return matchupData;
}


// 드롭다운, 버튼 등 모든 UI 요소에 클릭 이벤트를 설정하는 함수
function setupEventListeners() {

    document.querySelectorAll('.dropdown-trigger-box').forEach(box => {
        box.addEventListener('click', (e) => {
            document.querySelectorAll('.dropdown-list').forEach(list => {
                if(list !== e.currentTarget.nextElementSibling) list.classList.add('hidden');
            });
            const dropdownList = box.nextElementSibling;
            dropdownList.classList.toggle('hidden');
        });
    });
    document.querySelectorAll('.dropdown-list li').forEach(item => {
        item.addEventListener('click', (e) => {
            const wrapper = e.target.closest('.field-input-wrapper');
            if(!wrapper) return;
            const displaySpan = wrapper.querySelector('.selected-value-text');
            const hiddenInput = wrapper.querySelector('input[type="hidden"]');
            if (displaySpan) displaySpan.textContent = e.target.textContent;
            if(hiddenInput) hiddenInput.value = e.target.dataset.value;
            if(e.target.parentElement) e.target.parentElement.classList.add('hidden');
        });
    });

    // 요일 버튼 클릭 시 'selected' 클래스 토글 및 hidden input 값 변경
    document.querySelectorAll('.dayofweek .day').forEach(day => {
        day.addEventListener('click', (e) => {
            e.target.classList.toggle('selected'); // 'active' -> 'selected'
            const selectedDaysInput = document.getElementById('selectedDaysInput');
            // 'selected' 클래스를 기준으로 값 집계
            const activeDays = Array.from(document.querySelectorAll('.dayofweek .day.selected'))
                                   .map(d => d.dataset.day);
            selectedDaysInput.value = activeDays.join(',');
        });
    });
  
    // 멘토 유무 버튼 클릭 이벤트
    document.querySelectorAll('.mento-btn').forEach(btn => {
        btn.addEventListener('click', (e) => {
            const group = e.target.closest('.mento-toggle-group');
            group.querySelectorAll('.mento-btn').forEach(b => b.classList.remove('active'));
            e.target.classList.add('active');
            document.getElementById('hasMento').value = e.target.dataset.value;
        });
    });
    
    // 외부 클릭 시 드롭다운 닫기
    document.addEventListener('click', (e) => {
        if (!e.target.closest('.field-input-wrapper')) {
            document.querySelectorAll('.dropdown-list').forEach(list => {
                list.classList.add('hidden');
            });
        }
    });
}

// 다음 주소 API 실행 함수
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById('roadAddress').value = data.roadAddress;
            document.getElementById('jibunAddress').value = data.jibunAddress;
        }
    }).open();
}