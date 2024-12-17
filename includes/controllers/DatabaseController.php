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
                JOIN ro_chats AS c ON e.id = c.estate_id
                WHERE e.accepted IS NOT NULL AND e.archived = 0 AND c.sold IS NULL
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
                       types.name AS type_name,
                       e.city_id, e.locality_id,e.type_id, e.archived
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
        ORDER BY d.sold , d.time DESC";
        } elseif ($accessLevel === 1 && $c === 'sell') {
            $sql = "SELECT e.id AS estate_id, e.title, e.seller_id, e.realtor_id, e.cost, d.buyer_id, d.time, d.id AS chat_id, d.sold
        FROM ro_chats AS d
        JOIN ro_estates AS e WHERE d.estate_id = e.id AND e.seller_id = '$uid'
        ORDER BY d.sold , d.time DESC";
        } elseif ($accessLevel === 2 && $c === 'sell') {
            $sql = "SELECT e.id AS estate_id, e.title, e.seller_id, e.realtor_id, e.cost, d.buyer_id, d.time, d.id AS chat_id, d.sold
        FROM ro_chats AS d
        JOIN ro_estates AS e WHERE d.estate_id = e.id AND e.realtor_id = '$uid'
        ORDER BY d.sold, d.time DESC";
        } else {
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


    public function getMessages($id)
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


    public function addLog($type, $link, $chat_id, $user_id, $desc, $amount)
    {
        global $db;
        $time = date("Y-m-d H:i:s");
        $sql = "INSERT INTO ro_logs 
                    (type, link, chat_id, user_id, `desc`, amount, time) 
            VALUES ('$type','$link','$chat_id','$user_id','$desc','$amount','$time')";

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
        global $db, $access_level;
        $uid = $_COOKIE['uid'];

        if ($access_level == 1) {
            $check_sql = "SELECT * FROM ro_chats WHERE estate_id = '$estate_id' AND buyer_id = '$uid'";
            $result = $db->query($check_sql);

            if ($result->num_rows == 1) {
                $estate_sql = "SELECT cost, realtor_id, seller_id FROM ro_estates WHERE id = '$estate_id'";
                $estate_result = $db->query($estate_sql);
                $estate = $estate_result->fetch_assoc();
                $chat_id = $this->getChatIdByEstateIdAndUID($estate_id, $uid);

                $estate_cost = $estate['cost'];
                $realtor_id = $estate['realtor_id'];
                $seller_id = $estate['seller_id'];

                $buyer_balance = $this->getBalance($uid);

                global $log;
                if ($buyer_balance >= $estate_cost) {
                    $realtor_sql = "SELECT percent FROM ro_realtors WHERE id = '$realtor_id'";
                    $realtor_result = $db->query($realtor_sql);
                    $realtor = $realtor_result->fetch_assoc();

                    $percent = $realtor['percent'];
                    $realtor_tax = $estate_cost * ($percent / 100);
                    $seller_part = $estate_cost - $realtor_tax;

                    $time = date("Y-m-d H:i:s");
                    $db->begin_transaction();

                    try {
                        $log->addLog('transaction', '?p=buy-estate&id=' . $estate_id, $chat_id, $uid,
                            "Пользователь $uid начал покупку недвижимости $estate_id стоимостью $estate_cost.", $estate_cost
                        );

                        $db->query("UPDATE ro_chats SET sold = '$time' WHERE estate_id = '$estate_id' AND buyer_id = '$uid'");
                        $db->query("UPDATE ro_estates SET archived = 1 WHERE id = '$estate_id'");

                        // Покупатель
                        $prev_balance = $buyer_balance;
                        $this->EditBalance($uid, -$estate_cost);
                        $log->addLog('transaction', '?p=buy-estate&id=' . $estate_id, $chat_id, $uid,
                            "Баланс покупателя $uid изменен с $prev_balance на " . ($prev_balance - $estate_cost), $estate_cost
                        );

                        // Риэлтор
                        $realtor_prev_balance = $this->getBalance($realtor_id);
                        $this->EditBalance($realtor_id, $realtor_tax);
                        $log->addLog('transaction', '?p=buy-estate&id=' . $estate_id, $chat_id, $realtor_id,
                            "Баланс риэлтора $realtor_id изменен с $realtor_prev_balance на " . ($realtor_prev_balance + $realtor_tax),
                            $realtor_tax
                        );

                        // Продавец
                        $seller_prev_balance = $this->getBalance($seller_id);
                        $this->EditBalance($seller_id, $seller_part);
                        $log->addLog('transaction', '?p=buy-estate&id=' . $estate_id, $chat_id, $seller_id,
                            "Баланс продавца $seller_id изменен с $seller_prev_balance на " . ($seller_prev_balance + $seller_part),
                            $seller_part
                        );

                        $log->addLog('sale', '?p=buy-estate&id=' . $estate_id, $chat_id, $uid,
                            "Недвижимость $estate_id была продана пользователем $seller_id пользователю $uid.",
                            $estate_cost
                        );

                        $db->commit();
                    } catch (Exception $e) {
                        $db->rollback();
                        $log->addLog('error', '?p=buy-estate&id=' . $estate_id, $chat_id, $uid,
                            "Ошибка: " . $e->getMessage(), null
                        );
                        die("Error: " . $e->getMessage());
                    }
                } else {
                    $log->addLog('error', '?p=buy-estate&id=' . $estate_id, $chat_id, $uid,
                        "У пользователя $uid недостаточно средств для покупки недвижимости $estate_id стоимостью $estate_cost.",
                        $buyer_balance
                    );
                    die("У вас недостаточно средств для покупки этой недвижимости.");
                }
            }
        }
        header('Location: ?p=buy-estate&id=' . $estate_id);
    }


    public function getEstateCost($id)
    {
        global $db;
        $sql = "SELECT cost FROM ro_estates WHERE id = '$id' LIMIT 1";
        $result = $db->query($sql);
        return $result->fetch_assoc()['cost'];
    }

    public function getBuyerIdByEstateIdAndUID($estate_id, $uid)
    {
        global $db;
        $sql = "SELECT 1 FROM ro_chats WHERE estate_id = '$estate_id' AND buyer_id = '$uid'";
        $result = $db->query($sql);
        return $result->fetch_assoc();
    }

    public function getChatIdByEstateIdAndUID($estate_id, $uid)
    {
        global $db;
        $sql = "SELECT id FROM ro_chats WHERE estate_id = '$estate_id' AND buyer_id = '$uid'";
        $result = $db->query($sql);
        if ($result->num_rows > 0) return $result->fetch_assoc();

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
        $sql = "SELECT sold FROM ro_chats WHERE estate_id = '$id' AND sold IS NOT NULL LIMIT 1";
        $result = $db->query($sql);
        return $result->num_rows > 0;
    }

    public function getEstateIdByChatId($chat_id)
    {
        global $db;
        $sql = "SELECT estate_id FROM ro_chats WHERE id = '$chat_id' LIMIT 1";
        $result = $db->query($sql);
        return $result->fetch_assoc()['estate_id'];
    }

    public function checkEstateAccessLevelForBuyer($id)
    {
        global $db, $access_level;

        if ($access_level != 1) return true;
        $uid = $_COOKIE['uid'];
        $sql = "
        SELECT * FROM ro_estates AS e WHERE e.seller_id = '$uid' AND e.id = '$id' LIMIT 1;
        ";
        return $db->query($sql)->num_rows > 0;
    }

    public function selectLogs()
    {
        global $db;
        $query = "SELECT * FROM ro_logs";
        $result = $db->query($query);
        $logs = array();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $logs[] = $row;
            }
        }
        return $logs;
    }

    public function selectTopRealtorsByYear($year)
    {
        global $db;
        $query = "SELECT
	                r.id,
	                u.`name`,
	                COUNT(*) AS count,
	                $year AS year
                FROM ro_realtors AS r
                JOIN ro_users AS u ON r.id = u.id
                JOIN ro_estates AS e ON e.realtor_id = r.id
                JOIN ro_chats AS c ON c.estate_id = e.id AND YEAR(c.sold) = '$year'
                GROUP BY r.id
                HAVING
	                count = (
		                        SELECT
			                        MAX(TotalSales)
		                        FROM
			                    (SELECT
				                    COUNT(*) AS TotalSales
			                    FROM ro_realtors AS r1
			                    JOIN ro_users AS u1 ON r1.id = u1.id
			                    JOIN ro_estates AS e1 ON e1.realtor_id = r1.id
			                    JOIN ro_chats AS c1 ON c1.estate_id = e1.id AND YEAR(c1.sold) = '$year'
			                    GROUP BY r1.id
			                    ) AS MaxResult
	                        );";
        $result = $db->query($query);
        $realtors = array();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $realtors[] = $row;
            }
        }
        return $realtors;
    }

    public function selectTopRealtorsByBetweenDates($start_date, $finish_date)
    {
        global $db;
        $query = "SELECT
	                r.id,
	                u.`name`,
	                COUNT(*) AS count,
	                '$start_date' AS start_date,
                    '$finish_date' AS finish_date
                FROM ro_realtors AS r
                JOIN ro_users AS u ON r.id = u.id
                JOIN ro_estates AS e ON e.realtor_id = r.id
                JOIN ro_chats AS c ON c.estate_id = e.id AND c.sold BETWEEN '$start_date' AND '$finish_date'
                GROUP BY r.id
                HAVING
	                count = (
		                        SELECT
			                        MAX(TotalSales)
		                        FROM
			                    (SELECT
				                    COUNT(*) AS TotalSales
			                    FROM ro_realtors AS r1
			                    JOIN ro_users AS u1 ON r1.id = u1.id
			                    JOIN ro_estates AS e1 ON e1.realtor_id = r1.id
			                    JOIN ro_chats AS c1 ON c1.estate_id = e1.id AND c1.sold BETWEEN '$start_date' AND '$finish_date'
			                    GROUP BY r1.id
			                    ) AS MaxResult
	                        );";
        $result = $db->query($query);
        $realtors = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $realtors[] = $row;
            }
        }
        return $realtors;
    }

    public function selectRealtor()
    {
        global $db;
        $query = "SELECT 
                r.id, u.`name`, u.mail, r.percent, r.experience, u.balance, u.time
                FROM 
                ro_realtors AS r
                JOIN ro_users AS u ON r.id = u.id";
        $result = $db->query($query);
        $realtors = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $realtors[] = $row;
            }
        }
        return $realtors;
    }

    public function selectRealtorById(mixed $id)
    {
        global $db;
        $query = "SELECT 
                r.id, u.`name`, u.mail, r.percent, r.experience, u.balance, u.time
                FROM 
                ro_realtors AS r
                JOIN ro_users AS u ON r.id = u.id
                WHERE r.id = $id";
        $result = $db->query($query);
        $realtor = $result->fetch_assoc();
        return $realtor;
    }

    public function updateRealtor($id, $name, $mail, $percent, $experience, $balance, $time)
    {
        global $db;
        $db->begin_transaction();
        $sql1 = "UPDATE ro_realtors SET 
 percent = $percent,
 experience = '$experience'
WHERE id = $id";
        $result1 = $db->query($sql1);
        $sql2 = "
UPDATE ro_users SET name = '$name',
 mail = '$mail',
 balance = $balance, time = '$time'
WHERE id = $id";
        $result2 = $db->query($sql2);
        if ($result1 && $result2) $db->commit();
        else $db->rollback();
        return $result1 && $result2;
    }

    public function selectEstates()
    {
        global $db;
        $query = "SELECT
                e.id,
                u_s.id AS seller_id,
                u_s.`name` AS seller_name,
                u_s.mail AS seller_mail,
                u_r.id AS realtor_id,
                u_r.`name` AS realtor_name,
                u_r.mail AS realtor_mail,
                e.title,
                e.cost,
                e.time,
                e.accepted,
                e.archived,
                e.`description`,
                cities.name AS city_name,  
                types.name AS type_name,
                localities.name AS locality_name,
                e.area,
                e.bedrooms,
                e.floors
                FROM ro_estates AS e
                JOIN list_cities AS cities ON e.city_id = cities.id
                JOIN list_types AS types ON e.type_id = types.id
                JOIN list_localities AS localities ON e.locality_id = localities.id
                JOIN ro_users AS u_s ON e.seller_id = u_s.id
                JOIN ro_users AS u_r ON e.realtor_id = u_r.id
                ORDER BY e.time DESC";
        $result = $db->query($query);
        $estates = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $estates[] = $row;
            }
        }
        return $estates;
    }

    public function selectUsers()
    {
        global $db;
        $query = "SELECT * FROM ro_users";
        $result = $db->query($query);
        $users = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $users[] = $row;
            }
        }
        return $users;
    }

    public function getData($string)
    {
        global $db;
        $data = [];
        $result = $db->query("SELECT * FROM $string");
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }

    public function addEstate($seller_id, $title, $description, $cost, $type, $city, $locality, $area, $bedrooms, $floors, $created)
    {
        global $db;
        $seller_id = (int)$seller_id;
        $cost = (double)$cost;
        $type = (int)$type;
        $city = (int)$city;
        $locality = (int)$locality;
        $area = (double)$area;
        $bedrooms = (int)$bedrooms;
        $floors = (int)$floors;
        $created = $db->real_escape_string($created);
        $title = $db->real_escape_string($title);
        $description = $db->real_escape_string($description);
        $sql = "INSERT INTO ro_estates (seller_id, realtor_id ,title, cost, `time`, `description`, city_id, locality_id, type_id, area, bedrooms, floors)
            VALUES ($seller_id, null, '$title', $cost, '$created', '$description', $city, $locality, $type, $area, $bedrooms, $floors)";
        $db->query($sql);

         return $db->insert_id;
    }

    public function getMessagesByUserIdAndMonth($user_id, $month)
    {
        global $db;
        $query = "SELECT * FROM ro_messages WHERE user_id = $user_id AND MONTH(time) = $month";
        $result = $db->query($query);
        $messages = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $messages[] = $row;
            }
        }
        return $messages;
    }

    public function selectEstatesByType(mixed $type)
    {
        global $db;
        $query = "SELECT
                COUNT(*) AS EstatesCount,
                SUM(e.area) AS AreaCount,
                lt.name
                FROM ro_estates AS e
                JOIN list_types lt ON lt.id = $type
                WHERE e.type_id = $type";
        $result = $db->query($query);
        $estates = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $estates[] = $row;
            }
        }
        return $estates;
    }

    public function selectEstatesByTypeWithMaxArea(mixed $type)
    {
        global $db;
        $query = "SELECT 
                e.id, 
                e.title,
                e.cost,
                e.seller_id,
                e.realtor_id,
                lt.`name` AS 'type',
                lc.`name` AS 'city',
                ll.`name` AS 'locality',
                e.bedrooms,
                e.floors,
                e.time,
                e.area AS max_area
            FROM ro_estates AS e
            JOIN list_types lt ON lt.id = $type
            JOIN list_cities lc ON lc.id = e.city_id
            JOIN list_localities ll ON ll.id = e.locality_id
            WHERE e.type_id = $type
            AND e.area = (
                SELECT 
                    MAX(area)
                FROM ro_estates
                WHERE type_id = $type
                LIMIT 1
                );";
        $result = $db->query($query);
        $estates = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $estates[] = $row;
            }
        }
        return $estates;
    }

    public function getChatsByUserId($user_id)
    {
        global $db;
        $query = "SELECT 
                    c.id, c.estate_id, e.seller_id, e.realtor_id, c.buyer_id, c.time, c.sold
                    FROM ro_chats AS c
                    JOIN ro_estates AS e ON c.estate_id = e.id 
                    WHERE (c.buyer_id = $user_id OR 
                    e.seller_id = $user_id OR 
                    e.realtor_id = $user_id)";
        $result = $db->query($query);
        $chats = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $chats[] = $row;
            }
        }
        return $chats;
    }

    public function editEstate($id, $title, $cost, $archived, $description, $city, $locality, $type,  $area, $bedrooms, $floors)
    {
        global $db;
        $query = "UPDATE ro_estates SET 
            title = '$title',
            cost = $cost,
            archived = $archived,
            description = '$description',
            city_id = $city,
            locality_id = $locality,
            type_id = $type,
            area = $area,
            bedrooms = $bedrooms,
            floors = $floors
            WHERE id = $id";
        $db->query($query);
    }

    public function CompareSellerIdByEstateIdAndUID($estate_id, $uid)
    {
        global $db;
        $query = "SELECT seller_id FROM ro_estates WHERE id = $estate_id AND seller_id = $uid";
        $result = $db->query($query);
        $estates = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $estates[] = $row;
            }
        }
        return $estates;
    }

    public function checkEstateAccessLevelForSeller($estate_id, $uid)
    {
        global $access_level;
        if($access_level != 1) return false;
        global $db;
        $query = "SELECT seller_id FROM ro_estates WHERE id = $estate_id AND seller_id = $uid";
        $result = $db->query($query);
        return ($result->num_rows > 0);
    }
}