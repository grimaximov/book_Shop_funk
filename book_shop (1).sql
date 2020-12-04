-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 20 2019 г., 19:12
-- Версия сервера: 10.4.6-MariaDB
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `book_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(10) UNSIGNED NOT NULL,
  `address_name` varchar(255) DEFAULT NULL,
  `address_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `addresses`
--

INSERT INTO `addresses` (`address_id`, `address_name`, `address_user_id`) VALUES
(1, 'Санкт-Петербург, Светлановский пр. д.57, кв.3', 1),
(2, 'Санкт-Петербург, ул. Карбышева д.4, кв.56', 2),
(3, 'Санкт-Петербург, Тореза пр. д.23, кв.43', 3),
(4, 'Санкт-Петербург, Манчегорская ул. д.12, кв.1', 4),
(5, 'Санкт-Петербург, Гидротехников ул. д.32, кв.11', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `author_id` tinyint(2) UNSIGNED NOT NULL,
  `author_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`author_id`, `author_name`) VALUES
(1, 'Лев Николаевич Толстой'),
(2, 'Федор Михайлович Достоевский'),
(3, 'Александр Сергеевич Пушкин'),
(4, 'Александр Сергеевич Грибоедов'),
(5, 'Чак Паланик');

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `book_id` tinyint(2) UNSIGNED NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_publisher_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `book_price` int(10) UNSIGNED DEFAULT NULL,
  `book_pages` varchar(6) DEFAULT NULL,
  `book_count` int(6) UNSIGNED DEFAULT NULL,
  `book_description` text DEFAULT NULL,
  `book_coverage` varchar(255) DEFAULT NULL,
  `book_year` year(4) DEFAULT NULL,
  `book_language_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `book_restriction_id` tinyint(1) UNSIGNED DEFAULT NULL,
  `book_isbn` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`book_id`, `book_name`, `book_publisher_id`, `book_price`, `book_pages`, `book_count`, `book_description`, `book_coverage`, `book_year`, `book_language_id`, `book_restriction_id`, `book_isbn`) VALUES
