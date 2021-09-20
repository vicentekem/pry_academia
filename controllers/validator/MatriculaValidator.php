<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Matricula.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class MatriculaValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new Matricula();
    }
    
    public function qryMatricula()
    {
        $result = [ "error" => "" ];
        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        $data["search"] = Utilitario::getParam("search");

        if ($result["error"] === "") $result = $this->model->qryMatricula($data);        

        return $result;
    }

    public function getMatricula()
    {
        $result = [ "error" => "" ];
        
        $data["id int"] = Utilitario::getIntParam("id");
        
        if ($result["error"] === "") $result = $this->model->getMatricula($data);        

        return $result;
    }

    public function cbxMatricula()
    {
        $result = [ "error" => "" ];
        if ($result["error"] === "") $result = $this->model->cbxMatricula();        

        return $result;
    }

    public function saveMatricula($action){

        $result = [ "error" => "" ];


        $data["id int"] = Utilitario::getIntParam("id");
        $data["id_curso_programado int"] = Utilitario::getIntParam("id_curso_programado");
        $data["id_alumno int"] = Utilitario::getParam("id_alumno");
        $data["dni"] = Utilitario::getParam("dni");
        $data["nombre"] = Utilitario::getParam("nombre");
        $data["ape_pat"] = Utilitario::getParam("ape_pat");
        $data["ape_mat"] = Utilitario::getParam("ape_mat");
        $data["correo"] = Utilitario::getParam("correo");
        $data["celular"] = Utilitario::getParam("celular");
        $data["id_distrito"] = Utilitario::getParam("id_distrito");
        $data["id_turno int"] = Utilitario::getIntParam("id_turno");
        
        
        //$data["id_usuario"] = $_SESSION["usuario_academia"]["id"];
        //exit( json_encode($data) );
        if ($result["error"] === "") $result = $this->model->saveMatricula($action,$data);

        return $result;

    }


}


















