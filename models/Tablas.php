<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class Tablas
{
    private $model;

    public function __construct(){
        $this->model = new ModeloBase();
    }

    public function qryTablas($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "search" => "description like concat('%',:search,'%')",
            "id_tabla" => "id_tabla = :id_tabla"
        ]);

        $data_count = $data;
        unset( $data_count["start int"] );
        unset( $data_count["length int"] );
                
        return $data["id_tabla int"] === null ?       
            $result = ["rows" => [], "cant_rows" => 0,"row" => null, "error" => null]
        :
        $this->model->getAllRows(
            "SELECT id_tabla,id_registro AS id,description,cod_referencial,estado
            FROM tbl_tablas $where limit :start,:length ", $data,
            "SELECT count(id_registro) AS cant_rows FROM tbl_tablas $where",
            $data_count
        );

    }

    public function cbxTablas($data){

        $where = Utilitario::generarFiltros($data,[
            "id_tabla" => "id_tabla = :id_tabla"
        ]);        
        return $this->model->getAllRows(
            "SELECT id_registro as id,description FROM tbl_tablas $where", $data
        );
    }

    public function saveTabla($action,$data){
        
        return $this->model->executeProcess(
            "call sp_tablas( '$action' ,:id_tabla,:id_registro,:descripcion,:cod_ref) ", $data,
            "Datos guardados exitosamente"
        );
    }

}
