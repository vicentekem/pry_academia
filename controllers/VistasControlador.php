<?php


class VistasControlador
{
    function __construct()
    {

    }

    public function loadView($url)
    {
        global $urls;

        if (in_array($url, array_keys( $urls ))) {
            if( file_exists( "views/" .  $urls[$url] ) ){
                include "views/" .  $urls[$url];
            }else{
                echo "Página no encontrada";
            }
        }else if ($url == "logout"){
            $_SESSION["usuario_academia"] = null;
            session_destroy();
            //$url_bak = isset($_GET['url_bak']) ? '&url_bak=' . $_GET['url_bak'] : '';
            header('location:?url=login');
        }else{
            //$url_origin = $url ? '&url_origin=' . $url : '';
            header('location:?url=error');
        }
    }

}














