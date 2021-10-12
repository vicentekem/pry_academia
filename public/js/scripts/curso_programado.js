let crud_curso_programado = {
    
    dtable: null,
    id_table: "tbl_curso_programado",
    id_modal: "modal_crud_curso_programado",
    action : getParameterByName("action"),

    id_rol : $("#txt_session_id_rol").val(),
    id_persona : $("#txt_session_id_persona").val(),
    id_usuario : $("#txt_session_id_usuario").val(),
    
    url_img_old : "",
    init : ()=>{
        
        let filter_container_jq = $("#filter_container");
        let btn_save_curso_programado = $("#btn_save_curso_programado");
        let input_file = $("#fl_crud_img_curso");
        let img_curso = $("#img_curso_programado");
        
        input_file.on("change",(event)=>{
            let target = event.target;            
            let default_src = "public/img/default.png";
            let src = target.files[0] ? URL.createObjectURL( target.files[0] ) : default_src;
            crud_curso_programado.url_img_old = img_curso.attr("src");
            img_curso.attr("src", src );
        })

        filter_container_jq.on("click",  event => searchEventListener( event ) );
        filter_container_jq.on("change", event => searchEventListener( event ) );
        filter_container_jq.on("keyup", event => {
            if(event.keyCode == 13 || event.keyCode == 27){ searchEventListener(event);}
            if(event.keyCode == 27){ event.target.value = ""; }
        });
        
        btn_save_curso_programado.on("click", (event)=> crud_curso_programado.saveData(event));

        if(crud_curso_programado.action=="" || crud_curso_programado.action =="list"){
            crud_curso_programado.initDataTable();
            crud_curso_programado.initActionsTadaTables();
        }else if(crud_curso_programado.action == "upd" || crud_curso_programado.action == "view"){
            let id = getParameterByName("id");
            crud_curso_programado.loadData(id);
        }

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
                {orderable: false, targets: 0, searchable: false, width:"8%"},
                {orderable: false, targets: 1, searchable: false, width:"20%"},
                {orderable: false, targets: 2, searchable: false, width:"11%"},
                {orderable: false, targets: 2, searchable: false, width:"11%"},
                {orderable: false, targets: 2, searchable: false, width:"20%"},
                {orderable: false, targets: 2, searchable: false, width:"20%"},
                {orderable: false, targets: 2, searchable: false, width:"10%"}
            ],
            columns: [
                {
                    render: function(data, type, row, meta){                    
                        var btn_edit = `<a class='fa fa-edit text-warning' title='Editar' href='?url=curso_programado&action=upd&id=${row.id}' style='font-size: 1.1em'></a>`;
                        var btn_view = `<a class='fa fa-eye text-sucess' title='Ver' href='?url=curso_programado&action=view&id=${row.id}' style='font-size: 1.1em'></a>`;
                        var btn_est  = row.estado == 1 ?
                            `<a class='fa fa-times text-danger est-row' title='Desactivar' id=est_${meta.row} href='#' style='font-size: 1.1em'></a>` : 
                            `<a class='fa fa-check text-info  est-row' title='Activar' id=est_${meta.row} href='#' style='font-size: 1.1em'></a>`;

                        let id_rol = crud_curso_programado.id_rol;
                        let id_persona = crud_curso_programado.id_persona;

                        let edit_permision = (id_rol == 1 || id_rol == 2 || id_persona == row.id_persona);
                        let show_permision = (id_rol != 1 && id_rol != 2);
                        let change_est_permision = (crud_curso_programado.id_rol == 1 || crud_curso_programado.id_rol == 2);

                        return `<div class='text-center'>
                            ${ edit_permision?btn_edit:""} ${ show_permision?btn_view:""} ${ change_est_permision?btn_est:""}</div>`;
                    }
                },
                { data: "description"},
                { data: "fecha_inicio"},
                { data: "fecha_fin"},
                { data: "profesor"},                
                { 
                    render: function(data, type, row, meta){
                        return `<a href="#" style="word-break: break-all;">${row.link_clase || ""}</a>`;
                    }
                },
                {
                    render: function(data, type, row, meta){
                        return row.estado == 1 ? `<div class="text-center"><small class="label label-primary">Activado</small></div>` : 
                        `<small class="label label-danger">Desactivado</small>`;
                    }
                }
            ]
        });
    },

    initActionsTadaTables: ()=>{

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

    loadData: ( id )=>{

        ajaxRequest("get_curso_programado","get","CursoProgramadoController.php",{id:id},(result)=>{

            let d = result.row;

            let montos = result.montos;
            let horarios = result.horarios;
            
            $("#txt_crud_action").val("upd_curso_programado");
            $("#txt_crud_id").val(d.id);

            ajaxRequest("cbx_curso","get","CursoController.php",null,(result) => {    
                result.rows.map((row)=>{
                    row.selected = d.id_curso == row.id;
                    return row;
                });
                loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_curso',result["rows"],true);
            });
        
            ajaxRequest("cbx_personal","get","PersonalController.php",null,(result) => {
                result.rows.map((row)=>{
                    row.selected = d.id_profesor == row.id;
                    return row;
                });
                loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_profesor',result["rows"],true);
            });
            
            $("#cbx_crud_id_curso").attr("disabled",true).trigger("change");
            $("#cbx_crud_id_profesor").attr("disabled",crud_curso_programado.action == 'view').trigger("change");
            $("#txt_crud_link_clase").val(d.link_clase).attr("disabled",crud_curso_programado.action == 'view');
            $("#txt_crud_fecha_inicio").val(d.fecha_inicio).attr("disabled",crud_curso_programado.action == 'view');
            $("#txt_crud_fecha_fin").val(d.fecha_fin).attr("disabled",crud_curso_programado.action == 'view')
            $("#txt_crud_cant_mensualidades").val(d.cant_mensualidades).attr("disabled",crud_curso_programado.action == 'view')

            $("#img_curso_programado").attr("src",d.url_img_curso);

            tbl_tipo_pago.items = montos;
            tbl_turno.items = horarios;
            tbl_tipo_pago.render();
            tbl_turno.render();

        });
    },

    validateData : (action,data)=>{
        let msg = "";

        if( action === 'upd_curso_programado' && data.id == ""){msg = "El id es requerido";}
        else if(data.id_curso == ""){ msg = "Seleccione curso"  }        
        else if(data.id_persona == ""){ msg = "Seleccione el profesor"  }
        else if(data.fecha_inicio == ""){ msg = "Ingrese fecha de inicio"  }
        else if(data.fecha_fin == ""){ msg = "Ingrese fecha final"  }
        else if(data.cant_mensualidades == ""){ msg = "Ingrese la cantidad de mensualidades" }
        else if(data.tipos_pago == ""){ msg = "Agregue montos" }
        else if(data.turnos == ""){ msg = "Agregue horarios" }
        return msg;
    },

    saveData: (event)=>{
        event.preventDefault();
        let action = $("#txt_crud_action").val();
        let id = $("#txt_crud_id").val();
        let id_curso = $("#cbx_crud_id_curso").val();
        let id_persona = $("#cbx_crud_id_profesor").val();
        let fecha_inicio = $("#txt_crud_fecha_inicio").val();
        let fecha_fin = $("#txt_crud_fecha_fin").val();        
        let link_clase = $("#txt_crud_link_clase").val();
        let cant_mensualidades = $("#txt_crud_cant_mensualidades").val();
        let fl_img_curso = document.getElementById("fl_crud_img_curso");
        let url_img = $("#img_curso_programado").attr("src");
        let tipos_pago = tbl_tipo_pago.getString();
        let turnos = tbl_turno.getString();

        let fd = new FormData();

        let data = {
            id : id,
            id_curso : id_curso,
            id_persona : id_persona,
            fecha_inicio : fecha_inicio,
            fecha_fin : fecha_fin,
            link_clase:link_clase,
            cant_mensualidades:cant_mensualidades,
            tipos_pago : tipos_pago,
            url_img:url_img,
            turnos : turnos
        }

        let err_msg = crud_curso_programado.validateData(action,data);
        if(err_msg != "") return showMessage( err_msg , "error");
        
        fd.append("id",id);
        fd.append("id_curso",id_curso);
        fd.append("id_persona",id_persona);
        fd.append("fecha_inicio",fecha_inicio);
        fd.append("fecha_fin",fecha_fin);
        fd.append("tipos_pago",tipos_pago);
        fd.append("turnos",turnos);
        fd.append("link_clase",link_clase);
        fd.append("cant_mensualidades",cant_mensualidades);
        fd.append("url_img",url_img);
        fd.append("url_img_old",crud_curso_programado.url_img_old);
        fd.append("fl_img_curso", fl_img_curso.files.length > 0 ? fl_img_curso.files[0] : "");
        
        ajaxFDRequest(action,"post","CursoProgramadoController.php",fd,(result)=>{
            if(result.error === ""){
                //$("#" + crud_curso_programado.id_modal).modal("hide");
                showMessage(result.success,"success");
                setTimeout(()=> location.href = "?url=curso_programado&action=list", 300 );
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
                tbl_tipo_pago.remove(id_item);
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
        
        for(let i=0;i<tbl_tipo_pago.items.length;i++){
            if(tbl_tipo_pago.items[i].id_tipo_pago === id_tipo_pago){
                msg = "El tipo de pago " + tipo_pago + " ya se encuentra agregado";
                break;
            }
        }

        if(msg) return showMessage(msg,"error");

        let d = {
            id: (new Date).getTime(),
            id_tipo_pago: id_tipo_pago,
            tipo_pago: tipo_pago,
            monto: monto
        }

        tbl_tipo_pago.items.push(d);
        tbl_tipo_pago.clear();
        tbl_tipo_pago.render();
    },

    remove:(id_item)=>{
        let index_item = tbl_tipo_pago.items.findIndex( (item) => item.id == id_item );
        tbl_tipo_pago.items.splice( index_item, 1);
        tbl_tipo_pago.render();
    },

    render : ()=>{
        let items_HTML = "";
        tbl_tipo_pago.items.forEach( ( item )=>{
            items_HTML += `
            <tr>
                <td class="text-center"><a href="#" class="text-danger fa fa-trash" data-iditem="${item.id}" title="eliminar" style="font-size:1.2em"></a></td>
                <td>${item.tipo_pago}</td>
                <td>${item.monto}</td>
            </tr>`;
        });
        $("#tbl_tipo_pago").html(items_HTML);
    },

    getString : ()=>{
        return tbl_tipo_pago.items.map( (item)=>{ return item.id_tipo_pago + "," + item.monto; } ).join('|');
    }

};

let tbl_turno = {
    items : [],
    tbl: $("#tbl_turno"),
    init : ()=>{        
        let btn_add = $("#btn_add_turno");
        btn_add.on("click",()=>{ tbl_turno.add() });

        tbl_turno.tbl.on('click',( event )=>{
            let element = event.target;
            if(element.localName == 'a'){
                event.preventDefault();
                let id_item = element.dataset.iditem;
                tbl_turno.remove(id_item);
            }
        });

    },

    clear: ()=>{
        $("#cbx_crud_id_turno").val("");
        $("#txt_crud_hora_inicio").val("");
        $("#txt_crud_hora_fin").val("");
    },

    add: ()=>{        
        let id_turno = $("#cbx_crud_id_turno").val().trim();
        let turno = $("#cbx_crud_id_turno option:selected").text().trim();
        let hora_inicio = $("#txt_crud_hora_inicio").val().trim();
        let hora_fin = $("#txt_crud_hora_fin").val().trim();
        let msg = "";

        if(id_turno == ""){ msg = "Seleccione turno";}
        else if(hora_inicio == ""){ msg = "Ingrese hora de inicio"; }
        else if(hora_fin == ""){ msg = "Ingrese hora final"; }

        for(let i=0;i<tbl_turno.items.length;i++){
            if(tbl_turno.items[i].id_turno === id_turno){
                msg = "El turno " + turno + " ya se encuentra agregado";
                break;
            }
        }

        if(msg) return showMessage(msg,"error");

        let d = {
            id: (new Date).getTime(),
            id_turno: id_turno,
            turno: turno,
            hora_inicio: hora_inicio,
            hora_fin: hora_fin
        }        
        tbl_turno.items.push(d);
        tbl_turno.clear();
        tbl_turno.render();
    },

    remove:(id_item)=>{
        let index_item = tbl_tipo_pago.items.findIndex( (item) => item.id == id_item );
        tbl_turno.items.splice( index_item, 1);
        tbl_turno.render();
    },

    render : ()=>{
        let items_HTML = "";
        tbl_turno.items.forEach( ( item )=>{
            items_HTML += `
            <tr>
                <td class="text-center"><a href="#" class="text-danger fa fa-trash" data-iditem="${item.id}" title="eliminar" style="font-size:1.2em"></a></td>
                <td>${item.turno}</td>
                <td>${item.hora_inicio}</td>
                <td>${item.hora_fin}</td>
            </tr>`;
        });
        tbl_turno.tbl.html(items_HTML);
    },

    getString : ()=>{
        return tbl_turno.items.map( (item)=>{ return item.id_turno + "," + item.hora_inicio + "," + item.hora_fin; } ).join('|');
    }

};

const initInputMask = () => {
    $("#txt_crud_fecha_inicio").inputmask("dd/mm/yyyy");
    $("#txt_crud_fecha_fin").inputmask("dd/mm/yyyy");
    $("#txt_crud_hora_inicio").inputmask("hh:mm t");
    $("#txt_crud_hora_fin").inputmask("hh:mm t");
}

const loadCbx = ()=>{
    let action = getParameterByName("action");
    if(action == 'ins'){
        ajaxRequest("cbx_curso","get","CursoController.php",null,(result) => {        
            loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_curso',result["rows"],true);
        });
    
        ajaxRequest("cbx_personal","get","PersonalController.php",null,(result) => {
            loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_profesor',result["rows"],true);
        });
    }    

    ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:3},(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_tipo_pago',result.rows);
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
    
    
    crud_curso_programado.init();
    tbl_tipo_pago.init();
    tbl_turno.init();
    loadCbx();
    initInputMask();
    
});

