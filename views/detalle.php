<?php

global $siteName;
global $currentPage;
global $menu_sup;

$menu_sup = "Cursos";
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
            <div class="ibox-title mt-2 mb-2">
                <h3 style="display: inline-block; text-transform:capitalize"> Estos son los cursos en los que estas inscritos</h3>
            </div>

            <div class="ibox-content" id="filter_container">


                <div class="row">
                    <input type="hidden" id="txt_crud_id" value="1">
                    <input type="hidden" id="txt_crud_action" value="upd_curso_programado">

                    <div class="col-12 col-lg-4 row mx-0 px-1">

                        <div class="form-group col-12 px-1">
                            <img class="w-100" id="img_curso_programado" src="public/img/cursos/614e4df2e90d8.png" alt="">
                        </div>


                    </div>

                    <div class="col-12 col-lg-8 row mx-0 px-1 align-items-start align-content-start">
<!-- curso -->
                        <div class="form-group col-12 px-1">
                            <label>Curso<span class="text-danger">*</span> </label>
                            <input class="form-control " type="text">
                            
                        </div>
<!-- profesor -->
                        <div class="form-group col-12 px-1">
                            <label for="cbx_crud_id_profesor">Profesor<span class="text-danger">*</span> </label>
                            <input class="form-control " type="text">
                        </div>

                        <div class="form-group col-12 px-1">
                            <label >Link </label>
                            <input  class="form-control" placeholder="">
                        </div>

                        <div class="form-group col-12 col-lg-4 px-1">
                            <label >Fecha inicio<span class="text-danger">*</span> </label>
                            <input class="form-control" data-mask="99/99/9999" placeholder="">
                        </div>

                        <div class="form-group col-12 col-lg-4 px-1">
                            <label >Fecha fin<span class="text-danger">*</span> </label>
                            <input class="form-control" data-mask="99/99/9999" placeholder="">
                        </div>

                    </div>

                    <div class="col-12 col-lg-5 row mx-0 px-1 align-items-start align-content-start">

                        <div class="col-12 col-lg-6 row mx-0 px-0 align-items-start align-content-start">
                            <div class="form-group col-12 px-0">
                                <label for="cbx_crud_id_tipo_pago">Tipo de Pago<span class="text-danger">*</span> </label>
                                <input class="form-control" type="text" placeholder="">
                            
                            </div>
                        </div>

                        <div class="col-12 col-lg-6 row mx-0 px-0 align-items-start align-content-start">
                            <div class="form-group col-12 px-0">
                                <label for="cbx_crud_id_tipo_pago">Monto<span class="text-danger">*</span> </label>
                                <input class="form-control" type="text" placeholder="">
                            
                            </div>
                        </div>

                        <div class="table-responsive w-100 text-sm">
                            <table class="table table-hover w-100">
                                <thead>
                                    <tr>
                                        <th class="bg-success">Accion</th>
                                        <th class="bg-success">Tipo Pago</th>
                                        <th class="bg-success">Monto</th>
                                    </tr>
                                </thead>
                                <tbody id="tbl_tipo_pago">
                                    <tr>
                                        <td class="text-center"><a href="#" class="text-success fa fa-check" data-iditem="11" title="curso" style="font-size:1.2em"></a></td>
                                        <td>MATRICULA</td>
                                        <td>70.50</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-12 col-lg-7 row mx-0 px-1 align-items-start align-content-start">

                        <div class="col-12 col-lg-5 row mx-0 px-0 align-items-start align-content-start">
                            <div class="form-group col-12 px-0">
                                <label >Turno<span class="text-danger">*</span> </label>
                                <input class="form-control" type="text" placeholder="">
                            </div>
                        </div>

                        <div class="col-12 col-lg-3 row mx-0 px-0 pl-1 align-items-start align-content-start">
                            <div class="form-group col-12 px-0">
                                <label >Hora Inicio<span class="text-danger">*</span> </label>
                                <input class="form-control">
                            </div>
                        </div>

                        <div class="col-12 col-lg-3 row mx-0 px-0 pl-1 align-items-start align-content-start">
                            <div class="form-group col-12 px-0">
                                <label >Hora Fin<span class="text-danger">*</span> </label>
                                <input  class="form-control">
                            </div>
                        </div>

                        <div class="table-responsive w-100 text-sm">
                            <table class="table table-hover w-100">
                                <thead>
                                    <tr >
                                        <th class="bg-success ">Turno</th>
                                        <th class="bg-success ">Hora Inicio</th>
                                        <th class="bg-success ">Hora Fin</th>
                                    </tr>
                                </thead>
                                <tbody id="tbl_turno">
                                    <tr>
                                        <td>TARDE</td>
                                        <td>08:00 AM</td>
                                        <td>11:00 AM</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- <div class="form-group col-12">
                        <button type="button" id="btn_save_curso_programado" form="frm_crud_curso" class="btn btn-primary">Guardar</button>
                    </div> -->

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