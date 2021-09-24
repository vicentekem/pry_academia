let crud_pago = {
    
    dtable: null,
    id_table: "tbl_pago",
    id_adj_modal: "modal_adj_pago",
    id_view_modal: "id_view_modal",
    id_rol : $("#txt_session_id_rol").val(),
    init : ()=>{
        let btn_new_pago = $("#btn_new_pago");        
        let filter_container_jq = $("#filter_container");
        let btn_save_pago = $("#btn_save_pago");

        let input_file = $("#fl_img_baucher");
        let img_baucher = $("#img_baucher");

        input_file.on("change",(event)=>{
            let target = event.target;            
            let default_src = "public/img/default.png";
            let src = target.files[0] ? URL.createObjectURL( target.files[0] ) : default_src;
            crud_pago.url_img_old = img_baucher.attr("src");
            img_baucher.attr("src", src );
        })

        filter_container_jq.on("click",  event => searchEventListener( event ) );
        filter_container_jq.on("change", event => searchEventListener( event ) );
        filter_container_jq.on("keyup", event => { if(event.keyCode == 13){ searchEventListener(event); } });

        btn_new_pago.on("click",  ()=> crud_pago.openModal());
        btn_save_pago.on("click", (event)=> crud_pago.saveData(event));
        
        crud_pago.initDataTable();
        crud_pago.initActionsTadaTables();        
    },

    initDataTable: ()=>{        
        crud_pago.dtable = $('#' + crud_pago.id_table).DataTable({
            pageLength: 10,//cantidad de registros a mostrar por paginas
            searching : false,//si es true agrega un buscador a la pago
            ordering:false,//si es true se habilita la opcion de ordenar por columna
            serverSide: true,//si es true hace la llamada al servidor por cada pagina
            responsive: true,
            processing: true,
            language: {
                url: "public/js/plugins/dataTables/dataTablesSpanich.json"
            },
            ajax: {
                type:"GET",
                url: "controllers/PagoController.php",
                data: function(dtp){
                    dtp.action = 'qry_pago';
                    dtp.id_pago = $("#cbx_id_pago").val();
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
                {orderable: false, targets: 1, searchable: false, width:"20%",visible:(crud_pago.id_rol == 1 || crud_pago.id_rol == 2)},
                {orderable: false, targets: 2, searchable: false, width:"20%"}
            ],
            columns: [
                {
                    render: function(data, type, row, meta){

                        var btn_edit = `
                        <div class="dropdown">
                            <button class="btn btn-success dropdown-toggle" type="button" 
                                id="dp_btn_${meta.row}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Accion
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dp_btn_${meta.row}">
                                <a class="dropdown-item adj-row"  href="#" id="adj_${meta.row}">Adjuntar Baucher</a>
                                <a class="dropdown-item view-row" href="#" id="view_${meta.row}">Ver baucher</a>                                
                            </div>
                        </div>`;

                        return `<div class='text-center'> ${btn_edit} </div>`;
                    }
                },
                { data: "estudiante"},
                { data: "curso"},
                { data: "ciclo"},
                { data: "tipo_pago"},
                { data: "fecha_plazo"},
                { data: "monto"},
                { data: "estado_pago"}
            ]
        });
    },

    initActionsTadaTables: ()=>{

        $("#" + crud_pago.id_table + " tbody").on("click", ".adj-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_pago.dtable.row(id_row).data();                        
            crud_pago.openAdjuntarModal(data);
        });

        $("#" + crud_pago.id_table + " tbody").on("click", ".view-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_pago.dtable.row(id_row).data();            
            crud_pago.openViewModal(data);
        });

    },
    
    openAdjuntarModal : ( data )=>{
        $("#txt_curso").val(data.curso);
        $("#txt_crud_id").val(data.id);
        $("#txt_crud_action").val("upd_baucher_pago");
        $("#" + crud_pago.id_adj_modal + " #emodal_title").html("Registrar Pago");
        $("#" + crud_pago.id_adj_modal).modal("show");
    },

    openViewModal : ( data )=>{
        $("#txt_view_curso").val(data.curso);
        $("#txt_crud_id").val(data.id);
        $("#img_baucher").attr("src",data.url_img || "public/img/default.png");
        $("#" + crud_pago.id_view_modal + " #vmodal_title").html("Ver Archivo");
        $("#" + crud_pago.id_view_modal).modal("show");
    },

    saveData: (event)=>{
        event.preventDefault();
        let action = $("#txt_crud_action").val();
        let id = $("#txt_crud_id").val();
        let fl_img_pago = document.getElementById("fl_img_baucher");
        let url_img = $("#img_baucher").attr("src");        
        let fd = new FormData();
        
        if( fl_img_pago.value == "") return showMessage( "seleccione un archivo" , "error");
        
        fd.append("id",id);
        fd.append("url_img",url_img);
        fd.append("fl_img_pago", fl_img_pago.files.length > 0 ? fl_img_pago.files[0] : "");
        
        ajaxFDRequest(action,"post","PagoController.php",fd,(result)=>{
            if(result.error === ""){
                fl_img_pago.value = "";
                $("#img_baucher").attr("src", "public/img/default.png" );
                crud_pago.reloadTable();
                $("#" + crud_pago.id_adj_modal).modal("hide");
                showMessage(result.success,"success");
            }else{
                showMessage(result.error,"error");
            }
        });

    },

    reloadTable : ()=>{
        if(crud_pago.dtable) crud_pago.dtable.draw();
    }

};

const searchEventListener = (event)=>{
    let target = event.target;    
    switch(event.type){
        case 'click' :  if( target.classList.contains("btn-filter")) crud_pago.reloadTable(); ;break;
        case 'change': if( target.classList.contains("cbx-filter")) crud_pago.reloadTable(); ;break;
        case 'search': if( target.classList.contains("txt-filter")) crud_pago.reloadTable(); ;break;
        case 'keyup' : if( target.classList.contains("txt-filter")) crud_pago.reloadTable(); ;break;
    }
}

document.addEventListener('DOMContentLoaded',()=>{
    crud_pago.init();    
});
