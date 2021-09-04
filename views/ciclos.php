<?php include "views/includes/public/head.php"; ?>

<body>

  <?php include "views/includes/public/menu.php"; ?>

  <!-- ================================================================= -->

  <section class="datos__section contenedor--bg">
    <!-- <div class="container"> -->
    <div class="contenedor__tarjeta limite">
      <!-- header -->
      <div class="campo__header">
        <!-- buscar -->
        <div class="search">
          <div class="box__search">
            <input class="box__imput" type="search" name="" placeholder="que buscaras" id="">
            <div class="svg__imput">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 svg__icono" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </div>
          </div>
        </div>

        <!-- fin buscar -->

        <!-- cursos -->
        <div class="campo campo1">
          <select class="campo__caja">
            <option>Cursos</option>
            <option>How I met your mother</option>
            <option>Fargo</option>
            <option>True Detective</option>
          </select>
        </div>
        <!-- fin cursos -->
        <!-- Nivel -->
        <div class="campo campo1">
          <select class="campo__caja">
            <option>Nivel</option>
            <option>How I met your mother</option>
            <option>Fargo</option>
            <option>True Detective</option>
          </select>
        </div>
        <!-- fin nivel -->
      </div>
      <!-- targetas -->
      <div class="curso__card--general limite">

        <!-- tarjeta 1 -->
        <div class="curso__card">

          <!-- curso--imagen -->
          <div class="curso__imagen">
            <a href="#"><img src="public/web/assets/img/cursos/curso1.jpg" class="imagen--estilos"></a>
          </div>

          <!-- contenido curso -->
          <div class=" curso__contenido ">
            <a href="#">
              <h3 class="curso__title">
                <span>Aritmetica</span>
              </h3>
            </a>
            <p class="curso__text">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam
              est suscipit itaque?
            </p>
            <div class="curso__view">
              <a href="#" class="curso__btn">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 svg__icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
                <span>Cruso</span>
              </a>
            </div>
          </div>

          <!-- curso profesor -->
          <div class="curso__profesor">
            <div class="img__profesor">
              <div class="img__radios">
                <img src="public/web/assets/img/cursos_profesor/ps1.jpg" class="foto" alt="">
              </div>
            </div>
            <p>nombre</p>
          </div>
        </div>
        <!-- find tarjeta 1 -->

        <!-- tarjeta 2 -->
        <div class="curso__card">

          <!-- curso--imagen -->
          <div class="curso__imagen">
            <a href="#"><img src="public/web/assets/img/cursos/curso2.jpg" class="imagen--estilos"></a>
          </div>

          <!-- contenido curso -->
          <div class=" curso__contenido ">
            <a href="#">
              <h3 class="curso__title">
                <span>Aritmetica</span>
              </h3>
            </a>
            <p class="curso__text">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam
              est suscipit itaque?
            </p>
            <div class="curso__view">
              <a href="#" class="curso__btn">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 svg__icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
                <span>Cruso</span>
              </a>
            </div>
          </div>

          <!-- curso profesor -->
          <div class="curso__profesor">
            <div class="img__profesor">
              <div class="img__radios">
                <img src="public/web/assets/img/cursos_profesor/ps1.jpg" class="foto" alt="">
              </div>
            </div>
            <p>nombre</p>
          </div>
        </div>
        <!-- find tarjeta 2 -->

        <!-- tarjeta 3 -->
        <div class="curso__card">

          <!-- curso--imagen -->
          <div class="curso__imagen">
            <a href="#"><img src="public/web/assets/img/cursos/curso3.jpg" class="imagen--estilos"></a>
          </div>

          <!-- contenido curso -->
          <div class=" curso__contenido ">
            <a href="#">
              <h3 class="curso__title">
                <span>Aritmetica</span>
              </h3>
            </a>
            <p class="curso__text">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam
              est suscipit itaque?
            </p>
            <div class="curso__view">
              <a href="#" class="curso__btn">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 svg__icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
                <span>Cruso</span>
              </a>
            </div>
          </div>

          <!-- curso profesor -->
          <div class="curso__profesor">
            <div class="img__profesor">
              <div class="img__radios">
                <img src="public/web/assets/img/cursos_profesor/ps1.jpg" class="foto" alt="">
              </div>
            </div>
            <p>nombre</p>
          </div>
        </div>
        <!-- find tarjeta 3 -->

        <!-- tarjeta 4 -->
        <div class="curso__card">

          <!-- curso--imagen -->
          <div class="curso__imagen">
            <a href="#"><img src="public/web/assets/img/cursos/curso4.jpg" class="imagen--estilos"></a>
          </div>

          <!-- contenido curso -->
          <div class=" curso__contenido ">
            <a href="#">
              <h3 class="curso__title">
                <span>Aritmetica</span>
              </h3>
            </a>
            <p class="curso__text">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam
              est suscipit itaque?
            </p>
            <div class="curso__view">
              <a href="#" class="curso__btn">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 svg__icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
                <span>Cruso</span>
              </a>
            </div>
          </div>

          <!-- curso profesor -->
          <div class="curso__profesor">
            <div class="img__profesor">
              <div class="img__radios">
                <img src="public/web/assets/img/cursos_profesor/ps1.jpg" class="foto" alt="">
              </div>
            </div>
            <p>nombre</p>
          </div>
        </div>
        <!-- find tarjeta -->

      </div>
    </div>
    <!-- </div> -->
  </section>




  <!-- ========================================= -->
  <main id="main">
    <?php include "views/includes/public/contacto.php"; ?>
  </main><!-- End #main -->

  <?php include "views/includes/public/footer.php"; ?>


  <!-- Vendor JS Files -->
  <script src="public/web/assets/vendor/aos/aos.js"></script>
  <script src="public/web/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="public/web/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="public/web/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="public/web/assets/vendor/php-email-form/validate.js"></script>
  <script src="public/web/assets/vendor/purecounter/purecounter.js"></script>
  <script src="public/web/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="public/web/assets/js/main.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="public/web/assets/js/header.js"></script>
  <script src="public/web/assets/js/header/header.js"></script>
  <!-- <script src="public/web/assets/js/header/jquery.min.js"></script> -->
  <script src="public/web/assets/js/header/main.js"></script>

</body>