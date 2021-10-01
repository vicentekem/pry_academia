<?php

require_once __DIR__ . "/../models/ModeloBase.php";

class Acceso
{
    private $model;

    public function __construct()
    {
        $this->model = new ModeloBase();
    }

    public function saveAcceso($action,$data){

        return $this->model->executeProcess(
            "call sp_alumno( '$action' ,:id,:id_persona,:dni,:nombre,:ape_pat,:ape_mat,:correo,
                :celular,:telefono,null,:id_distrito,:id_sexo,:id_usuario) ",
            $data,
            "Datos guardados exitosamente"
        );

    }

}



