<?php

    global $siteName;
    global $currentPage;
    global $menu_sup;
    
    $menu_sup = "Herramientas";
    $currentPage = "Accesos";
    
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
                        <h3 style="display: inline-block"> Accesos x Usuario </h3>
                        <div class="ibox-tools"></div>
                    </div>

                    <div class="ibox-content">

                        <input type="hidden" id="txt_id_persona" value="">
                        <input type="hidden" id="txt_id_persona_usuario" value="1">

                        <div class="w-100 row px-2 pt-2 mb-0 mx-0">

                            <div class="col-12 row mx-0">

                                <div class="col-12 col-md-4">
                                    <div class="form-group">
                                        <label for="cbx_menus">Opciones de Menu</label>
                                        <select class="form-control" name="cbx_menus" id="cbx_menus">
                                            <option value="">[Seleccione]</option><option value="1">
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <select id="cbx_sub_menus" class="form-control" style="width: 100%;height: 180px;" multiple="">

                                        </select>
                                    </div>

                                </div>

                                <div class="col-12 col-md-4 d-flex flex-wrap flex-md-column justify-content-center align-items-center">
                                    <button id="cbx_añadir" type="button" style="width: 130px;font-size: .85em;"  class="btn btn-sm btn-default m-1">Añadir</button>
                                    <button type="button" style="width: 130px;font-size: .85em;" onclick="addAll()" class="btn btn-sm btn-default m-1">Añadir Todos</button>
                                    <button type="button" style="width: 130px;font-size: .85em;" onclick="remove()" class="btn btn-sm btn-default m-1">Quitar</button>
                                    <button type="button" style="width: 130px;font-size: .85em;" onclick="removeAll()" class="btn btn-sm btn-default m-1">Quitar Todos</button>
                                </div>

                                <div class="col-12 col-md-4">
                                    
                                    <div class="form-group">
                                        <label for="cbx_usuarios">Usuario</label>
                                        <select class="form-control" name="cbx_menus" id="cbx_usuarios">
                                            <option value="">[Seleccione]</option><option value="1">
                                        </select>                                        
                                    </div>

                                    <div class="form-group">
                                        <select id="cbx_accesos" class="form-control" style="width: 100%;height: 180px;" multiple="">
                                        </select>
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
    <?php include __DIR__ . "/includes/partials/alumno/modal_alumno.php" ?>
    <?php include __DIR__ . "/includes/admin/scripts.php" ?>


    <?php include "views/includes/templates/cbx_templates.php"; ?>


    <script src="public/js/plugins/dataTables/datatables.min.js"></script>
    <script src="public/js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
    <script src="public/js/plugins/mustache/mustache.min.js"></script>
    <script src="public/js/plugins/select2/select2.full.min.js"></script>
    <script src="public/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="public/js/utilitario/utilitario.js"></script>    

    <!-- <script src="public/js/scripts/accesos.js"></script> -->

    <script src="public/js/scripts/menu_controller.js"></script>


</body>
</html>
