$(()=>{
	fetchMentoringData();
async function fetchMentoringData() {
    // 1. 데이터를 표시할 HTML 컨테이너를 가져옵니다.
    const container = document.getElementById('mentos-list-container');
    
    // 2. API를 호출합니다. URL은 실제 환경에 맞게 수정해야 합니다.
    const API_URL = 'http://localhost:9999/memento/api/mypage/page7?memberId=2'; // 백엔드 API 엔드포인트

    try {
        const response = await fetch(API_URL);

        // HTTP 응답이 성공적이지 않으면 에러를 발생시킵니다.
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        // 3. JSON 데이터를 JavaScript 객체로 변환합니다.
        const data = await response.json();

        // 4. 실제 데이터가 담긴 `result` 배열을 가져옵니다.
        const mentosList = data.result;

        // 컨테이너를 비워줍니다 (중복 방지).
        container.innerHTML = '';

        // 5. 배열의 각 항목을 순회하며 HTML 카드를 생성합니다.
        mentosList.forEach(mentos => {
            // 카드 전체를 감싸는 div
            const card = document.createElement('div');
            card.className = 'mentos-card';

            // 멘토링 이미지
            const img = document.createElement('img');
            img.src = '/memento/'+ mentos.mentosImg;
            img.alt = mentos.mentosTitle;
            img.className = 'mentos-image';
            
            // 카드 내용 컨테이너
            const cardBody = document.createElement('div');
            cardBody.className = 'mentos-card-body';

            // 멘토링 제목
            const title = document.createElement('h3');
            title.className = 'mentos-title';
            title.textContent = mentos.mentosTitle;

            // 멘토 닉네임
            const nickname = document.createElement('p');
            nickname.className = 'mento-nickname';
            nickname.textContent = `멘토: ${mentos.mentoNickname}`;

            // 활동 시간 및 요일
            const schedule = document.createElement('p');
            schedule.className = 'mentos-schedule';
            schedule.textContent = `시간: ${mentos.startTime} ~ ${mentos.endTime} (${mentos.selectedDays})`;
            
            // 활동 지역
            const region = document.createElement('p');
            region.className = 'mentos-region';
            region.textContent = `지역: ${mentos.regionSubgroup}`;

            // 활동 상태 (active/inactive에 따라 다른 스타일 적용)
            const status = document.createElement('span');
            status.className = `mentos-status status-${mentos.status}`; // e.g., 'status-active'
            status.textContent = mentos.status === 'active' ? '진행중' : '종료';
            
            // 생성된 요소들을 카드에 추가합니다.
            cardBody.appendChild(title);
            cardBody.appendChild(nickname);
            cardBody.appendChild(schedule);
            cardBody.appendChild(region);
            cardBody.appendChild(status);

            card.appendChild(img);
            card.appendChild(cardBody);

            // 6. 완성된 카드를 컨테이너에 추가합니다.
            container.appendChild(card);
        });

    } catch (error) {
        console.error("데이터를 불러오는 중 오류 발생:", error);
        container.innerHTML = '<p>멘토링 목록을 불러올 수 없습니다.</p>';
    }
}

})
	/* 모달 관련 */
	function openModal() {
		document.getElementById("reviewModal").style.display = "flex";
	}
	function closeModal() {
		document.getElementById("reviewModal").style.display = "none";
	}

	window.addEventListener("click", function(event) {
		const modal = document.getElementById("reviewModal");
		if (event.target === modal) {
			closeModal();
		}
	});
	
	/* 별점 적용 */
	let selectedStar = 0;

	document.querySelectorAll(".star").forEach(star => {
	  star.addEventListener("click", function() {
	    selectedStar = this.getAttribute("data-value");
	    updateStars(selectedStar);
	  });
	});
	
	function updateStars(value) {
	  document.querySelectorAll(".star").forEach(star => {
	    if (star.getAttribute("data-value") <= value) {
	      star.src = window.cpath + "/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star0.svg";
	    } else {
	      star.src = window.cpath + "/resources/images/mypage/dash-board/mentos-list/vuesax-linear-star1.svg";
	    }
	  });
	}	
	
	/* 리뷰 등록 */
	function submitReview() {
	  const imageFile = document.getElementById("reviewImage").files[0];
	  const content = document.getElementById("reviewContent").value;
	
	  if(selectedStar == 0){
	    alert("별점을 선택해 주세요.");
	    return;
	  }
	  if(!content){
	    alert("내용을 입력해 주세요.");
	    return;
	  }
	
	  // 이제 여기서 formData로 서버로 전송 가능
	  const formData = new FormData();
	  formData.append("star", selectedStar);
	  formData.append("content", content);
	  if(imageFile) formData.append("image", imageFile);
	
	  // 예시 콘솔 확인
	  console.log("별점:", selectedStar);
	  console.log("내용:", content);
	  console.log("이미지:", imageFile);
	
	  // 서버로 보내려면 fetch/ajax로 전송 가능
	  closeModal();
	}
