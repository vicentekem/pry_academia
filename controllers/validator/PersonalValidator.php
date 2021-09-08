<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Personal.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class PersonalValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new Personal();
    }
    
    public function qryPersonal()
    {
        $result = [ "error" => "" ];
        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        $data["search"] = Utilitario::getParam("search");

        if ($result["error"] === "") $result = $this->model->qryPersonal($data);        

        return $result;
    }

    public function getPersonal()
    {
        $result = [ "error" => "" ];
        
        $data["id int"] = Utilitario::getIntParam("id");
        
        if ($result["error"] === "") $result = $this->model->getPersonal($data);        

        return $result;
    }


    public function savePersonal($action){

        $result = [ "error" => "" ];

        $data["id int"] = Utilitario::getIntParam("id");
        $data["id_persona int"] = Utilitario::getIntParam("id_persona");
        $data["dni"] = Utilitario::getParam("dni");
        $data["nombre"] = Utilitario::getParam("nombre");
        $data["ape_pat"] = Utilitario::getParam("ape_pat");
        $data["ape_mat"] = Utilitario::getParam("ape_mat");
        $data["id_distrito"] = Utilitario::getParam("id_distrito");
        $data["id_cargo int"] = Utilitario::getIntParam("id_cargo");
        $data["id_sexo int"] = Utilitario::getIntParam("id_sexo");
        $data["correo"] = Utilitario::getParam("correo");
        $data["celular"] = Utilitario::getParam("celular");
        $data["telefono"] = Utilitario::getParam("telefono");

        $data["id_usuario"] = $_SESSION["usuario_academia"]["id"];
        //exit( json_encode($data) );
        if ($result["error"] === "") $result = $this->model->savePersonal($action,$data);

        return $result;

    }


}


















