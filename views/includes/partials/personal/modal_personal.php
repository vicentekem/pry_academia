<div class="modal fade" id="modal_crud_personal" role="dialog" aria-labelledby="exampleModalCenterTitle"
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

            <form class="row" action="" id="frm_crud_personal">

                <input type="hidden" id="txt_crud_id">
                <input type="hidden" id="txt_crud_id_persona">
                <input type="hidden" id="txt_crud_action">

                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-3">
                    <label  for="txt_crud_dni">DNI<span class="text-danger">*</span></label>
                    <input  id ="txt_crud_dni" class="form-control text-uppercase" />
                </div>

                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-5">
                    <label  for="txt_crud_nombre">Nombres<span class="text-danger">*</span></label>
                    <input  id ="txt_crud_nombre" class="form-control text-uppercase" />
                </div>

                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-4">
                    <label  for="txt_crud_ape_pat">Apellido Paterno<span class="text-danger">*</span></label>
                    <input  id ="txt_crud_ape_pat" class="form-control text-uppercase" />
                </div>

                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-4">
                    <label  for="txt_crud_ape_mat">Apellido Materno<span class="text-danger">*</span></label>
                    <input  id ="txt_crud_ape_mat" class="form-control text-uppercase" />
                </div>

                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-4">
                    <label  for="cbx_crud_id_sexo">Sexo</label>
                    <select  id ="cbx_crud_id_sexo" class="form-control text-uppercase"></select>
                </div>

                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-4">
                    <label  for="cbx_crud_id_distrito">Distrito</label>
                    <select  id ="cbx_crud_id_distrito" class="form-control text-uppercase"></select>
                </div>

                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-4">
                    <label  for="cbx_crud_id_cargo">Cargo<span class="text-danger">*</span></label>
                    <select  id ="cbx_crud_id_cargo" class="form-control text-uppercase"></select>
                </div>

                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-4">
                    <label  for="txt_crud_correo">Correo</label>
                    <input  id ="txt_crud_correo" class="form-control text-uppercase" />
                </div>

                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-3">
                    <label  for="txt_crud_celular">Nro Celular</label>
                    <input  id ="txt_crud_celular" class="form-control text-uppercase" />
                </div>

                <div class="form-group col-12 col-sm-12 col-md-6 col-lg-3">
                    <label  for="txt_crud_telefono">Nro Telefono</label>
                    <input  id ="txt_crud_telefono" class="form-control text-uppercase" />
                </div>

            </form>
                            
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>                
                <button type="button" id="btn_save_personal" form="frm_crud_personal" class="btn btn-primary">Guardar</button>
            </div>
        </div>
    </div>
</div>