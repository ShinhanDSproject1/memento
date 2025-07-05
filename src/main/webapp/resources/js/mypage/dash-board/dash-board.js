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

      });

      const dashMyMentosList = document.getElementById('dashMyMentosList')
      dashMyMentosList.innerHTML = ''

    } catch (error) {
      console.log(error)
    }
  }
});