$(() => {
    fetchProfileData()
    const profileForm = document.getElementById('profileForm');

    profileForm.addEventListener('submit', async function (e) {
        e.preventDefault
        const formData = new FormData();
        formData.append('nickname', document.getElementById('nickname').value)
        formData.append('interestNames', document.getElementById('interestNames').value)
        formData.append('address', document.getElementById('address').value)
        formData.append('phone', document.getElementById('phone').value)
        formData.append('introduction', document.getElementById('introduction').value)
        const imgFile = document.getElementById('profile-img').files[0]
        let originalProfileUrl = document.getElementById('original-profile-img-url').value()
        if (imgFile) {
            formData.append('imageFile', imgFile)
            originalProfileUrl = ''
        }
        formData.append("originalProfileUrl" ,originalProfileUrl)

        const updateUrl = '/memento/api/mypage/profile-update';
        try {
            const response = await fetch(updateUrl, {
                method: 'POST',
                body: formData
            })
            if (response.ok) {
                console.log('성공:', result);
            }
            else {
                console.log(result)
            }
        } catch (error) {
            console.log(error)
        }

    })
    profileForm.addEventListener('reset', async function (e) {
        e.preventDefault
        fetchProfileData()
    })


    async function fetchProfileData() {
        const container = document.getElementById('profile-page')
        // 2. API를 호출합니다. URL은 실제 환경에 맞게 수정해야 합니다.
        const API_URL = 'http://localhost:9999/memento/api/mypage/profile-info'; // 백엔드 API 엔드포인트 나중에 코드 합치기 

        try {
            const response = await fetch(API_URL);

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
                    intersetNameValue += '#' + element + " "
                });
                interestNames.value = intersetNameValue.trim()
            }

            const address = document.getElementById('address')
            console.log(profileData.location.trim())

            if (profileData.location.trim() == "") {
                address.placeholder = '주소 정보가 없습니다'
            } else {
                address.value = `${profileData.location}`
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
                introduction.placeholder = '아직 소개 정보가 등록되지 않았습니다. \n소개 정보가 없을 시 서비스 참여에 약간의 불편함이 생길 수도 있습니다...'

            }

        } catch (error) {
            console.error("데이터를 불러오는 중 오류 발생:", error);
            container.innerHTML = '<p>프로필 정보를 불러올 수 없습니다...</p>';
        }
    }

    function resetValue() {

    }
})