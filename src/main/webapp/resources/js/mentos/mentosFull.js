// 상태 관리 전역 변수
let currentFilters = {
    regionGroup: null, matchTypeId: null, categoryId: null, languageId: null
};

// 페이지 로드 시 실행되는 메인 함수
document.addEventListener('DOMContentLoaded', async () => {
    console.log("DOM 로드 완료. 페이지 초기화를 시작합니다.");
    await initializePage();
});

/**
 * 페이지의 모든 비동기 초기화 작업을 수행하는 함수
 */
async function initializePage() {
    try {
        await loadAndRenderFilters(); 
        initializeFilterChangeEvents(); // 이벤트 핸들러를 새 함수로 교체
        
        await Promise.all([
            fetchAndRenderPreMentos(),
            fetchAndRenderMentos(1)
        ]);
        console.log("페이지 초기화 성공.");
    } catch (error) {
        console.error("페이지 초기화 중 심각한 오류 발생:", error);
    }
}

/**
 * 필터를 적용하여 '두 목록을 모두' 새로고침하는 함수
 */
function applyFiltersAndReload() {
    console.log("필터 적용 및 전체 목록 새로고침을 시작합니다.");
    
    fetchAndRenderPreMentos().catch(err => console.error("필터링된 PREMENTO 목록 로드 실패:", err));
    fetchAndRenderMentos(1).catch(err => console.error("필터링된 일반 목록 로드 실패:", err));
    
    // updateFilterButtonsUI() 호출 제거 (더 이상 필요 없음)
}

/**
 * 서버에서 일반 멘토스 목록을 가져와 렌더링하는 함수 (페이지네이션 적용)
 */
async function fetchAndRenderMentos(page = 1) {
    try {
        let requestUrl = `${cpath}/mentos?page=${page}`;
        for (const key in currentFilters) {
            if (currentFilters[key]) {
                requestUrl += `&${key}=${currentFilters[key]}`;
            }
        }
        
        const response = await fetch(requestUrl);
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
        
        const data = await response.json();
        const responseData = data.result;
        const mentosList = responseData.mentosList;
        const paginationInfo = responseData.paginationInfo;

        const container = document.getElementById('mentos-list-container');
        container.innerHTML = ''; 

        if (mentosList && mentosList.length > 0) {
            mentosList.forEach(mentos => {
                container.insertAdjacentHTML('beforeend', createMentosCardHTML(mentos));
            });
            renderPagination(paginationInfo);
        } else {
            container.innerHTML = '<p class="no-data-message" style="width: 100%; text-align: center;">선택한 조건에 맞는 멘토스가 없습니다.</p>';
            document.getElementById('pagination-container').innerHTML = '';
        }
    } catch (error) {
        console.error('멘토스 목록을 불러오는 데 실패했습니다:', error);
        document.getElementById('mentos-list-container').innerHTML = '<p class="error-message" style="width: 100%; text-align: center;">데이터를 불러오는 중 오류가 발생했습니다.</p>';
    }
}

/**
 * 페이지네이션 버튼을 그리는 함수
 */
function renderPagination(paginationInfo) {
    const container = document.getElementById('pagination-container');
    if (!container) return;
    container.innerHTML = '';

    let paginationHtml = '';

   // 이전(<) 버튼 (매치업 스타일 적용)
    if (paginationInfo.hasPrev) {
        paginationHtml += `
            <div class="page-back-btn" onclick="fetchAndRenderMentos(${paginationInfo.currentPage - 1})">
                <img class="vuesax-linear-arrow-left" src="${cpath}/resources/images/arrow-left.svg" />
            </div>
        `;
    }

    // 페이지 번호 버튼 (매치업 스타일 적용)
    for (let i = paginationInfo.startPage; i <= paginationInfo.endPage; i++) {
        const isActive = (i === paginationInfo.currentPage);
        const pageBtnClass = isActive ? 'page-li-btn-seleted-page' : 'page-li-btn';
        const textClass = isActive ? 'd-2-b-12-white' : 'd-2-r-12-black';

        paginationHtml += `
            <div class="${pageBtnClass}" onclick="fetchAndRenderMentos(${i})">
                <div class="${textClass}">${i}</div>
            </div>
        `;
    }

    // 다음(>) 버튼 (매치업 스타일 적용)
    if (paginationInfo.hasNext) {
        paginationHtml += `
            <div class="page-after-btn" onclick="fetchAndRenderMentos(${paginationInfo.currentPage + 1})">
                <img class="vuesax-linear-arrow-right" src="${cpath}/resources/images/arrow-right.svg" />
            </div>
        `;
    }
    
    container.innerHTML = paginationHtml;
}


/**
 * PREMENTO 목록을 가져와 렌더링하는 함수
 */
async function fetchAndRenderPreMentos() {
    try {
        let requestUrl = `${cpath}/mentos/premento-list?`;
        for (const key in currentFilters) {
            if (currentFilters[key]) {
                requestUrl += `${key}=${currentFilters[key]}&`;
            }
        }
        const response = await fetch(requestUrl);
        if (!response.ok) throw new Error(`PREMENTO 목록 응답 실패: ${response.status}`);
        const data = await response.json();
        const preMentoList = data.result;
        const container = document.getElementById('premento-list-container');
        if (!container) return;
        container.innerHTML = '';
        container.style.display = 'flex';
        if (preMentoList && preMentoList.length > 0) {
            preMentoList.forEach(mentos => {
                container.insertAdjacentHTML('beforeend', createMentosCardHTML(mentos));
            });
        } else {
            container.innerHTML = '<p class="no-data-message" style="width:100%; text-align:center;">조건에 맞는 무료 강의가 없습니다.</p>';
        }
    } catch (error) {
        console.error("PREMENTO 목록을 불러오는 데 실패했습니다:", error);
    }
}

