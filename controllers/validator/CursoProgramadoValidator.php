<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/CursoProgramado.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class CursoProgramadoValidator
{
    private $model;
    public function __construct()
    {
        $this->model = new CursoProgramado();
    }
    
    public function qryCursoProgramado()
    {
        $result = [ "error" => "" ];
        $data["start int"] = isset($_GET["start"]) ? $_GET["start"] : null;
        $data["length int"] = isset($_GET["length"]) ? $_GET["length"] : null;

        $data["search"] = Utilitario::getParam("search");

        if ($result["error"] === "") $result = $this->model->qryCursoProgramado($data);        

        return $result;
    }

    public function pwCursoProgramado()
    {
        $result = [ "error" => "" ];        
        $data["search"] = Utilitario::getParam("search");
        if ($result["error"] === "") $result = $this->model->pwCursoProgramado($data);        

        return $result;
    }

    public function getCursoProgramado()
    {
        $result = [ "error" => "" ];
        $data["id int"] = Utilitario::getParam("id");
        if ($result["error"] === "") $result = $this->model->getCursoProgramado($data);
        return $result;
    }

    public function getDataCursoProgramado()
    {
        $result = [ "error" => "" ];
        $data["id int"] = Utilitario::getParam("id");
        if( $data["id int"] == null || $data["id int"] == "") $result["error"] = "El id es requerido";
        if ($result["error"] === "") $result = $this->model->getDataCursoProgramado($data);
        return $result;
    }

    public function cbxCursoProgramado()
    {
        $result = [ "error" => "" ];        
        if ($result["error"] === "") $result = $this->model->cbxCursoProgramado([]);
        return $result;
    }

    public function cbxTurnosForCurso()
    {
        $result = [ "error" => "" ];
        $data["id_curso_programado int"] = Utilitario::getIntParam("id_curso_programado");
        if ($result["error"] === "") $result = $this->model->cbxTurnosForCurso($data);
        return $result;
    }

    public function saveCursoProgramado($action){

        $result = [ "error" => "" ];

        $data["id int"] = Utilitario::getIntParam("id");
        $data["id_curso int"] = Utilitario::getIntParam("id_curso");
        $data["id_persona int"] = Utilitario::getIntParam("id_persona");
        $data["fecha_inicio"] = Utilitario::getParam("fecha_inicio");
        $data["fecha_fin"] = Utilitario::getParam("fecha_fin");
        $data["link_clase"] = Utilitario::getParam("link_clase");
        $data["tipos_pago"] = Utilitario::getParam("tipos_pago");
        $data["turnos"] = Utilitario::getParam("turnos");
        $data["url_img"] = "public/img/default.png";
        $data["id_usuario"] = $_SESSION["usuario_academia"]["id"];

        $url_img = Utilitario::getParam("url_img",false);

        $fl_img_curso = isset($_FILES["fl_img_curso"]) ? $_FILES["fl_img_curso"] : null;
        
        if($action === 'upd' && $fl_img_curso){ 
            $url_img_old = $this->model->getUrlImgCursoProgramado(["id int" => $data["id int"]])["row"]["url_img"];                        
            $url_img_old = __DIR__ . "/../../" . $url_img_old;            
            if($url_img_old !== "public/img/default.png" && file_exists($url_img_old)){
                unlink( $url_img_old );
            }
        }

        if($fl_img_curso){
            $file_name = $_FILES['fl_img_curso']['name'];
            $file_tmp  = $_FILES['fl_img_curso']['tmp_name'];
            $explode = explode('.',$_FILES['fl_img_curso']['name']);
            $file_ext=strtolower(end($explode));
            $file_name_db = uniqid() . "." . $file_ext;
            $url_img_new = __DIR__ . "/../../public/img/cursos/" . $file_name_db;
            $data["url_img"] = "public/img/cursos/" . $file_name_db;
            move_uploaded_file($file_tmp,$url_img_new);
        }else{
            $data["url_img"] = $url_img;
        }
        
        if ($result["error"] === "") $result = $this->model->saveCursoProgramado($action,$data);
        
        return $result;

    }

}


















