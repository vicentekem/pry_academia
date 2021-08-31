<?php
/**
 * Created by PhpStorm.
 * User: ACER
 * Date: 18/03/2019
 * Time: 08:34 AM
 */

require_once __DIR__ . "/../../config/Conexion.php";
require_once __DIR__ . "/../../models/Usuario.php";

class UsuarioValidator
{

    private $model;

    public function __construct()
    {
        $this->model = new Usuario();
    }

    function sendMail($data)
    {
        $result = ["error" => "", "rows" => []];
        require_once __DIR__ . '/../../lib/phpmailer/class.phpmailer.php';
        //exit( json_encode($result) );
        try {

            //$f = file_get_contents("http://localhost/hc/services/pdf/pdfcita.php?id=".$data["id"]);

            $mail = new PHPMailer(true);
            $mail->CharSet = "UTF-8";
            $mail->SMTPDebug = 0;                                       // Enable verbose debug output
            $mail->isSMTP();                                            // Set mailer to use SMTP
            $mail->Host = 'smtp.gmail.com';                             // Specify main and backup SMTP servers
            //$mail->Host = 'mail.dirislimacentro.gob.pe';              // Specify main and backup SMTP servers
            $mail->SMTPAuth = true;                                     // Enable SMTP authentication
            $mail->Username = 'joel.vicente.quispe@gmail.com';        // SMTP username
            $mail->Password = 'kempa123.';                              // SMTP password
            //$mail->Username = 'admision@dirislimacentro.gob.pe';        // SMTP username
            //$mail->Password = 'RNECimap7102';                           // SMTP password
            $mail->SMTPSecure = 'tls';                                  // Enable TLS encryption, `ssl` also accepted
            $mail->Port = 587;                                          // TCP port to connect to
            //$mail->Port = 465;                                        // TCP port to connect to

            $mail->setFrom('joel.vicente.quispe@gmail.com', 'Diris Lima Centro');
            $mail->addAddress($data["correo"]);

            $mail->isHTML(true);
            $mail->Subject = 'Modulo covid - Codigo Para cambio de contraseña';

            //$template = __DIR__ . "/../../views/partials/citas/cita_mail.php";

            /*$message = file_get_contents($template);
            $message = str_replace('{{empresa}}', $result["rows"][0]["empresa"], $message);
            $message = str_replace('{{local}}', $result["rows"][0]["local"], $message);
            $message = str_replace('{{nombres_pac}}', $result["rows"][0]["nombres_pac"], $message);
            $message = str_replace('{{apellido_paterno_pac}}', $result["rows"][0]["apellido_paterno_pac"], $message);
            $message = str_replace('{{apellido_materno_pac}}', $result["rows"][0]["apellido_materno_pac"], $message);
            $message = str_replace('{{nombres_med}}', $result["rows"][0]["nombres_med"], $message);
            $message = str_replace('{{apellido_paterno_med}}', $result["rows"][0]["apellido_paterno_med"], $message);
            $message = str_replace('{{apellido_materno_med}}', $result["rows"][0]["apellido_materno_med"], $message);
            $message = str_replace('{{especialidad}}', $result["rows"][0]["especialidad"], $message);
            $message = str_replace('{{consultorio}}', $result["rows"][0]["consultorio"], $message);
            $message = str_replace('{{fecha}}', $result["rows"][0]["fecha"], $message);
            $message = str_replace('{{hora}}', $result["rows"][0]["hora"], $message);
            $message = str_replace('{{observaciones}}', $result["rows"][0]["observaciones"], $message);*/

            $mail->msgHTML("<p>Tu codigo de verificación para el modulo covid es : ". $data["cog_seg"] .".</p>");

            //$mail->msgHTML("<h1>InformaciÃ³n de cita</h1>");
            //$mail->addStringAttachment($f, 'Cita.pdf');

            if (!$mail->send()) {
                $result["error"] = "Error al enviar el email";
            }

        } catch (Exception $e) {
            //$result["error"] = "Error al enviar el email";
            $result["error"] = $e->getMessage();
        }

        return $result;
    }

    public function login()
    {
        $result = ["error" => ""];
        $data["usuario"] = isset($_POST["usuario"]) ? $_POST["usuario"] : null;
        $data["clave"] = isset($_POST["clave"]) ? $_POST["clave"] : null;

        $data["id_est"] = isset($_POST["id_est"]) ? $_POST["id_est"] : null;
        
        if (!$data["usuario"]) { $result["error"] = "Ingrese usuario"; }
        if (!$data["id_est"]) { $result["error"] = "Seleccione dependencia"; }
        if (!$data["clave"]) { $result["error"] = "Ingrese contraseña"; }

        if ($result["error"] === "") {
            $result = $this->model->login($data);
        }
        return $result;
    }

