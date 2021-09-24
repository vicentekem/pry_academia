<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Usuario.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class UsuarioValidator
{

    private $model;

    public function __construct()
    {
        $this->model = new Usuario();
    }

    public function qryUsuario()
    {
        $result = [ "error" => "" ];
        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        $data["search"] =       Utilitario::getParam("search");
                
        if ($result["error"] === "") $result = $this->model->qryUsuario($data);        

        return $result;
    }

    public function getUsuario()
    {
        $result = [ "error" => "" ];
        $data["id int"] = Utilitario::getIntParam("id");
        if ($result["error"] === "") $result = $this->model->getUsuario($data);        

        return $result;
    }

    public function login()
    {
        $result = ["error" => ""];
        $data["usuario"] = isset($_POST["usuario"]) ? $_POST["usuario"] : null;
        $data["clave"] = isset($_POST["clave"]) ? $_POST["clave"] : null;
        
        if (!$data["usuario"]) { $result["error"] = "Ingrese usuario"; }        
        if (!$data["clave"]) { $result["error"] = "Ingrese contraseña"; }

        if ($result["error"] === "") {
            $result = $this->model->login($data);
        }

        return $result;

    }
    

}


















