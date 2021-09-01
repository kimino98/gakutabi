$(function() {
  $('.slider-box').slick({
    dots: true,
    adaptiveHeight: false,
    autoplay: true,
    autoplaySpeed: 5000,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.introduction-box').slick('goTo', $(this).index());
  });
});