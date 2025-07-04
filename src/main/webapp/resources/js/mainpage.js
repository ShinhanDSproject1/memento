document.addEventListener('DOMContentLoaded', function() {
    
    const apiBaseUrl = `${CPATH}/api`;

    Promise.all([
        fetch(`${apiBaseUrl}/popular-mentors`),
        fetch(`${apiBaseUrl}/popular-menti`),
        fetch(`${apiBaseUrl}/popular-languages`)
    ])
    .then(responses => Promise.all(responses.map(res => {
        if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
        return res.json();
    })))
    .then(data => {
        const [mentorData, mentiData, languageData] = data;

        const mentorList = mentorData.result || [];
        const mentiList = mentiData.result || [];
        const languageList = languageData.result || [];

        renderUserRanking('mentor', '⭐', mentorList);
        renderUserRanking('menti', '🔥', mentiList);
        renderLanguageRanking(languageList);
    })
    .catch(error => console.error('랭킹 데이터를 불러오는 중 에러 발생:', error));
});


/**
 * 사용자(멘토/멘티) 랭킹을 그리는 범용 함수
 * @param {string} type - 'mentor' 또는 'menti'
 * @param {string} icon - 표시할 아이콘 (예: '⭐' 또는 '🔥')
 * @param {Array} data - 랭킹 데이터 배열
 */
function renderUserRanking(type, icon, data) {
    const podiumEl = document.getElementById(`${type}Podium`);
    const tableBodyEl = document.getElementById(`${type}TableBody`);
    if (!podiumEl || !tableBodyEl) return; // 요소가 없으면 함수 종료

    // 상위 1-3위 (시상대)
    const podiumOrder = [1, 0, 2];
    let podiumHtml = podiumOrder.map(index => {
        const user = data[index];
        if (!user) return '';

        const rank = index + 1;
        const rankClass = ['first', 'second', 'third'][rank - 1];
        const medal = ['🥇', '🥈', '🥉'][rank - 1];
        
        const imageUrl = user.profileImage && (user.profileImage.startsWith('http') || user.profileImage.startsWith('https'))
            ? user.profileImage
            : `${CPATH}/resources/images/main1/${user.profileImage || 'logo.png'}`;
        
        const onclickAttr = type === 'mentor' 
            ? `onclick="location.href='${CPATH}/member/detail/${user.memberId}'"` 
            : '';
        
        return `
            <div class="podium-place ${rankClass}" ${onclickAttr}>
                <div class="winner-info">
                    <div class="winner-avatar">
                        <img src="${imageUrl}" alt="${user.nickname}">
                    </div>
                    <div class="winner-name">${user.nickname}</div>
                    <div class="winner-rating">${icon} ${user.score.toFixed(1)}</div>
                </div>
                <div class="medal">${medal}</div>
                <div class="podium-base ${rankClass}">${rank}</div>
            </div>
        `;
    }).join('');
    podiumEl.innerHTML = podiumHtml;

    // 4-7위 (테이블)
    const tableData = data.slice(3, 7);
    let tableHtml = tableData.map((user, index) => {
        if (!user) return '';
        
        const imageUrl = user.profileImage && (user.profileImage.startsWith('http') || user.profileImage.startsWith('https'))
            ? user.profileImage
            : `${CPATH}/resources/images/main1/${user.profileImage || 'logo.png'}`;
        
        const onclickAttr = type === 'mentor' 
            ? `onclick="location.href='${CPATH}/member/detail/${user.memberId}'"` 
            : '';
            
        return `
            <div class="ranking-item" ${onclickAttr}>
                <div class="rank-number">${index + 4}</div>
                <div class="participant-info">
                    <div class="participant-avatar">
                        <img src="${imageUrl}" alt="${user.nickname}">
                    </div>
                    <div class="participant-name">${user.nickname}</div>
                </div>
                <div class="rating">${icon} ${user.score.toFixed(1)}</div>
            </div>
        `;
    }).join('');
    tableBodyEl.innerHTML = tableHtml;
}

function renderLanguageRanking(data) {
    const podiumEl = document.getElementById('languagePodium');
    const tableBodyEl = document.getElementById('languageTableBody');
    if (!podiumEl || !tableBodyEl) return;

    const podiumOrder = [1, 0, 2];
    let podiumHtml = podiumOrder.map(index => {
        const lang = data[index];
        if (!lang) return '';

        const rank = index + 1;
        const rankClass = ['first', 'second', 'third'][rank - 1];
        const medal = ['🥇', '🥈', '🥉'][rank - 1];

        const imageUrl = lang.languageImage && (lang.languageImage.startsWith('http') || lang.languageImage.startsWith('https'))
            ? lang.languageImage
            : `${CPATH}/resources/images/main1/${lang.languageImage || 'logo.png'}`;
        
        return `
            <div class="podium-place ${rankClass}">
                <div class="winner-info">
                    <div class="winner-avatar"><img src="${imageUrl}" alt="${lang.languageName}" class="language-icon"></div>
                    <div class="winner-name">${lang.languageName}</div>
                    <div class="winner-rating">❤️ ${lang.totalCount}</div>
                </div>
                <div class="medal">${medal}</div>
                <div class="podium-base ${rankClass}">${rank}</div>
            </div>`;
    }).join('');
    podiumEl.innerHTML = podiumHtml;
    
    const tableData = data.slice(3, 7);
    let tableHtml = tableData.map((lang, index) => {
        if (!lang) return '';
        
        const imageUrl = lang.languageImage && (lang.languageImage.startsWith('http') || lang.languageImage.startsWith('https'))
            ? lang.languageImage
            : `${CPATH}/resources/images/main1/${lang.languageImage || 'logo.png'}`;

        return `
            <div class="ranking-item">
                <div class="rank-number">${index + 4}</div>
                <div class="participant-info">
                    <div class="participant-avatar"><img src="${imageUrl}" alt="${lang.languageName}" class="language-icon"></div>
                    <div class="participant-name">${lang.languageName}</div>
                </div>
                <div class="rating">❤️ ${lang.totalCount}</div>
            </div>`;
    }).join('');
    tableBodyEl.innerHTML = tableHtml;
}