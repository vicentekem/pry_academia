<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class CursoProgramado
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function qryCursoProgramado($data)
    {
        $where = Utilitario::generarFiltros($data,[ "search" => "description like concat('%',:search,'%')" ]);
        $where_count = Utilitario::generarFiltros($data,[ "search" => "description like concat('%',:search,'%')" ]);
        
        return $this->model->getAllRows(
            "SELECT id,description,estado FROM tbl_curso_programado $where limit :start,:length ", $data,
            "SELECT count(id) AS cant_rows FROM tbl_curso_programado $where_count",["search" => $data["search"] ]
        );

    }

    public function selCursoProgramado($data)
    {
        $where = Utilitario::generarFiltros($data,[ "search" => "description like concat('%',:search,'%')" ]);
        $where_count = Utilitario::generarFiltros($data,[ "search" => "description like concat('%',:search,'%')" ]);
        
        return $this->model->getAllRows(
            "SELECT id,description,estado FROM tbl_curso_programado $where limit :start,:length ", $data,
            "SELECT count(id) AS cant_rows FROM tbl_curso_programado $where_count",["search" => $data["search"] ]
        );

    }

    public function saveCursoProgramado($action,$data){
        
        return $this->model->executeProcess(
            "call sp_curso_programado( '$action' ,:id,:descripcion) ", $data,
            "Datos guardados exitosamente"
        );

    }

}
