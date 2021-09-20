let view_ciclo = {
  cursos: [],
  departamento: [],

  init: () => {
    let cbx_cursos = $("#Ciclos");

    cbx_cursos.on("change", (event) => {
      let idCurso = event.target.value;

      if (idCurso != "") {
        let index = view_ciclo.cursos.findIndex((curso) => {
          return curso.id == idCurso;
        });

        let monto = view_ciclo.cursos[index].monto_matricula;

        $("#precio").val(monto);
      } else {
        $("#precio").val("");
      }

      ajaxRequest(
        "cbx_turnos_x_curso",
        "get",
        "CursoProgramadoController.php",
        { id_curso_programado: idCurso },
        (result) => {
          //result["rows"] == result.rows
          loadDataToTemplate("tmpl_cbx_tabla", "turnos", result["rows"]);
        }
      );
    });

    //  ===================================================================

    let cbx_depa = $("#departamento");
    let cbx_prov = $("#provincia");

    cbx_depa.on("change", (event) => {
      let idDepa = event.target.value;

      ajaxRequest(
        "cbx_provincias",
        "get",
        "UbigeoController.php",
        { id_departamento: idDepa },
        (result) => {
          //result["rows"] == result.rows
          loadDataToTemplate("tmpl_cbx_main", "provincia", result["rows"]);
        }
        
        
        );
        
        distrito();
    });

    function distrito (){
        cbx_prov.on("change", (event) => {
            let idProv = event.target.value;
        ajaxRequest(
            "cbx_distritos",
            "get",
            "UbigeoController.php",
            { id_provincia: idProv },
            (result) => {
              //result["rows"] == result.rows
              loadDataToTemplate("tmpl_cbx_main", "distrito", result["rows"]);
            })

        })
    };
   


    view_ciclo.showDatos();
  },

  showDatos: () => {
    ajaxRequest(
      "cbx_curso_programado",
      "get",
      "CursoProgramadoController.php",
      {},
      (result) => {
        //result["rows"] == result.rows
        loadDataToTemplate("tmpl_cbx_main", "Ciclos", result["rows"]);

        view_ciclo.cursos = result.rows;
      }
    );

    ajaxRequest(
      "cbx_departamentos",
      "get",
      "UbigeoController.php",
      {},
      (result) => {
        //result["rows"] == result.rows
        loadDataToTemplate("tmpl_cbx_main", "departamento", result["rows"]);
      }
    );
  },
};

const loadCbx = () => {
  /*ajaxRequest("cbx_tablas","get","TablasController.php",{id_tabla:6},(result) => {
        loadDataToTemplate('tmpl_cbx_main','cbx_crud_id_sexo',result["rows"]);
    });*/
  //ajaxSelect2("cbx_crud_id_distrito","cbx_ubigeo","UbigeoController.php");
};

document.addEventListener("DOMContentLoaded", () => {
  view_ciclo.init();
  loadCbx();
});
