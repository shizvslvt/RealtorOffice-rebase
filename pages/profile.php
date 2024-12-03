<?php
global $user;
echo 'Balance: '. $user->getBalance($_COOKIE['uid']);
echo '<br>';

global $estate;

echo '<div class="profile">';