<?php

require_once __DIR__ . "/../../models/Acceso.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class AccesoValidator
{

    private $model;

    public function __construct()
    {
        $this->model = new Acceso();
    }

    public function saveAcceso(){
        $result = [ "error" => "" ];
        
        $data["id_usuario int"] = Utilitario::getIntParam("id_usuario");

        $result = $result["error"] === "" ? $this->model->saveAcceso($data) : $result;
        return $result;
    }

}
