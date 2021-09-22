<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class Matricula
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function saveMatricula($action,$data)
    {
        return $this->model->executeProcess(
            "call sp_matricula( '$action' ,:id,:id_alumno,:dni,:nombre,:ape_pat,:ape_mat,:correo,
                :celular,:id_distrito,:id_curso_programado,:id_turno) ",
            $data,
            "Datos guardados exitosamente"
        );
    }

}
