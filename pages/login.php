<?php

if (isset($_POST['mail']) && isset($_POST['password'])) {
    global $auth;

    if ($auth->login($_POST['mail'], $_POST['password'])) {
        header('Location: ?p=home');
        exit();
    }
}
global $theme;
$theme->display('login.tpl');

