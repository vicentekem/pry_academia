<?php

require_once __DIR__ . "/../models/ModeloBase.php";

class Menu
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function getMenusForUser($idusuario)
    {
        return $this->model->getAllRows(
            "SELECT distinct u.id,m.id as id_menu,m.name_menu,m.class_icon from tbl_usuario u
            INNER JOIN tbl_accesos_usuario au ON u.id=au.id_usuario
            INNER JOIN tbl_submenu sm on au.id_submenu =sm.id
            INNER JOIN tbl_menu m on sm.id_menu=m.id
            WHERE u.id = :id and sm.estado = 1
            ORDER BY m.orden",
        ["id" => $idusuario]);    
    }

    public function getSubMenusForMenuAndUser($idusuario,$idmenu)
    {
        return $this->model->getAllRows(
            "SELECT u.id,sm.id_menu,sm.alias,sm.file_view,sm.name_menu
            from tbl_usuario u
            INNER JOIN tbl_accesos_usuario au ON u.id=au.id_usuario
            inner JOIN tbl_submenu sm on au.id_submenu =sm.id
            INNER JOIN tbl_menu m on sm.id_menu=m.id
            WHERE m.id=:id_menu and u.id = :id_usuario and sm.estado = 1
            ORDER BY  sm.orden"
        ,["id_usuario" => $idusuario , "id_menu"=> $idmenu]);
    }

    public function getSubMenusForUser($idusuario)
    {
        return $this->model->getAllRows(
            "SELECT u.id,sm.id_menu,sm.alias,sm.file_view,sm.name_menu
            from tbl_usuario u
            INNER JOIN tbl_accesos_usuario au ON u.id=au.id_usuario
            inner JOIN tbl_submenu sm on au.id_submenu =sm.id
            INNER JOIN tbl_menu m on sm.id_menu=m.id
            WHERE u.id = :id_usuario and sm.estado = 1" 
        ,["id_usuario" => $idusuario]
        );
    }

    public function getPublicMenu()
    {
        return $this->model->getAllRows(
            "SELECT sm.id,sm.id_menu,sm.alias,sm.file_view,sm.name_menu
            FROM tbl_submenu sm WHERE sm.id_tipo_menu = 1 and sm.estado = 1 ORDER BY sm.orden"
        );
    }

}



