<?php
/**
 * Created by PhpStorm.
 * User: Usuario
 * Date: 22/11/2019
 * Time: 09:02
 */

@session_start();

class General
{
    public $debugger = true;

    public function error($msg,$ex){
        return $this->debugger ? $msg . " => " . $ex->getMessage() : $msg ;
    }
}