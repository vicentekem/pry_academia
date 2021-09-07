<?php

    global $siteName;
    global $currentPage;
    global $menu_sup;
    
    $menu_sup = "Mantenimiento";
    $currentPage = "Tablas";
    
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
                        <h3 style="display: inline-block" > Mantenimiento de Tablas </h3>

                        <div class="ibox-tools">
                        </div>
                    </div>

                    <div class="ibox-content">

                        <div class="row" id="filter_container">

                            <div class="form-group mb-0 col-12 col-md-5 col-lg-3">
                                <label for="cbx_id_tabla" >Tabla</label>
                                <select class="form-control text-uppercase select2 cbx-filter"
                                    name='cbx_id_tabla' id='cbx_id_tabla' style="width: 100%;">

                                </select>
                            </div>

                            <div class="form-group mb-0 col-12 col-md-5 col-lg-7">
                                <label for="txt_search">Buscar</label>
                                <div class="form-group input-group">
                                    <input type="search" id="txt_search" placeholder="Buscar" 
                                        class="form-control text-uppercase txt-filter"/>
                                    <div class="input-group-append">
                                        <button id="btn_search" class="btn btn-info btn-filter"> <span class="fa fa-search btn-filter"></span></button>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group mb-0 col-12 col-md-2">
                                <label for="" style="display:block;opacity:0">...</label>
                                <button id="btn_new_tabla" class="btn btn-success">Nuevo</button>
                            </div>
                        </div>

                        <div class="table-responsive w-100 text-sm mx-0">

                            <table id="tbl_tablas" class="table table-bordered table-hover w-100">
                                <thead>
                                <tr>
                                    <th>Accion</th>
                                    <th>Descripcion</th>
                                    <th>Codigo Ref.</th>
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
