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
                    dtp.search = $("#txt_search").val();
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
                {orderable: false, targets: 1, searchable: true,width:"70%",name:'description'},
                {orderable: false, targets: 2, searchable: true,width:"10%",name:'cod_referencial'},
                {orderable: false, targets: 3, searchable: true,width:"10%",name:'estado'}
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

        $("#" + crud_tablas.id_element + " tbody").on("click", ".upd-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_tablas.dtable.row(id_row).data();
        });

    },

    reloadTable : ()=>{
        if(crud_tablas.dtable) crud_tablas.dtable.draw();
    }

};

const loadCbx = ()=>{
    ajaxRequest("cbx_tablas","get","TablasController.php",{ id_tabla:0 },
    (result) => {
        loadDataToTemplate('tmpl_cbx_tabla','cbx_id_tabla',result["rows"]);
    });
}

document.addEventListener('DOMContentLoaded',()=>{
    crud_tablas.init("tbl_tablas");
    loadCbx();
});
