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

    public function saveAcceso($action){
        $result = [ "error" => "" ];
        
        $data["id_usuario int"] = Utilitario::getIntParam("id_usuario");
        $data["id_rol int"] = Utilitario::getIntParam("id_rol");
        $data["id_menu int"] = Utilitario::getIntParam("id_menu");
        $data["accesos"] = Utilitario::getParam("accesos");

        $result = $result["error"] === "" ? $this->model->saveAcceso($action,$data) : $result;
        return $result;
    }

    public function saveAccesoXRol($action){
        $result = [ "error" => "" ];
                
        $data["id_rol int"] = Utilitario::getIntParam("id_rol");
        $data["id_menu int"] = Utilitario::getIntParam("id_menu");
        $data["accesos"] = Utilitario::getParam("accesos");

        $result = $result["error"] === "" ? $this->model->saveAccesoXRol($action,$data) : $result;
        return $result;
    }

}
