<?php

class Conexion
{

    private $host = "localhost";
    private $user = "root";
    private $pass = "secret";
    private $bdname = "db_pry_academia";
    private $cn = "";
    private $result = ["rows" => [], "cant_rows" => 0,"row" => null, "error" => null];

    function getConexion(){

        $conexion = null;

        try{

            $conexion = new PDO(
                "mysql:host=" . $this->host . ";dbname=". $this->bdname,
                $this->user,
                $this->pass
            );

            $conexion ->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION);

        }

        catch(PDOException $e){
            throw $e;
        }
        return $conexion;
    }

    function getAllRows($sql, $data = []){

        $result = ["rows" => [], "cant_rows" => 0,"row" => null, "error" => null];
        try{
            $cn = $this->getConexion();
            $stmt = $cn->prepare($sql);

            foreach ($data as $key => &$value) { 
                if( $value && ( $key != 'filters_str' && $key != 'limit' ) ) $stmt->bindParam(":" . $key, $value);
            }

            $ok = $stmt->execute();
            if ($ok) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result["rows"][] = $row;
                }
            }
            $stmt = null;
            $cn = null;
        }catch( Exception $e ){
            $result["error"] = $e->getMessage();
        }
        
        return $result;
    }

    function getRow($sql){
        $result = ["rows" => [], "cant_rows" => 0,"row" => null, "error" => null];
        try{
            $cn = $this->getConexion();
            $stmt = $cn->prepare($sql);

            foreach ($data as $key => &$value) { 
                if( $value && ( $key != 'filters_str' && $key != 'limit' ) ) $stmt->bindParam(":" . $key, $value);
            }

            $ok = $stmt->execute();
            if ($ok) {
                if($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result["row"] = $row;
                }else{
                    $result["Error"] = "No se encontraron datos";
                }
            }
            $stmt = null;
            $cn = null;
        }catch( Exception $e ){
            $result["error"] = $e->getMessage();
        }
        
        return $result;
    }

}

//$db = new Conexion();

/*
    $cn = $bd->getConexion();
    $sql = "select * from tbl_usuario";
    $stmt = $cn->prepare($sql);
    $ok = $stmt->execute();
    if ($ok) {
        if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $result["rows"][] = $row;
        }
    }
*/

//$result = $db->getAllRows("select * from tbl_usuario where id = :id" , [ "id" => 2,"usuario" => "jvicente" ] );
//echo json_encode( $result["rows"] );


