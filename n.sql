-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Фев 12 2017 г., 22:07
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `n`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(5) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(0, 'Categ 1'),
(1, 'Categ 2'),
(3, 'Politics');

-- --------------------------------------------------------

--
-- Структура таблицы `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `config` varchar(11) NOT NULL,
  `value` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `color`
--

INSERT INTO `color` (`id`, `config`, `value`) VALUES
(1, 'header', '#400000'),
(2, 'body', '#ffffff');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(10) UNSIGNED NOT NULL,
  `id_user` smallint(5) UNSIGNED NOT NULL,
  `id_pages` int(5) NOT NULL,
  `comment` text NOT NULL,
  `id_parent` int(10) UNSIGNED DEFAULT NULL,
  `cnt_like` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cnt_dislike` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id_comment`, `id_user`, `id_pages`, `comment`, `id_parent`, `cnt_like`, `cnt_dislike`, `is_active`) VALUES
(1, 1, 14, 'Ñ‹Ð²Ð°Ð²Ð°', 0, 2, 2, 1),
(2, 1, 14, 'Ñ‹Ð²Ð°Ð²Ð°', 1, 0, 0, 1),
(3, 1, 14, '333333', 0, 3, 0, 1),
(4, 1, 14, 'fhfhgfhfd', 3, 0, 0, 1),
(5, 1, 14, 'Ð½Ð½Ð½Ð½Ð½Ð½Ð½Ð½Ð½', 3, 0, 0, 1),
(6, 1, 14, '0000', 0, 0, 0, 1),
(7, 1, 14, '7', 0, 0, 0, 1),
(8, 1, 14, '1', 0, 0, 0, 1),
(9, 1, 14, '2', 0, 0, 0, 1),
(10, 1, 14, '3', 0, 0, 0, 1),
(11, 1, 14, '4', 0, 0, 0, 1),
(12, 1, 14, '44', 0, 0, 0, 1),
(13, 1, 14, '5', 0, 0, 0, 1),
(14, 1, 14, '5', 0, 0, 0, 1),
(15, 1, 14, '6', 0, 0, 0, 1),
(16, 1, 14, '8', 0, 0, 0, 1),
(17, 1, 14, '1111', 0, 0, 0, 1),
(18, 1, 14, '1111', 0, 0, 0, 1),
(19, 1, 14, '1111', 0, 0, 0, 1),
(20, 1, 14, '1111', 0, 0, 0, 1),
(21, 1, 14, '1111', 0, 0, 0, 1),
(22, 1, 14, '1111', 0, 0, 0, 1),
(23, 1, 14, 'Ð°Ð°Ð°Ð°Ð°Ð°Ð°Ð°', 0, 0, 0, 1),
(24, 1, 14, 'Ð²Ð²Ð²', 0, 0, 0, 1),
(25, 1, 14, 'fgfg', 0, 0, 0, 1),
(26, 1, 14, '1111111', 0, 0, 0, 1),
(27, 1, 14, '22222222', 0, 0, 0, 1),
(28, 1, 14, '44444444444', 0, 0, 0, 1),
(29, 2, 21, 'commm', 0, 1, 0, 1),
(30, 2, 21, 'dsfdsf', 29, 0, 0, 1),
(31, 3, 1, 'comment', 0, 0, 1, 1),
(32, 4, 21, 'coment3', 0, 2, 0, 1),
(33, 5, 10, 'pol com', 0, 0, 0, 0),
(34, 5, 10, 'pol', 0, 0, 0, 0),
(35, 1, 11, 'smth', 0, 0, 0, 1),
(36, 4, 16, '1', 0, 0, 0, 1),
(37, 4, 16, 'dfgfd', 0, 0, 0, 1),
(38, 4, 16, '222', 0, 0, 0, 1),
(39, 4, 16, '333', 36, 0, 0, 1),
(40, 4, 16, '444', 37, 0, 0, 1),
(41, 4, 16, '555', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(5) NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `content` text NOT NULL,
  `image` varchar(25) DEFAULT NULL,
  `is_published` tinyint(1) UNSIGNED DEFAULT '0',
  `categories_id` int(5) NOT NULL,
  `cnt_visit` int(25) NOT NULL,
  `is_analitic` tinyint(1) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT '2016-12-31 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `image`, `is_published`, `categories_id`, `cnt_visit`, `is_analitic`, `date`) VALUES
(1, 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', '2.jpg', 0, 1, 2, 1, '2016-12-31 00:00:00'),
(2, 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', '1.jpg', 0, 0, 2, 1, '2016-12-31 00:00:00'),
(3, 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', '1.jpg', 0, 0, 2, 1, '2016-12-31 00:00:00'),
(4, 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', '1.jpg', 0, 0, 2, 1, '2016-12-31 00:00:00'),
(5, 'Lorem Ipsumhgfh', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', '1.jpg', 0, 0, 2, 1, '2016-12-31 00:00:00'),
(6, 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', '1.jpg', 0, 0, 2, 1, '2016-12-31 00:00:00'),
(8, 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', '1.jpg', 1, 0, 2, 1, '2016-12-31 00:00:00'),
(9, 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', '1.jpg', 1, 0, 2, 1, '2016-12-31 00:00:00'),
(10, 'Lorem Ipsumfghfgh', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', '2.jpg', 1, 3, 2, 1, '2016-12-31 00:00:00'),
(11, 'Lorem Ipsum 11', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', '1.jpg', 0, 1, 2, 1, '2016-12-31 00:00:00'),
(12, 'Lorem 12', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', 'Chrysanthemum.jpg', 1, 0, 2, 1, '2016-12-31 00:00:00'),
(14, 'Lorem ipsum 14', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', 'Tulips.jpg', 1, 0, 2, 1, '2016-12-31 00:00:00'),
(15, 'Lorem ipsum 15', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', 'Jellyfish.jpg', 1, 0, 2, 1, '2016-12-31 00:00:00'),
(16, 'Lorem ipsum 16', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', 'Hydrangeas.jpg', 1, 0, 2, 1, '2016-12-31 00:00:00'),
(21, 'Lorem ipsum 21', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio lacus, tincidunt vel neque in, pharetra congue turpis. Nunc vestibulum elit vel suscipit sagittis. Phasellus faucibus nec augue ac tincidunt. Curabitur vestibulum ante tellus, quis rhoncus tellus interdum ac. Nam consequat, justo id sollicitudin tempus, neque sapien eleifend libero, a egestas risus eros mattis neque. Aliquam vitae fringilla est, eu accumsan purus. Duis mollis, sapien id pretium viverra, augue est tempor turpis, in varius risus urna a erat. Donec mattis lobortis tortor pharetra varius. Sed tincidunt sodales aliquam. Pellentesque turpis enim, vestibulum nec tincidunt nec, aliquam sed velit. Vivamus ultricies ipsum erat, eget pharetra enim maximus vel. Mauris eu vehicula velit. Phasellus eget eros eget quam vestibulum elementum. Integer at luctus felis, id ullamcorper felis. Aenean porttitor lacinia neque, ut laoreet ipsum pellentesque at. Sed at justo a tellus semper mattis sit amet eget nunc. Sed ultricies, nisl et ultrices condimentum, leo dui sodales velit, et pretium elit nunc vel orci. Proin sed mi turpis. Integer eleifend augue consectetur lorem lacinia placerat id at risus. Sed in felis sit amet arcu iaculis dapibus eu in metus. Phasellus luctus a mi tempor lacinia. In ac enim felis. Nullam posuere nunc non lorem pharetra finibus. Donec lobortis vel odio sed vestibulum. Nunc vehicula nibh diam, et tempus nunc euismod sed. Etiam dictum sem ipsum, ut maximus ante dignissim at. Curabitur pulvinar libero vel ultricies pharetra. Aliquam et quam ex. In euismod lectus mi, at vehicula magna gravida in.', 'Penguins.jpg', 1, 0, 2, 1, '2016-12-31 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `promotion`
--

CREATE TABLE `promotion` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` text NOT NULL,
  `price` double NOT NULL,
  `cnt` smallint(6) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `promotion`
