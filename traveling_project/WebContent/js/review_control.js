$(document).ready(function () {
	$.ajax({
		url: "user_review_info.jsp",
		dataType: "html",
		success: function(data) {
			$("#review_list").html(data);
		}
	});
});
