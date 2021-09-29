<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Pago.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class PagoValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new Pago();
    }
    
    public function qryPago()
    {
        $result = [ "error" => "" ];

        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        $data["search"] =     Utilitario::getParam("search");
        
        $id_rol = $_SESSION["usuario_academia"]["id_rol"];
        if( $id_rol != 1 && $id_rol != 2 ){
            $data["id_persona int"] = $_SESSION["usuario_academia"]["id_persona"];
        }
        
        if ($result["error"] === "") $result = $this->model->qryPago($data);        

        return $result;
    }

    public function cbxPago()
    {
        $result = [ "error" => "" ];        
        if ($result["error"] === "") $result = $this->model->cbxPago();
        return $result;
    }

    public function getPago()
    {
        $result = [ "error" => "" ];        
        $data["id int"] = Utilitario::getParam("id");                
        if ($result["error"] === "") $result = $this->model->getPago($data);        

        return $result;
    }

    public function savePago($action){

        $result = [ "error" => "" ];

        $data["id int"] = Utilitario::getIntParam("id");
        $data["opt int"] = Utilitario::getIntParam("opt");
        $data["observacion"] = Utilitario::getParam("observacion",false);

        $data["url_img"] = "public/img/default.png";
        $data["id_usuario"] = $_SESSION["usuario_academia"]["id"];
        
        $url_img = Utilitario::getParam("url_img",false);
        $fl_img_pago = isset($_FILES["fl_img_pago"]) ? $_FILES["fl_img_pago"] : null;

        $url_img_old = "";
        $file_tmp = "";
        $url_img_new = "";

        if($action === 'upd_bp' && $fl_img_pago){ 
            $url_img_old = $this->model->getUrlImgBaucherPago(["id int" => $data["id int"]])["row"]["url_img"];
        }

        if($fl_img_pago){
            $file_name = $_FILES['fl_img_pago']['name'];
            $file_tmp  = $_FILES['fl_img_pago']['tmp_name'];
            $explode = explode('.',$_FILES['fl_img_pago']['name']);
            $file_ext=strtolower(end($explode));
            $file_name_db = uniqid() . $data["id int"] . "." . $file_ext;
            $url_img_new = __DIR__ . "/../../public/img/bauchers/" . $file_name_db;
            $data["url_img"] = "public/img/bauchers/" . $file_name_db;            
        }else{
            $data["url_img"] = $url_img;
        }

        if ($result["error"] === ""){
            
            $result = $this->model->savePago($action,$data);

            if($url_img_old !== "public/img/default.png" && $url_img_old != "" && $url_img_old != null && file_exists($url_img_old)){
                $url_img_old = __DIR__ . "/../../" . $url_img_old;
                unlink( $url_img_old );
            }
            move_uploaded_file($file_tmp,$url_img_new);
        } 

        return $result;

    }


}












