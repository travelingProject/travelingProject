$(document).ready(function() {

	// 내 정보 아이콘 클릭시 a 링크 막기
	const loginIcon = $('#menu_nav .right_menu a:eq(0)');
	$(loginIcon).click(function(e) {
		e.preventDefault();
		$('#my_info').fadeIn(50);
	});

	$('#my_info').on('mouseleave', function() {
		$(this).fadeOut(50);
	})

	// 인원 수 범위 0 ~ 32 사이로 만들기
	const inputElement = $('#people_num');
	inputElement.on('input', function() {
		const inputValue = parseFloat(inputElement.val());
		if (inputValue < 0) {
			inputElement.val('1');
		} else if (inputValue > 32) {
			inputElement.val('32');
		}
	});

	// 달력 클릭시 효과
	const date = $('input[type="date"]');
	date.css('color', '#000');
	date.on('focus', function() {
		$(this).css('background-color', '#fff');
	});
	date.on('blur', function() {
		$(this).css('background-color', '#f5f5f5');
	});
	date.hover(function() {
		$(this).css('background-color', '#ececec');
	}, function() {
		// hover를 벗어났을 때, focus 상태가 아닌 경우에만 원래 배경 색상으로 복원
		if (!date.is(':focus')) {
			$(this).css('background-color', '#f5f5f5');
		}
	});

	// 위로 가기 버튼
	$('div.go_top').hide();
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('div.go_top').fadeIn();
		} else {
			$('div.go_top').fadeOut();
		}
	});
	$('div.go_top').click(function() {
		$('html,body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});
});
