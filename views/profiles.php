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
                    <!-- Formulario -->
                    <form class="ibox-content ">
                        <fieldset class="cont_perfil">

                            <!-- Imagen y nombre de usuario -->
                            <div class="cont_right">
                                <div class="cont_space">

                                    <!--Imagen de Usuario  -->
                                    <div class="cont-caja">
                                        <div class="cont_img">
                                            <img class="foto" src="public/img/photo2.jpg" alt="">
                                            <label for="file">
                                                <input id="file" type="file" accept="image/*">
                                                <i class="plas fa fa-camera"></i>
                                            </label>
                                        </div>
                                    </div>

                                    <!-- nombre de Usuario -->
                                    <label for="nombre" class="cont-nombre">
                                        <input id="nombre" type="text" class="nombre" placeholder="My Name">
                                        <i class="edit fa fa-pencil"></i>
                                    </label>
                                </div>
                            </div>
                            <!-- ====================== -->


                            <!-- Persoanl Information -->
                            <div class="cont_info">
                                <div class="cont_info_caja">
                                    <h2 class="personal">Persoanl Information</h2>

                                    <div class="cont-datos">

                                        <!-- DNI -->
                                        <label class="cont-campo">
                                            <h3>DNI</h3>
                                            <div class="cont-data">
                                                <input class="input" type="text" placeholder="70896533">
                                                <i class="edit fa fa-pencil"></i>
                                            </div>
                                        </label>
                                        <!-- ============== -->

                                        <!-- Correo -->
                                        <label class="cont-campo">
                                            <h3>Email</h3>
                                            <div class="cont-data">
                                                <input class="input" type="email" placeholder="admin.edu@gmail.com">
                                                <i class="edit fa fa-pencil"></i>
                                            </div>
                                        </label>
                                        <!-- ============== -->

                                        <!-- Celular -->
                                        <label class="cont-campo">
                                            <h3>Celular</h3>
                                            <div class="cont-data">
                                                <input class="input" type="text" placeholder="983564829">
                                                <i class="edit fa fa-pencil"></i>
                                            </div>

                                        </label>
                                        <!-- ============== -->

                                        <!-- Direccion -->
                                        <label class="cont-campo">
                                            <h3>Direccion</h3>
                                            <div class="cont-data">
                                                <input class="input" type="text" placeholder="av. Ramos la Rea 123">
                                                <i class="edit fa fa-pencil"></i>
                                            </div>
                                        </label>
                                        <!-- ============== -->

                                        <!-- Submit -->

                                    </div>


                                    <div class="enviar">
                                        <input  class="btn_enviar" type="submit"
                                        value="Guardar">
                                    </div>
                                </div>
                            </div>


                        </fieldset>
                    </form>


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