<?php

class Realtor
{

    public function getArrayRealtorsId()
    {
        global $db_controller;
        return $db_controller->getArrayRealtorsId();
    }

    public function selectTopRealtorsByYear($year = 2023)
    {
        global $db_controller;
        return $db_controller->selectTopRealtorsByYear($year);
    }

    public function selectTopRealtorsByBetweenDates($start_date, $finish_date)
    {
        global $db_controller;
        return $db_controller->selectTopRealtorsByBetweenDates($start_date, $finish_date);
    }

    public function selectRealtor()
    {
        global $db_controller;
        return $db_controller->selectRealtor();
    }

    public function selectRealtorById($id)
    {
        global $db_controller;
        return $db_controller->selectRealtorById($id);
    }

    public function updateRealtor($id, $name, $mail, $percent, $experience, $balance, $time)
    {
        global $db_controller;
        return $db_controller->updateRealtor($id, $name, $mail, $percent, $experience, $balance, $time);
    }
}