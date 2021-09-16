<?php

    global $siteName;
    global $currentPage;
    global $menu_sup;
    
    $menu_sup = "Procesos";
    $currentPage = "PROGRAMAR CURSO";
    
    if (!isset($_SESSION["usuario_academia"])) {
        header('location:?url=login');
    }

    $action = isset($_GET["action"]) ? $_GET["action"] : "";

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
                        <h3 style="display: inline-block"> Mantenimiento de Curso Programado </h3>
                        <div class="ibox-tools">
                            <?php if($action !== "list" && $action !== ""){ ?>
                                <a href="?url=curso_programado&action=list" class="btn btn-success" style="color:white !important">Ir a listado</a>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="ibox-content" id="filter_container">

                        <?php                            
                            switch($action){
                                case 'ins'  : include __DIR__ . "/includes/partials/curso_programado/form_curso_programado.php";break;
                                case 'upd'  : include __DIR__ . "/includes/partials/curso_programado/form_curso_programado.php";break;
                                case 'list' : include __DIR__ . "/includes/partials/curso_programado/list_curso_programado.php";break;
                                default     : include __DIR__ . "/includes/partials/curso_programado/list_curso_programado.php";
                            }
                        ?>

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
    
    <script src="public/js/plugins/inputmask/inputmask.min.js"></script>
    <script src="public/js/plugins/inputmask/inputmask.date.extensions.js"></script>
    <script src="public/js/utilitario/utilitario.js"></script>

    <script src="public/js/scripts/curso_programado.js"></script>

</body>
</html>
