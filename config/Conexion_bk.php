<?php

class Conexion
{

    /*private $host = "localhost";
    private $user = "postgres";
    private $pass = "postgres123";
    private $bdname = "db_anemia";*/

    /*private $pass = "123456789";*/

    /*private $host = "ec2-174-129-226-232.compute-1.amazonaws.com";
    private $user = "efwtnwcttfyjtl";
    private $pass = "1c56c9f9e039d69818c42ede233c266833d0833af283fbc3864ccd303e2f662d";
    private $bdname = "d7r9843tq4q62s";*/
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

