$(document).ready(function () {
  fetchdashboardData()

  $('#attendance-check').on('click', function () {
    if (confirm('출석체크하시겠습니까?')) {
      $(this).find('img').attr('src', basePath + '/resources/images/mypage/dash-board/vector2.svg');
    }
  });

  async function fetchdashboardData() {

    const API_URL = 'http://localhost:9999/memento/api/mypage/dashboard-data';

    try {
      const response = await fetch(API_URL);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      // 3. JSON 데이터를 JavaScript 객체로 변환합니다.
      const data = await response.json();

      // 4. 실제 데이터가 담긴 `result` 배열을 가져옵니다.
      const dashboardData = data.result;

      console.log(dashboardData)

      const dashMyMatchupList = document.getElementById('dashMyMatchupList')
      dashMyMatchupList.innerHTML = ''

      dashboardData.myMatchupDashboardList.forEach(item => {
        const itemLi = document.createElement('li')
        itemLi.className = 'dash-list__item'
        const matchupImg = document.createElement('img')
        imgUrl(matchupImg, item.leaderProfileImageUrl)
        matchupImg.className = 'dash-list__avatar'
        const myMatchupDetails = document.createElement('div')
        myMatchupDetails.className = 'dash-list__details'
        const myMatchupTitle = document.createElement('span')
        myMatchupTitle.className = 'dash-list__title-text'
        myMatchupTitle.textContent = `${item.title}`
        const myMatchupMeta = document.createElement('div')
        myMatchupMeta.className = 'dash-list__meta'
        const calendarIcon = document.createElement('img')
        calendarIcon.src = '/memento/resources/images/mypage/dash-board/icon-time-calendar-010.svg'
        calendarIcon.alt = 'Calendar'
        calendarIcon.className = "dash-list__icon"
        const myMatchupCountList = document.createElement('span')
        let myMatchupStatus
        if (item.matchStatus == 'ACTIVE') {
          myMatchupStatus = '진행 중'
        }
        else {
          myMatchupStatus = '수료'
        }
        myMatchupCountList.className = 'dash-list__meta-text'
        myMatchupCountList.textContent = `${item.currentCount} / ${item.totalCount}회 ` + myMatchupStatus

        const roleSpan = document.createElement('span')
        roleSpan.className = 'dash-list__status'
        roleSpan.textContent = `(${item.role})`

        const hasMentoIcon = document.createElement('img')
        hasMentoIcon.src = item.hasMento == true ? '/memento/resources/images/mypage/dash-board/yes-mento.svg' : '/memento/resources/images/mypage/dash-board/no-mento.svg'
        hasMentoIcon.alt = item.hasMento == true ? 'Yes Mento' : 'No Mento'

        myMatchupMeta.append(calendarIcon, myMatchupCountList)
        myMatchupDetails.append(myMatchupTitle, myMatchupMeta)
        itemLi.append(matchupImg, myMatchupDetails, roleSpan, hasMentoIcon)
        dashMyMatchupList.appendChild(itemLi)
      });

      const dashMyMentosList = document.getElementById('dashMyMentosList')
      dashMyMentosList.innerHTML = ''
      dashboardData.myMentosDashboardList.forEach(item => {
        const myMentosItem = document.createElement('li')
        myMentosItem.className = 'dash-list__item'
        const myMentosImg = document.createElement('img')
        myMentosImg.className = 'dash-list__avatar'
        imgUrl(myMentosImg, item.mentosImage)
        const myMentosDetails = document.createElement('div')
        myMentosDetails.className = 'dash-list__details'
        const myMentosTitleSpan = document.createElement('span')
        myMentosTitleSpan.className = 'dash-list__title-text'
        myMentosTitleSpan.textContent = `${item.mentosTitle}`
        const myMentosMeta = document.createElement('div')
        myMentosMeta.className = 'dash-list__meta'
        const isMento = document.createElement('img')
        isMento.className = 'dash-list__icon"'
        isMento.src = item.mentoNickname == 'Mentor' ? '/memento/resources/images/dash-board/icon-fill-type-439.svg' : '/memento/resources/images/mypage/dash-board/icon-maps-compass0.svg'
        isMento.alt = item.mentoNickname == 'Mentor' ? 'Mentor Icon' : 'Mentor'
        const mentoNickname = document.createElement('span')
        const statusSpan = document.createElement('span')
        mentoNickname.className = 'dash-list__meta-text'
        if (item.mentoNickname == 'Mentor') {
          mentoNickname.className += 'dash-list__meta-text--mentor'
          mentoNickname.textContent = 'Mentor'
          if (item.mentosStatus) {
            statusSpan.className = 'dash-list__status dash-list__status--in-progress'
            statusSpan.textContent = '현재 진행중'
          } else {
            statusSpan.textContent = '종료'
          }
        }
        else {
          mentoNickname.textContent = `${item.mentoNickname}`
          if (item.mentosStatus) {
            statusSpan.className = 'dash-list__status dash-list__status--enrolled'
            statusSpan.textContent = '수강중'
          } else {
            statusSpan.textContent = '수료'
          }
        }
        myMentosMeta.append(isMento, mentoNickname)
        myMentosDetails.append(myMentosTitleSpan, myMentosMeta)
        myMentosItem.append(myMentosImg, myMentosDetails, statusSpan)
        dashMyMentosList.appendChild(myMentosItem)
      })

      const myStudyTypeName = document.getElementById('myStudyTypeName')
      myStudyTypeName.textContent = `${dashboardData.myMatchTypeData.matchTypeName}`
      const myStudyTypeIcon = document.getElementById('myStudyTypeIcon')
      myStudyTypeIcon.src = '/memento'+`${dashboardData.myMatchTypeData.matchTypeImg}`
      myStudyTypeIcon.alt = 'sparkTest Icon' 

    } catch (error) {
      console.log(error)
    }
  }
});