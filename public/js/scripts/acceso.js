
const loadCbx = ()=>{

    ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:2},(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_rol',result["rows"]);
    });

    ajaxRequest("cbx_persona","get","PersonaController.php",null,(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_persona',result["rows"],true);
    });

    ajaxSelect2("cbx_crud_id_distrito","cbx_ubigeo","UbigeoController.php")

}

document.addEventListener('DOMContentLoaded',()=>{

    loadCbx();

});
