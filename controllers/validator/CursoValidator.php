<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Curso.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class CursoValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new Curso();
    }
    
    public function qryCurso()
    {
        $result = [ "error" => "" ];
        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        $data["search"] =       Utilitario::getParam("search");
                
        if ($result["error"] === "") $result = $this->model->qryCurso($data);        

        return $result;
    }

    public function cbxCurso()
    {
        $result = [ "error" => "" ];        
        if ($result["error"] === "") $result = $this->model->cbxCurso($data);
        return $result;
    }

    public function getCurso()
    {
        $result = [ "error" => "" ];        
        $data["id int"] = Utilitario::getParam("id");                
        if ($result["error"] === "") $result = $this->model->getCurso($data);        

        return $result;
    }

    public function saveCurso($action){

        $result = [ "error" => "" ];

        $data["id int"] = Utilitario::getIntParam("id");
        $data["descripcion"] = Utilitario::getParam("descripcion");
        $data["resumen"] = Utilitario::getParam("resumen",false);
        $data["caracteristicas"] = Utilitario::getParam("caracteristicas",false);
        $data["beneficios"] = Utilitario::getParam("beneficios",false);
        
        if ($result["error"] === "") $result = $this->model->saveCurso($action,$data);

        return $result;

    }


}












