let view_accesos = {

    init: () => {

        view_accesos.LoadData();
        
        let cbx_menu_options = $("#cbx_menus");
        let cbx_options_usuario = $("#cbx_usuarios");

        const btn_add = document.querySelector("#cbx_add");
        const btn_rmv = document.querySelector("#cbx_rmv");
        const btn_add_all = document.querySelector("#cbx_add_all");
        const btn_rmv_all = document.querySelector("#cbx_rmv_all");

        const sub_menu = document.querySelector("#cbx_sub_menus");

        btn_add.addEventListener("click", view_accesos.addAccess);
        btn_rmv.addEventListener("click", view_accesos.removeAccess);
        btn_add_all.addEventListener("click", view_accesos.addAllAccess);
        btn_rmv_all.addEventListener("click", view_accesos.removeAllAccess);

        cbx_menu_options.on("change", (event) => {

            let idOptions = event.target.value;
    
            if (idOptions != "") {
                ajaxRequest("cbx_submenu","get","MenuController.php",{ id_menu: idOptions },(result) => {
                    loadDataToTemplate("tmpl_cbx_controller_subOptions","cbx_sub_menus",result["rows"]);
                });
            } else {
                loadDataToTemplate("tmpl_cbx_controller", "cbx_sub_menus", []);
            }
        });
    
        cbx_options_usuario.on("change", (event) => {
            let idUsuario = event.target.value;            
            if (idUsuario != "") {
                ajaxRequest("cbx_submenu_x_usuario","get","MenuController.php",{ id_usuario: idUsuario },(result) => {
                    loadDataToTemplate("tmpl_cbx_controller_subOptions","cbx_accesos",result["rows"]);
                });
            } else {
                loadDataToTemplate("tmpl_cbx_usuario_controller", "cbx_accesos", []);
            }
        });
    },

    addAccess : (event) => {
        event.preventDefault()        
        let accesos = $("#cbx_sub_menus").val().join('|');
        let id_usuario = $("#cbx_usuarios").val();
        if(id_usuario){            
            ajaxRequest("add_acceso", "post", "AccesoController.php", { id_usuario: id_usuario,accesos:accesos }, (result) => {            
                ajaxRequest("cbx_submenu_x_usuario","get","MenuController.php",{ id_usuario: id_usuario },(result) => {
                    loadDataToTemplate("tmpl_cbx_controller_subOptions","cbx_accesos",result["rows"]);
                });
            });
        }else{
            showMessage("Seleccione un usuario","error");
        }
        
    },

    removeAccess : (event) => {
        event.preventDefault()
        let accesos = $("#cbx_accesos").val().join('|');
        let id_usuario = $("#cbx_usuarios").val();
        if(id_usuario){
            ajaxRequest("remove_acceso", "post", "AccesoController.php", { id_usuario: id_usuario,accesos:accesos }, (result) => {            
                ajaxRequest("cbx_submenu_x_usuario","get","MenuController.php",{ id_usuario: id_usuario },(result) => {
                    loadDataToTemplate("tmpl_cbx_controller_subOptions","cbx_accesos",result["rows"]);
                });
            });
        }
        
    },

    addAllAccess : (event) => {
        event.preventDefault()        
        let id_usuario = $("#cbx_usuarios").val();
        let id_menu = $("#cbx_menus").val();
        if(id_usuario){
            ajaxRequest("add_all_acceso", "post", "AccesoController.php", { id_usuario: id_usuario,id_menu:id_menu }, (result) => {
                ajaxRequest("cbx_submenu_x_usuario","get","MenuController.php",{ id_usuario: id_usuario },(result) => {
                    loadDataToTemplate("tmpl_cbx_controller_subOptions","cbx_accesos",result["rows"]);
                });
            });
        }else{
            showMessage("Seleccione un usuario","error");
        }
        
    },

    removeAllAccess : (event) => {
        event.preventDefault()
        let accesos = $("#cbx_accesos").val().join('|');
        let id_usuario = $("#cbx_usuarios").val();
        if(id_usuario){
            ajaxRequest("remove_all_acceso", "post", "AccesoController.php", { id_usuario: id_usuario,accesos:accesos }, (result) => {            
                ajaxRequest("cbx_submenu_x_usuario","get","MenuController.php",{ id_usuario: id_usuario },(result) => {
                    loadDataToTemplate("tmpl_cbx_controller_subOptions","cbx_accesos",result["rows"]);
                });
            });
        }        
    },

    LoadData: () => {

        ajaxRequest("cbx_menu", "get", "MenuController.php", {}, (result) => {
            loadDataToTemplate("tmpl_cbx_controller", "cbx_menus", result["rows"]);
        });

        ajaxRequest("cbx_usuario", "get", "UsuarioController.php", {}, (result) => {
            loadDataToTemplate("tmpl_cbx_usuario_controller","cbx_usuarios",result["rows"]);
        });
    }

};


document.addEventListener("DOMContentLoaded", () => {
    view_accesos.init();  
});
