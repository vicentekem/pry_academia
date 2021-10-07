let view_ciclo = {
  init: () => {
    view_ciclo.LoadData();

    // variables
    // ----------
    let cbx_menu_options = $("#cbx_menus");
    let cbx_options_usuario = $("#cbx_usuarios");

    
    const btn_agregar = document.querySelector("#cbx_añadir");
    const sub_menu = document.querySelector("#cbx_sub_menus");
    
    btn_agregar.addEventListener("click", addAccess);
   
    function addAccess(event){
        event.preventDefault()        
        let data = $("#cbx_sub_menus").val().join('|');

        console.log(data);
    }
    
    // Controller Options
    // ---------------------
    cbx_menu_options.on("change", (event) => {
      let idOptions = event.target.value;
    //   console.log(typeof idOptions);
      if (idOptions != "") {
        ajaxRequest(
          "cbx_submenu",
          "get",
          "MenuController.php",
          { id_menu: idOptions },
          (result) => {
            loadDataToTemplate(
              "tmpl_cbx_controller_subOptions",
              "cbx_sub_menus",
              result["rows"]
            );
          }
        );
      } else {
        loadDataToTemplate("tmpl_cbx_controller", "cbx_sub_menus", []);
      }
    });

    // Usuario Options
    // -----------------
    cbx_options_usuario.on("change", (event) => {
      let idUsuario = event.target.value;
      console.log(typeof idUsuario);
      if (idUsuario != "") {
        ajaxRequest(
          "cbx_submenu_x_usuario",
          "get",
          "MenuController.php",
          { id_usuario: idUsuario },
          (result) => {
            loadDataToTemplate(
              "tmpl_cbx_controller_subOptions",
              "cbx_accesos",
              result["rows"]
            );
          }
        );
      } else {
        loadDataToTemplate("tmpl_cbx_usuario_controller", "cbx_accesos", []);
      }
    });
  },

  LoadData: () => {
    ajaxRequest("cbx_menu", "get", "MenuController.php", {}, (result) => {
      loadDataToTemplate("tmpl_cbx_controller", "cbx_menus", result["rows"]);
    });

    ajaxRequest("cbx_usuario", "get", "UsuarioController.php", {}, (result) => {
      loadDataToTemplate(
        "tmpl_cbx_usuario_controller",
        "cbx_usuarios",
        result["rows"]
      );
    });
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
