<?php
global $estate;

$estate->acceptEstate($_GET['id'], $_COOKIE['uid']);
header('Location: ?p=waiting-deals');
