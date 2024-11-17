<?php


class Estate
{

    public function displayHomePageEstates(): void
    {
        global $theme, $db_controller;
        $estates = $db_controller->getHomePageEstates();
        echo '<div class="estates-grid">';
        foreach ($estates as $estate) {
            $theme->assign("status", "home");
            $theme->assign('estate', $estate);
            $theme->display('estate.tpl');
        }
        echo '</div>';
    }

    public function displayEstate($estate_id): void
    {
        global $theme, $db_controller, $user;
        $estate = $db_controller->getEstateById($estate_id);
        $access_level = $user->getAccessLevel();
        if ($access_level == 1) {
            $chat_id = $db_controller->getChatIdByEstateIdAndUID($estate_id, $_COOKIE['uid']);
            $theme->assign('chat_id', $chat_id);
            $theme->assign("status", "by-id");
        } elseif ($access_level == 2) {
            $theme->assign('status', 'realtor');
        }

        $theme->assign('estate', $estate);
        echo '<div class="estates-grid-single">';
        $theme->display('estate.tpl');
        echo '</div>';
    }

    public function displayEstatesForAccept(): void
    {
        global $theme, $db_controller;
        $estates = $db_controller->getEstatesForAccept();
        echo '<div class="estates-grid">';
        foreach ($estates as $estate) {
            $theme->assign("status", "for-accept");
            $theme->assign('estate', $estate);
            $theme->display('estate.tpl');
        }
        echo '</div>';

    }

    public function acceptEstate($id, $realtor_id): void
    {
        global $db_controller;
        $db_controller->acceptEstate($id, $realtor_id);
    }

    public function displayRealtorWaitingDealsEstates($realtor_id): void
    {
        global $theme, $db_controller;
        $estates = $db_controller->displayRealtorWaitingDealsEstates($realtor_id);
        echo '<div class="estates-grid">';
        foreach ($estates as $estate) {
            $theme->assign("status", "waiting-deals");
            $theme->assign('estate', $estate);
            $theme->display('estate.tpl');
        }
        echo '</div>';
    }

    public function displayEstateForChat($estate_id): void
    {
        echo '<div class="estate-container">';
        echo '<div class="estate-container-title">Estate</div>';
        global $theme, $db_controller;
        $estate = $db_controller->getEstateForChat($estate_id);
        $theme->assign("status", "buy");
        $theme->assign('buyer', $db_controller->getBuyerIdByEstateIdAndUID($estate_id, $_COOKIE['uid']));
        $theme->assign('estate', $estate);
        $checksold = $db_controller->checkSoldEstate($estate_id);
        $theme->assign('checksold', $checksold);
        $theme->display('estate.tpl');
        echo '</div>';
        echo '</div>';
    }

    public function buyEstate($estate_id)
    {
        global $db_controller;
        $db_controller->buyEstate($estate_id);
    }

    public function getEstateCost(mixed $id)
    {
        global $db_controller;
        return $db_controller->getEstateCost($id);
    }

    public function checkSoldEstate(mixed $id)
    {
        global $db_controller;
        return $db_controller->checkSoldEstate($id);
    }
}

