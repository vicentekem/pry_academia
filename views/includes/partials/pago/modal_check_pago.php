<div class="modal fade" id="modal_chk_pago" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title" id="cmodal_title"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">

                <form class="row" action="" id="frm_crud_pago">                   

                    <div class="form-group col-12 px-1">
                        <input id="txt_chk_curso" type="text" class="form-control" disabled />
                    </div>

                    <div class="form-group col-12 px-1">
                        <img class="w-100" id="img_chk_baucher" src="public/img/default.png" alt="">
                    </div>

                    <div class="form-group col-12 px-1">
                        <input id="txt_chk_confirmar" name="revisar_pago" type="radio" class="" value = "1" checked />
                        <label for="txt_chk_confirmar" class="pr-5">Confirmar</label>

                        <input id="txt_chk_rechazar" name="revisar_pago" type="radio" class="" value = "2" />
                        <label for="txt_chk_rechazar">Rechazar/observar</label>

                    </div>

                    <div class="form-group col-12 px-1">
                        <label for="txt_observacion">Observación</label>
                        <textarea  id="txt_observacion" class="form-control"
                            style="min-height:180px;max-height:180px"></textarea>
                    </div>

                </form>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" id="btn_save_chk_pago" form="frm_crud_pago" class="btn btn-primary">Guardar</button>                
            </div>
        </div>
    </div>
</div>