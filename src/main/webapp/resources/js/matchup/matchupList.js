function applyFilters() {
    const region = document.querySelector('select[name="regionGroup"]').value;
    const category = document.querySelector('select[name="categoryId"]').value;
    const day = document.querySelector('select[name="selectedDays"]').value;
    const language = document.querySelector('select[name="languageId"]').value;

    const queryParams = new URLSearchParams({
        regionGroup: region,
        categoryId: category,
        selectedDays: day,
        languageId: language
    });

    fetch(`${cpath}/matchup/getMatchupList?${queryParams}`)
        .then(response => response.json())
        .then(data => {
            const matchups = data.result;
            renderMatchups(matchups);
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
                <img class="_1" src="${cpath}/resources/images/profile.svg" />
                <div class="group-414">
                    <div class="rectangle-209"></div>
                    <div class="java-c">#${matchup.languageName} #${matchup.categoryName}</div>
                </div>
                <div class="badges-wrapper">
                    ${renderRecruitBadge(matchup.recruit)}
                    ${!matchup.hasMento ? '<div class="badge badge-mentor">멘토모집중</div>' : ''}
                </div>
            </div>
        `;
    });

    container.innerHTML = html;
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