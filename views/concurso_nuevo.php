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
    
    <link href="public/web/assets/css/preguntas.css" rel="stylesheet">

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

                    <div class="ibox-content">
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
                                    <span
                                        class="select2 select2-container select2-container--bootstrap4 select2-container--disabled"
                                        dir="ltr" data-select2-id="1" style="width: 100%;">
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

                        </div>
                    </div>

                    <div class=" ibox-title mt-3">
                        <h3 style="display: inline-block"> Preguntas </h3>
                        <div class="ibox-tools"> </div>
                    </div>
                    <div class="ibox-content">
                        <div class="contenido-card">

                            <!-- nueva pregunta -->
                            <!-- <div class="contenedor_new">
                                <a href="#" class="btn-pregunta">
                                    Nueva pregunta
                                    <i class="icon-fa fa  fa-plus-circle"></i>
                                </a>
                            </div> -->

                            <!-- preguntas 1 -->
                            <div class="contenedor_pregunta">
                                <div class="centro">
                                    <div class="head-preguntas">
                                        <div class="title-pregunta">
                                            <p>Pregunta 1</p>
                                        </div>
                                        <div class="btn-bar">
                                            <!-- <button class="edit-btn" >
                                                <i class="fa fa-pencil"></i> Editar 
                                            </button> -->

                                            <button class="edit-btn" >
                                            <i class="fa fa-trash"></i>
                                            Eliminar
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="centro">
                                        <div class="cuestionario space ">
                                            <div class="text-edi otro" contenteditable>
                                            <p >this is a question?</p>
                                            </div>
                                        </div>
                                </div>

                                <div class="centro">
                                    <div class="text-option space"> 
                                        <div class="option-text" >
                                            <form class="flex-option">
                                                <label for="two"> 
                                                    <input type="radio" checked="checked" name="two">
                                                        I have a car
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" name="two">    
                                                    I have a car
                                                </label>
                                                
                                                <label for="three"> 
                                                    <input type="radio" name="three" >
                                                    I have a boat
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" checked="checked" name="two">
                                                        I have a car
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" name="two">    
                                                    I have a car
                                                </label>
                                                
                                                <label for="three"> 
                                                    <input type="radio" name="three" >
                                                    I have a boat
                                                </label>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- preguntas 2 -->
                            <div class="contenedor_pregunta">
                                <div class="centro">
                                    <div class="head-preguntas">
                                        <div class="title-pregunta">
                                            <p>Pregunta 1</p>
                                        </div>
                                        <div class="btn-bar">
                                            <!-- <button class="edit-btn" >
                                                <i class="fa fa-pencil"></i> Editar 
                                            </button> -->

                                            <button class="edit-btn" >
                                            <i class="fa fa-trash"></i>
                                            Eliminar
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="centro">
                                        <div class="cuestionario space ">
                                            <div class="text-edi otro" contenteditable>
                                            <p >this is a question?</p>
                                            </div>
                                        </div>
                                </div>

                                <div class="centro">
                                    <div class="text-option space"> 
                                        <div class="option-text" >
                                            <form class="flex-option">
                                                <label for="two"> 
                                                    <input type="radio" checked="checked" name="two">
                                                        I have a car
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" name="two">    
                                                    I have a car
                                                </label>
                                                
                                                <label for="three"> 
                                                    <input type="radio" name="three" >
                                                    I have a boat
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" checked="checked" name="two">
                                                        I have a car
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" name="two">    
                                                    I have a car
                                                </label>
                                                
                                                <label for="three"> 
                                                    <input type="radio" name="three" >
                                                    I have a boat
                                                </label>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- preguntas 3 -->
                            <div class="contenedor_pregunta">
                                <div class="centro">
                                    <div class="head-preguntas">
                                        <div class="title-pregunta">
                                            <p>Pregunta 1</p>
                                        </div>
                                        <div class="btn-bar">
                                            <!-- <button class="edit-btn" >
                                                <i class="fa fa-pencil"></i> Editar 
                                            </button> -->

                                            <button class="edit-btn" >
                                            <i class="fa fa-trash"></i>
                                            Eliminar
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="centro">
                                        <div class="cuestionario space ">
                                            <div class="text-edi otro" contenteditable>
                                            <p >this is a question?</p>
                                            </div>
                                        </div>
                                </div>

                                <div class="centro">
                                    <div class="text-option space"> 
                                        <div class="option-text" >
                                            <form class="flex-option">
                                                <label for="two"> 
                                                    <input type="radio" checked="checked" name="two">
                                                        I have a car
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" name="two">    
                                                    I have a car
                                                </label>
                                                
                                                <label for="three"> 
                                                    <input type="radio" name="three" >
                                                    I have a boat
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" checked="checked" name="two">
                                                        I have a car
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" name="two">    
                                                    I have a car
                                                </label>
                                                
                                                <label for="three"> 
                                                    <input type="radio" name="three" >
                                                    I have a boat
                                                </label>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- preguntas 4 -->
                            <div class="contenedor_pregunta">
                                <div class="centro">
                                    <div class="head-preguntas">
                                        <div class="title-pregunta">
                                            <p>Pregunta 1</p>
                                        </div>
                                        <div class="btn-bar">
                                            <!-- <button class="edit-btn" >
                                                <i class="fa fa-pencil"></i> Editar 
                                            </button> -->

                                            <button class="edit-btn" >
                                            <i class="fa fa-trash"></i>
                                            Eliminar
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="centro">
                                        <div class="cuestionario space ">
                                            <div class="text-edi otro" contenteditable>
                                            <p >this is a question?</p>
                                            </div>
                                        </div>
                                </div>

                                <div class="centro">
                                    <div class="text-option space"> 
                                        <div class="option-text" >
                                            <form class="flex-option">
                                                <label for="two"> 
                                                    <input type="radio" checked="checked" name="two">
                                                        I have a car
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" name="two">    
                                                    I have a car
                                                </label>
                                                
                                                <label for="three"> 
                                                    <input type="radio" name="three" >
                                                    I have a boat
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" checked="checked" name="two">
                                                        I have a car
                                                </label>
                                                <label for="two"> 
                                                    <input type="radio" name="two">    
                                                    I have a car
                                                </label>
                                                
                                                <label for="three"> 
                                                    <input type="radio" name="three" >
                                                    I have a boat
                                                </label>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                
                        <!-- BTN flotante -->
                        <div>
                            <div>
                                <div class="btn-flotante">
                                    <input type="checkbox" id="btn-mas">
                                    <div class="redes">
                                        <a href="#" class="fa fa-pencil"></a>
                                        <a href="#" class="fa fa-save"></a>
                                        <a href="#" class="fa fa-plus"></a>
                                    </div>
                                    <div class="btn-mas">
                                        <label for="btn-mas" class="fa fa-ellipsis-v"></label>
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
<script src="public/js/plugins/dataTables/dataTables.bootstrap4.minscript"></script>
<script src="public/js/plugins/mustache/mustache.min.js"></script>
<script src="public/js/plugins/select2/select2.full.min.js"></script>
<script src="public/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="public/js/utilitario/utilitario.js"></script>

<script src="public/js/scripts/curso.js"></script>

</body>

</html>