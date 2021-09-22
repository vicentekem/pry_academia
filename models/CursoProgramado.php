<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class CursoProgramado
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function qryCursoProgramado($data)
    {
        $where = Utilitario::generarFiltros($data,
        [ 
            "search" => "c.description like concat('%',:search,'%')"            
        ]);

        $data_count = [
            "search" => $data["search"]
        ];

        return $this->model->getAllRows(
            "SELECT 
                cp.id,cp.id_curso,cp.url_img,c.description,cp.estado,cp.link_clase,
                DATE_FORMAT(cp.fecha_inicio,'%d/%m/%Y') as fecha_inicio,DATE_FORMAT(cp.fecha_fin,'%d/%m/%Y') as fecha_fin,                
                TRIM(CONCAT(p.nombre,' ',IFNULL(p.apellido_pat,''),' ',IFNULL(p.apellido_mat,''))) profesor
            FROM tbl_curso_programado cp
            INNER JOIN tbl_curso c on c.id = cp.id_curso
            INNER JOIN tbl_persona p on p.id = cp.id_persona $where limit :start,:length", $data,

            "SELECT  count(cp.id) as cant_rows FROM tbl_curso_programado cp 
            INNER JOIN tbl_curso c on c.id = cp.id_curso
            INNER JOIN tbl_persona p on p.id = cp.id_persona $where",$data_count
        );

    }

    public function pwCursoProgramado($data)
    {
        $where = Utilitario::generarFiltros($data,[ "search" => "c.description like concat('%',:search,'%')" ]);
                
        return $this->model->getAllRows(
            "SELECT cp.id,cp.id_curso,c.description,c.resumen,cp.url_img AS url_img_curso,
                cp.id_persona,ctp.monto AS monto_matricula,p.url_img AS url_img_profesor,
                trim(CONCAT(p.nombre,' ',ifnull(p.apellido_pat,''),' ',ifnull(p.apellido_mat,''))) nombre_profesor
            FROM tbl_curso c
            INNER JOIN tbl_curso_programado cp on c.id = cp.id_curso
            INNER JOIN tbl_persona p on cp.id_persona = p.id
            INNER JOIN tbl_curso_programado_tipo_pago ctp on cp.id = ctp.id_curso_programado and ctp.id_tipo_pago = 1
            $where ORDER by c.description", $data
        );
    }

    public function getCursoProgramado($data)
    {
        $where = Utilitario::generarFiltros($data,["id" => "cp.id = :id"]);
                
        $result = $this->model->getRow(
            "SELECT cp.id,cp.id_curso,p.id as id_profesor,DATE_FORMAT(cp.fecha_inicio,'%d/%m/%Y') fecha_inicio,
                DATE_FORMAT(cp.fecha_fin,'%d/%m/%Y') fecha_fin,cp.link_clase,cp.url_img url_img_curso
            FROM tbl_curso c
            INNER JOIN tbl_curso_programado cp on c.id = cp.id_curso
            INNER JOIN tbl_persona p on cp.id_persona = p.id $where", $data
        );

        $result["montos"] = $this->model->getAllRows(
            "SELECT concat(cp.id,ctp.id_tipo_pago) id,ctp.id_tipo_pago,ttp.description as tipo_pago,ctp.monto
            FROM tbl_curso_programado cp
            INNER JOIN tbl_curso_programado_tipo_pago ctp on ctp.id_curso_programado = cp.id
            INNER JOIN tbl_tablas ttp on ctp.id_tipo_pago = ttp.id_registro and ttp.id_tabla = 3 $where", $data
        )["rows"];

        $result["horarios"] = $this->model->getAllRows(
            "SELECT concat(cp.id,ct.id_turno) id,ct.id_turno,tt.description as turno,
                DATE_FORMAT(ct.hora_inicio,'%h:%i %p') hora_inicio,DATE_FORMAT(ct.hora_fin,'%h:%i %p') hora_fin
            FROM tbl_curso_programado cp
            INNER JOIN tbl_curso_programado_turno ct on ct.id_curso_programado = cp.id
            INNER JOIN tbl_tablas tt on ct.id_turno = tt.id_registro and tt.id_tabla = 4 $where", $data
        )["rows"];

        return $result;
    }

    public function getDataCursoProgramado($data)
    {
        $where = Utilitario::generarFiltros($data,["id" => "cp.id = :id"]);

        $result = $this->model->getRow(
            "SELECT cp.id,cp.id_curso,p.id as id_profesor,DATE_FORMAT(cp.fecha_inicio,'%d/%m/%Y') fecha_inicio,
                DATE_FORMAT(cp.fecha_fin,'%d/%m/%Y') fecha_fin,cp.link_clase,cp.url_img url_img_curso,c.resumen,
                c.description
            FROM tbl_curso c
            INNER JOIN tbl_curso_programado cp on c.id = cp.id_curso
            INNER JOIN tbl_persona p on cp.id_persona = p.id $where", $data
        );

        $result["montos"] = $this->model->getAllRows(
            "SELECT concat(cp.id,ctp.id_tipo_pago) id,ctp.id_tipo_pago,ttp.description as tipo_pago,ctp.monto
            FROM tbl_curso_programado cp
            INNER JOIN tbl_curso_programado_tipo_pago ctp on ctp.id_curso_programado = cp.id
            INNER JOIN tbl_tablas ttp on ctp.id_tipo_pago = ttp.id_registro and ttp.id_tabla = 3 $where", $data
        )["rows"];

        $result["horarios"] = $this->model->getAllRows(
            "SELECT concat(cp.id,ct.id_turno) id,ct.id_turno,tt.description as turno,
                DATE_FORMAT(ct.hora_inicio,'%h:%i %p') hora_inicio,DATE_FORMAT(ct.hora_fin,'%h:%i %p') hora_fin
            FROM tbl_curso_programado cp
            INNER JOIN tbl_curso_programado_turno ct on ct.id_curso_programado = cp.id
            INNER JOIN tbl_tablas tt on ct.id_turno = tt.id_registro and tt.id_tabla = 4 $where", $data
        )["rows"];

        $result["caracteristicas"] = $this->model->getAllRows( 
            "SELECT cc.id,cc.description FROM tbl_curso c inner join  tbl_curso_programado cp on cp.id_curso = c.id
            inner join tbl_curso_caracteristicas cc on c.id = cc.id_curso $where", $data
        )["rows"];

        $result["beneficios"] = $this->model->getAllRows( 
            "SELECT cb.id,cb.description FROM tbl_curso c inner join  tbl_curso_programado cp on cp.id_curso = c.id
            inner join tbl_curso_beneficios cb on c.id = cb.id_curso $where", $data
        )["rows"];

        return $result;
    }

    public function cbxCursoProgramado($data = [])
    {
        return $this->model->getAllRows(
            "SELECT cp.id,c.description,ctp.monto as monto_matricula
            FROM tbl_curso c
            INNER JOIN tbl_curso_programado cp on c.id = cp.id_curso
            INNER JOIN tbl_curso_programado_tipo_pago ctp on cp.id = ctp.id_curso_programado and ctp.id_tipo_pago = 1           
            ORDER by c.description", $data
        );
    }

    public function cbxTurnosForCurso($data = [])
    {
        $where = Utilitario::generarFiltros($data,[ "id_curso_programado" => "ct.id_curso_programado = :id_curso_programado" ]);
        return $this->model->getAllRows(
            "SELECT ct.id_turno as id,ct.hora_inicio,ct.hora_fin,t.description
            FROM tbl_curso_programado cp
            INNER JOIN tbl_curso_programado_turno ct on cp.id = ct.id_curso_programado
            INNER JOIN tbl_tablas t on ct.id_turno = t.id_registro and t.id_tabla = 4
            $where", $data
        );
    }

    public function getUrlCursoProgramado($data)
    {   
        return $this->model->getRow(
            "SELECT cp.url_img FROM tbl_curso_programado cp where cp.id = :id", $data
        );
    }

    public function saveCursoProgramado($action,$data){
        
        return $this->model->executeProcess(
            "call sp_curso_programado( '$action' ,:id,:id_curso,:fecha_inicio,
                :fecha_fin,:url_img,:link_clase,:tipos_pago,:turnos,:id_usuario,:id_persona) ", $data,
            "Datos guardados exitosamente"
        );

    }

}
