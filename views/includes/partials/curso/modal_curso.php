<div class="modal fade" id="modal_crud_tablas" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title" id="modalTitle">Descargar Excel</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">

                <form class="row" action="" id="formCrud">

                    <div class="form-group col-12">
                        <label for="txt_fecha_filtro_excel">Fecha Seguimiento<span class="text-danger">*</span> </label>
                        <input  id="txt_fecha_filtro_excel" class="form-control" type="text"  value="" readonly />
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