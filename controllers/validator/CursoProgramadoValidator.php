<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/CursoProgramado.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class CursoProgramadoValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new CursoProgramado();
    }
    
    public function qryCursoProgramado()
    {
        $result = [ "error" => "" ];
        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        $data["search"] = Utilitario::getParam("search");

        if ($result["error"] === "") $result = $this->model->qryCursoProgramado($data);        

        return $result;
    }

    public function selCursoProgramado()
    {
        $result = [ "error" => "" ];        

        $data["search"] = Utilitario::getParam("search");


        if ($result["error"] === "") $result = $this->model->selCursoProgramado($data);        

        return $result;
    }

    public function saveCursoProgramado($action){

        $result = [ "error" => "" ];

        $data["id int"] = Utilitario::getIntParam("id");
        $data["descripcion"] = Utilitario::getParam("descripcion");

        if ($result["error"] === "") $result = $this->model->saveCursoProgramado($action,$data);

        return $result;

    }


}


















