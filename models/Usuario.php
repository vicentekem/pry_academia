<?php

require_once __DIR__ . "/../services/General.php";

class Usuario extends General
{
    private $conexion;

    public function __construct()
    {
        $this->conexion = new Conexion();
    }

    public function login($data)
    {
        return $this->conexion->getRow(
            "call sp_login(:usuario,:clave)",
            $data
        );

    }
   

}














