let crud_tablas = {
    
    dtable: null,
    id_table: "tbl_tablas",
    id_modal: "modal_crud_tablas",

    init : ()=>{
        let btn_new_tabla = $("#btn_new_tabla");
        let frm_crud_tabla = $("#frm_crud_tabla");
        let filter_container_jq = $("#filter_container");
        let btn_save_tabla = $("#btn_save_tabla");

        filter_container_jq.on("click", event => searchEventListener( event ) );
        filter_container_jq.on("change", event => searchEventListener( event ) );
        filter_container_jq.on("search", event => searchEventListener( event ) );
        
        frm_crud_tabla.on('submit', (event)=> crud_tablas.saveData(event));
        
        btn_new_tabla.on("click",(event)=>{ crud_tablas.openModal(); });
        btn_save_tabla.on("click", (event)=>{ crud_tablas.saveData(event); });
        
        crud_tablas.initDataTable();
        crud_tablas.initActionsTadaTables();        
    },

    initDataTable: ()=>{        
        crud_tablas.dtable = $('#' + crud_tablas.id_table).DataTable({
            pageLength: 10,//cantidad de registros a mostrar por paginas
            searching : false,//si es true agrega un buscador a la tabla
            ordering:false,//si es true se habilita la opcion de ordenar por columna
            serverSide: true,//si es true hace la llamada al servidor por cada pagina
            responsive: true,
            processing: true,
            language: {
                url: "public/js/plugins/dataTables/dataTablesSpanich.json"
            },
            ajax: {
                type:"GET",
                url: "controllers/TablasController.php",
                data: function(dtp){
                    dtp.action = 'qry_tablas';                    
                    dtp.id_tabla = $("#cbx_id_tabla").val();
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
                {orderable: false, targets: 0, searchable: false,width:"10%", name:'id'},
                {orderable: false, targets: 1, searchable: false, width:"70%",name:'description'},
                {orderable: false, targets: 2, searchable: false, width:"10%",name:'cod_referencial'},
                {orderable: false, targets: 3, searchable: false, width:"10%",name:'estado'}
            ],
            columns: [
                {
                    render: function(data, type, row, meta){                    
                        var btn_edit = `<a class='fa fa-edit  text-warning upd-row' id=upd_${meta.row} href='#' style='font-size: 1.1em'></a>`;
                        var btn_est  = row.estado == 1 ? 
                            `<a class='fa fa-times text-danger   est-row' id=est_${meta.row} href='#' style='font-size: 1.1em'></a>` : 
                            `<a class='fa fa-check text-info  est-row' id=est_${meta.row} href='#' style='font-size: 1.1em'></a>`;
                            

                        return `<div class='text-center'> ${btn_edit} ${btn_est}</div>`;
                    }
                },
                { data: "description"},
                { data: "cod_referencial"},
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

        $("#" + crud_tablas.id_table + " tbody").on("click", ".upd-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_tablas.dtable.row(id_row).data();
            crud_tablas.openModal(data);            
        });

        $("#" + crud_tablas.id_table + " tbody").on("click", ".est-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_tablas.dtable.row(id_row).data();
            data.id_registro = data.id;
            crud_tablas.changeEst(data);
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

            ajaxRequest('est_tabla',"post","TablasController.php",data,(result)=>{
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
                    crud_tablas.reloadTable();
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

    openModal : ( data = {} )=>{        
        if(data.id){
            $("#txt_crud_action").val("upd_tabla");
            $("#cbx_crud_id_registro").val(data.id);
            $("#cbx_crud_id_tabla").val(data.id_tabla).attr("disabled",true).trigger("change.select2");
            $("#txt_crud_cod_ref").val(data.cod_referencial);
            $("#txt_crud_descripcion").val(data.description);
            $("#" + crud_tablas.id_modal + " #emodal_title").html("Editar Registro");
            $("#" + crud_tablas.id_modal).modal("show");
        }else{            
            $("#txt_crud_action").val("ins_tabla");
            $("#cbx_crud_id_registro").val("");
            $("#cbx_crud_id_tabla").val(data.id_tabla || "").attr("disabled",false).trigger("change.select2");
            $("#txt_crud_cod_ref").val("");
            $("#txt_crud_descripcion").val("");
            $("#" + crud_tablas.id_modal + " #emodal_title").html("Nuevo Registro");
            $("#" + crud_tablas.id_modal).modal("show");        
        }
    },

    validateData : (action,data)=>{
        let msg = "";

        if( action === 'upd_tabla' && data.id_registro == ""){msg = "El id es requerido";}
        else if(data.descripcion == ""){ msg = "La descripción es requerida"  }

        return msg;
    },

    saveData: (event)=>{
        event.preventDefault();
        let action = $("#txt_crud_action").val();
        let id_registro = $("#cbx_crud_id_registro").val();
        let id_tabla = $("#cbx_crud_id_tabla").val();
        let cod_ref = $("#txt_crud_cod_ref").val();
        let descripcion = $("#txt_crud_descripcion").val();

        let data = {
            id_registro : id_registro,
            id_tabla : id_tabla,
            cod_ref : cod_ref,
            descripcion : descripcion
        }

        let err_msg = crud_tablas.validateData(action,data);
        if(err_msg != "") return showMessage( err_msg , "error");

        ajaxRequest(action,"post","TablasController.php",data,(result)=>{

            if(result.error === ""){
                $("#" + crud_tablas.id_modal).modal("hide");
                showMessage(result.success,"success");
                crud_tablas.reloadTable();
            }else{
                showMessage(result.error,"error");
            }
        });

    },

    reloadTable : ()=>{
        if(crud_tablas.dtable) crud_tablas.dtable.draw();
    }

};




const loadCbx = ()=>{

    ajaxRequest("cbx_tablas","get","TablasController.php",{ id_tabla:0 },
    (result) => {
        loadDataToTemplate('tmpl_cbx_tabla','cbx_id_tabla',result["rows"],true);
        loadDataToTemplate('tmpl_cbx_tabla','cbx_crud_id_tabla',result["rows"],true);
    });

}

const searchEventListener = (event)=>{
    let target = event.target;    
    switch(event.type){
        case 'click':  if( target.classList.contains("btn-filter")) crud_tablas.reloadTable(); ;break;
        case 'change': if( target.classList.contains("cbx-filter")) crud_tablas.reloadTable(); ;break;
        case 'search': if( target.classList.contains("txt-filter")) crud_tablas.reloadTable(); ;break;
    }
}

document.addEventListener('DOMContentLoaded',()=>{
    
    crud_tablas.init();
    loadCbx();
    
});
