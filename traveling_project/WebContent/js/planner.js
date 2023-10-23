$(document).ready(function() {

	// 수정 버튼 클릭 시
	$("#modi_btn").click(function() {
		$("#modi_btn").hide();
		$("#can_btn").hide();
		$("#modi_save_btn").show();
		$("#modi_can_btn").show();
	});

	// 수정 -> 취소 버튼 클릭 시
	$("#modi_can_btn").click(function() {
		if (confirm("저장되지 않은 정보는 삭제됩니다. 취소하시겠습니까?")) {
			$("#modi_btn").show();
			$("#can_btn").show();
			$("#modi_save_btn").hide();
			$("#modi_can_btn").hide();
		}
	});

	// close 버튼 (X) 또는 종료 버튼 클릭 시
	$(".close_btn, #can_btn").click(function() {
		if (confirm("저장되지 않은 정보는 삭제됩니다. 종료하시겠습니까?")) {
			$(".planner_modal_wrap").hide();
			$('body').css('overflow', 'auto');
			$("#date_tabs").empty();
			history.pushState(null, null, window.location.href.split('#')[0]); // 모달창을 닫으면 url에 남아있던 브라우저 기록을 지워줌
		}
	});
	
	// 변수를 사용하여 현재 추가할 day를 추적
	var currentDay = 1;

	// "일정 추가하기" 버튼 클릭 이벤트 핸들러
	$("#add_schedule").click(function() {
	    // 현재 선택된 탭을 가져옴
	    var activeTab = $(".tabDay.is_on");

	    // 현재 선택된 탭에 대한 일정을 추가
	    addScheduleToActiveTab(activeTab, currentDay);

	    // 현재 day를 증가
	    currentDay++;

	    // 최대 10개까지 추가 가능하도록 제한
	    if (currentDay > 10) {
	        alert("최대 10개까지 추가할 수 있습니다.");
	        $("#add_schedule").prop("disabled", true); // 상세 일정이 10개에 도달하면 버튼을 비활성화 시켜줌
	        $("#add_schedule").css({
	        	"cursor" : "auto",
	        	"background-color" : "#E9E9E9"
	        });
	    }
	});


});

// 상세보기 버튼 클릭
function detail_plan(event) {
	// 클릭한 작성하기 버튼 요소를 선택
	var $button = $(event.target);

	// 클릭한 작성하기 버튼이 속한 ul 요소를 찾기 위해 가장 가까운 부모 ul을 선택
	var $reservationInfo = $button.closest("ul.planner_list");

	// data-plan_id 속성 값을 가져옴
	var planId = $button.data("plan_id");
	
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
	for (var i = 0; i < countDays; i++) {
	    var j = i + 1;
	    tabnum = "<li class='tabDay' data-tab='day" + j + "'>"
	        + "<a href='#day" + j + "' class='tab_btn'>" + j + "일차</a>"
	        + "<div id='day" + j + "' class='tab_cont'>"
	        + "<p>" + j + "일차 <span class='ndate'>" + formatCheckinDate(checkInDate) + "</span></p>"
	        + "<div class='schedule sch" + j + "'></div></div>";
	    $(".tab_list").append(tabnum);
	    if (j == 1) {
			$(".tabDay").addClass("is_on");
		}
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
    var tabNumber = currentDay;

    // 이미지 파일 이름 생성
    var imageFileName = tabNumber + "_" + tabId;

    var newSchedule = '<div>' +
        '<img src="images/number/' + imageFileName + '.png" alt="" width="36px" height="36px">' +
        '<input type="time" class="pst"> ~ <input type="time" class="pet"><br>' +
        '<input type="text" class="pcon" maxlength="100" placeholder="내용은 100자 이내로 입력해주세요.">' +
        '</div>';

    $("#" + tabId).find(".schedule").append(newSchedule);
}

