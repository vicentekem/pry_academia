<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- inscripcion -->
    <link href="public/web/assets/css/inscripcion.css" rel="stylesheet">
    <!-- template Matricula virtual -->
    <link href="public/web/assets/css/from.css" rel="stylesheet">
    <!-- banner -->
    <link href="public/web/assets/css/banner.css" rel="stylesheet">
    <!-- temario -->
    <link href="public/web/assets/css/temarios.css" rel="stylesheet">

    <link href="public/css/plugins/toastr/toastr.min.css" rel="stylesheet">



</head>

<body>
    <div>
        <div class="form-ims">
            <div class="img-desc">
                <!-- <img src="public/web/assets/img/photo.jpg" alt=""> -->
            </div>
            <div class="contenido-desc">
                <div class="header-desc">
                    <div class="desc-logo">
                        <div class="cont-logo">
                            <img src="public/web/assets/img/logo.svg" alt="">
                        </div>
                    </div>
                    <div class="desc-social">
                        <div class="social-flex">
                            <!-- Home -->
                            <div class="btn-ico social-ico">
                                <a href="?url=inicio" class="icon-insc" title="Home">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1.25em" height="1.25em" class="h-6 w-6 svg-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                                    </svg>
                                </a>
                            </div>

                            <!-- whatsapp -->
                            <div class="btn-ico social-ico">
                                <a href="" class="icon-insc" title="Whatsapp">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1.25em" height="1.25em" viewBox="0 0 14 14" class="svg-icon s-color-text normal s-mr-1 whatsapp" id="" fill="currentColor" title="">
                                        <path d="M12.036,1.964A6.707,6.707,0,0,0,1.42,9.944L0,14l4.056-1.42a6.707,6.707,0,0,0,7.98-10.616ZM10.609,9.2l-.774.774c-.641.641-2.461-.139-4.065-1.742S3.387,4.807,4.028,4.165L4.8,3.391a.411.411,0,0,1,.581,0l.968.968a.411.411,0,0,1,0,.581L5.77,5.52A5.7,5.7,0,0,0,8.48,8.23l.581-.581a.411.411,0,0,1,.581,0l.968.968A.411.411,0,0,1,10.609,9.2Z"></path>
                                    </svg>
                                </a>
                            </div>

                            <!-- phone-->
                            <div class="btn-ico social-ico">
                                <a href="#" class="icon-insc" title="Celular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1.25em" height="1.25em" class="h-6 w-6 svg-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                                    </svg>
                                    <p>+51 912-234-234</p>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="titulo-desc">
                        <h2>¡Regístrate y te enviaremos <br> toda la información!</h2>
                    </div>
                </div>

                
                <div class="flex-desc">
                    <div class="campo-desc">
                        <!--=== Curso ===-->
                        <div class=" focus-des campo1 campo-space ">
                            <input id="txt_concurso" class=" input-des bloqueo" type="text" disabled>
                        </div>
                        <!--=== DNI===-->
                        <div class=" focus-des campo1 campo-space">
                            <input id="txt_dni" class="input-des" type="text" placeholder='DNI'>
                        </div>

                        <!--=== Apellido Paterno===-->
                        <div class=" focus-des campo2  campo-space">
                            <input id="txt_ape_pat" class="input-des" type="text" placeholder='Apellido Paterno'>
                        </div>

                        <!--=== Apellido Materno===-->
                        <div class=" focus-des campo3  campo-space">
                            <input id="txt_ape_mat" class="input-des" type="text" placeholder='Apellido Materno'>
                        </div>

                        <!--=== Nombres ===-->
                        <div class=" focus-des campo4  campo-space">
                            <input id="txt_nombre" class="input-des" type="text" placeholder='Nombres'>
                        </div>

                        <!--=== Nombres ===-->
                        <div class=" focus-des campo4  campo-space">
                            <input id="txt_celular" class="input-des" type="text" placeholder='Nro Celular'>
                        </div>

                        <!--=== correo ===-->
                        <div class=" focus-des campo6  campo-space">
                            <input id="txt_correo" class="input-des" type="email" placeholder='Correo Electronico'>
                        </div>

                    </div>
                    <!-- enviar -->
                    <div>
                        <div class="btn__go-desc btn-2 campo-desc">
                            <a href="?url=inscripcion" class="btn__center" id="btn_register">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 15 15" class="svg-icon flex-none svg__icon--btn" id="" fill="currentColor" title="">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.5 14.4951C11.366 14.4951 14.5 11.3611 14.5 7.49512C14.5 3.62912 11.366 0.495117 7.5 0.495117C3.63401 0.495117 0.5 3.62912 0.5 7.49512C0.5 11.3611 3.63401 14.4951 7.5 14.4951ZM7.50002 13.5142C10.8243 13.5142 13.5191 10.8194 13.5191 7.49511C13.5191 4.17084 10.8243 1.47598 7.50002 1.47598C4.17575 1.47598 1.4809 4.17084 1.4809 7.49511C1.4809 10.8194 4.17575 13.5142 7.50002 13.5142Z"></path>
                                    <rect x="5.42188" y="4.58569" width="0.875" height="6.125" rx="0.4375"></rect>
                                    <rect x="5.3125" y="5.19043" width="0.875" height="6.125" rx="0.4375" transform="rotate(-60 5.3125 5.19043)"></rect>
                                    <rect width="0.875" height="6.125" rx="0.4375" transform="matrix(0.5 0.866025 0.866025 -0.5 5.3125 10.1201)"></rect>
                                </svg>
                                <span>Registrate</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="public/js/plugins/toastr/toastr.min.js"></script>
<script src="public/js/plugins/mustache/mustache.min.js"></script>
<script src="public/js/utilitario/utilitario.js"></script>
<script src="public/js/scripts/view_inscripcion.js"></script>

</html>