<?php

require_once __DIR__ . "/../models/ModeloBase.php";

class Ubigeo
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function cbxUbigeo($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "q" => "CONCAT(departamento,' ',provincia,' ',distrito) LIKE CONCAT('%',:q,'%')"
        ]);
        
        return $this->model->getAllRows(
            "SELECT id_ubigeo as id,CONCAT(departamento,' - ',provincia,' - ',distrito) as description FROM tbl_ubigeo $where", $data
        );
    }

    public function cbxDepartamentos()
    {
        return $this->model->getAllRows(
            "SELECT distinct SUBSTR(id_ubigeo,1,2) as id,departamento as description FROM tbl_ubigeo where id_pais = 'PER'"
        );
    }

    public function cbxProvincias($data)
    {
        return $this->model->getAllRows(
            "SELECT distinct SUBSTR(id_ubigeo,1,4) as id,provincia as description 
            FROM tbl_ubigeo where id_pais = 'PER' and SUBSTR(id_ubigeo,1,2) = :id_departamento ", $data
        );
    }

    public function cbxDistritos($data)
    {
        return $this->model->getAllRows(
            "SELECT distinct id_ubigeo as id,distrito as description
            FROM tbl_ubigeo where id_pais = 'PER' and SUBSTR(id_ubigeo,1,4) = :id_provincia", $data
        );
    }

}










