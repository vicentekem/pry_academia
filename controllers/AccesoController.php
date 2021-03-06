
<?php

require_once "validator/AccesoValidator.php";

class AccesoController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new AccesoValidator();
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
            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";                            
        switch ($action) {
            case "add_acceso":$array_result = $this->validator->saveAcceso('add');break;
            case "add_all_acceso":$array_result = $this->validator->saveAcceso('add_all');break;
            case "remove_acceso":$array_result = $this->validator->saveAcceso('rmv');break;
            case "remove_all_acceso":$array_result = $this->validator->saveAcceso('rmv_all');break;

            case "add_acceso_x_rol":$array_result = $this->validator->saveAccesoXRol('add');break;
            case "add_all_acceso_x_rol":$array_result = $this->validator->saveAccesoXRol('add_all');break;
            case "remove_acceso_x_rol":$array_result = $this->validator->saveAccesoXRol('rmv');break;
            case "remove_all_acceso_x_rol":$array_result = $this->validator->saveAccesoXRol('rmv_all');break;

            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new AccesoController();
$controller->procesarPeticion();