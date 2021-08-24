<?
require_once "Mail.php";
require_once('Mail/mime.php');
//require_once '../../model/Personal.php';
include_once ('../../model/Persona.php');
include_once ('../../model/Expediente.php');
$per = new Persona();
$exp = new Expediente();
switch($_GET['accion']){
		case 'SEND_MAIL_REGISTRO':

		$rs=$per->personalQryMail('000000002');

		//$arrht=explode("-", $_GET['ht']);
		$mailpersona='jcuzquen@dirislimacentro.gob.pe';
		$remitente='soporte_progra@dirislimacentro.gob.pe';
		$mensaje='esto es una prueba';

		//$rse=$exp->QryFormatoHt($arrht[0],$arrht[1],$arrht[2]);
		//echo utf8_decode($rs[0]['persona']);exit();
		$crlf = "\n";
		$message = new Mail_mime($crlf);

		$from = "Sistema de Tramite Documentario <".trim($remitente).">";
		//$to = '=?UTF-8?B?'.base64_encode(ucwords(mb_strtolower($rs[0]['completo'],'UTF-8'))).'?='.' <'.$_GET['email'].'>';
		$to = ' <'.$mailpersona.'>';
		//$cc = ' <rrhh@saludpol.gob.pe>';
		$cc = '';
		//$to = "Nobody <lsaldivarc@saludpol.gob.pe>";

		$subject = utf8_decode("Notificación Recepción de Expediente");
		//$body = "Estimado(a) ".utf8_decode($rs[0]['persona']).utf8_decode(" sobre el Sistema de Tramite Documentario se le notifica lo siguiente:<br><br>");
		$body = "Estimado(a)   sobre el Sistema de Tramite Documentario se le notifica lo siguiente:<br><br>";

		if (preg_match("/\Registro\b/",$mensaje)){
			$body.=$_GET['msg']."<br><br>"
				 .utf8_decode("Ud. ha recibido un  en su bandeja del Sistema de Tramite Documentario.");
				 //.utf8_decode("Ud. ha recibido un ".utf8_decode($rse[0]['tipo_doc'])." en su bandeja del Sistema de Tramite Documentario.");
		}elseif(preg_match("/\Salida\b/",$mensaje)){
			$body.=$_GET['msg']."<br><br>"
				 .utf8_decode("Por lo cual debera justificar su omisión de salida con Memorando o documento formal enviado por el Jefe Responsable en un plazo no mayor a 24 horas.");
		}else{
			$body.=$_GET['msg']."<br><br>"
				 .utf8_decode("Ud. ha recibido un  en su bandeja del Sistema de Tramite Documentario.");
				 //.utf8_decode("Ud. ha recibido un ".utf8_decode($rse[0]['tipo_doc'])."  en su bandeja del Sistema de Tramite Documentario.");
		}
		$body .="<br><br>"
			  ."atte.<br><br>"
			  .utf8_decode("<strong> Equipo Funcional de Tecnología de la Información</strong>");

		$message->setTXTBody("This is the text version.");
		$message->setHTMLBody($body);


		$host = "mail.dirislimacentro.gob.pe";
		//$username = trim($_GET['remitente']);
		//$password = trim($_GET['clave']);
		$username = 'soporte_progra@dirislimacentro.gob.pe';
		$password = 'Diris2019';
		$headers = array ('From' => $from,
		  'To' => $to,
		  'Subject' => $subject,
		  'Cc' => $cc
		  );
		$smtp = Mail::factory('smtp',
		  array ('host' => $host,'port'=>'25',
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
		  ?><img src="../dist/img/cancel.png" /><?
		} else {
		  ?><img src="../dist/img/ok.png" /><?
		}
	break;


}
?>
