// ✅ 1. 지도를 그리는 함수를 분리하여 정의
function initMap(address) {
    // 카카오맵 SDK가 로드되지 않았다면 실행되지 않음
    if (typeof kakao === 'undefined' || !kakao.maps) {
        console.error("Kakao Maps SDK가 로드되지 않았습니다.");
        return;
    }

    kakao.maps.load(function () {
        const mapContainer = document.getElementById('mentosMap'); 
        
        if (!mapContainer || !address || address.trim() === '') {
            console.warn("지도 컨테이너를 찾을 수 없거나 주소 정보가 없습니다.");
            if(mapContainer) mapContainer.innerHTML = '<div style="text-align:center; padding-top: 70px; color: #888;">주소 정보가 없습니다.</div>';
            return;
        }

        const geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표 검색
        geocoder.addressSearch(address, function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
                const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                const map = new kakao.maps.Map(mapContainer, {
                    center: coords,
                    level: 3,
                });
                new kakao.maps.Marker({
                    map: map,
                    position: coords,
                });
            } else {
                console.warn('지도 주소 검색 실패:', status);
                mapContainer.innerHTML = '<div style="text-align:center; padding-top: 70px; color: #888;">지도를 불러올 수 없습니다.</div>';
            }
        });
    });
}

document.addEventListener('DOMContentLoaded', function () {
 console.log("DOMContentLoaded 실행됨?");
	const mentosId = $("body").data("mentos-id");
	const memberId = $("body").data("member-id");
	const cpath = $('body').data('cpath');
	const dayMap = {
	  MON: '월',
	  TUE: '화',
	  WED: '수',
	  THU: '목',
	  FRI: '금',
	  SAT: '토',
	  SUN: '일'
	};
	const dayOrder = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
	function convertDays(rawDays) {
	  return rawDays
	    .split(',')
	    .sort((a, b) => dayOrder.indexOf(a) - dayOrder.indexOf(b))
	    .map(code => dayMap[code])
	    .join(', ');
	}
	function goToMentoDetail(mentoId) {
    location.href = '${cpath}/mentos/mentodetail?mentoId=' + mentoId;
  }
	
	$.ajax({
	    url: `/memento/mentos/detail?mentosId=${mentosId}&memberId=${memberId}`,
	    method: 'GET',
	    success: function (data) {
	      if (data.code === 1000) {
	        const mentos = data.result;
	        document.querySelector('.class-mentor-section')?.addEventListener('click', function () {
      if (!mentos.mentoId) {
        alert('멘토 ID가 없습니다.');
        return;
      }
      location.href = `${cpath}/mentos/mentodetail?mentoId=${mentos.mentoId}`;
    });
	        
	        
	        mentoId = mentos.mentoId;
	        const template = document.getElementById('mentosCardTemplate');
			const container = document.querySelector('.mentos-all-class-row'); // 카드들이 들어가는 곳
	
	        // DOM에 데이터 뿌리기
	        $('.category').text(`#${mentos.categoryName}`);
			$('.language').text(`#${mentos.languageName}`);
	        $('.class-title').text(mentos.title);
	        $('.class-description').text(mentos.simpleContent);
	        $('#currentMemberCnt').text(mentos.currentMemberCnt);
	        $('#startDay').text(mentos.startDay);
	        $('#endDay').text(mentos.endDay);
	        $('#startTime').text(mentos.startTime);
			$('#endTime').text(mentos.endTime);

			$('.mentos-class-image').attr('src',`${cpath}/resources/uploadImage/${mentos.image}`);
			$('.location-address').text(mentos.place);
			const rawDays = mentos.selectedDays;
			const selectedCodes = rawDays.split(',');
			const sortedCodes = selectedCodes.sort((a, b) => {
			  return dayOrder.indexOf(a) - dayOrder.indexOf(b);
			});
			const displayDays = sortedCodes.map(code => dayMap[code]).join(', ');
			$('#selectedDays').text(displayDays);
			$('#times').text(mentos.times);
			$('#place').text(mentos.place);
			$('#price').text('₩'+mentos.price);
			$('.class-summary-section').text(mentos.content); 
			$('.partner-name1').text(mentos.matchTypeNameFirst);
			$('.partner-name2').text(mentos.matchTypeNameSecond);
			$('.partner-name3').text(mentos.matchTypeNameThird);
			$('.mentor-image').attr('src', mentos.mentoProfile);
			$('.mentor-name').text(mentos.mentoName);
			$('.mentor-role-label').text(mentos.userType.toLowerCase()); // 소문자 처리
			$('.mentor-type').text(mentos.matchTypeName);
			$('.vote').attr('data-rating', mentos.avgScore);

			const rating = Math.round(mentos.avgScore); // 정수로 반올림해서 단순화
			const totalStars = 5;
			let starsHTML = '';
			
			for (let i = 0; i < rating; i++) {
			  starsHTML += '<span>★</span>';
			}
			for (let i = rating; i < totalStars; i++) {
			  starsHTML += '<span>☆</span>';
			}
			
			$('.vote').html(starsHTML);
		
		  initMap(mentos.place); // 지도 생성 함수 호출
		
		  mentos.similarMentosList.forEach(item => {
		  const clone = template.cloneNode(true);
		  clone.id = ''; // id 중복 방지
		  clone.style.display = '';
		
		  // 날짜와 요일 처리
		  const rawDays = item.selectedDay.split(',');
		  const sortedDays = rawDays.sort((a, b) => dayOrder.indexOf(a) - dayOrder.indexOf(b));
		  const displayDays = sortedDays.map(d => dayMap[d]).join(', ');
		  const price = item.price === 0 ? '무료' : `₩${item.price.toLocaleString()}`;
		
		  // 텍스트 맵핑
		  clone.querySelector('#mentos-title').textContent = item.title;
		  clone.querySelector('#mento-name').textContent = item.mentoName;
		  clone.querySelector('.pre-mento').textContent = item.userType;
		  clone.querySelector('#startDay').textContent = item.startDay;
		  clone.querySelector('#endDay').textContent = item.endDay;
		  clone.querySelector('#startTime').textContent = item.startTime ;
		  clone.querySelector('#endTime').textContent = item.endTime ;
		  clone.querySelector('#days').textContent = `(${displayDays})`;
		  clone.querySelector('#place').textContent = item.regionSubGroup;
		  clone.querySelector('#price').textContent = price;
		  clone.querySelector('.remain-seat').textContent = item.remainSeat;
		
		  // 이미지 및 태그
		  clone.querySelector('.image').src = item.image;
		  clone.querySelector('.hover-title').innerHTML = item.title;
		  clone.querySelector('.hover-desc').textContent = item.simpleContent;
			clone.querySelector('.category').textContent = `#${item.categoryName}`;
			clone.querySelector('.language').textContent = `#${item.languageName}`;
		
		  // 클릭 시 상세 페이지로 이동
		  clone.setAttribute('onclick', `location.href='${cpath}/mentos/detailPage?mentosId=${item.mentosId}'`);
		
		  container.appendChild(clone);
		});
						
	      } else {
	        alert("멘토스 정보를 불러오는 데 실패했습니다.");
	      }
	    },
	    error: function (xhr, status, error) {
	      console.error("에러 발생:", error);
	      alert("서버 요청 중 오류가 발생했습니다.");
	    }
	  });
    
    
	// ⭐ 평균 별점 표시 (ex: 3.8 → ★★★★☆)
	const voteElement = document.querySelector('.vote');
	if (voteElement) {
	  const avgRating = parseFloat(voteElement.dataset.rating || '0');
	  const fullStars = Math.floor(avgRating);
	  const hasHalfStar = avgRating - fullStars >= 0.5;
	  const totalStars = 5;
	
	  voteElement.innerHTML = ''; // 초기화
	
	  for (let i = 0; i < fullStars; i++) {
	    voteElement.innerHTML += '<span>★</span>';
	  }
	
	  if (hasHalfStar) {
	    voteElement.innerHTML += '<span>☆</span>'; // 또는 반쪽별 이모지 사용 가능
	  }
	
	  const remaining = totalStars - fullStars - (hasHalfStar ? 1 : 0);
	  for (let i = 0; i < remaining; i++) {
	    voteElement.innerHTML += '<span>☆</span>';
	  }
	}

  // 1. 좋아요 기능
  document.querySelectorAll('.like-heart-btn').forEach(function (btn) {
    btn.addEventListener('click', function (e) {
      e.preventDefault();
      e.stopPropagation();
      btn.classList.toggle('liked');
    });
  });

  // 2. 삭제 버튼 클릭 시 → 팝업 표시
  const deleteBtn = document.querySelector('.mentos-delete-btn .class-apply-btn');
  const deleteModal = document.getElementById('delete-confirm-modal');

  if (deleteBtn && deleteModal) {
    deleteBtn.addEventListener('click', function () {
      deleteModal.style.display = 'flex';
    });
  }

  // 3. 취소 버튼 → 팝업 숨기기
  window.hideDeleteConfirmModal = function () {
    deleteModal.style.display = 'none';
  };

  // 4. 확인 버튼 → 삭제 API 호출 후 이동
  window.handleConfirmDelete = function () {
    const mentosId = '${mentos.mentosId}'; // JSTL에서 전달받은 멘토스 ID

    fetch(`/memento/mentos/delete?mentosId=${mentosId}`, {
      method: 'GET',
    })
      .then(response => {
        if (response.ok) {
          alert('삭제가 완료되었습니다.');
          window.location.href = '/mentos/full';
        } else {
          throw new Error('삭제 실패');
        }
      })
      .catch(error => {
        alert('삭제 중 오류가 발생했습니다: ' + error.message);
        deleteModal.style.display = 'none';
      });
  };

  
	const joinBtn = document.querySelector('.mentos-join-btn .class-apply-btn');
  const joinModal = document.getElementById('joinLayer');

  if (joinBtn && joinModal) {
    joinBtn.addEventListener('click', function () {
      joinModal.style.display = 'flex';
    });
  }

  // 3. 취소 버튼 → 팝업 숨기기
  window.hideJoinModal = function () {
    joinModal.style.display = 'none';
  };

});