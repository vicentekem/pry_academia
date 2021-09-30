<?php

require_once __DIR__ . "/../models/ModeloBase.php";

class Usuario
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function qryUsuario($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "search" => "trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) like concat('%',:search,'%')"
        ]);
        
        return $this->model->getAllRows(
            "SELECT u.id,trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) nombre_completo,
                u.estado ,u.usuario,ur.id_rol,tr.description rol
            FROM tbl_usuario u
            INNER JOIN tbl_persona p on p.id = u.id_persona 
            INNER JOIN tbl_usuario_rol ur on ur.id_usuario = u.id
            INNER JOIN tbl_tablas tr on tr.id_registro = ur.id_rol and tr.id_tabla = 2
            $where ORDER BY u.id limit :start,:length ", $data,

            "SELECT count(u.id) AS cant_rows FROM tbl_usuario u
                INNER JOIN tbl_persona p on p.id = u.id_persona
                INNER JOIN tbl_usuario_rol ur on ur.id_usuario = u.id $where",["search" => $data["search"] ]

        );

    }

    public function cbxUsuario($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "q" => "TRIM(CONCAT(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) LIKE CONCAT('%',:q,'%')"
        ]);
        
        return $this->model->getAllRows(
            "SELECT u.id, TRIM(CONCAT(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) as text 
            FROM tbl_usuario u INNER JOIN tbl_persona p on p.id = u.id_persona $where", $data
        );
    }

    public function getUsuario($data)
    {

        $where = Utilitario::generarFiltros($data,[
            "id" => "u.id = :id"
        ]);

        $result = $this->model->getRow( 
            "SELECT u.id,u.usuario,ur.id_rol,u.id_persona
            FROM tbl_usuario u
            INNER JOIN tbl_persona p on p.id = u.id_persona 
            INNER JOIN tbl_usuario_rol ur on ur.id_usuario = u.id
            INNER JOIN tbl_tablas tr on tr.id_registro = ur.id_rol and tr.id_tabla = 2 $where", $data);
        
        return $result;
    }

    public function login($data)
    {
        return $this->model->getRow(
            "call sp_login(:usuario,:clave)",
            $data
        );
    }
   
    public function getUserByDNI($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "dni" => "p.dni = :dni"
        ]);
        
        return $this->model->getRow(
            "SELECT u.id,trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) nombre_completo
            FROM tbl_usuario u INNER JOIN tbl_persona p on p.id = u.id_persona $where",$data
        );

    }

    public function saveUsuario($action,$data){

        return $this->model->executeProcess(
            "call sp_usuario( '$action' ,:id,:id_persona,:usuario,:password,:old_password,:id_rol,:id_usuario) ", $data,
            "Datos guardados exitosamente"
        );

    }

}














