
<?php

require_once "validator/MenuValidator.php";

class MenuController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new MenuValidator();
    }

    public function procesarPeticion()
    {
        if ($_GET) {
            $this->controllerGet();
        } else if ($_POST) {
            $this->controllerPost();
        } else {
            $res["error"] = "Error al procesar la petición";
            echo json_encode($res);
        }
    }

    public function controllerGet()
    {
        $action = isset($_GET['action']) ? $_GET['action'] : "";
        switch ($action) {
            
            case "cbx_menu":$array_result = $this->validator->cbxMenu();break;
            case "cbx_submenu":$array_result = $this->validator->cbxSubMenu();break;
            case "cbx_submenu_x_usuario":$array_result = $this->validator->cbxSubMenuXUsuario();break;
            case "cbx_submenu_x_rol":$array_result = $this->validator->cbxSubMenuXRol();break;

            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";                            
        switch ($action) { default: $array_result["error"] = "Error al procesar la petición"; }
        echo json_encode($array_result);
    }

}

$controller = new MenuController();
$controller->procesarPeticion();