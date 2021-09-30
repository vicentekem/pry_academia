let view_ciclo = {

    init : ()=>{
        view_ciclo.showCursos();
    },

    showCursos: () => {
    
        ajaxRequest(
            "get_curso_programado_x_persona",
            "get",
            "CursoProgramadoController.php",
            {id: getParameterByName("id") },
            (result) => {
            //   result.row.curso= result.row;
            //   console.log(result.row);
              loadDataToTemplate(
                "tmpl_curso_det",
                "curso_inscrito",
                result["row"]
              );
            }
          );
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