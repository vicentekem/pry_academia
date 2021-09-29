<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Persona.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class PersonaValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new Persona();
    }
    
    public function cbxPersona()
    {
        $result = [ "error" => "" ];
        $data["q"] = Utilitario::getParam("q");
        $result = $result["error"] === "" ? $this->model->cbxPersona($data) : $result;

        return $result;
    }

}








