<?php

    global $siteName;
    global $currentPage;
    global $menu_sup;
    
    $menu_sup = "Mantenimiento";
    $currentPage = "Cursos";
    
    if (!isset($_SESSION["usuario_academia"])) {
        header('location:?url=login');
    }
?>
<!DOCTYPE html>
<html>
<head>
    
    <?php include __DIR__ . '/includes/admin/head.php';?>
    <link href="public/js/plugins/dataTable/datatables.min.css" rel="stylesheet">

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

                    <div class="ibox-content">

                        <div class="row">

                            <div class="form-group input-group col-12 col-md-7 col-lg-11">
                                <input type="search" id="txt_fltr_nombre" placeholder="Buscar"
                                        class="form-control text-uppercase" oninput="buscarTabla()"/>
                                <div class="input-group-append">
                                    <button class="btn btn-info" onclick="buscarTabla()">
                                        <span class="fa fa-search"></span>
                                    </button>
                                </div>
                            </div>

                            <div class="form-group col-12 col-md-2 col-lg-1 ">
                                <button class="btn btn-success" onclick="openModal('ins_dependencia')">
                                    Nuevo
                                </button>
                            </div>
                        </div>

                        <div class="table-responsive w-100 text-sm">
                            <table id="lista_datatables" class="table table-bordered table-hover">
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

    <?php include __DIR__ . "/includes/admin/scripts.php" ?>
    
    <script src="public/js/plugins/dataTables/datatables.min.js"></script>    
    <script src="public/js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
    <script src="public/js/plugins/mustache/mustache.min.js"></script>
    <script src="public/js/utilitario/utilitario.js"></script>

</body>
</html>
