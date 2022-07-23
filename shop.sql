-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 23 2022 г., 07:27
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `name`, `description`) VALUES
(1, 'Блузы и рубашки', 'Блузы и рубашки...'),
(2, 'Брюки', 'Брюки...'),
(3, 'Платья и сарафаны', 'Платья и сарафаны...'),
(4, 'Юбки', 'Юбки...');

-- --------------------------------------------------------

--
-- Структура таблицы `picture`
--

CREATE TABLE `picture` (
  `picture_id` int(11) NOT NULL,
  `path` text NOT NULL,
  `alt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `picture`
--

INSERT INTO `picture` (`picture_id`, `path`, `alt`) VALUES
(1, 'assets/1/1.png', 'Блуза'),
(2, 'assets/1/2.png', 'Блуза');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`product_id`, `name`, `description`, `is_active`) VALUES
(1, 'Блуза', 'Блуза...', 1),
(2, 'Рубашка', 'Рубашка...', 1),
(3, 'Кимоно', 'Кимоно...', 1),
(4, 'Кюлоты', 'Кюлоты...', 1),
(5, 'Карго', 'Карго...', 1),
(6, 'Корги', 'Корги...', 0),
(7, 'Кожаные брюки', 'Кожаные брюки...', 1),
(8, 'Тайтсы', 'Тайтсы...', 1),
(9, 'Шорты', 'Шорты...', 1),
(10, 'Джоггеры', 'Джоггеры...', 1),
(11, 'Джокеры', 'Джокеры...', 0),
(12, 'Леггинсы', 'Леггинсы...', 1),
(13, 'Спортивные брюки', 'Спортивные брюки...', 1),
(14, 'Сарафан', 'Сарафан...', 1),
(15, 'Платье-майка', 'Платье-майка...', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_and_category`
--

CREATE TABLE `product_and_category` (
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `is_main` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `product_and_category`
--

INSERT INTO `product_and_category` (`category_id`, `product_id`, `is_main`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 4, 1),
(2, 5, 1),
(2, 6, 1),
(2, 7, 1),
(2, 8, 1),
(2, 9, 1),
(2, 10, 1),
(2, 11, 1),
(2, 12, 1),
(2, 13, 1),
(3, 3, 0),
(3, 14, 1),
(3, 15, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_and_picture`
--

CREATE TABLE `product_and_picture` (
  `product_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  `is_main` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `product_and_picture`
--

INSERT INTO `product_and_picture` (`product_id`, `picture_id`, `is_main`) VALUES
(1, 1, 1),
(1, 2, 0),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_price`
--

CREATE TABLE `product_price` (
  `product_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `price_discount` decimal(10,2) DEFAULT NULL,
  `price_promo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `product_price`
--

INSERT INTO `product_price` (`product_id`, `price`, `price_discount`, `price_promo`) VALUES
(1, '3000.00', '1500.00', '1000.00'),
(2, '6000.00', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`picture_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `product_and_category`
--
ALTER TABLE `product_and_category`
  ADD PRIMARY KEY (`category_id`,`product_id`);

--
-- Индексы таблицы `product_and_picture`
--
ALTER TABLE `product_and_picture`
  ADD PRIMARY KEY (`product_id`,`picture_id`);

--
-- Индексы таблицы `product_price`
--
ALTER TABLE `product_price`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `picture`
--
ALTER TABLE `picture`
  MODIFY `picture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `product_price`
--
ALTER TABLE `product_price`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
