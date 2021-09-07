let crud_curso = {
    
    dtable: null,
    id_table: "tbl_curso",
    id_modal: "modal_crud_curso",

    init : ()=>{
        let btn_new_curso = $("#btn_new_curso");
        let frm_crud_curso = $("#frm_crud_curso");
        let filter_container_jq = $("#filter_container");
        let btn_save_curso = $("#btn_save_curso");

        filter_container_jq.on("click",  event => searchEventListener( event ) );
        filter_container_jq.on("change", event => searchEventListener( event ) );
        filter_container_jq.on("search", event => searchEventListener( event ) );

        frm_crud_curso.on('submit', (event)=> crud_curso.saveData(event));

        btn_new_curso.on("click",  (event)=> crud_curso.openModal());
        btn_save_curso.on("click", (event)=> crud_curso.saveData(event));
        
        crud_curso.initDataTable();
        crud_curso.initActionsTadaTables();        
    },

    initDataTable: ()=>{        
        crud_curso.dtable = $('#' + crud_curso.id_table).DataTable({
            pageLength: 10,//cantidad de registros a mostrar por paginas
            searching : false,//si es true agrega un buscador a la curso
            ordering:false,//si es true se habilita la opcion de ordenar por columna
            serverSide: true,//si es true hace la llamada al servidor por cada pagina
            responsive: true,
            processing: true,
            language: {
                url: "public/js/plugins/dataTables/dataTablesSpanich.json"
            },
            ajax: {
                type:"GET",
                url: "controllers/CursoController.php",
                data: function(dtp){
                    dtp.action = 'qry_curso';                    
                    dtp.id_curso = $("#cbx_id_curso").val();
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
                {orderable: false, targets: 2, searchable: false, width:"10%",name:'estado'}
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

        $("#" + crud_curso.id_table + " tbody").on("click", ".upd-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_curso.dtable.row(id_row).data();
            crud_curso.openModal(data);            
        });

        $("#" + crud_curso.id_table + " tbody").on("click", ".est-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_curso.dtable.row(id_row).data();            
            crud_curso.changeEst(data);
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

            ajaxRequest('est_curso',"post","CursoController.php",data,(result)=>{
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
                    crud_curso.reloadTable();
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
            $("#txt_crud_action").val("upd_curso");
            $("#txt_crud_id").val(data.id);
            $("#txt_crud_descripcion").val(data.description);
            $("#" + crud_curso.id_modal + " #emodal_title").html("Editar Registro");
            $("#" + crud_curso.id_modal).modal("show");
        }else{            
            $("#txt_crud_action").val("ins_curso");
            $("#txt_crud_id").val("");
            $("#txt_crud_cod_ref").val("");
            $("#txt_crud_descripcion").val("");
            $("#" + crud_curso.id_modal + " #emodal_title").html("Nuevo Registro");
            $("#" + crud_curso.id_modal).modal("show");        
        }
    },

    saveData: (event)=>{        
        event.preventDefault();
        let action = $("#txt_crud_action").val();
        let id = $("#txt_crud_id").val();
        let descripcion = $("#txt_crud_descripcion").val();

        let data = {
            id : id,            
            descripcion : descripcion
        }

        ajaxRequest(action,"post","CursoController.php",data,(result)=>{

            if(result.error === ""){
                $("#" + crud_curso.id_modal).modal("hide");
                showMessage(result.success,"success");
                crud_curso.reloadTable();
            }else{
                showMessage(result.error,"error");
            }
        });

    },

    reloadTable : ()=>{
        if(crud_curso.dtable) crud_curso.dtable.draw();
    }

};




const loadCbx = ()=>{

    /*ajaxRequest("cbx_curso","get","CursoController.php",
    (result) => {
        loadDataToTemplate('tmpl_cbx_curso','cbx_id_curso',result["rows"],true);
        loadDataToTemplate('tmpl_cbx_curso','cbx_crud_id_curso',result["rows"],true);
    });*/

}

const searchEventListener = (event)=>{
    let target = event.target;    
    switch(event.type){
        case 'click':  if( target.classList.contains("btn-filter")) crud_curso.reloadTable(); ;break;
        case 'change': if( target.classList.contains("cbx-filter")) crud_curso.reloadTable(); ;break;
        case 'search': if( target.classList.contains("txt-filter")) crud_curso.reloadTable(); ;break;
    }
}

document.addEventListener('DOMContentLoaded',()=>{
    
    crud_curso.init();
    loadCbx();
    
});
