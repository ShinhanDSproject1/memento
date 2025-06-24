$(() => {
    const placeholderMap = {
        studyType: '학습유형',
        dayofweek: '요일',
        time: '시간',
        category: '카테고리',
        languageSelect: '언어'
    };

    const baseOptions = {
        removeItemButton: true,
        placeholder: true,
        itemSelectText: '',
        searchEnabled: true
    };
    const filterIds = Object.keys(placeholderMap);
    const choicesInstances = {};

    filterIds.forEach(id => {
        const options = {
            ...baseOptions,
            placeholderValue: placeholderMap[id]
        };

        const instance = new Choices(`#${id}`, options);
        choicesInstances[id] = instance;
        document.getElementById(id).addEventListener('change', updateSelectedValues);
    });

    function updateSelectedValues() {
        const $container = $('#selectedValues');
        $container.empty();

        filterIds.forEach(id => {
            const instance = choicesInstances[id];
            const selectedItems = instance.getValue();

            selectedItems.forEach(item => {
                const span = $(
                    `<span class="selected-tag" data-id="${id}" data-value="${item.value}">
                            ${item.label} <button type="button" class="remove-tag">×</button>
                        </span>`
                );

                $container.append(span);
            });
        });
    }

    $('#selectedValues').on('click', '.remove-tag', function () {
        const $tag = $(this).parent();
        const id = $tag.data('id');
        const value = $tag.data('value');
        const instance = choicesInstances[id];

        instance.removeActiveItemsByValue(value);
        updateSelectedValues();
    });

    $("#reset-btn").on('click', function () {
        Object.values(choicesInstances).forEach(instance => {
            instance.removeActiveItems(); // 선택된 값만 제거
        });

        updateSelectedValues(); // 화면 반영
    });
    
    let myModalEl = document.getElementById('myModal');
    let myModal = new bootstrap.Modal(myModalEl);
    let myChartInstance = null;
    let isComposing = false; // 한글 조합 중인지 여부를 나타내는 플래그 (메인 스크립트로 이동)
   	
   	function sendMymessage(){
	    let myMessageValue = $("#messageValue").val(); // 이 시점에는 #messageValue가 DOM에 존재해야 합니다.
	    
	    // 줄바꿈 문자(\n)를 <br> 태그로 변경
    	// 정규식을 사용하여 모든 줄바꿈 문자를 변경합니다.
	   let formattedMessageValue = myMessageValue.replace(/(\r\n|\n|\r)/g, "<br>");
	    
	    let myMessageHTML = "<div class='mychat'><span class='chat-message'>"+formattedMessageValue+"</span><img src='/memento/resources/images/nunnu_icon.webp'></div>";
	    if(myMessageValue.trim() !== ""){
	        $("#chat").append(myMessageHTML);
	        $("#chat").scrollTop($("#chat")[0].scrollHeight);
	    }
	    	$("#messageValue").val("");
		}
    
    $(myModalEl).on("show.bs.modal",function(e){
			let contentType = $(e.relatedTarget).data("content-type");
			console.log(contentType)
			let url = ""
			
			if(contentType == "member"){
				url = "/memento/keepgoing/keepgoingmember.do"
			}else if(contentType == "register"){
				url = "/memento/keepgoing/keepgoingdetail.do"
			}	else if (contentType === "location") { // '지역' 버튼을 위한 새로운 조건 추가
            	url = "/memento/keepgoing/keepgoinglocation.do"; // 예시 URL, 실제 URL로 변경하세요.
        		$(".modal-header").css("display","flex")
        		$(".modal-footer").css("display","none")
        		$(".modal-body").addClass("modal-body-scroll");
        		$.ajax({
        			url:url,
        			success:(responseData)=>{
        				$(".modal-body").html(responseData)
        			}
        		})
        		
        		return;
        	} else {
	            console.warn("Undefined or unhandled content type. Using default behavior.");
	        }
	        
	        $(".modal-header").css("display","none")
	        $(".modal-footer").css("display","none")
			
			if(url){
				$.ajax({
					url:url,
					success:(responseData)=>{
						$(".modal-body").html(responseData)
						
						const ctx = document.getElementById('myChart');
                		const data = {
                   			labels: ['코드폭탄 해피빈','혼코딩 슬로우곰','아이디어 요정 깃요미','계획왕 컴정이','느긋한 타닥냥','목표러 코취치'],
                        datasets: [{
                            label: 'studytypes',
                            data: [10, 2, 1, 5, 6, 7],
                            backgroundColor: [
                            '#F65C00',
                            '#7797B8',
                            '#77B2E1',
                            '#526D1E',
                            '#FCB513',
                            '#AF8953',
                            ],
                            hoverOffset: 6
                        }]
                    };

                new Chart(ctx, {
                    type: 'doughnut',
                    data: data,
                });
                
                const messageValueElement = $("#messageValue")
                const sendBtnElement = $("#sendBtn")
                const updateBtnElement = $("#updateBtn")
                const deleteBtnElement = $("#deleteBtn")
                const resetBtnElement = $("#resetBtn")
                const emojiBtnElement = $("#emojiBtn")
                
                
                if (messageValueElement.length) { // #messageValue 요소가 존재하는지 확인
                    messageValueElement.off("compositionstart").on("compositionstart", function() {
                        isComposing = true;
                    })

                    messageValueElement.off("compositionend").on("compositionend", function() {
                        isComposing = false;
                    })

                    messageValueElement.off("keydown").on("keydown", function(e) {
                        if(!isComposing){
                        	if(e.key === "Enter" && !e.shiftKey){
	                        	e.preventDefault();
	                            sendMymessage();
                        	}
                        }
                    })
                    
                    resetBtnElement.on("click",()=>{
                    	messageValueElement.val("");
                    })
                    
                } else {
                    console.warn("#messageValue element not found for chat input.");
                }
                 if (sendBtnElement.length) { // #sendBtn 요소가 존재하는지 확인
                    sendBtnElement.off("click").on("click", function(){
                        sendMymessage();
                    })
                } else {
                    console.warn("#sendBtn element not found for chat send button.");
                }
                
                // 3. updateBtn 클릭 이벤트
                if (updateBtnElement.length) {
                    updateBtnElement.off("click").on("click", function(){
                        location.href='/memento/keepgoing/keepgoingupdate.do';
                    })
                } else {
                     console.warn("#updateBtn element not found.");
                }
                
                // 4. deleteBtn 클릭 이벤트
                if (deleteBtnElement.length) {
                    deleteBtnElement.off("click").on("click", function(){
                       
                    })

                } else {
                     console.warn("#updateBtn element not found.")
                }
					},
					error: (xhr, status, error) => {
                    	console.error("AJAX Error:", status, error);
                    	$(".modal-body").html("<p>콘텐츠를 불러오는 데 실패했습니다.</p>");
                	}
				})
				
				
				
			}
			else{
				$(".modal-body").empty(); // 이전에 불러온 내용이 있다면 비웁니다.
            	$(".modal-body").html("<p>불러올 콘텐츠가 지정되지 않았습니다.</p>");
			}
	})
	
	$(myModalEl).on("hide.bs.modal",function(){
    	$(".modal-body").empty();
    	if (myChartInstance) {
        	myChartInstance.destroy();
        }
        $(".modal-body").removeClass("modal-body-scroll");
    	console.log("Modal body has been cleared after modal was hidden.");
	})
	
	$("#resetBtn").on("click",function(){
    	$("#messageValue").val("")
	})

});