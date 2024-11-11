<?php

class DatabaseController
{
    public function getArrayRealtorsId(): array
    {
        global $db;
        $arrayRealtorsId = array();
        $sql = "SELECT id FROM ro_realtors";
        $result = $db->query($sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $arrayRealtorsId[] = $row["id"];
            }
        }
        return $arrayRealtorsId;
    }

    public function getAllEstates()
    {
        global $db;
        $sql = "SELECT estate.id, estate.seller_id, estate.realtor_id, estate.title, estate.cost, estate.time, 
                       estate.accepted, estate.archived, ext.description, ext.city_id, ext.locality_id, 
                       ext.type_id, ext.area, ext.bedrooms, ext.floors,
                       cities.name AS city_name, localities.name AS locality_name, types.name AS type_name
                FROM ro_estates AS estate
                JOIN ro_estates_extended_info AS ext ON estate.id = ext.estate_id
                JOIN list_cities AS cities ON ext.city_id = cities.id
                JOIN list_localities AS localities ON ext.locality_id = localities.id
                JOIN list_types AS types ON ext.type_id = types.id
                ORDER BY estate.time DESC";
        $result = $db->query($sql);
        $estates = [];

        while ($row = $result->fetch_assoc()) {
            $estates[] = $row;
        }

        return $estates;
    }

    public function checkUserId($id): bool
    {
        global $db;
        $sql = "SELECT id FROM ro_users WHERE id = '$id'";
        $result = $db->query($sql);
        if ($result->num_rows > 0) {
            return true;
        }
        return false;
    }

    public function login($mail, $password)
    {
        global $db;
        $sql = "SELECT id FROM ro_users WHERE password = '$password' AND mail = '$mail' LIMIT 1";
        $result = $db->query($sql);
        if ($result->num_rows > 0) {
            return $result->fetch_assoc()["id"];
        }
        return null;
    }

    public function register($name, $mail, $password, $birthday, $PID)
    {
        global $db;

        $sql_check = "SELECT id FROM ro_users WHERE mail = '$mail' OR PID = '$PID'";
        if (($db->query($sql_check))->num_rows > 0) return false;

        $balance = 0;
        $time = date('Y-m-d H:i:s');

        $sql = "INSERT INTO ro_users (name, mail, password, birthday, PID, balance, time) 
            VALUES ('$name', '$mail', '$password', '$birthday', '$PID', '$balance', '$time')";

        return $db->query($sql);
    }

    public function registerRealtor($name, $mail, $password, $birthday, $PID, $experience)
    {
        global $db;

        if ($this->register($name, $mail, $password, $birthday, $PID)) {
            $realtor_id = $db->insert_id;

            $percent = 2.5 + (floor((time() - strtotime($experience)) / (60 * 60 * 24 * 365.25))) * 1.5;

            $sql = "INSERT INTO ro_realtors (id, percent, experience) VALUES ('$realtor_id', '$percent', '$experience')";

            return $db->query($sql);
        }

        return false;
    }

    public function getEstate($estate_id)
    {
        global $db;
        $sql = "SELECT estate.id, estate.seller_id, estate.realtor_id, estate.title, estate.cost, estate.time, 
                       estate.accepted, estate.archived, ext.description, ext.city_id, ext.locality_id, 
                       ext.type_id, ext.area, ext.bedrooms, ext.floors,
                       cities.name AS city_name, localities.name AS locality_name, types.name AS type_name
                FROM ro_estates AS estate
                JOIN ro_estates_extended_info AS ext ON estate.id = ext.estate_id
                JOIN list_cities AS cities ON ext.city_id = cities.id
                JOIN list_localities AS localities ON ext.locality_id = localities.id
                JOIN list_types AS types ON ext.type_id = types.id
                WHERE estate.id = '$estate_id' LIMIT 1";
        $result = $db->query($sql);
        return $result->fetch_assoc();
    }

    public function acceptEstate($id, $realtor_id)
    {
        global $db;
        $time = date('Y-m-d H:i:s');
        $sql = "UPDATE ro_estates SET accepted = $time, realtor_id = '$realtor_id' WHERE id = '$id'";
        return $db->query($sql);
    }

    public function displayRealtorWaitingDealsEstates($realtor_id): array
    {
        global $db;
        $sql = "SELECT estate.id, estate.seller_id, estate.realtor_id, estate.title, estate.cost, estate.time, 
                       estate.accepted, estate.archived, ext.description, ext.city_id, ext.locality_id, 
                       ext.type_id, ext.area, ext.bedrooms, ext.floors,
                       cities.name AS city_name, localities.name AS locality_name, types.name AS type_name
                FROM ro_estates AS estate
                JOIN ro_estates_extended_info AS ext ON estate.id = ext.estate_id
                JOIN list_cities AS cities ON ext.city_id = cities.id
                JOIN list_localities AS localities ON ext.locality_id = localities.id
                JOIN list_types AS types ON ext.type_id = types.id
                WHERE estate.realtor_id = '$realtor_id' AND estate.accepted IS NOT NULL AND estate.archived = 0";
        $result = $db->query($sql);
        $estates = [];
        while ($row = $result->fetch_assoc()) {
            $estates[] = $row;
        }
        return $estates;
    }

}