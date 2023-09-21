$(document).ready(function() {
	$.ajax({
		url : "select_user_status.jsp",
		dataType : "html",
		success : function(data) {
			const ugrade = $(data).find("#ugrade").text();
			$('#grade_text').html(ugrade);
		}
	});
});