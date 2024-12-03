<?php
global $access_level;
if ($access_level != 3) die("You don't have access to this page");
global $theme;
$theme->display('control-panel.tpl');

$content = $_GET['c'] ?? 'logs-panel';

global $control_panel;

switch ($content) {
    case 'logs-panel':
        $control_panel->selectLogs();
        break;
    case 'realtors-panel':
        $control_panel->selectRealtors();
        break;
    case 'estates-panel':
        $control_panel->selectEstates();
        break;
    case 'users-panel':
        $control_panel->selectUsers();
        break;
    case 'top-realtors-panel':
        $control_panel->selectTopRealtors();
        break;
    case 'messages-users-panel':
        $control_panel->getMessagesByUserIdAndMonth();
        break;
    case 'estates-statistics-panel':
        $control_panel->getEstatesStatistics();
        break;
    case 'chats-users-panel':
        $control_panel->getChatsByUserId();
        break;
}
echo "<div class='control-panel-content'>";
$theme->display($content . '.tpl');
echo "</div>";


