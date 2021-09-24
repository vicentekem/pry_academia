<?php

require_once __DIR__ . "/../config/Conexion.php";

@session_start();

class ModeloBase
{
    private $conexion = null;
    private $debugger = true;

    public function __construct()
    {        
        $this->conexion = new Conexion();
    }

    public function getError($ex){
        $pos = strpos($ex->getMessage(), '1001');
        if($pos){
            $msg = substr( $ex->getMessage(),$pos + 5);     
        }else{ $msg = $ex->getMessage();}        
        return $msg;
    }

    function getAllRows($sql, $data = [],$sql_count = "",$data_count = []){

        $result = ["rows" => [], "cant_rows" => 0,"row" => null, "error" => ""];
        try{
            $cn = $this->conexion->getConexion();
            $stmt = $cn->prepare($sql);
            $this->conexion->bindFilters($stmt,$data);
            $ok = $stmt->execute();
            if ($ok) { while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) { $result["rows"][] = $row; } }
            if($sql_count){
                $stmt = $cn->prepare($sql_count);
                $this->conexion->bindFilters($stmt,$data_count);
                $ok = $stmt->execute();
                if ($ok) { if($row = $stmt->fetch(PDO::FETCH_ASSOC)) { $result["cant_rows"] = $row["cant_rows"]; }}
            }
            $stmt = null;
            $cn = null;
        }
        catch( Exception $ex ){ $result["error"] = $this->getError($ex);}
        return $result;
    }

    function getRow($sql, $data = []){
        $result = ["rows" => [], "cant_rows" => 0,"row" => null, "error" => ""];
        try{
            $cn = $this->conexion->getConexion();
            $stmt = $cn->prepare($sql);
            $this->conexion->bindFilters($stmt,$data);
            $ok = $stmt->execute();
            if ($ok) {
                if($row = $stmt->fetch(PDO::FETCH_ASSOC)) { $result["row"] = $row;}
                else{ $result["Error"] = "No se encontraron datos";}
            }
            $stmt = null;
            $cn = null;
        }
        catch( Exception $ex ){ $result["error"] = $this->getError($ex);}
        return $result;
    }

    function executeProcess($sql,$data = [],$success_msg = ""){

        $result = ["rows" => [], "cant_rows" => 0,"row" => null, "error" => ""];

        try{
            
            $cn = $this->conexion->getConexion();
            $stmt = $cn->prepare($sql);
            $this->conexion->bindProcedure($stmt,$data);            
            $ok = $stmt->execute();
            
            if ($ok) { $result["success"] = $success_msg; }
            else {
                $result["error"] = "ocurrio un error";
            }
            $stmt = null;
            $cn = null;
        }
        catch( Exception $ex ){
            //exit( $ex->getMessage() );
            $result["error"] = $this->getError($ex);
        }

        return $result;
    }

}