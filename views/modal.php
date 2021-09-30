<div class="modal fade" id="modal_crud_alumno" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-body">

        <form class="row" action="" id="frm_crud_alumno">

          <input type="hidden" id="txt_crud_id">
          <input type="hidden" id="txt_crud_id_persona">
          <input type="hidden" id="txt_crud_action">

          <div class="form-group col-12 col-sm-12 col-md-6 col-lg-3">
            <label for="txt_crud_dni">Usuario<span class="text-danger">*</span></label>
            <input id="txt_crud_dni" class="form-control text-uppercase" />
          </div>

          <div class="form-group col-12 col-sm-12 col-md-6 col-lg-5">
            <label for="txt_crud_nombre">Contraseña<span class="text-danger">*</span></label>
            <input id="txt_crud_nombre" class="form-control text-uppercase" />
          </div>

        </form>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" id="btn_save_alumno" form="frm_crud_alumno" class="btn btn-primary">Guardar</button>
      </div>
    </div>
  </div>
</div>