/**
 * 멘토스 카드 HTML을 생성하는 함수
 */
function createMentosCardHTML(mentos) {
    const priceText = mentos.price === 0 ? '무료' : `₩${mentos.price.toLocaleString()}`;
    const priceClass = mentos.price === 0 ? 'price-free' : '';
    const imageFileName = mentos.mentosImg;
    const imageUrl = imageFileName 
        ? `${cpath}/resources/uploadImage/${imageFileName}` 
        : `${cpath}/resources/images/mentosFull/class_default.png`;

    return `
        <div class="mentos-class-cardview mentos-hover-guide" onclick="location.href='${cpath}/mentos/detailPage?mentosId=${mentos.mentosId}'">
            <div class="mentos-class">
                <div class="mentos-text">
                    <div class="frame-37862"><div class="frame-413"><div class="d">D-</div><div class="d">${mentos.daysBetween}</div></div><div class="frame-414"><div class="d">${mentos.remainMemberCnt}</div></div></div>
                    <div class="aws">${mentos.title}</div>
                    <div class="frame-406">
                        <div class="frame-407"><img class="user-user" src="${cpath}/resources/images/mentosFull/mento.svg" /><div class="text">${mentos.mentoName}</div><div class="group-371"><div class="rectangle-279"></div><div class="mento">${mentos.mentoType}</div></div></div>
                        <div class="frame-408"><img class="icon-time-calendar" src="${cpath}/resources/images/mentosFull/day.svg" /><div class="text">${mentos.startDay.substring(0, 10)}</div><div class="text">-</div><div class="text">${mentos.endDay.substring(0, 10)}</div></div>
                        <div class="frame-409"><img class="icon-time-clock-outlined" src="${cpath}/resources/images/mentosFull/time.svg" /><div class="text">${mentos.startTime} - ${mentos.endTime}</div></div>
                        <div class="frame-410"><img class="icon-maps-map-pin" src="${cpath}/resources/images/mentosFull/maps.svg" /><div class="text">${mentos.location}</div></div>
                        <div class="frame-3659"><div class="_45-000 ${priceClass}">${priceText}</div></div>
                    </div>
                </div>
                <div class="frame-3778">
                    <img class="image" src="${imageUrl}" />
                </div>
                <div class="mentos-hover-popup"><div class="hover-inner"><div class="hover-title">${mentos.title}</div><div class="hover-desc">${mentos.subTitle}</div><div class="hover-tags"><span class="hover-tag">#${mentos.categoryName}</span><span class="hover-tag">#${mentos.languageName}</span></div></div></div>
            </div>
        </div>
    `;
}

/**
 * 서버에서 필터 데이터를 가져와 <select> UI를 렌더링하는 함수
 */
async function loadAndRenderFilters() {
    try {
        const [categoriesRes, languagesRes, matchTypesRes, regionsRes] = await Promise.all([
            fetch(`${cpath}/mentos/filters/categories`),
            fetch(`${cpath}/mentos/filters/languages`),
            fetch(`${cpath}/mentos/filters/match-types`),
            fetch(`${cpath}/mentos/filters/regions`)
        ]);

        if (![categoriesRes, languagesRes, matchTypesRes, regionsRes].every(res => res.ok)) {
            throw new Error("하나 이상의 필터 API 호출에 실패했습니다.");
        }

        const categories = (await categoriesRes.json()).result;
        const languages = (await languagesRes.json()).result;
        const matchTypes = (await matchTypesRes.json()).result;
        const regions = (await regionsRes.json()).result;

        const filterContainer = document.querySelector('.detail-select');
        if (!filterContainer) {
            console.error("'.detail-select' 컨테이너를 찾을 수 없습니다.");
            return;
        }
        
        filterContainer.innerHTML = ''; // 컨테이너 초기화
        
        // 각 필터 HTML을 생성하여 컨테이너에 추가
        filterContainer.insertAdjacentHTML('beforeend', createSelectFilterHTML('지역', 'regionGroup', regions, 'key', 'value'));
        filterContainer.insertAdjacentHTML('beforeend', createSelectFilterHTML('학습유형', 'matchTypeId', matchTypes, 'matchTypeId', 'matchTypeName'));
        filterContainer.insertAdjacentHTML('beforeend', createSelectFilterHTML('언어', 'languageId', languages, 'languageId', 'languageName'));
        filterContainer.insertAdjacentHTML('beforeend', createSelectFilterHTML('카테고리', 'categoryId', categories, 'categoryId', 'categoryName'));
        
    } catch (error) {
        console.error("필터 데이터 로드 또는 생성 중 오류:", error);
    }
}

/**
 * <select> 필터 HTML 문자열을 생성하는 헬퍼 함수
 */
function createSelectFilterHTML(buttonText, filterType, data, valueField, nameField) {
    if (!data || data.length === 0) return ''; 

    const optionsHtml = data.map(item => 
        `<option value="${item[valueField]}">${item[nameField]}</option>`
    ).join('');

    return `
        <div class="detail-select-li">
            <select name="${filterType}" class="filter-select">
                <option value="">${buttonText} (전체)</option>
                ${optionsHtml}
            </select>
        </div>
    `;
}

/**
 * 필터 <select>의 'change' 이벤트를 초기화하는 함수
 */
function initializeFilterChangeEvents() {
    const filterContainer = document.querySelector('.detail-select');
    if (!filterContainer) return;

    filterContainer.addEventListener('change', (e) => {
        const target = e.target;
        if (target.matches('.filter-select')) {
            const filterType = target.name;
            const filterValue = target.value;

            currentFilters[filterType] = filterValue || null;
            
            applyFiltersAndReload();
        }
    });
}