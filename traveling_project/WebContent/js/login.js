$(document).ready(function() {
		
	const errorTextTr = $('tr:has(#error_text)');
	const errorText = $('#error_text');	
	
	$("#login_btn").click(function(e) {
		const idVal = $('#id').val();
		const pwVal = $('#pw').val();
		if (idVal == '') {
			e.preventDefault();
			errorTextTr.show();
			errorText.html('아이디를 입력해주세요.');
		} else if (pwVal == '') {
			e.preventDefault();
			errorTextTr.show();
			errorText.html('비밀번호를 입력해주세요.');
		}
	});
});
