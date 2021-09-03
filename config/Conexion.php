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

            $conexion->exec("set names utf8");

            $conexion ->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION);

        }

        catch(PDOException $e){
            throw $e;
        }
        return $conexion;
    }

    private function bind( &$stmt,$data ){

        foreach ($data as $key => &$value) {
            $pos =  strpos($key, ' ');
            $type = substr($key,$pos + 1);
            $key =  substr($key,0 , $pos ? $pos : strlen( $key ) );
            $pdo_param = null;
            if( $value === null ) $pdo_param = PDO::PARAM_NULL;
            switch($type){
                case 'int' : $pdo_param = PDO::PARAM_INT;break;
                case 'bool' : $pdo_param = PDO::PARAM_BOOL;break;
                case 'null' : $pdo_param = PDO::PARAM_NULL;break;
                default : $pdo_param = PDO::PARAM_STR;
            }
            
            if( $value && ( $key != 'filters_str' && $key != 'limit' ) ){
                $stmt->bindParam(":" . $key, $value,$pdo_param);
            }
        }
        if($data && isset( $data["start int"]) && isset($data["length int"]) ){                             
            $stmt->bindParam(":start",  $data["start int"],PDO::PARAM_INT );
            $stmt->bindParam(":length", $data["length int"],PDO::PARAM_INT);
        }
    }

    function getAllRows($sql, $data = [],$sql_count = ""){

        $result = ["rows" => [], "cant_rows" => 0,"row" => null, "error" => ""];
        try{
            $cn = $this->getConexion();
            $stmt = $cn->prepare($sql);
            $this->bind($stmt,$data);
            $ok = $stmt->execute();
            if ($ok) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result["rows"][] = $row;
                }
            }

            if($sql_count){
                $stmt = $cn->prepare($sql_count);                
                $ok = $stmt->execute();
                if ($ok) {
                    if($row = $stmt->fetch(PDO::FETCH_ASSOC)) { $result["cant_rows"] = $row["cant_rows"];
                    }
                }
            }
            
            $stmt = null;
            $cn = null;
        }catch( Exception $e ){
            $pos = strpos($e->getMessage(), '1001');
            $msg = substr( $e->getMessage(),$pos + 5);
            $result["error"] = $msg;
        }
        
        return $result;
    }

    function getRow($sql, $data = []){
        $result = ["rows" => [], "cant_rows" => 0,"row" => null, "error" => ""];
        try{
            $cn = $this->getConexion();
            $stmt = $cn->prepare($sql);
            $this->bind($stmt,$data);
            
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
            $pos = strpos($e->getMessage(), '1001');
            $msg = substr( $e->getMessage(),$pos + 5);
            $result["error"] = $msg;
        }
        
        return $result;
    }

    function executeProcedure($sql,$data = []){
        $result = ["rows" => [], "cant_rows" => 0,"row" => null, "error" => ""];
        try{
            $cn = $this->getConexion();
            $stmt = $cn->prepare($sql);
           
            foreach ($data as $key => &$value) { 
                if( /*$value &&*/ ( $key != 'filters_str' && $key != 'limit' ) ) $stmt->bindParam(":" . $key, $value);
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

            $pos = strpos($e->getMessage(), '1001');
            $msg = substr( $e->getMessage(),$pos + 5);
            $result["error"] = $msg;
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


