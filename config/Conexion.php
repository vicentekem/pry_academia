<?php

class Conexion
{

    private $host = "localhost";
    private $user = "root";
    private $pass = "secret";
    private $bdname = "db_pry_academia";

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

}

/*$result = ["rows" => []];
$bd = new Conexion();
$cn = $bd->getConexion();
$sql = "select * from tbl_usuario";
$stmt = $cn->prepare($sql);
$ok = $stmt->execute();
if ($ok) {
    if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $result["rows"][] = $row;
    }
}

echo json_encode( $result["rows"] );*/


