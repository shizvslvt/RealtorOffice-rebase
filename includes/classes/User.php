<?php

class User
{
    private $id;

    public function __construct() {
        if (isset($_COOKIE['uid'])) {
            $this->id = $_COOKIE['uid'];
        }
    }
    public function getAccessLevel(): int
    {
        global $admins_id, $db_controller;
        $realtors_id = $db_controller->getArrayRealtorsId();
        if($db_controller->checkUserId($this->id)) {
            if(in_array($this->id, $admins_id)) return 3;
            if (in_array($this->id, $realtors_id)) return 2;
            return 1;
        }
        return 0;
    }

}