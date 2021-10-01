let view_ciclo = {
    action : getParameterByName("action"),
    init : ()=>{

        switch(view_ciclo.action){
            case 'view': view_ciclo.showCurso();break;
            case 'list': view_ciclo.showCursos();break;
            default : view_ciclo.showCursos();
        }        
    },

    showCursos: () => {
    
        ajaxRequest("qry_curso_x_persona", "get","CursoProgramadoController.php",{}, (result) => {            
            loadDataToTemplate('tmpl_curso_insc','contenedor-curso',result["rows"]);    
        });

    },
    showCurso : ()=>{
        console.log("aaa");
        ajaxRequest("get_curso_programado_x_persona","get","CursoProgramadoController.php",{id: getParameterByName("id") },(result) => {         
            loadDataToTemplate("tmpl_curso_det","curso_inscrito",result["row"]);
        });
    }
}

document.addEventListener('DOMContentLoaded',()=>{

    view_ciclo.init();
        
});