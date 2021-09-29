<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Ubigeo.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class UbigeoValidator
{

    private $model;

    public function __construct()
    {
        $this->model = new Ubigeo();
    }

    public function cbxUbigeo()
    {        
        $data["q"] = Utilitario::getParam("q");
        $result = $this->model->cbxUbigeo($data);
        return $result;
    }

    public function cbxDepartamentos()
    {   
        $result = $this->model->cbxDepartamentos();
        return $result;
    }

    public function cbxProvincias()
    {
        $data["id_departamento"] = Utilitario::getParam("id_departamento");     
        $result = $this->model->cbxProvincias($data);
        return $result;
    }

    public function cbxDistritos()
    {   
        $data["id_provincia"] = Utilitario::getParam("id_provincia");
        $result = $this->model->cbxDistritos($data);
        return $result;
    }

}



