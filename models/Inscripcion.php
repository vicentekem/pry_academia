<?php

require_once __DIR__ . "/../models/ModeloBase.php";


class Inscripcion
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function saveInscripcion($action,$data)
    {
        return $this->model->executeProcess(
            "call sp_inscripcion( '$action' ,:id,:dni,:nombre,:ape_pat,:ape_mat,:correo,:celular,:id_distrito,:id_concurso) ",
            $data,
            "Datos guardados exitosamente"
        );
    }

}
