// 로그인 모달 닫기
function closeModal() {
    const loginModal = document.getElementById("loginModal");
    const backdrop = document.getElementById("modalBackdrop");
    if (loginModal) loginModal.style.display = "none";
    if (backdrop) backdrop.style.display = "none";
}

// 로그인 모달 열기
function openLoginModal() {
    const loginModal = document.getElementById("loginModal");
    const backdrop = document.getElementById("modalBackdrop");
    if (loginModal) loginModal.style.display = "block";
    if (backdrop) backdrop.style.display = "block";
}


// ==============
// DOMContentLoaded: 페이지 로딩 완료 후 실행
// ==============

document.addEventListener('DOMContentLoaded', function() {
    
    // ===================================
    // 1. 헤더 및 모달 이벤트 리스너 설정
    // ===================================

    // 로그인 버튼 (비로그인 상태 헤더에만 존재)
    const loginBtn = document.getElementById("loginBtn");
    if (loginBtn) {
        const loginModalCloseBtn = document.getElementById("loginModalCloseBtn");
        loginBtn.addEventListener("click", openLoginModal);
        if (loginModalCloseBtn) {
            loginModalCloseBtn.addEventListener("click", closeModal);
        }
    }

    // 알림 모달 (로그인 상태 헤더에만 존재)
    const notiBtn = document.getElementById("notification-icon");
    if (notiBtn) {
        const notiModal = document.getElementById("notificationModal");
        let notiFlag = 0;

        function closeNotiModal() {
            if (notiFlag === 1) {
                notiFlag = 0;
                notiModal.style.display = "none";
            }
        }

        function openNotiModal() {
            if (notiFlag === 1) {
                closeNotiModal();
            } else {
                notiFlag = 1;
                notiModal.style.display = "block";
            }
        }
        
        notiBtn.addEventListener("click", openNotiModal);
        // 알림 모달 외부 클릭 시 닫기
        document.body.addEventListener("click", function (e) {
            if (!notiModal.contains(e.target) && !notiBtn.contains(e.target)) {
                closeNotiModal();
            }
        });
    }

    // ===================================
    // 2. 인터셉터 리다이렉트 처리
    // ===================================
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('loginRequired') === 'true') {
        openLoginModal();
        // URL에서 파라미터를 제거하여 깔끔하게 만듭니다. (선택 사항)
        window.history.replaceState({}, document.title, window.location.pathname);
    }
    
    // ===================================
    // 3. 랭킹 API 호출 및 렌더링
    // ===================================
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


    // ===================================
    // 4. 슬라이드 배너 초기화
    // ===================================
    const slider = document.getElementById("slider");
    if (!slider || slider.children.length === 0) {
        console.warn("슬라이더 요소를 찾을 수 없거나 슬라이드 아이템이 없습니다.");
        return; // 슬라이더 요소가 없으면 여기서 실행 중단
    }

    const slides = slider.children;
    const gap = 45;
    let currentIndex = 1;
    let intervalId;

    const firstSlide = slides[0].cloneNode(true);
    const lastSlide = slides[slides.length - 1].cloneNode(true);
    slider.appendChild(firstSlide);
    slider.insertBefore(lastSlide, slides[0]);

    const itemWidth = slides[0].offsetWidth + gap;
    slider.style.transition = "none";
    slider.style.transform = `translateX(-${itemWidth}px)`;

    function slideTo(index) {
        slider.style.transition = "transform 0.5s ease";
        slider.style.transform = `translateX(-${itemWidth * index}px)`;
        currentIndex = index;
    }

    window.slideNext = function() {
        if (currentIndex < slider.children.length - 1) slideTo(currentIndex + 1);
    };

    window.slidePrev = function() {
        if (currentIndex > 0) slideTo(currentIndex - 1);
    };

    slider.addEventListener("transitionend", () => {
        if (currentIndex === slider.children.length - 1) {
            slider.style.transition = "none";
            currentIndex = 1;
            slider.style.transform = `translateX(-${itemWidth}px)`;
        }
        if (currentIndex === 0) {
            slider.style.transition = "none";
            currentIndex = slider.children.length - 2;
            slider.style.transform = `translateX(-${itemWidth * currentIndex}px)`;
        }
    });

    function startAutoSlide() {
        intervalId = setInterval(slideNext, 3000);
    }

    function stopAutoSlide() {
        clearInterval(intervalId);
    }

    const sliderWrapper = document.querySelector(".slider-wrapper");
    if (sliderWrapper) {
        sliderWrapper.addEventListener("mouseenter", stopAutoSlide);
        sliderWrapper.addEventListener("mouseleave", startAutoSlide);
        startAutoSlide();
    }
    
});

