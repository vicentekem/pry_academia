
<?php

require_once "validator/RolValidator.php";

class RolController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new RolValidator();
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
            case "qry_rol":$array_result = $this->validator->qryRol();break;
            case "cbx_rol":$array_result = $this->validator->cbxRol();break;            
            case "get_rol":$array_result = $this->validator->getRol();break;
            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";

        switch ($action){
            case "ins_rol": $array_result = $this->validator->saveRol('ins');break;
            case "upd_rol": $array_result = $this->validator->saveRol('upd');break;
            case "est_rol": $array_result = $this->validator->saveRol('est');break;
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new RolController();
$controller->procesarPeticion();