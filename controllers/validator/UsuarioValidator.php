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

        $data["search"] = Utilitario::getParam("search");                
        
        $result = $result["error"] === "" ? $this->model->qryUsuario($data) : $result;

        return $result;
    }

    public function getUsuario()
    {
        $result = [ "error" => "" ];
        $data["id int"] = Utilitario::getIntParam("id");
        $result = $result["error"] === "" ? $this->model->getUsuario($data) : $result;
        return $result;
    }

    public function cbxUsuario()
    {        
        $result = [ "error" => "" ];
        $data["q"] = Utilitario::getParam("q");
        $result = $result["error"] === "" ? $this->model->cbxUsuario($data) : $result;
        return $result;
    }

    public function login()
    {
        $result = ["error" => ""];
        $data["usuario"] = isset($_POST["usuario"]) ? $_POST["usuario"] : null;
        $data["clave"] = isset($_POST["clave"]) ? $_POST["clave"] : null;
        
        if (!$data["usuario"]) { $result["error"] = "Ingrese usuario"; }        
        if (!$data["clave"]) { $result["error"] = "Ingrese contraseña"; }
        
        $result = $result["error"] === "" ? $this->model->login($data) : $result;
        
        return $result;
    }

    public function getUserByDNI(){
        $result = [ "error" => "" ];        
        $data["dni"] = Utilitario::getParam("dni");        
        $result = $result["error"] === "" ? $this->model->getUserByDNI($data) : $result;

        return $result;
    }

    public function saveUsuario($action){

        $result = [ "error" => "" ];

        $data["id int"] = Utilitario::getIntParam("id");
        $data["id_persona int"] = Utilitario::getIntParam("id_persona");        
        $data["usuario"] = Utilitario::getParam("usuario");
        $data["password"] = Utilitario::getParam("usuario");
        $data["id_rol"] = Utilitario::getIntParam("id_rol");
        $data["id_usuario"] = $_SESSION["usuario_academia"]["id"];
        
        $result = $result["error"] === "" ? $this->model->saveUsuario($action,$data) : $result;
        return $result;
    }

}


















