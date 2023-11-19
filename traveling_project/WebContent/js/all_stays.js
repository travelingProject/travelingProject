var map;
var markers = [];
var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png';
var imageSize = new kakao.maps.Size(36, 50);
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
var priceVals = [];
var overlays = [];

//필터링 데이터를 수집하는 함수
function collectFilterData() {
  return {
	  minPrice: $('.range-min').val(),
	  maxPrice: $('.range-max').val(),
	  rating: $('.rating:checked').val(),
	  parking: $('#parking').is(':checked') ? $('#parking').val() : null,
	  wireless_internet : $('#wireless_internet').is(':checked') ? $('#wireless_internet').val() : null,
	  tub : $('#tub').is(':checked') ? $('#tub').val() : null,
	  washing_machine : $('#washing_machine').is(':checked') ? $('#washing_machine').val() : null,
	  drying_machine : $('#drying_machine').is(':checked') ? $('#drying_machine').val() : null,
	  air_conditioner : $('#air_conditioner').is(':checked') ? $('#air_conditioner').val() : null,
	  fan : $('#fan').is(':checked') ? $('#fan').val() : null,
	  heating_system : $('#heating_system').is(':checked') ? $('#heating_system').val() : null,
	  pool : $('#pool').is(':checked') ? $('#pool').val() : null,
	  arcade_game : $('#arcade_game').is(':checked') ? $('#arcade_game').val() : null,
	  gym : $('#gym').is(':checked') ? $('#gym').val() : null,
	  board_game : $('#board_game').is(':checked') ? $('#board_game').val() : null,
	  barbecue_tool : $('#barbecue_tool').is(':checked') ? $('#barbecue_tool').val() : null,
	  basic_cookware : $('#basic_cookware').is(':checked') ? $('#basic_cookware').val() : null,
	  breakfast : $('#breakfast').is(':checked') ? $('#breakfast').val() : null,
	  clean_service : $('#clean_service').is(':checked') ? $('#clean_service').val() : null,
	  luggage_storage: $('#luggage_storage').is(':checked') ? $('#luggage_storage').val() : null,
  };
}

//중복된 AJAX 요청 로직을 처리하는 함수
function sendFilterRequest(filterData) {
  $.ajax({
    url: 'priceFilter.condb?comm=filter',
    type: 'POST',
    data: filterData,
    success: function(data) {
      var parsedData = JSON.parse(data);
      var accommodationBox = $('#accomodation_info_box');
      accommodationBox.empty();

      var positionsArray = [];
      if (Array.isArray(parsedData.result)) {
        parsedData.result.forEach(function(item) {
          var formattedPrice = parseInt(item.price).toLocaleString();
          var accommodationHTML =
            '<div class="accomodation">' +
            '<a href="#">' +
            '<div class="accomodation_box">' +
            '<div>' +
            '<img class="image" src="/traveling_project/stay_images/' +
            item.image +
            '" alt="이미지1" />' +
            '</div>' +
            '<div>' +
            '<h2 class="stay-name">' +
            item.stayName +
            '</h2>' +
            '<p class="avg-rating">' +
            item.avgRating +
            '</p>' +
            '<p class="road-addr">' +
            item.roadAddr +
            '</p>' +
            '<p class="room-price">₩ ' +
            formattedPrice +
            ' ~</p>' +
            '</div>' +
            '</div>' +
            '</a>' +
            '</div>';
          accommodationBox.append(accommodationHTML);
          positionsArray.push({
            lat: parseFloat(item.latitude),
            lng: parseFloat(item.longitude),
          });
        });
        createOverlays(positionsArray, priceVals)
      }
    },
  });
}

