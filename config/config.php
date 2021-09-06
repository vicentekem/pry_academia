<?php

session_start();

$siteName = "ACADEMIA"; // la variable siteName define el nombre del sistema
$currentPage = "Inicio";
//$url_base = "http://localhost/";

//$urls: variable para el manejo de rutas amigables
// sintax : urls[ alias(url que se mostrará en la navegador ) ] =  (archivo que se va a renderizar)

$urls = [];

$urls["login"] = "login.php";
$urls["dashboard"] = "dashboard.php";
$urls["inicio"] = "index.php";
//$urls["cursos"] = "cursos.php";
$urls["sobre__nosotros.php"] = "sobre__nosotros.php";
$urls["ciclos.php"] = "ciclos.php";
$urls["temarios.php"] = "temarios.php";
$urls["matricula_virtual"] = "matricula_virtual.php";
$urls["error"] = "error.php";
$urls[""] = "index.php";

//$urls[ $submenu["alias"] ] = $submenu["file_view"];

if( isset($_SESSION["usuario_academia"]) ){

    require __DIR__ . "/Conexion.php";
    require __DIR__ . "/../models/Menu.php";
    
    $repository = new Menu();
    $result =  $repository->getSubMenusForUser( $_SESSION["usuario_academia"]["id"] );

    if(count($result["rows"]) > 0 ){

        foreach( $result["rows"] as $row ){
            $urls[ $row["alias"] ] = $row["file_view"];
        }

    }
}









