let crud_alumno = {
    
    dtable: null,
    id_table: "tbl_alumno",
    id_modal: "modal_crud_alumno",

    init : ()=>{
        let btn_new_alumno = $("#btn_new_alumno");
        let frm_crud_alumno = $("#frm_crud_alumno");
        let filter_container_jq = $("#filter_container");
        let btn_save_alumno = $("#btn_save_alumno");

        filter_container_jq.on("click",  event => searchEventListener( event ) );
        filter_container_jq.on("change", event => searchEventListener( event ) );
        filter_container_jq.on("search", event => searchEventListener( event ) );

        frm_crud_alumno.on('submit', (event)=> crud_alumno.saveData(event));

        btn_new_alumno.on("click",  (event)=> crud_alumno.openModal());
        btn_save_alumno.on("click", (event)=> crud_alumno.saveData(event));
        
        crud_alumno.initDataTable();
        crud_alumno.initActionsTadaTables();        
    },

    initDataTable: ()=>{
        crud_alumno.dtable = $('#' + crud_alumno.id_table).DataTable({
            pageLength: 10,//cantidad de registros a mostrar por paginas
            searching : false,//si es true agrega un buscador a la alumno
            ordering:false,//si es true se habilita la opcion de ordenar por columna
            serverSide: true,//si es true hace la llamada al servidor por cada pagina
            responsive: true,
            processing: true,
            language: {
                url: "public/js/plugins/dataTables/dataTablesSpanich.json"
            },
            ajax: {
                type:"GET",
                url: "controllers/AlumnoController.php",
                data: function(dtp){
                    dtp.action = 'qry_alumno';                    
                    dtp.id_alumno = $("#cbx_id_alumno").val();
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
                {orderable: false, targets: 0, searchable: false, width:"8%"},
                {orderable: false, targets: 1, searchable: false, width:"12%"},
                {orderable: false, targets: 2, searchable: false, width:"35%"},
                {orderable: false, targets: 3, searchable: false, width:"10%"},
                {orderable: false, targets: 4, searchable: false, width:"12%"},
                {orderable: false, targets: 5, searchable: false, width:"8%"},
                
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
                { data: "dni"},
                { data: "nombre_completo"},                
                { data: "correo"},
                { data: "celular"},
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

        $("#" + crud_alumno.id_table + " tbody").on("click", ".upd-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_alumno.dtable.row(id_row).data();
            crud_alumno.openModal(data);            
        });

        $("#" + crud_alumno.id_table + " tbody").on("click", ".est-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_alumno.dtable.row(id_row).data();            
            crud_alumno.changeEst(data);
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

            ajaxRequest('est_alumno',"post","AlumnoController.php",data,(result)=>{
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
                    crud_alumno.reloadTable();
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
        ajaxRequest("get_alumno","get","AlumnoController.php",{id:data.id},(result)=>{

            let d = result.row;

            $("#txt_crud_action").val("upd_alumno");

            $("#txt_crud_id").val(d.id);
            $("#txt_crud_id_persona").val(d.id_persona);
            $("#txt_crud_dni").val(d.dni);
            $("#txt_crud_nombre").val(d.nombre);
            $("#txt_crud_ape_pat").val(d.apellido_pat);
            $("#txt_crud_ape_mat").val(d.apellido_mat);
            $("#cbx_crud_id_distrito").html( d.id_ubigeo ? `<option value='${d.id_ubigeo}' selected >${d.ubigeo}</option>` : "").change();
            $("#cbx_crud_id_sexo").val(d.id_sexo);
            $("#txt_crud_correo").val(d.correo);
            $("#txt_crud_celular").val(d.celular);
            $("#txt_crud_telefono").val(d.telefono);

            $("#" + crud_alumno.id_modal + " #emodal_title").html("Editar Alumno");
            $("#" + crud_alumno.id_modal).modal("show");
        });
    },

    openModal : ( data = {} )=>{        
        if(data.id){
            crud_alumno.loadDataToModal(data);
        }else{

            $("#txt_crud_action").val("ins_alumno");
            
            $("#txt_crud_id").val("");
            $("#txt_crud_id_persona").val("");
            $("#txt_crud_dni").val("");
            $("#txt_crud_nombre").val("");
            $("#txt_crud_ape_pat").val("");
            $("#txt_crud_ape_mat").val("");
            $("#cbx_crud_id_distrito").html("").change();
            $("#cbx_crud_id_sexo").val("");
            $("#txt_crud_correo").val("");
            $("#txt_crud_celular").val("");
            $("#txt_crud_telefono").val("");
            
            $("#" + crud_alumno.id_modal + " #emodal_title").html("Nuevo Alumno");
            $("#" + crud_alumno.id_modal).modal("show");        
        }
    },

    saveData: (event)=>{        
        event.preventDefault();
        let action = $("#txt_crud_action").val();
        let id = $("#txt_crud_id").val();
        let id_persona = $("#txt_crud_id_persona").val();

        let dni = $("#txt_crud_dni").val();
        let nombre = $("#txt_crud_nombre").val();
        let ape_pat = $("#txt_crud_ape_pat").val();
        let ape_mat = $("#txt_crud_ape_mat").val();
        let id_sexo = $("#cbx_crud_id_sexo").val();
        let id_distrito = $("#cbx_crud_id_distrito").val();        
        let correo = $("#txt_crud_correo").val();
        let celular = $("#txt_crud_celular").val();
        let telefono = $("#txt_crud_telefono").val();

        
        let data = {
            id : id,
            id_persona: id_persona,
            dni : dni,
            nombre : nombre,
            ape_pat : ape_pat,
            ape_mat : ape_mat,
            id_sexo: id_sexo,
            id_distrito : id_distrito,            
            correo : correo,
            celular : celular,
            telefono : telefono
        }

        ajaxRequest(action,"post","AlumnoController.php",data,(result)=>{

            if(result.error === ""){
                $("#" + crud_alumno.id_modal).modal("hide");
                showMessage(result.success,"success");
                crud_alumno.reloadTable();
            }else{
                showMessage(result.error,"error");
            }
        });

    },

    reloadTable : ()=>{
        if(crud_alumno.dtable) crud_alumno.dtable.draw();
    }

};



const loadCbx = ()=>{

    ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:6},(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_sexo',result["rows"]);
    });

    ajaxSelect2("cbx_crud_id_distrito","cbx_ubigeo","UbigeoController.php")
}

const searchEventListener = (event)=>{
    let target = event.target;    
    switch(event.type){
        case 'click':  if( target.classList.contains("btn-filter")) crud_alumno.reloadTable(); ;break;
        case 'change': if( target.classList.contains("cbx-filter")) crud_alumno.reloadTable(); ;break;
        case 'search': if( target.classList.contains("txt-filter")) crud_alumno.reloadTable(); ;break;
    }
}

document.addEventListener('DOMContentLoaded',()=>{
        
    crud_alumno.init();
    loadCbx();
    
});
