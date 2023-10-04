$(document).ready(function () {
    /* 일정 추가하기 버튼 */
/*    const maxForms = 10;

    $('#add_plan').click(function () {
        const formCount = $('.days_selected.show .content_form').length;
        if (formCount < maxForms) {
            const newForm = $('<div class="content">' +
                '<form class="content_form">' +
                '<input class="select_item" type="checkbox">' +
                '<div class="content_time">' +
                '<input type="time"> ~ ' +
                '<input type="time">' +
                '</div>' +
                '<div class="content_act">' +
                '<input type="text" placeholder="내용을 작성해주세요." size="60" height="20px">' +
                '</div>' +
                '</form>' +
                '</div>');
            newForm.find('input[type="checkbox"]').prop('checked', false);
            newForm.find('input[type="time"]').val('');
            newForm.find('.content_act input').val('');
            newForm.appendTo($('.days_selected.show .days_contents'));
        } else {
        	alert("세부 일정은 최대 10개씩 입력 가능합니다.");
        }
    });*/
    /* 전체선택 클릭 */
    /*$('.select_all').click(function () {
        $(this).closest('.days_selected.show').find('.select_item').prop('checked', $(this).prop('checked'));
    });*/

    /* 일정 삭제 버튼 */
    /*$('#delete_plan').click(function () {
        $('.days_selected.show .select_item:checked').each(function () {
            $(this).closest('.content_form').remove();
        });
        $('.days_selected.show .select_all').prop('checked', false);
    });*/

    /* 모달 */
    $('.days_sub').hide();

    $('.close').click(function () {
        $('#planner_modal').hide();
        $("body").css("background-color", "#fff");
        $("body").css("overflow", "auto");
    });
    
    /* 수정하기 버튼 */
    $('#modify_btn').click(function () {
        if ($('#modify_btn').html() == '저장') {
            $('.content_form input').prop('disabled', true);
            $('.days_sub').hide();
            $('.select_item').hide();
            $('#modify_btn').html('수정하기');
            $('#share_btn').html('공유하기');
        } else {
            $('.days_sub').show();
            $('.select_item').show();
            $('#modify_btn').html('저장');
            $('#share_btn').html('취소');
            $('.content_form input').prop('disabled', false);
        }
    });

    /* 공유하기 버튼 */
    $('#share_btn').click(function () {
        if ($('#share_btn').html() == '공유하기') {
            // 공유 기능 추가: 서버로 일정을 업로드하거나 공유 링크 생성
            // 이 부분을 원하는 기능으로 구현하실 수 있습니다.
            alert('일정을 공유하거나 업로드합니다.');
        } else {
            // 취소 버튼 클릭 시 수정 모드를 취소하고 모달창을 닫습니다.
            $('.days_sub').hide();
            $('.select_item').hide();
            $('#modify_btn').html('수정하기');
            $('#share_btn').html('공유하기');
            $('.content_form input').prop('disabled', true);
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
    $("#planner_header h2").text(stayName);
    $("#planner_header h5").text(chkDate);
    
    
	 $('#planner_modal').show();
     $("body").css("background-color", "rgb(0,0,0,0.6)");
     $("body").css("overflow", "hidden");
}