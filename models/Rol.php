<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class Rol
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function qryRol($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "search" => "description like concat('%',:search,'%')"
        ]);

        return $this->model->getAllRows(
            "SELECT id,description,estado FROM tbl_rol $where limit :start,:length ", $data,
            "SELECT count(id) AS cant_rows FROM tbl_rol $where",["search" => $data["search"] ]
        );

    }

    public function cbxRol()
    {
        return $this->model->getAllRows("SELECT id,description FROM tbl_rol WHERE estado = 1");
    }


}
