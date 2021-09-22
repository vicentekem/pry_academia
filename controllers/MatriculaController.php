
<?php

require_once "validator/MatriculaValidator.php";

class MatriculaController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new MatriculaValidator();
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
            case "ins_matricula": $array_result = $this->validator->saveMatricula('ins');break;
            case "upd_matricula": $array_result = $this->validator->saveMatricula('upd');break;
            case "est_matricula": $array_result = $this->validator->saveMatricula('est');break;
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new MatriculaController();
$controller->procesarPeticion();