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
                                <a href="?url=inicio">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1.25em" height="1.25em" viewBox="0 0 24 24" style="fill: #7a7a7a;transform: ;msFilter:;">
                                        <path d="M3 13h1v7c0 1.103.897 2 2 2h12c1.103 0 2-.897 2-2v-7h1a1 1 0 0 0 .707-1.707l-9-9a.999.999 0 0 0-1.414 0l-9 9A1 1 0 0 0 3 13zm7 7v-5h4v5h-4zm2-15.586 6 6V15l.001 5H16v-5c0-1.103-.897-2-2-2h-4c-1.103 0-2 .897-2 2v5H6v-9.586l6-6z"></path>
                                    </svg>
                                </a>
                            </div>

                            <!-- whatsapp -->
                            <div class="btn-ico social-ico">
                                <a href="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1.25em" height="1.25em" viewBox="0 0 14 14" class="svg-icon s-color-text normal s-mr-1 whatsapp" id="" fill="currentColor" title="">
                                        <path d="M12.036,1.964A6.707,6.707,0,0,0,1.42,9.944L0,14l4.056-1.42a6.707,6.707,0,0,0,7.98-10.616ZM10.609,9.2l-.774.774c-.641.641-2.461-.139-4.065-1.742S3.387,4.807,4.028,4.165L4.8,3.391a.411.411,0,0,1,.581,0l.968.968a.411.411,0,0,1,0,.581L5.77,5.52A5.7,5.7,0,0,0,8.48,8.23l.581-.581a.411.411,0,0,1,.581,0l.968.968A.411.411,0,0,1,10.609,9.2Z"></path>
                                    </svg>
                                </a>
                            </div>

                            <!-- phone-->
                            <div class="btn-ico social-ico">
                                <a href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1.25em" height="1.25em" viewBox="0 0 24 24" style="fill: #7a7a7a;transform: ;msFilter:;">
                                        <path d="M17.707 12.293a.999.999 0 0 0-1.414 0l-1.594 1.594c-.739-.22-2.118-.72-2.992-1.594s-1.374-2.253-1.594-2.992l1.594-1.594a.999.999 0 0 0 0-1.414l-4-4a.999.999 0 0 0-1.414 0L3.581 5.005c-.38.38-.594.902-.586 1.435.023 1.424.4 6.37 4.298 10.268s8.844 4.274 10.269 4.298h.028c.528 0 1.027-.208 1.405-.586l2.712-2.712a.999.999 0 0 0 0-1.414l-4-4.001zm-.127 6.712c-1.248-.021-5.518-.356-8.873-3.712-3.366-3.366-3.692-7.651-3.712-8.874L7 4.414 9.586 7 8.293 8.293a1 1 0 0 0-.272.912c.024.115.611 2.842 2.271 4.502s4.387 2.247 4.502 2.271a.991.991 0 0 0 .912-.271L17 14.414 19.586 17l-2.006 2.005z"></path>
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
                        <!--=== DNI===-->
                        <div class=" focus-des campo1 campo-space">
                            <input id="txt_dni" class="input-des" type="text" placeholder='Su DNI'>
                        </div>

                        <!--=== Apellido Paterno===-->
                        <div class=" focus-des campo2  campo-space">
                            <input id="txt_ape_pat" class="input-des" type="text" placeholder='Su Apellido Paterno'>
                        </div>

                        <!--=== Apellido Materno===-->
                        <div class=" focus-des campo3  campo-space">
                            <input id="txt_ape_mat" class="input-des" type="text" placeholder='Su Apellido Materno'>
                        </div>

                        <!--=== Nombres ===-->
                        <div class=" focus-des campo4  campo-space">
                            <input id="txt_nombre" class="input-des" type="text" placeholder='Sus Nombres'>
                        </div>

                        <!--=== correo ===-->
                        <div class=" focus-des campo6  campo-space">
                            <input id="txt_correo" class="input-des" type="email" placeholder='Su Correo Electronico'>
                        </div>

                    </div>

                    <div>
                        <div class="btn__go btn-2 campo-desc">
                            <a href="?url=inscripcion" class="btn__center">
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

</html>