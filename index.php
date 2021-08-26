<?php include "views/includes/public/head.php"; ?>

<body id="page-top" class="landing-page no-skin-config">

<?php include "views/includes/public/menu.php"; ?>
<?php include "views/includes/public/carousel.php"; ?>




<?php include "views/includes/public/footer.php"; ?>
<!-- -------------------------------comentario--------------------------------- -->
<!-- -------------------------------comentario2--------------------------------- -->
<!-- -------------------------------comentario3--------------------------------- -->
<!-- -------------------------------comentario4--------------------------------- -->
<!-- -------------------------------comentario5--------------------------------- -->
<!-- -------------------------------comentario6--------------------------------- -->
<!-- -------------------------------comentario7--------------------------------- -->
<!-- Mainly scripts -->
<script src="public/js/jquery-3.1.1.min.js"></script>
<script src="public/js/popper.min.js"></script>
<script src="public/js/bootstrap.js"></script>
<script src="public/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="public/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="public/js/inspinia.js"></script>
<script src="public/js/plugins/pace/pace.min.js"></script>
<script src="public/js/plugins/wow/wow.min.js"></script>


<script>

    $(document).ready(function () {

        

        $('body').scrollspy({
            target: '#navbar',
            offset: 80
        });

        // Page scrolling feature
        $('a.page-scroll').bind('click', function(event) {
            var link = $(this);
            $('html, body').stop().animate({
                scrollTop: $(link.attr('href')).offset().top - 50
            }, 500);
            event.preventDefault();
            $("#navbar").collapse('hide');
        });
    });

    var cbpAnimatedHeader = (function() {
        var docElem = document.documentElement,
                header = document.querySelector( '.navbar-default' ),
                didScroll = false,
                changeHeaderOn = 200;
        function init() {
            window.addEventListener( 'scroll', function( event ) {
                if( !didScroll ) {
                    didScroll = true;
                    setTimeout( scrollPage, 250 );
                }
            }, false );
        }
        function scrollPage() {
            var sy = scrollY();
            if ( sy >= changeHeaderOn ) {
                $(header).addClass('navbar-scroll')
            }
            else {
                $(header).removeClass('navbar-scroll')
            }
            didScroll = false;
        }
        function scrollY() {
            return window.pageYOffset || docElem.scrollTop;
        }
        init();

    })();

    // Activate WOW.js plugin for animation on scrol
    new WOW().init();

</script>

</body>
</html>
