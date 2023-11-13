$(document).ready(function(){    
	let stayRequest = new XMLHttpRequest();
    const $rangeInput = $('.range-input input'),
    $priceInput = $('.price-input input'),
    $range = $('.slider .progress');
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
            $(this).val(numberWithCommas($(this).val().replace(/,/g, ''))); // ensure to reformat the current input if not valid
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
        let stayName = $('.stay-name');
        let avgRating = $('.avg-rating');
        let roadAddr = $('.road-addr');
        let roomPrice = $('.room-price');
        $.ajax({
           url: 'priceFilter.condb?comm=filter',
           type:'POST',
           data:{
               'minPrice' : minPrice,
               'maxPrice' : maxPrice
           },
           success: function(data) {
               var parsedData = JSON.parse(data); // JSON 문자열을 JavaScript 객체로 파싱
               var accommodationBox = $('#accomodation_info_box');
               accommodationBox.empty();

               if (Array.isArray(parsedData.result)) {
                   parsedData.result.forEach(function(item) {
                       var formattedPrice = parseInt(item.price).toLocaleString();
                       var accommodationHTML = 
                       '<div class="accomodation">' +
                           '<a href="#">' +
                               '<div class="accomodation_box">' +
                                   '<div>' +
                                       '<img class="image" src="/traveling_project/stay_images/' + item.image + '" alt="이미지1" />' +
                                   '</div>' +
                                   '<div>' +
                                       '<h2 class="stay-name">' + item.stayName + '</h2>' +
                                       '<p class="avg-rating">' + item.avgRating + '</p>' +
                                       '<p class="road-addr">' + item.roadAddr + '</p>' +
                                       '<p class="room-price">₩ ' + formattedPrice  + ' ~</p>' +
                                   '</div>' +
                               '</div>' +             
                           '</a>' +
                       '</div>';
                       accommodationBox.append(accommodationHTML);
                   });
               } else {
                   console.log('파싱된 데이터의 \'result\' 프로퍼티가 배열 형태가 아닙니다.');
               }
           }
        });        
    });  
    
    // 가격 필터에서 mouseup 했을 때
    $rangeInput.on('mouseup',function(){        
        let minPrice = $(".range-min").val();
        let maxPrice = $(".range-max").val();
        let rating = $('.rating:checked').val();        
        $.ajax({
           url: 'priceFilter.condb?comm=filter',
           type:'POST',
           data:{
               'minPrice' : minPrice,
               'maxPrice' : maxPrice,
               'rating' : rating
           },
           success: function(data) {
               var parsedData = JSON.parse(data); // JSON 문자열을 JavaScript 객체로 파싱
               var accommodationBox = $('#accomodation_info_box');
               accommodationBox.empty();

               if (Array.isArray(parsedData.result)) {
                   parsedData.result.forEach(function(item) {
                       var formattedPrice = parseInt(item.price).toLocaleString();
                       var accommodationHTML = 
                       '<div class="accomodation">' +
                           '<a href="#">' +
                               '<div class="accomodation_box">' +
                                   '<div>' +
                                       '<img class="image" src="/traveling_project/stay_images/' + item.image + '" alt="이미지1" />' +
                                   '</div>' +
                                   '<div>' +
                                       '<h2 class="stay-name">' + item.stayName + '</h2>' +
                                       '<p class="avg-rating">' + item.avgRating + '</p>' +
                                       '<p class="road-addr">' + item.roadAddr + '</p>' +
                                       '<p class="room-price">₩ ' + formattedPrice  + ' ~</p>' +
                                   '</div>' +
                               '</div>' +             
                           '</a>' +
                       '</div>';
                       accommodationBox.append(accommodationHTML);
                   });
               } else {
                   console.log('파싱된 데이터의 \'result\' 프로퍼티가 배열 형태가 아닙니다.');
               }
           }
        });        
    })
    
    // input에 focus하면 전체 선택
    $priceInput.on('focus', function() {
        $(this).select();
    });
    
    $('.rating').on('change',function(){
    	let minPrice = $(".range-min").val();
        let maxPrice = $(".range-max").val();
        let rating = $('.rating:checked').val();        
        if(this.checked) {
            $.ajax({
                url:'ratingFilter.condb?comm=filter',
                type:'POST',
                data:{
                	'minPrice' : minPrice,
                	'maxPrice' : maxPrice,
                    'rating' : rating,
                },
                success:function(data){
                    var parsedData = JSON.parse(data); // JSON 문자열을 JavaScript 객체로 파싱
                    var accommodationBox = $('#accomodation_info_box');
                    accommodationBox.empty();

                    if (Array.isArray(parsedData.result)) {
                        parsedData.result.forEach(function(item) {
                            var formattedPrice = parseInt(item.price).toLocaleString();
                            var accommodationHTML = 
                            '<div class="accomodation">' +
                                '<a href="#">' +
                                    '<div class="accomodation_box">' +
                                        '<div>' +
                                            '<img class="image" src="/traveling_project/stay_images/' + item.image + '" alt="이미지1" />' +
                                        '</div>' +
                                        '<div>' +
                                            '<h2 class="stay-name">' + item.stayName + '</h2>' +
                                            '<p class="avg-rating">' + item.avgRating + '</p>' +
                                            '<p class="road-addr">' + item.roadAddr + '</p>' +
                                            '<p class="room-price">₩ ' + formattedPrice  + ' ~</p>' +
                                        '</div>' +
                                    '</div>' +
                                '</a>' +
                            '</div>';
                            accommodationBox.append(accommodationHTML);
                        });
                    } else {
                        console.log('파싱된 데이터의 \'result\' 프로퍼티가 배열 형태가 아닙니다.');
                    }
                }
            })
        }
    })
    
    $('.options').on('change',function(){
        if(this.checked) {
            console.log($(this).val())
        }
    })

});
