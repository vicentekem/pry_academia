let crud_usuario = {    
    dtable: null,
    id_table: "tbl_usuario",
    id_modal: "modal_crud_usuario",
    id_rol : parseInt($("#txt_session_id_rol").val()),
    id_usuario : parseInt($("#txt_session_id_usuario").val()),
    init : ()=>{
        let btn_new_usuario = $("#btn_new_usuario");
        let frm_crud_usuario = $("#frm_crud_usuario");
        let filter_container_jq = $("#filter_container");
        let btn_save_usuario = $("#btn_save_usuario");

        filter_container_jq.on("click",  event => searchEventListener( event ) );
        filter_container_jq.on("change", event => searchEventListener( event ) );
        filter_container_jq.on("keyup", event => {            
            if(event.keyCode == 13 || event.keyCode == 27){
                searchEventListener(event);
            }
            if(event.keyCode == 27){ event.target.value = ""; }
        });

        frm_crud_usuario.on('submit', (event)=> event.preventDefault);

        btn_new_usuario.on("click",  (event)=> crud_usuario.openModal());
        btn_save_usuario.on("click", (event)=> crud_usuario.saveData(event));
        
        crud_usuario.initDataTable();
        crud_usuario.initActionsTadaTables();        
    },

    initDataTable: ()=>{        
        crud_usuario.dtable = $('#' + crud_usuario.id_table).DataTable({
            pageLength: 10,//cantidad de registros a mostrar por paginas
            searching : false,//si es true agrega un buscador a la usuario
            ordering:false,//si es true se habilita la opcion de ordenar por columna
            serverSide: true,//si es true hace la llamada al servidor por cada pagina
            responsive: true,
            processing: true,
            language: {
                url: "public/js/plugins/dataTables/dataTablesSpanich.json"
            },
            ajax: {
                type:"GET",
                url: "controllers/UsuarioController.php",
                data: function(dtp){
                    dtp.action = 'qry_usuario';                    
                    dtp.id_usuario = $("#cbx_id_usuario").val();
                    dtp.search   = $("#txt_search").val();
                    return dtp;
                },
                dataFilter: function ( json ) {
                    json = JSON.parse(json);
                    json.recordsTotal = json.cant_rows;
                    json.recordsFiltered = json.cant_rows;
                    json.data = json.rows;
                    return JSON.stringify(json);
                }
            },
            columnDefs:[
                {orderable: false, targets: 0, searchable: false,width:"8%" },
                {orderable: false, targets: 1, searchable: false, width:"22%"},
                {orderable: false, targets: 2, searchable: false, width:"42%"},
                {orderable: false, targets: 2, searchable: false, width:"20%"},
                {orderable: false, targets: 3, searchable: false, width:"8%"}
            ],
            columns: [
                {
                    render: function(data, type, row, meta){                    
                        var btn_edit = `<a class='fa fa-edit  text-warning upd-row' id=upd_${meta.row} href='#' title='Editar registro' style='font-size: 1.1em'></a>`;
                        var btn_res_pass = `<a class='fa fa-lock  text-success rpass-row' id=res_pass_${meta.row} title='restablecer contraseña' href='#' style='font-size: 1.1em'></a>`;
                        var btn_est  = row.estado == 1 ? 
                            `<a class='fa fa-times text-danger   est-row' id=est_${meta.row} href='#' style='font-size: 1.1em'></a>` : 
                            `<a class='fa fa-check text-info  est-row' id=est_${meta.row} href='#' style='font-size: 1.1em'></a>`;                            
                        
                        var show_btn_est = (crud_usuario.id_rol == 1) || (crud_usuario.id_rol == 2 && row.id_rol != 1) ;
                        var show_btn_edit = (crud_usuario.id_rol == 1) || (crud_usuario.id_rol == 2 && row.id_rol != 1) ;
                         
                        return `<div class='text-center'> ${show_btn_edit?btn_edit:''} 
                            ${show_btn_est?btn_res_pass:''}
                            ${show_btn_est?btn_est:''}                            
                        </div>`;

                    }
                },
                { data: "usuario"},
                { data: "nombre_completo"},
                { data: "rol"},
                { 
                    render: function(data, type, row, meta){
                        return row.estado == 1 ? `<small class="label label-primary">Activado</small>` : 
                        `<small class="label label-danger">Desactivado</small>`;
                    }
                }
            ]
        });
    },

    initActionsTadaTables: ()=>{

        $("#" + crud_usuario.id_table + " tbody").on("click", ".upd-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_usuario.dtable.row(id_row).data();
            crud_usuario.openModal(data);            
        });

        $("#" + crud_usuario.id_table + " tbody").on("click", ".est-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_usuario.dtable.row(id_row).data();            
            crud_usuario.changeEst(data);
        });

        $("#" + crud_usuario.id_table + " tbody").on("click", ".rpass-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_usuario.dtable.row(id_row).data();
            crud_usuario.restablecerPassword(data);
        });

    },

    changeEst : (data)=>{
        
        swal({
            title: `Seguro que desea ${data.estado == 0 ? "activar" : "desactivar"} el registro seleccionado?`,            
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#1AB394",
            confirmButtonText: "Si",
            cancelButtonText: "Cancelar",
            closeOnConfirm: false
        }, function () {

            ajaxRequest('est_usuario',"post","UsuarioController.php",data,(result)=>{
                if(result.error === ""){
                    let txtmsg = data.estado == 0 ? "Activado" : "Desactivado";
                    //swal(txtmsg,, "success");
                    swal({
                        title: txtmsg,
                        text: `El registro seleccionado fue ${txtmsg.toLowerCase()} con exito!`,
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#1AB394",
                        closeOnConfirm: true
                    });
                    crud_usuario.reloadTable();
                }else{
                    swal({
                        title: "Error",
                        text: result.error,
                        type: "error",
                        showCancelButton: false,
                        confirmButtonColor: "#1AB394",
                        closeOnConfirm: true
                    });
                }
            });

        });

    },

    restablecerPassword : (data)=>{
        
        swal({
            title: `Seguro que desea restablecer la contraseña el usuario seleccionado?`,
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#1AB394",
            confirmButtonText: "Si",
            cancelButtonText: "Cancelar",
            closeOnConfirm: false
        }, function () {

            ajaxRequest('est_usuario',"post","UsuarioController.php",data,(result)=>{
                if(result.error === ""){                    
                    swal({
                        title: 'Completado',
                        text: `La contraseña fue restablecida con exito!`,
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#1AB394",
                        closeOnConfirm: true
                    });
                    crud_usuario.reloadTable();
                }else{
                    swal({
                        title: "Error",
                        text: result.error,
                        type: "error",
                        showCancelButton: false,
                        confirmButtonColor: "#1AB394",
                        closeOnConfirm: true
                    });
                }
            });

        });

    },

    loadDataToModal : ( data )=>{
        ajaxRequest("get_usuario","get","UsuarioController.php",{id:data.id},(result)=>{
            
            let d = result.row;            
            
            $("#txt_crud_action").val("upd_usuario");
            $("#txt_crud_id").val(d.id);
            $("#txt_crud_usuario").val(d.usuario);
            $("#cbx_crud_id_persona").val(d.id_persona).attr("disabled",true).trigger("change");
            $("#cbx_crud_id_rol").val(d.id_rol);
            $("#" + crud_usuario.id_modal + " #emodal_title").html("Editar Registro");
            $("#" + crud_usuario.id_modal).modal("show");

        });
    },

    openModal : ( data = {} )=>{        
        if(data.id){
            crud_usuario.loadDataToModal(data);
        }else{
            $("#txt_crud_action").val("ins_usuario");
            $("#txt_crud_id").val("");
            $("#txt_crud_usuario").val("");
            $("#cbx_crud_id_persona").val("").attr("disabled",false).trigger("change");
            $("#cbx_crud_id_rol").val("");
            $("#" + crud_usuario.id_modal + " #emodal_title").html("Registrar Usuario");
            $("#" + crud_usuario.id_modal).modal("show");
        }
    },

    saveData: (event)=>{        
        event.preventDefault();
        let action = $("#txt_crud_action").val();
        let id = $("#txt_crud_id").val();
        let descripcion = $("#txt_crud_descripcion").val();
        let resumen = $("#txt_crud_resumen").val();

        let caracteristicas = list_caracteristicas.getString();
        let beneficios = list_beneficios.getString();

        let data = {
            id : id,
            descripcion : descripcion,
            resumen : resumen,
            caracteristicas : caracteristicas,
            beneficios : beneficios
        }

        ajaxRequest(action,"post","UsuarioController.php",data,(result)=>{
            if(result.error === ""){
                $("#" + crud_usuario.id_modal).modal("hide");
                showMessage(result.success,"success");
                crud_usuario.reloadTable();
            }else{
                showMessage(result.error,"error");
            }
        });

    },

    reloadTable : ()=>{
        if(crud_usuario.dtable) crud_usuario.dtable.draw();
    }

};

const loadCbx = ()=>{

    ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:2},(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_rol',result["rows"]);
    });

    ajaxRequest("cbx_persona","get","PersonaController.php",null,(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_persona',result["rows"],true);
    });

}


const searchEventListener = (event)=>{
    let target = event.target;    
    switch(event.type){
        case 'click' :  if( target.classList.contains("btn-filter")) crud_usuario.reloadTable(); ;break;
        case 'change': if( target.classList.contains("cbx-filter")) crud_usuario.reloadTable(); ;break;
        case 'search': if( target.classList.contains("txt-filter")) crud_usuario.reloadTable(); ;break;
        case 'keyup' : if( target.classList.contains("txt-filter")) crud_usuario.reloadTable(); ;break;
    }
}

document.addEventListener('DOMContentLoaded',()=>{

    loadCbx();
    crud_usuario.init();
    
});
