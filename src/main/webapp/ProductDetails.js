var multiCarousel = document.querySelector(
    '#ControlForCarousel'
);
if (window.matchMedia('(min-width: 768px)').matches) {
    var carousel = new bootstrap.Carousel(multiCarousel, {
        interval: false,
    });
    var carouselWidth = $('.carousel-inner')[0].scrollWidth;
    var cardWidth = $('.carousel-item').width();
    var scrollPosition = 0;
    $('#ControlForCarousel .carousel-control-next').on('click', function () {
        if (scrollPosition < carouselWidth - cardWidth * 4) {
            scrollPosition += cardWidth;
            $('#ControlForCarousel .carousel-inner').animate({ scrollLeft: scrollPosition },
                600);
        }
    });
    $('#ControlForCarousel .carousel-control-prev').on('click', function () {
        if (scrollPosition > 0) {
            scrollPosition -= cardWidth;
            $('#ControlForCarousel .carousel-inner').animate( { scrollLeft: scrollPosition },
                600);
        }
    });
} else {
    $(multiCarousel).addClass('slide');
}