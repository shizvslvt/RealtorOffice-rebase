-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2024 at 11:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realtor_office_v3`
--
CREATE DATABASE IF NOT EXISTS `realtor_office_v3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `realtor_office_v3`;

-- --------------------------------------------------------

--
-- Table structure for table `list_cities`
--

CREATE TABLE `list_cities` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `list_cities`
--

INSERT INTO `list_cities` (`id`, `name`) VALUES
(1, 'Київ'),
(2, 'Львів'),
(3, 'Харків'),
(4, 'Одеса'),
(5, 'Дніпро'),
(6, 'Запоріжжя'),
(7, 'Вінниця'),
(8, 'Черкаси'),
(9, 'Чернігів'),
(10, 'Житомир'),
(11, 'Івано-Франківськ'),
(12, 'Кропивницький'),
(13, 'Луцьк'),
(14, 'Миколаїв'),
(15, 'Полтава'),
(16, 'Рівне'),
(17, 'Суми'),
(18, 'Тернопіль'),
(19, 'Ужгород'),
(20, 'Херсон'),
(21, 'Хмельницький'),
(22, 'Чернівці');

-- --------------------------------------------------------

--
-- Table structure for table `list_localities`
--

CREATE TABLE `list_localities` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `list_localities`
--

INSERT INTO `list_localities` (`id`, `name`) VALUES
(1, 'Центр'),
(2, 'Пригород'),
(3, 'Селище');

-- --------------------------------------------------------

--
-- Table structure for table `list_types`
--

CREATE TABLE `list_types` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `list_types`
--

INSERT INTO `list_types` (`id`, `name`) VALUES
(1, 'Дом'),
(2, 'Квартира'),
(3, 'Земля');

-- --------------------------------------------------------

--
-- Table structure for table `ro_chats`
--

