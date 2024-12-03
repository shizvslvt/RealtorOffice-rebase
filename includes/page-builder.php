<?php

$page = $_GET['p'] ?? 'home';

$page = match ($page) {
    'home' => 'home',
    'login' => 'login',
    'register' => 'register',
    'register-realtor' => 'register-realtor',
    'estate' => 'estate',
    'logout' => 'logout',
    'profile' => 'profile',
    'for-accept' => 'for-accept',
    'accept-estate' => 'accept-estate',
    'waiting-deals' => 'waiting-deals',
    'chats' => 'chats',
    'buy-estate' => 'buy-estate',
    'control-panel' => 'control-panel',
    'add-estate' => 'add-estate',

    default => '404',
};
include_once PAGES_PATH . "/header.php";
echo "<div class='main'>";
include_once PAGES_PATH . "/{$page}.php";
echo "</div>";


echo "<div class='footer' style='position: fixed; bottom: 20px; left: 20px'>";
echo $time = date('Y-m-d H:i:s') . " | ";
if (isset($_COOKIE['uid'])) echo "uid: " . $_COOKIE['uid'] . " | ";
global $access_level;
switch ($access_level) {
    case 3:
        echo "Admin";
        break;
    case 2:
        echo "Realtor";
        break;
    case 1:
        echo "User";
        break;
    case 0:
        echo "Guest";
        break;
}

echo "</div>";

