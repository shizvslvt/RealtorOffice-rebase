<?php

class Chats
{


    public function displayChats()
    {
        global $theme, $db_controller, $user;

        $uid = $_COOKIE['uid'];
        $accessLevel = $user->getAccessLevel();

        // Проверяем, на какую страницу хочет попасть пользователь
        $c = $_GET['c'] ?? 'buy';

        // Если у пользователя уровень доступа 2 (риелтор), перенаправляем на страницу sell
        if ($accessLevel === 2) {
            $c = 'sell';
        }

        // Получаем все чаты
        $chats = $db_controller->getChats();

        // Логика отображения для страницы "buy"
        if ($c === 'buy') {
            // Доступ к странице "buy" только для пользователей с уровнем 1
            if ($accessLevel !== 1) {
                die("Access Denied");
            }
            // Фильтруем чаты для покупателя
            $filteredChats = array_filter($chats, function ($chat) use ($uid) {
                return $chat['buyer_id'] == $uid;
            });

        } elseif ($c === 'sell') {
            // Страница "sell" доступна для пользователей с уровнями 1 и 2
            if ($accessLevel === 1) {
                // Уровень 1: чаты для продавца
                $filteredChats = array_filter($chats, function ($chat) use ($uid) {
                    return $chat['seller_id'] == $uid;
                });
            } elseif ($accessLevel === 2) {
                // Уровень 2: чаты для риелтора
                $filteredChats = array_filter($chats, function ($chat) use ($uid) {
                    return $chat['realtor_id'] == $uid;
                });
            } else {
                die("Access Denied");
            }

        } else {
            // Если страница не распознана
            die("Page Not Found");
        }

        // Передача данных в шаблон
        $theme->assign('c', $c);
        $theme->assign('chats', $filteredChats);
        $theme->assign('accessLevel', $accessLevel); // Передаем уровень доступа
        $theme->display('chats.tpl');
    }


}