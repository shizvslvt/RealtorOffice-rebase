<?php
if (!isset($_COOKIE['uid'])) die("Unauthorized");


global $chats;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $uid = $_POST['user_id'];
    $chat_id = $_POST['chat_id'];
    $message = $_POST['message'];
    $chats->sendMessage($uid, $chat_id, $message);
    header('Location: ?p=chats&c='. $_GET['c'] . '&id=' . $chat_id);
} elseif (isset($_GET['a']) && $_GET['a'] == 'create-chat') {
    global $estate;
    if($estate->checkEstateAccessLevelForBuyer($_GET['id'])) die('dont have access');
    $chat_id = $chats->createChat($_GET['id'], $_COOKIE['uid']);
    header('Location: ?p=chats&id=' . $chat_id);
}elseif (!isset($_GET['id'])) {
    $chats->displayChats();
} else {
    $estate_id = $chats->displayChats($_GET['id']);
    $chats->displayMessages($_GET['id']);
    global $estate;
    $estate->displayEstateForChat($estate_id);
}