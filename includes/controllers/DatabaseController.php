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

    public function checkUserId($id): bool
    {
        global $db;
        $sql = "SELECT id FROM ro_users 
                WHERE id = '$id'";
        $result = $db->query($sql);
        if ($result->num_rows > 0) {
            return true;
        }
        return false;
    }

    public function login($mail, $password)
    {
        global $db;
        $sql = "SELECT id FROM ro_users 
                WHERE password = '$password' AND mail = '$mail' LIMIT 1";
        $result = $db->query($sql);
        if ($result->num_rows > 0) {
            return $result->fetch_assoc()["id"];
        }
        return null;
    }

    public function register($name, $mail, $password, $birthday, $PID)
    {
        global $db;

        $sql_check = "SELECT id FROM ro_users 
                        WHERE mail = '$mail' OR PID = '$PID'";
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

            $sql = "INSERT INTO ro_realtors (id, percent, experience) 
                                    VALUES ('$realtor_id', '$percent', '$experience')";

            return $db->query($sql);
        }

        return false;
    }

    public function getEstateById($estate_id)
    {
        global $db;
        $sql = "SELECT e.id, e.seller_id, e.realtor_id, e.title, e.cost, e.time, 
                    e.description, e.area, e.bedrooms, e.floors,
                       cities.name AS city_name, 
                       localities.name AS locality_name, 
                       types.name AS type_name
                FROM ro_estates AS e
                JOIN list_cities AS cities ON e.city_id = cities.id
                JOIN list_localities AS localities ON e.locality_id = localities.id
                JOIN list_types AS types ON e.type_id = types.id
                WHERE e.id = '$estate_id' LIMIT 1";
        return $db->query($sql)->fetch_assoc();
    }

    public function getEstateForChat($estate_id)
    {
        global $db;
        $sql = "SELECT e.id, e.seller_id, e.realtor_id, e.title, e.cost, e.time, 
                    e.description, e.area, e.bedrooms, e.floors,
                       cities.name AS city_name, 
                       localities.name AS locality_name, 
                       types.name AS type_name
                FROM ro_estates AS e
                JOIN list_cities AS cities ON e.city_id = cities.id
                JOIN list_localities AS localities ON e.locality_id = localities.id
                JOIN list_types AS types ON e.type_id = types.id
                WHERE e.id = '$estate_id' LIMIT 1";
        return $db->query($sql)->fetch_assoc();
    }

    public function getEstatesForAccept()
    {
        global $db;
        $sql = "SELECT e.id, e.seller_id, e.realtor_id, e.title, e.cost, e.time, 
                    e.description, e.area, e.bedrooms, e.floors,
                       cities.name AS city_name, localities.name AS locality_name, types.name AS type_name
                FROM ro_estates AS e
                JOIN list_cities AS cities ON e.city_id = cities.id
                JOIN list_localities AS localities ON e.locality_id = localities.id
                JOIN list_types AS types ON e.type_id = types.id
                WHERE e.accepted IS NULL OR e.realtor_id IS NULL";
        return $db->query($sql);
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
                       cities.name AS city_name, 
                       localities.name AS locality_name, 
                       types.name AS type_name
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

    public function getChatsByUID($uid, $accessLevel, $c)
    {
        if ($accessLevel === 1 && $c === 'buy') {
            $sql = "SELECT e.id AS estate_id, e.title, e.seller_id, e.realtor_id, e.cost, d.buyer_id, d.time, d.id AS chat_id, d.sold
        FROM ro_chats AS d
        JOIN ro_estates AS e WHERE d.estate_id = e.id AND d.buyer_id = '$uid'
        ORDER BY d.time DESC";
        } elseif ($accessLevel === 1 && $c === 'sell') {
            $sql = "SELECT e.id AS estate_id, e.title, e.seller_id, e.realtor_id, e.cost, d.buyer_id, d.time, d.id AS chat_id, d.sold
        FROM ro_chats AS d
        JOIN ro_estates AS e WHERE d.estate_id = e.id AND e.seller_id = '$uid'
        ORDER BY d.time DESC";
        } elseif ($accessLevel === 2 && $c === 'sell') {
            $sql = "SELECT e.id AS estate_id, e.title, e.seller_id, e.realtor_id, e.cost, d.buyer_id, d.time, d.id AS chat_id, d.sold
        FROM ro_chats AS d
        JOIN ro_estates AS e WHERE d.estate_id = e.id AND e.realtor_id = '$uid'
        ORDER BY d.time DESC";
        } else {
            echo "accessLevel: $accessLevel";
            echo "<br> c: $c<br>";
            die("Error in getChatsByUID");
        }
        global $db;
        $result = $db->query($sql);
        $chats = [];
        while ($row = $result->fetch_assoc()) {
            $chats[] = $row;
        }
        return $chats;
    }


    public function getMessages(mixed $id)
    {
        global $db;
        $sql = "SELECT * FROM ro_messages WHERE chat_id = '$id'";
        $result = $db->query($sql);
        $messages = [];
        while ($row = $result->fetch_assoc()) {
            $messages[] = $row;
        }
        return $messages;
    }

    public function sendMessage($uid, $chat_id, $message)
    {
        global $db;
        $time = date("Y-m-d H:i:s");
        $sql = "INSERT INTO ro_messages 
                    (chat_id, user_id, message, time) 
            VALUES ('$chat_id','$uid','$message','$time')";

        $db->query($sql);
    }


    public function addLog($type, $link, $chat_id, $user_id, $desc)
    {
        global $db;
        $time = date("Y-m-d H:i:s");
        $sql = "INSERT INTO ro_logs 
                    (type, link, chat_id, user_id, time, `desc`) 
            VALUES ('$type','$link','$chat_id','$user_id','$time','$desc')";

        $db->query($sql);
    }

    public function getBalance($id)
    {
        global $db;
        $sql = "SELECT balance FROM ro_users WHERE id = '$id'";
        $result = $db->query($sql);
        return $result->fetch_assoc()['balance'];
    }

    public function EditBalance($id, $amount): void
    {
        global $db;
        $sql = "UPDATE ro_users SET balance = balance + $amount WHERE id = '$id'";
        $db->query($sql);
    }

    public function buyEstate($estate_id)
    {
        if (!$this->checkSoldEstate($estate_id)) die("Эта недвижимость была продана.");
        global $db, $user;
        $uid = $_COOKIE['uid'];
        $access_level = $user->getAccessLevel();

        if ($access_level == 1) {
            $check_sql = "SELECT * FROM ro_chats WHERE estate_id = '$estate_id' AND buyer_id = '$uid'";
            $result = $db->query($check_sql);

            if ($result->num_rows == 1) {
                $estate_sql = "SELECT cost, realtor_id, seller_id FROM ro_estates WHERE id = '$estate_id'";
                $estate_result = $db->query($estate_sql);
                $estate = $estate_result->fetch_assoc();
                $chat_id = $this->getChatIdByEstateIdAndUID($estate_id, $uid);

                $cost = $estate['cost'];
                $realtor_id = $estate['realtor_id'];
                $seller_id = $estate['seller_id'];

                $balance = $this->getBalance($uid);

                global $logs;
                if ($balance >= $cost) {
                    $realtor_sql = "SELECT percent FROM ro_realtors WHERE id = '$realtor_id'";
                    $realtor_result = $db->query($realtor_sql);
                    $realtor = $realtor_result->fetch_assoc();

                    $percent = $realtor['percent'];
                    $realtor_balance = $cost * ($percent / 100);
                    $seller_balance = $cost - $realtor_balance;

                    $time = date("Y-m-d H:i:s");

                    $db->begin_transaction();

                    try {
                        $logs->addLog('transaction', '?p=buy-estate&id=' . $estate_id, $chat_id, $uid,
                            "Пользователь $uid начал покупку недвижимости $estate_id стоимостью $cost."
                        );

                        $db->query("UPDATE ro_chats SET sold = '$time' WHERE estate_id = '$estate_id' AND buyer_id = '$uid'");
                        $db->query("UPDATE ro_estates SET archived = 1 WHERE id = '$estate_id'");

                        // Покупатель
                        $prev_balance = $balance;
                        $this->EditBalance($uid, -$cost);
                        $logs->addLog('transaction', '?p=buy-estate&id=' . $estate_id, $chat_id, $uid,
                            "Баланс изменен с $prev_balance на " . ($prev_balance - $cost)
                        );

                        // Риэлтор
                        $realtor_prev_balance = $this->getBalance($realtor_id);
                        $this->EditBalance($realtor_id, $realtor_balance);
                        $logs->addLog('transaction', '?p=buy-estate&id=' . $estate_id, $chat_id, $realtor_id,
                            "Баланс риэлтора $realtor_id изменен с $realtor_prev_balance на " . ($realtor_prev_balance + $realtor_balance)
                        );

                        // Продавец
                        $seller_prev_balance = $this->getBalance($seller_id);
                        $this->EditBalance($seller_id, $seller_balance);
                        $logs->addLog('transaction', '?p=buy-estate&id=' . $estate_id, $chat_id, $seller_id,
                            "Баланс продавца $seller_id изменен с $seller_prev_balance на " . ($seller_prev_balance + $seller_balance)
                        );

                        $logs->addLog('sale', '?p=buy-estate&id=' . $estate_id, $chat_id, $uid,
                            "Недвижимость $estate_id была продана пользователем $seller_id пользователю $uid."
                        );

                        $db->commit();
                    } catch (Exception $e) {
                        $db->rollback();
                        $logs->addLog('error', '?p=buy-estate&id=' . $estate_id, $chat_id, $uid,
                            "Ошибка: " . $e->getMessage()
                        );
                        die("Error: " . $e->getMessage());
                    }
                } else {
                    echo "У вас недостаточно средств для покупки этой недвижимости.";
                    $logs->addLog('error', '?p=buy-estate&id=' . $estate_id, $chat_id, $uid,
                        "У пользователя $uid недостаточно средств для покупки недвижимости $estate_id стоимостью $cost."
                    );
                }
            }
        }
    }


    public function getEstateCost($id)
    {
        global $db;
        $sql = "SELECT cost FROM ro_estates WHERE id = '$id' LIMIT 1";
        $result = $db->query($sql);
        return $result->fetch_assoc()['cost'];
    }

    public function getBuyerIdByEstateIdAndUID($estate_id, mixed $uid)
    {
        global $db;
        $sql = "SELECT buyer_id FROM ro_chats WHERE estate_id = '$estate_id' AND buyer_id = '$uid'";
        $result = $db->query($sql);
        return $result->fetch_assoc();
    }

    public function getChatIdByEstateIdAndUID($estate_id, $uid)
    {
        global $db;
        $sql = "SELECT id FROM ro_chats WHERE estate_id = '$estate_id' AND buyer_id = '$uid'";
        $result = $db->query($sql);
        if ($result->num_rows > 0) return $result->fetch_assoc()['id'];

        return null;
    }

    public function createChat($id, $buyer_id): int
    {
        global $db;
        $time = date("Y-m-d H:i:s");
        $sql = "INSERT INTO ro_chats (estate_id, buyer_id, time) VALUES ('$id', '$buyer_id', '$time')";
        $db->query($sql);
        return $db->insert_id;
    }

    public function checkSoldEstate($id)
    {
        global $db;
        $sql = "SELECT sold FROM ro_chats WHERE estate_id = '$id' AND sold IS NULL LIMIT 1";
        $result = $db->query($sql);
        return $result->num_rows > 0;
    }

    public function getEstateIdByChatId(mixed $chat_id)
    {
        global $db;
        $sql = "SELECT estate_id FROM ro_chats WHERE id = '$chat_id' LIMIT 1";
        $result = $db->query($sql);
        return $result->fetch_assoc()['estate_id'];
    }


}