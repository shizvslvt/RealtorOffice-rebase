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

    public function getHomePageEstates(): array
    {
        global $db;
        $sql = "SELECT e.id, e.title, e.cost, e.time, 
                       e.description,
                       cities.name AS city_name,  types.name AS type_name
                FROM ro_estates AS e
                JOIN list_cities AS cities ON e.city_id = cities.id
                JOIN list_types AS types ON e.type_id = types.id
                WHERE e.accepted IS NOT NULL AND e.archived = 0
                ORDER BY e.time DESC";
        $result = $db->query($sql);
        $estates = [];
        while ($row = $result->fetch_assoc()) {
            $estates[] = $row;
        }
        return $estates;
    }

    public function getAllEstates()
    {
        global $db;
        $sql = "SELECT e.id, e.seller_id, e.realtor_id, e.title, e.cost, e.time, 
                       e.accepted, e.archived, e.description, e.city_id, e.locality_id, 
                       e.type_id, e.area, e.bedrooms, e.floors,
                       cities.name AS city_name, localities.name AS locality_name, types.name AS type_name
                FROM ro_estates AS e
                JOIN list_cities AS cities ON e.city_id = cities.id
                JOIN list_localities AS localities ON e.locality_id = localities.id
                JOIN list_types AS types ON e.type_id = types.id
                ORDER BY e.time DESC";
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

            //$percent = 2.5 + (floor((time() - strtotime($experience)) / (60 * 60 * 24 * 365.25))) * 1.5;
            $percent = 2.5;

            $sql = "INSERT INTO ro_realtors (id, percent, experience) VALUES ('$realtor_id', '$percent', '$experience')";

            return $db->query($sql);
        }

        return false;
    }

    public function getEstate($estate_id)
    {
        global $db;
        $sql = "SELECT e.id, e.seller_id, e.realtor_id, e.title, e.cost, e.time, 
                    e.description, e.area, e.bedrooms, e.floors,
                       cities.name AS city_name, localities.name AS locality_name, types.name AS type_name
                FROM ro_estates AS e
                JOIN list_cities AS cities ON e.city_id = cities.id
                JOIN list_localities AS localities ON e.locality_id = localities.id
                JOIN list_types AS types ON e.type_id = types.id
                WHERE e.id = '$estate_id' LIMIT 1";
        $result = $db->query($sql);
        return $result->fetch_assoc();
    }

    public function acceptEstate($id, $realtor_id): void
    {
        global $db;
        $time = date('Y-m-d H:i:s');
        $sql = "UPDATE ro_estates SET accepted = $time, realtor_id = '$realtor_id' WHERE id = '$id'";
        $db->query($sql);
    }

    public function displayRealtorWaitingDealsEstates($realtor_id): array
    {
        global $db;
        $sql = "SELECT e.id, e.seller_id, e.realtor_id, e.title, e.cost, e.time, 
                    e.description, e.area, e.bedrooms, e.floors,
                       cities.name AS city_name, localities.name AS locality_name, types.name AS type_name
                FROM ro_estates AS e
                JOIN list_cities AS cities ON e.city_id = cities.id
                JOIN list_localities AS localities ON e.locality_id = localities.id
                JOIN list_types AS types ON e.type_id = types.id
                WHERE e.realtor_id = '$realtor_id' AND e.accepted IS NOT NULL AND e.archived = 0";
        $result = $db->query($sql);
        $estates = [];
        while ($row = $result->fetch_assoc()) {
            $estates[] = $row;
        }
        return $estates;
    }

    public function getChats()
    {
        global $db;
        $sql = "SELECT e.id AS estate_id, e.title, e.seller_id,
       e.realtor_id, e.cost, d.buyer_id, d.time, d.id AS deal_id, d.sold
        FROM ro_estates_deals AS d
        JOIN ro_estates AS e WHERE d.estate_id = e.id";
        $result = $db->query($sql);
        $chats = [];
        while ($row = $result->fetch_assoc()) {
            $chats[] = $row;
        }
        return $chats;
    }


}