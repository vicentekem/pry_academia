
<?php

require_once "validator/AlumnoValidator.php";

class AlumnoController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new AlumnoValidator();
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
            case "qry_alumno":$array_result = $this->validator->qryAlumno();break;
            case "get_alumno":$array_result = $this->validator->getAlumno();break;            
            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";

        switch ($action){
            case "ins_alumno": $array_result = $this->validator->saveAlumno('ins');break;
            case "upd_alumno": $array_result = $this->validator->saveAlumno('upd');break;
            case "est_alumno": $array_result = $this->validator->saveAlumno('est');break;
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new AlumnoController();
$controller->procesarPeticion();