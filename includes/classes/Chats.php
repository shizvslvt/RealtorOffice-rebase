<?php

class Chats
{

    public function displayChats($chat_id = null)
    {
        $c = $_GET['c'] ?? 'buy';
        global $db_controller, $access_level;
        $uid = $_COOKIE['uid'];
        if ($access_level == 2) $c = 'sell';
        $chats = $db_controller->getChatsByUID($uid, $access_level, $c);

        global $theme;

        $theme->assign('c', $c);
        $theme->assign('accessLevel', $access_level);

        $theme->assign('chats', $chats);

        $theme->display('chats.tpl');

        if (isset($chat_id)) {
            global $db_controller;
            return $db_controller->getEstateIdByChatId($chat_id);
        }
    }


    public function displayMessages($id)
    {
        global $theme, $message;
        $theme->assign('chat_id', $id);
        $messages = $message->getMessages($id);
        $theme->assign('uid', $_COOKIE['uid']);
        $theme->assign('c', $_GET['c']);
        $theme->assign('chat_id', $id);
        $theme->assign('messages', $messages);
        $theme->display('messages.tpl');

    }

    public function sendMessage($uid, $chat_id, $message): void
    {
        global $db_controller;
        $db_controller->sendMessage($uid, $chat_id, $message);
    }

    public function createChat($id, $uid)
    {
        global $db_controller;
        return $db_controller->createChat($id, $uid);
    }

    public function getChatsByUserId($user_id) {
        global $db_controller;
        return $db_controller->getChatsByUserId($user_id);
    }

}