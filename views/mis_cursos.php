<?php

global $siteName;
global $currentPage;
global $menu_sup;

$menu_sup = "Cursos";
$currentPage = "Curso";

if (!isset($_SESSION["usuario_academia"])) {
    header('location:?url=login');
}
?>
<!DOCTYPE html>
<html>

<head>

    <link href="public/css/plugins/select2/select2.min.css" rel="stylesheet">
    <link href="public/css/plugins/select2/select2-bootstrap4.min.css" rel="stylesheet">

    <?php include __DIR__ . '/includes/admin/head.php'; ?>
    <link href="public/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="public/css/plugins/dataTables/datatables.min.css" rel="stylesheet">

</head>

<body>
    <div id="wrapper">

        <?php include __DIR__ . '/includes/admin/menu.php' ?>

        <div id="page-wrapper" class="gray-bg dashbard-1">

            <div class="row border-bottom">
                <?php include __DIR__ . '/includes/admin/header.php' ?>
            </div>

            <div class="row  border-bottom white-bg dashboard-header">
                <div class="col-md-3">
                    <?php include __DIR__ . '/includes/admin/breadcrumb.php' ?>
                </div>
            </div>
            <div class="ibox-title mt-2 mb-2">
                <h3 style="display: inline-block; text-transform:capitalize"> Estos son los cursos en los que estas inscritos</h3>

               
            </div>

            <div id="contenedor-curso" class="row">
                <?php include "views/includes/templates/card_curso_inscrito.php"; ?>

                <!-- <div class="col-lg-4">
                    <div class=" contact-box" style="min-height: 171px ">
                        <a style=" align-items: center" class="row" href="?url=detalle">
                            <div class="col-5">
                                <div class="text-center">
                                    <div>
                                        <img alt="image" class="m-t-xs img-fluid" src="public/web/assets/img/cursos/curso1.jpg">
                                    </div>
                                    <div style="text-transform:uppercase" class="m-t-xs font-bold">Algebra</div>
                                </div>
                            </div>
                            <div class="col-7">
                                <h3><strong>Status</strong></h3>

                                <p style="margin:0">
                                    <i class="fa fa-angle-double-right"></i>
                                    <strong>Curso:</strong> <span>En proceso</span>

                                </p>
                                <p style="margin:0">
                                    <i class="fa fa-angle-double-right"></i>
                                    <strong>fecha de Termino:</strong> <span>24/09/2021</span>

                                </p>

                                <p style="margin:0">
                                    <i class="fa fa-angle-double-right"></i>
                                    <strong>Profesor.</strong> <span>Lorem ipsum, </span>

                                </p>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class=" contact-box" style="min-height: 171px">
                        <a style=" align-items: center" class="row" href="?url=detalle">
                            <div class="col-5">
                                <div class="text-center">
                                    <div>
                                        <img alt="image" class="m-t-xs img-fluid" src="public/web/assets/img/cursos/curso1.jpg">
                                    </div>
                                    <div style="text-transform:uppercase" class="m-t-xs font-bold">Razonamiento Matematico</div>
                                </div>
                            </div>
                            <div class="col-7">
                                <h3><strong>Status</strong></h3>

                                <p style="margin:0">
                                    <i class="fa fa-angle-double-right"></i>
                                    <strong>Curso:</strong> <span>En proceso</span>

                                </p>
                                <p style="margin:0">
                                    <i class="fa fa-angle-double-right"></i>
                                    <strong>fecha de Termino:</strong> <span>24/09/2021</span>

                                </p>

                                <p style="margin:0">
                                    <i class="fa fa-angle-double-right"></i>
                                    <strong>Profesor.</strong> <span>Lorem ipsum, </span>

                                </p>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class=" contact-box" style="min-height: 171px">
                        <a style=" align-items: center" class="row" href="?url=detalle">
                            <div class="col-5">
                                <div class="text-center">
                                    <div>
                                        <img alt="image" class="m-t-xs img-fluid" src="public/web/assets/img/cursos/curso1.jpg">
                                    </div>
                                    <div style="text-transform:uppercase" class="m-t-xs font-bold">Trigonometria</div>
                                </div>
                            </div>
                            <div class="col-7">
                                <h3><strong>Status</strong></h3>

                                <p style="margin:0">
                                    <i class="fa fa-angle-double-right"></i>
                                    <strong>Curso:</strong> <span>En proceso</span>

                                </p>
                                <p style="margin:0">
                                    <i class="fa fa-angle-double-right"></i>
                                    <strong>fecha de Termino:</strong> <span>24/09/2021</span>

                                </p>

                                <p style="margin:0">
                                    <i class="fa fa-angle-double-right"></i>
                                    <strong>Profesor.</strong> <span>Lorem ipsum, </span>

                                </p>
                            </div>
                        </a>
                    </div>
                </div> -->
            </div>

        </div>
    </div>
    <?php include "views/includes/templates/card_curso_template.php"; ?>


    <?php include __DIR__ . "/includes/templates/cbx_templates.php" ?>
    <?php include __DIR__ . "/includes/partials/curso/modal_curso.php" ?>
    <?php include __DIR__ . "/includes/admin/scripts.php" ?>

    <script src="public/js/plugins/dataTables/datatables.min.js"></script>
    <script src="public/js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
    <script src="public/js/plugins/mustache/mustache.min.js"></script>
    <script src="public/js/plugins/select2/select2.full.min.js"></script>
    <script src="public/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="public/js/utilitario/utilitario.js"></script>

    <script src="public/js/scripts/curso.js"></script>



    <script src="public/js/plugins/mustache/mustache.min.js"></script>
    <script src="public/js/utilitario/utilitario.js"></script>
    <script src="public/js/scripts/mis_cursos.js"></script>

</body>

</html>