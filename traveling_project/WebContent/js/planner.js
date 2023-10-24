$(document).ready(function() {
	
	// 전역 변수로 데이터 복사본을 보관할 객체를 생성
	var originalData = {};

	// 수정 버튼 클릭 시
	$("#modi_btn").click(function() {
		$("#modi_btn").hide();
		$("#can_btn").hide();
		$("#modi_save_btn").show();
		$("#modi_can_btn").show();
		$(".days_btn button").show();
		$(".dsch input").prop("disabled", false);
	});

	// 수정 -> 취소 버튼 클릭 시
	$("#modi_can_btn").click(function() {
		if (confirm("저장되지 않은 정보는 삭제됩니다. 취소하시겠습니까?")) {
			$("#modi_btn").show();
			$("#can_btn").show();
			$("#modi_save_btn").hide();
			$("#modi_can_btn").hide();
			$(".days_btn button").hide();
			$(".dsch input").prop("disabled", true);
		}
	});

	// close 버튼 (X) 또는 종료 버튼 클릭 시
	$(".close_btn, #can_btn").click(function() {
		if (confirm("저장되지 않은 정보는 삭제됩니다. 종료하시겠습니까?")) {
			$(".planner_modal_wrap").hide();
			$("#modi_btn").show();
			$("#can_btn").show();
			$("#modi_save_btn").hide();
			$("#modi_can_btn").hide();
			$('body').css('overflow', 'auto');
			$("#date_tabs").empty();
			history.pushState(null, null, window.location.href.split('#')[0]); // 모달창을 닫으면 url에 남아있던 브라우저 기록을 지워줌
		}
	});
	
	// 저장 버튼 클릭 시
	$("#modi_save_btn").click(function() {
		if (confirm("저장하시겠습니까?")) {
		$("#modi_btn").show();
		$("#can_btn").show();
		$("#modi_save_btn").hide();
		$("#modi_can_btn").hide();
		$(".days_btn button").hide();
		$(".dsch input").prop("disabled", true);
		// INSERT 할 때 필요한 plan_id 값을 가져옴
        var pid = $("#pid_hidden").val();
        
		$.ajax({
			url: "delete_plan.condb?comm=delPlan",
			method: "POST",
			data: {
				pid : pid
			},
			success: function(res) {
				console.log("삭제 성공" + res);
				/* 비동기 방식으로 데이터 처리할 예정 */
				$(".dsch").each(function() {
			        var schedule = $(this);

			        // 특정 .dsch 요소 안에서 필드 값을 가져옵니다.
			        var pdate = schedule.find(".pdate").val();
			        var pst = schedule.find(".pst").val();
			        var pet = schedule.find(".pet").val();
			        var pcon = schedule.find(".pcon").val();
			        
			        $.ajax({
			        	url: "insert_plan.condb?comm=insPlan",
			        	method: "POST",
			        	data: {
			        		pid : pid,
			        		pdate : pdate,
			        		pst : pst,
			        		pet : pet,
			        		pcon : pcon
			        	},
			        	success: function(res) {
			        		console.log("입력 성공" + res);
			        	}
			        });  
			    });
			}
		});
		alert("저장되었습니다.");

		}
		
	});
	
	// 이벤트 위임을 사용하여 "추가하기" 버튼 클릭 이벤트 처리
    $(".tab_list").on("click", ".add_schedule", function() {
        var activeTab = $(".tabDay.is_on");
        var tabId = activeTab.attr("data-tab");

        // 현재 선택된 탭에서 이미 추가된 스케줄의 개수를 계산
        var existingSchedules = $("#" + tabId).find(".schedule > div").length;

        // 현재 탭에서 스케줄의 개수에 1을 더해 "currentDay" 값을 설정
        currentDay = existingSchedules + 1;

        if (currentDay > 10) {
            return; // 더 이상 스케줄을 추가하지 않음
        }

        addScheduleToActiveTab(activeTab, currentDay);
    });
    
    // 체크박스로 삭제
    $(".tab_list").on("click", ".del_schedule", function () {
        // 삭제할 스케줄 요소를 모두 선택
        var schedulesToDelete = $(".tabDay.is_on").find(".delete_box:checked").closest(".dsch");

        // 선택한 스케줄 삭제
        schedulesToDelete.remove();
        
        // 스케줄 번호를 다시 업데이트
        var tabId = $(".tabDay.is_on").attr("data-tab");

        // 남은 항목들을 재배열
        var tabNumber = 1;
        
        // 이미지 파일 이름 생성
        var imageFileName = tabNumber + "_" + tabId;
        
        $("#" + tabId).find(".dsch").each(function() {
        	// 클래스 이름 숫자 변경
        	var schedule = $(this);
            var currentClass = schedule.attr("class");
            var newClass = currentClass.replace(/detail_sch\d+/, "detail_sch" + tabNumber);
            schedule.attr("class", newClass);
            // 이미지 파일 변경
            var imgTag = $(this).find("img");
            var imageFileName = tabNumber + "_" + tabId;
            imgTag.attr("src", "images/number/" + imageFileName + ".png");
            tabNumber++;
        });
    });

});

