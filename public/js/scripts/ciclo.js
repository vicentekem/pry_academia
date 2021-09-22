let view_ciclo = {
    
};

const loadView = () => {
  ajaxRequest(
    "get_data_curso_programado",
    "get",
    "CursoProgramadoController.php",
    {id: getParameterByName("id") },
    (result) => {
      result.row.horarios = result.horarios;
      result.row.monts = result.montos;
      result.row.caracteristica = result.caracteristicas;
      result.row.beneficios = result.beneficios;
      console.log(result.row);
      loadDataToTemplate(
        "tmpl_view_description",
        "contenedor_Ciclo",
        result["row"]
      );
    }
  );

  /*ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:6},(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_sexo',result["rows"]);
    });*/

  //ajaxSelect2("cbx_crud_id_distrito","cbx_ubigeo","UbigeoController.php");
};

document.addEventListener("DOMContentLoaded", () => {
  loadView();
});
