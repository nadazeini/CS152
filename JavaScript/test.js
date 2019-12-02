$(document).ready(function() {
  $(".menu-button").on("click", function() {
    $(this).toggleClass("close");
    $(".menu").toggleClass("close");
  });


$("menu .menu-nav").on("click", function() {
  $("menu-button").removeClass("close");
  $("nav-list").removeClass("close");
});
$("nav a[href*="#"]").on("click",function(){
  $("html,body").animate(keyframes:{
    scrollTop:$($(this).att("href")).offset().top-100
  }, options:2000);
});
});
AOS.init({
  easing: "ease",
  duration: 1000
});
