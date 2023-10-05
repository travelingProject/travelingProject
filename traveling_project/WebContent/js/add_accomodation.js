var mapContainer = document.getElementById("map"), // 지도를 표시할 div
mapOption = {
	center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	level : 5, // 지도의 확대 레벨
};

// 지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도 타입 컨트롤을 지도에 표시합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

function getInfo() {
	// 지도의 현재 중심좌표를 얻어옵니다
	var center = map.getCenter();

	// 지도의 현재 레벨을 얻어옵니다
	var level = map.getLevel();

	// 지도타입을 얻어옵니다
	var mapTypeId = map.getMapTypeId();

	// 지도의 현재 영역을 얻어옵니다
	var bounds = map.getBounds();

	// 영역의 남서쪽 좌표를 얻어옵니다
	var swLatLng = bounds.getSouthWest();

	// 영역의 북동쪽 좌표를 얻어옵니다
	var neLatLng = bounds.getNorthEast();

	// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
	var boundsStr = bounds.toString();

	var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
	message += '경도 ' + center.getLng() + ' 이고 <br>';
	message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
	message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
	message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng()
			+ ' 이고 <br>';
	message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng()
			+ ' 입니다';

	// 개발자도구를 통해 직접 message 내용을 확인해 보세요.
	console.log(message);
}

// 주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();

var callback = function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		$("input[name=lng]").val(result[0].x);
		$("input[name=lat]").val(result[0].y);
	}
};

var stayAddr = document.getElementById('sample5_address').value;

geocoder.addressSearch(stayAddr, callback);

// 마커를 미리 생성
var marker = new daum.maps.Marker({
	position : new daum.maps.LatLng(37.537187, 127.005476),
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
