<?php

global $siteName;
global $currentPage;
global $menu_sup;

$currentPage = "Profile";

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
    <link href="public/web/assets/css/profiles.css" rel="stylesheet">

</head>

<body>
    <div id="wrapper">

        <?php include __DIR__ . '/includes/admin/menu.php' ?>

        <div id="page-wrapper" class="gray-bg dashbard-1">

            <div class="row border-bottom">
                <?php include __DIR__ . '/includes/admin/header.php' ?>
            </div>

            <div class="col-lg-12 px-0 mt-3">
                <div class="ibox">

                    <div class="ibox-title">
                        <h3 style="display: inline-block"> Your Profile </h3>

                        <div class="ibox-tools">
                        </div>
                    </div>

                    <div class="ibox-content ">
                        <div class="cont_perfil">
                            <div class="cont_right">
                                <div class="cont_space">
                                    <div class="cont-caja">
                                        <div class="cont_img">
                                            <img class="foto" src="public/img/photo2.jpg" alt="">
                                            <i class="plas fa fa-plus"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <p>Joel vicente Q.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="cont_info">
                                <div class="cont_info_caja">
                                    <h2 class="personal">Persoanl Information</h2>
                                    <div class="cont-datos">
                                        <div class="cont-campo">
                                            <h3>DNI</h3>
                                            <p>70897099</p>
                                        </div>
                                        <div class="cont-campo">
                                            <h3>Email</h3>
                                            <p>admin.edu@gmail.com</p>
                                        </div>
                                        <div class="cont-campo">
                                            <h3>celular</h3>
                                            <p>976543087</p>
                                        </div>
                                        <div class="cont-campo">
                                            <h3>Direccion</h3>
                                            <p>admin.edu@gmail.com</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>


        </div>
    </div>

    <?php include __DIR__ . "/includes/templates/cbx_templates.php" ?>
    <?php include __DIR__ . "/includes/partials/tablas/modal_tablas.php" ?>
    <?php include __DIR__ . "/includes/admin/scripts.php" ?>

    <script src="public/js/plugins/dataTables/datatables.min.js"></script>
    <script src="public/js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
    <script src="public/js/plugins/mustache/mustache.min.js"></script>
    <script src="public/js/plugins/select2/select2.full.min.js"></script>
    <script src="public/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="public/js/utilitario/utilitario.js"></script>

    <script src="public/js/scripts/tablas.js"></script>

</body>

</html>