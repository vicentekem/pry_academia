<?php

require_once __DIR__ . "/../services/General.php";

class Ubigeo extends General
{
    private $conexion;

    public function __construct()
    {
        $this->conexion = new Conexion();
    }

    public function getCbxUbigeo($data)
    {
        $result = ["error" => "", "rows" => []];
        $filters = $data["filters_str"];
        try {

            $cn = $this->conexion->getConexion();
            $qry_sel = "SELECT  id_ubigeo as id, departamento||' - '||provincia||' - '||distrito as text
                      FROM tbl_ubigeo2019 $filters ";

            $stmt = $cn->prepare($qry_sel);
            foreach ($data as $key => &$value) { if( $value &&( $key != 'filters_str' && $key != 'limit' ) ) $stmt->bindParam(":" . $key, $value);}

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

    public function getUbigeoById($data)
    {
        $result = ["error" => "", "rows" => []];
        $filters = $data["filters_str"];
        try {

            $cn = $this->conexion->getConexion();
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

            $cn = $this->conexion->getConexion();
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










