<?php

global $siteName;
global $currentPage;
global $menu_sup;

$menu_sup = "Mantenimiento";
$currentPage = "Concurso";

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
                        <h3 style="display: inline-block"> Lista de Concurso </h3>

                        <div class="ibox-tools">
                        </div>
                    </div>

                    <div class="ibox-content" id="filter_container">

                        <div class="row">
                            <div class="form-group mb-0 col-12 col-md-5 col-lg-10">
                                <label>Buscar</label>
                                <div class="form-group input-group">
                                    <input type="search" placeholder="Buscar" class="form-control text-uppercase txt-filter">
                                    <div class="input-group-append">
                                        <button class="btn btn-info btn-filter">
                                            <span class="fa fa-search btn-filter"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group mb-0 col-12 col-md-2">
                                <label for="" style="display:block;opacity:0">...</label>
                                <a href="?url=nuevo" class="btn btn-success">Nuevo</a>
                            </div>

                        </div>

                        <div class="table-responsive w-100 text-sm">
                            <div class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="dataTables_length">
                                            <label>
                                                Mostrar registros
                                                <select class="form-control form-control-sm">
                                                    <option value="10">10</option>
                                                    <option value="25">25</option>
                                                    <option value="50">50</option>
                                                    <option value="100">100</option>
                                                </select>

                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6"></div>
                                </div>

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
                                                    <td>
                                                        <div class="text-center"> <a class="fa fa-edit  text-warning upd-row" id="upd_0" href="?url=editar" style="font-size: 1.1em"></a> <a class="fa fa-times text-danger   est-row" id="est_0" href="#" style="font-size: 1.1em"></a></div>
                                                    </td>
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