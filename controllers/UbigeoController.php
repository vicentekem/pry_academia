<?php
/**
 * Created by PhpStorm.
 * User: Ubigeo
 * Date: 28/05/2019
 * Time: 09:36
 */

require_once "validator/UbigeoValidator.php";

class UbigeoController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new UbigeoValidator();
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
            case "cbx_ubigeo":$array_result = $this->validator->cbxUbigeo();break;
            case "cbx_distritos":$array_result = $this->validator->cbxDistritos();break;
            case "cbx_provincias":$array_result = $this->validator->cbxProvincias();break;
            case "cbx_departamentos":$array_result = $this->validator->cbxDepartamentos();break;
            case "cbx_paises":$array_result = $this->validator->CbxPaises();break;
            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }

    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";
        switch ($action) {
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new UbigeoController();
$controller->procesarPeticion();


