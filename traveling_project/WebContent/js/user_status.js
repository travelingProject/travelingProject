$(document).ready(function() {
	$.ajax({
		url : "select_user_status.jsp",
		dataType : "html",
		success : function(data) {
			console.log(data);
			const ugrade = $(data).find("#ugrade").text();
			console.log("ugrade = " + ugrade);
		}
	});
});