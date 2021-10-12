<?php

require_once __DIR__ . "/../../models/Menu.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class MenuValidator
{

    private $model;

    public function __construct()
    {
        $this->model = new Menu();
    }

    public function cbxMenu(){
        $result = [ "error" => "" ];
        $result = $result["error"] === "" ? $this->model->cbxMenu() : $result;
        return $result;
    }

    public function cbxSubMenu(){
        $result = [ "error" => "" ];
        $data["id_menu int"] = Utilitario::getIntParam("id_menu");        
        $result = $result["error"] === "" ? $this->model->cbxSubMenu($data) : $result;
        return $result;
    }

    public function cbxSubMenuXUsuario(){
        $result = [ "error" => "" ];
        $data["id_usuario int"] = Utilitario::getIntParam("id_usuario");        
        $result = $result["error"] === "" ? $this->model->cbxSubMenuXUsuario($data) : $result;
        return $result;
    }

    public function cbxSubMenuXRol(){
        $result = [ "error" => "" ];
        $data["id_rol int"] = Utilitario::getIntParam("id_rol");
        $result = $result["error"] === "" ? $this->model->cbxSubMenuXRol($data) : $result;
        return $result;
    }

}
