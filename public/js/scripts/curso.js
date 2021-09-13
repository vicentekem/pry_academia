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

        frm_crud_curso.on('submit', (event)=> event.preventDefault);

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

    loadDataToModal : ( data )=>{
        ajaxRequest("get_curso","get","CursoController.php",{id:data.id},(result)=>{

            let d = result.row;
            let caracteristicas = result.rows_caracteristicas;
            let beneficios = result.rows_beneficios;

            $("#txt_crud_action").val("upd_curso");
            $("#txt_crud_id").val(d.id);
            $("#txt_crud_descripcion").val(d.description);
            $("#txt_crud_resumen").val(d.resumen);
            list_caracteristicas.items = caracteristicas.map((el,i)=>{ return {id:i,title:el.description } })
            list_beneficios.items = beneficios.map((el,i)=>{ return {id: i,title:el.description } })
            list_caracteristicas.render();
            list_beneficios.render();
            $("#" + crud_curso.id_modal + " #emodal_title").html("Editar Registro");
            $("#" + crud_curso.id_modal).modal("show");

        });
    },

    openModal : ( data = {} )=>{        
        if(data.id){
            crud_curso.loadDataToModal(data);
        }else{            
            $("#txt_crud_action").val("ins_curso");
            $("#txt_crud_id").val("");
            $("#txt_crud_descripcion").val("");
            $("#txt_crud_resumen").val("");
            $("#lst_caracteristicas").html("");
            $("#lst_beneficios").html("");
            $("#" + crud_curso.id_modal + " #emodal_title").html("Registrar Curso");
            $("#" + crud_curso.id_modal).modal("show");        
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

let createList = (id_input,id_btn_add,id_lst_container,errorMessage = "")=>{
    let list = {
        input_el : $("#" + id_input),
        btn_add : $("#" + id_btn_add),
        lst_container : $("#" + id_lst_container),
        items : [],
        init: ()=>{

            list.btn_add.on('click', ()=> { list.add(); });
            list.input_el.on('keyup', (event)=> { if(event.key === 'Enter') list.add(); });

            list.lst_container.on('click',( event )=>{
                let element = event.target;
                if(element.localName == 'a'){
                    event.preventDefault();
                    let id_item = element.dataset.iditem;
                    list.delete(id_item);
                }
            });
        },

        add : () =>{
            let item = { id : (new Date).getTime(), title : list.input_el.val().trim() };
            if(item.title.trim()!== ""){ list.items.push(item); }
            else{ return showMessage(errorMessage,"error"); }
            list.input_el.val("");
            list.render();
        },

        render : ()=>{
            let items_HTML = "";
            list.items.forEach( ( item )=>{
                items_HTML += `<li> ${item.title} <a href="#" class="text-danger ml-1" data-iditem="${item.id}" title="eliminar">x</a></li>`;
            });
            list.lst_container.html(items_HTML);
        },

        delete: (id_item)=>{
            let index_item = list.items.findIndex( (t) => t.id == id_item );
            list.items.splice( index_item, 1);
            list.render();
        },

        getString : ()=>{            
            return list.items.map( (item)=>{ return item.title } ).join('|');
        }

    }
    return list;
};

let list_caracteristicas = createList('txt_crud_caracteristica','btn_add_caracteristica','lst_caracteristicas','ingrese una caracteristica');
let list_beneficios = createList('txt_crud_beneficio','btn_add_beneficio','lst_beneficios','ingrese beneficio');

const searchEventListener = (event)=>{
    let target = event.target;    
    switch(event.type){
        case 'click':  if( target.classList.contains("btn-filter")) crud_curso.reloadTable(); ;break;
        case 'change': if( target.classList.contains("cbx-filter")) crud_curso.reloadTable(); ;break;
        case 'search': if( target.classList.contains("txt-filter")) crud_curso.reloadTable(); ;break;
    }
}

document.addEventListener('DOMContentLoaded',()=>{
    
    list_caracteristicas.init();
    list_beneficios.init();
    crud_curso.init();
    
});
