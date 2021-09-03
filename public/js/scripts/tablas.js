let crud_tablas = {
    
    dtable: null,

    init : (id_table)=>{

        crud_tablas.dtable = $('#' + id_table).DataTable({
            pageLength: 10,
            searching : false,
            ordering:false,
            serverSide: true,
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
                /*{
                    render: function(data, type, row){
                        let btn = "";
                        /*var btn = "<a class='fa fa-edit text-warning mx-1' href='#' style='font-size: 1.1em' " +
                            " onclick='event.preventDefault();openModal(\"upd_persona\","+ JSON.stringify(row) +")' >"
                            +"</a>";
    
                        /*var cambiar_estado = "<a style='font-size: 1.1em' class='fa " +
                            (row.estado == '1' ? "fa-times text-danger" : "fa-check text-navy") + " mx-1' " +
                            " onclick='event.preventDefault();cambiarEstado("+ JSON.stringify(row) + ")' href='#' >"
                            +"</a>";
                        return "<div class='text-center'>" + btn + "</div>";
                    }
                },*/

                { data: "id"},
                { data: "description"},
                { data: "cod_referencial"},
                { data: "estado"}
            ]
        });
    },

    reloadTable : ()=>{
        if(crud_tablas.dtable) crud_tablas.dtable.draw();
    }

};

const ajaxCbx = (action,controller,parameters,successCallback,errorCallback) => {

}


document.addEventListener('DOMContentLoaded',()=>{
    
    crud_tablas.init("tbl_tablas");



});
