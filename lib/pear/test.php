<?php
require_once "Mail.php";

$from = "Web Master <lsaldivarc@saludpol.gob.pe>";
$to = "Nobody <lsaldivarc@saludpol.gob.pe>";
$subject = "Test email using PHP SMTP\r\n\r\n";
$body = "This is a test email message";

$host = "mail.saludpol.gob.pe";
$username = "lsaldivarc@saludpol.gob.pe";
$password = "Var200480Lui";
$headers = array ('From' => $from,
  'To' => $to,
  'Subject' => $subject);
$smtp = Mail::factory('smtp',
  array ('host' => $host,'port'=>'25',
    'auth' => false,	
    'username' => $username,
    'password' => $password,
	'debug' => false	
	));

$mail = $smtp->send($to, $headers, $body);

if (PEAR::isError($mail)) {
  echo("<p>" . $mail->getMessage() . "</p>");
} else {
  echo("<p>Message successfully sent!</p>");
}
?>