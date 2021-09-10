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
        $where = Utilitario::generarFiltros($data,[ "search" => "description like concat('%',:search,'%')" ]);
        $where_count = Utilitario::generarFiltros($data,[ "search" => "description like concat('%',:search,'%')" ]);
        
        return $this->model->getAllRows(
            "SELECT id,description,estado FROM tbl_curso_programado $where limit :start,:length ", $data,
            "SELECT count(id) AS cant_rows FROM tbl_curso_programado $where_count",["search" => $data["search"] ]
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

    public function saveCursoProgramado($action,$data){
        
        return $this->model->executeProcess(
            "call sp_curso_programado( '$action' ,:id,:descripcion) ", $data,
            "Datos guardados exitosamente"
        );

    }

}
