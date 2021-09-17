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

    public function getCurso($data)
    {

        $where = Utilitario::generarFiltros($data,[
            "id" => "c.id = :id"
        ]);

        $result = $this->model->getRow( "SELECT c.id,c.description,c.resumen,c.estado FROM tbl_curso c $where", $data);
        $result["rows_caracteristicas"] = $this->model->getAllRows( 
            "SELECT c.id,cc.description FROM tbl_curso c inner join tbl_curso_caracteristicas cc on c.id = cc.id_curso $where", $data
        )["rows"];
        $result["rows_beneficios"] = $this->model->getAllRows( 
            "SELECT c.id,cb.description FROM tbl_curso c inner join tbl_curso_beneficios cb on c.id = cb.id_curso $where", $data
        )["rows"];

        return $result;
    }

    public function cbxCurso()
    {
        return $this->model->getAllRows("SELECT id,description FROM tbl_curso WHERE estado = 1");
    }

    public function saveCurso($action,$data){        
        return $this->model->executeProcess(
            "call sp_curso( '$action' ,:id,:descripcion,:resumen,:caracteristicas,:beneficios) ", $data,
            "Datos guardados exitosamente"
        );

    }

}
