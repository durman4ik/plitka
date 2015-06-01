(function($) {
    $(function() {
        var jcarousel = $('.jcarousel');

        jcarousel
            .on('jcarousel:reload jcarousel:create', function () {
                var carousel = $(this),
                    width = carousel.innerWidth();
                var height = carousel.innerHeight();

                if (width >= 800) {
                    width = 150;

                } else if (width >= 350) {
                    width = 150;

                }

                if (height >= 800) {
                    height = 150;
                } else if (height >= 350) {
                    height = 150;
                }

                carousel.jcarousel('items').css('width', width + 'px').css('height', height + 'px');
            })
            .jcarousel({
                wrap: 'circular'
            });

        $('.jcarousel-control-prev')
            .jcarouselControl({
                target: '-=1'
            });

        $('.jcarousel-control-next')
            .jcarouselControl({
                target: '+=1'
            });
    });
})(jQuery);
