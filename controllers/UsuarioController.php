<?php

require_once "validator/UsuarioValidator.php";

class UsuarioController
{
    private $validator;

    public function __construct()
    {
        $this->validator = new UsuarioValidator();
    }

    public function procesarPeticion(){

        if($_GET){
            $this->controllerGet();
        }else if($_POST){
            $this->controllerPost();
        }else{
            $res["error"] = "Error al procesar la petición";
            echo json_encode($res);
        }
    }

    public function controllerGet(){

        $action = isset($_GET['action']) ? $_GET['action'] : "";

        switch ($action){

            case "qry_usuario": $array_result = $this->validator->qryUsuario();break;
            case "cbx_usuario": $array_result = $this->validator->cbxUsuario();break;
            case "get_usuario": $array_result = $this->validator->getUsuario();break;
            default:
                $array_result["error"] = "Error al procesar la petición";
                break;
        }
        
        echo json_encode( $array_result );

    }

    public function controllerPost(){

        $action = isset($_POST['action']) ? $_POST['action'] : "";
        switch ($action){
            case "login":

                $array_result = $this->validator->login();
                
                if( $array_result["error"] == "" ){
                    @session_start();
                    $_SESSION['usuario_academia'] = $array_result["row"];
                    //$url_bak = isset($_POST['url_bak']) ? $_POST['url_bak'] : '';
                    //$url = $url_bak ? $url_bak : 'dashboard';
                    header('location:../?url=dashboard');
                }else{
                    header('location:../?url=login');
                }
                break;
                
            case "login_ajax" : $array_result = $this->validator->login();break;
            case "ins_usuario": $array_result = $this->validator->saveUsuario('ins');break;
            case "upd_usuario": $array_result = $this->validator->saveUsuario('upd');break;
            case "res_usuario": $array_result = $this->validator->saveUsuario('res');break;
            case "est_usuario": $array_result = $this->validator->saveUsuario('est');break;
            case "change_pass": $array_result = $this->validator->saveUsuario('chng');break;
            default:
                $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode( $array_result );
    }

}

$controller = new UsuarioController();
$controller->procesarPeticion();















