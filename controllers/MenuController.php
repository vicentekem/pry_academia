
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

            case "qry_Menus":$array_result = $this->validator->getMenus();break;

            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";
                            
        switch ($action) {

            case "ins_prueba": $array_result = $this->validator->saveMenu(false);break;
            case "upd_prueba": $array_result = $this->validator->saveMenu(true);break;

            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new MenuController();
$controller->procesarPeticion();