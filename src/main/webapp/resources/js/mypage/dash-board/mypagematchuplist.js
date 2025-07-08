//onload
$(() => {
	fetchMatchupData()

	async function fetchMatchupData() {
		const container = document.getElementById('mypage-matchup-list');

		// 2. API를 호출합니다. URL은 실제 환경에 맞게 수정해야 합니다.
		const API_URL = 'http://localhost:9999/memento/api/mypage/mymatchup-list';

		try {
			const response = await fetch(API_URL);

			if (!response.ok) {
				throw new Error(`HTTP error! status: ${response.status}`);
			}

			// 3. JSON 데이터를 JavaScript 객체로 변환합니다.
			const data = await response.json();

			// 4. 실제 데이터가 담긴 `result` 배열을 가져옵니다.
			const matchupList = data.result;

			// 5. container(데이터 넣을 곳) 리셋
			container.innerHTML = '';

			matchupList.forEach(matchup => {
				const card = document.createElement('article')
				card.className = 'matchup-card'

				const cardContent = document.createElement('div')
				cardContent.className = 'matchup-card__content'

				//이미지
				const img = document.createElement('img')
				imgUrl(img, matchup.leaderImg)

				img.alt = 'member profile'
				img.className = 'matchup-card__avatar'

				const cardDetail = document.createElement('div')
				cardDetail.className = 'matchup-card__details';

				const cardHeader = document.createElement('header')
				cardHeader.className = 'matchup-card__header'

				const tags = document.createElement('div')
				tags.className = 'matchup-card__tags'

				//category, language
				const tagValue = document.createElement('span')
				tagValue.className = 'tag'
				tagValue.textContent = `${matchup.category} ${matchup.language}`

				//count
				const sessionCount = document.createElement('span')
				sessionCount.className = 'matchup-card__session-count'

				let keepgoingVote
				if (matchup.matchupCount == 0) {
					sessionCount.textContent = '대기중'
					sessionCount.style.color = '#8C8C8C'
				} else if (matchup.matchupCount == matchup.count) {
					sessionCount.textContent = '수료'
					sessionCount.style.color = '#F48888'
					keepgoingVote = document.createElement('button')
					keepgoingVote.className = 'btn'
					keepgoingVote.className += ' btn--keep'
					keepgoingVote.textContent = '킵고잉 찬성하기'
					keepgoingVote.addEventListener('click', () => {
						vote(matchup.memberId, matchup.matchupId, keepgoingVote)
					})
				} else {
					sessionCount.textContent = `${matchup.matchupCount}/${matchup.count}회`
				}

				const cardMain = document.createElement('div')
				cardMain.className = 'matchup-card-main'

				const linkTag = document.createElement('a')
				linkTag.href = `/memento/matchup/matchupDetail?id=${matchup.matchupId}`

				//title mentoNick
				const title = document.createElement('span')
				title.className = 'matchup-card__title'
				title.textContent = `${matchup.matchupTitle}`

				let mentoNick;
				if (matchup.hasMento) {
					mentoNick = document.createElement('span')
					mentoNick.className = 'feat'

					if (matchup.mentoNickname != null) {
						mentoNick.textContent = `(feat.${matchup.mentoNickname})`
					}
					else {
						mentoNick.textContent = '미확정'
					}
				}

				//footer
				const cardFooter = document.createElement('footer')
				cardFooter.className = 'matchup-card__footer'

				const footerMeta = document.createElement('div')
				footerMeta.className = 'matchup-card__meta'

				//schedule
				const schedule = document.createElement('span')
				schedule.className = 'matchup-card__schedule'
				//함수화 하기
				let selectedDaysArray = matchup.selectedDays.split(',');
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

				schedule.textContent = selectedDaysArray + ` ${matchup.startTime} - ${matchup.endTime}`

				//region
				const region = document.createElement('span')
				region.className = 'matchup-card__location'
				region.textContent = `${matchup.regionSubgroup}`

				//role
				const role = document.createElement('span')
				role.className = 'matchup-card__role'
				role.textContent = `${matchup.role}`
				if (matchup.role == '팀원') {
					role.className += 'matchup-card__role--member'
				} else {
					role.className += 'matchup-card__role--leader'
				}

				container.append(card)
				card.append(cardContent)
				cardContent.append(img)
				cardContent.append(cardDetail)
				cardDetail.append(cardHeader)
				cardHeader.append(tags)
				tags.append(tagValue)
				if (keepgoingVote != null) {
					tags.append(keepgoingVote)
				}
				cardHeader.append(sessionCount)
				cardDetail.append(cardMain)
				cardMain.append(linkTag)
				linkTag.append(title)
				if (matchup.hasMento) {
					cardMain.append(mentoNick)
				}
				cardDetail.append(cardFooter)
				cardFooter.append(footerMeta)
				footerMeta.append(schedule)
				footerMeta.append(region)
				cardFooter.append(role)
			})

		}
		catch (error) {
			console.error("데이터를 불러오는 중 오류 발생:", error);
			container.innerHTML = '<p>매치업 목록을 불러올 수 없습니다.</p>';
		}
	}

	function vote(memberId, matchupId, btn) {
		//투표 관련 로직 구현하기
		alert("투표완료")
		console.log(memberId) // 아직 null, 리스트에서는 5사용중 session이 아니라서...
		console.log(matchupId)
		btn.style.display = 'none'

	}

})