<?php

class Conexion
{

    private $host = "10.0.0.3";
    private $user = "postgres";
    private $pass = "Diris@123";
    private $bdname = "db_sgh_dev";

    function getConexion(){

        $conexion = null;

        try{

            $conexion = new PDO(
                "pgsql:host=" . $this->host . ";dbname=". $this->bdname,
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

