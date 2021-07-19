$(function() {
  $('.slider-box').slick({
      dots: true,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.introduction-box').slick('goTo', $(this).index());
  });
});