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

    private $repository;

    public function __construct()
    {
        $this->repository = new Ubigeo();
    }

    function cbxUbigeo()
    {        
        $data["q"] = Utilitario::getParam("q");
        $result = $this->repository->cbxUbigeo($data);
        return $result;
    }

    function cbxDepartamentos()
    {   
        $result = $this->repository->cbxDepartamentos();
        return $result;
    }

    function cbxProvincias()
    {
        $data["id_departamento"] = Utilitario::getParam("id_departamento");     
        $result = $this->repository->cbxProvincias($data);
        return $result;
    }

    function cbxDistritos()
    {   
        $data["id_provincia"] = Utilitario::getParam("id_provincia");
        $result = $this->repository->cbxDistritos($data);
        return $result;
    }

}



