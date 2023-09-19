$(document).ready(function () {
  // footer로 부터 일정 거리 이상 떨어지면 지도의 position 변경
  $(window).scroll(function () {
    const st = $(this).scrollTop();
    var windowHeight = $(window).height();
    var footerHeight = $("footer").outerHeight();
    var bottomDistance = windowHeight - (st + footerHeight);        
    
    if (bottomDistance <= 278) {
      $('#map').css('position', 'absolute');
      $('#map').css('top', '565px');      
    } else{
      $('#map').css('position', 'fixed');
      $('#map').css('top', '100px');  
    }
  });
});
