$(document).ready(function () {
  $(".lnb_menu").hide();
  $(".lnb").mouseenter(function () {
    $(".lnb_menu").stop().slideDown(200);
  });
  $("#menu_nav").mouseleave(function () {
    $('.lnb_menu').stop().slideUp(200);
  });
});
