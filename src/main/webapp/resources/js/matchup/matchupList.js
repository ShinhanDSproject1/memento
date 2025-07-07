function applyFilters(page = 1) {
    const region = document.querySelector('select[name="regionGroup"]').value;
    const category = document.querySelector('select[name="categoryId"]').value;
    const day = document.querySelector('select[name="selectedDays"]').value;
    const language = document.querySelector('select[name="languageId"]').value;

    const queryParams = new URLSearchParams({
        page: page,
        regionGroup: region,
        categoryId: category,
        selectedDays: day,
        languageId: language
    });

    fetch(`${cpath}/matchup/getMatchupList?${queryParams}`)
        .then(response => response.json())
        .then(data => {
        	const responseData = data.result;
            renderMatchups(responseData.list); // 목록 부분 렌더링
            renderPagination(responseData.paginationResult); // 페이지 번호 부분 렌더링
        })
        .catch(error => console.error('Error:', error));
}

function renderMatchups(matchups) {
    const container = document.querySelector('.frame-3694');
    container.innerHTML = '';

    if (!matchups || matchups.length === 0) {
        container.innerHTML = '<p class="no-result">검색 결과가 없습니다.</p>';
        return;
    }

    let html = '';
    matchups.forEach(matchup => {
        html += `
            <div class="matchup-cardview" onclick="location.href='${cpath}/matchup/matchupDetail?id=${matchup.matchupId}'">
                <div class="rectangle-48"></div>
                <div class="rectangle-210"></div>
                <div class="div3">${matchup.regionGroup}</div>
                <div class="icon-time-04">
                    <img class="icon-time-clock-outlined" src="${cpath}/resources/images/icon_time.svg" />
                </div>
                <div class="_2025-06-13-2025-06-20">${matchup.formattedStartDate} - ${matchup.formattedEndDate}</div>
                <div class="_15-00-17-00">${matchup.formattedStartTime} - ${matchup.formattedEndTime}</div>
                <div class="icon-time-02">
                    <img class="icon-time-calendar-01" src="${cpath}/resources/images/icon-calendar.svg" />
                </div>
                <div class="_03-05">${matchup.formattedMemberCount}</div>
                <div class="_70-000">₩${matchup.formattedPrice}</div>
                <div class="div4">모집인원</div>
                <div class="icon-user-05">
                    <img class="user-users-group" src="${cpath}/resources/images/icon-user.svg" />
                </div>
                <div class="div5">${matchup.title}</div>
                <div class="rectangle-60"></div>
                <div class="icon-maps-04">
                    <img class="icon-maps-map-pin" src="${cpath}/resources/images/icon-map-black.svg" />
                </div>
                <img class="_1" src="${matchup.profileImageUrl || `${cpath}/resources/images/profile.svg`}" />


                <div class="group-414">
                    <div class="rectangle-209"></div>
                    <div class="java-c">#${matchup.languageName} #${matchup.categoryName}</div>
                </div>
                <div class="badges-wrapper">
                    ${renderRecruitBadge(matchup.recruit)}
                    ${renderMentoBadge(matchup)} 
                </div>
            </div>
        `;
    });

    container.innerHTML = html;
}

// 멘토 상태에 따라 다른 상태 반환
function renderMentoBadge(matchup) {
    if (!matchup.hasMento) {
        return '';
    }
    
    if (matchup.mentoId && matchup.mentoId > 0) {
        return '<div class="badge badge-mentor-completed">멘토 선정 완료</div>';
    } else {
        return '<div class="badge badge-mentor">멘토 모집중</div>';
    }
}

function renderRecruitBadge(recruitStatus) {
    if (!recruitStatus) return '';

    let badgeClass = 'badge-recruiting';
    if (recruitStatus === '마감임박') {
        badgeClass = 'badge-urgent';
    } else if (recruitStatus === '모집완료') {
        badgeClass = 'badge-completed';
    }

    return `<div class="badge ${badgeClass}">${recruitStatus}</div>`;
}

function renderPagination(paginationResult) {
    const paginationContainer = document.querySelector('.pagemove-list');
    paginationContainer.innerHTML = ''; // 기존 내용 초기화

    let html = '';
    const currentPage = paginationResult.pagination.page;

    // '이전' 버튼
    if (currentPage > 1) {
        html += `
            <div class="page-back-btn" onclick="applyFilters(${currentPage - 1})">
                <img class="vuesax-linear-arrow-left" src="${cpath}/resources/images/arrow-left.svg" />
            </div>`;
    }

	// 페이지 번호 버튼들
    for (let i = paginationResult.startPage; i <= paginationResult.endPage; i++) {
        const isSelected = i === paginationResult.pagination.page;
        const pageClass = isSelected ? 'page-li-btn-seleted-page' : 'page-li-btn';
        const textClass = isSelected ? 'd-2-b-12-white' : 'd-2-r-12-black';
        
        html += `
            <div class="${pageClass}" onclick="applyFilters(${i})">
                <div class="${textClass}">${i}</div>
            </div>`;
    }

    // '다음' 버튼
    if (currentPage < paginationResult.totalPageCount) {
        html += `
            <div class="page-after-btn" onclick="applyFilters(${currentPage + 1})">
                <img class="vuesax-linear-arrow-right" src="${cpath}/resources/images/arrow-right.svg" />
            </div>`;
    }

    paginationContainer.innerHTML = html;
}

document.addEventListener('DOMContentLoaded', () => {

});