$(document).ready(function () {
	  var latitudes = [];
	  var longitudes = [];

	  // '.latitude'와 '.longitude' 클래스를 가진 각 input 요소에서 위도와 경도 정보를 가져와 배열에 저장합니다.
	  $('.latitude').each(function (index, element) {
	    latitudes.push(parseFloat(element.value));
	  });

	  $('.longitude').each(function (index, element) {
	    longitudes.push(parseFloat(element.value));
	  });

	  // '.price-val' 클래스를 가진 각 input 요소에서 가격 정보를 가져와 priceVals 배열에 저장합니다.
	  $('.price-val').each(function (index, element) {
	    priceVals.push(element.value); // element.value는 이미 문자열이므로 parseFloat()는 적용하지 않습니다.
	  });

	  // 지도를 표시할 div
	  var mapContainer = document.getElementById('map');
	  var mapOption = {
	    center: new kakao.maps.LatLng(latitudes[0], longitudes[0]), // 지도의 중심좌표
	    level: 6 // 지도의 확대 레벨
	  };

	  // 지도를 생성합니다
	  var map = new kakao.maps.Map(mapContainer, mapOption);

	  // 위도와 경도 정보를 바탕으로 지도에 커스텀 오버레이를 추가합니다.
	  latitudes.forEach(function (latitude, index) {
	    var longitude = longitudes[index];
	    var position = new kakao.maps.LatLng(latitude, longitude);

	    // 커스텀 오버레이에 표시할 내용을 설정합니다.
	    var content = '<div class="label"><span class="center">₩' + priceVals[index] + '</span></div>';

	    // 커스텀 오버레이를 생성합니다.
	    var customOverlay = new kakao.maps.CustomOverlay({
	      map: map,
	      position: position,
	      content: content,
	      yAnchor: 1 // 오버레이의 수직 위치 조정 값. 1이면 오버레이의 하단이 마커 위치에 맞춰집니다.
	    });
	    
	    overlays.push(customOverlay)
	  });

	  // 지도 타입 변경 컨트롤을 생성한다
	  var mapTypeControl = new kakao.maps.MapTypeControl();

	  // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	  // 지도에 확대 축소 컨트롤을 생성한다
	  var zoomControl = new kakao.maps.ZoomControl();

	  // 지도의 우측에 확대 축소 컨트롤을 추가한다
	  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	
  let stayRequest = new XMLHttpRequest();
  const $rangeInput = $('.range-input input'),
    $priceInput = $('.price-input input'),
    $range = $('.slider .progress');
  let priceGap = 10000;

  // 숫자에 콤마를 추가하는 함수
  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  }

  // 문자열에서 콤마를 제거하는 함수
  function removeCommas(str) {
    return parseInt(str.replace(/,/g, ''), 10);
  }

  $priceInput.on('input', function (e) {
    let minPrice = parseInt($priceInput.first().val().replace(/,/g, '')),
      maxPrice = parseInt($priceInput.last().val().replace(/,/g, ''));

    if (maxPrice - minPrice >= priceGap && maxPrice <= $rangeInput.last().prop('max')) {
      if ($(this).hasClass('input-min')) {
        $rangeInput.first().val(minPrice);
        $range.css('left', (minPrice / $rangeInput.first().prop('max')) * 100 + '%');
        $(this).val(numberWithCommas(minPrice));
      } else {
        $rangeInput.last().val(maxPrice);
        $range.css('right', 100 - (maxPrice / $rangeInput.last().prop('max')) * 100 + '%');
        $(this).val(numberWithCommas(maxPrice));
      }
    } else {
      $(this).val(numberWithCommas($(this).val().replace(/,/g, '')));
    }
  });

  $rangeInput.on('input', function () {
    let minVal = parseInt($rangeInput.first().val());
    let maxVal = parseInt($rangeInput.last().val());
    if (maxVal - minVal < priceGap) {
      if ($(this).hasClass('range-min')) {
        $rangeInput.first().val(maxVal - priceGap);
      } else {
        $rangeInput.last().val(minVal + priceGap);
      }
    } else {
      $priceInput.first().val(numberWithCommas(minVal));
      $priceInput.last().val(numberWithCommas(maxVal));
      $range.css('left', (minVal / $rangeInput.first().prop('max')) * 100 + '%');
      $range.css('right', 100 - (maxVal / $rangeInput.last().prop('max')) * 100 + '%');
    }
  });

  // 가격 입력 칸 blur 했을 때
  $priceInput.on('blur', function () {
	  sendFilterRequest(collectFilterData());
  });

  // 가격 필터에서 mouseup 했을 때
  $rangeInput.on('mouseup', function () {
	  sendFilterRequest(collectFilterData());
  });

  // input에 focus하면 전체 선택
  $priceInput.on('focus', function () {
    $(this).select();
  });

  // 리뷰 평점 바뀔 때 이벤트
  $('.rating').on('change', function () {
	  sendFilterRequest(collectFilterData());
  });

  // 필터 바뀔 때 이벤트
  $('.options').on('change', function () {
	  sendFilterRequest(collectFilterData());
  });
});

//오버레이를 지도에서 제거하는 함수
function removeOverlays() {	
  for (var i = 0; i < overlays.length; i++) {	  
	  overlays[i].setMap(null); // 오버레이를 지도에서 제거
  }
  overlays = []; // 오버레이 배열을 비웁니다.
}

// 오버레이를 생성하고 지도에 표시하는 함수
function createOverlays(positionsArray, priceVals) {
  removeOverlays(); // 기존에 있던 오버레이들을 지도에서 모두 제거합니다.
  var position = new kakao.maps.LatLng(latitude, longitude);
  positionsArray.forEach(function (position, index) {
    var content = '<div class="label"><span class="center">' + priceVals[index] + '</span></div>';
    
    var overlay = new kakao.maps.CustomOverlay({
      map: map,
      position: new kakao.maps.LatLng(position.lat, position.lng),
      content: content,
      yAnchor: 1 // 오버레이의 수직 위치 조정 값. 1이면 오버레이의 하단이 마커 위치에 맞춰집니다.
    });
    overlays.push(overlay); // 생성된 오버레이를 배열에 추가합니다.
  });
}