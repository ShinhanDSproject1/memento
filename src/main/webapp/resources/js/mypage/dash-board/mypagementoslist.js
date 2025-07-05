$(() => {
	fetchMentoringData();
	async function fetchMentoringData() {
		// 1. 데이터를 표시할 HTML 컨테이너를 가져옵니다.
		const container = $('#my-mentos-list');

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
				const card = document.createElement('article');
				card.className = 'mentor-card';

				// 멘토링 이미지
				const img = document.createElement('img');
				imgUrl(img, matchup.mentos.mentosImg)
				img.alt = mentos.mentosTitle;
				img.className = 'mentor-card__image';

				// 카드 내용 컨테이너
				const cardBody = document.createElement('div');
				cardBody.className = 'mentor-card__content';

				// 제목 a tag
				const titleAtag = document.createElement('a');
				titleAtag.href = '/memento/' + '/mentos/detail/mentosId=' + mentos.mentosId;

				// 멘토링 제목
				const title = document.createElement('h2');
				title.className = 'mentor-card__title';
				title.textContent = mentos.mentosTitle;

				const cardinfo = document.createElement('div');
				cardinfo.className = 'mentor-card__info';

				// 활동 시간 및 요일
				const schedule = document.createElement('span');
				schedule.className = 'mentor-card__schedule';

				let selectedDaysArray = mentos.selectedDays.split(',');
				for (let i = 0; i < selectedDaysArray.length; i++) {
					selectedDaysArray[i] = selectedDaysArray[i].trim();
					switch (selectedDaysArray[i]) {
						case "MON": selectedDaysArray[i] = '월'; break;
						case "TUE": selectedDaysArray[i] = '화'; break;
						case "WED": selectedDaysArray[i] = '수'; break;
						case "THU": selectedDaysArray[i] = '목'; break;
						case "FRI": selectedDaysArray[i] = '금'; break;
						case "SAT": selectedDaysArray[i] = '토'; break;
						case "SUN": selectedDaysArray[i] = '일'; break;
						default:
							console.log('??');
					}
				}
				console.log(selectedDaysArray);

				schedule.textContent = selectedDaysArray + ` ${mentos.startTime} ~ ${mentos.endTime}`;

				// 활동 지역
				const region = document.createElement('span');
				region.className = 'mentor-card__location';
				region.textContent = `${mentos.regionSubgroup}`;

				//status
				const statusGroup = document.createElement('div');
				statusGroup.className = 'mentor-card__status-group';

				let mentosStatus = document.createElement('span');
				mentosStatus.className = 'mentor-card__status';
				let mentosStatusText = mentos.status == 'active' ? '진행중' : '종료'
				let reviewStatus = document.createElement('span');

				if (mentosStatusText == '종료') {
					mentosStatus = document.createElement('button');
					mentosStatus.className = 'btn btn--review';

					switch (mentos.reviewStatus) {
						case 'active': reviewStatus.textContent = '리뷰수정'; mentosStatus.addEventListener('click', () => {
							openModal(mentos.mentosId, mentos.memberId, 'edit', mentos.reviewId);
						}); break;
						case 'inactive': mentosStatus.textContent = '리뷰 삭제됨'; break;
						case 'delete': mentosStatus.textContent = '리뷰 삭제됨'; break;
						default:
							reviewStatus.textContent = '리뷰 쓰기';
							mentosStatus.addEventListener('click', () => {
								openModal(mentos.mentosId, mentos.memberId, 'create', mentos.reviewId);
							});
					}

				} else {
					mentosStatus.textContent = mentosStatusText;
				}
				// 멘토 닉네임
				const mentoDiv = document.createElement('div');
				mentoDiv.className = 'mentor-card__mentor-details';
				const nickname = document.createElement('span');
				nickname.className = 'mentor-card__mentor-name';
				nickname.textContent = `${mentos.mentoNickname}`;

				//멘토 이미지
				const mentoImg = document.createElement('img');
				mentoImg.className = 'mentor-card__mentor-icon';
				mentoImg.src = '/memento/' + 'resources/images/mypage/dash-board/mentos-list/vuesax-linear-microphone0.svg';
				mentoImg.alt = 'mento icon';
				// mento or pre-mento
				const usertype = document.createElement('span')
				usertype.className = 'mento-type'
				usertype.textContent = `${mentos.mentoUserType}`

				// 생성된 요소들을 카드에 추가합니다.
				card.append(img);
				card.append(cardBody);
				cardBody.append(titleAtag);
				titleAtag.append(title);
				cardBody.append(cardinfo);
				cardinfo.append(schedule);
				cardinfo.append(region);
				cardBody.append(statusGroup);
				statusGroup.append(mentosStatus);
				mentosStatus.append(reviewStatus);
				statusGroup.append(mentoDiv);
				mentoDiv.append(mentoImg);
				mentoDiv.append(nickname);

				// 6. 완성된 카드를 컨테이너에 추가합니다.
				container.append(card);

			});

		} catch (error) {
			console.error("데이터를 불러오는 중 오류 발생:", error);
			container.innerHTML = '<p>멘토링 목록을 불러올 수 없습니다.</p>';
		}
	}

})
/* 모달 관련 */
function openModal(mentosId, memberId, actionType, reviewId) {
	const modal = document.getElementById("reviewModal");

	// 모달의 dataset에 ID들을 저장
	modal.dataset.mentosId = mentosId;
	modal.dataset.memberId = memberId;
	modal.dataset.action = actionType;
	if (reviewId) {
		modal.dataset.reviewId = reviewId;
	}

	let reviewDeleteButton = document.getElementById("review-delete-btn");
	if (modal.dataset.action == 'edit') {
		reviewDeleteButton.style.display = 'flex';
	} else {
		reviewDeleteButton.style.display = 'none';
	}
	console.log(mentosId)
	console.log(memberId)
	console.log(actionType)
	console.log(reviewId)
	modal.style.display = "flex";
}
function closeModal() {
	document.getElementById("reviewModal").style.display = "none";
}

window.addEventListener("click", function (event) {
	const modal = document.getElementById("reviewModal");
	if (event.target === modal) {
		closeModal();
	}
});

/* 별점 적용 */
let selectedStar = 5;

document.querySelectorAll(".star").forEach(star => {
	star.addEventListener("click", function () {
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
	const modal = document.getElementById("reviewModal");
	const mentosId = modal.dataset.mentosId;
	const memberId = 2;//session으로 처리
	const action = modal.dataset.action;
	if (!mentosId || !memberId) {
		alert("오류: 리뷰 대상 정보를 찾을 수 없습니다.");
		return;
	}
	const reviewImagePreview = document.getElementById('reviewImagePreview'); // 이미지 미리보기
	const imageFile = document.getElementById("reviewImage").files[0];
	const content = document.getElementById("reviewContent").value;
	console.log(mentosId)
	console.log(memberId)
	if (selectedStar == 0) {
		alert("별점을 선택해 주세요.");
		return;
	}
	if (!content) {
		alert("내용을 입력해 주세요.");
		return;
	}

	// 이제 여기서 formData로 서버로 전송 가능
	const formData = new FormData();
	formData.append("mentosId", mentosId);
	formData.append("mentiId", memberId);
	formData.append("action", action);
	formData.append("star", selectedStar);
	formData.append("content", content);
	if (imageFile) formData.append("image", imageFile);

	// 예시 콘솔 확인
	console.log("별점:", selectedStar);
	console.log("내용:", content);
	console.log("이미지:", imageFile);

	// 서버로 보내려면 fetch/ajax로 전송 가능
	closeModal();
}