<?php

class ControlPanel
{

    public function selectLogs()
    {
        global $log, $theme;
        $logs = $log->selectLogs();
        $theme->assign('logs', $logs);
    }

    public function selectRealtors()
    {
        global $realtor, $theme;

        if (isset($_GET['a']) && $_GET['a'] == 'edit') {
            if (isset($_GET['id'])) {
                if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    $name = $_POST['name'];
                    $mail = $_POST['mail'];
                    $percent = $_POST['percent'];
                    $experience = $_POST['experience'];
                    $balance = $_POST['balance'];
                    $time = $_POST['time'];
                    $realtor->updateRealtor($_GET['id'], $name, $mail, $percent, $experience, $balance, $time);
                } else {
                    $theme->assign('realtor', $realtor->selectRealtorById($_GET['id']));
                    $theme->display('edit-realtor-panel.tpl');
                }
            }
        }
        $realtors = $realtor->selectRealtor();
        $theme->assign('realtors', $realtors);
    }

    public function selectEstates()
    {
        global $estate, $theme;
        $estates = $estate->selectEstates();
        $theme->assign('estates', $estates);
    }

    public function selectUsers()
    {
        global $user, $theme;
        $users = $user->selectUsers();
        $theme->assign('users', $users);
    }

    public function selectTopRealtors()
    {
        $realtors_by_year = [];
        $realtors_between_dates = [];
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            switch ($_GET['a']) {
                case 'year':
                    $year = $_POST['year'];
                    global $realtor;
                    $realtors_by_year = $realtor->selectTopRealtorsByYear($year);
                    break;
                case 'between-dates':
                    $start_date = $_POST['start_date'];
                    $finish_date = $_POST['finish_date'];
                    global $realtor;
                    $realtors_between_dates = $realtor->selectTopRealtorsByBetweenDates($start_date, $finish_date);
                    break;
            }
        }
        if (!isset($year)) $year = date('Y');
        if (!isset($start_date)) $start_date = date('Y-m-d');
        if (!isset($finish_date)) $finish_date = date('Y-m-d');

        global $theme;
        $theme->assign('year', $year);
        $theme->assign('start_date', $start_date);
        $theme->assign('finish_date', $finish_date);
        $theme->assign('realtors_by_year', $realtors_by_year);
        $theme->assign('realtors_between_dates', $realtors_between_dates);
    }

    public function getMessagesByUserIdAndMonth()
    {
        $messages = [];
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            global $message;
            $user_id = $_POST['user_id'];
            $month = $_POST['month'];
            $messages = $message->getMessagesByUserIdAndMonth($user_id, $month);
        }
        if (!isset($user_id)) $user_id = 1;
        if (!isset($month)) $month = date('m');
        global $theme;
        $theme->assign('user_id', $user_id);
        $theme->assign('month', $month);
        $theme->assign('messages', $messages);
    }

    public function getEstatesStatistics()
    {

        $estates_by_type = [];
        $estates_by_type_with_max_area = [];

        global $estate;
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    $type = $_POST['type'];
                    $estates_by_type = $estate->selectEstatesByType($type);
                    $estates_by_type_with_max_area = $estate->selectEstatesByTypeWithMaxArea($type);
        }
        if (!isset($type)) $type = 1;


        global $theme;
        $types =  $estate->getData('list_types');
        $theme->assign('types', $types);
        $theme->assign('type', $type);
        $theme->assign('estates_by_type', $estates_by_type);
        $theme->assign('estates_by_type_with_max_area', $estates_by_type_with_max_area);

    }

    public function getChatsByUserId()
    {
        $chats = [];
        global $chats;
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $user_id = $_POST['user_id'];
            $chats = $chats->getChatsByUserId($user_id);
        }
        if (!isset($user_id)) $user_id = 1;
        global $theme;
        $theme->assign('user_id', $user_id);
        $theme->assign('chats', $chats);
    }
}