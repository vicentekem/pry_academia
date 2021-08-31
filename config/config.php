<?php

session_start();

$siteName = "ACADEMIA"; // la variable siteName define el nombre del sistema
$currentPage = "INICIO";
//$url_base = "http://localhost/";

//$urls: variable para el manejo de rutas amigables
// sintax : urls[ alias(url que se mostrará en la navegador ) ] =  (archivo que se va a renderizar)

$urls = [];

$urls["login"] = "login.php";
$urls["dashboard"] = "dashboard.php";
$urls["inicio"] = "index.php";
$urls["matricula_virtual"] = "matricula_virtual.php";
$urls["error"] = "error.php";
$urls[""] = "index.php";



/*if( isset($_SESSION["usuario_sgh"]) ){

    require __DIR__ . "/Conexion.php";
    require __DIR__ . "/../models/Menu.php";
    
    $repository = new Menu();
    $result =  $repository->getUrlsSubMenusForUser( $_SESSION["usuario_sgh"]["id_usuario"] );
    if(count($result["rows"]) > 0 ){
        foreach( $result["rows"] as $row ){
            $urls[ $row["alias"] ] = $row["archivo_url"];
        }
    }
}*/








