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

}
