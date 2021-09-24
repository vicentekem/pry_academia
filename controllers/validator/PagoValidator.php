<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Pago.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class PagoValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new Pago();
    }
    
    public function qryPago()
    {
        $result = [ "error" => "" ];

        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        $data["search"] =     Utilitario::getParam("search");
        
        $id_rol = $_SESSION["usuario_academia"]["id_rol"];
        if( $id_rol != 1 && $id_rol != 2 ){
            $data["id_persona int"] = $_SESSION["usuario_academia"]["id_persona"];
        }
        
        if ($result["error"] === "") $result = $this->model->qryPago($data);        

        return $result;
    }

    public function cbxPago()
    {
        $result = [ "error" => "" ];        
        if ($result["error"] === "") $result = $this->model->cbxPago();
        return $result;
    }

    public function getPago()
    {
        $result = [ "error" => "" ];        
        $data["id int"] = Utilitario::getParam("id");                
        if ($result["error"] === "") $result = $this->model->getPago($data);        

        return $result;
    }

    public function savePago($action){

        $result = [ "error" => "" ];

        $data["id int"] = Utilitario::getIntParam("id");
        $data["descripcion"] = Utilitario::getParam("descripcion");
        $data["resumen"] = Utilitario::getParam("resumen",false);
        $data["caracteristicas"] = Utilitario::getParam("caracteristicas",false);
        $data["beneficios"] = Utilitario::getParam("beneficios",false);
        
        if ($result["error"] === "") $result = $this->model->savePago($action,$data);

        return $result;

    }


}












