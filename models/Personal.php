<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class Personal
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function qryPersonal($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "search" => "trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) like concat('%',:search,'%')"
        ]);

        $data_count = $data;
        unset( $data_count["start int"] );
        unset( $data_count["length int"] );
        
        return $this->model->getAllRows(

            "SELECT 
                pe.id,pe.id_persona,p.dni,p.correo,p.telefono,p.celular,p.estado,tc.description as cargo,
                trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) nombre_completo
            FROM tbl_personal pe
            INNER JOIN tbl_persona p on pe.id_persona = p.id
            INNER JOIN tbl_tablas tc on pe.id_cargo = tc.id_registro and tc.id_tabla = 5
            $where limit :start,:length ", $data,
        
            "SELECT count(pe.id) AS cant_rows FROM tbl_personal pe INNER JOIN tbl_persona p on pe.id_persona = p.id $where", $data_count
        );

    }

    public function cbxPersonal()
    {
        return $this->model->getAllRows(
            "SELECT 
                pe.id as id_personal,p.id,trim(concat(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) description
            FROM tbl_personal pe INNER JOIN tbl_persona p on pe.id_persona = p.id WHERE p.estado = 1"
        );
    }

    public function getPersonal($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "id" => "pe.id = :id"
        ]);
        
        return $this->model->getRow(
            "SELECT 
                    pe.id,pe.id_persona,p.dni,p.correo,p.telefono,p.celular,p.estado,tc.description as cargo,
                    p.nombre,p.apellido_pat,p.apellido_mat,p.id_ubigeo,pe.id_cargo,p.id_sexo,
                    CONCAT(u.departamento,' - ',u.provincia,' - ',u.distrito) ubigeo
            FROM tbl_personal pe
            INNER JOIN tbl_persona p on pe.id_persona = p.id
            INNER JOIN tbl_tablas tc on pe.id_cargo = tc.id_registro and tc.id_tabla = 5
            LEFT JOIN tbl_ubigeo u  on u.id_ubigeo = p.id_ubigeo
            $where",$data
        );

    }


    public function savePersonal($action,$data){

        return $this->model->executeProcess(
            "call sp_personal( '$action' ,:id,:id_persona,:dni,:nombre,:ape_pat,:ape_mat,:correo,
                :celular,:telefono,null,:id_distrito,:id_sexo,:id_cargo,:id_usuario) ",
            $data,
            "Datos guardados exitosamente"
        );

    }

}
