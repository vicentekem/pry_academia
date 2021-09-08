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

    function getUbigeoById()
    {
        $data["ubigeo_reniec"] = isset($_GET["ubigeo_reniec"]) ? $_GET["ubigeo_reniec"] : null;
        $data["ubigeo_inei"] = isset($_GET["ubigeo_inei"]) ? $_GET["ubigeo_inei"] : null;

        $filters = "";
        $limit = "";
        $start = isset($_GET["start"]) ? $_GET["start"] : null;
        $length = isset($_GET["length"]) ? $_GET["length"] : null;

        if($data["ubigeo_reniec"]) $filters .= " and id_ubigeo = :ubigeo_reniec ";
        if($data["ubigeo_inei"]) $filters .= " and id_inei = :ubigeo_inei ";
        if( trim(substr($filters,0,4)) == "and" ){ $filters = substr($filters,4);}
        if( strlen(trim($filters)) > 0 ){ $filters = "where " . $filters; }
        if( $start >= 0 && $length > 0 ) $limit .= " limit $length offset $start ";

        $data["filters_str"] = $filters;
        $data["limit"] = $limit;
        $result = $this->repository->getUbigeoById($data);

        return $result;
    }

    function getCbxPaises()
    {
        $data["filter_text"] = isset($_GET["filter_text"]) ? $_GET["filter_text"] : null;
        $filters = "";
        $limit = "";
        $start = isset($_GET["start"]) ? $_GET["start"] : null;
        $length = isset($_GET["length"]) ? $_GET["length"] : null;
        if($data["filter_text"]) $filters .= " and upper(distrito) like '%' || upper(:filter_text) || '%' ";
        if( trim(substr($filters,0,4)) == "and" ){ $filters = substr($filters,4);}
        if( strlen(trim($filters)) > 0 ){ $filters = "where " . $filters; }
        if( $start >= 0 && $length > 0 ) $limit .= " limit $length offset $start ";
        $data["filters_str"] = $filters;
        $data["limit"] = $limit;
        $result = $this->repository->getCbxPaises($data);
        return $result;
    }

}



