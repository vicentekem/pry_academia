<?php

require_once __DIR__ . "/../models/ModeloBase.php";

class Acceso
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function saveAcceso($action,$data){

        return $this->model->executeProcess(
            "call sp_accesos( '$action' ,:id_usuario,:id_rol,:id_menu,:accesos) ",$data,"Datos guardados exitosamente"
        );

    }

    public function saveAccesoXRol($action,$data){

        return $this->model->executeProcess(
            "call sp_accesos_rol( '$action',:id_rol,:id_menu,:accesos) ",$data,"Datos guardados exitosamente"
        );

    }

}



