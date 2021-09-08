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
            "SELECT id_ubigeo as id,CONCAT(departamento,' - ',provincia,' - ',distrito) as text FROM tbl_ubigeo $where", $data
        );
    }

    public function getUbigeoById($data)
    {
        $result = ["error" => "", "rows" => []];
        $filters = $data["filters_str"];
        try {

            $cn = $this->model->getConexion();
            $qry_sel = "SELECT id, departamento||' - '||provincia||' - '||distrito as text
                      FROM tbl_ubigeo2019 $filters ";

            $stmt = $cn->prepare($qry_sel);
            foreach ($data as $key => &$value) { if( $value &&( $key != 'filters_str' && $key != 'limit' ) ) $stmt->bindParam(":" . $key, $value);}

            $ok = $stmt->execute();

            if ($ok) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) { $result["rows"][] = $row;}
            } else {
                $result["error"] = "Error";
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = "Error";
        }
        return $result;
    }

    public function getCbxPaises($data)
    {
        $result = ["error" => "", "rows" => []];
        $filters = $data["filters_str"];
        try {

            $cn = $this->model->getConexion();
            $qry_sel = "select id_pais as id,pais descripcion from (select id_pais,provincia pais
                        from tbl_ubigeo2019 where id_pais <> 'PER' group by provincia,id_pais
                        union select 'PER','PERÚ' order by pais) as paises order by 1 ";

            $stmt = $cn->prepare($qry_sel);
            //foreach ($data as $key => &$value) { if( $value &&( $key != 'filters_str' && $key != 'limit' ) ) $stmt->bindParam(":" . $key, $value);}
            $ok = $stmt->execute();

            if ($ok) {

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result["rows"][] = $row;
                }

            } else {
                $result["error"] = "Error";
            }

        } catch (Exception $ex) {
            $cn = null;
            $result["error"] = "Error";
        }
        return $result;
    }

}










