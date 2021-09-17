
<?php

require_once "validator/CursoProgramadoValidator.php";

class CursoProgramadoController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new CursoProgramadoValidator();
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
            case "qry_curso_programado":$array_result = $this->validator->qryCursoProgramado();break;
            case "pw_curso_programado" :$array_result = $this->validator->pwCursoProgramado();break;
            case "get_curso_programado" :$array_result = $this->validator->getCursoProgramado();break;
            case "cbx_curso_programado":$array_result = $this->validator->cbxCursoProgramado();break;
            case "cbx_turnos_x_curso":$array_result = $this->validator->cbxTurnosForCurso();break;
            default: $array_result["error"] = "Error al procesar la petición";break;
        }
        echo json_encode($array_result);
    }
    
    public function controllerPost()
    {
        $action = isset($_POST['action']) ? $_POST['action'] : "";

        switch ($action){
            case "ins_curso_programado": $array_result = $this->validator->saveCursoProgramado('ins');break;
            case "upd_curso_programado": $array_result = $this->validator->saveCursoProgramado('upd');break;
            case "est_curso_programado": $array_result = $this->validator->saveCursoProgramado('est');break;
            default: $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode($array_result);
    }

}

$controller = new CursoProgramadoController();
$controller->procesarPeticion();