<?php
session_start();
$siteName = "ACADEMIA"; // la variable siteName define el nombre del sistema
$currentPage = "Inicio";
//$url_base = "http://localhost/";
//$urls: variable para el manejo de rutas amigables
// sintax : urls[ alias(url que se mostrará en la navegador ) ] =  (archivo que se va a renderizar)

$urls = [];
$urls[""] = "index.php";
$urls["login"] = "login.php";
$urls["dashboard"] = "dashboard.php";
$urls["inicio"] = "index.php";
$urls["ciclo"] = "ciclo.php";
$urls["correo"] = "correo.php";
$urls["inscripcion"] = "view_inscripcion.php";
$urls["profile"] = "profiles.php";

$urls["error"] = "error.php";

require __DIR__ . "/Conexion.php";
require __DIR__ . "/../models/Menu.php";
$repository = new Menu();

if( isset($_SESSION["usuario_academia"]) ){
    $result =  $repository->getSubMenusForUser( $_SESSION["usuario_academia"]["id"] );
    if(count($result["rows"]) > 0 ){
        foreach( $result["rows"] as $row ){
            $urls[ $row["alias"] ] = $row["file_view"];
        }
    }
}


$result =  $repository->getPublicMenu();
if(count($result["rows"]) > 0 ){
    foreach( $result["rows"] as $row ){
        $urls[ $row["alias"] ] = $row["file_view"];
    }
}










