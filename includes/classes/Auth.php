<?php

class Auth
{
    public function login($mail, $password): bool
    {
        global $db_controller;
        $user = $db_controller->login($mail, $password);
        if ($user) {
            setcookie("uid", $user, time() + 3600);
            return true;
        }
        return false;
    }
    public function logout()
    {
        setcookie("uid", null, time() - 3600);
        header('Location: ?p=home');
        exit();

    }
    public function register($name, $mail, $password, $birthday, $PID): bool
    {
        global $db_controller;
        return $db_controller->register($name, $mail, $password, $birthday, $PID);

    }
    public function registerRealtor($name, $mail, $password, $birthday, $PID, $experience): bool
    {
        global $db_controller;
        return $db_controller->registerRealtor($name, $mail, $password, $birthday, $PID, $experience);
    }
}