
<?php

require_once "validator/PagoValidator.php";

class PagoController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new PagoValidator();
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
            case "qry_pago":$array_result = $this->validator->qryPago();break;
            case "qry_pago_inscripcion":$array_result = $this->validator->qryPagoInscripcion();break;
            case "cbx_pago":$array_result = $this->validator->cbxPago();break;
            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";

        switch ($action){
            case "upd_baucher_pago": $array_result = $this->validator->savePago('upd_bp');break;
            case "chk_baucher_pago": $array_result = $this->validator->savePago('chk_bp');break;            
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new PagoController();
$controller->procesarPeticion();