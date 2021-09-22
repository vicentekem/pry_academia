<?php

require_once __DIR__ . '/../lib/phpmailer/class.phpmailer.php';

class MailService{

    private $mail;
    
    /*
        $template = __DIR__ . "/../../views/partials/citas/cita_mail.php";
        $message = file_get_contents($template);
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
        $message = str_replace('{{observaciones}}', $result["rows"][0]["observaciones"], $message);
        //$mail->msgHTML("<h1>InformaciÃ³n de cita</h1>");
        //$mail->addStringAttachment($f, 'Cita.pdf');
    */
    

    function sendMail($data)
    {
        $result = ["error" => "", "rows" => []];
        try {

            //$f = file_get_contents("http://localhost/hc/services/pdf/pdfcita.php?id=".$data["id"]);

            $mail = new PHPMailer(true);
            $mail->CharSet = "UTF-8";
            $mail->SMTPDebug = 0;                                       // Enable verbose debug output
            $mail->isSMTP();                                            // Set mailer to use SMTP
            $mail->Host = 'smtp.gmail.com';                             // Specify main and backup SMTP servers
            //$mail->Host = 'mail.dirislimacentro.gob.pe';              // Specify main and backup SMTP servers
            $mail->SMTPAuth = true;                                     // Enable SMTP authentication
            $mail->Username = 'joel.vicente.quispe@gmail.com';          // SMTP username
            $mail->Password = 'Kempa123.';                              // SMTP password
            //$mail->Username = 'admision@dirislimacentro.gob.pe';        // SMTP username
            //$mail->Password = 'RNECimap7102';                           // SMTP password
            $mail->SMTPSecure = 'tls';                                  // Enable TLS encryption, `ssl` also accepted
            $mail->Port = 587;                                          // TCP port to connect to
            //$mail->Port = 465;                                        // TCP port to connect to

            $mail->setFrom('joel.vicente.quispe@gmail.com', 'Academia');
            $mail->addAddress($data["correo"]);

            $mail->isHTML(true);
            $mail->Subject = 'Registro exitoso - academia .... ';
            $msg  = "<p>Hola ". $data["nombre"] ."!</p>";
            $msg .= "<p>Para completar el proceso de matricula debera ingrresar a la intranet y en la opcion procesos -> registrar pago <br>";
            $msg .= "donde debera adjuntar el baucher del pago</p>";
            $msg .= "<p>Estos son tus credenciales de acceso a la intranet:</p>";
            $msg .= "<p>Usuario: ". $data["dni"] ."</p>";
            $msg .= "<p>Contraseña: ". $data["dni"] ."</p>";
            $msg .= "<p>Podrá cambiar su contraseña por defecto desde la platadforma.</p>";
            $msg .= "<p>Para Acceder a la plataforma dar <a href='http://localhost:8080/pry_academia/?url=login'>click aqui</a>.</p>";
            $mail->msgHTML($msg);
            
            if (!$mail->send()) {
                $result["error"] = "Error al enviar el email";
            }

        } catch (Exception $e) {
            //$result["error"] = "Error al enviar el email";
            $result["error"] = $e->getMessage();
        }

        return $result;
    }

}