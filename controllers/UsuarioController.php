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
            case "qry_usuarios": $array_result = $this->validator->getUsuarios();break;
            case "qry_login_usuario": $array_result = $this->validator->getLoginUsuario();break;
            case "cbx_dependencias": $array_result = $this->validator->getCbxDependencias();break;
            case "cbx_personal": $array_result = $this->validator->getCbxPersonal();break;
            case "cbx_cargos": $array_result = $this->validator->getCbxCargos();break;
            case "cbx_roles": $array_result = $this->validator->getCbxRoles();break;

            case "check_dni_user": $array_result = $this->validator->checkDniUser();break;
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
                    $url_bak = isset($_POST['url_bak']) ? $_POST['url_bak'] : '';
                    $url = $url_bak ? $url_bak : 'dashboard';
                    header('location:../?url=' . $url);
                }else{
                    header('location:../?url=login');
                }
                break;
            case "login_ajax": $array_result = $this->validator->login();break;
            case "change_pass": $array_result = $this->validator->changePass();break;
            case "change_pass_req": $array_result = $this->validator->changePassReq();break;
            case "send_email_cod_seg": $array_result = $this->validator->sendEmailCodSeg();break;
            case "valid_cod_seg": $array_result = $this->validator->validCodSeg();break;
            default:
                $array_result["error"] = "Error al procesar la petición";
        }
        echo json_encode( $array_result );
    }

}

$controller = new UsuarioController();
$controller->procesarPeticion();















