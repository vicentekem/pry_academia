<div class="modal fade" id="modal_crud_tablas" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title" id="el_modal_title">Crud Tablas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">

                <form class="row" action="" id="formCrud">

                    <input type="hidden" id="cbx_crud_id_registro">

                    <div class="form-group col-12">
                        <label  for="cbx_crud_id_tabla"> Tabla <span class="text-danger">*</span> </label>
                        <select id="cbx_crud_id_tabla" class="form-control"></select>
                    </div>

                    <div class="form-group col-12">
                        <label  for="txt_crud_cod_ref"> Codigo Referencial</label>
                        <input id="txt_crud_cod_ref" class="form-control" />
                    </div>

                    <div class="form-group col-12">
                        <label  for="txt_crud_descripcion"> Descripcion <span class="text-danger">*</span> </label>
                        <input id="txt_crud_descripcion" class="form-control" />
                    </div>

                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>                
                <button type="submit" id="btn_save_tabla" form="formCrud" class="btn btn-primary">Guardar</button>
            </div>
        </div>
    </div>
</div>