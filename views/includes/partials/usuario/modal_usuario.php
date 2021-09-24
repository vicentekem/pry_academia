<div class="modal fade" id="modal_crud_usuario" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title" id="emodal_title"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">

            <form class="row" action="" id="frm_crud_usuario">

                <input type="hidden" id="txt_crud_id">
                <input type="hidden" id="txt_crud_action">

                <div class="form-group col-12">
                    <label  for="cbx_crud_id_persona">Persona<span class="text-danger">*</span> </label>
                    <select id="cbx_crud_id_persona" class="form-control"></select>
                </div>

                <div class="form-group col-12">
                    <label  for="txt_crud_usuario">Nombre del usuario<span class="text-danger">*</span> </label>
                    <input id="txt_crud_usuario" class="form-control text-uppercase" />
                </div>

                <div class="form-group col-12">
                    <label  for="cbx_crud_id_rol">Rol<span class="text-danger">*</span> </label>
                    <select id="cbx_crud_id_rol" class="form-control"></select>
                </div>

            </form>
                            
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>                
                <button type="button" id="btn_save_usuario" form="frm_crud_usuario" class="btn btn-primary">Guardar</button>
            </div>
        </div>
    </div>
</div>