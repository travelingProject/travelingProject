var globalCoordinates = [];

$(document).ready(function() {
    let stayRequest = new XMLHttpRequest();
    const $rangeInput = $('.range-input input'), $priceInput = $('.price-input input'), $range = $('.slider .progress');
    let priceGap = 10000;

    // 숫자에 콤마를 추가하는 함수
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    // 문자열에서 콤마를 제거하는 함수
    function removeCommas(str) {
        return parseInt(str.replace(/,/g, ''), 10);
    }

    $priceInput.on('input', function(e) {
        let minPrice = parseInt($priceInput.first().val().replace(/,/g, '')), maxPrice = parseInt($priceInput.last().val().replace(/,/g, ''));

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

    $rangeInput.on('input', function() {
        let minVal = parseInt($rangeInput.first().val())
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
    $priceInput.on('blur', function() {
        let minPrice = $(".range-min").val();
        let maxPrice = $(".range-max").val();
        let rating = $('.rating:checked').val();
        let parking = $('#parking').is(':checked') ? $('#parking').val() : null;
        let wireless_internet = $('#wireless_internet').is(':checked') ? $('#wireless_internet').val() : null;
        let tub = $('#tub').is(':checked') ? $('#tub').val() : null;
        let washing_machine = $('#washing_machine').is(':checked') ? $('#washing_machine').val() : null;
        let drying_machine = $('#drying_machine').is(':checked') ? $('#drying_machine').val() : null;
        let air_conditioner = $('#air_conditioner').is(':checked') ? $('#air_conditioner').val() : null;
        let fan = $('#fan').is(':checked') ? $('#fan').val() : null;
        let heating_system = $('#heating_system').is(':checked') ? $('#heating_system').val() : null;
        let pool = $('#pool').is(':checked') ? $('#pool').val() : null;
        let arcade_game = $('#arcade_game').is(':checked') ? $('#arcade_game').val() : null;
        let gym = $('#gym').is(':checked') ? $('#gym').val() : null;
        let board_game = $('#board_game').is(':checked') ? $('#board_game').val() : null;
        let barbecue_tool = $('#barbecue_tool').is(':checked') ? $('#barbecue_tool').val() : null;
        let basic_cookware = $('#basic_cookware').is(':checked') ? $('#basic_cookware').val() : null;
        let breakfast = $('#breakfast').is(':checked') ? $('#breakfast').val() : null;
        let clean_service = $('#clean_service').is(':checked') ? $('#clean_service').val() : null;
        let luggage_storage = $('#luggage_storage').is(':checked') ? $('#luggage_storage').val() : null;
        $.ajax({
            url : 'priceFilter.condb?comm=filter',
            type : 'POST',
            data : {
                'minPrice' : minPrice,
                'maxPrice' : maxPrice,
                'parking' : parking,
                'wireless_internet' : wireless_internet,
                'tub' : tub,
                'washing_machine' : washing_machine,
                'drying_machine' : drying_machine,
                'air_conditioner' : air_conditioner,
                'fan' : fan,
                'heating_system' : heating_system,
                'pool' : pool,
                'arcade_game' : arcade_game,
                'gym' : gym,
                'board_game' : board_game,
                'barbecue_tool' : barbecue_tool,
                'basic_cookware' : basic_cookware,
                'breakfast' : breakfast,
                'clean_service' : clean_service,
                'luggage_storage' : luggage_storage,
                'minPrice' : minPrice,
                'maxPrice' : maxPrice,
                'rating' : rating
            },
            success : function(data) {
                var parsedData = JSON.parse(data);
                var accommodationBox = $('#accomodation_info_box');
                accommodationBox.empty();

                // 위도와 경도를 저장할 배열을 초기화합니다.
                var positionsArray = [];

                if (Array.isArray(parsedData.result)) {
                    createMarkers(map);

                    parsedData.result.forEach(function(item) {
                        var formattedPrice = parseInt(item.price).toLocaleString();
                        var latitude = item.latitude;
                        var longitude = item.longitude;
                        globalCoordinates.push({
                            lat : item.latitude,
                            lng : item.longitude
                        })
                        for (let i = 0; i < globalCoordinates.length; i++) {
                            console.log(globalCoordinates[i]);
                        }

                        var accommodationHTML = '<div class="accomodation">' + '<a href="#">' + '<div class="accomodation_box">' + '<div>' + '<img class="image" src="/traveling_project/stay_images/' + item.image + '" alt="이미지1" />' + '</div>' + '<div>' + '<h2 class="stay-name">' + item.stayName + '</h2>' + '<p class="avg-rating">' + item.avgRating + '</p>' + '<p class="road-addr">' + item.roadAddr + '</p>' + '<p class="room-price">₩ ' + formattedPrice + ' ~</p>' + '</div>' + '</div>' + '</a>' + '</div>';
                        accommodationBox.append(accommodationHTML);
                        // 위도와 경도를 positionsArray에 추가합니다.
                        positionsArray.push({
                            lat : parseFloat(item.latitude),
                            lng : parseFloat(item.longitude)
                        });
                        createMarkers(positionsArray);
                    });
                }
            }
        });
    });

    // 가격 필터에서 mouseup 했을 때
    $rangeInput.on('mouseup', function() {
        let minPrice = $(".range-min").val();
        let maxPrice = $(".range-max").val();
        let rating = $('.rating:checked').val();
        let parking = $('#parking').is(':checked') ? $('#parking').val() : null;
        let wireless_internet = $('#wireless_internet').is(':checked') ? $('#wireless_internet').val() : null;
        let tub = $('#tub').is(':checked') ? $('#tub').val() : null;
        let washing_machine = $('#washing_machine').is(':checked') ? $('#washing_machine').val() : null;
        let drying_machine = $('#drying_machine').is(':checked') ? $('#drying_machine').val() : null;
        let air_conditioner = $('#air_conditioner').is(':checked') ? $('#air_conditioner').val() : null;
        let fan = $('#fan').is(':checked') ? $('#fan').val() : null;
        let heating_system = $('#heating_system').is(':checked') ? $('#heating_system').val() : null;
        let pool = $('#pool').is(':checked') ? $('#pool').val() : null;
        let arcade_game = $('#arcade_game').is(':checked') ? $('#arcade_game').val() : null;
        let gym = $('#gym').is(':checked') ? $('#gym').val() : null;
        let board_game = $('#board_game').is(':checked') ? $('#board_game').val() : null;
        let barbecue_tool = $('#barbecue_tool').is(':checked') ? $('#barbecue_tool').val() : null;
        let basic_cookware = $('#basic_cookware').is(':checked') ? $('#basic_cookware').val() : null;
        let breakfast = $('#breakfast').is(':checked') ? $('#breakfast').val() : null;
        let clean_service = $('#clean_service').is(':checked') ? $('#clean_service').val() : null;
        let luggage_storage = $('#luggage_storage').is(':checked') ? $('#luggage_storage').val() : null;
        $.ajax({
            url : 'priceFilter.condb?comm=filter',
            type : 'POST',
            data : {
                'minPrice' : minPrice,
                'maxPrice' : maxPrice,
                'rating' : rating,
                'parking' : parking,
                'wireless_internet' : wireless_internet,
                'tub' : tub,
                'washing_machine' : washing_machine,
                'drying_machine' : drying_machine,
                'air_conditioner' : air_conditioner,
                'fan' : fan,
                'heating_system' : heating_system,
                'pool' : pool,
                'arcade_game' : arcade_game,
                'gym' : gym,
                'board_game' : board_game,
                'barbecue_tool' : barbecue_tool,
                'basic_cookware' : basic_cookware,
                'breakfast' : breakfast,
                'clean_service' : clean_service,
                'luggage_storage' : luggage_storage
            },
            success : function(data) {
                var parsedData = JSON.parse(data);
                var accommodationBox = $('#accomodation_info_box');
                accommodationBox.empty();

                if (Array.isArray(parsedData.result)) {
                    parsedData.result.forEach(function(item) {
                        var formattedPrice = parseInt(item.price).toLocaleString();
                        var accommodationHTML = '<div class="accomodation">' + '<a href="#">' + '<div class="accomodation_box">' + '<div>' + '<img class="image" src="/traveling_project/stay_images/' + item.image + '" alt="이미지1" />' + '</div>' + '<div>' + '<h2 class="stay-name">' + item.stayName + '</h2>' + '<p class="avg-rating">' + item.avgRating + '</p>' + '<p class="road-addr">' + item.roadAddr + '</p>' + '<p class="room-price">₩ ' + formattedPrice + ' ~</p>' + '</div>' + '</div>' + '</a>' + '</div>';
                        accommodationBox.append(accommodationHTML);
                    });
                }
            }
        });
    })

    // input에 focus하면 전체 선택
    $priceInput.on('focus', function() {
        $(this).select();
    });

    // 리뷰 평점 바뀔 때 이벤트
    $('.rating').on('change', function() {
        let minPrice = $(".range-min").val();
        let maxPrice = $(".range-max").val();
        let rating = $('.rating:checked').val();
        let parking = $('#parking').is(':checked') ? $('#parking').val() : null;
        let wireless_internet = $('#wireless_internet').is(':checked') ? $('#wireless_internet').val() : null;
        let tub = $('#tub').is(':checked') ? $('#tub').val() : null;
        let washing_machine = $('#washing_machine').is(':checked') ? $('#washing_machine').val() : null;
        let drying_machine = $('#drying_machine').is(':checked') ? $('#drying_machine').val() : null;
        let air_conditioner = $('#air_conditioner').is(':checked') ? $('#air_conditioner').val() : null;
        let fan = $('#fan').is(':checked') ? $('#fan').val() : null;
        let heating_system = $('#heating_system').is(':checked') ? $('#heating_system').val() : null;
        let pool = $('#pool').is(':checked') ? $('#pool').val() : null;
        let arcade_game = $('#arcade_game').is(':checked') ? $('#arcade_game').val() : null;
        let gym = $('#gym').is(':checked') ? $('#gym').val() : null;
        let board_game = $('#board_game').is(':checked') ? $('#board_game').val() : null;
        let barbecue_tool = $('#barbecue_tool').is(':checked') ? $('#barbecue_tool').val() : null;
        let basic_cookware = $('#basic_cookware').is(':checked') ? $('#basic_cookware').val() : null;
        let breakfast = $('#breakfast').is(':checked') ? $('#breakfast').val() : null;
        let clean_service = $('#clean_service').is(':checked') ? $('#clean_service').val() : null;
        let luggage_storage = $('#luggage_storage').is(':checked') ? $('#luggage_storage').val() : null;
        if (this.checked) {
            $.ajax({
                url : 'ratingFilter.condb?comm=filter',
                type : 'POST',
                data : {
                    'minPrice' : minPrice,
                    'maxPrice' : maxPrice,
                    'rating' : rating,
                    'parking' : parking,
                    'wireless_internet' : wireless_internet,
                    'tub' : tub,
                    'washing_machine' : washing_machine,
                    'drying_machine' : drying_machine,
                    'air_conditioner' : air_conditioner,
                    'fan' : fan,
                    'heating_system' : heating_system,
                    'pool' : pool,
                    'arcade_game' : arcade_game,
                    'gym' : gym,
                    'board_game' : board_game,
                    'barbecue_tool' : barbecue_tool,
                    'basic_cookware' : basic_cookware,
                    'breakfast' : breakfast,
                    'clean_service' : clean_service,
                    'luggage_storage' : luggage_storage
                },
                success : function(data) {
                    var parsedData = JSON.parse(data); // JSON 문자열을 JavaScript
                                                        // 객체로 파싱
                    var accommodationBox = $('#accomodation_info_box');
                    accommodationBox.empty();

                    if (Array.isArray(parsedData.result)) {
                        parsedData.result.forEach(function(item) {
                            var formattedPrice = parseInt(item.price).toLocaleString();
                            var accommodationHTML = '<div class="accomodation">' + '<a href="#">' + '<div class="accomodation_box">' + '<div>' + '<img class="image" src="/traveling_project/stay_images/' + item.image + '" alt="이미지1" />' + '</div>' + '<div>' + '<h2 class="stay-name">' + item.stayName + '</h2>' + '<p class="avg-rating">' + item.avgRating + '</p>' + '<p class="road-addr">' + item.roadAddr + '</p>' + '<p class="room-price">₩ ' + formattedPrice + ' ~</p>' + '</div>' + '</div>' + '</a>' + '</div>';
                            accommodationBox.append(accommodationHTML);
                        });
                    }
                }
            })
        }
    })

    // 필터 바뀔 때 이벤트
    $('.options').on('change', function() {
        let minPrice = $(".range-min").val();
        let maxPrice = $(".range-max").val();
        let rating = $('.rating:checked').val();
        let parking = $('#parking').is(':checked') ? $('#parking').val() : null;
        let wireless_internet = $('#wireless_internet').is(':checked') ? $('#wireless_internet').val() : null;
        let tub = $('#tub').is(':checked') ? $('#tub').val() : null;
        let washing_machine = $('#washing_machine').is(':checked') ? $('#washing_machine').val() : null;
        let drying_machine = $('#drying_machine').is(':checked') ? $('#drying_machine').val() : null;
        let air_conditioner = $('#air_conditioner').is(':checked') ? $('#air_conditioner').val() : null;
        let fan = $('#fan').is(':checked') ? $('#fan').val() : null;
        let heating_system = $('#heating_system').is(':checked') ? $('#heating_system').val() : null;
        let pool = $('#pool').is(':checked') ? $('#pool').val() : null;
        let arcade_game = $('#arcade_game').is(':checked') ? $('#arcade_game').val() : null;
        let gym = $('#gym').is(':checked') ? $('#gym').val() : null;
        let board_game = $('#board_game').is(':checked') ? $('#board_game').val() : null;
        let barbecue_tool = $('#barbecue_tool').is(':checked') ? $('#barbecue_tool').val() : null;
        let basic_cookware = $('#basic_cookware').is(':checked') ? $('#basic_cookware').val() : null;
        let breakfast = $('#breakfast').is(':checked') ? $('#breakfast').val() : null;
        let clean_service = $('#clean_service').is(':checked') ? $('#clean_service').val() : null;
        let luggage_storage = $('#luggage_storage').is(':checked') ? $('#luggage_storage').val() : null;

        // Ajax 요청을 서버에 보냅니다.
        $.ajax({
            url : 'facilitiesFilter.condb?comm=filter', // 서버의 URL을 입력합니다.
            type : 'POST', // 요청 방식에 맞게 설정합니다.
            dataType : 'json',
            data : {
                'minPrice' : minPrice,
                'maxPrice' : maxPrice,
                'rating' : rating,
                'parking' : parking,
                'wireless_internet' : wireless_internet,
                'tub' : tub,
                'washing_machine' : washing_machine,
                'drying_machine' : drying_machine,
                'air_conditioner' : air_conditioner,
                'fan' : fan,
                'heating_system' : heating_system,
                'pool' : pool,
                'arcade_game' : arcade_game,
                'gym' : gym,
                'board_game' : board_game,
                'barbecue_tool' : barbecue_tool,
                'basic_cookware' : basic_cookware,
                'breakfast' : breakfast,
                'clean_service' : clean_service,
                'luggage_storage' : luggage_storage
            },
            success : function(data) {
                var accommodationBox = $('#accomodation_info_box');
                accommodationBox.empty(); // 숙소 목록을 비웁니다.
                if (Array.isArray(data.result)) {
                    data.result.forEach(function(item) {
                        var formattedPrice = parseInt(item.price).toLocaleString();
                        var accommodationHTML = '<div class="accomodation">' + '<a href="#">' + '<div class="accomodation_box">' + '<div>' + '<img class="image" src="/traveling_project/stay_images/' + item.image + '" alt="이미지1" />' + '</div>' + '<div>' + '<h2 class="stay-name">' + item.stayName + '</h2>' + '<p class="avg-rating">' + item.avgRating + '</p>' + '<p class="road-addr">' + item.roadAddr + '</p>' + '<p class="room-price">₩ ' + formattedPrice + ' ~</p>' + '</div>' + '</div>' + '</a>' + '</div>';
                        accommodationBox.append(accommodationHTML);
                    });
                } else {
                    console.log('파싱된 데이터의 \'result\' 프로퍼티가 배열 형태가 아닙니다.');
                }
            }
        });
    });
});

window.onload = function() {
    var latitudes = []; // 위도를 저장할 배열
    var longitudes = []; // 경도를 저장할 배열

    // 모든 'latitude' 클래스를 가진 input 요소를 찾아서 배열에 저장
    document.querySelectorAll('.latitude').forEach(function(input, index) {
        latitudes.push(input.value);
    });

    // 모든 'longitude' 클래스를 가진 input 요소를 찾아서 배열에 저장
    document.querySelectorAll('.longitude').forEach(function(input, index) {
        longitudes.push(input.value);
    });

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center : new kakao.maps.LatLng(latitudes[0], longitudes[0]), // 지도의
                                                                        // 중심좌표
        level : 6
    // 지도의 확대 레벨
    };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var positions = [];

    // 마커를 표시할 위치와 title 객체 배열입니다
    for (var i = 0; i < latitudes.length; i++) {
        positions.push({
            latlng : new kakao.maps.LatLng(latitudes[i], longitudes[i])
        });
    }

    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png";

    for (var i = 0; i < positions.length; i++) {

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(36, 50);

        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage
        // 마커 이미지
        });
    }
    
    // 지도 타입 변경 컨트롤을 생성한다
    var mapTypeControl = new kakao.maps.MapTypeControl();
    
    // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
    
    // 지도에 확대 축소 컨트롤을 생성한다
    var zoomControl = new kakao.maps.ZoomControl();
    
    // 지도의 우측에 확대 축소 컨트롤을 추가한다
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
}
