
<?php

require_once "validator/InscripcionValidator.php";

class InscripcionController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new InscripcionValidator();
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
        switch ($action){
            case "ins_inscripcion": $array_result = $this->validator->saveInscripcion('ins');break;
            case "upd_inscripcion": $array_result = $this->validator->saveInscripcion('upd');break;
            case "est_inscripcion": $array_result = $this->validator->saveInscripcion('est');break;
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }
}

$controller = new InscripcionController();
$controller->procesarPeticion();