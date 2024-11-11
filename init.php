<?php
include_once 'includes/ErrorHandler.php';

// ---------------------------------------------------
//  Directories
// ---------------------------------------------------
define('ROOT', dirname(__FILE__) . "/");
const INCLUDES_PATH = ROOT . '/includes';
const CLASSES_PATH = INCLUDES_PATH . '/classes';
const CONTROLLERS_PATH = INCLUDES_PATH . '/controllers';
const USER_DATA = ROOT . "/data";
const PAGES_PATH = ROOT . '/pages';
const SMARTY_TEMPLATES_PATH = ROOT . '/templates';
const SMARTY_TEMPLATES_COMPILE_PATH = ROOT . '/templates_c';

// ---------------------------------------------------
//  DATABASE
// ---------------------------------------------------
require_once USER_DATA . '/db.php';


// ---------------------------------------------------
// classes
// ---------------------------------------------------
require_once CLASSES_PATH . '/Theme.php';
require_once CLASSES_PATH . '/Auth.php';
require_once CLASSES_PATH . '/User.php';
require_once CLASSES_PATH . '/Realtor.php';
require_once CLASSES_PATH . '/Estate.php';
require_once CONTROLLERS_PATH . '/DatabaseController.php';


// ---------------------------------------------------
// GLOBALS and setup classes
// ---------------------------------------------------
global $theme, $auth, $user, $realtors, $db_controller, $admins_id;

$theme = Theme::templater();


$user = new User();
$auth = new Auth();
$realtors = new Realtor();
$estate = new Estate();

$db_controller = new DatabaseController();

$admins_id = array('1', '23');


