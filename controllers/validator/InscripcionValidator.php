<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Inscripcion.php";
require_once __DIR__ . "/../../models/Usuario.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";
require_once __DIR__ . "/../../services/MailService.php";

class InscripcionValidator
{
    private $model;
    private $usuario_model;
    private $mail;
    public function __construct()
    {
        $this->model = new Inscripcion();
        $this->usuario_model = new Usuario();
        $this->mail = new MailService();
    }
    
    public function saveInscripcion($action){

        $result = [ "error" => "" ];
        
        $data["id int"] = Utilitario::getParam("id");
        $data["dni"] = Utilitario::getParam("dni");
        $data["nombre"] = Utilitario::getParam("nombre");
        $data["ape_pat"] = Utilitario::getParam("ape_pat");
        $data["ape_mat"] = Utilitario::getParam("ape_mat");
        $data["correo"] = Utilitario::getParam("correo");
        $data["celular"] = Utilitario::getParam("celular");
        $data["id_concurso int"] = Utilitario::getIntParam("id_concurso");
        $data["id_distrito"] = Utilitario::getParam("id_distrito");
        //$data["id_usuario"] = $_SESSION["usuario_academia"]["id"];

        $usuario = $this->usuario_model->getUserByDNI( ["dni"=> $data["dni"] ] )["row"];

        $result = $this->model->saveInscripcion($action,$data);

        if($result["error"] == ""){
            $data["id"] = $usuario != null ? $usuario["id"] : null;
            $result_mail = $this->mail->sendMailInscripcion($data);
        }
        echo json_encode($result);        
        return $result;
    }

}


















