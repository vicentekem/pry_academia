<div class="modal fade" id="modal_adj_pago" role="dialog" aria-labelledby="exampleModalCenterTitle"
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

                <form class="row" action="" id="frm_crud_pago">
                    <input type="hidden" id="txt_crud_id">
                    <input type="hidden" id="txt_crud_action">

                    <div class="form-group col-12 px-1">
                        <input id="txt_curso" type="text" class="form-control" disabled />
                    </div>

                    <div class="form-group col-12 px-1">
                        <img class="w-100" id="img_baucher" src="public/img/default.png" alt="">
                    </div>

                    <div class="form-group col-12 px-1">                                    
                        <input  id="fl_img_baucher" type="file" class=""/>
                    </div>

                </form>
                            
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>                
                <button type="button" id="btn_save_pago" form="frm_crud_pago" class="btn btn-primary">Guardar</button>
            </div>
        </div>
    </div>
</div>