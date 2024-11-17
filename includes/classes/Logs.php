<?php
class Logs
{
    public function addLog($type, $link = null, $chat_id = null, $user_id = null, $desc = null)
    {
        global $db_controller;
        $db_controller->addLog($type, $link, $chat_id, $user_id, $desc);
    }
}

