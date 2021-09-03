<?php

require_once __DIR__ . "/../../models/Muestra.php";

class MuestraValidator
{

    private $repository;

    public function __construct()
    {
        $this->repository = new Muestra();
    }

        


}
