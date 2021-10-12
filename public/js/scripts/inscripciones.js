let crud_pago = {
    
    dtable: null,
    id_table: "tbl_pago",
    id_adj_modal: "modal_adj_pago",
    id_view_modal: "modal_view_pago",
    id_chk_modal: "modal_chk_pago",
    id_rol : parseInt($("#txt_session_id_rol").val() || 100),
    init : ()=>{
        let btn_new_pago = $("#btn_new_pago");        
        let filter_container_jq = $("#filter_container");
        let btn_save_pago = $("#btn_save_pago");
        let btn_save_chk_pago = $("#btn_save_chk_pago");

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
        filter_container_jq.on("keyup", event => {
            if(event.keyCode == 13 || event.keyCode == 27){ searchEventListener(event);}
            if(event.keyCode == 27){ event.target.value = ""; }
        });

        btn_new_pago.on("click",  ()=> crud_pago.openModal());
        btn_save_pago.on("click", (event)=> crud_pago.saveData(event));
        btn_save_chk_pago.on("click", (event)=> crud_pago.saveChkData(event));
        
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
                    dtp.action = 'qry_pago_inscripcion';
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

                        var btn_rev =  row.id_estado_pago == 3 && crud_pago.id_rol <=3 ?
                            '<a class="dropdown-item check-row" href="#" id="check_' + meta.row + '">Revisar Baucher</a>' : '';
                        
                        var btn_options = `
                        <div class="dropdown">
                            <button class="btn btn-success dropdown-toggle" type="button" 
                                id="dp_btn_${meta.row}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Accion
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dp_btn_${meta.row}">
                                <a class="dropdown-item adj-row"  href="#" id="adj_${meta.row}">Adjuntar Baucher</a>
                                ${btn_rev}
                                <a class="dropdown-item view-row" href="#" id="view_${meta.row}">Ver Baucher</a>
                            </div>
                        </div>`;

                        return `<div class='text-center'> ${btn_options} </div>`;
                    }
                },
                { data: "estudiante"},
                { data: "curso"},                
                { data: "tipo_pago"},
                { data: "fecha_plazo"},
                { data: "monto"},
                { data: "estado_pago"}
            ]
        });
    },

    initActionsTadaTables: ()=>{

        const getData = (event)=>{
            event.preventDefault();            
            return crud_pago.dtable.row( event.target.id.match(/\d+/)[0] ).data();
        }

        $("#" + crud_pago.id_table + " tbody").on("click", ".adj-row", event => crud_pago.openAdjuntarModal(getData(event)) );
        $("#" + crud_pago.id_table + " tbody").on("click", ".check-row", event => crud_pago.openCheckModal(getData(event)) );
        $("#" + crud_pago.id_table + " tbody").on("click", ".view-row", event => crud_pago.openViewModal(getData(event)) );
    },
    
    openAdjuntarModal : ( data )=>{
        $("#fl_img_baucher")[0].value = "";
        $("#txt_curso").val(data.curso);
        $("#txt_crud_id").val(data.id);
        $("#txt_crud_action").val("upd_baucher_pago");
        $("#img_baucher").attr("src","public/img/default.png");
        $("#" + crud_pago.id_adj_modal + " #emodal_title").html("Registrar Pago");
        $("#" + crud_pago.id_adj_modal).modal("show");
    },

    openCheckModal : ( data )=>{
        $("#txt_chk_curso").val(data.curso);
        $("#txt_crud_id").val(data.id);
        $("#txt_observacion").val("");
        $("#txt_crud_action").val("chk_baucher_pago");
        $("#img_chk_baucher").attr("src",data.url_img || "public/img/default.png");
        $("#" + crud_pago.id_chk_modal + " #cmodal_title").html("Revisar Pago");
        $("#" + crud_pago.id_chk_modal).modal("show");
    },

    openViewModal : ( data )=>{
        $("#txt_view_curso").val(data.curso);
        $("#txt_crud_id").val(data.id);
        $("#img_view_baucher").attr("src",data.url_img || "public/img/default.png");
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

    saveChkData: (event)=>{
        event.preventDefault();
        let action = $("#txt_crud_action").val();
        let id = $("#txt_crud_id").val();
        let opt_rev_pago = $("[name='revisar_pago']:checked")[0].value;
        let observacion = $("#txt_observacion").val();
        
        if(opt_rev_pago == 2 && observacion == ""){
            return showMessage( "Ingrese una obsevación" , "error");
        }

        let data = {
            id: id,
            opt: opt_rev_pago,
            observacion: observacion
        }

        ajaxRequest(action,"post","PagoController.php",data,(result)=>{
            if(result.error === ""){
                $("#img_chk_baucher").attr("src", "public/img/default.png" );
                crud_pago.reloadTable();
                $("#" + crud_pago.id_chk_modal).modal("hide");
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
