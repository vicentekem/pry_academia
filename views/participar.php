<?php

    global $siteName;
    global $currentPage;
    global $menu_sup;
    
    $menu_sup = "Procesos";
    $currentPage = "Participar";
    
    if (!isset($_SESSION["usuario_academia"])) {
        header('location:?url=login');
    }

    $id_concurso = isset($_GET["id"]) ? $_GET["id"] : "";

?>
<!DOCTYPE html>
<html>
<head>
    
    <link href="public/css/plugins/select2/select2.min.css" rel="stylesheet">
    <link href="public/css/plugins/select2/select2-bootstrap4.min.css" rel="stylesheet">
    
    <?php include __DIR__ . '/includes/admin/head.php';?>
    <link href="public/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="public/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="public/web/assets/css/preguntas.css" rel="stylesheet">

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
                    <?php 
                        if( $id_concurso != "" && is_numeric( $id_concurso ) ){
                            include_once __DIR__ . '/includes/partials/concurso/concurso.php';
                        }else{
                            include_once __DIR__ . '/includes/partials/concurso/list_concurso_inscripcion.php';
                        }
                    ?>

                </div>
                

            </div>

        </div>
    </div>

    <?php include __DIR__ . "/includes/templates/cbx_templates.php" ?>
    <?php include __DIR__ . "/includes/partials/pago/modal_adj_pago.php" ?>
    <?php include __DIR__ . "/includes/partials/pago/modal_view_pago.php" ?>
    <?php include __DIR__ . "/includes/partials/pago/modal_check_pago.php" ?>
    <?php include __DIR__ . "/includes/admin/scripts.php" ?>

    <script src="public/js/plugins/dataTables/datatables.min.js"></script>
    <script src="public/js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
    <script src="public/js/plugins/mustache/mustache.min.js"></script>
    <script src="public/js/plugins/select2/select2.full.min.js"></script>
    <script src="public/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="public/js/utilitario/utilitario.js"></script>    

    <script src="public/js/scripts/participar.js"></script>

</body>
</html>
