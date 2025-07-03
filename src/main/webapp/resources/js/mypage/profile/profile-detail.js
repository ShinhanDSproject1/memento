$(() => {
    fetchProfileData()

    async function fetchProfileData() {
        const container = document.getElementById('profile-page')
        // 2. API를 호출합니다. URL은 실제 환경에 맞게 수정해야 합니다.
        const API_URL = 'http://localhost:9999/memento/api/mypage/profile-info'; // 백엔드 API 엔드포인트 나중에 코드 합치기 

        try {
            const response = await fetch(API_URL);
            const placeholderColor = '#d4d4d4'
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            // 3. JSON 데이터를 JavaScript 객체로 변환합니다.
            const data = await response.json();

            // 4. 실제 데이터가 담긴 `result` 배열을 가져옵니다.
            const profileData = data.result;

            console.log(profileData)

            const profileImg = document.getElementById('profile-image-input')
            profileImg.alt = '프로필 이미지'
            if (profileData.profileImgUrl) {
                if (profileData.profileImgUrl[0] == '/') {
                    profileData.src = '/mememto' + profileData.profileImgUrl
                } else {
                    profileData.src = profileData.profileImgUrl
                }
            } else {
                profileImg.src = '/memento/resources/images/logo.png'
            }

            const nickname = document.getElementById('nickname')
            nickname.textContent = `${profileData.nickName}`

            const interestNames = document.getElementById('interestNames')
            interestNames.innerHTML = ''

            const interestList = profileData.interestName.split(" ")

            if (interestList[0].trim == "") {
                interestNames.textContent = '아직 관심사가 등록되지 않았습니다...'
                interestNames.style.color = placeholderColor
            } else {
                interestList.forEach(element => {
                    const tagSpan = document.createElement('span')
                    tagSpan.className = 'form-input-text' + ' tag'
                    tagSpan.textContent = '#' + element
                    interestNames.append(tagSpan)
                });
            }

            const address = document.getElementById('address')
            console.log(profileData.location.trim())

            if (profileData.location.trim() == "") {
                address.textContent = '주소 정보가 없습니다'
                address.style.color = placeholderColor
            } else {
                address.textContent = `${profileData.location}`
            }

            const phone = document.getElementById('phone')

            if (profileData.phoneNumber.trim() == "") {
                phone.textContent = '휴대폰 번호를 등록해주세요!'
                phone.style.color = placeholderColor
            } else {
                phone.textContent = `${profileData.location}`
            }

            const introduction = document.getElementById('introduction')
            if (profileData.introduce) {
                if (profileData.introduce.trim == "") {
                    introduction.textContent = '아직 소개 정보가 등록되지 않았습니다. \n소개 정보가 없을 시 서비스 참여에 약간의 불편함이 생길 수도 있습니다...'
                    introduction.style.color = placeholderColor
                } else {
                    introduction.textContent = profileData.introduce
                }
            } else {
                introduction.textContent = '아직 소개 정보가 등록되지 않았습니다. \n소개 정보가 없을 시 서비스 참여에 약간의 불편함이 생길 수도 있습니다...'
                introduction.style.color = placeholderColor
            }

        } catch (error) {
            console.error("데이터를 불러오는 중 오류 발생:", error);
            container.innerHTML = '<p>프로필 정보를 불러올 수 없습니다...</p>';
        }
    }
})