<?php

    global $siteName;
    global $currentPage;
    global $menu_sup;
    
    $menu_sup = "Mantenimiento";
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
    
    <?php include __DIR__ . '/includes/admin/head.php';?>
    <link href="public/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="public/css/plugins/dataTables/datatables.min.css" rel="stylesheet">

</head>
<body>
    <div id="wrapper">

        <?php include __DIR__ . '/includes/admin/menu.php'?>

        <div id="page-wrapper" class="gray-bg dashbard-1">

            <div class="row border-bottom">
                <?php include __DIR__ . '/includes/admin/header.php'?>
            </div>

            <div class="row  border-bottom white-bg dashboard-header">
                <div class="col-md-3">
                    <?php include __DIR__ . '/includes/admin/breadcrumb.php'?>
                </div>
            </div>

            <div class="col-lg-12 px-0 mt-3">
                <div class="ibox">

                    <div class="ibox-title">
                        <h3 style="display: inline-block"> Mantenimiento de Cursos </h3>

                        <div class="ibox-tools">
                        </div>
                    </div>

                    <div class="ibox-content" id="filter_container">

                        <div class="row">

                            <div class="form-group mb-0 col-12 col-md-5 col-lg-11">
                                <label for="txt_search">Buscar</label>
                                <div class="form-group input-group">
                                    <input type="search" id="txt_search" placeholder="Buscar" 
                                        class="form-control text-uppercase txt-filter"/>
                                    <div class="input-group-append">
                                        <button id="btn_search" class="btn btn-info btn-filter"> <span class="fa fa-search btn-filter"></span></button>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-12 col-md-2 col-lg-1 ">
                                <button class="btn btn-success" id="btn_new_curso">
                                    Nuevo
                                </button>
                            </div>
                        </div>

                        <div class="table-responsive w-100 text-sm">
                            <table id="tbl_curso" class="table table-bordered table-hover w-100">
                                <thead>
                                <tr>
                                    <th>Accion</th>
                                    <th>Descripcion</th>
                                    <th>Estado</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>

            </div>


        </div>
    </div>

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

</body>
</html>
