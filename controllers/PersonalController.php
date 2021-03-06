
<?php

require_once "validator/PersonalValidator.php";

class PersonalController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new PersonalValidator();
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
            case "qry_personal":$array_result = $this->validator->qryPersonal();break;
            case "get_personal":$array_result = $this->validator->getPersonal();break;
            case "cbx_personal":$array_result = $this->validator->cbxPersonal();break;            
            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";

        switch ($action){
            case "ins_personal": $array_result = $this->validator->savePersonal('ins');break;
            case "upd_personal": $array_result = $this->validator->savePersonal('upd');break;
            case "est_personal": $array_result = $this->validator->savePersonal('est');break;
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new PersonalController();
$controller->procesarPeticion();