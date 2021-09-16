<div class="row">

    <div class="form-group mb-0 col-12 col-md-5 col-lg-10">
        <label for="txt_search">Buscar</label>
        <div class="form-group input-group">
            <input type="search" id="txt_search" placeholder="Buscar" 
                class="form-control text-uppercase txt-filter"/>
            <div class="input-group-append">
                <button id="btn_search" class="btn btn-info btn-filter"> <span class="fa fa-search btn-filter"></span></button>
            </div>
        </div>
    </div>

    <div class="form-group mb-0 col-12 col-md-2">
        <label for="" style="display:block;opacity:0">...</label>
        <a href="?url=curso_programado&action=ins" id="btn_new_curso" class="btn btn-success">Nuevo</a>
    </div>

</div>

<div class="table-responsive w-100 text-sm">
    <table id="tbl_curso" class="table table-bordered table-hover w-100">
        <thead>
        <tr>
            <th>Accion</th>
            <th>Nombre</th>
            <th>Estado</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>