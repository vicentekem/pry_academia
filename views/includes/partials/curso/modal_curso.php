<div class="modal fade" id="modal_crud_curso" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title" id="emodal_title"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">

            <form class="row" action="" id="frm_crud_curso">

                <input type="hidden" id="txt_crud_id">
                <input type="hidden" id="txt_crud_action">

                <div class="form-group col-12">
                    <label  for="txt_crud_descripcion">Nombre del curso<span class="text-danger">*</span> </label>
                    <input id="txt_crud_descripcion" class="form-control text-uppercase" />
                </div>

                <div class="form-group col-12">
                    <label  for="txt_crud_resumen">Descripción<span class="text-danger">*</span> </label>
                    <textarea id="txt_crud_resumen" class="form-control"></textarea>
                </div>

                <div class="form-group col-12 col-lg-6">
                    <label  for="txt_crud_caracteristica">Caracteristica</label>
                    <div class="form-group input-group">
                        <input type="text" id="txt_crud_caracteristica" placeholder="" class="form-control"/>
                        <div class="input-group-append">
                            <button type="button" id="btn_add_caracteristica" class="btn btn-info"> <span class="fa fa-plus"></span></button>
                        </div>
                    </div>
                    <div> <ul class="task-list" id="lst_caracteristicas"></ul> </div>
                </div>

                <div class="form-group col-12 col-lg-6">
                    <label  for="txt_crud_beneficio">Beneficios</label>
                    <div class="form-group input-group">
                        <input type="text" id="txt_crud_beneficio" placeholder="" class="form-control"/>
                        <div class="input-group-append">
                            <button type="button" id="btn_add_beneficio" class="btn btn-info"> <span class="fa fa-plus"></span></button>
                        </div>
                    </div>
                    <div> <ul class="task-list" id="lst_beneficios"></ul> </div>
                </div>

            </form>
                            
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>                
                <button type="button" id="btn_save_curso" form="frm_crud_curso" class="btn btn-primary">Guardar</button>
            </div>
        </div>
    </div>
</div>