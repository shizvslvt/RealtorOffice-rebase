<?php

if (isset($_POST['name']) &&
    isset($_POST['mail']) &&
    isset($_POST['password']) &&
    isset($_POST['repeat_password']) &&
    isset($_POST['birthday']) &&
    isset($_POST['pid']) &&
    isset($_POST['experience'])) {


    if ($_POST['password'] == $_POST['repeat_password']) {
        global $auth;

        if ($auth->registerRealtor($_POST['name'], $_POST['mail'], $_POST['password'], $_POST['birthday'], $_POST['pid'], $_POST['experience'])) {
            header('Location: ?p=login');
            exit();
        }
    }
}

global $theme;
$theme->display('register-realtor.tpl');
