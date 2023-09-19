$(document).ready(function () {

    /* 탭 생성 */
    const new_tabs = $('<li class="click_days clicked"><b>1일차</b></li>' +
        '<li id="travel_item" class="click_days"><b>준비물</b></li>'
    );
    new_tabs.appendTo($('.days_tabs'));

    /* 탭 이동 */
    for (let i = 0; i < $('.click_days').length; i++) {
        tab_open(i);
    }

    function tab_open(e) {
        $('.click_days').eq(e).click(function () {
            $('.click_days').removeClass('clicked');
            $('.days_selected').removeClass('show');
            $('.click_days').eq(e).addClass('clicked');
            $('.days_selected').eq(e).addClass('show');
        });
    }

    /* 일정 추가하기 버튼 */
    const maxForms = 20;

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
        }
    });
    /* 전체선택 클릭 */
    $('.select_all').click(function () {
        $(this).closest('.days_selected.show').find('.select_item').prop('checked', $(this).prop('checked'));
    });

    /* 일정 삭제 버튼 */
    $('#delete_plan').click(function () {
        $('.days_selected.show .select_item:checked').each(function () {
            $(this).closest('.content_form').remove();
        });
        $('.days_selected.show .select_all').prop('checked', false);
    });

    /* 모달 */
    $('.days_sub').hide();

    $('#show_btn').click(function () {
        $('#planner_modal').show();
    });

    $('.close').click(function () {
        $('#planner_modal').hide();
    });

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

        $('#share_btn').click(function () {
            $('.days_sub').hide();
            $('.select_item').hide();
            $('#modify_btn').html('수정하기');
            $('#share_btn').html('공유하기');
        });
    });

});