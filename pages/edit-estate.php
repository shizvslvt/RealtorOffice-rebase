<?php
global $access_level;
if ($access_level == 0) die('You dont have access to this page');
if (!isset($_GET['id'])) die('Error: Missing ID in URL');
$id = (int)$_GET['id'];
$uid = $_COOKIE['uid'];
global $estate;

if (!$estate->checkEstateAccessLevelForSeller($id, $uid)) die('Error: You do not have access to edit this estate.');


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'];
    $cost = $_POST['cost'];
    $archived = $_POST['archived'];
    $description = $_POST['description'];
    $city = $_POST['city'];
    $locality = $_POST['locality'];
    $type = $_POST['type'];
    $area = $_POST['area'];
    $bedrooms = $_POST['bedrooms'];
    $floors = $_POST['floors'];
    $estate->editEstate($id, $title, $cost, $archived, $description, $city, $locality, $type, $area, $bedrooms, $floors);
}

$locations = [
    'cities' => $estate->getData('list_cities'),
    'localities' => $estate->getData('list_localities'),
    'types' => $estate->getData('list_types')
];

global $theme;

$estateData = $estate->getEstateById($id);
if (!$estateData) die('Error: Estate not found.');
$theme->assign('locations', $locations);
$theme->assign('estate', $estateData);
$theme->display('edit-estate.tpl');
