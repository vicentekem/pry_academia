<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class Pago
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function qryPago($data)
    {
        $where = Utilitario::generarFiltros($data,[
            "search" => "c.description like concat('%',:search,'%')",
            "id_persona" => "pe.id = :id_persona"
        ],["p.estado_pago in(2,3,4)"]);

        $data_count = $data;
        unset( $data_count["start int"] );
        unset( $data_count["length int"] );
        
        return $this->model->getAllRows(
            "SELECT p.id,TRIM(CONCAT(pe.nombre,' ',pe.apellido_pat,' ',ifnull(pe.apellido_mat,''))) estudiante,
                c.description as curso, tp.description as tipo_pago,concat('S/',format(p.monto,2)) monto,te.description as estado_pago,
                DATE_FORMAT(p.fecha_plazo,'%d/%m/%Y') fecha_plazo,em.description as estado_matricula,p.url_img,
                concat(DATE_FORMAT(cp.fecha_inicio,'%d/%m/%Y'),' - ',DATE_FORMAT(cp.fecha_fin,'%d/%m/%Y')) ciclo
            FROM tbl_pago p
            INNER JOIN tbl_matricula m ON m.id = p.id_matricula
            INNER JOIN tbl_alumno a ON a.id = m.id_alumno
            INNER JOIN tbl_curso_programado cp ON cp.id = m.id_curso_programado
            INNER JOIN tbl_persona pe on pe.id = a.id_persona
            INNER JOIN tbl_curso c on c.id = cp.id_curso
            INNER JOIN tbl_tablas tp ON tp.id_registro = p.id_tipo_pago and tp.id_tabla = 3
            INNER JOIN tbl_tablas tt ON tt.id_registro = m.id_turno and tt.id_tabla = 4
            INNER JOIN tbl_tablas te ON te.id_registro = p.estado_pago and te.id_tabla = 8
            INNER JOIN tbl_tablas em ON em.id_registro = m.estado_matricula and em.id_tabla = 7 $where
            ORDER BY pe.id,p.fecha_plazo  limit :start,:length ", $data,

            "SELECT count(p.id) as cant_rows
            FROM tbl_pago p
            INNER JOIN tbl_matricula m ON m.id = p.id_matricula
            INNER JOIN tbl_alumno a ON a.id = m.id_alumno
            INNER JOIN tbl_curso_programado cp ON cp.id = m.id_curso_programado
            INNER JOIN tbl_persona pe on pe.id = a.id_persona
            INNER JOIN tbl_curso c on c.id = cp.id_curso
            INNER JOIN tbl_tablas tp ON tp.id_registro = p.id_tipo_pago and tp.id_tabla = 3
            INNER JOIN tbl_tablas te ON te.id_registro = p.estado_pago and te.id_tabla = 8 $where",
            $data_count
        );

    }

    public function getPago($data)
    {

        $where = Utilitario::generarFiltros($data,[
            "id" => "c.id = :id"
        ]);

        $result = $this->model->getRow( "SELECT c.id,c.description,c.resumen,c.estado FROM tbl_pago c $where", $data);
        $result["rows_caracteristicas"] = $this->model->getAllRows( 
            "SELECT c.id,cc.description FROM tbl_pago c inner join tbl_pago_caracteristicas cc on c.id = cc.id_pago $where", $data
        )["rows"];
        $result["rows_beneficios"] = $this->model->getAllRows( 
            "SELECT c.id,cb.description FROM tbl_pago c inner join tbl_pago_beneficios cb on c.id = cb.id_pago $where", $data
        )["rows"];

        return $result;
    }

    public function cbxPago()
    {
        return $this->model->getAllRows("SELECT id,description FROM tbl_pago WHERE estado = 1");
    }

    public function getUrlImgBaucherPago($data)
    {
        return $this->model->getRow(
            "SELECT url_img FROM tbl_pago p where p.id = :id", $data
        );
    }

    public function savePago($action,$data){
        return $this->model->executeProcess(
            "call sp_pago( '$action' ,:id,:url_img,:opt,:observacion,:id_usuario) ", $data,
            "Datos guardados exitosamente"
        );
    }

}
