<?php
global $db;
$servername = "localhost";
$username = "root";
$password = "";
$database = "realtor_office";


$db = mysqli_connect($servername, $username, $password, $database);
if (!$db) die("Connection failed: " . mysqli_connect_error());