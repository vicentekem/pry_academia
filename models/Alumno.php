<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class Alumno
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function qryAlumno($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "search" => "trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) like concat('%',:search,'%')"
        ]);

        $where_count = Utilitario::generarFiltros($data,[
            "search" => "trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) like concat('%',:search,'%')"
        ]);
        
        return $this->model->getAllRows(

            "SELECT 
                    a.id,a.id_persona,p.dni,p.correo,p.telefono,p.celular,p.estado,
                    trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) nombre_completo
            FROM tbl_alumno a
            INNER JOIN tbl_persona p on a.id_persona = p.id            
            $where limit :start,:length ",

            $data,
        
            "SELECT count(a.id) AS cant_rows FROM tbl_alumno a INNER JOIN tbl_persona p on a.id_persona = p.id $where_count",
            ["search" => $data["search"] ]
        );

    }

    public function getAlumno($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "id" => "a.id = :id"
        ]);
        
        return $this->model->getRow(
            "SELECT 
                    a.id,a.id_persona,p.dni,p.correo,p.telefono,p.celular,p.estado,
                    p.nombre,p.apellido_pat,p.apellido_mat,p.id_ubigeo,p.id_sexo,
                    CONCAT(u.departamento,' - ',u.provincia,' - ',u.distrito) ubigeo
            FROM tbl_alumno a
            INNER JOIN tbl_persona p on a.id_persona = p.id
            LEFT JOIN tbl_ubigeo u  on u.id_ubigeo = p.id_ubigeo
            $where",$data
        );

    }

    
    public function saveAlumno($action,$data){

        return $this->model->executeProcess(
            "call sp_alumno( '$action' ,:id,:id_persona,:dni,:nombre,:ape_pat,:ape_mat,:correo,
                :celular,:telefono,null,:id_distrito,:id_sexo,:id_usuario) ",
            $data,
            "Datos guardados exitosamente"
        );

    }

}
