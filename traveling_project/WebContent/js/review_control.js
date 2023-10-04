$(document).ready(function() {
	$.ajax({
		url : "user_review_info.jsp",
		dataType : "html",
		success : function(data) {
			$("#review_list").html(data);
		}
	});
});

// 리뷰 삭제하기 버튼 함수
function delete_review(event) {
	if (confirm("삭제된 리뷰는 복원이 불가능합니다. 삭제하시겠습니까?")) {
		// 클릭한 작성하기 버튼 요소를 선택
		var $button = $(event.target);
		// 삭제할 리뷰 요소의 부모 <li> 요소를 선택
	    var $reviewItem = $button.closest("ul.index_list");
		// data-reservation_id 속성 값을 가져옴
		var reservationId = $button.data("reservation_id");
		
		$.ajax({
			url : "delete_review.jsp",
			data : {
				reservationId : reservationId
			},
			success: function(data) {
				$.ajax({
					url : "user_review_info.jsp",
					success : function(data) {
						$("#review_list").html(data);
					}
				});
			}
		});
	}
}

// 리뷰 수정하기 버튼 함수
function replace(event) {
	// 클릭한 작성하기 버튼 요소를 선택
	var $button = $(event.target);	
	// data-reservation_id 속성 값을 가져옴
	var reservationId = $button.data("reservation_id");
	
	$.ajax({
		url : "replace_review.jsp",
		data : {
			reservationId : reservationId
		},
		dataType : "HTML",
		success : function(data) {
			var rtitle = $(data).find("#riv_title").text();
			var rcontent = $(data).find("#riv_content").text();
			var rating = $(data).find("#riv_rating").text();
			
			// 클릭한 작성하기 버튼이 속한 ul 요소를 찾기 위해 가장 가까운 부모 ul을 선택
			var $reservationInfo = $button.closest("ul.index_list");
			
			// ul 요소 내에서 이미 가져온 데이터를 읽음
			var stayName = $reservationInfo.find(".r_stay_name").text();
			var chkDate = $reservationInfo.find(".r_chk_date").text();
			
			// 모달에 예약 정보 추가
			$("#rid_hidden").val(reservationId);
			$("#rm_header p").text(stayName);
			$("#rm_header span").text(chkDate);
			$("#rtitle").val(rtitle);
			$("#rcontent").val(rcontent);
			
			// rating 변수에 따라 라디오 버튼 선택
			switch (rating) {
			  case "5.0":
			    $("#5-stars").prop("checked", true);
			    break;
			  case "4.0":
			    $("#4-stars").prop("checked", true);
			    break;
			  case "3.0":
			    $("#3-stars").prop("checked", true);
			    break;
			  case "2.0":
			    $("#2-stars").prop("checked", true);
			    break;
			  case "1.0":
			    $("#1-star").prop("checked", true);
			    break;
			  default:
			    // 선택된 라디오 버튼이 없는 경우
			    break;
			}
		
			// 모달 열기
			$(".review_modal_wrap").show();
			$("body").css("overflow", "hidden");			
		}
	});
}
