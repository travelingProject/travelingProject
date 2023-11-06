$(document).ready(function(){
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
        let minVal = parseInt($rangeInput.first().val()),
            maxVal = parseInt($rangeInput.last().val());

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
    
    $priceInput.on('blur', function() {
        // 콤마를 제거하고 정수로 변환
        let minPrice = removeCommas($priceInput.first().val());  
        let maxPrice = removeCommas($priceInput.last().val());
        console.log("minPrice : " + minPrice + ", maxPrice : " + maxPrice);
    });  
    
    $rangeInput.on('mouseup',function(){
        let minPrice = $(".range-min").val();
        let maxPrice = $(".range-max").val();
        $.ajax({
           url: 'priceFilter.condb?comm=priceFilter',
           type:'POST',
           data:{
               'minPrice' : minPrice,
               'maxPrice' : maxPrice
           }
        });        
    })
    
    // input에 focus하면 전체 선택
    $priceInput.on('focus', function() {
        $(this).select();
    });   

});
