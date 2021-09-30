
<div class="modal fade" id="modal_change_pass" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title" id="emodal_title">Cambiar contraseña</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="modal-body">

          <div class="form-group col-12">
          <label for="txt_pass_act">Contraseña actual<span class="text-danger">*</span></label>
            <input type="password" id="txt_pass_act" class="form-control text-uppercase" />
          </div>

          <div class="form-group col-12">
          <label for="txt_new_pass">Nueva Contraseña<span class="text-danger">*</span></label>
            <input type="password" id="txt_new_pass" class="form-control text-uppercase" />
          </div>

          <div class="form-group col-12">
            <label for="txt_repeat_pass">Repita Contraseña<span class="text-danger">*</span></label>
            <input type="password" id="txt_repeat_pass" class="form-control text-uppercase" />
          </div>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" id="btn_change_pass" class="btn btn-primary">Guardar</button>
      </div>
    </div>
  </div>
</div>