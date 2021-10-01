<?php

    global $siteName;
    global $currentPage;
    global $menu_sup;

    $menu_sup = "Cursos";
    $currentPage = "Mis Cursos";

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

            <?php
                switch($action){
                    case 'view' : include __DIR__ . "/includes/partials/mis_cursos/detalle.php";break;
                    case 'list' : include __DIR__ . "/includes/partials/mis_cursos/cursos.php";break;
                    default     : include __DIR__ . "/includes/partials/mis_cursos/cursos.php";
                }
            ?>
            

        </div>
    </div>


    <?php include __DIR__ . "/includes/templates/cbx_templates.php" ?>
    <?php include __DIR__ . "/includes/templates/card_curso_inscrito.php"; ?>
    <?php include __DIR__ . "/includes/templates/detalle_curso_inscrito.php"; ?>
    
    <?php include __DIR__ . "/includes/partials/curso/modal_curso.php" ?>
    <?php include __DIR__ . "/includes/admin/scripts.php" ?>

    <script src="public/js/plugins/dataTables/datatables.min.js"></script>
    <script src="public/js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
    <script src="public/js/plugins/mustache/mustache.min.js"></script>
    <script src="public/js/plugins/select2/select2.full.min.js"></script>
    <script src="public/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="public/js/utilitario/utilitario.js"></script>
    
    <script src="public/js/scripts/mis_cursos.js"></script>

</body>

</html>