<?php

global $estate;
if($estate->checkEstateAccessLevelForBuyer($_GET['id'])) die('dont have access');
if($estate->checkSoldEstate($_GET['id'])) die("Эта недвижимость была продана.");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (($_GET['a']) != "buy") die("null 'a' in url");
    $estate->buyEstate($_POST['id']);
}
global $theme, $user;
echo '<div class="buy-estate-container">';
$estate->displayEstate($_GET['id']);

$balance = $user->getBalance($_COOKIE['uid']);
$estate_cost = $estate->getEstateCost($_GET['id']);
if ($balance < $estate_cost) {
    $theme->assign('error', "У вас недостаточно средств для покупки этой недвижимости.");
} else {
    $theme->assign('balance_new', $balance - $estate_cost);
}

$theme->assign('estate_id', $_GET['id']);
$theme->assign('balance', $balance);
$theme->assign('estate_cost', $estate_cost);
$theme->display('buy-estate.tpl');
echo '</div>';



