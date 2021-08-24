<?

require_once('lib/nusoap.php');
   $wsdl="http://webservice.miasoftware.net/service/sunat/ruc.php?wsdl";
   $client=new nusoap_client($wsdl, true);
   $param=array('ruc'      => '10407206580',
                'username' => 'correo@dominio.com',
                'hash'     => 'XXX-XXX-XXX',
                'tracking' => '');
   header("Content-Type:text/xml");
   // hacemos la impresion de informacion
   echo $client->call('consultaRUC',$param);

?>