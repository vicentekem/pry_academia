<?php
    header("Cache-Control: no-cache, must-revalidate");
    header("Expires: Sat, 1 Jul 2000 05:00:00 GMT");
    header("Expires: 0");
    header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
    header("Cache-Control: no-store, no-cache, must-revalidate");
    header("Cache-Control: post-check=0, pre-check=0", false);
    header("Pragma: no-cache");

    require_once __DIR__ . "/config/config.php";
    require_once __DIR__ . "/config/handler.php";
    require_once __DIR__ . "/controllers/VistasControlador.php";

    $controller = new VistasControlador();

    $url = isset($_GET["url"]) ? $_GET["url"] : "";
    
    $controller->loadView( $url );
// comentario

// Consolas, 'Courier New', monospace
