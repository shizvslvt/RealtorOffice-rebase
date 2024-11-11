<?php



class Estate {

    private array $all_estates = [];
    public function displayEstatesAcceptedAndActivated(): void
    {
        global $theme, $db_controller;
        $this->all_estates = $db_controller->getAllEstates();
        echo '<div class="estates-grid">';
        foreach ($this->all_estates as $estate) {
            if ($estate['accepted'] != null && $estate['archived'] == 0) {
                    $theme->assign("status", "activated");
                    $theme->assign('estate', $estate);
                    $theme->display('estate.tpl');
                }
            }
        echo '</div>';
    }
    public function displayEstate($estate_id): void
    {
        global $theme, $db_controller;
        $estate = $db_controller->getEstate($estate_id);
        echo '<div class="estates-grid">';
        $theme->assign("status", "by-id");
        $theme->assign('estate', $estate);
        $theme->display('estate.tpl');
        echo '</div>';
    }
    public function displayEstatesForAccept(): void
    {
        global $theme, $db_controller;
        $this->all_estates = $db_controller->getAllEstates();
        echo '<div class="estates-grid">';
        foreach ($this->all_estates as $estate) {
            if($estate['accepted'] == null && $estate['archived'] == 0) {
            $theme->assign("status", "for-accept");
            $theme->assign('estate', $estate);
            $theme->display('estate.tpl');
            }
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
        $this->all_estates = $db_controller->displayRealtorWaitingDealsEstates($realtor_id);
        echo '<div class="estates-grid">';
        foreach ($this->all_estates as $estate) {
                $theme->assign("status", "waiting-deals");
                $theme->assign('estate', $estate);
                $theme->display('estate.tpl');

        }
        echo '</div>';
    }
}
