<?php

require_once __DIR__ . '/Mail.php';
require_once __DIR__ . '/Mail/mime.php';
//require_once __DIR__ . '/../../controllers/validator/CitaValidator.php';

$result = ["error" => "","rows"=>[]];

//$validator = new CitaValidator();

//$result = $validator->getCitaPdf();
$data["id"] = isset($_REQUEST["id"]) ? $_REQUEST["id"] : null;
$data["email"] = isset($_REQUEST["email"]) ? $_REQUEST["email"] : null;

if(count($result["rows"]) > 0){
    try {
        //$f = file_get_contents("http://localhost/hc/services/pdf/pdfcita.php?id=".$data["id"]);
        //$id=$_POST['id_orden_compra'];
        //$save='';
        //include("../reportes/rptOrdenCompra.php");

        $crlf = "\n";
        $message = new Mail_mime($crlf);

        $from = "Clinica <sapito@mydominio.com>";

        $to = ' <'.$data["email"].'>';
        $cc = '';

        //$file="oc.pdf";

        $subject = utf8_decode("INFORMACIÓN DE CITA MÉDICA");
        $body = "Hacemos llegar informacion de cita medica";

        $message->setTXTBody("This is the text version.");
        $message->setHTMLBody($body);

        //$message->addAttachment($file, 'text/plain');

        $host = "mail.dirislimacentro.gob.pe";
        $username = "admision@dirislimacentro.gob.pe";
        $password =  "RNECimap7102";
        $headers = array ('From' => $from,
            'To' => $to,
            'Subject' => $subject,
            'Cc' => $cc
        );

        $smtp = Mail::factory('smtp',
            array ('host' => $host,'port'=>'465',
                'auth' => false,
                'username' => $username,
                'password' => $password,
                'debug' => false,
                'Content-Type'  => 'text/html; charset=UTF-8'
            ));


        $body = $message->get();
        $headers = $message->headers($headers);

        $mail = $smtp->send($to.','.$cc, $headers,$body );

        if (PEAR::isError($mail)) {
            $result["error"] = $mail->getMessage();
        } else {
            echo "ok";
        }

    } catch (Exception $e) {
        $result["error"] = "Error al enviar el email";
        $result["error"] = $e->getMessage();
    }
}

return $result;