$(document).ready(function() {
	var user_id = "utest"; // 테스트용 아이디
	$.ajax({
		url : "./user_reserv_info.jsp",
		method : "GET",
		data : {user_id : user_id},
		success : function(data) {
			$("#reservationInfo").html(data);
		}
		
	});
});