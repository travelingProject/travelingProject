$(document).ready(function () {
    //저장, 취소 버튼은 default로 숨긴 상태에서 수정 버튼을 누르면 버튼 바뀌도록
    $("#modi_btn").click(function () {
        $("#modi_btn").hide();
        $("#can_btn").hide();
        $("#modi_save_btn").show();
        $("#modi_can_btn").show();
    });

    // 수정 -> 취소 버튼 누르면 다시 돌아오기
    $("#modi_can_btn").click(function() {
        if (confirm("저장되지 않은 정보는 삭제됩니다. 취소하시겠습니까?")) {
            $("#modi_btn").show();
            $("#can_btn").show();
            $("#modi_save_btn").hide();
            $("#modi_can_btn").hide();
        }
    });

    // 탭 버튼
    $("ul.tab_list li").click(function () {
        var activeTab = $(this).attr("data-tab");
        $("ul.tab_list li").removeClass("is_on");
        $("tab_cont").removeClass("is_on");
        $(this).addClass("is_on");
        $("#" + activeTab).addClass("is_on");
    });

    // close 버튼 (X)
    $(".close_btn").click(function() {
        if(confirm("저장되지 않은 정보는 삭제됩니다. 종료하시겠습니까?")) {
            $(".planner_modal_wrap").hide();
            $('body').css('overflow', 'auto');
        }
    });
    // 종료 버튼 (종료)
    $("#can_btn").click(function() {
        if(confirm("저장되지 않은 정보는 삭제됩니다. 종료하시겠습니까?")) {
            $(".planner_modal_wrap").hide();
            $('body').css('overflow', 'auto');
        }
    });
});

function detail_plan(event) {
	
	// 클릭한 작성하기 버튼 요소를 선택
    var $button = $(event.target);

    // 클릭한 작성하기 버튼이 속한 ul 요소를 찾기 위해 가장 가까운 부모 ul을 선택
    var $reservationInfo = $button.closest("ul.planner_list");
    
 	// data-reservation_id 속성 값을 가져옴
    var reservationId = $button.data("plan_id");
    // ul 요소 내에서 이미 가져온 데이터를 읽음
    var stayName = $reservationInfo.find(".p_stay_name").text();
    var chkDate = $reservationInfo.find(".planner_trip_date").text();

    // 모달에 예약 정보 추가
    $("#pm_header p").text(stayName);
    $("#pm_header span").text(chkDate);
    
    
	 $('.planner_modal_wrap').show();
	 $('body').css('overflow', 'hidden');
}