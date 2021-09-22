<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../models/Matricula.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";
require_once __DIR__ . "/../../services/MailService.php";

class MatriculaValidator
{
    private $model;
    private $mail;
    public function __construct()
    {
        $this->model = new Matricula();
        $this->mail = new MailService();
    }
    
    public function saveMatricula($action){

        $result = [ "error" => "" ];
        
        $data["id int"] = Utilitario::getIntParam("id");
        $data["id_alumno int"] = Utilitario::getIntParam("id_alumno");
        $data["dni"] = Utilitario::getParam("dni");
        $data["nombre"] = Utilitario::getParam("nombre");
        $data["ape_pat"] = Utilitario::getParam("ape_pat");
        $data["ape_mat"] = Utilitario::getParam("ape_mat");
        $data["id_distrito"] = Utilitario::getParam("id_distrito");
        $data["correo"] = Utilitario::getParam("correo");
        $data["celular"] = Utilitario::getParam("celular");
        $data["id_curso_programado int"] = Utilitario::getIntParam("id_curso_programado");
        $data["id_turno int"] = Utilitario::getIntParam("id_turno");        
        //$data["id_usuario"] = $_SESSION["usuario_academia"]["id"];
 
        $result = $this->model->saveMatricula($action,$data);

        if($result_mail["error"] == "") $result_mail = $this->mail->sendMail($data);
        return $result;

    }


}


















