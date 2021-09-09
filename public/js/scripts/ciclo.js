let view_ciclo = {

    init : ()=>{
        
        view_ciclo.showCursos();
    },

    showCursos: () => {
                
    }

}

const loadCbx = ()=>{

    /*ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:5},(result) => {
        //result["rows"] == result.rows
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_cargo',result["rows"],true);

    });*/

    /*ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:6},(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_sexo',result["rows"]);
    });*/

    //ajaxSelect2("cbx_crud_id_distrito","cbx_ubigeo","UbigeoController.php");
}


document.addEventListener('DOMContentLoaded',()=>{
        
    view_ciclo.init();
    loadCbx();
    
});