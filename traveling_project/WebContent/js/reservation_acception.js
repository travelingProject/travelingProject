$(document).ready(function() {
	// 불투명 배경 숨김
	$("#background_overlay").hide();

	// 승인 버튼
	$(".accept_btn").click(function() {
		$("#accept_modal").fadeIn(100);
		$("#background_overlay").show();
	});
	// 거부 버튼
	$('.reject_btn').click(function(){
		$('#reject_modal').fadeIn(100);
		$("#background_overlay").show();
	});
	// 모달창 확인 버튼
	$(".accept").click(function(){
		$("#accept_modal").fadeOut(100);
		$("#background_overlay").hide();
	})
	// 모달창 취소 버튼
	$('.btn').click(function(){
		$(".modal").fadeOut(100);
		$("#background_overlay").hide();
	});
	// 모달창 닫기 버튼
	$('.modal span').click(function(){
		$(".modal").fadeOut(100);
		$("#background_overlay").hide();
	})
	

});