    public function changePass()
    {
        $result = ["error" => ""];
        $data["current_pass"] = isset($_POST["current_pass"]) ? $_POST["current_pass"] : null;
        $data["new_pass"] = isset($_POST["new_pass"]) ? $_POST["new_pass"] : null;
        $data["rnew_pass"] = isset($_POST["rnew_pass"]) ? $_POST["rnew_pass"] : null;
        $data["id_usuario"] = isset($_SESSION['usuario_cor']["id_usuario"]) ? $_SESSION['usuario_cor']["id_usuario"] : null;

        if (!$data["id_usuario"]) { $result["error"] = "Usuario requerido"; }
        if (!$data["current_pass"]) { $result["error"] = "Ingrese contraeña actual"; }
        if (!$data["new_pass"]) { $result["error"] = "Ingrese nueva contraseña"; }

        //exit(json_encode($_SESSION));
        //exit(json_encode($data));

        if ($result["error"] === "") {
            $result = $this->model->changePass($data);
        }
        return $result;
    }

    public function changePassReq()
    {
        $result = ["error" => ""];
        $data["id_usuario"] = isset($_POST["id_usuario"]) ? $_POST["id_usuario"] : null;
        $data["pass_usuario"] = isset($_POST["pass_usuario"]) ? $_POST["pass_usuario"] : null;
        $data["rep_pass_usuario"] = isset($_POST["rep_pass_usuario"]) ? $_POST["rep_pass_usuario"] : null;

        if (!$data["id_usuario"]) { $result["error"] = "Usuario requerido"; }
        if (!$data["pass_usuario"]) { $result["error"] = "Ingrese nueva contraseña"; }

        //exit(json_encode($_SESSION));
        //exit(json_encode($data));

        if ($result["error"] === "") {
            $result = $this->model->changePassReq($data);
        }
        return $result;
    }

    public function sendEmailCodSeg()
    {
        $result = ["error" => ""];
        $data["id_usuario"] = isset($_POST["id_usuario"]) ? $_POST["id_usuario"] : null;
        $data["correo"] = isset($_POST["correo"]) ? $_POST["correo"] : null;
        $data["cog_seg"] = rand(100000,999999);

        //exit(json_encode($data));
        if(!$data["id_usuario"]) $result["error"] = "Id de usuario es requerido";
        else if(!$data["correo"]) $result["error"] = "El correo es requerido";

        if ($result["error"] === "") {
            $result = $this->model->sendEmailCodSeg($data);
            if($result["error"] === ""){
                $result = $this->sendMail($data);
            }
        }
        return $result;
    }

    public function validCodSeg()
    {
        $result = ["error" => ""];
        $data["id_usuario"] = isset($_POST["id_usuario"]) ? $_POST["id_usuario"] : null;
        $data["cod_seg"] = isset($_POST["cod_seg"]) ? $_POST["cod_seg"] : null;

        if(!$data["id_usuario"]) $result["error"] = "Id de usuario es requerido";
        else if(!$data["cod_seg"]) $result["error"] = "El codigo es requerido";

        if ($result["error"] === "") {
            $result = $this->model->validCodSeg($data);
        }
        return $result;
    }

    function getLoginUsuario()
    {
        $result = ["error" => ""];

        $data["nombre_usuario"] = isset($_GET["nombre_usuario"]) ? $_GET["nombre_usuario"] : null;
        $data["term"] = isset($_GET["term"]) ? $_GET["term"] : null;

        if ($result["error"] == "") {
            $result = $this->model->getLoginUsuario($data);
        }

        return $result;
    }

    function getCbxDependencias()
    {
        $result = ["error" => ""];

        $data["usuario"] = isset($_GET["usuario"]) ? $_GET["usuario"] : null;

        if ($result["error"] == "") {
            $result = $this->model->getCbxDependencias($data);
        }

        return $result;
    }

