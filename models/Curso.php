<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class Curso
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function qryCurso($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "search" => "description like concat('%',:search,'%')"
        ]);

        $where_count = Utilitario::generarFiltros($data,[
            "search" => "description like concat('%',:search,'%')"
        ]);
        
        return $this->model->getAllRows(
            "SELECT id,description,estado FROM tbl_curso $where limit :start,:length ", $data,
            "SELECT count(id) AS cant_rows FROM tbl_curso $where_count",["search" => $data["search"] ]
        );

    }

    public function cbxCurso($data){

        $where = Utilitario::generarFiltros($data,[]);

        return $this->model->getAllRows(
            "SELECT id_registro as id,description FROM tbl_curso $where", $data
        );
    }

    public function saveCurso($action,$data){
        
        return $this->model->executeProcess(
            "call sp_curso( '$action' ,:id,:descripcion) ", $data,
            "Datos guardados exitosamente"
        );

    }

}