// 상세보기 버튼 클릭
function detail_plan(event) {
	// 클릭한 상세보기 버튼 요소를 선택
	var $button = $(event.target);

	// 클릭한 상세보기 버튼이 속한 ul 요소를 찾기 위해 가장 가까운 부모 ul을 선택
	var $reservationInfo = $button.closest("ul.planner_list");

	// data-plan_id 속성 값을 가져옴
	var planId = $button.data("plan_id");
	
	// 모달 열기
    $('.planner_modal_wrap').show();
    $('body').css('overflow', 'hidden');
    
    var countDays = parseInt($reservationInfo.find(".planner_trip_date").data("days_count"), 10);
	
	// .planner_trip_date 클래스를 가진 요소의 텍스트 가져오기
	var tripDateText = $reservationInfo.find(".planner_trip_date").text();

	// "체크인 날짜 ~ 체크아웃 날짜" 형식의 텍스트를 공백 문자(~)로 분리
	var dateParts = tripDateText.split("~");

	// 체크인 날짜 추출하고 공백을 제거
	var checkInDateStr = dateParts[0].trim();

	// 체크인 날짜를 JavaScript Date 객체로 변환
	var checkInDate = new Date(checkInDateStr);

	// 체크인 날짜를 사용하여 탭을 동적으로 생성하고 체크인 날짜를 추가
	var tabnum = "";
	var newSchedule = "";
	for (var i = 0; i < countDays; i++) {
	    var j = i + 1;
	    tabnum = "<li class='tabDay' data-tab='day" + j + "'>"
	        + "<a href='#day" + j + "' class='tab_btn'>" + j + "일차</a>"
	        + "<div id='day" + j + "' class='tab_cont'>"
	        + "<p class='plan_days'>" + j + "일차 <span class='ndate'>" + formatCheckinDate(checkInDate) + "</span>"
	        + "<div class='days_btn'><button type='button' class='add_schedule'>추가하기</button>"
	        + "<button type='button' class='del_schedule'>삭제하기</button></div></p>"
	        + "<div class='schedule sch" + j + "'></div></div>";
	    $(".tab_list").append(tabnum);
	    if (j == 1) {
			$(".tabDay").addClass("is_on");
		}
	    
	    // 클로저를 사용하여 현재 반복 변수 'j'를 보존
	    (function (currentTab) {
	        // AJAX 요청을 수행
	        $.ajax({
	            url: "planner.condb?comm=plan_sel",
	            method: "POST",
	            data: {
	                planId: planId,
	                planDate: formatCheckinDate(checkInDate)
	            },
	            success: function (response) {
	                response = $(response);

	                for (var x = 0; x < response.size(); x++) {
	                    var a = 1;
	                    var pdate = response.find("#ajax_pdate" + x).html();
	                    var pst = response.find("#ajax_pst" + x).html();
	                    var pet = response.find("#ajax_pet" + x).html();
	                    var pcont = response.find("#ajax_pcont" + x).html();

	                    var newSchedule = '<div class="dsch detail_sch' + (x + 1) + '">' +
	                    	'<input type="hidden" class="pdate" value="' + pdate + '">' +
	                        '<img src="images/number/' + (x + 1) + '_day' + currentTab + '.png" alt="" width="36px" height="36px">' +
	                        '<input type="time" class="pst" value="' + pst + '"> ~ <input type="time" class="pet" value ="' + pet + '"><br>' +
	                        '<input type="checkbox" class="delete_box" name="delete_box">' +
	                        '<input type="text" class="pcon" maxlength="100" value="' + pcont + '">' +
	                        '</div>';

	                    $(".schedule.sch" + currentTab).append(newSchedule);

	                }

	                $(".dsch input").prop("disabled", true);
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                // 에러 처리
	                console.error("AJAX 오류:", textStatus, errorThrown);
	            }
	        });
	    })(j); // 클로저로 'j' 변수 보존
	    
	    // 하루씩 늘리기
	    checkInDate.setDate(checkInDate.getDate() + 1);
	}

	function formatCheckinDate(date) {
	    // 날짜를 "yyyy-MM-dd" 형식으로 포맷팅
	    return date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
	}
	
	// 탭 버튼
	$("ul.tab_list li").click(function() {
		var activeTab = $(this).attr("data-tab"); // ex) day1
		$("ul.tab_list li").removeClass("is_on");
		$(".tab_cont").removeClass("is_on");
		$(this).addClass("is_on");
		$("#" + activeTab).addClass("is_on");
		
		// 버튼 활성화 여부 설정
        var activeTabSchedules = $("#" + activeTab).find(".schedule > div").length;
        if (activeTabSchedules >= 10) {
            $(".add_schedule").prop("disabled", true);
            $(".add_schedule").css({
                "cursor": "auto",
                "background-color": "#E9E9E9"
            });
        } else {
            $(".add_schedule").prop("disabled", false);
            $(".add_schedule").css({
                "cursor": "pointer",
                "background-color": "#007BFF"
            });
        }
	});

	// ul 요소 내에서 이미 가져온 데이터를 읽음
	var stayName = $reservationInfo.find(".p_stay_name").text();
	var chkDate = $reservationInfo.find(".planner_trip_date").text();

	// 모달에 예약 정보 추가
    $("#pid_hidden").val(planId);
	$("#pm_header p").text(stayName);
	$("#pm_header span").text(chkDate);

	// 모달 열기
	$('.planner_modal_wrap').show();
	$('body').css('overflow', 'hidden');
	
}

// 일정 추가하기 버튼 - 함수
function addScheduleToActiveTab(activeTab, currentDay) {
    activeTab = $(activeTab); // JavaScript DOM 요소를 jQuery 객체로 변환

    // 선택된 탭에 대한 일정을 추가
    var tabId = activeTab.attr("data-tab");
    var pdate = activeTab.find(".ndate").html();
    var tabNumber = currentDay;

    // 이미지 파일 이름 생성
    var imageFileName = tabNumber + "_" + tabId;

    var newSchedule = '<div class="dsch detail_sch' + tabNumber + '">' +
    	'<input type="hidden" class="pdate" value="' + pdate  + '">' +
        '<img src="images/number/' + imageFileName + '.png" alt="" width="36px" height="36px">' +
        '<input type="time" class="pst"> ~ <input type="time" class="pet"><br>' +
        '<input type="checkbox" class="delete_box" name="delete_box">' +
        '<input type="text" class="pcon" maxlength="100" placeholder="내용은 100자 이내로 입력해주세요.">' +
        '</div>';

    $("#" + tabId).find(".schedule").append(newSchedule);
}
