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
        
        if (!$data["usuario"]) { $result["error"] = "Ingrese usuario"; }        
        if (!$data["clave"]) { $result["error"] = "Ingrese contraseña"; }

        if ($result["error"] === "") {
            $result = $this->model->login($data);
        }

        return $result;

    }
    

}


















