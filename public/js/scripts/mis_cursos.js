let view_ciclo = {

    init : ()=>{
        view_ciclo.showCursos();
    },

    showCursos: () => {
    
        ajaxRequest("qry_curso_x_persona", "get","CursoProgramadoController.php",{}, (result) => {
            //result["rows"] == result.rows
            loadDataToTemplate('tmpl_curso_insc','contenedor-curso',result["rows"]);
    
        });

    }
}

const loadCbx = ()=>{

    

    /*ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:6},(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_sexo',result["rows"]);
    });*/

    //ajaxSelect2("cbx_crud_id_distrito","cbx_ubigeo","UbigeoController.php");
}


document.addEventListener('DOMContentLoaded',()=>{
        
    view_ciclo.init();
    loadCbx();
    
});