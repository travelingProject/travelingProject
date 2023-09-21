$(document).ready(function() {
	$("#accept_modal").hide();
	$("#background_overlay").hide();
	$("#accept_btn").click(function(e) {
		e.preventDefault();
		$("#accept_modal").fadeIn(200);
		$("#background_overlay").show();
	});
	$("#accept").click(function() {
		$("#accept_modal").hide();
		$("#background_overlay").hide();
	});
	$(".modal #btn input").click(function() {
		$("#accept_modal").hide();
		$("#background_overlay").hide();	
	});
	$("#accept_modal span").click(function() {
		$("#accept_modal").hide();
		$("#background_overlay").hide();		
	})
});