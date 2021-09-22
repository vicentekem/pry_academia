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


















