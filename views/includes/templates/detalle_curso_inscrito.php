<script id="tmpl_curso_det" type="x-tmpl-mustache">
    {{#data}}
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
            <!-- <input class="form-control " type="text"> -->
            <p class="form-control " type="text">{{description}}</p> 
        </div>

        <!-- profesor -->
        <div class="form-group col-12 px-1">
            <label for="cbx_crud_id_profesor">Profesor<span class="text-danger">*</span> </label>
            <p class="form-control " >{{profesor}}</p>
        </div>

        <!-- enlace -->
        <div class="form-group col-12 px-1">
            <label>Link </label>
            <p class="form-control " >{{link_clase}}</p>
            <!-- <input class="form-control" placeholder="" disabled> -->
        </div>

        <!-- fecha de inico -->
        <div class="form-group col-12 col-lg-6 px-1">
            <label>Fecha inicio<span class="text-danger">*</span> </label>
            <!-- <input class="form-control" placeholder=""> -->
            <p class="form-control " type="text">{{fecha_inicio}}</p> 
        </div>

        <!-- fecha fin -->
        <div class="form-group col-12 col-lg-6 px-1">
            <label>Fecha fin<span class="text-danger">*</span> </label>
            <!-- <input class="form-control" placeholder="" disabled> -->
            <p class="form-control " type="text">{{fecha_fin}}</p> 
        </div>

    </div>

    <div class="form-group col-12">
        <a href="?url=mis_cursos">
            <button type="button" id="btn_save_curso_programado" form="frm_crud_curso" class="btn btn-primary">

                OKI
            </button>
        </a>
    </div>

    </div>
{{/data}}
</script>