    function getUsuarios()
    {
        $result = ["error" => "", "rows" => []];

        $data["nombre"] = isset($_GET["nombre"]) ? $_GET["nombre"] : null;

        /*Generar Filtros , Limit , Orders*/
        $filters = "";
        $limit = "";
        $start = isset($_GET["start"]) ? $_GET["start"] : null;
        $length = isset($_GET["length"]) ? $_GET["length"] : null;

        if($data["nombre"]) $filters .= " and us.nom_usuario ilike '%'||:nombre||'%' ";
        if( trim(substr($filters,0,4)) == "and" ){ $filters = substr($filters,4);}
        if( strlen(trim($filters)) > 0 ) $filters = "where " . $filters;

        if( $start >= 0 && $length > 0 ) $limit .= " limit $length offset $start ";

        $data["filters_str"] = $filters;
        $data["limit"] = $limit;

        if ($result["error"] == "") {
            $result = $this->model->getUsuarios($data);
        }

        return $result;
    }

    function getCbxPersonal()
    {
        $result = ["error" => "", "rows" => []];
        //$data["q"] = isset($_GET["q"]) ? trim($_GET["q"]) : null;
        //$data["id_cie10"] = isset($_GET["id_cie10"]) ? $_GET["id_cie10"] : null;

        /*Generar Filtros , Limit , Orders*/
        $filters = "";

        //if ($data["q"]) $filters .= " and p.primer_ape ||' '|| p.segundo_ape ||' '|| p.nombre_rs ilike '%' || sp_ascii(:q) || '%' ";
        //$filters .= " and cb.estado = '1' ";
        if (trim(substr($filters, 0, 4)) == "and") {
            $filters = substr($filters, 4);
        }
        if (strlen(trim($filters)) > 0) $filters = "where " . $filters;
        $data["filters_str"] = $filters;

        if ($result["error"] == "") {
            $result = $this->model->getCbxPersonal($data);
        }

        return $result;
    }

    function getCbxCargos()
    {
        $result = ["error" => "", "rows" => []];
        $data["q"] = isset($_GET["q"]) ? trim($_GET["q"]) : null;
        //$data["id_cie10"] = isset($_GET["id_cie10"]) ? $_GET["id_cie10"] : null;

        /*Generar Filtros , Limit , Orders*/
        $filters = "";

        //if ($data["q"]) $filters .= " and p.primer_ape ||' '|| p.segundo_ape ||' '|| p.nombre_rs ilike '%' || sp_ascii(:q) || '%' ";
        //$filters .= " and cb.estado = '1' ";
        if (trim(substr($filters, 0, 4)) == "and") {
            $filters = substr($filters, 4);
        }
        if (strlen(trim($filters)) > 0) $filters = "where " . $filters;
        $data["filters_str"] = $filters;

        if ($result["error"] == "") {
            $result = $this->model->getCbxCargos($data);
        }

        return $result;
    }

    function getCbxRoles()

    {
        $result = ["error" => "", "rows" => []];
        $data["q"] = isset($_GET["q"]) ? trim($_GET["q"]) : null;
        //$data["id_cie10"] = isset($_GET["id_cie10"]) ? $_GET["id_cie10"] : null;

        /*Generar Filtros , Limit , Orders*/
        $filters  = " and estado = '1' ";

        //if ($data["q"]) $filters .= " and p.primer_ape ||' '|| p.segundo_ape ||' '|| p.nombre_rs ilike '%' || sp_ascii(:q) || '%' ";
        //$filters .= " and cb.estado = '1' ";
        if (trim(substr($filters, 0, 4)) == "and") {$filters = substr($filters, 4);}
        if (strlen(trim($filters)) > 0) $filters = "where " . $filters;
        $data["filters_str"] = $filters;

        if ($result["error"] == "") {
            $result = $this->model->getCbxRoles($data);
        }

        return $result;
    }

    function checkDniUser(){

        $result = ["error" => "", "rows" => []];

        $data["nro_dni"] = isset($_GET["nro_dni"]) ? trim($_GET["nro_dni"]) : null;
        $data["nom_usuario"] = isset($_GET["nom_usuario"]) ? trim($_GET["nom_usuario"]) : null;

        /*Generar Filtros , Limit , Orders*/
        $filters  = "";

        if ($data["nro_dni"]) $filters .= " and pe.nrodoc = :nro_dni ";
        if ($data["nom_usuario"]) $filters .= " and us.nom_usuario = :nom_usuario ";
        $filters .= " and us.estado = 1 ";
        if (trim(substr($filters, 0, 4)) == "and") {$filters = substr($filters, 4);}
        if (strlen(trim($filters)) > 0) $filters = "where " . $filters;
        $data["filters_str"] = $filters;

        if ($result["error"] == "") {
            $result = $this->model->checkDniUser($data);
        }

        return $result;
    }
}


















