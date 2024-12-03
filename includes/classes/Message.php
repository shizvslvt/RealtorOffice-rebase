<?php

class Message
{
    public function getMessages($id)
    {
        global $db_controller;
        return $db_controller->getMessages($id);
    }

    public function getMessagesByUserIdAndMonth(mixed $user_id, mixed $month)
    {
        global $db_controller;
        return $db_controller->getMessagesByUserIdAndMonth($user_id, $month);
    }


}