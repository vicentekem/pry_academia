<?php include "views/includes/public/head.php"; ?>

<body>

	<?php include "views/includes/public/menu.php"; ?>

	<!-- ================================================================= -->

	<form class="container">
		<fieldset class="from__padre">
			<!-- ============================================ -->
			<div class="from__header">
				<div class="from__titulo">
					<h2>Pre-Matricula</h2>
					<div class="from__parrafo">
						<p>A continuación registre el DNI, Apellidos y Nombres, Correo electrónico y Teléfonos. Tenga en cuenta que los datos a registrar deben ser del estudiante</p>
					</div>
				</div>
				<div class="from__matricula">
					<div class="from__titulo-matricula ">
						<h2>Datos de Matricula</h2>
					</div>
					<div class="campo campo1">
						<label class="campo__label">Ciclo</label>
						<select class="campo__caja">
							<option>Lost</option>
							<option>How I met your mother</option>
							<option>Fargo</option>
							<option>True Detective</option>
						</select>
					</div>
					<div class="campo2 campo">
						<label>Turnos</label>
						<select class="campo__caja">
							<option>Lost</option>
							<option>How I met your mother</option>
							<option>Fargo</option>
							<option>True Detective</option>
						</select>
					</div>
					<div class="campo3 campo">
						<label>Tipo Pago</label>
						<select class="campo__caja">
							<option>Lost</option>
							<option>How I met your mother</option>
							<option>Fargo</option>
							<option>True Detective</option>
						</select>
					</div>
					<div class="campo4 campo">
						<label>Monto</label>
						<input class="campo__caja" type="text">
					</div>
					<!-- <div class="campo5 campo">
						<div class="campo__">
							<label for="">Ingresa tu cupon de descuento</label>
							<div>
								<input class="campo__caja"  type="text">
							</div>
							<button>Procesar Cupón</button>
						</div>
					</div> -->
				</div>
			</div>
			<!-- ============================================ -->
			<!-- <div>
				<div>
					<div>
						<h2>Datos Personales</h2>
					</div>
					<div>
						<label>Pais de residencia</label>
						<select>
							<option>Peru</option>
							<option>How I met your moth</option>
							<option>Fargo</option>
							<option>True Detective</option>
						</select>
					</div>
					<div class='field'>
						<label>DNI</label>
						<div>
							<b>Registre el DNI del estudiante.</b>
							<div>
								<input type='text' required value="DNI" placeholder='Su DNI' />
							</div>
						</div>
					</div>
					<div class='field'>
						<label>Apellido Paterno</label>
						<div>
							<input type='text' required value="Apellido" placeholder='Su Apellido Paterno' />
						</div>
					</div>
					<div class='field'>
						<label>Apellido Materno</label>
						<div>
							<input type='text' required value="Apellido" placeholder='Su Apellido Materno' />
						</div>
					</div>

					<div class="campo">
						<label class="campo__label" for="nombre">Nombre</label>
						<div>
							<input class="campo__field" type="text" placeholder="Sus Nombres" id="nombre">
						</div>
					</div>

				</div>
			</div> -->


		</fieldset>
	</form>

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