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

    function bindFilters( &$stmt,$data ){

        foreach ($data as $key => &$value) {
            $pos =  strpos($key, ' ');
            $type = $pos ? substr($key,$pos + 1) : "";
            $key =  substr($key,0 , $pos ? $pos : strlen( $key ) );
            $pdo_param = null;
            if( $value === null ) $pdo_param = PDO::PARAM_NULL;
            switch($type){
                case 'int' : $pdo_param = PDO::PARAM_INT;break;
                case 'bool' : $pdo_param = PDO::PARAM_BOOL;break;
                case 'null' : $pdo_param = PDO::PARAM_NULL; $value = null; break;
                default : $pdo_param = PDO::PARAM_STR;
            }
            if( ($value || $value === 0) && ($key != 'filters_str' && $key != 'limit')){
                $stmt->bindParam(":" . $key, $value,$pdo_param);
            }
        }

        if($data && isset( $data["start int"]) && isset($data["length int"]) ){
            $stmt->bindParam(":start",  $data["start int"],PDO::PARAM_INT );
            $stmt->bindParam(":length", $data["length int"],PDO::PARAM_INT);
        }
    }

    function bindProcedure( &$stmt,$data ){

        foreach ($data as $key => &$value) {
            $pos =  strpos($key, ' ');
            $type = $pos ? substr($key,$pos + 1) : "";
            $key =  substr($key,0 , $pos ? $pos : strlen( $key ) );
            $pdo_param = null;
            if( $value === null ) $pdo_param = PDO::PARAM_NULL;
            switch($type){
                case 'int' : $pdo_param = PDO::PARAM_INT;break;
                case 'bool' : $pdo_param = PDO::PARAM_BOOL;break;
                case 'null' : $pdo_param = PDO::PARAM_NULL; $value = null; break;
                default : $pdo_param = PDO::PARAM_STR;
            }
            
            if( ($key != 'filters_str' && $key != 'limit')){
                $stmt->bindParam(":" . $key, $value,$pdo_param);
            }
        }
        if($data && isset( $data["start int"]) && isset($data["length int"]) ){                             
            $stmt->bindParam(":start",  $data["start int"],PDO::PARAM_INT );
            $stmt->bindParam(":length", $data["length int"],PDO::PARAM_INT);
        }
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


