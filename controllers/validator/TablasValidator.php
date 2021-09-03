<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../config/Conexion.php";
require_once __DIR__ . "/../../models/Tablas.php";

class TablasValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new Tablas();
    }
    
    public function qryTablas()
    {
        $result = ["error" => ""];

        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        //$data["id_tabla"] = isset($_GET["length"]) ? $_GET["length"] : null;
        //$data["search"] = isset($_GET["length"]) ? $_GET["length"] : null;

        //if (!$data["usuario"]) { $result["error"] = "Ingrese usuario"; }
        //if (!$data["clave"]) { $result["error"] = "Ingrese contraseña"; }

        if ($result["error"] === "") $result = $this->model->qryTablas($data);        

        return $result;
    }

}


















