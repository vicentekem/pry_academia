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

    <?php include __DIR__ . '/includes/admin/head.php';?>
    <link href="public/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <style>
        #tbl_tablas_wrapper{
            padding-left : 0 !important;
            padding-right : 0 !important;            
        }       
    </style>
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
                        <h3 style="display: inline-block"> Mantenimiento de Tablas </h3>

                        <div class="ibox-tools">
                        </div>
                    </div>

                    <div class="ibox-content">

                        <div class="row">

                            <div class="form-group mb-0 col-12 col-md-5">
                                <label for="cbx_id_tabla">Tabla</label>
                                <select class='form-control text-uppercase' onchange = "crud_tablas.reloadTable()"
                                        name='cbx_id_tabla' id='cbx_id_tabla' style="width: 100%;">
                                    <option>-Seleccione-</option>
                                </select>
                            </div>

                            <div class="form-group mb-0 col-12 col-md-5">
                                <label for="txt_search">Buscar</label>
                                <div class="form-group input-group">
                                    <input type="search" id="txt_search" placeholder="Buscar"
                                        class="form-control text-uppercase" onsearch="crud_tablas.reloadTable()"/>
                                    <div class="input-group-append">
                                        <button class="btn btn-info" onclick="crud_tablas.reloadTable()">
                                            <span class="fa fa-search"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group mb-0 col-12 col-md-2">
                                <label for="" style="display:block;opacity:0" >...</label>
                                <button class="btn btn-success" onclick="openModal('ins_dependencia')">
                                    Nuevo
                                </button>
                            </div>
                        </div>

                        <div class="table-responsive w-100 text-sm mx-0">

                            <table id="tbl_tablas" class="table table-bordered table-hover w-100">
                                <thead>
                                <tr>
                                    <th>Accion</th>
                                    <th>Descripcion</th>
                                    <th>Codigo Referencial</th>
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


    <?php include __DIR__ . "/includes/admin/scripts.php" ?>

    <script src="public/js/plugins/dataTables/datatables.min.js"></script>
    <script src="public/js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
    <script src="public/js/my_functions.js"></script>

    <script src="public/js/scripts/tablas.js"></script>

</body>
</html>
