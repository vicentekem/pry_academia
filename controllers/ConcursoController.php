
<?php

require_once "validator/ConcursoValidator.php";

class ConcursoController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new ConcursoValidator();
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
            case "qry_concurso":$array_result = $this->validator->qryConcurso();break;
            case "get_concurso":$array_result = $this->validator->getConcurso();break;            
            case "get_desc_concurso":$array_result = $this->validator->getDescConcurso();break;
            case "pw_concurso":$array_result = $this->validator->pwConcurso();break;
            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";

        switch ($action){
            case "ins_concurso": $array_result = $this->validator->saveConcurso('ins');break;
            case "upd_concurso": $array_result = $this->validator->saveConcurso('upd');break;
            case "est_concurso": $array_result = $this->validator->saveConcurso('est');break;
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new ConcursoController();
$controller->procesarPeticion();