$(document).ready(function() {
	var user_id = "utest"; // 테스트용 아이디
	$.ajax({
		url : "./user_reserv_info.jsp",
		method : "GET",
		data : {
			user_id : user_id
		},
		success : function(data) {
			$("#reservationInfo").html(data);
		}
	});

	// 모달 닫기 오른쪽 위 X
	$(".close_btn").click(function() {
		if (confirm("저장되지 않은 정보는 복원할 수 없습니다. 종료하시겠습니까?")) {
			$("#review_modal_wrap").hide();
			$("body").css("overflow", "auto");
			$("#review_form")[0].reset();
		}
	});
	
	// 모달 닫기 취소 버튼
	$("#can_btn").click(function() {
		if (confirm("저장되지 않은 정보는 복원할 수 없습니다. 취소하시겠습니까?")) {
			$("#review_modal_wrap").hide();
			$("body").css("overflow", "auto");
			$("#review_form")[0].reset();
		}
	});
	
	// 제목, 내용, 별점이 입력되지 않았으면 submit 안되도록
	$("#review_form").submit(function(event) {
        // 제목, 내용, 별점 값 가져오기
        var rtitle = $("#rtitle").val();
        var rcontent = $("#rcontent").val();
        var rating = $("input[name='rating']:checked").val();

        // 제목, 내용, 별점이 비어있는 경우 제출 방지
        if (rtitle === "" || rcontent === "" || rating === undefined) {
            alert("제목, 내용, 별점을 모두 입력해주세요.");
            event.preventDefault(); // 폼 제출 방지
        }
    });
});