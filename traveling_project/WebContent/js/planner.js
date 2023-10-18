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
			history.pushState(null, null, window.location.href.split('#')[0]); // 모달창을 닫으면 url에 남아있던 브라우저 기록을 지워줌
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

	// data-plan_id 속성 값을 가져옴
	var planId = $button.data("plan_id");

	$.ajax({
		url: "planner_modal.jsp",
		data: {
			countDays : countDays,
			planId : planId
		},
		success: function(data) {
			$("#date_tabs").empty();
			
			$(".tab_list").append(data);

			// 탭 버튼
			$("ul.tab_list li").click(function() {
				var activeTab = $(this).attr("data-tab"); // ex) day1
				$("ul.tab_list li").removeClass("is_on");
				$(".tab_cont").removeClass("is_on");
				$(this).addClass("is_on");
				$("#" + activeTab).addClass("is_on");
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