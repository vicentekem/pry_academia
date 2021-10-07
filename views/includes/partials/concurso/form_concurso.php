<?php
    $action = isset($_GET["action"]) ? $_GET["action"] : "";
    $id = isset($_GET["id"]) ? $_GET["id"] : "";
    switch($action){
        case 'ins'  : $action="ins_concurso";break;
        case 'upd'  : $action="upd_concurso";break;
        case 'list' : $action="";break;
        default     : $action="";
    }
?>

<div class="ibox-title">
    <h3 style="display: inline-block"> Mantenimiento Concursos </h3>
    <div class="ibox-tools">
        <?php if($action !== "list" && $action !== ""){ ?>
            <a href="?url=concursos&action=list" class="btn btn-success" style="color:white !important">Ir a listado</a>
        <?php } ?>
    </div>
</div>

<div class="ibox-content">
    <div class="row">
        <input type="hidden" id="txt_crud_id" value="1">
        <input type="hidden" id="txt_crud_action" value="<?php echo $action ?>">
        <div class="col-12 col-lg-4 row mx-0 px-1">

            <div class="form-group col-12 px-1">
                <img class="w-100" id="img_concurso" src="public/img/default.png" alt="">
            </div>

            <div class="form-group col-12 px-1">
                <input id="fl_crud_img_concurso" type="file" class="">
            </div>
        </div>
        
        <div class="col-12 col-lg-8 row mx-0 px-1 align-items-start align-content-start">
            <!-- curso -->
            <div class="form-group col-12 px-1">
                <label for="txt_crud_description">Descripcion<span class="text-danger">*</span> </label>
                <input id="txt_crud_description" class="form-control text-uppercase">
            </div>

            <!-- profesor -->
            <div class="form-group col-12 px-1">
                <label for="txt_crud_resumen">Resumen<span class="text-danger">*</span> </label>
                <textarea id="txt_crud_resumen" class="form-control" rows="3"></textarea>
            </div>

            <div class="form-group col-12 col-lg-4 px-1">
                <label for="txt_crud_fecha">Fecha<span class="text-danger">*</span> </label>
                <input id="txt_crud_fecha" class="form-control" data-mask="99/99/9999" placeholder="">
            </div>

            <div class="form-group col-12 col-lg-4 px-1">
                <label for="txt_crud_hora_inicio">Hora inicio<span class="text-danger">*</span></label>
                <input id="txt_crud_hora_inicio" class="form-control"  placeholder="">
            </div>

            <div class=" form-group col-12 col-lg-4 px-1">
                <label for="txt_crud_hora_fin">Hora fin<span class="text-danger">*</span> </label>
                <input id="txt_crud_hora_fin" class="form-control"  placeholder="">
            </div>

        </div>

        <div class="col-12 row mx-0 px-1">

            <div class="form-group col-12 col-lg-10 px-1">
                <label for="txt_direccion">Direccion<span class="text-danger">*</span></label>
                <input id="txt_direccion" class="form-control text-uppercase"  placeholder="">
            </div>

            <div class="form-group col-12 col-lg-2 px-1">
                <label for="txt_monto_inscripcion">Monto inscripcion<span class="text-danger">*</span></label>
                <input id="txt_monto_inscripcion" class="form-control"  placeholder="">
            </div>

        </div>

    </div>
</div>

<div class=" ibox-title mt-3">
    <h3 style="display: inline-block"> Preguntas </h3>
    <div class="ibox-tools"> </div>
</div>
<div class="ibox-content">
    <div class="contenido-card" id="container_questions" >
        
        <!-- preguntas 1 -->
        <div class="contenedor_pregunta" id="container_q1">
            <div class="centro">
                <div class="head-preguntas">
                    <div class="title-pregunta">
                        <p>Pregunta <span class="question_numeric">1<span></p>
                    </div>
                    <div class="btn-bar">
                        <!-- <button class="edit-btn" >
                            <i class="fa fa-pencil"></i> Editar 
                        </button> -->
                        <button class="edit-btn btn-delete" data-idquestion="1">
                            <i class="fa fa-trash btn-delete" data-idquestion="1"></i> Eliminar
                        </button>
                    </div>
                </div>
            </div>

            <div class="centro">
                
                <div class="cuestionario space">
                    <div class="text-edi otro question" contenteditable id="question_1">
                        Primera Pregunta
                    </div>                    
                </div>
            </div>

            <div class="centro pb-2">
                <div class="text-option space"> 
                    <div class="option-text" >
                        <div class="flex-option" id="container_options_1">

                            <div class="mb-1 div_option_1">
                                <input type="radio" id="rd_p1_option_1" name="option_question_1">
                                <span contenteditable class="option" data-idradio='rd_p1_option_1'>Nueva opcion</span>
                                <a href="#" style="font-size:1.05em" data-idoption='1' data-idquestion='1' 
                                    class="text-danger remove-option ml-1">x</a>
                            </div>

                            <div class="mt-1">
                                <!-- <input type="radio" id="rd_p1_option_1"> -->
                                <a href="#" id="add_opt_1" class="add-option add-option-1 ml-2" >Agregar opcion</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>                

    <div>
        <div>
            <div class="btn-flotante">
                <input type="checkbox" id="btn-mas">
                <div class="redes">
                    <a href="#" id="btn_edit_concurso" class="fa fa-pencil"></a>
                    <a href="#" id="btn_save_concurso" class="fa fa-save"></a>
                    <a href="#" id="btn_add_question"  class="fa fa-plus"></a>
                </div>
                <div class="btn-mas">
                    <label for="btn-mas" class="fa fa-ellipsis-v"></label>
                </div>
            </div>
        </div>
    </div>

</div>