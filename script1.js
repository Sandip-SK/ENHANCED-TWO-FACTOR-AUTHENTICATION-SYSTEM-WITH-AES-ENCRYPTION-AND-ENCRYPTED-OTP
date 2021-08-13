$(".prod-logo").hover(function () {
    $(".inner").addClass("inner-hover");
    $(".nav-li").slideDown(500);
  },
  function () {
    $(".inner").removeClass("inner-hover");
   $(".nav-li").slideUp(500);
  }
);