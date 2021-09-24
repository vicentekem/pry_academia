<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Rol.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class RolValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new Rol();
    }
    
    public function qryRol()
    {
        $result = [ "error" => "" ];
        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        $data["search"] =       Utilitario::getParam("search");
                
        if ($result["error"] === "") $result = $this->model->qryRol($data);        

        return $result;
    }

    public function cbxRol()
    {
        $result = [ "error" => "" ];        
        if ($result["error"] === "") $result = $this->model->cbxRol();
        return $result;
    }

    public function saveRol($action){

        $result = [ "error" => "" ];

        $data["id int"] = Utilitario::getIntParam("id");
        $data["descripcion"] = Utilitario::getParam("descripcion");
        
        if ($result["error"] === "") $result = $this->model->saveRol($action,$data);
        return $result;
    }


}












