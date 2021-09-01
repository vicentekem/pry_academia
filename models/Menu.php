<?php

require_once __DIR__ . "/../config/Conexion.php";

class Menu
{
    private $conexion;

    public function __construct()
    {
        $this->conexion = new Conexion();
    }

    public function getMenusForUser($idusuario)
    {
        return $this->conexion->getAllRows(
            "SELECT distinct u.id,m.id as id_menu,m.name_menu,m.class_icon from tbl_usuario u
            INNER JOIN tbl_accesos_usuario au ON u.id=au.id_usuario
            INNER JOIN tbl_submenu sm on au.id_submenu =sm.id
            INNER JOIN tbl_menu m on sm.id_menu=m.id
            WHERE u.id = :id
            ORDER BY m.orden",
        ["id" => $idusuario]);
    
    }

    public function getSubMenusForMenuAndUser($idusuario,$idmenu)
    {
        return $this->conexion->getAllRows(
            "SELECT u.id,sm.id_menu,sm.alias,sm.file_view,sm.name_menu
            from tbl_usuario u
            INNER JOIN tbl_accesos_usuario au ON u.id=au.id_usuario
            inner JOIN tbl_submenu sm on au.id_submenu =sm.id
            INNER JOIN tbl_menu m on sm.id_menu=m.id
            WHERE m.id=:id_menu and u.id = :id_usuario"
        ,["id_usuario" => $idusuario , "id_menu"=> $idmenu]);
    }

    public function getSubMenusForUser($idusuario)
    {
        return $this->conexion->getAllRows(
            "SELECT u.id,sm.id_menu,sm.alias,sm.file_view,sm.name_menu
            from tbl_usuario u
            INNER JOIN tbl_accesos_usuario au ON u.id=au.id_usuario
            inner JOIN tbl_submenu sm on au.id_submenu =sm.id
            INNER JOIN tbl_menu m on sm.id_menu=m.id
            WHERE u.id = :id_usuario"
        ,["id_usuario" => $idusuario]
        );

    }

}



