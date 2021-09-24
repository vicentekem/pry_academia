<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class Persona
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function cbxPersona()
    {       
        return $this->model->getAllRows(
            "SELECT p.id, trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) description
            FROM tbl_persona p"
        );

    }
    

}
