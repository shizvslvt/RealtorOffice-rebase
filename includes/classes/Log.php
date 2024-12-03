<?php
class Log
{
    public function addLog($type, $link = null, $chat_id = null, $user_id = null, $desc = null, $amount = null)
    {
        global $db_controller;
        $db_controller->addLog($type, $link, $chat_id, $user_id, $desc, $amount);
    }

    public function selectLogs()
    {
        global $db_controller;
        return $db_controller->selectLogs();
    }
}

