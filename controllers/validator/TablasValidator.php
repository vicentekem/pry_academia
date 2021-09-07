<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Tablas.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class TablasValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new Tablas();
    }
    
    public function qryTablas()
    {
        $result = [ "error" => "" ];
        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        $data["search"] =       Utilitario::getParam("search");
        $data["id_tabla int"] = Utilitario::getIntParam("id_tabla");
        
        if ($result["error"] === "") $result = $this->model->qryTablas($data);        

        return $result;
    }

    public function cbxTablas()
    {        
        $result = [ "error" => "" ];
        $data["id_tabla int"] = Utilitario::getIntParam("id_tabla");
        if ($result["error"] === "") $result = $this->model->cbxTablas($data);
        return $result;
    }

    public function saveTabla($action){

        $result = [ "error" => "" ];

        $data["id_registro int"] = Utilitario::getIntParam("id_registro");
        $data["id_tabla int"] = Utilitario::getIntParam("id_tabla");
        $data["cod_ref"] = Utilitario::getParam("cod_ref");
        $data["descripcion"] = Utilitario::getParam("descripcion");

        //exit( json_encode( $data ) );
        if ($result["error"] === "") $result = $this->model->saveTabla($action,$data);

        return $result;

    }


}


















