$(document).ready(function() {
	const errorTextTr = $('tr:has(#error_text)');
	const errorText = $('#error_text');
	
	function id() {
		const user_id = $("#id").val();
		const user_pw = $("#pw").val();
		$.ajax({
			type: "POST",
			url: "check_login.jsp",
			data: {
				user_id : user_id,
				user_pw : user_pw
			},
			success: function(data) {
				var result = data.trim();
				if (!result.equals("성공")) {
					errorTextTr.show();
					errorText.html("아이디 또는 비밀번호가 잘못 입력되었습니다.");
				}
			}
		});
	}

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
		} else {
			e.preventDefault();
			id();
		}
	});
});
