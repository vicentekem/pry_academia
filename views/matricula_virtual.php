<?php include "views/includes/public/head.php"; ?>

<body>

	<?php include "views/includes/public/menu.php"; ?>

	<!-- ================================================================= -->

	<form class="container">
		<fieldset class="from__padre">
			<!-- ============================================ -->
			<div class="from__header from__header--spacio">
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
					<div class="campo4 campo ">
						<label>Monto</label>
						<input class="campo__caja bloqueo" type="text" disabled>
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
			<div class="from__header">
				<div class="from__matricula">
					<div class="from__titulo-matricula  from__before--header">
						<h2>Datos Personales</h2>
					</div>
					<div class="from__matricula  from__datos--personal">
						<!--=== DNI ===-->
						<div class="campo campo1 campo__campo">
							<label>DNI</label>
							<input class="campo__caja" type="text" placeholder='Su DNI'>
						</div>

						<!--=== Apellido Paterno===-->
						<div class="campo campo2 campo__campo">
							<label>Apelido Paterno</label>
							<input class="campo__caja" type="text" placeholder='Su Apellido Paterno'>
						</div>

						<!--=== Apellido Materno===-->
						<div class="campo campo3 campo__campo">
							<label>Apelido Materno</label>
							<input class="campo__caja" type="text" placeholder='Su Apellido Materno'>
						</div>

						<!--=== Nombres ===-->
						<div class="campo campo4 campo__campo">
							<label>Nombres</label>
							<input class="campo__caja" type="text" placeholder='Sus Nombres'>
						</div>

						<!--=== Departamento de Residencia ===-->
						<div class="campo campo5 campo__campo">
							<label class="campo__label">Departamento de residencia</label>
							<select class="campo__caja">
								<option>Lost</option>
								<option>How I met your mother</option>
								<option>Fargo</option>
								<option>True Detective</option>
							</select>
						</div>

						<!--=== Provincia de Residenci ===-->
						<div class="campo campo5 campo__campo">
							<label class="campo__label">Provincia de residencia</label>
							<select class="campo__caja">
								<option>Lost</option>
								<option>How I met your mother</option>
								<option>Fargo</option>
								<option>True Detective</option>
							</select>
						</div>

						<!--=== Distrito de Residenci ===-->
						<div class="campo campo5 campo__campo">
							<label class="campo__label">Distrito de residencia</label>
							<select class="campo__caja">
								<option>Lost</option>
								<option>How I met your mother</option>
								<option>Fargo</option>
								<option>True Detective</option>
							</select>
						</div>

						<!--=== Correo ===-->
						<div class="campo campo6 campo__campo">
							<label>Correo Electronico</label>
							<input class="campo__caja" type="email" placeholder='Su Correo Electronico'>
						</div>

						<!--=== Confirme Correo Electronico ===-->
						<div class="campo campo7 campo__campo">
							<label>Confirme Correo Electronico </label>
							<input class="campo__caja" type="email" placeholder='Su Correo Electronico '>
						</div>

						<!--=== Celular ===-->
						<div class="campo campo1 campo__campo">
							<label>Celular</label>
							<input class="campo__caja" type="text" placeholder='Su DNI'>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================ -->
			<div class="from__caja--boton">
				<button class="from__btn transparent" id="sign-in-btn">
				Enviar
				</button>
			</div>

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