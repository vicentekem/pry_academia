<?php

global $siteName;
global $currentPage;
global $menu_sup;

$menu_sup = "Mantenimiento";
$currentPage = "Personal";

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
            <div class="col-lg-12 px-0 mt-3">
                <div class="ibox">
                    <div class="ibox-title">
                        <h3 style="display: inline-block"> Editar </h3>

                        <div class="ibox-tools">
                        </div>
                    </div>

                    <div class="ibox-content" id="filter_container">

                        <div class="row">
                            <input type="hidden" id="txt_crud_id" value="1">
                            <input type="hidden" id="txt_crud_action" value="upd_curso_programado">

                            <div class="col-12 col-lg-4 row mx-0 px-1">

                                <div class="form-group col-12 px-1">
                                    <img class="w-100" id="img_curso_programado" src="public/img/default.png" alt="">
                                </div>

                                <div class="form-group col-12 px-1">
                                    <input id="fl_crud_img_curso" type="file" class="">
                                </div>
                            </div>

                            <div class="col-12 col-lg-8 row mx-0 px-1 align-items-start align-content-start">
                                <!-- curso -->
                                <div class="form-group col-12 px-1">
                                    <label>Curso<span class="text-danger">*</span> </label>
                                    <select class="form-control " tabindex="-1">
                                        <option value="">-SELECCIONE-</option>
                                        <option value="1"> ARITMETICA </option>
                                        <option value="2"> ALGEBRA </option>
                                        <option value="3"> GEOMETRIA </option>
                                        <option value="4"> TRIGONOMETRIA </option>
                                        <option value="6"> ONEM </option>
                                        <option value="7"> CONAMAT </option>
                                        <option value="8"> NOMBRAMIENTO </option>
                                        <option value="9"> ACSCENSO DE NIVEL ESPECIALIZACION </option>
                                        <option value="10"> NUEVO CURO </option>
                                    </select>
                                    <span class="select2 select2-container select2-container--bootstrap4 select2-container--disabled" dir="ltr" data-select2-id="1" style="width: 100%;">
                                    </span>
                                </div>
                                <!-- profesor -->
                                <div class="form-group col-12 px-1">
                                    <label>Descripcion<span class="text-danger">*</span> </label>
                                    <textarea class="form-control" rows="3"></textarea>
                                </div>



                                <div class="form-group col-12 col-lg-4 px-1">
                                    <label>Fecha<span class="text-danger">*</span> </label>
                                    <input class="form-control" data-mask="99/99/9999" placeholder="">
                                </div>

                                <div class="form-group col-12 col-lg-4 px-1">
                                    <label>Hora inicio<span class="text-danger">*</span> </label>
                                    <input class="form-control" " placeholder="">
                        </div>
                        <div class=" form-group col-12 col-lg-4 px-1">
                                    <label>Hora fin<span class="text-danger">*</span> </label>
                                    <input class="form-control" " placeholder="">
                        </div>

                    </div>

                   <div class=" table-responsive w-100 text-sm">
                                    <div class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">


                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table class="table table-bordered table-hover w-100 dataTable no-footer" role="grid" style="width: 1199px;">
                                                    <thead>
                                                        <tr role="row">
                                                            <th class="sorting_disabled" style="width: 78.8833px;">Accion</th>
                                                            <th class="sorting_disabled" style="width: 222.883px;">Nombre</th>
                                                            <th class="sorting_disabled" style="width: 276.883px;">Descripcion</th>
                                                            <th class="sorting_disabled" style="width: 114.883px;">Fecha</th>
                                                            <th class="sorting_disabled" style="width: 139.883px;">Hora Inicio</th>
                                                            <th class="sorting_disabled" style="width: 129.883px;">Hora Fin</th>
                                                            <th class="sorting_disabled" style="width: 117px;">Estado</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <tr role="row" class="odd">
                                                            <td class="text-center"><a href="#" class="text-danger fa fa-trash" data-iditem="61" title="eliminar" style="font-size:1.2em"></a></td>
                                                            <td>RAZONAMIENTO MATEMATICO</td>
                                                            <td>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione sunt inventore deserunt ducimus officiis.</td>
                                                            <td>06/09/2021</td>
                                                            <td>8:00 am</td>
                                                            <td>10:00 am</td>
                                                            <td>
                                                                <div class="text-center"><small class="label label-primary">Activado</small></div>
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 col-md-5">
                                                <div class="dataTables_info">Mostrando registros del 1 al 4 de un total de 4 registros</div>
                                            </div>
                                            <div class="col-sm-12 col-md-7">
                                                <div class="dataTables_paginate paging_simple_numbers">
                                                    <ul class="pagination">
                                                        <li class="paginate_button page-item previous disabled"><a href="#" aria-controls="tbl_curso_programado" class="page-link">Anterior</a></li>
                                                        <li class="paginate_button page-item active"><a href="#" class="page-link">1</a></li>
                                                        <li class="paginate_button page-item next disabled"><a href="#" aria-controls="tbl_curso_programado" class="page-link">Siguiente</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col-12">
                                        <button type="button" id="btn_save_curso_programado" form="frm_crud_curso" class="btn btn-primary">Guardar</button>
                                    </div>
                                </div>

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