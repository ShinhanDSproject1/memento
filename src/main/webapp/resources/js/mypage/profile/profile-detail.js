$(() => {
    fetchProfileData()
    // 5. 다음 주소 API
	window.execDaumPostcode = function () {
		new daum.Postcode({
			oncomplete: function (data) {
				$("#postcode").val(data.zonecode);
				$("#roadAddress").val(data.roadAddress);
				$("#detailAddress").val("");
				$("#detailAddress").focus();
				currentIdempotencyKey = null;
			}
		}).open();
	};
    const profileForm = document.getElementById('profileForm');

    profileForm.addEventListener('submit', async function (e) {
        e.preventDefault();
        const formData = new FormData();
        formData.append('nickname', document.getElementById('nickname').value)
        formData.append('interestNames', document.getElementById('interestNames').value)
        formData.append('roadAddress', document.getElementById('roadAddress').value)
        formData.append('detailAddress', document.getElementById('detailAddress').value)
        formData.append('phone', document.getElementById('phone').value)
        formData.append('introduction', document.getElementById('introduction').value)
        const imgFile = document.getElementById('profile-img').files[0]
        let originalProfileUrl = document.getElementById('original-profile-img-url').value
        //if (imgFile) {
        // formData.append('imageFile', imgFile)
        //originalProfileUrl = ''
        //}
        //formData.append("originalProfileUrl", originalProfileUrl)

        const updateUrl = '/memento/api/mypage/profile-update';
        try {
            const response = await fetch(updateUrl, {
                method: 'PUT',
                body: formData
            })

            if (response.ok) {
                const modal = document.querySelector("#submitLayer")
                const modalText = document.getElementById('updateText')
                modalText.textContent = '프로필 수정이 완료되었어요!'
                modal.classList.remove("hidden")
                modal.querySelector(".confirm-btn").addEventListener("click", function () {
                    modal.classList.add("hidden")
                    fetchProfileData()

                });
                window.location.reload()
            }
            else {
                console.error("에러 발생");
                alert("수정 실패 😢");
            }
        } catch (error) {
            console.log(error)
        }

    })
    profileForm.addEventListener('reset', async function (e) {
        // ✅ 'hidden' 클래스 제거해서 보이게 하기
        const modal = document.querySelector("#cancelLayer");
        modal.classList.remove("hidden");

        // ✅ 확인 버튼 눌렀을 때 다시 숨기고 이동
        modal.querySelector(".confirm-btn").addEventListener("click", function () {
            modal.classList.add("hidden");
            fetchProfileData()
        });
    })


    async function fetchProfileData() {
        const container = document.getElementById('profile-page')
        // 2. API를 호출합니다. URL은 실제 환경에 맞게 수정해야 합니다.
        const API_URL = 'http://localhost:9999/memento/api/mypage/profile-info';

        try {
            const response = await fetch(API_URL);

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            // 3. JSON 데이터를 JavaScript 객체로 변환합니다.
            const data = await response.json();

            // 4. 실제 데이터가 담긴 `result` 배열을 가져옵니다.
            const profileData = data.result;

            const profileImg = document.getElementById('profile-image-input')
            profileImg.alt = '프로필 이미지'
            imgUrl(profileImg, profileData.profileImgUrl)
            const profileImgValue = document.getElementById('original-profile-img-url')
            profileImgValue.value = `${profileData.profileImgUrl}`

            const nickname = document.getElementById('nickname')
            nickname.value = `${profileData.nickName}`

            const interestNames = document.getElementById('interestNames')
            interestNames.innerHTML = ''

            const interestList = profileData.interestName.split(" ")

            let intersetNameValue = ''

            if (interestList[0].trim == "") {
                interestNames.value = '아직 관심사가 등록되지 않았습니다...'

            } else {
                interestList.forEach(element => {
                    if (element != "") {
                        intersetNameValue += '#' + element + " "
                    }
                });
                interestNames.value = intersetNameValue.trim()
            }

            const roadAddress = document.getElementById('roadAddress')
			
            if (profileData.roadAddress.trim() == "") {
                roadAddress.placeholder = '주소 정보가 없습니다'
            } else {
                roadAddress.value = `${profileData.roadAddress}`
            }
            
            const detailAddress = document.getElementById('detailAddress')

            if (profileData.detailAddress.trim() == "") {
                detailAddress.placeholder = '주소 정보가 없습니다'
            } else {  	
                detailAddress.value = `${profileData.detailAddress}`
            }

            const phone = document.getElementById('phone')

            if (profileData.phoneNumber.trim() == "") {
                phone.placeholder = '휴대폰 번호를 등록해주세요! (-생략불가)'

            } else {
                phone.value = `${profileData.phoneNumber}`
            }

            const introduction = document.getElementById('introduction')
            if (profileData.introduce) {
                if (profileData.introduce.trim == "") {
                    introduction.placeholder = '아직 소개 정보가 등록되지 않았습니다. \n소개 정보가 없을 시 서비스 참여에 약간의 불편함이 생길 수도 있습니다...'

                } else {
                    introduction.value = profileData.introduce
                }
            } else {
                introduction.placeholder = '아직 소개 정보가 등록되지 않았습니다.'
            }

        } catch (error) {
            console.error("데이터를 불러오는 중 오류 발생:", error);
            container.innerHTML = '<p>프로필 정보를 불러올 수 없습니다...</p>';
        }
    }
})