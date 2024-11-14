<?php
global $theme, $access_level;

$theme->assign('access_level', $access_level);
$theme->display('header.tpl');