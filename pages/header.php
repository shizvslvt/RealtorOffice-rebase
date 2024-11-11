<?php
global $theme, $user;

$theme->assign('access_level', $user->getAccessLevel());
$theme->display('header.tpl');