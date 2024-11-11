<?php

$page = $_GET['p'] ?? 'home';

$page = match ($page) {
    'home' => 'home',
    'login' => 'login',
    'register' => 'register',
    'register-realtor' => 'register-realtor',
    'estate' => 'estate',
    'add-estate' => 'add-estate',
    'edit-estate' => 'edit-estate',
    'chats' => 'chats',
    'buy-estate' => 'buy-estate',
    'control-panel' => 'control-panel',
    'logout' => 'logout',
    'profile' => 'profile',

    'for-accept' => 'for-accept',
    'accept-estate' => 'accept-estate',
    'waiting-deals' => 'waiting-deals',

    default => '404',
};
include_once PAGES_PATH . "/header.php";
echo "<div class='main'>";
include_once PAGES_PATH . "/{$page}.php";
echo "</div>";

echo $time = date('Y-m-d H:i:s') . " | ";
if($_COOKIE['uid']) echo $_COOKIE['uid'];

