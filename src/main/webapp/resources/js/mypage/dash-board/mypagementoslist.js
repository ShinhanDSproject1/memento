
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