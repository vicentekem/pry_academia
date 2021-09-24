<?php

class Utilitario
{

    static function generarFiltros($data,$data_filters,$admit_zero = false,$extra_filter = []){
        $filters = [];
        foreach( $data as $key => $value ){
            $key = explode(" " , $key)[0];
            //echo var_dump( $key ) . " " . var_dump( $value === 0 || $value );
            if(($value === 0 || $value) && isset($data_filters[$key])) $filters[] = $data_filters[$key];
        }
        $filters = array_merge($filters, $extra_filter);
        return count($filters) > 0 ? "WHERE " . implode(" AND ",$filters) : "";
    }


    static function getParam($param,$upper = true){        
        $value = isset($_REQUEST[$param]) ? $_REQUEST [$param] : "";
        return $upper === true ? strtoupper($value) : $value;
    }

    static function getIntParam($param){
        $value = isset($_REQUEST [$param]) ? $_REQUEST[$param] : null;
        if($value === ""){ $value = null;}
        else if(is_numeric($value)){ $value = (int)$value; }
        return $value;
    }

}