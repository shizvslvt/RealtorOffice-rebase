-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2024 at 02:47 AM
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
-- Database: `realtor_office`
--
CREATE DATABASE IF NOT EXISTS `realtor_office` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `realtor_office`;

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
(2, 3, 2, '2022-03-04 17:10:32', '2022-03-10 19:15:21'),
(3, 1, 4, '2022-03-08 10:14:19', '2022-03-14 16:08:27'),
(4, 4, 8, '2022-03-30 17:12:03', NULL),
(5, 4, 5, '2022-04-03 11:15:05', '2022-04-07 12:08:30'),
(6, 5, 12, '2022-07-12 09:12:41', '2022-07-19 14:15:28'),
(7, 2, 13, '2022-08-01 09:35:27', '2022-08-07 15:47:14'),
(8, 7, 17, '2022-09-15 09:30:27', '2022-09-22 10:22:29'),
(9, 6, 16, '2022-09-18 18:02:47', NULL),
(10, 6, 3, '2022-10-15 13:53:20', '2022-10-19 12:59:12'),
(11, 8, 12, '2022-11-04 14:06:39', NULL),
(12, 10, 10, '2023-01-03 15:23:48', '2023-01-05 13:18:54'),
(13, 13, 20, '2023-03-22 12:25:32', '2023-03-27 10:32:20'),
(14, 9, 8, '2023-03-27 10:17:21', '2023-04-04 13:27:17'),
(15, 14, 22, '2023-04-01 12:06:44', '2023-04-07 11:10:34'),
(16, 12, 21, '2023-04-19 15:37:23', '2023-05-01 10:28:38'),
(17, 11, 16, '2023-05-09 09:42:10', '2023-05-14 12:46:06');

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
(1, 3, 7, 'Трехкомнатная квартира в центре города', 45000, '2021-09-15 18:53:13', '2022-02-14 09:06:28', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 10, 1, 2, 95, 3, 11),
(2, 6, 7, 'Двухэтажный дом с панорамным видом', 32000, '2022-01-15 09:35:27', '2022-02-19 14:12:34', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 14, 2, 2, 110, 5, 2),
(3, 6, 7, 'Дом в живописном районе с большим участком', 83000, '2022-02-28 11:22:05', '2022-03-03 13:14:21', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 14, 2, 2, 130, 4, 2),
(4, 9, 7, 'Уютная квартира с дизайнерским ремонтом', 35000, '2022-03-23 09:15:09', '2022-03-28 14:13:05', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 7, 2, 2, 75, 2, 5),
(5, 14, 11, 'Современный пентхаус с видом на город', 60000, '2022-07-11 08:39:54', '2022-07-11 10:08:49', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 4, 1, 2, 95, 2, 12),
(6, 3, 11, 'Студия с панорамными окнами в центре', 40000, '2022-07-16 14:27:49', '2022-07-17 09:03:31', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 10, 1, 2, 80, 2, 3),
(7, 15, 7, 'Квартира в историческом центре города', 77000, '2022-08-01 12:20:45', '2022-08-04 12:20:45', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 1, 1, 2, 115, 2, 2),
(8, 14, 11, 'Большая квартира с террасой и видом на парк', 58000, '2022-09-09 15:44:25', '2022-09-10 09:11:31', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem.', 4, 1, 2, 95, 4, 4),
(9, 6, 7, 'Элитный загородный дом с бассейном', 147000, '2022-10-15 10:21:18', '2022-10-18 14:13:08', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 14, 2, 1, 260, 6, 3),
(10, 9, 11, 'Участок для строительства дома с возможностью садоводства', 18000, '2022-10-27 16:37:42', '2022-11-01 10:28:33', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 7, 2, 3, 180, 0, 0),
(11, 19, 18, 'Новый дом с большим участком земли', 86000, '2023-02-05 21:53:13', '2023-02-06 09:06:26', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 11, 2, 1, 200, 4, 2),
(12, 3, 11, 'Квартира в жилом комплексе с бассейном', 37000, '2023-03-10 09:46:22', '2023-03-14 18:32:28', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 10, 3, 2, 85, 2, 6),
(13, 6, 18, 'Ухоженный домик с подвалом около центра', 49000, '2023-03-18 11:09:11', '2023-03-19 12:09:41', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 14, 2, 1, 125, 3, 2),
(14, 15, 11, 'Новый современный дом в престижном районе', 205000, '2023-03-22 12:32:31', '2023-03-26 09:32:31', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 4, 1, 1, 260, 4, 2),
(15, 14, 11, 'Пентхаус с видом на город', 125000, '2023-06-15 18:53:13', '2023-06-20 14:15:42', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 1, 1, 1, 230, 3, 7),
(16, 3, 7, 'Квартира с уютным видом на море', 47000, '2023-09-11 13:47:18', '2023-09-14 09:37:29', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 4, 1, 2, 150, 3, 6),
(17, 19, NULL, 'Уютная квартира с террасой', 56000, '2023-11-06 13:42:32', NULL, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet quam fringilla libero rutrum lobortis. Nam id vulputate odio. Cras molestie quis ante et vestibulum. Nullam viverra leo quis libero vulputate ultricies sit amet et lorem. ', 11, 2, 2, 100, 2, 4);

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
  `desc` text DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ro_logs`
--

INSERT INTO `ro_logs` (`id`, `type`, `link`, `chat_id`, `user_id`, `desc`, `amount`, `time`) VALUES
(1, 'transaction', '?p=buy-estate&id=3', 2, 2, 'Пользователь 2 начал покупку недвижимости 3 стоимостью 83000.', 83000, '2022-03-10 19:15:21'),
(2, 'transaction', '?p=buy-estate&id=3', 2, 2, 'Баланс покупателя 2 изменен с 100000 на 17000', 83000, '2022-03-10 19:15:21'),
(3, 'transaction', '?p=buy-estate&id=3', 2, 7, 'Баланс риэлтора 7 изменен с 0 на 2075', 2075, '2022-03-10 19:15:21'),
(4, 'transaction', '?p=buy-estate&id=3', 2, 6, 'Баланс продавца 6 изменен с 0 на 80925', 80925, '2022-03-10 19:15:21'),
(5, 'sale', '?p=buy-estate&id=3', 2, 2, 'Недвижимость 3 была продана пользователем 6 пользователю 2.', 83000, '2022-03-10 19:15:21'),
(6, 'transaction', '?p=buy-estate&id=1', 3, 4, 'Пользователь 4 начал покупку недвижимости 1 стоимостью 45000.', 45000, '2022-03-14 16:08:27'),
(7, 'transaction', '?p=buy-estate&id=1', 3, 4, 'Баланс покупателя 4 изменен с 50000 на 5000', 45000, '2022-03-14 16:08:27'),
(8, 'transaction', '?p=buy-estate&id=1', 3, 7, 'Баланс риэлтора 7 изменен с 2075 на 3200', 1125, '2022-03-14 16:08:27'),
(9, 'transaction', '?p=buy-estate&id=1', 3, 3, 'Баланс продавца 3 изменен с 0 на 43875', 43875, '2022-03-14 16:08:27'),
(10, 'sale', '?p=buy-estate&id=1', 3, 4, 'Недвижимость 1 была продана пользователем 3 пользователю 4.', 45000, '2022-03-14 16:08:27'),
(11, 'transaction', '?p=buy-estate&id=4', 5, 5, 'Пользователь 5 начал покупку недвижимости 4 стоимостью 35000.', 35000, '2022-04-07 12:08:30'),
(12, 'transaction', '?p=buy-estate&id=4', 5, 5, 'Баланс покупателя 5 изменен с 40000 на 5000', 35000, '2022-04-07 12:08:30'),
(13, 'transaction', '?p=buy-estate&id=4', 5, 7, 'Баланс риэлтора 7 изменен с 3200 на 4075', 875, '2022-04-07 12:08:30'),
(14, 'transaction', '?p=buy-estate&id=4', 5, 9, 'Баланс продавца 9 изменен с 0 на 34125', 34125, '2022-04-07 12:08:30'),
(15, 'sale', '?p=buy-estate&id=4', 5, 5, 'Недвижимость 4 была продана пользователем 9 пользователю 5.', 35000, '2022-04-07 12:08:30'),
(16, 'transaction', '?p=buy-estate&id=5', 6, 12, 'Пользователь 12 начал покупку недвижимости 5 стоимостью 60000.', 60000, '2022-07-19 14:15:28'),
(17, 'transaction', '?p=buy-estate&id=5', 6, 12, 'Баланс покупателя 12 изменен с 65000 на 5000', 60000, '2022-07-19 14:15:28'),
(18, 'transaction', '?p=buy-estate&id=5', 6, 11, 'Баланс риэлтора 11 изменен с 0 на 1500', 1500, '2022-07-19 14:15:28'),
(19, 'transaction', '?p=buy-estate&id=5', 6, 14, 'Баланс продавца 14 изменен с 0 на 58500', 58500, '2022-07-19 14:15:28'),
(20, 'sale', '?p=buy-estate&id=5', 6, 12, 'Недвижимость 5 была продана пользователем 14 пользователю 12.', 60000, '2022-07-19 14:15:28'),
(21, 'transaction', '?p=buy-estate&id=2', 7, 13, 'Пользователь 13 начал покупку недвижимости 2 стоимостью 32000.', 32000, '2022-08-07 15:47:14'),
(22, 'transaction', '?p=buy-estate&id=2', 7, 13, 'Баланс покупателя 13 изменен с 35000 на 3000', 32000, '2022-08-07 15:47:14'),
(23, 'transaction', '?p=buy-estate&id=2', 7, 7, 'Баланс риэлтора 7 изменен с 4075 на 4875', 800, '2022-08-07 15:47:14'),
(24, 'transaction', '?p=buy-estate&id=2', 7, 6, 'Баланс продавца 6 изменен с 80925 на 112125', 32000, '2022-08-07 15:47:14'),
(25, 'sale', '?p=buy-estate&id=2', 7, 13, 'Недвижимость 2 была продана пользователем 6 пользователю 13.', 32000, '2022-08-07 15:47:14'),
(26, 'transaction', '?p=buy-estate&id=7', 8, 17, 'Пользователь 17 начал покупку недвижимости 7 стоимостью 77000.', 77000, '2022-09-22 10:22:29'),
(27, 'transaction', '?p=buy-estate&id=7', 8, 17, 'Баланс покупателя 17 изменен с 80000 на 3000', 77000, '2022-09-22 10:22:29'),
(28, 'transaction', '?p=buy-estate&id=7', 8, 7, 'Баланс риэлтора 7 изменен с 4875 на 6800', 1925, '2022-09-22 10:22:29'),
(29, 'transaction', '?p=buy-estate&id=7', 8, 15, 'Баланс продавца 15 изменен с 0 на 75075', 75075, '2022-09-22 10:22:29'),
(30, 'sale', '?p=buy-estate&id=7', 8, 17, 'Недвижимость 7 была продана пользователем 15 пользователю 17.', 77000, '2022-09-22 10:22:29'),
(31, 'transaction', '?p=buy-estate&id=6', 10, 3, 'Пользователь 3 начал покупку недвижимости 6 стоимостью 40000.', 40000, '2022-10-19 12:59:12'),
(32, 'transaction', '?p=buy-estate&id=6', 10, 3, 'Баланс покупателя 3 изменен с 43875 на 3875', 40000, '2022-10-19 12:59:12'),
(33, 'transaction', '?p=buy-estate&id=6', 10, 11, 'Баланс риэлтора 11 изменен с 1500 на 2500', 1000, '2022-10-19 12:59:12'),
(34, 'transaction', '?p=buy-estate&id=6', 10, 3, 'Баланс продавца 3 изменен с 3875 на 42875', 39000, '2022-10-19 12:59:12'),
(35, 'sale', '?p=buy-estate&id=6', 10, 3, 'Недвижимость 6 была продана пользователем 3 пользователю 3.', 40000, '2022-10-19 12:59:12'),
(36, 'transaction', '?p=buy-estate&id=10', 12, 10, 'Пользователь 10 начал покупку недвижимости 10 стоимостью 18000.', 18000, '2023-01-05 13:18:54'),
(37, 'transaction', '?p=buy-estate&id=10', 12, 10, 'Баланс покупателя 10 изменен с 20000 на 2000', 18000, '2023-01-05 13:18:54'),
(38, 'transaction', '?p=buy-estate&id=10', 12, 11, 'Баланс риэлтора 11 изменен с 2500 на 2950', 450, '2023-01-05 13:18:54'),
(39, 'transaction', '?p=buy-estate&id=10', 12, 9, 'Баланс продавца 9 изменен с 34125 на 51675', 17550, '2023-01-05 13:18:54'),
(40, 'sale', '?p=buy-estate&id=10', 12, 10, 'Недвижимость 10 была продана пользователем 9 пользователю 10.', 18000, '2023-01-05 13:18:54'),
(41, 'transaction', '?p=buy-estate&id=13', 13, 20, 'Пользователь 20 начал покупку недвижимости 13 стоимостью 49000.', 49000, '2023-03-27 10:32:20'),
(42, 'transaction', '?p=buy-estate&id=13', 13, 20, 'Баланс покупателя 20 изменен с 50000 на 1000', 49000, '2023-03-27 10:32:20'),
(43, 'transaction', '?p=buy-estate&id=13', 13, 18, 'Баланс риэлтора 18 изменен с 0 на 1225', 1225, '2023-03-27 10:32:20'),
(44, 'transaction', '?p=buy-estate&id=13', 13, 6, 'Баланс продавца 6 изменен с 112125 на 159900', 47775, '2023-03-27 10:32:20'),
(45, 'sale', '?p=buy-estate&id=13', 13, 20, 'Недвижимость 13 была продана пользователем 6 пользователю 20.', 49000, '2023-03-27 10:32:20'),
(46, 'transaction', '?p=buy-estate&id=9', 14, 8, 'Пользователь 8 начал покупку недвижимости 9 стоимостью 147000.', 147000, '2023-04-04 13:27:17'),
(47, 'transaction', '?p=buy-estate&id=9', 14, 8, 'Баланс покупателя 8 изменен с 150000 на 3000', 147000, '2023-04-04 13:27:17'),
(48, 'transaction', '?p=buy-estate&id=9', 14, 7, 'Баланс риэлтора 7 изменен с 6800 на 10475', 3675, '2023-04-04 13:27:17'),
(49, 'transaction', '?p=buy-estate&id=9', 14, 6, 'Баланс продавца 6 изменен с 159900 на 303225', 143325, '2023-04-04 13:27:17'),
(50, 'sale', '?p=buy-estate&id=9', 14, 8, 'Недвижимость 9 была продана пользователем 6 пользователю 8.', 147000, '2023-04-04 13:27:17'),
(51, 'transaction', '?p=buy-estate&id=14', 15, 22, 'Пользователь 22 начал покупку недвижимости 14 стоимостью 205000.', 205000, '2023-04-07 11:10:34'),
(52, 'transaction', '?p=buy-estate&id=14', 15, 22, 'Баланс покупателя 22 изменен с 210000 на 5000', 205000, '2023-04-07 11:10:34'),
(53, 'transaction', '?p=buy-estate&id=14', 15, 11, 'Баланс риэлтора 11 изменен с 2950 на 8075', 5125, '2023-04-07 11:10:34'),
(54, 'transaction', '?p=buy-estate&id=14', 15, 15, 'Баланс продавца 15 изменен с 75075 на 274950', 199875, '2023-04-07 11:10:34'),
(55, 'sale', '?p=buy-estate&id=14', 15, 22, 'Недвижимость 14 была продана пользователем 15 пользователю 22.', 205000, '2023-04-07 11:10:34'),
(56, 'transaction', '?p=buy-estate&id=12', 16, 21, 'Пользователь 21 начал покупку недвижимости 12 стоимостью 37000.', 37000, '2023-05-01 10:28:38'),
(57, 'transaction', '?p=buy-estate&id=12', 16, 21, 'Баланс покупателя 21 изменен с 40000 на 3000', 37000, '2023-05-01 10:28:38'),
(58, 'transaction', '?p=buy-estate&id=12', 16, 11, 'Баланс риэлтора 11 изменен с 8075 на 9000', 925, '2023-05-01 10:28:38'),
(59, 'transaction', '?p=buy-estate&id=12', 16, 3, 'Баланс продавца 3 изменен с 42875 на 78950', 36075, '2023-05-01 10:28:38'),
(60, 'sale', '?p=buy-estate&id=12', 16, 21, 'Недвижимость 12 была продана пользователем 3 пользователю 21.', 37000, '2023-05-01 10:28:38'),
(61, 'transaction', '?p=buy-estate&id=11', 17, 16, 'Пользователь 16 начал покупку недвижимости 11 стоимостью 86000.', 86000, '2023-05-14 12:46:06'),
(62, 'transaction', '?p=buy-estate&id=11', 17, 16, 'Баланс покупателя 16 изменен с 90000 на 4000', 86000, '2023-05-14 12:46:06'),
(63, 'transaction', '?p=buy-estate&id=11', 17, 18, 'Баланс риэлтора 18 изменен с 1225 на 3375', 2150, '2023-05-14 12:46:06'),
(64, 'transaction', '?p=buy-estate&id=11', 17, 19, 'Баланс продавца 19 изменен с 0 на 83850', 83850, '2023-05-14 12:46:06'),
(65, 'sale', '?p=buy-estate&id=11', 17, 16, 'Недвижимость 11 была продана пользователем 19 пользователю 16.', 86000, '2023-05-14 12:46:06');

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
(1, 1, 2, 'hi', '2022-02-19 09:13:30'),
(2, 1, 3, 'hello', '2022-02-19 09:13:35'),
(3, 1, 7, 'hi everyone', '2022-02-19 09:13:40'),
(4, 1, 2, 'bye bye', '2022-02-19 09:15:00'),
(5, 2, 2, 'покупаю', '2022-03-04 18:00:05'),
(6, 2, 6, 'вот прямо сейчас?', '2022-03-04 18:00:10'),
(7, 2, 6, 'честно?', '2022-03-04 18:00:15'),
(8, 2, 7, 'вполне возможно', '2022-03-04 18:00:25'),
(9, 2, 2, 'покупаю', '2022-03-04 18:00:30'),
(10, 3, 4, 'покупаю', '2022-03-08 12:10:20'),
(11, 3, 6, 'я очень рад', '2022-03-08 12:10:25'),
(12, 4, 8, 'Здравствуйте. Подскажите, как обстоят дела с инфраструктурой в этом районе?', '2022-03-30 17:13:00'),
(13, 4, 7, 'Здравствуйте! В 5км доступности есть магазины, школа и детский сад.', '2022-03-30 17:15:00'),
(15, 5, 5, 'Добрый день, хотелось бы узнать больше о жилье. Как с соседями, не шумят?', '2021-04-03 11:16:00'),
(17, 5, 7, 'Добрый день! Соседи вполне доброжелательные, нареканий от продавца не поступало.', '2022-04-03 11:18:00'),
(18, 5, 5, 'Отлично. А в квартире всё в порядке с электрической проводкой?', '2022-04-03 11:20:00'),
(19, 5, 9, 'Да, электропроводка в хорошем состоянии, недавно заменялас', '2022-04-03 11:22:00'),
(21, 5, 5, 'Спасибо за информацию!  Ожидайте оплаты.', '2022-04-03 11:25:00'),
(22, 6, 12, 'Здравствуйте! Были ли случаи с аварийной сантехникой в этом доме?	', '2022-07-12 09:13:00'),
(24, 6, 11, 'Добрый день! Нет, сантехника в хорошем состоянии, всё регулярно обслуживается.', '2022-07-12 09:15:00'),
(25, 6, 12, 'Отлично! А как с вентиляцией? Бывает ли сырость?', '2022-07-12 09:17:00'),
(27, 6, 14, 'Нет, вентиляция работает без проблем, сырости не замечали.', '2022-07-12 09:19:00'),
(28, 6, 11, 'Спасибо, тогда буду готов приобрести квартиру на месте.', '2022-07-12 09:22:00'),
(29, 7, 13, 'Добрый день! Слышимость между квартирами нормальная?', '2022-08-01 09:36:00'),
(30, 7, 6, 'Да, подтверждаю, стены хорошие, слышимость минимальная.', '2022-08-01 09:38:00'),
(31, 7, 7, 'Здравствуйте! Насколько я знаю, жильцы не жалуются.', '2022-08-01 09:37:30'),
(32, 7, 13, 'Отлично, напишите, когда можно посмотреть.', '2022-08-01 09:40:00'),
(33, 7, 7, 'Могу организовать показ завтра в 14:00. Удобно?', '2022-08-01 09:41:00'),
(34, 8, 17, 'Здравствуйте! Были ли проблемы с лифтом?', '2022-09-15 09:31:00'),
(35, 8, 15, 'Добрый день! Нет, лифт недавно заменили.', '2022-09-15 09:33:00'),
(36, 8, 7, 'Это современный лифт, гарантия обслуживания действует еще 3 года.', '2022-09-15 09:34:30'),
(37, 8, 17, 'Отлично, договоримся о времени просмотра.', '2022-09-15 09:35:00'),
(38, 8, 7, 'Как насчет сегодня в 17:00?', '2022-09-15 09:36:00'),
(39, 9, 16, 'Добрый день! Слышал, что дом старый. Были ли проблемы с крышей?', '2022-09-18 18:03:00'),
(40, 9, 3, 'Здравствуйте! Нет, кровля недавно отремонтирована.', '2022-09-18 18:05:00'),
(41, 9, 11, 'Ремонт кровли проводился профессионально, есть гарантия.', '2022-09-18 18:06:30'),
(42, 10, 3, 'Добрый день! Как соседи, дружелюбные?', '2022-10-15 13:54:00'),
(43, 10, 3, 'Здравствуйте! Да, хорошие люди, конфликтов не было.', '2022-10-15 13:56:00'),
(44, 10, 11, 'Это тихий район, соседи действительно доброжелательные.', '2022-10-15 13:57:30'),
(45, 10, 3, 'Звучит отлично, жду предложений по времени.', '2022-10-15 13:58:00'),
(46, 10, 11, 'Завтра в 12:00 устроит?', '2022-10-15 13:59:00'),
(47, 11, 12, 'Добрый день! В доме есть газ или электрическое отопление?', '2022-11-04 14:07:00'),
(48, 11, 14, 'Здравствуйте! Газ.', '2022-11-04 14:08:30'),
(49, 11, 11, 'Газовая система недавно проверена, всё в порядке.', '2022-11-04 14:09:00'),
(50, 12, 10, 'Добрый день! Есть ли рядом детские площадки?', '2023-01-03 15:24:00'),
(51, 12, 9, 'Да, во дворе есть новая детская площадка.', '2023-01-03 15:26:00'),
(52, 12, 11, 'Кроме того, недалеко есть парк, который тоже подходит для детей.', '2023-01-03 15:27:30'),
(53, 12, 10, 'Отлично, договоримся о просмотре!', '2023-01-03 15:28:00'),
(54, 12, 11, 'Могу организовать встречу послезавтра в 16:00.', '2023-01-03 15:29:30'),
(55, 13, 20, 'Здравствуйте! Были ли проблемы с водой в доме?', '2023-03-22 12:26:00'),
(56, 13, 6, 'Нет, сантехника полностью исправна.', '2023-03-22 12:27:30'),
(57, 13, 18, 'Также есть центральное водоснабжение, система новая.', '2023-03-22 12:28:00'),
(58, 14, 8, 'Добрый день! Шумно ли во дворе?', '2023-03-27 10:18:00'),
(59, 14, 6, 'Здравствуйте! Во дворе тихо, много зелени.', '2023-03-27 10:19:30'),
(60, 14, 7, 'Да, район спокойный, идеально для семей.', '2023-03-27 10:20:30'),
(61, 15, 22, 'Добрый день! Были ли в доме крупные ремонты?', '2023-04-01 12:07:00'),
(62, 15, 15, 'Здравствуйте! Недавно отремонтировали фасад.', '2023-04-01 12:08:30'),
(63, 15, 11, 'Ремонт качественный, делали под гарантию.', '2023-04-01 12:09:30'),
(64, 16, 21, 'Здравствуйте! Как парковка возле дома?', '2023-04-19 15:38:00'),
(65, 16, 3, 'Добрый день! Парковка просторная, места всегда есть.', '2023-04-19 15:39:30'),
(66, 16, 11, 'Плюс есть видеонаблюдение для безопасности.', '2023-04-19 15:40:00'),
(67, 17, 16, 'Добрый день! Были ли в доме случаи затопления?', '2023-05-09 09:43:00'),
(68, 17, 19, 'Здравствуйте! Нет, с этим никогда проблем не было.', '2023-05-09 09:44:30'),
(69, 17, 18, 'Кроме того, установлены защитные системы на случай аварий.', '2023-05-09 09:45:00');

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
  `name` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `pid` int(9) DEFAULT NULL,
  `balance` double DEFAULT 0,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ro_users`
--

INSERT INTO `ro_users` (`id`, `name`, `mail`, `password`, `birthday`, `pid`, `balance`, `time`) VALUES
(1, 'admin1', 'admin1@gmail.com', 'admin1', '2000-01-01', 200000000, 0, '2021-01-01 00:00:00'),
(2, 'Іван Авраменко', 'ivan.avramenko@gmail.com', 'password', '2002-07-21', 200207217, 17000, '2021-09-01 08:12:35'),
(3, 'Анастасія Анайко', 'anastasia.anaiko@gmail.com', 'password', '2001-08-13', 200108134, 78950, '2021-09-15 13:45:22'),
(4, 'Катерина Вербицька', 'kateryna.verbytska@gmail.com', 'password', '2002-03-03', 200203035, 5000, '2021-10-07 14:25:33'),
(5, 'Данило Глаголєв', 'danylo.hlaholev@gmail.com', 'password', '2001-11-29', 200111297, 5000, '2021-10-22 16:20:18'),
(6, 'Костянтин Юшко', 'kostiantyn.yushko@gmail.com', 'password', '2004-02-06', 200402061, 303225, '2022-01-11 17:27:16'),
(7, 'Даніїл Мозжухін', 'daniil.mozzhukhin@gmail.com', 'password', '2002-10-10', 200210105, 10475, '2022-02-13 11:12:34'),
(8, 'Марія Тюрдєєва', 'maria.tyurdeeva@gmail.com', 'password', '2002-04-22', 200204226, 3000, '2022-03-05 13:18:22'),
(9, 'Антон Ржевський', 'anton.rzhevskyi@gmail.com', 'password', '2001-12-01', 200112019, 51675, '2022-03-22 15:14:40'),
(10, 'Дар’я Черепіна', 'daria.cherepina@gmail.com', 'password', '2002-07-15', 200207157, 2000, '2022-04-18 12:55:28'),
(11, 'Микола Резніченко', 'mykola.reznichenko@gmail.com', 'password', '2001-03-12', 200103129, 9000, '2022-05-14 11:20:40'),
(12, 'Дар’я Яременко', 'daria.yaremenko@gmail.com', 'password', '2003-10-07', 200310072, 5000, '2022-06-28 08:15:30'),
(13, 'Катерина Шафранюк', 'kateryna.shafranyuk@gmail.com', 'password', '2002-06-11', 200206119, 3000, '2022-07-03 10:14:56'),
(14, 'Леонардо Пендус', 'leonardo.pendus@gmail.com', 'password', '2001-02-20', 200102202, 58500, '2022-07-10 14:20:01'),
(15, 'Андрій Скрипка', 'andriy.skrypka@gmail.com', 'password', '2002-03-29', 200203293, 274950, '2022-07-12 09:18:44'),
(16, 'Валентин Нетовканий', 'valentyn.netovkanyi@gmail.com', 'password', '2001-09-09', 200109095, 4000, '2022-07-20 13:52:22'),
(17, 'Ігор Єрощенков', 'ihor.yeroshenkov@gmail.com', 'password', '2001-06-03', 200106039, 3000, '2022-09-13 11:15:36'),
(18, 'Микита Кузнецов', 'mykyta.kuznetsov@gmail.com', 'password', '2002-04-15', 200204152, 33750, '2023-01-21 14:31:44'),
(19, 'Богдан Трофименко', 'bogdan.trofymenko@gmail.com', 'password', '2002-12-24', 200212243, 83850, '2023-02-05 14:58:10'),
(20, 'Наталія Тимофєєва', 'nataliya.tymofeeva@gmail.com', 'password', '2001-11-17', 200111177, 1000, '2023-02-19 17:22:03'),
(21, 'Данило Садовий', 'danylo.sadovyi@gmail.com', 'password', '2002-08-09', 200208091, 3000, '2023-03-07 16:06:27'),
(22, 'Володимир Гнатуша', 'volodymyr.hnatusha@gmail.com', 'password', '2002-05-02', 200205028, 5000, '2023-03-13 09:17:32'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ro_estates`
--
ALTER TABLE `ro_estates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ro_logs`
--
ALTER TABLE `ro_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `ro_messages`
--
ALTER TABLE `ro_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

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
