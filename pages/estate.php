<?php

if(!isset($_GET['id'])) die("null 'id' in url");

global $estate;
$estate->displayEstate($_GET['id']);


