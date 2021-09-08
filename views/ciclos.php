<?php include "views/includes/public/head.php"; ?>

<body>

  <?php include "views/includes/public/menu.php"; ?>

  <!-- ================================================================= -->

  <section class="datos__section contenedor--bg">

    <!-- <div class="container"> -->
    <div class="campo__tarjeta">
      <!-- header filtro -->
      <div class="campo__header--bg">
        <div class="campo__header campo__responsive contenido__card ">
          <!-- buscar -->
          <div class="filtro search">
            <div class="filtro__flex">
              <input class="box__imput box--with" type="search" name="" placeholder="Buscar..." id="">
            </div>
            
            <button type="submit" class="searchButton">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-search" width="20" height="20" viewBox="0 0 24 24" stroke-width="2.5" stroke="#b7defa" fill="none" stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                <circle cx="10" cy="10" r="7" />
                <line x1="21" y1="21" x2="15" y2="15" />
              </svg>
            </button>

          </div>

          <!-- cursos -->
          <div class=" filtro campo__curso hhh">
            <select class="box--with">
              <option>Cursos</option>
              <option>How I met your mother</option>
              <option>Fargo</option>
              <option>True Detective</option>
            </select>
          </div>

          <!-- Nivel -->
          <div class=" filtro campo__curso hhh">
            <select class="box--with">
              <option>Nivel</option>
              <option>How I met your mother</option>
              <option>Fargo</option>
              <option>True Detective</option>
            </select>
          </div>

        </div>
      </div>

      <!-- =============================================== -->

      <!-- contenido--targetas -->
      <div class="curso__contenedor--sapace">
        <div class="curso__card--general curso__media ">

          <!-- tarjeta 1 -->
          <div class="curso__card">

            <!-- curso--imagen -->
            <div class="curso__imagen">
              <a href="?url=temarios.php"><img src="public/web/assets/img/cursos/curso1.jpg" class="imagen--estilos"></a>
            </div>

            <!-- contenido curso -->
            <div class=" curso__contenido ">
              <a href="?url=temarios.php">
                <h3 class="curso__title">
                  <span>Aritmetica</span>
                </h3>
              </a>
              <p class="curso__text">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam
                est suscipit itaque?
              </p>
              <div class="curso__view">
                <a href="?url=ciclos.php" class="curso__btn">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 svg__icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                  </svg>
                  <span>Cruso</span>
                </a>
              </div>
            </div>

            <!-- curso profesor -->
            <div class="curso__profesor">
              <div class="curso__profesor--medida">
                <div class="img__profesor">
                  <div class="img__radios">
                    <img src="public/web/assets/img/cursos_profesor/ps1.jpg" class="foto" alt="">
                  </div>
                </div>
                <p>nombre</p>
              </div>

              <!-- Precio curso -->
              <div class="curso__precio">
                <a href="#">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                  </svg>
                  <span>S/.300</span>
                </a>

              </div>

            </div>
          </div>
          <!-- find tarjeta 1 -->

          <!-- tarjeta 2 -->
          <div class="curso__card">

            <!-- curso--imagen -->
            <div class="curso__imagen">
              <a href="?url=temarios.php"><img src="public/web/assets/img/cursos/curso2.jpg" class="imagen--estilos"></a>
            </div>

            <!-- contenido curso -->
            <div class=" curso__contenido ">
              <a href="?url=temarios.php">
                <h3 class="curso__title">
                  <span>Aritmetica</span>
                </h3>
              </a>
              <p class="curso__text">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam
                est suscipit itaque?
              </p>
              <div class="curso__view">
                <a href="?url=ciclos.php" class="curso__btn">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 svg__icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                  </svg>
                  <span>Cruso</span>
                </a>
              </div>
            </div>

            <!-- curso profesor -->
            <div class="curso__profesor">
              <div class="curso__profesor--medida">
                <div class="img__profesor">
                  <div class="img__radios">
                    <img src="public/web/assets/img/cursos_profesor/ps1.jpg" class="foto" alt="">
                  </div>
                </div>
                <p>nombre</p>
              </div>

              <!-- Precio curso -->
              <div class="curso__precio">
                <a href="#">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                  </svg>
                  <span>S/.300</span>
                </a>

              </div>

            </div>
          </div>
          <!-- find tarjeta 2 -->

          <!-- tarjeta 3 -->
          <div class="curso__card">

            <!-- curso--imagen -->
            <div class="curso__imagen">
              <a href="?url=temarios.php"><img src="public/web/assets/img/cursos/curso3.jpg" class="imagen--estilos"></a>
            </div>

            <!-- contenido curso -->
            <div class=" curso__contenido ">
              <a href="?url=temarios.php">
                <h3 class="curso__title">
                  <span>Aritmetica</span>
                </h3>
              </a>
              <p class="curso__text">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam
                est suscipit itaque?
              </p>
              <div class="curso__view">
                <a href="?url=ciclos.php" class="curso__btn">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 svg__icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                  </svg>
                  <span>Cruso</span>
                </a>
              </div>
            </div>

            <!-- curso profesor -->
            <div class="curso__profesor">
              <div class="curso__profesor--medida">
                <div class="img__profesor">
                  <div class="img__radios">
                    <img src="public/web/assets/img/cursos_profesor/ps1.jpg" class="foto" alt="">
                  </div>
                </div>
                <p>nombre</p>
              </div>

              <!-- Precio curso -->
              <div class="curso__precio">
                <a href="#">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                  </svg>
                  <span>S/.300</span>
                </a>

              </div>

            </div>
          </div>
          <!-- find tarjeta 3 -->

          <!-- tarjeta 4 -->
          <div class="curso__card">

            <!-- curso--imagen -->
            <div class="curso__imagen">
              <a href="?url=temarios.php"><img src="public/web/assets/img/cursos/curso4.jpg" class="imagen--estilos"></a>
            </div>

            <!-- contenido curso -->
            <div class=" curso__contenido ">
              <a href="?url=temarios.php">
                <h3 class="curso__title">
                  <span>Aritmetica</span>
                </h3>
              </a>
              <p class="curso__text">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam
                est suscipit itaque?
              </p>
              <div class="curso__view">
                <a href="?url=ciclos.php" class="curso__btn">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 svg__icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                  </svg>
                  <span>Cruso</span>
                </a>
              </div>
            </div>

            <!-- curso profesor -->
            <div class="curso__profesor">
              <div class="curso__profesor--medida">
                <div class="img__profesor">
                  <div class="img__radios">
                    <img src="public/web/assets/img/cursos_profesor/ps1.jpg" class="foto" alt="">
                  </div>
                </div>
                <p>nombre</p>
              </div>

              <!-- Precio curso -->
              <div class="curso__precio">
                <a href="#">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                  </svg>
                  <span>S/.300</span>
                </a>

              </div>

            </div>
          </div>
          <!-- find tarjeta -->

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
  <script src="public/web/assets/js/header/jquery.min.js"></script>
  <script src="public/web/assets/js/header/main.js"></script>

</body>