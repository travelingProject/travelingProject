$(document).ready(function() {
	// 달력 생성
	$('.calendar').datepicker({
		language : 'ko',
		format : 'yyyy-mm-dd',
		autoclose : true,
		todayHighlight : true
	});

	// 체크인 날짜 선택 시 이벤트 처리
	$('.calendar-left .calendar').on('changeDate', function(e) {
		let startDate = $(this).datepicker('getDate');
		let endDate = $('.calendar-right .calendar').datepicker('getDate');

		if (startDate > endDate) {
			alert('체크인 날짜가 체크아웃 날짜보다 큽니다.');
			$(this).datepicker('setDate', null);
		} else {
			// 체크인 ~ 체크아웃 날짜를 서버에 전송
			// ...
		}
	});

	// 체크아웃 날짜 선택 시 이벤트 처리
	$('.calendar-right .calendar').on('changeDate', function(e) {
		let startDate = $('.calendar-left .calendar').datepicker('getDate');
		let endDate = $(this).datepicker('getDate');

		if (startDate > endDate) {
			alert('체크아웃 날짜가 체크인 날짜보다 작습니다.');
			$(this).datepicker('setDate', null);
		} else {
			// 체크인 ~ 체크아웃 날짜를 서버에 전송
			// ...
		}
	});
});