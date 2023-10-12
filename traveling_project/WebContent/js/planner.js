$(document).ready(function() {

	// 수정 버튼 클릭 시
	$("#modi_btn").click(function() {
		$("#modi_btn").hide();
		$("#can_btn").hide();
		$("#modi_save_btn").show();
		$("#modi_can_btn").show();
	});

	// 수정 -> 취소 버튼 클릭 시
	$("#modi_can_btn").click(function() {
		if (confirm("저장되지 않은 정보는 삭제됩니다. 취소하시겠습니까?")) {
			$("#modi_btn").show();
			$("#can_btn").show();
			$("#modi_save_btn").hide();
			$("#modi_can_btn").hide();
		}
	});

	// close 버튼 (X) 또는 종료 버튼 클릭 시
	$(".close_btn, #can_btn").click(function() {
		if (confirm("저장되지 않은 정보는 삭제됩니다. 종료하시겠습니까?")) {
			$(".planner_modal_wrap").hide();
			$('body').css('overflow', 'auto');
		}
	});

});

// 상세보기 버튼 클릭
function detail_plan(event) {
	// 클릭한 작성하기 버튼 요소를 선택
	var $button = $(event.target);

	// 클릭한 작성하기 버튼이 속한 ul 요소를 찾기 위해 가장 가까운 부모 ul을 선택
	var $reservationInfo = $button.closest("ul.planner_list");
	
	var countDays = parseInt($reservationInfo.find(".planner_trip_date").data("days_count"), 10);

	// data-plan_id 속성 값을 가져옴
	var planId = $button.data("plan_id");
	
	$.ajax({
		url: "planner_modal.jsp",
		data: {
			countDays : countDays,
			planId : planId
		},
		success: function(data) {
			$("#date_tabs").empty();
			
			$(".tab_list").append(data);
			
			$(".tb").addClass("tab_btn")
			$(".tc").addClass("tab_cont")
			
			// 탭 버튼
			$("ul.tab_list li").click(function() {
				var activeTab = $(this).attr("data-tab"); // ex) day1
				$("ul.tab_list li").removeClass("is_on");
				$(".tab_cont").removeClass("is_on");
				$(this).addClass("is_on");
				$("#" + activeTab).addClass("is_on");
			});
		}
	});
	// ul 요소 내에서 이미 가져온 데이터를 읽음
	var stayName = $reservationInfo.find(".p_stay_name").text();
	var chkDate = $reservationInfo.find(".planner_trip_date").text();

	// 모달에 예약 정보 추가
    $("#pid_hidden").val(planId);
	$("#pm_header p").text(stayName);
	$("#pm_header span").text(chkDate);

	// 모달 열기
	$('.planner_modal_wrap').show();
	$('body').css('overflow', 'hidden');
}

/*
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	level : 5
// 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
	position : new daum.maps.LatLng(37.537187, 127.005476),
	map : map
});
function sample5_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			var addr = data.address; // 최종 주소 변수

			// 주소 정보를 해당 필드에 넣는다.
			document.getElementById("sample5_address").value = addr;
			// 주소로 상세 정보를 검색
			geocoder.addressSearch(data.address, function(results, status) {
				// 정상적으로 검색이 완료됐으면
				if (status === daum.maps.services.Status.OK) {

					var result = results[0]; //첫번째 결과의 값을 활용

					// 해당 주소에 대한 좌표를 받아서
					var coords = new daum.maps.LatLng(result.y, result.x);
					// 지도를 보여준다.
					mapContainer.style.display = "block";
					map.relayout();
					// 지도 중심을 변경한다.
					map.setCenter(coords);
					// 마커를 결과값으로 받은 위치로 옮긴다.
					marker.setPosition(coords)
				}
			});
		}
	}).open();
}
*/