// ===================================
// 랭킹 렌더링 함수들
// ===================================

function renderUserRanking(type, icon, data) {
    const podiumEl = document.getElementById(`${type}Podium`);
    const tableBodyEl = document.getElementById(`${type}TableBody`);
    if (!podiumEl || !tableBodyEl) return;

    // 상위 1-3위
    const podiumOrder = [1, 0, 2];
    podiumEl.innerHTML = podiumOrder.map(index => {
        const user = data[index];
        if (!user) return '';
        const rank = index + 1;
        const rankClass = ['first', 'second', 'third'][rank - 1];
        const medal = ['🥇', '🥈', '🥉'][rank - 1];
        const imageUrl = user.profileImage && (user.profileImage.startsWith('http') || user.profileImage.startsWith('https'))
            ? user.profileImage : `${CPATH}/resources/images/profile/${user.profileImage || 'default-profile.png'}`;
        const onclickAttr = type === 'mentor' ? `onclick="location.href='${CPATH}/mentos/mentodetail?mentoId=${user.memberId}'"` : '';
        return `
            <div class="podium-place ${rankClass}" ${onclickAttr}>
                <div class="winner-info">
                    <div class="winner-avatar"><img src="${imageUrl}" alt="${user.nickname}"></div>
                    <div class="winner-name">${user.nickname}</div>
                    <div class="winner-rating">${icon} ${user.score.toFixed(1)}</div>
                </div>
                <div class="medal">${medal}</div>
                <div class="podium-base ${rankClass}">${rank}</div>
            </div>`;
    }).join('');

    // 4-7위
    tableBodyEl.innerHTML = data.slice(3, 7).map((user, index) => {
        if (!user) return '';
        const imageUrl = user.profileImage && (user.profileImage.startsWith('http') || user.profileImage.startsWith('https'))
            ? user.profileImage : `${CPATH}/resources/images/profile/${user.profileImage || 'default-profile.png'}`;
        const onclickAttr = type === 'mentor' ? `onclick="location.href='${CPATH}/mentos/mentodetail?mentoId=${user.memberId}'"` : '';
        return `
            <div class="ranking-item" ${onclickAttr}>
                <div class="rank-number">${index + 4}</div>
                <div class="participant-info">
                    <div class="participant-avatar"><img src="${imageUrl}" alt="${user.nickname}"></div>
                    <div class="participant-name">${user.nickname}</div>
                </div>
                <div class="rating">${icon} ${user.score.toFixed(1)}</div>
            </div>`;
    }).join('');
}


function renderLanguageRanking(data) {
    const podiumEl = document.getElementById('languagePodium');
    const tableBodyEl = document.getElementById('languageTableBody');
    if (!podiumEl || !tableBodyEl) return;

    const getLanguageImageFilename = (name) => {
        const lowerName = String(name).toLowerCase();
        switch (lowerName) {
            case 'c++': return 'cpp.png';
            case 'c#': return 'csharp.png';
            case 'html/css': return 'html-css.png';
            default: return lowerName + '.png';
        }
    };

    const podiumOrder = [1, 0, 2];
    podiumEl.innerHTML = podiumOrder.map(index => {
        const lang = data[index];
        if (!lang) return '';
        const rank = index + 1;
        const rankClass = ['first', 'second', 'third'][rank - 1];
        const medal = ['🥇', '🥈', '🥉'][rank - 1];
        const imageUrl = lang.languageImage && (lang.languageImage.startsWith('http') || lang.languageImage.startsWith('https'))
            ? lang.languageImage : `${CPATH}/resources/images/language/${getLanguageImageFilename(lang.languageName)}`;
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
    
    tableBodyEl.innerHTML = data.slice(3, 7).map((lang, index) => {
        if (!lang) return '';
        const imageUrl = lang.languageImage && (lang.languageImage.startsWith('http') || lang.languageImage.startsWith('https'))
            ? lang.languageImage : `${CPATH}/resources/images/language/${getLanguageImageFilename(lang.languageName)}`;
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
}