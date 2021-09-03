<?php

require_once __DIR__ . "/../../models/Menu.php";
require_once __DIR__ . "/../../utilitario/Utilitario.php";

class MenuValidator
{

    private $repository;

    public function __construct()
    {
        $this->repository = new Menu();
    }

        


}
