<?php
global $access_level;

if ($access_level == 0 or $access_level == 2) die('You dont have access to this page');
global $realtor;
if (isset($_POST['title']) &&
    isset($_POST['description']) &&
    isset($_POST['cost']) &&
    isset($_POST['type']) &&
    isset($_POST['city']) &&
    isset($_POST['locality']) &&
    isset($_POST['area']) &&
    isset($_POST['bedrooms']) &&
    isset($_POST['floors'])) {
        $seller_id = $_COOKIE["uid"];
        $title = $_POST['title'];
        $description = $_POST['description'];
        $cost = $_POST['cost'];
        $type = $_POST['type'];
        $city = $_POST['city'];
        $locality = $_POST['locality'];
        $area = $_POST['area'];
        $bedrooms = $_POST['bedrooms'];
        $floors = $_POST['floors'];
        $created = date('Y-m-d H:i:s');
        global $estate;
        $estate_id = $estate->addEstate($seller_id, $title, $description, $cost, $type, $city, $locality, $area, $bedrooms, $floors, $created);
        header('Location: ?p=estate&id=' . $estate_id);
    }



global $estate, $theme;
$locations = [
    'cities' => $estate->getData('list_cities'),
    'localities' => $estate->getData('list_localities'),
    'types' => $estate->getData('list_types')
];

$theme->assign('locations', $locations);

$theme->display('add-estate.tpl');