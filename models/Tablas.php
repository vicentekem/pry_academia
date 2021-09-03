<?php

require_once __DIR__ . "/../services/General.php";

class Tablas extends General
{
    private $conexion;

    public function __construct()
    {
        $this->conexion = new Conexion();
    }

    public function qryTablas($data)
    {
        return $this->conexion->getAllRows(
            "select id_registro as id,description,cod_referencial,estado from tbl_tablas limit :start,:length ",
            $data,
            "select count(id_registro) as cant_rows from tbl_tablas"
        );

    }
   

}
