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
        global $theme, $db_controller, $access_level;
        $estate = $db_controller->getEstateById($estate_id);
        if(!$estate) die("Estate not found");
        $status = 'none';
        if ($access_level == 1) {
            $chat_id = $db_controller->getChatIdByEstateIdAndUID($estate_id, $_COOKIE['uid']);
            $theme->assign('chat_id', $chat_id);
            $status = 'by-id';
        } elseif ($access_level == 2) {
            $status = 'realtor';
        }
        if($db_controller->checkSoldEstate($estate_id)) $status = 'sold';

        $theme->assign('estate', $estate);
        $theme->assign('status', $status);
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
        $check_sold = $db_controller->checkSoldEstate($estate_id);
        $theme->assign('checksold', $check_sold);
        $theme->display('estate.tpl');
        echo '</div>';
        echo '</div>';
    }

    public function buyEstate($estate_id)
    {
        global $db_controller;
        $db_controller->buyEstate($estate_id);
    }

    public function getEstateCost($id)
    {
        global $db_controller;
        return $db_controller->getEstateCost($id);
    }

    public function checkSoldEstate($id)
    {
        global $db_controller;
        return $db_controller->checkSoldEstate($id);
    }

    public function checkEstateAccessLevelForBuyer($id)
    {
        global $db_controller;
        return $db_controller->checkEstateAccessLevelForBuyer($id);
    }

    public function selectEstates()
    {
        global $db_controller;
        return $db_controller->selectEstates();
    }

    public function getData($string)
    {
        global $db_controller;
        return $db_controller->getData($string);
    }

    public function addEstate($seller_id, $title, $description, $cost, $type, $city, $locality, $area, $bedrooms, $floors, $created)
    {
        global $db_controller;
        $db_controller->addEstate($seller_id, $title, $description, $cost, $type, $city, $locality, $area, $bedrooms, $floors, $created);
    }

    public function selectEstatesByType(mixed $type)
    {
        global $db_controller;
        return $db_controller->selectEstatesByType($type);
    }

    public function selectEstatesByTypeWithMaxArea(mixed $type)
    {
        global $db_controller;
        return $db_controller->selectEstatesByTypeWithMaxArea($type);
    }
}

