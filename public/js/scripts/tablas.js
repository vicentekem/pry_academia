let crud_tablas = {
    
    dtable: null,
    id_element: null,
    init : (id_table)=>{

        crud_tablas.id_element = id_table;
        crud_tablas.dtable = $('#' + id_table).DataTable({
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
                        var btn_edit = `<a class='fa fa-edit text-warning upd-row' id=upd_${meta.row} href='#' style='font-size: 1.1em'></a>`;
                        return "<div class='text-center'>" + btn_edit + "</div>";
                    }
                },
                { data: "description"},
                { data: "cod_referencial"},
                { data: "estado"}
            ]
        });

        $("#tbl_tablas tbody").on("click", ".upd-row", function(event){
            event.preventDefault();

            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_tablas.dtable.row(id_row).data();
            
            $("#txt_crud_descripcion").val(data.description);
            $("#modal_crud_tablas").modal("show");
            console.log(data);
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
    //console.dir( event.type );
    switch(event.type){
        case 'click':  if( target.classList.contains("btn-filter")) crud_tablas.reloadTable(); ;break;
        case 'change': if( target.classList.contains("cbx-filter")) crud_tablas.reloadTable(); ;break;
        case 'search': if( target.classList.contains("txt-filter")) crud_tablas.reloadTable(); ;break;
    }
}

document.addEventListener('DOMContentLoaded',()=>{

    let btn_new_tabla = document.getElementById("btn_new_tabla");    
    let filter_container_jq = $("#filter_container");

    filter_container_jq.on("change", event => searchEventListener( event ) );
    filter_container_jq.on("search", event => searchEventListener( event ) );
    
    btn_new_tabla.addEventListener("click",()=>{ $("#modal_crud_tablas").modal("show") });

    crud_tablas.init("tbl_tablas");
    loadCbx();
});
