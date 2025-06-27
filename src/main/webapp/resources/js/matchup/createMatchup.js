document.addEventListener('DOMContentLoaded', function () {
    /**
     * =============================================
     * Reusable Dropdown Logic
     * =============================================
     * 모든 드롭다운의 공통 기능을 처리하는 함수
     * @param {string} triggerId - 드롭다운을 여는 요소의 ID
     * @param {string} dropdownId - 드롭다운 목록(ul)의 ID
     * @param {string} displayId - 선택된 값을 보여주는 요소(span)의 ID
     * @param {string} hiddenInputId - 선택된 값을 서버로 보낼 hidden input의 ID
     */
    function initializeDropdown(triggerId, dropdownId, displayId, hiddenInputId) {
        const trigger = document.getElementById(triggerId);
        const dropdown = document.getElementById(dropdownId);
        const display = document.getElementById(displayId);
        const hiddenInput = document.getElementById(hiddenInputId);

        if (!trigger || !dropdown || !display || !hiddenInput) {
            console.error('Dropdown elements not found for:', triggerId);
            return;
        }

        trigger.addEventListener('click', (event) => {
            event.stopPropagation();
            document.querySelectorAll('.dropdown-list').forEach(d => {
                if (d.id !== dropdownId) d.classList.add('hidden');
            });
            dropdown.classList.toggle('hidden');
        });

        // 드롭다운 항목 선택
        dropdown.querySelectorAll('li').forEach(item => {
            item.addEventListener('click', () => {
                display.textContent = item.textContent;
                hiddenInput.value = item.dataset.value;
                dropdown.classList.add('hidden');
            });
        });
    }

    // 모든 드롭다운 초기화
    initializeDropdown('languageSelectBox', 'languageDropdown', 'selectedLanguage', 'languageValue');
    initializeDropdown('categorySelectBox', 'categoryDropdown', 'selectedCategory', 'categoryValue');
    initializeDropdown('sessionCountSelectBox', 'sessionCountDropdown', 'selectedSessionCount', 'sessionCountValue');
    
    // "함께 하고 싶은 유형" 드롭다운 초기화
    document.querySelectorAll('.type-dropdown-row .field-input-wrapper').forEach((wrapper, index) => {
        const trigger = wrapper.querySelector('.dropdown-trigger-box');
        const dropdown = wrapper.querySelector('.dropdown-list');
        const display = wrapper.querySelector('.selected-value-text');
        const hiddenInput = wrapper.querySelector('.preferred-type-value');
        
        // 고유 ID 부여
        trigger.id = `userTypeTrigger-${index}`;
        dropdown.id = `userTypeDropdown-${index}`;

        trigger.addEventListener('click', (event) => {
            event.stopPropagation();
            document.querySelectorAll('.dropdown-list').forEach(d => {
                if (d.id !== dropdown.id) d.classList.add('hidden');
            });
            dropdown.classList.toggle('hidden');
        });

        dropdown.querySelectorAll('li').forEach(item => {
            item.addEventListener('click', () => {
                display.textContent = item.textContent;
	            
	            if (hiddenInput) {
	                hiddenInput.value = item.dataset.value;
	            }
                dropdown.classList.add('hidden');
            });
        });
    });

    // 바깥 영역 클릭 시 모든 드롭다운 닫기
    document.addEventListener('click', () => {
        document.querySelectorAll('.dropdown-list').forEach(d => d.classList.add('hidden'));
    });


    /**
     * =============================================
     * 활동 요일 다중 선택 기능 (NEW)
     * =============================================
     */
    const daySelector = document.querySelector('.dayofweek');
    const selectedDaysInput = document.getElementById('selectedDaysInput');

    daySelector.querySelectorAll('.day').forEach(day => {
        day.addEventListener('click', () => {
            // 'selected' 클래스를 토글
            day.classList.toggle('selected');
            
            // 선택된 모든 요일의 'data-day' 값을 가져와서 배열로 만듦
            const selectedDays = Array.from(daySelector.querySelectorAll('.day.selected'))
                                      .map(d => d.dataset.day);
            
            // 배열을 콤마(,)로 구분된 문자열로 변환하여 hidden input에 저장
            selectedDaysInput.value = selectedDays.join(',');
        });
    });


    /**
     * =============================================
     * 멘토 유무 토글 버튼
     * =============================================
     */
    const mentoGroup = document.querySelector('.mento-toggle-group');
    mentoGroup.querySelectorAll('.mento-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            mentoGroup.querySelectorAll('.mento-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            document.getElementById('mentoYn').value = btn.dataset.value;
        });
    });


    /**
     * =============================================
     * contenteditable 입력 처리 (매치업명, 소개글)
     * =============================================
     */
    function setupEditableContent(divId, hiddenInputId, maxLength) {
        const editableDiv = document.getElementById(divId);
        const hiddenInput = document.getElementById(hiddenInputId);

        editableDiv.addEventListener('input', () => {
            let text = editableDiv.innerText;

            if (text.length > maxLength) {
                text = text.slice(0, maxLength);
                editableDiv.innerText = text;

                // 커서를 맨 끝으로 이동
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
	
    /**
     * =============================================
     * 매치업 생성 AJAX 요청 (NEW)
     * =============================================
     */
    const createBtn = document.getElementById('createMatchupBtn');
    
    createBtn.addEventListener('click', function() {
    	// 1. 날짜 및 시간 값 가져오기
		const startDate = document.querySelector('input[name="startDate"]').value;
		const startTime = document.querySelector('input[name="startTime"]').value;
		const endDate = document.querySelector('input[name="endDate"]').value;
		const endTime = document.querySelector('input[name="endTime"]').value;
    
    	// 2. 날짜와 시간 조합 (YYYY-MM-DDTHH:MM 형식)
	    const combinedStartDay = startDate && startTime ? `${startDate}T${startTime}` : null;
		const combinedEndDay = endDate && endTime ? `${endDate}T${endTime}` : null;
    
       	// 3. 주소 데이터 가공
	    const fullAddress = document.getElementById('roadAddress').value; // ex) "경기 성남시 분당구 판교역로 166"
	    const addressParts = fullAddress.split(' '); // 공백 기준으로 배열 생성 ["경기", "성남시", "분당구", "판교역로", "166"]
	    
	    // region_group: 앞 두 단어 (시/도) ex) "경기 성남시"
	    const regionGroup = addressParts.slice(0, 2).join(' '); 
	    
	    // region_subgroup: 나머지 주소 ex) "분당구 판교역로 166"
	    const regionSubgroup = addressParts.slice(2).join(' '); 
    
        // 3. DTO에 매핑될 JavaScript 객체 생성
		const matchupData = {
		    leaderId: 1,                // ###로그인이 아직 적용되지 않았으므로 일단 고정해놓음 ###
		    matchupCount: 0,            // 신규 생성 시 현재 신청 인원은 0이므로 설정함. 
		    kgCount: 0,                 // 신규 생성 시 킵고잉 찬성 인원은 0이므로 설정함. 
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
		    matchTypeIdFirst: parseInt(document.querySelectorAll('.preferred-type-value')[0].value, 10) || null, 
		    matchTypeIdSecond: parseInt(document.querySelectorAll('.preferred-type-value')[1].value, 10) || null,
		    matchTypeIdThird: parseInt(document.querySelectorAll('.preferred-type-value')[2].value, 10) || null, 
		    status: 'ACTIVE'
		};

        // 2. fetch API를 사용하여 서버에 POST 요청
        fetch(window.cpath + '/matchup/postCreateMatchup', { // Controller의 @PostMapping 경로와 일치
            method: 'POST',
            headers: {
                'Content-Type': 'application/json' // Body에 JSON 데이터가 담겼다고 명시
            },
            body: JSON.stringify(matchupData) // JavaScript 객체를 JSON 문자열로 변환
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('서버 응답이 올바르지 않습니다.');
            }
            // 응답 본문을 JSON으로 파싱
            return response.json(); 
        })
        .then(data => {
            // 3. 서버로부터 받은 BaseResponse 처리
            console.log('서버 응답:', data);

            // BaseResponse의 code 또는 status를 확인하여 성공 여부 판단
            if (data.code === 1000) { 
                document.getElementById('createConfirmModal').classList.remove('hidden');

                document.querySelector(".modal-close-btn").addEventListener("click", () => {
                    location.href = window.cpath + "/matchup/matchupList"; // 성공 후 이동할 페이지
                });

            } else {
                alert(data.message || '매치업 생성에 실패했습니다.');
            }
        })
        .catch(error => {
            // 네트워크 오류 등 fetch 요청 자체가 실패한 경우
            console.error('매치업 생성 요청 실패:', error);
            alert('오류가 발생했습니다. 다시 시도해주세요.');
        });
    });

    /**
     * =============================================
     * 모달 창 닫기 로직 (수정)
     * =============================================
     */

     const closeModalBtn = document.querySelector(".modal-close-btn");
     if(closeModalBtn) {
         closeModalBtn.addEventListener("click", () => {
            document.getElementById("createConfirmModal").classList.add("hidden");
         });
     }

});

/**
 * =============================================
 * 다음 주소 API (전역 함수로 유지)
 * =============================================
 */
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