CREATE TABLE `ro_chats` (
  `id` int(11) NOT NULL,
  `estate_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `sold` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ro_chats`
--

INSERT INTO `ro_chats` (`id`, `estate_id`, `buyer_id`, `time`, `sold`) VALUES
(1, 1, 2, '2022-02-18 14:15:22', NULL),
(2, 3, 2, '2022-03-04 17:10:32', NULL),
(3, 2, 4, '2022-03-08 10:14:19', NULL),
(4, 4, 8, '2022-03-30 17:12:03', NULL),
(5, 4, 5, '2022-04-03 11:15:05', NULL),
(6, 5, 12, '2022-07-13 09:12:41', NULL),
(7, 7, 11, '2022-08-05 14:15:28', NULL),
(8, 6, 11, '2022-08-05 18:02:47', NULL),
(9, 6, 6, '2022-08-06 13:53:20', NULL),
(10, 8, 12, '2022-09-10 14:06:39', NULL),
(11, 10, 10, '2022-11-04 15:23:48', NULL),
(12, 14, 18, '2023-03-27 10:17:21', NULL),
(13, 9, 16, '2023-04-01 12:06:44', NULL),
(14, 12, 21, '2023-04-07 15:37:23', NULL),
(15, 10, 15, '2023-04-10 09:42:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ro_estates`
--

CREATE TABLE `ro_estates` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL DEFAULT 0,
  `realtor_id` int(11) DEFAULT 0,
  `title` text NOT NULL,
  `cost` double NOT NULL DEFAULT 0,
  `time` datetime NOT NULL,
  `accepted` datetime DEFAULT NULL,
  `archived` int(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `city_id` int(3) NOT NULL DEFAULT 0,
  `locality_id` int(3) NOT NULL DEFAULT 0,
  `type_id` int(3) NOT NULL DEFAULT 0,
  `area` double NOT NULL DEFAULT 0,
  `bedrooms` int(3) NOT NULL DEFAULT 0,
  `floors` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ro_estates`
--

INSERT INTO `ro_estates` (`id`, `seller_id`, `realtor_id`, `title`, `cost`, `time`, `accepted`, `archived`, `description`, `city_id`, `locality_id`, `type_id`, `area`, `bedrooms`, `floors`) VALUES
(1, 3, 7, 'Трехкомнатная квартира в центре города', 45000, '2021-09-15 18:53:13', '2022-02-14 09:06:28', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 10, 1, 2, 95, 3, 11),
(2, 6, 7, 'Двухэтажный дом с панорамным видом', 32000, '2022-01-11 17:27:16', '2022-02-19 14:12:34', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 14, 2, 2, 140, 5, 2),
(3, 6, 7, 'Дом в живописном районе с большим участком', 83000, '2022-02-28 11:22:05', '2022-03-03 13:14:21', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 14, 2, 2, 130, 4, 2),
(4, 9, 7, 'Уютная квартира с дизайнерским ремонтом', 35000, '2022-03-23 09:15:09', '2022-03-28 14:13:05', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 7, 2, 2, 75, 2, 5),
(5, 14, 11, 'Современный пентхаус с видом на город', 60000, '2022-07-11 08:39:54', '2022-07-11 10:08:49', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 4, 1, 2, 95, 2, 12),
(6, 3, 11, 'Студия с панорамными окнами в центре', 47000, '2022-07-16 14:27:49', '2022-07-17 09:03:31', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 10, 1, 2, 80, 2, 3),
(7, 15, 7, 'Квартира в историческом центре города', 77000, '2022-08-01 12:20:45', '2022-08-04 12:20:45', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 1, 1, 2, 115, 2, 2),
(8, 14, 11, 'Большая квартира с террасой и видом на парк', 73000, '2022-09-09 15:44:25', '2022-09-10 09:11:31', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 4, 1, 2, 110, 4, 4),
(9, 6, 7, 'Элитный загородный дом с бассейном', 147000, '2022-10-15 10:21:18', '2022-10-18 14:13:08', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 14, 2, 1, 300, 6, 3),
(10, 9, 11, 'Участок для строительства дома с возможностью садоводства', 18000, '2022-10-27 16:37:42', '2022-11-01 10:28:33', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 7, 2, 3, 180, 0, 0),
(11, 19, 18, 'Новый дом с большим участком земли', 86000, '2023-02-05 21:53:13', '2023-02-06 09:06:26', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 11, 2, 1, 200, 4, 2),
(12, 3, 11, 'Квартира в жилом комплексе с бассейном', 37000, '2023-03-10 09:46:22', '2023-03-14 18:32:28', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 10, 3, 2, 85, 2, 6),
(14, 15, 7, 'Новый современный дом в престижном районе', 205000, '2023-03-22 12:32:31', '2023-03-26 09:32:31', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 4, 1, 1, 260, 4, 2),
(15, 14, 11, 'Пентхаус с видом на город', 125000, '2023-06-15 18:53:13', '2023-06-20 14:15:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 1, 1, 1, 230, 3, 7),
(16, 19, NULL, 'Уютная квартира с террасой', 56000, '2023-11-06 13:42:32', NULL, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 11, 2, 2, 100, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ro_logs`
--

CREATE TABLE `ro_logs` (
  `id` int(11) NOT NULL,
  `type` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `chat_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `time` datetime NOT NULL,
  `desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ro_messages`
--

CREATE TABLE `ro_messages` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ro_messages`
--

INSERT INTO `ro_messages` (`id`, `chat_id`, `user_id`, `message`, `time`) VALUES
(19, 1, 2, 'hi', '2024-11-17 15:47:02'),
(20, 1, 3, 'hello', '2024-11-17 15:49:49'),
(21, 1, 7, 'hi everyone', '2024-11-17 15:50:02'),
(22, 1, 2, 'bye bye', '2024-11-17 15:50:49'),
(23, 2, 2, 'покупаю', '2024-11-17 15:55:25'),
(24, 2, 6, 'вот прямо сейчас?', '2024-11-17 15:56:05'),
(27, 2, 6, 'честно?', '2024-11-17 16:03:07'),
(28, 2, 7, 'вполне возможно', '2024-11-17 16:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `ro_realtors`
--

CREATE TABLE `ro_realtors` (
  `id` int(11) NOT NULL,
  `percent` double NOT NULL DEFAULT 0,
  `experience` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ro_realtors`
--

INSERT INTO `ro_realtors` (`id`, `percent`, `experience`) VALUES
(7, 2.5, '2019-02-10'),
(11, 2.5, '2020-10-29'),
(18, 2.5, '2020-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `ro_users`
--

CREATE TABLE `ro_users` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `mail` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `PID` int(9) DEFAULT NULL,
  `balance` double DEFAULT 0,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ro_users`
--

INSERT INTO `ro_users` (`id`, `name`, `mail`, `password`, `birthday`, `PID`, `balance`, `time`) VALUES
(1, 'admin1', 'admin1@gmail.com', 'admin1', '2000-01-01', 200000000, 0, '2021-01-01 00:00:00'),
(2, 'Іван Авраменко', 'ivan.avramenko@gmail.com', 'password', '2002-07-21', 200207217, 0, '2021-09-01 08:12:35'),
(3, 'Анастасія Анайко', 'anastasia.anaiko@gmail.com', 'password', '2001-08-13', 200108134, 0, '2021-09-15 13:45:22'),
(4, 'Катерина Вербицька', 'kateryna.verbytska@gmail.com', 'password', '2002-03-03', 200203035, 0, '2021-10-07 14:25:33'),
(5, 'Данило Глаголєв', 'danylo.hlaholev@gmail.com', 'password', '2001-11-29', 200111297, 0, '2021-10-22 16:20:18'),
(6, 'Костянтин Юшко', 'kostiantyn.yushko@gmail.com', 'password', '2004-02-06', 200402061, 0, '2022-01-15 09:35:27'),
(7, 'Даніїл Мозжухін', 'daniil.mozzhukhin@gmail.com', 'password', '2002-10-10', 200210105, 0, '2022-02-13 11:12:34'),
(8, 'Марія Тюрдєєва', 'maria.tyurdeeva@gmail.com', 'password', '2002-04-22', 200204226, 0, '2022-03-05 13:18:22'),
(9, 'Антон Ржевський', 'anton.rzhevskyi@gmail.com', 'password', '2001-12-01', 200112019, 0, '2022-03-22 15:14:40'),
(10, 'Дар’я Черепіна', 'daria.cherepina@gmail.com', 'password', '2002-07-15', 200207157, 0, '2022-04-18 12:55:28'),
(11, 'Микола Резніченко', 'mykola.reznichenko@gmail.com', 'password', '2001-03-12', 200103129, 0, '2022-05-14 11:20:40'),
(12, 'Дар’я Яременко', 'daria.yaremenko@gmail.com', 'password', '2003-10-07', 200310072, 0, '2022-06-28 08:15:30'),
(13, 'Катерина Шафранюк', 'kateryna.shafranyuk@gmail.com', 'password', '2002-06-11', 200206119, 0, '2022-07-03 10:14:56'),
(14, 'Леонардо Пендус', 'leonardo.pendus@gmail.com', 'password', '2001-02-20', 200102202, 0, '2022-07-10 14:20:01'),
(15, 'Андрій Скрипка', 'andriy.skrypka@gmail.com', 'password', '2002-03-29', 200203293, 0, '2022-07-12 09:18:44'),
(16, 'Валентин Нетовканий', 'valentyn.netovkanyi@gmail.com', 'password', '2001-09-09', 200109095, 0, '2022-07-20 13:52:22'),
(17, 'Ігор Єрощенков', 'ihor.yeroshenkov@gmail.com', 'password', '2001-06-03', 200106039, 0, '2022-09-13 11:15:36'),
(18, 'Микита Кузнецов', 'mykyta.kuznetsov@gmail.com', 'password', '2002-04-15', 200204152, 0, '2023-01-21 14:31:44'),
(19, 'Богдан Трофименко', 'bogdan.trofymenko@gmail.com', 'password', '2002-12-24', 200212243, 0, '2023-02-05 14:58:10'),
(20, 'Наталія Тимофєєва', 'nataliya.tymofeeva@gmail.com', 'password', '2001-11-17', 200111177, 0, '2023-02-19 17:22:03'),
(21, 'Данило Садовий', 'danylo.sadovyi@gmail.com', 'password', '2002-08-09', 200208091, 0, '2023-03-07 16:06:27'),
(22, 'Володимир Гнатуша', 'volodymyr.hnatusha@gmail.com', 'password', '2002-05-02', 200205028, 0, '2024-01-12 09:17:32'),
(23, 'admin2', 'admin2@gmail.com', 'admin2', '2000-01-01', 200000001, 0, '2024-11-08 23:24:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `list_cities`
--
ALTER TABLE `list_cities`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `list_localities`
--
ALTER TABLE `list_localities`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `list_types`
--
ALTER TABLE `list_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ro_chats`
--
ALTER TABLE `ro_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ro_estates_deals_ro_users` (`buyer_id`),
  ADD KEY `FK_ro_estates_deals_ro_estates_new` (`estate_id`);

--
-- Indexes for table `ro_estates`
--
ALTER TABLE `ro_estates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_seller_id_ro_estates` (`seller_id`) USING BTREE,
  ADD KEY `idx_realtor_id_ro_estates` (`realtor_id`) USING BTREE,
  ADD KEY `idx_city_id_ro_estates` (`city_id`) USING BTREE,
  ADD KEY `idx_locality_id_ro_estates` (`locality_id`) USING BTREE,
  ADD KEY `idx_type_id_ro_estates` (`type_id`) USING BTREE;

--
-- Indexes for table `ro_logs`
--
ALTER TABLE `ro_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ro_logs_ro_users` (`user_id`),
  ADD KEY `FK_ro_logs_ro_estates_deals` (`chat_id`) USING BTREE;

--
-- Indexes for table `ro_messages`
--
ALTER TABLE `ro_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ro_messages_ro_users` (`user_id`),
  ADD KEY `FK_ro_messages_ro_estates_deals` (`chat_id`) USING BTREE;

--
-- Indexes for table `ro_realtors`
--
ALTER TABLE `ro_realtors`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `ro_users`
--
ALTER TABLE `ro_users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `list_cities`
--
ALTER TABLE `list_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `list_localities`
--
ALTER TABLE `list_localities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `list_types`
--
ALTER TABLE `list_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ro_chats`
--
ALTER TABLE `ro_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ro_estates`
--
ALTER TABLE `ro_estates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ro_logs`
--
ALTER TABLE `ro_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ro_messages`
--
ALTER TABLE `ro_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ro_users`
--
ALTER TABLE `ro_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ro_chats`
--
ALTER TABLE `ro_chats`
  ADD CONSTRAINT `FK_ro_estates_deals_ro_estates_new` FOREIGN KEY (`estate_id`) REFERENCES `ro_estates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ro_estates_deals_ro_users` FOREIGN KEY (`buyer_id`) REFERENCES `ro_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ro_estates`
--
ALTER TABLE `ro_estates`
  ADD CONSTRAINT `FK_ro_estates_cities` FOREIGN KEY (`city_id`) REFERENCES `list_cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ro_estates_localities` FOREIGN KEY (`locality_id`) REFERENCES `list_localities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ro_estates_realtors` FOREIGN KEY (`realtor_id`) REFERENCES `ro_realtors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ro_estates_types` FOREIGN KEY (`type_id`) REFERENCES `list_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ro_estates_users` FOREIGN KEY (`seller_id`) REFERENCES `ro_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ro_logs`
--
ALTER TABLE `ro_logs`
  ADD CONSTRAINT `FK_ro_logs_ro_estates_deals` FOREIGN KEY (`chat_id`) REFERENCES `ro_chats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ro_logs_ro_users` FOREIGN KEY (`user_id`) REFERENCES `ro_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ro_messages`
--
ALTER TABLE `ro_messages`
  ADD CONSTRAINT `FK_ro_messages_ro_estates_deals` FOREIGN KEY (`chat_id`) REFERENCES `ro_chats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ro_messages_ro_users` FOREIGN KEY (`user_id`) REFERENCES `ro_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ro_realtors`
--
ALTER TABLE `ro_realtors`
  ADD CONSTRAINT `FK__ro_users` FOREIGN KEY (`id`) REFERENCES `ro_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
