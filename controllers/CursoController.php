
<?php

require_once "validator/CursoValidator.php";

class CursoController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new CursoValidator();
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
            case "qry_curso":$array_result = $this->validator->qryCurso();break;
            case "cbx_curso":$array_result = $this->validator->cbxCurso();break;            
            case "get_curso":$array_result = $this->validator->getCurso();break;
            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";

        switch ($action){
            case "ins_curso": $array_result = $this->validator->saveCurso('ins');break;
            case "upd_curso": $array_result = $this->validator->saveCurso('upd');break;
            case "est_curso": $array_result = $this->validator->saveCurso('est');break;
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new CursoController();
$controller->procesarPeticion();