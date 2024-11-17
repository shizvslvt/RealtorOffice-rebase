<?php
global $user;
echo 'Balance: '. $user->getBalance($_COOKIE['uid']);