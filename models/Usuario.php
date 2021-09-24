<?php

require_once __DIR__ . "/../models/ModeloBase.php";

class Usuario
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function login($data)
    {
        return $this->model->getRow(
            "call sp_login(:usuario,:clave)",
            $data
        );
    }
   

}














