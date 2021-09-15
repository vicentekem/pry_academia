let crud_curso_programado = {
    
    dtable: null,
    id_table: "tbl_curso_programado",
    id_modal: "modal_crud_curso_programado",

    init : ()=>{
        let btn_new_curso_programado = $("#btn_new_curso_programado");
        let frm_crud_curso_programado = $("#frm_crud_curso_programado");
        let filter_container_jq = $("#filter_container");
        let btn_save_curso_programado = $("#btn_save_curso_programado");

        filter_container_jq.on("click",  event => searchEventListener( event ) );
        filter_container_jq.on("change", event => searchEventListener( event ) );
        filter_container_jq.on("search", event => searchEventListener( event ) );

        frm_crud_curso_programado.on('submit', (event)=> event.preventDefault);

        btn_new_curso_programado.on("click",  (event)=> crud_curso_programado.openModal());
        btn_save_curso_programado.on("click", (event)=> crud_curso_programado.saveData(event));
        
        crud_curso_programado.initDataTable();
        crud_curso_programado.initActionsTadaTables();        
    },

    initDataTable: ()=>{        
        crud_curso_programado.dtable = $('#' + crud_curso_programado.id_table).DataTable({
            pageLength: 10,//cantidad de registros a mostrar por paginas
            searching : false,//si es true agrega un buscador a la curso_programado
            ordering:false,//si es true se habilita la opcion de ordenar por columna
            serverSide: true,//si es true hace la llamada al servidor por cada pagina
            responsive: true,
            processing: true,
            language: {
                url: "public/js/plugins/dataTables/dataTablesSpanich.json"
            },
            ajax: {
                type:"GET",
                url: "controllers/CursoProgramadoController.php",
                data: function(dtp){
                    dtp.action = 'qry_curso_programado';                    
                    dtp.id_curso_programado = $("#cbx_id_curso_programado").val();
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

        $("#" + crud_curso_programado.id_table + " tbody").on("click", ".upd-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_curso_programado.dtable.row(id_row).data();
            crud_curso_programado.openModal(data);            
        });

        $("#" + crud_curso_programado.id_table + " tbody").on("click", ".est-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_curso_programado.dtable.row(id_row).data();            
            crud_curso_programado.changeEst(data);
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

            ajaxRequest('est_curso_programado',"post","CursoProgramadoController.php",data,(result)=>{
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
                    crud_curso_programado.reloadTable();
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
        ajaxRequest("get_curso_programado","get","CursoProgramadoController.php",{id:data.id},(result)=>{

            let d = result.row;
            let caracteristicas = result.rows_caracteristicas;
            let beneficios = result.rows_beneficios;

            $("#txt_crud_action").val("upd_curso_programado");
            $("#txt_crud_id").val(d.id);
            $("#txt_crud_descripcion").val(d.description);
            $("#txt_crud_resumen").val(d.resumen);
            list_caracteristicas.items = caracteristicas.map((el,i)=>{ return {id:i,title:el.description } })
            list_beneficios.items = beneficios.map((el,i)=>{ return {id: i,title:el.description } })
            list_caracteristicas.render();
            list_beneficios.render();
            $("#" + crud_curso_programado.id_modal + " #emodal_title").html("Editar Registro");
            $("#" + crud_curso_programado.id_modal).modal("show");

        });
    },

    openModal : ( data = {} )=>{        
        if(data.id){
            crud_curso_programado.loadDataToModal(data);
        }else{            
            $("#txt_crud_action").val("ins_curso_programado");
            $("#txt_crud_id").val("");
            $("#txt_crud_descripcion").val("");
            $("#txt_crud_resumen").val("");
            $("#lst_caracteristicas").html("");
            $("#lst_beneficios").html("");
            $("#" + crud_curso_programado.id_modal + " #emodal_title").html("Registrar CursoProgramado");
            $("#" + crud_curso_programado.id_modal).modal("show");        
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

        ajaxRequest(action,"post","CursoProgramadoController.php",data,(result)=>{
            if(result.error === ""){
                $("#" + crud_curso_programado.id_modal).modal("hide");
                showMessage(result.success,"success");
                crud_curso_programado.reloadTable();
            }else{
                showMessage(result.error,"error");
            }
        });

    },

    reloadTable : ()=>{
        if(crud_curso_programado.dtable) crud_curso_programado.dtable.draw();
    }

};

let tbl_tipo_pago = {
    items : [],
    init : ()=>{
        let tbl = $("#tbl_tipo_pago");
        let btn_add = $("#btn_add_tipo_pago");

        btn_add.on("click",()=>{ tbl_tipo_pago.add() });

        tbl.on('click',( event )=>{
            let element = event.target;
            if(element.localName == 'a'){
                event.preventDefault();
                let id_item = element.dataset.iditem;
                list.delete(id_item);
            }
        });

    },

    clear: ()=>{
        $("#cbx_crud_id_tipo_pago").val("");
        $("#txt_crud_monto").val("");
    },

    add: ()=>{
        let id_tipo_pago = $("#cbx_crud_id_tipo_pago").val().trim();
        let tipo_pago = $("#cbx_crud_id_tipo_pago option:selected").text().trim();
        let monto = $("#txt_crud_monto").val().trim();
        let msg = "";

        if(id_tipo_pago == ""){ msg = "Seleccione tipo de pago"; }
        else if(monto == ""){ msg = "Ingrese monto"; }
        else if( isNaN(monto) ){ msg = "El monto debe ser numérico"; }
        if(msg) return showMessage(msg,"error");

        let d = {
            id: (new Date).getTime(),
            id_tipo_pago: id_tipo_pago,
            tipo_pago: tipo_pago,
            monto: monto
        }        
        tbl_tipo_pago.items.push(d);
        tbl_tipo_pago.items.clear();
        list.render();
    },

    remove:(id_item)=>{
        let index_item = list.items.findIndex( (item) => item.id == id_item );
        list.items.splice( index_item, 1);
        list.render();
    },

    render : ()=>{
        let items_HTML = "";
        list.items.forEach( ( item )=>{
            items_HTML += `
            <tr>
                <td><a href="#" class="text-danger fa fa-trash-alt" data-iditem="${item.id}" title="eliminar"></a></td>
                <td>${item.tipo_pago}</td>
                <td>${item.monto}</td>
            </tr>`;
        });
        list.lst_container.html(items_HTML);
    },

    getString : ()=>{
        return list.items.map( (item)=>{ return item.id_tipo_pago + "," + item.monto; } ).join('|');
    }

};

//let list_caracteristicas = createCrudTable('txt_crud_caracteristica','btn_add_caracteristica','lst_caracteristicas','ingrese una caracteristica');
//let list_beneficios = createCrudTable('txt_crud_beneficio','btn_add_beneficio','lst_beneficios','ingrese beneficio');

const initInputMask = () => {
    $("#txt_crud_fecha_inicio").inputmask("dd/mm/yyyy");
    $("#txt_crud_fecha_fin").inputmask("dd/mm/yyyy");
    $("#txt_crud_hora_inicio").inputmask("hh:mm t");
    $("#txt_crud_hora_fin").inputmask("hh:mm t");
}

const loadCbx = ()=>{

    ajaxRequest("cbx_curso","get","CursoController.php",null,(result) => {        
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_curso',result["rows"],true);
    });

    ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:3},(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_tipo_pago',result["rows"]);
    });

    ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:4},(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_turno',result["rows"]);
    });
}

const searchEventListener = (event)=>{
    let target = event.target;    
    switch(event.type){
        case 'click':  if( target.classList.contains("btn-filter")) crud_curso_programado.reloadTable(); ;break;
        case 'change': if( target.classList.contains("cbx-filter")) crud_curso_programado.reloadTable(); ;break;
        case 'search': if( target.classList.contains("txt-filter")) crud_curso_programado.reloadTable(); ;break;
    }
}

document.addEventListener('DOMContentLoaded',()=>{
    
    tbl_tipo_pago.init();    
    loadCbx();
    initInputMask();
    
});
