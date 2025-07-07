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
        initializeFilterClickEvents();
        
        await Promise.all([
            fetchAndRenderPreMentos(),
            fetchAndRenderMentos(1) // 항상 1페이지부터 시작
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
    
    // 두 목록을 모두 새로고침 (일반 목록은 1페이지부터)
    fetchAndRenderPreMentos().catch(err => console.error("필터링된 PREMENTO 목록 로드 실패:", err));
    fetchAndRenderMentos(1).catch(err => console.error("필터링된 일반 목록 로드 실패:", err));
    
    updateFilterButtonsUI();
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
        container.innerHTML = ''; // 페이지 이동 시 항상 기존 목록을 지움

        if (mentosList && mentosList.length > 0) {
            mentosList.forEach(mentos => {
                container.insertAdjacentHTML('beforeend', createMentosCardHTML(mentos));
            });
            renderPagination(paginationInfo); // 페이지네이션 UI 렌더링
        } else {
            container.innerHTML = '<p class="no-data-message" style="width: 100%; text-align: center;">선택한 조건에 맞는 멘토스가 없습니다.</p>';
            document.getElementById('pagination-container').innerHTML = ''; // 결과 없으면 페이지 버튼도 삭제
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
    container.innerHTML = ''; // 초기화

    let paginationHtml = '';

    // '이전' 버튼
    if (paginationInfo.hasPrev) {
        paginationHtml += `<div class="page-btn prev" onclick="fetchAndRenderMentos(${paginationInfo.currentPage - 1})">&lt;</div>`;
    }

    // 페이지 번호 버튼
    for (let i = paginationInfo.startPage; i <= paginationInfo.endPage; i++) {
        paginationHtml += `
            <div class="page-btn ${i === paginationInfo.currentPage ? 'active' : ''}" onclick="fetchAndRenderMentos(${i})">
                ${i}
            </div>
        `;
    }

    // '다음' 버튼
    if (paginationInfo.hasNext) {
        paginationHtml += `<div class="page-btn next" onclick="fetchAndRenderMentos(${paginationInfo.currentPage + 1})">&gt;</div>`;
    }
    
    container.innerHTML = paginationHtml;
}


async function fetchAndRenderPreMentos() {
    console.log("PREMENTO 목록 로드를 시작합니다. 필터:", currentFilters);
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

function createMentosCardHTML(mentos) {
    const priceText = mentos.price === 0 ? '무료' : `₩${mentos.price.toLocaleString()}`;
    const priceClass = mentos.price === 0 ? 'price-free' : '';
    return `
        <div class="mentos-class-cardview mentos-hover-guide" onclick="location.href='${cpath}/mentos/detail?mentosId=${mentos.mentosId}'">
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
                <div class="frame-3778"><img class="image" src="${mentos.mentosImg ? cpath + mentos.mentosImg : cpath + '/resources/images/mentosFull/class_default.png'}" /></div>
                <div class="mentos-hover-popup"><div class="hover-inner"><div class="hover-title">${mentos.title}</div><div class="hover-desc">${mentos.subTitle}</div><div class="hover-tags"><span class="hover-tag">#${mentos.categoryName}</span><span class="hover-tag">#${mentos.languageName}</span></div></div></div>
            </div>
        </div>
    `;
}

async function loadAndRenderFilters() {
    try {
        // Promise.all에 지역(regions) API 호출 추가
        const [categoriesRes, languagesRes, matchTypesRes, regionsRes] = await Promise.all([
            fetch(`${cpath}/mentos/filters/categories`),
            fetch(`${cpath}/mentos/filters/languages`),
            fetch(`${cpath}/mentos/filters/match-types`),
            fetch(`${cpath}/mentos/filters/regions`)
        ]);

        if (!categoriesRes.ok || !languagesRes.ok || !matchTypesRes.ok || !regionsRes.ok) {
            throw new Error("하나 이상의 필터 API 호출에 실패했습니다.");
        }

        // 모든 응답에서 .result를 사용하여 실제 데이터 배열을 추출
        const categories = (await categoriesRes.json()).result;
        const languages = (await languagesRes.json()).result;
        const matchTypes = (await matchTypesRes.json()).result;
        const regions = (await regionsRes.json()).result; // <-- .result 추가

        populateDropdown('category-filter-container', '카테고리', 'categoryId', categories, 'categoryId', 'categoryName');
        populateDropdown('language-filter-container', '언어', 'languageId', languages, 'languageId', 'languageName');
        populateDropdown('matchType-filter-container', '학습유형', 'matchTypeId', matchTypes, 'matchTypeId', 'matchTypeName');
        populateDropdown('region-filter-container', '지역', 'regionGroup', regions, 'key', 'value');

    } catch (error) {
        console.error("필터 데이터 로드 또는 생성 중 오류:", error);
    }
}

function populateDropdown(containerId, buttonText, filterType, data, valueField, nameField) {
    const container = document.getElementById(containerId);
    if (!container) return;
    if (!data || data.length === 0) {
        container.style.display = 'none';
        return;
    }
    const itemsHtml = data.map(item => `<a href="#" data-filter-type="${filterType}" data-filter-value="${item[valueField]}">${item[nameField]}</a>`).join('');
    container.innerHTML = `<button class="filter-main-btn" data-default-text="${buttonText}">${buttonText}</button><div class="dropdown-content"><a href="#" data-filter-type="${filterType}" data-filter-value="">전체</a>${itemsHtml}</div>`;
}

function initializeFilterClickEvents() {
    const filterContainer = document.querySelector('.detail-select');
    if (!filterContainer) return;
    filterContainer.addEventListener('click', (e) => {
        const target = e.target;
        if (target.matches('.dropdown-content a, .filter-item')) {
            e.preventDefault();
            const filterType = target.dataset.filterType;
            const filterValue = target.dataset.filterValue;

            if (currentFilters[filterType] === filterValue || filterValue === "") {
                currentFilters[filterType] = null;
                const btn = target.closest('.filter-dropdown')?.querySelector('.filter-main-btn');
                if(btn) btn.textContent = btn.dataset.defaultText;
            } else {
                currentFilters[filterType] = filterValue;
                const btn = target.closest('.filter-dropdown')?.querySelector('.filter-main-btn');
                if(btn) {
                    if(!btn.dataset.defaultText) btn.dataset.defaultText = btn.textContent;
                    btn.textContent = target.textContent === '전체' ? btn.dataset.defaultText : target.textContent;
                }
            }
            applyFiltersAndReload();
        }
    });
}

function updateFilterButtonsUI() {
    document.querySelectorAll('.filter-item, .filter-main-btn').forEach(btn => btn.classList.remove('active'));
    for (const type in currentFilters) {
        if (currentFilters[type]) {
            const btnContainer = document.getElementById(`${type}-filter-container`);
            if (btnContainer) {
                btnContainer.querySelector('.filter-main-btn')?.classList.add('active');
            } else {
                const item = document.querySelector(`[data-filter-type="${type}"][data-filter-value="${currentFilters[type]}"]`);
                if(item) item.classList.add('active');
            }
        }
    }
}