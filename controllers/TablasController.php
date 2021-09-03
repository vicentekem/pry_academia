
<?php

require_once "validator/TablasValidator.php";

class TablasController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new TablasValidator();
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
            case "qry_tablas":$array_result = $this->validator->qryTablas();break;
            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";

        switch ($action){
            case "ins_tabla": $array_result = $this->validator->saveTablas(false);break;
            case "upd_tabla": $array_result = $this->validator->saveTablas(true);break;
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new TablasController();
$controller->procesarPeticion();