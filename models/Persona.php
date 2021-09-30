<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class Persona
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function cbxPersona($data)
    {

        $where = Utilitario::generarFiltros($data,[
            "q" => "TRIM(CONCAT(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) LIKE CONCAT('%',:q,'%')"
        ]);

        return $this->model->getAllRows(
            "SELECT p.id, trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) description, p.dni
            FROM tbl_persona p $where",$data
        );

    }
    

}
