// keepgoing-insert.js

$(document).ready(function() {
	function submitPost(){
    	oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
    	
    	let keepgoingName = $("#keepgoingName").val()
    	let location = $("#location").val()
    	let region = $("#region").val()
    	let selectedDaysInputs = $("#selectedDaysInput").val();
    	let activityStartTime = $("#activityStartTime").val()
    	let activityEndTime = $("#activityEndTime").val()
    	let studyType = $("#studyType").val()
    	let detailLocation = $("#detailLocation").val()
    	let editorTxt = document.getElementById("editorTxt").value
    	let category = $("#category").val()
    	let language = $("#language").val()
    	let price = $("#price").val()
    	
    	let data = {
    		keepgoingName:keepgoingName,
    		location:location,
    		region:region,
    		selectedDays: selectedDaysInputs,
    		activityStartTime:activityStartTime,
    		activityEndTime:activityEndTime,
    		studyType:studyType,
    		detailLocation:detailLocation,
    		editorTxt: editorTxt,
    		category:category,
    		language:language,
    		price:price
    	}
    	console.log(data)
    	
    	$.ajax({
    		url: "/spring/emp/keepgoingupdate.do",
    		data: JSON.stringify(data),
    		type:"PUT",
    		contentType:"application/json",
    		success:function(data){
    			console.log('success')
    		},
    		error:function(jqXHR, testStatus, errorThrown){
    			console.log(jqXHR)
    		}
    	})
    }
    
   	$("#make-btn").on("click", function (e) {
    	e.preventDefault();  // 기본 submit 막기
    	submitPost();        // AJAX 호출
	});


    // 요일 선택 로직
    const $days = $('.dayofweek .day'); // 모든 요일 li 요소 선택
    const $selectedDaysInput = $('#selectedDaysInput'); // 숨겨진 input 필드 선택
    let selectedDays = []; // 선택된 요일 코드들을 저장할 배열

    // 체크 아이콘 HTML
    const checkIcon = "<i class='fa-solid fa-check'></i>";

    // 페이지 로드 시, 숨겨진 input 필드에 값이 있다면 selectedDays 배열 초기화 및 li에 'selected' 클래스 추가
    if ($selectedDaysInput.val()) {
        selectedDays = $selectedDaysInput.val().split(','); // 콤마로 구분된 문자열을 배열로 변환
        selectedDays.forEach(dayCode => {
            $days.each(function() {
                if ($(this).data('day') === dayCode) { // data-day 속성으로 비교
                    $(this).addClass('selected');
                    // 아이콘 추가: 기존 텍스트 앞에 아이콘 추가
                    $(this).find('span').before(checkIcon);
                }
            });
        });
    }

    // 각 요일(li) 클릭 이벤트 처리
    $days.on('click', function() {
        const $this = $(this); // 클릭된 li 요소
        const dayCode = $this.data('day'); // data-day 속성 값 가져오기 (예: 'MON')

        if ($this.hasClass('selected')) {
            // 이미 선택된 경우: 선택 해제
            $this.removeClass('selected');
            // 배열에서 해당 요일 코드 제거
            selectedDays = selectedDays.filter(code => code !== dayCode);
            // 아이콘 제거: 체크 아이콘이 있다면 제거
            $this.find('.fa-solid.fa-check').remove(); // 아이콘 제거
        } else {
            // 선택되지 않은 경우: 선택
            $this.addClass('selected');
            // 배열에 해당 요일 코드 추가
            selectedDays.push(dayCode);
            // 아이콘 추가: 기존 텍스트 앞에 아이콘 추가
            $(this).find('span').before(checkIcon);
        }

        // 선택된 요일 배열을 콤마로 구분된 문자열로 만들어 숨겨진 input 필드에 저장
        $selectedDaysInput.val(selectedDays.join(','));

        // 디버깅을 위한 콘솔 출력 (개발 완료 후 제거 가능)
        console.log("선택된 요일:", $selectedDaysInput.val());
    });

    // 파일 업로드 필드 로직 (이전에 제공된 코드)
    $('#logoFile').on('change', function() {
        if (this.files && this.files.length > 0) {
            const fileName = this.files[0].name;
            $('#logoFileName').val(fileName);
        } else {
            $('#logoFileName').val('');
        }
    });
    
    $('#activityFile').on('change', function() {
        if (this.files && this.files.length > 0) {
            const activityfileName = this.files[0].name;
            $('#activityFileName').val(activityfileName);
        } else {
            $('#activityFileName').val('');
        }
    });

    // textarea 자동 높이 조절 로직 (필요하다면 추가)
    $('textarea').each(function () {
        this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
    }).on('input', function () {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
    });
    
});