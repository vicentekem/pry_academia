<?php
    $action = isset($_GET["action"]) ? $_GET["action"] : "";
    $id = isset($_GET["id"]) ? $_GET["id"] : "";
    switch($action){
        case 'ins'  : $action="ins_curso_programado";break;
        case 'upd'  : $action="upd_curso_programado";break;
        case 'list' : $action="";break;
        default     : $action="";
    }
?>

<div class="row">
    <input type="hidden" id="txt_crud_id" value="<?php echo $id?>">
    <input type="hidden" id="txt_crud_action" value="<?php echo $action ?>">

    <div class="col-12 col-lg-4 row mx-0 px-1">

        <div class="form-group col-12 px-1">
            <img class="w-100" id="img_curso_programado" src="public/img/default.png" alt="">
        </div>

        <div class="form-group col-12 px-1">                                    
            <input  id="fl_crud_img_curso" type="file" class=""/>
        </div>
    </div>

    <div class="col-12 col-lg-8 row mx-0 px-1 align-items-start align-content-start">

        <div class="form-group col-12 px-1">
            <label  for="cbx_crud_id_curso">Curso<span class="text-danger">*</span> </label>
            <select id="cbx_crud_id_curso" class="form-control" ></select>
        </div>

        <div class="form-group col-12 px-1">
            <label  for="cbx_crud_id_profesor">Profesor<span class="text-danger">*</span> </label>
            <select id="cbx_crud_id_profesor" class="form-control" ></select>
        </div>

        <div class="form-group col-12 px-1">
            <label for="txt_crud_link_clase">Link</span> </label>
            <input  id="txt_crud_link_clase" class="form-control" placeholder="">
        </div>

        <div class="form-group col-12 col-lg-4 px-1"                                >
            <label for="txt_crud_fecha_inicio">Fecha inicio<span class="text-danger">*</span> </label>
            <input  id="txt_crud_fecha_inicio" class="form-control" data-mask="99/99/9999" placeholder="">
        </div>

        <div class="form-group col-12 col-lg-4 px-1">
            <label for="txt_crud_fecha_fin">Fecha fin<span class="text-danger">*</span> </label>
            <input  id="txt_crud_fecha_fin" class="form-control" data-mask="99/99/9999" placeholder="">
        </div>

        <div class="form-group col-12 col-lg-4 px-1">
            <label for="txt_crud_cant_mensualidades">Cantidad Mensualidades</span> </label>
            <input  id="txt_crud_cant_mensualidades" class="form-control" placeholder="">
        </div>

    </div>

    <div class="col-12 col-lg-5 row mx-0 px-1 align-items-start align-content-start">

        <div class="col-12 col-lg-6 row mx-0 px-0 align-items-start align-content-start">
            <div class="form-group col-12 px-0">
                <label  for="cbx_crud_id_tipo_pago">Tipo de Pago<span class="text-danger">*</span> </label>
                <select  id="cbx_crud_id_tipo_pago" class="form-control" ></select>
            </div>
        </div>

        <div class="col-12 col-lg-4 row mx-0 px-0 pl-1 align-items-start align-content-start">
            <div class="form-group col-12 px-0">
                <label for="txt_crud_monto">Monto<span class="text-danger">*</span> </label>
                <input id="txt_crud_monto" class="form-control"/>
            </div>
        </div>

        <div class="col-12 col-lg-2 row mx-0 px-0 pl-1 align-items-start align-content-start">
            <div class="form-group mb-0 col-12 px-0">
                <label for="" style="display:block;opacity:0">...</label>
                <button id="btn_add_tipo_pago" class="btn btn-success"><i class="fa fa-plus"></i></button>
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
                </tbody>
            </table>
        </div>
    </div>

    <div class="col-12 col-lg-7 row mx-0 px-1 align-items-start align-content-start">

        <div class="col-12 col-lg-5 row mx-0 px-0 align-items-start align-content-start">
            <div class="form-group col-12 px-0">
                <label  for="cbx_crud_id_turno">Turno<span class="text-danger">*</span> </label>
                <select  id="cbx_crud_id_turno" class="form-control" ></select>
            </div>
        </div>

        <div class="col-12 col-lg-3 row mx-0 px-0 pl-1 align-items-start align-content-start">
            <div class="form-group col-12 px-0">
                <label for="txt_crud_hora_inicio">Hora Inicio<span class="text-danger">*</span> </label>
                <input id="txt_crud_hora_inicio" class="form-control"/>
            </div>
        </div>

        <div class="col-12 col-lg-3 row mx-0 px-0 pl-1 align-items-start align-content-start">
            <div class="form-group col-12 px-0">
                <label for="txt_crud_hora_fin">Hora Fin<span class="text-danger">*</span> </label>
                <input id="txt_crud_hora_fin" class="form-control"/>
            </div>
        </div>

        <div class="col-12 col-lg-1 row mx-0 px-0 pl-1 align-items-start align-content-start">
            <div class="form-group mb-0 col-12 px-0">
                <label for="" style="display:block;opacity:0">...</label>
                <button id="btn_add_turno" class="btn btn-success"><i class="fa fa-plus"></i></button>
            </div>
        </div>

        <div class="table-responsive w-100 text-sm">
            <table class="table table-hover w-100">
                <thead>
                    <tr>
                        <th class="bg-success">Accion</th>
                        <th class="bg-success">Turno</th>
                        <th class="bg-success">Hora Inicio</th>
                        <th class="bg-success">Hora Fin</th>
                    </tr>
                </thead>
                <tbody id="tbl_turno">
                </tbody>
            </table>
        </div>
    </div>

    <div class="form-group col-12">
        <button type="button" id="btn_save_curso_programado" form="frm_crud_curso" class="btn btn-primary">Guardar</button>
    </div>

</div>