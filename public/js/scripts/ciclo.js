let view_ciclo = {

    init : ()=>{
        let buscador = $('#buscador-ciclos')

        buscador.on('search', ()=>{
            view_ciclo.showCursos(); 
         }
        )

        view_ciclo.showCursos();
    },

    showCursos: () => {
    
        ajaxRequest("pw_curso_programado", "get","CursoProgramadoController.php",{search: $('#buscador-ciclos').val() }, (result) => {
            //result["rows"] == result.rows
            loadDataToTemplate('tmpl_card_curso','contenedor-curso',result["rows"]);
    
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