--

INSERT INTO `promotion` (`id`, `product_name`, `price`, `cnt`, `is_active`) VALUES
(1, 'promo1', 199, 7, 1),
(2, 'promo2', 199, 1, 1),
(3, 'promo3', 299, 3, 1),
(4, 'promo4', 399, 1, 1),
(5, 'promo5', 299, 3, 1),
(6, 'promo6', 199, 5, 1),
(7, 'promo7', 299, 5, 1),
(8, 'promo8', 399, 9, 1),
(9, 'promo9', 499, 7, 1),
(10, 'promo10', 199, 7, 1),
(11, 'promo11', 499, 9, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id_tag` int(11) UNSIGNED NOT NULL,
  `tag_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id_tag`, `tag_name`) VALUES
(1, 'tag1'),
(2, 'tag2');

-- --------------------------------------------------------

--
-- Структура таблицы `tag_news`
--

CREATE TABLE `tag_news` (
  `id_news` int(5) NOT NULL,
  `id_tag` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tag_news`
--

INSERT INTO `tag_news` (`id_news`, `id_tag`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2),
(4, 1),
(5, 1),
(5, 2),
(6, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(21, 1),
(21, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `login` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'admin',
  `password` char(32) NOT NULL,
  `is_active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `role`, `password`, `is_active`) VALUES
(1, 'admin', 'admin@your-site.com', 'admin', '44ca5fa5c67e434b9e779c5febc46f06', 1),
(2, 'user1', '1@your-site.com', '', '44ca5fa5c67e434b9e779c5febc46f06', 1),
(3, 'user2', '2@your-site.com', '', '44ca5fa5c67e434b9e779c5febc46f06', 1),
(4, 'user3', '3@your-site.com', '', '44ca5fa5c67e434b9e779c5febc46f06', 1),
(5, 'user4', '4@your-site.com', '', '44ca5fa5c67e434b9e779c5febc46f06', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_user` (`id_user`,`id_pages`),
  ADD KEY `fk_comment_page` (`id_pages`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`);

--
-- Индексы таблицы `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id_tag`);

--
-- Индексы таблицы `tag_news`
--
ALTER TABLE `tag_news`
  ADD KEY `id_news` (`id_news`,`id_tag`),
  ADD KEY `fk_tn_tag` (`id_tag`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT для таблицы `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comment_page` FOREIGN KEY (`id_pages`) REFERENCES `pages` (`id`),
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_page_category` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `tag_news`
--
ALTER TABLE `tag_news`
  ADD CONSTRAINT `fk_tn_page` FOREIGN KEY (`id_news`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tn_tag` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
