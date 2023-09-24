$(document).ready(function() {
	// nav menu에 hover시 lnb_menu 나타남
	$(".lnb_menu").hide();
	$(".lnb").mouseenter(function() {
		$(".lnb_menu").stop().slideDown(200);
	});
	$("#menu_nav").mouseleave(function() {
		$('.lnb_menu').stop().slideUp(200);
	});
});