(1, '‚®©­  Ё ¬Ёа', 7, 900, '500', 20, 'agnsadpkbgnpasnbknasdfv ', '/asdgsdg/', 2018, 1, 2, '2-266-11156-6'),
(2, 'ЏаҐбвгЇ«Ґ­ЁҐ Ё ­ Є § ­ЁҐ', NULL, 800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2-266-11156-7'),
(3, '€¤Ё®в', NULL, 700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2-266-11156-8'),
(4, 'Война и мир', NULL, 900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2-266-11156-6'),
(5, 'Преступление и наказание', NULL, 800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2-266-11156-7'),
(6, 'Идиот', NULL, 700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2-266-11156-8'),
(7, 'Горе от ума', NULL, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2-266-15146-8'),
(8, 'Бойцовский клуб', NULL, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2-266-11156-9');

-- --------------------------------------------------------

--
-- Структура таблицы `books_authors`
--

CREATE TABLE `books_authors` (
  `book_author_id` tinyint(2) UNSIGNED NOT NULL,
  `book_author_author_id` tinyint(2) UNSIGNED DEFAULT NULL,
  `book_author_book_id` tinyint(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `books_authors`
--

INSERT INTO `books_authors` (`book_author_id`, `book_author_author_id`, `book_author_book_id`) VALUES
(2, 2, 2),
(4, 4, 4),
(5, 5, 5),
(11, 1, 1),
(12, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `books_genres`
--

CREATE TABLE `books_genres` (
  `book_genre_id` tinyint(2) UNSIGNED NOT NULL,
  `book_genre_genre_id` tinyint(2) UNSIGNED DEFAULT NULL,
  `book_genre_book_id` tinyint(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `books_genres`
--

INSERT INTO `books_genres` (`book_genre_id`, `book_genre_genre_id`, `book_genre_book_id`) VALUES
(1, 1, 1),
(2, 4, 1),
(3, 1, 2),
(4, 3, 3),
(5, 1, 4),
(6, 5, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `carts`
--

CREATE TABLE `carts` (
  `cart_id` tinyint(2) UNSIGNED NOT NULL,
  `cart_order_id` int(10) UNSIGNED DEFAULT NULL,
  `cart_book_id` tinyint(2) UNSIGNED DEFAULT NULL,
  `cart_book_count` int(6) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `carts`
--

INSERT INTO `carts` (`cart_id`, `cart_order_id`, `cart_book_id`, `cart_book_count`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 5),
(4, 4, 4, 1),
(5, 5, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `connects`
--

CREATE TABLE `connects` (
  `connect_id` int(10) UNSIGNED NOT NULL,
  `connect_token` char(32) NOT NULL,
  `connect_session` char(32) NOT NULL,
  `connect_user_id` int(10) UNSIGNED NOT NULL,
  `connect_token_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `connects`
--

INSERT INTO `connects` (`connect_id`, `connect_token`, `connect_session`, `connect_user_id`, `connect_token_time`) VALUES
(1, 'e8518d2bea449adc0610979a410a3036', 'dtusbphodlivtfp7npql0m6tur', 7, '2019-11-20 21:17:25');

-- --------------------------------------------------------

--
-- Структура таблицы `genders`
--

CREATE TABLE `genders` (
  `gender_id` tinyint(2) UNSIGNED NOT NULL,
  `gender_name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_name`) VALUES
(1, 'Мужчина'),
(2, 'Женщина');

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `genre_id` tinyint(2) UNSIGNED NOT NULL,
  `genre_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(1, 'драма'),
(2, 'мелодрама'),
(3, 'комедия'),
(4, 'исторический'),
(5, 'боевик');

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

CREATE TABLE `languages` (
  `language_id` tinyint(2) UNSIGNED NOT NULL,
  `language_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `languages`
--

INSERT INTO `languages` (`language_id`, `language_name`) VALUES
(1, 'Русский'),
(2, 'Английский'),
(3, 'Китайский');

-- --------------------------------------------------------

--
-- Структура таблицы `marks`
--

CREATE TABLE `marks` (
  `mark_id` int(10) UNSIGNED NOT NULL,
  `mark_user_id` int(10) UNSIGNED DEFAULT NULL,
  `mark_book_id` tinyint(2) UNSIGNED DEFAULT NULL,
  `mark_value` tinyint(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `marks`
--

INSERT INTO `marks` (`mark_id`, `mark_user_id`, `mark_book_id`, `mark_value`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 1),
(6, 2, 1, 2),
(7, 2, 2, 3),
(8, 2, 3, 5),
(9, 2, 4, 4),
(10, 2, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_number` int(10) UNSIGNED NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_delivery_date` date DEFAULT NULL,
  `order_user_id` int(10) UNSIGNED DEFAULT NULL,
  `order_status_id` tinyint(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `order_number`, `order_date`, `order_delivery_date`, `order_user_id`, `order_status_id`) VALUES
(1, 1, '2019-11-08 14:30:00', '2019-11-09', 1, 1),
(2, 2, '2019-11-08 14:31:00', '2019-11-10', 2, 1),
(3, 1, '2019-11-08 14:32:00', '2019-11-11', 3, 2),
(4, 1, '2019-11-08 14:33:00', '2019-11-12', 4, 4),
(5, 1, '2019-11-08 14:34:00', '2019-11-13', 5, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `publishers`
--

CREATE TABLE `publishers` (
  `publisher_id` tinyint(2) UNSIGNED NOT NULL,
  `publisher_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `publishers`
--

INSERT INTO `publishers` (`publisher_id`, `publisher_name`) VALUES
(1, 'Первое'),
(2, 'Второе'),
(3, 'Третье'),
(4, 'Четвертое'),
(5, 'Пятое'),
(6, 'Первое'),
(7, 'Второе'),
(8, 'Третье'),
(9, 'Четвертое'),
(10, 'Пятое');

-- --------------------------------------------------------

--
-- Структура таблицы `restrictions`
--

CREATE TABLE `restrictions` (
  `restriction_id` tinyint(2) UNSIGNED NOT NULL,
  `restriction_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `restrictions`
--

INSERT INTO `restrictions` (`restriction_id`, `restriction_name`) VALUES
(1, '0 - 6 мес.'),
(2, '6 мес. - 3 года'),
(3, '3 года - 6 лет'),
(4, '6 лет - 18 лет'),
(5, '18+');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `role_id` tinyint(2) UNSIGNED NOT NULL,
  `role_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Ђ¤¬Ё­Ёбва в®а'),
(2, 'Њ®¤Ґа в®а'),
(3, 'Џ®«м§®ў вҐ«м'),
(4, 'Администратор'),
(5, 'Модератор'),
(6, 'Пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
  `status_id` tinyint(2) UNSIGNED NOT NULL,
  `status_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`status_id`, `status_name`) VALUES
(1, 'получен'),
(2, 'в работе'),
(3, 'отгружен'),
(4, 'отказ'),
(5, 'выполнен');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_surname` varchar(100) DEFAULT NULL,
  `user_login` varchar(100) DEFAULT NULL,
  `user_password` char(32) DEFAULT NULL,
  `user_phone` varchar(30) DEFAULT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_dob` date DEFAULT NULL,
  `user_role_id` tinyint(2) UNSIGNED DEFAULT NULL,
  `user_gender_id` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_surname`, `user_login`, `user_password`, `user_phone`, `user_email`, `user_dob`, `user_role_id`, `user_gender_id`) VALUES
(1, 'Павел', 'Петров', 'pav_pet', 'pav_pet', '89058415232', 'pav_pet@mail.ru', '1988-12-03', 1, 1),
(2, 'Владимир', 'Новиков', 'val_nov', 'val_nov', '89058458632', 'val_nov@mail.ru', '1987-05-12', 3, 1),
(3, 'Мария', 'Сопликова', 'mar_sopli', 'mar_sopli', '89012348632', 'mar_sopli@mail.ru', '1993-07-24', 3, 2),
(4, 'Дуранбек', 'Абырхазизов', 'dur_abir', 'dur_abir', '89235888632', 'dur_abir@mail.ru', '1983-08-14', 3, 1),
(5, 'Евгения', 'Улюлюкова', 'evg_ulul', 'evg_ulul', '89012325132', 'evg_ulul@mail.ru', '1998-10-15', 3, 2),
(6, NULL, NULL, NULL, 'd41d8cd98f00b204e9800998ecf8427e', NULL, '', NULL, 3, NULL),
(7, NULL, NULL, NULL, '81dc9bdb52d04dc20036dbd8313ed055', NULL, 'aa@aa2.ru', NULL, 1, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_user_id` (`address_user_id`);

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `book_publisher_id` (`book_publisher_id`),
  ADD KEY `book_language_id` (`book_language_id`),
  ADD KEY `book_restriction_id` (`book_restriction_id`);

--
-- Индексы таблицы `books_authors`
--
ALTER TABLE `books_authors`
  ADD PRIMARY KEY (`book_author_id`),
  ADD KEY `book_author_author_id` (`book_author_author_id`),
  ADD KEY `book_author_book_id` (`book_author_book_id`);

--
-- Индексы таблицы `books_genres`
--
ALTER TABLE `books_genres`
  ADD PRIMARY KEY (`book_genre_id`),
  ADD KEY `book_genre_genre_id` (`book_genre_genre_id`),
  ADD KEY `book_genre_book_id` (`book_genre_book_id`);

--
-- Индексы таблицы `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_order_id` (`cart_order_id`),
  ADD KEY `cart_book_id` (`cart_book_id`);

--
-- Индексы таблицы `connects`
--
ALTER TABLE `connects`
  ADD PRIMARY KEY (`connect_id`);

--
-- Индексы таблицы `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Индексы таблицы `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Индексы таблицы `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`mark_id`),
  ADD KEY `mark_user_id` (`mark_user_id`),
  ADD KEY `mark_book_id` (`mark_book_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_user_id` (`order_user_id`),
  ADD KEY `order_status_id` (`order_status_id`);

--
-- Индексы таблицы `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Индексы таблицы `restrictions`
--
ALTER TABLE `restrictions`
  ADD PRIMARY KEY (`restriction_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `user_gender_id` (`user_gender_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `book_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `books_authors`
--
ALTER TABLE `books_authors`
  MODIFY `book_author_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `books_genres`
--
ALTER TABLE `books_genres`
  MODIFY `book_genre_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `connects`
--
ALTER TABLE `connects`
  MODIFY `connect_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `genders`
--
ALTER TABLE `genders`
  MODIFY `gender_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `marks`
--
ALTER TABLE `marks`
  MODIFY `mark_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `publishers`
--
ALTER TABLE `publishers`
  MODIFY `publisher_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `restrictions`
--
ALTER TABLE `restrictions`
  MODIFY `restriction_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `statuses`
--
ALTER TABLE `statuses`
  MODIFY `status_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`address_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`book_publisher_id`) REFERENCES `publishers` (`publisher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`book_language_id`) REFERENCES `languages` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`book_restriction_id`) REFERENCES `restrictions` (`restriction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_authors`
--
ALTER TABLE `books_authors`
  ADD CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`book_author_author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_authors_ibfk_2` FOREIGN KEY (`book_author_book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_genres`
--
ALTER TABLE `books_genres`
  ADD CONSTRAINT `books_genres_ibfk_1` FOREIGN KEY (`book_genre_genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_genres_ibfk_2` FOREIGN KEY (`book_genre_book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`cart_order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`cart_book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`mark_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`mark_book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_status_id`) REFERENCES `statuses` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`user_role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`user_gender_id`) REFERENCES `genders` (`gender_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
