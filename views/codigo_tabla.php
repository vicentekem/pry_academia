<div class="col-lg-12 px-0">
    <div class="ibox">

        <div class="ibox-title">
            <h3 style="display: inline-block"> Mantenimientos Dependencias </h3>

            <div class="ibox-tools">
            </div>
        </div>

        <div class="ibox-content">

            <div class="row">

                <div class="form-group input-group col-12 col-md-7 col-lg-11">
                    <input type="search" id="txt_fltr_nombre" placeholder="Buscar"
                            class="form-control text-uppercase" oninput="buscarTabla()"/>
                    <div class="input-group-append">
                        <button class="btn btn-info" onclick="buscarTabla()">
                            <span class="fa fa-search"></span>
                        </button>
                    </div>
                </div>

                <div class="form-group col-12 col-md-2 col-lg-1 ">
                    <button class="btn btn-success" onclick="openModal('ins_dependencia')">
                        Nuevo
                    </button>
                </div>
            </div>

            <div class="table-responsive w-100 text-sm">
                <table id="lista_datatables" class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>Accion</th>
                        <th>Nombre Hospital</th>
                        <th>Estado</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>

        </div>

    </div>

</div>