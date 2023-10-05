var mapContainer = document.getElementById("map"), // 지도를 표시할 div
mapOption = {
	center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
	level : 5, // 지도의 확대 레벨
};

// 지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);

// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'center_changed', function() {

	// 지도의 레벨을 얻어옵니다
	var level = map.getLevel();

	// 지도의 중심좌표를 얻어옵니다
	var latlng = map.getCenter();

	var latitude = latlng.getLat();
	var longitude = latlng.getLng();

	document.getElementById("latitudeInput").value = latitude;
    document.getElementById("longitudeInput").value = longitude;
});

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도 타입 컨트롤을 지도에 표시합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();

// 마커를 미리 생성
var marker = new daum.maps.Marker({
	position : new daum.maps.LatLng(33.450701, 126.570667),
	map : map,
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
					var result = results[0]; // 첫번째 결과의 값을 활용

					// 해당 주소에 대한 좌표를 받아서
					var coords = new daum.maps.LatLng(result.y, result.x);
					// 지도를 보여준다.
					mapContainer.style.display = "block";
					map.relayout();
					// 지도 중심을 변경한다.
					map.setCenter(coords);
					// 마커를 결과값으로 받은 위치로 옮긴다.
					marker.setPosition(coords);
				}
			});
		},
	}).open();
}

$(document).ready(function(){
	$('#stay_name').blur(function(){
		if($('#stay_name').val() == ''){
			$('#stay_name').css('border','2px solid red');
			$('#stay_name_text').css('display','block');
		} else{
			$('#stay_name').css('border','1px solid #ccc');
			$('#stay_name_text').css('display','none');
		}
	});
	
	$('#addr_search').click(function(){
		$('#sample5_address').css('border','1px solid #ccc');
		$('#addr_text').css('display','none');
	});
	
	$('#host_phone').blur(function(){
		if($('#host_phone').val() == ''){
			$('#host_phone').css('border','2px solid red');
			$('#phone_text').css('display','block');
		} else{
			$('#host_phone').css('border','1px solid #ccc');
			$('#phone_text').css('display','none');
		}
	});	
	
	
	$('#add_btn').click(function(e){
		if($('#stay_name').val() == ''){
			e.preventDefault();
			$('#stay_name').css('border','2px solid red');
			$('#stay_name_text').css('display','block');
		} else if($('#sample5_address').val() == ''){
			e.preventDefault();
			$('#sample5_address').css('border','2px solid red');
			$('#addr_text').css('display','block');
		} else if($('#host_phone').val() == ''){
			e.preventDefault();
			$('#host_phone').css('border','2px solid red');
			$('#phone_text').css('display','block');
		}
	});	
});

function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').style.display = 'block';
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
