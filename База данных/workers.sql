-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 25 2020 г., 21:45
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `workers`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accesslevels`
--

CREATE TABLE IF NOT EXISTS `accesslevels` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `accesslevels`
--

INSERT INTO `accesslevels` (`Id`, `Name`) VALUES
(1, 'Администратор'),
(2, 'Начальник'),
(3, 'Руководитель'),
(4, 'Работник');

-- --------------------------------------------------------

--
-- Структура таблицы `daytypes`
--

CREATE TABLE IF NOT EXISTS `daytypes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `daytypes`
--

INSERT INTO `daytypes` (`Id`, `Description`) VALUES
(1, 'Рабочий день'),
(2, 'Выходной'),
(3, 'Больничный'),
(4, 'Отпуск'),
(5, 'Не определён');

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`Id`, `Name`) VALUES
(1, 'Разработок'),
(2, 'Тестирования');

-- --------------------------------------------------------

--
-- Структура таблицы `plans`
--

CREATE TABLE IF NOT EXISTS `plans` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkerId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `StartOfDay` time NOT NULL,
  `EndOfDay` time NOT NULL,
  `DayType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `Id_Worker` (`WorkerId`),
  KEY `Total` (`DayType`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=367 ;

--
-- Дамп данных таблицы `plans`
--

INSERT INTO `plans` (`Id`, `WorkerId`, `Date`, `StartOfDay`, `EndOfDay`, `DayType`) VALUES
(1, 1, '2020-05-01', '08:30:00', '17:20:00', 1),
(2, 1, '2020-05-02', '08:30:00', '17:20:00', 1),
(3, 1, '2020-05-03', '08:30:00', '17:20:00', 2),
(4, 1, '2020-05-04', '08:30:00', '17:20:00', 2),
(5, 1, '2020-05-05', '08:30:00', '17:20:00', 1),
(6, 1, '2020-05-06', '08:30:00', '17:20:00', 1),
(7, 1, '2020-05-07', '08:30:00', '17:20:00', 2),
(8, 1, '2020-05-08', '08:30:00', '17:20:00', 2),
(9, 1, '2020-05-09', '08:30:00', '17:20:00', 1),
(10, 1, '2020-05-10', '08:30:00', '17:20:00', 1),
(11, 1, '2020-05-11', '08:30:00', '17:20:00', 2),
(12, 1, '2020-05-12', '08:30:00', '17:20:00', 2),
(13, 1, '2020-05-13', '08:30:00', '17:20:00', 1),
(14, 1, '2020-05-14', '08:30:00', '17:20:00', 1),
(15, 1, '2020-05-15', '08:30:00', '17:20:00', 2),
(16, 1, '2020-05-16', '08:30:00', '17:20:00', 2),
(17, 1, '2020-05-17', '08:30:00', '17:20:00', 1),
(18, 1, '2020-05-18', '08:30:00', '17:20:00', 1),
(19, 1, '2020-05-19', '08:30:00', '17:20:00', 2),
(20, 1, '2020-05-20', '08:30:00', '17:20:00', 2),
(21, 1, '2020-05-21', '08:30:00', '17:20:00', 1),
(22, 1, '2020-05-22', '08:30:00', '17:20:00', 1),
(23, 1, '2020-05-23', '08:30:00', '17:20:00', 2),
(24, 1, '2020-05-24', '08:30:00', '17:20:00', 3),
(25, 1, '2020-05-25', '08:30:00', '17:20:00', 3),
(26, 1, '2020-05-26', '08:30:00', '17:20:00', 3),
(27, 1, '2020-05-27', '08:30:00', '17:20:00', 3),
(28, 1, '2020-05-28', '08:30:00', '17:20:00', 3),
(29, 1, '2020-05-29', '08:30:00', '17:20:00', 1),
(30, 1, '2020-05-30', '08:30:00', '17:20:00', 1),
(31, 1, '2020-05-31', '08:30:00', '17:20:00', 2),
(32, 1, '2020-06-01', '08:30:00', '17:20:00', 2),
(33, 1, '2020-06-02', '08:30:00', '17:20:00', 1),
(34, 1, '2020-06-03', '08:30:00', '17:20:00', 1),
(35, 1, '2020-06-04', '08:30:00', '17:20:00', 2),
(36, 1, '2020-06-05', '08:30:00', '17:20:00', 2),
(37, 1, '2020-06-06', '08:30:00', '17:20:00', 1),
(38, 1, '2020-06-07', '08:30:00', '17:20:00', 1),
(39, 1, '2020-06-08', '08:30:00', '17:20:00', 2),
(40, 1, '2020-06-09', '08:30:00', '17:20:00', 2),
(41, 1, '2020-06-10', '08:30:00', '17:20:00', 1),
(42, 1, '2020-06-11', '08:30:00', '17:20:00', 1),
(43, 1, '2020-06-12', '08:30:00', '17:20:00', 2),
(44, 1, '2020-06-13', '08:30:00', '17:20:00', 4),
(45, 1, '2020-06-14', '08:30:00', '17:20:00', 4),
(46, 1, '2020-06-15', '08:30:00', '17:20:00', 4),
(47, 1, '2020-06-16', '08:30:00', '17:20:00', 4),
(48, 1, '2020-06-17', '08:30:00', '17:20:00', 4),
(49, 1, '2020-06-18', '08:30:00', '17:20:00', 4),
(50, 1, '2020-06-19', '08:30:00', '17:20:00', 4),
(51, 1, '2020-06-20', '08:30:00', '17:20:00', 2),
(52, 1, '2020-06-21', '08:30:00', '17:20:00', 2),
(53, 1, '2020-06-22', '08:30:00', '17:20:00', 1),
(54, 1, '2020-06-23', '08:30:00', '17:20:00', 1),
(55, 1, '2020-06-24', '08:30:00', '17:20:00', 2),
(56, 1, '2020-06-25', '08:30:00', '17:20:00', 2),
(57, 1, '2020-06-26', '08:30:00', '17:20:00', 1),
(58, 1, '2020-06-27', '08:30:00', '17:20:00', 1),
(59, 1, '2020-06-28', '08:30:00', '17:20:00', 2),
(60, 1, '2020-06-29', '08:30:00', '17:20:00', 2),
(61, 1, '2020-06-30', '08:30:00', '17:20:00', 1),
(62, 2, '2020-05-01', '08:20:00', '16:00:00', 1),
(63, 2, '2020-05-02', '08:20:00', '16:00:00', 1),
(64, 2, '2020-05-03', '08:20:00', '16:00:00', 2),
(65, 2, '2020-05-04', '08:20:00', '16:00:00', 2),
(66, 2, '2020-05-05', '08:20:00', '16:00:00', 1),
(67, 2, '2020-05-06', '08:20:00', '16:00:00', 1),
(68, 2, '2020-05-07', '08:20:00', '16:00:00', 2),
(69, 2, '2020-05-08', '08:20:00', '16:00:00', 2),
(70, 2, '2020-05-09', '08:20:00', '16:00:00', 4),
(71, 2, '2020-05-10', '08:20:00', '16:00:00', 4),
(72, 2, '2020-05-11', '08:20:00', '16:00:00', 4),
(73, 2, '2020-05-12', '08:20:00', '16:00:00', 4),
(74, 2, '2020-05-13', '08:20:00', '16:00:00', 1),
(75, 2, '2020-05-14', '08:20:00', '16:00:00', 1),
(76, 2, '2020-05-15', '08:20:00', '16:00:00', 2),
(77, 2, '2020-05-16', '08:20:00', '16:00:00', 2),
(78, 2, '2020-05-17', '08:20:00', '16:00:00', 1),
(79, 2, '2020-05-18', '08:20:00', '16:00:00', 1),
(80, 2, '2020-05-19', '08:20:00', '16:00:00', 2),
(81, 2, '2020-05-20', '08:20:00', '16:00:00', 2),
(82, 2, '2020-05-21', '08:20:00', '16:00:00', 1),
(83, 2, '2020-05-22', '08:20:00', '16:00:00', 1),
(84, 2, '2020-05-23', '08:20:00', '16:00:00', 2),
(85, 2, '2020-05-24', '08:20:00', '16:00:00', 2),
(86, 2, '2020-05-25', '08:20:00', '16:00:00', 1),
(87, 2, '2020-05-26', '08:20:00', '16:00:00', 1),
(88, 2, '2020-05-27', '08:20:00', '16:00:00', 2),
(89, 2, '2020-05-28', '08:20:00', '16:00:00', 2),
(90, 2, '2020-05-29', '08:20:00', '16:00:00', 1),
(91, 2, '2020-05-30', '08:20:00', '16:00:00', 1),
(92, 2, '2020-05-31', '08:20:00', '16:00:00', 2),
(93, 2, '2020-06-01', '08:20:00', '16:00:00', 2),
(94, 2, '2020-06-02', '08:20:00', '16:00:00', 1),
(95, 2, '2020-06-03', '08:20:00', '16:00:00', 1),
(96, 2, '2020-06-04', '08:20:00', '16:00:00', 2),
(97, 2, '2020-06-05', '08:20:00', '16:00:00', 2),
(98, 2, '2020-06-06', '08:20:00', '16:00:00', 1),
(99, 2, '2020-06-07', '08:20:00', '16:00:00', 1),
(100, 2, '2020-06-08', '08:20:00', '16:00:00', 2),
(101, 2, '2020-06-09', '08:20:00', '16:00:00', 3),
(102, 2, '2020-06-10', '08:20:00', '16:00:00', 3),
(103, 2, '2020-06-11', '08:20:00', '16:00:00', 3),
(104, 2, '2020-06-12', '08:20:00', '16:00:00', 3),
(105, 2, '2020-06-13', '08:20:00', '16:00:00', 3),
(106, 2, '2020-06-14', '08:20:00', '16:00:00', 3),
(107, 2, '2020-06-15', '08:20:00', '16:00:00', 1),
(108, 2, '2020-06-16', '08:20:00', '16:00:00', 2),
(109, 2, '2020-06-17', '08:20:00', '16:00:00', 2),
(110, 2, '2020-06-18', '08:20:00', '16:00:00', 1),
(111, 2, '2020-06-19', '08:20:00', '16:00:00', 1),
(112, 2, '2020-06-20', '08:20:00', '16:00:00', 2),
(113, 2, '2020-06-21', '08:20:00', '16:00:00', 2),
(114, 2, '2020-06-22', '08:20:00', '16:00:00', 1),
(115, 2, '2020-06-23', '08:20:00', '16:00:00', 1),
(116, 2, '2020-06-24', '08:20:00', '16:00:00', 2),
(117, 2, '2020-06-25', '08:20:00', '16:00:00', 2),
(118, 2, '2020-06-26', '08:20:00', '16:00:00', 1),
(119, 2, '2020-06-27', '08:20:00', '16:00:00', 1),
(120, 2, '2020-06-28', '08:20:00', '16:00:00', 2),
(121, 2, '2020-06-29', '08:20:00', '16:00:00', 2),
(122, 2, '2020-06-30', '08:20:00', '16:00:00', 1),
(123, 3, '2020-05-01', '08:50:00', '16:30:00', 1),
(124, 3, '2020-05-02', '08:50:00', '16:30:00', 1),
(125, 3, '2020-05-03', '08:50:00', '16:30:00', 2),
(126, 3, '2020-05-04', '08:50:00', '16:30:00', 2),
(127, 3, '2020-05-05', '08:50:00', '16:30:00', 1),
(128, 3, '2020-05-06', '08:50:00', '16:30:00', 1),
(129, 3, '2020-05-07', '08:50:00', '16:30:00', 2),
(130, 3, '2020-05-08', '08:50:00', '16:30:00', 2),
(131, 3, '2020-05-09', '08:50:00', '16:30:00', 1),
(132, 3, '2020-05-10', '08:50:00', '16:30:00', 1),
(133, 3, '2020-05-11', '08:50:00', '16:30:00', 3),
(134, 3, '2020-05-12', '08:50:00', '16:30:00', 3),
(135, 3, '2020-05-13', '08:50:00', '16:30:00', 3),
(136, 3, '2020-05-14', '08:50:00', '16:30:00', 3),
(137, 3, '2020-05-15', '08:50:00', '16:30:00', 3),
(138, 3, '2020-05-16', '08:50:00', '16:30:00', 2),
(139, 3, '2020-05-17', '08:50:00', '16:30:00', 1),
(140, 3, '2020-05-18', '08:50:00', '16:30:00', 1),
(141, 3, '2020-05-19', '08:50:00', '16:30:00', 2),
(142, 3, '2020-05-20', '08:50:00', '16:30:00', 2),
(143, 3, '2020-05-21', '08:50:00', '16:30:00', 1),
(144, 3, '2020-05-22', '08:50:00', '16:30:00', 1),
(145, 3, '2020-05-23', '08:50:00', '16:30:00', 2),
(146, 3, '2020-05-24', '08:50:00', '16:30:00', 2),
(147, 3, '2020-05-25', '08:50:00', '16:30:00', 1),
(148, 3, '2020-05-26', '08:50:00', '16:30:00', 1),
(149, 3, '2020-05-27', '08:50:00', '16:30:00', 2),
(150, 3, '2020-05-28', '08:50:00', '16:30:00', 2),
(151, 3, '2020-05-29', '08:50:00', '16:30:00', 1),
(152, 3, '2020-05-30', '08:50:00', '16:30:00', 1),
(153, 3, '2020-05-31', '08:50:00', '16:30:00', 2),
(154, 3, '2020-06-01', '08:50:00', '16:30:00', 4),
(155, 3, '2020-06-02', '08:50:00', '16:30:00', 4),
(156, 3, '2020-06-03', '08:50:00', '16:30:00', 4),
(157, 3, '2020-06-04', '08:50:00', '16:30:00', 4),
(158, 3, '2020-06-05', '08:50:00', '16:30:00', 4),
(159, 3, '2020-06-06', '08:50:00', '16:30:00', 4),
(160, 3, '2020-06-07', '08:50:00', '16:30:00', 4),
(161, 3, '2020-06-08', '08:50:00', '16:30:00', 2),
(162, 3, '2020-06-09', '08:50:00', '16:30:00', 2),
(163, 3, '2020-06-10', '08:50:00', '16:30:00', 1),
(164, 3, '2020-06-11', '08:50:00', '16:30:00', 1),
(165, 3, '2020-06-12', '08:50:00', '16:30:00', 2),
(166, 3, '2020-06-13', '08:50:00', '16:30:00', 2),
(167, 3, '2020-06-14', '08:50:00', '16:30:00', 1),
(168, 3, '2020-06-15', '08:50:00', '16:30:00', 1),
(169, 3, '2020-06-16', '08:50:00', '16:30:00', 2),
(170, 3, '2020-06-17', '08:50:00', '16:30:00', 2),
(171, 3, '2020-06-18', '08:50:00', '16:30:00', 1),
(172, 3, '2020-06-19', '08:50:00', '16:30:00', 1),
(173, 3, '2020-06-20', '08:50:00', '16:30:00', 2),
(174, 3, '2020-06-21', '08:50:00', '16:30:00', 2),
(175, 3, '2020-06-22', '08:50:00', '16:30:00', 1),
(176, 3, '2020-06-23', '08:50:00', '16:30:00', 1),
(177, 3, '2020-06-24', '08:50:00', '16:30:00', 2),
(178, 3, '2020-06-25', '08:50:00', '16:30:00', 2),
(179, 3, '2020-06-26', '08:50:00', '16:30:00', 1),
(180, 3, '2020-06-27', '08:50:00', '16:30:00', 1),
(181, 3, '2020-06-28', '08:50:00', '16:30:00', 2),
(182, 3, '2020-06-29', '08:50:00', '16:30:00', 2),
(183, 3, '2020-06-30', '08:50:00', '16:30:00', 1),
(184, 4, '2020-05-01', '09:30:00', '16:10:00', 3),
(185, 4, '2020-05-02', '09:30:00', '16:10:00', 3),
(186, 4, '2020-05-03', '09:30:00', '16:10:00', 3),
(187, 4, '2020-05-04', '09:30:00', '16:10:00', 3),
(188, 4, '2020-05-05', '09:30:00', '16:10:00', 3),
(189, 4, '2020-05-06', '09:30:00', '16:10:00', 3),
(190, 4, '2020-05-07', '09:30:00', '16:10:00', 3),
(191, 4, '2020-05-08', '09:30:00', '16:10:00', 3),
(192, 4, '2020-05-09', '09:30:00', '16:10:00', 1),
(193, 4, '2020-05-10', '09:30:00', '16:10:00', 1),
(194, 4, '2020-05-11', '09:30:00', '16:10:00', 2),
(195, 4, '2020-05-12', '09:30:00', '16:10:00', 2),
(196, 4, '2020-05-13', '09:30:00', '16:10:00', 1),
(197, 4, '2020-05-14', '09:30:00', '16:10:00', 1),
(198, 4, '2020-05-15', '09:30:00', '16:10:00', 2),
(199, 4, '2020-05-16', '09:30:00', '16:10:00', 2),
(200, 4, '2020-05-17', '09:30:00', '16:10:00', 1),
(201, 4, '2020-05-18', '09:30:00', '16:10:00', 1),
(202, 4, '2020-05-19', '09:30:00', '16:10:00', 2),
(203, 4, '2020-05-20', '09:30:00', '16:10:00', 2),
(204, 4, '2020-05-21', '09:30:00', '16:10:00', 1),
(205, 4, '2020-05-22', '09:30:00', '16:10:00', 1),
(206, 4, '2020-05-23', '09:30:00', '16:10:00', 2),
(207, 4, '2020-05-24', '09:30:00', '16:10:00', 2),
(208, 4, '2020-05-25', '09:30:00', '16:10:00', 1),
(209, 4, '2020-05-26', '09:30:00', '16:10:00', 1),
(210, 4, '2020-05-27', '09:30:00', '16:10:00', 2),
(211, 4, '2020-05-28', '09:30:00', '16:10:00', 2),
(212, 4, '2020-05-29', '09:30:00', '16:10:00', 1),
(213, 4, '2020-05-30', '09:30:00', '16:10:00', 1),
(214, 4, '2020-05-31', '09:30:00', '16:10:00', 2),
(215, 4, '2020-06-01', '09:30:00', '16:10:00', 2),
(216, 4, '2020-06-02', '09:30:00', '16:10:00', 1),
(217, 4, '2020-06-03', '09:30:00', '16:10:00', 1),
(218, 4, '2020-06-04', '09:30:00', '16:10:00', 2),
(219, 4, '2020-06-05', '09:30:00', '16:10:00', 2),
(220, 4, '2020-06-06', '09:30:00', '16:10:00', 1),
(221, 4, '2020-06-07', '09:30:00', '16:10:00', 1),
(222, 4, '2020-06-08', '09:30:00', '16:10:00', 2),
(223, 4, '2020-06-09', '09:30:00', '16:10:00', 2),
(224, 4, '2020-06-10', '09:30:00', '16:10:00', 1),
(225, 4, '2020-06-11', '09:30:00', '16:10:00', 1),
(226, 4, '2020-06-12', '09:30:00', '16:10:00', 2),
(227, 4, '2020-06-13', '09:30:00', '16:10:00', 2),
(228, 4, '2020-06-14', '09:30:00', '16:10:00', 1),
(229, 4, '2020-06-15', '09:30:00', '16:10:00', 1),
(230, 4, '2020-06-16', '09:30:00', '16:10:00', 2),
(231, 4, '2020-06-17', '09:30:00', '16:10:00', 2),
(232, 4, '2020-06-18', '09:30:00', '16:10:00', 1),
(233, 4, '2020-06-19', '09:30:00', '16:10:00', 1),
(234, 4, '2020-06-20', '09:30:00', '16:10:00', 2),
(235, 4, '2020-06-21', '09:30:00', '16:10:00', 2),
(236, 4, '2020-06-22', '09:30:00', '16:10:00', 1),
(237, 4, '2020-06-23', '09:30:00', '16:10:00', 1),
(238, 4, '2020-06-24', '09:30:00', '16:10:00', 2),
(239, 4, '2020-06-25', '09:30:00', '16:10:00', 2),
(240, 4, '2020-06-26', '09:30:00', '16:10:00', 4),
(241, 4, '2020-06-27', '09:30:00', '16:10:00', 4),
(242, 4, '2020-06-28', '09:30:00', '16:10:00', 4),
(243, 4, '2020-06-29', '09:30:00', '16:10:00', 4),
(244, 4, '2020-06-30', '09:30:00', '16:10:00', 4),
(245, 5, '2020-05-01', '08:10:00', '16:50:00', 1),
(246, 5, '2020-05-02', '08:10:00', '16:50:00', 1),
(247, 5, '2020-05-03', '08:10:00', '16:50:00', 2),
(248, 5, '2020-05-04', '08:10:00', '16:50:00', 2),
(249, 5, '2020-05-05', '08:10:00', '16:50:00', 1),
(250, 5, '2020-05-06', '08:10:00', '16:50:00', 1),
(251, 5, '2020-05-07', '08:10:00', '16:50:00', 2),
(252, 5, '2020-05-08', '08:10:00', '16:50:00', 2),
(253, 5, '2020-05-09', '08:10:00', '16:50:00', 1),
(254, 5, '2020-05-10', '08:10:00', '16:50:00', 3),
(255, 5, '2020-05-11', '08:10:00', '16:50:00', 3),
(256, 5, '2020-05-12', '08:10:00', '16:50:00', 3),
(257, 5, '2020-05-13', '08:10:00', '16:50:00', 3),
(258, 5, '2020-05-14', '08:10:00', '16:50:00', 1),
(259, 5, '2020-05-15', '08:10:00', '16:50:00', 2),
(260, 5, '2020-05-16', '08:10:00', '16:50:00', 2),
(261, 5, '2020-05-17', '08:10:00', '16:50:00', 1),
(262, 5, '2020-05-18', '08:10:00', '16:50:00', 1),
(263, 5, '2020-05-19', '08:10:00', '16:50:00', 2),
(264, 5, '2020-05-20', '08:10:00', '16:50:00', 2),
(265, 5, '2020-05-21', '08:10:00', '16:50:00', 1),
(266, 5, '2020-05-22', '08:10:00', '16:50:00', 1),
(267, 5, '2020-05-23', '08:10:00', '16:50:00', 2),
(268, 5, '2020-05-24', '08:10:00', '16:50:00', 4),
(269, 5, '2020-05-25', '08:10:00', '16:50:00', 4),
(270, 5, '2020-05-26', '08:10:00', '16:50:00', 4),
(271, 5, '2020-05-27', '08:10:00', '16:50:00', 4),
(272, 5, '2020-05-28', '08:10:00', '16:50:00', 4),
(273, 5, '2020-05-29', '08:10:00', '16:50:00', 4),
(274, 5, '2020-05-30', '08:10:00', '16:50:00', 1),
(275, 5, '2020-05-31', '08:10:00', '16:50:00', 2),
(276, 5, '2020-06-01', '08:10:00', '16:50:00', 2),
(277, 5, '2020-06-02', '08:10:00', '16:50:00', 1),
(278, 5, '2020-06-03', '08:10:00', '16:50:00', 1),
(279, 5, '2020-06-04', '08:10:00', '16:50:00', 2),
(280, 5, '2020-06-05', '08:10:00', '16:50:00', 2),
(281, 5, '2020-06-06', '08:10:00', '16:50:00', 1),
(282, 5, '2020-06-07', '08:10:00', '16:50:00', 1),
(283, 5, '2020-06-08', '08:10:00', '16:50:00', 2),
(284, 5, '2020-06-09', '08:10:00', '16:50:00', 2),
(285, 5, '2020-06-10', '08:10:00', '16:50:00', 1),
(286, 5, '2020-06-11', '08:10:00', '16:50:00', 1),
(287, 5, '2020-06-12', '08:10:00', '16:50:00', 2),
(288, 5, '2020-06-13', '08:10:00', '16:50:00', 2),
(289, 5, '2020-06-14', '08:10:00', '16:50:00', 1),
(290, 5, '2020-06-15', '08:10:00', '16:50:00', 1),
(291, 5, '2020-06-16', '08:10:00', '16:50:00', 2),
(292, 5, '2020-06-17', '08:10:00', '16:50:00', 2),
(293, 5, '2020-06-18', '08:10:00', '16:50:00', 1),
(294, 5, '2020-06-19', '08:10:00', '16:50:00', 1),
(295, 5, '2020-06-20', '08:10:00', '16:50:00', 2),
(296, 5, '2020-06-21', '08:10:00', '16:50:00', 2),
(297, 5, '2020-06-22', '08:10:00', '16:50:00', 1),
(298, 5, '2020-06-23', '08:10:00', '16:50:00', 1),
(299, 5, '2020-06-24', '08:10:00', '16:50:00', 2),
(300, 5, '2020-06-25', '08:10:00', '16:50:00', 2),
(301, 5, '2020-06-26', '08:10:00', '16:50:00', 1),
(302, 5, '2020-06-27', '08:10:00', '16:50:00', 1),
(303, 5, '2020-06-28', '08:10:00', '16:50:00', 2),
(304, 5, '2020-06-29', '08:10:00', '16:50:00', 2),
(305, 5, '2020-06-30', '08:10:00', '16:50:00', 1),
(306, 6, '2020-05-01', '08:40:00', '16:40:00', 1),
(307, 6, '2020-05-02', '08:40:00', '16:40:00', 1),
(308, 6, '2020-05-03', '08:40:00', '16:40:00', 2),
(309, 6, '2020-05-04', '08:40:00', '16:40:00', 2),
(310, 6, '2020-05-05', '08:40:00', '16:40:00', 3),
(311, 6, '2020-05-06', '08:40:00', '16:40:00', 3),
(312, 6, '2020-05-07', '08:40:00', '16:40:00', 3),
(313, 6, '2020-05-08', '08:40:00', '16:40:00', 3),
(314, 6, '2020-05-09', '08:40:00', '16:40:00', 3),
(315, 6, '2020-05-10', '08:40:00', '16:40:00', 3),
(316, 6, '2020-05-11', '08:40:00', '16:40:00', 2),
(317, 6, '2020-05-12', '08:40:00', '16:40:00', 2),
(318, 6, '2020-05-13', '08:40:00', '16:40:00', 1),
(319, 6, '2020-05-14', '08:40:00', '16:40:00', 1),
(320, 6, '2020-05-15', '08:40:00', '16:40:00', 2),
(321, 6, '2020-05-16', '08:40:00', '16:40:00', 2),
(322, 6, '2020-05-17', '08:40:00', '16:40:00', 1),
(323, 6, '2020-05-18', '08:40:00', '16:40:00', 4),
(324, 6, '2020-05-19', '08:40:00', '16:40:00', 4),
(325, 6, '2020-05-20', '08:40:00', '16:40:00', 4),
(326, 6, '2020-05-21', '08:40:00', '16:40:00', 4),
(327, 6, '2020-05-22', '08:40:00', '16:40:00', 4),
(328, 6, '2020-05-23', '08:40:00', '16:40:00', 2),
(329, 6, '2020-05-24', '08:40:00', '16:40:00', 2),
(330, 6, '2020-05-25', '08:40:00', '16:40:00', 1),
(331, 6, '2020-05-26', '08:40:00', '16:40:00', 1),
(332, 6, '2020-05-27', '08:40:00', '16:40:00', 2),
(333, 6, '2020-05-28', '08:40:00', '16:40:00', 2),
(334, 6, '2020-05-29', '08:40:00', '16:40:00', 1),
(335, 6, '2020-05-30', '08:40:00', '16:40:00', 1),
(336, 6, '2020-05-31', '08:40:00', '16:40:00', 2),
(337, 6, '2020-06-01', '08:40:00', '16:40:00', 2),
(338, 6, '2020-06-02', '08:40:00', '16:40:00', 1),
(339, 6, '2020-06-03', '08:40:00', '16:40:00', 1),
(340, 6, '2020-06-04', '08:40:00', '16:40:00', 2),
(341, 6, '2020-06-05', '08:40:00', '16:40:00', 2),
(342, 6, '2020-06-06', '08:40:00', '16:40:00', 1),
(343, 6, '2020-06-07', '08:40:00', '16:40:00', 1),
(344, 6, '2020-06-08', '08:40:00', '16:40:00', 2),
(345, 6, '2020-06-09', '08:40:00', '16:40:00', 2),
(346, 6, '2020-06-10', '08:40:00', '16:40:00', 1),
(347, 6, '2020-06-11', '08:40:00', '16:40:00', 1),
(348, 6, '2020-06-12', '08:40:00', '16:40:00', 2),
(349, 6, '2020-06-13', '08:40:00', '16:40:00', 2),
(350, 6, '2020-06-14', '08:40:00', '16:40:00', 1),
(351, 6, '2020-06-15', '08:40:00', '16:40:00', 1),
(352, 6, '2020-06-16', '08:40:00', '16:40:00', 2),
(353, 6, '2020-06-17', '08:40:00', '16:40:00', 2),
(354, 6, '2020-06-18', '08:40:00', '16:40:00', 1),
(355, 6, '2020-06-19', '08:40:00', '16:40:00', 1),
(356, 6, '2020-06-20', '08:40:00', '16:40:00', 2),
(357, 6, '2020-06-21', '08:40:00', '16:40:00', 2),
(358, 6, '2020-06-22', '08:40:00', '16:40:00', 1),
(359, 6, '2020-06-23', '08:40:00', '16:40:00', 1),
(360, 6, '2020-06-24', '08:40:00', '16:40:00', 2),
(361, 6, '2020-06-25', '08:40:00', '16:40:00', 2),
(362, 6, '2020-06-26', '08:40:00', '16:40:00', 1),
(363, 6, '2020-06-27', '08:40:00', '16:40:00', 1),
(364, 6, '2020-06-28', '08:40:00', '16:40:00', 2),
(365, 6, '2020-06-29', '08:40:00', '16:40:00', 2),
(366, 6, '2020-06-30', '08:40:00', '16:40:00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkerId` int(11) NOT NULL,
  `Token` varchar(40) NOT NULL,
  `ClientInfo` text NOT NULL,
  `Created` datetime NOT NULL,
  `LastUpdate` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `WorkerId` (`WorkerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE IF NOT EXISTS `statuses` (
  `Code` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(30) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`Code`, `Title`, `Description`) VALUES
(1, 'Не установлен', 'Статус не был установлен (рабочий день не начался)'),
(2, 'На работе', 'Работник на рабочем месте'),
(3, 'На перерыве', 'Работник находится на перерыве'),
(4, 'В отпуске', 'В отпуске'),
(5, 'Рабочий день закончен', 'Работник отрабтал весь день'),
(6, 'На больничном', 'На больничном'),
(7, 'Выходной', 'На выходном');

-- --------------------------------------------------------

--
-- Структура таблицы `statuslogs`
--

CREATE TABLE IF NOT EXISTS `statuslogs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkerId` int(11) NOT NULL,
  `SetDate` date NOT NULL,
  `SetTime` time NOT NULL,
  `StatusCode` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `WorkerId` (`WorkerId`,`StatusCode`),
  KEY `StatusCode` (`StatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text NOT NULL,
  `SetWorker` int(11) NOT NULL,
  `Stage` int(11) NOT NULL,
  `SetterWorker` int(11) NOT NULL,
  `Created` datetime NOT NULL,
  `Finished` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `SetWorker` (`SetWorker`,`Stage`,`SetterWorker`),
  KEY `SetterWorker` (`SetterWorker`),
  KEY `Stage` (`Stage`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`Id`, `Description`, `SetWorker`, `Stage`, `SetterWorker`, `Created`, `Finished`) VALUES
(1, 'Написать функцию авторизации', 3, 1, 1, '2020-05-11 12:00:00', NULL),
(2, 'Написать скрипт для пароля', 3, 2, 2, '2020-05-12 13:00:00', NULL),
(3, 'Исправить ошибки в главном окне', 3, 2, 4, '2020-05-14 14:00:00', NULL),
(4, 'Написать тех. задание', 3, 2, 1, '2020-05-16 15:00:00', NULL),
(5, 'Составить отчетность', 3, 3, 2, '2020-05-17 12:00:00', '2020-05-18 13:00:00'),
(6, 'Проверить работоспособность серверной части', 1, 1, 1, '2020-05-29 12:00:00', NULL),
(7, 'Составить годовую отчетность', 2, 1, 2, '2020-05-27 12:00:00', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `taskstage`
--

CREATE TABLE IF NOT EXISTS `taskstage` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `taskstage`
--

INSERT INTO `taskstage` (`Id`, `Description`) VALUES
(1, 'Ожидает принятия'),
(2, 'Принят к выполнению'),
(3, 'Выполнено');

-- --------------------------------------------------------

--
-- Структура таблицы `workers`
--

CREATE TABLE IF NOT EXISTS `workers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `Patronymic` varchar(30) NOT NULL,
  `Department` int(11) NOT NULL,
  `Position` varchar(35) NOT NULL,
  `AccessLevel` int(11) NOT NULL,
  `Login` varchar(30) NOT NULL,
  `Password` varchar(40) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Login` (`Login`),
  KEY `department` (`Department`),
  KEY `AccessLevel` (`AccessLevel`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `workers`
--

INSERT INTO `workers` (`Id`, `Name`, `Surname`, `Patronymic`, `Department`, `Position`, `AccessLevel`, `Login`, `Password`) VALUES
(1, 'Салабаев', 'Роман', 'Сергеевич', 1, 'Начальник отдела разработок', 2, 'roma1', '6d7e4f098ae102fc95b56cf9ec45ea9faf30b93a'),
(2, 'Тимофеев', 'Егор', 'Евгеньевич', 1, 'Руководитель отдела разработок', 3, 'egor2', 'c0c74963b41c88d5f508b285860fbe302a09c1b2'),
(3, 'Лабутин', 'Артем', 'Анатольевич', 1, 'Программист', 4, 'toster3', 'cbb69403ebad0fa6a1795f9ef5cbc670f2944006'),
(4, 'Вергасова', 'Валерия', 'Вадимовна', 2, 'Начальник отдела тестирования', 2, 'vergas4', '220ccb95f089169e8404e13099629099391c966a'),
(5, 'Федкевич', 'Михаил', 'Васильевич', 2, 'Руководитель отдела тестирования', 3, 'misha5', 'b5152e924ada3fb67e2bbbe891df4164bafee847'),
(6, 'Дятлова', 'Анна', 'Сергеевна', 2, 'Тестировщик', 4, 'datel6', 'd583770f7177a5ddb130562304298999e6a15bd5'),
(7, 'admin', 'admin', 'admin', 1, 'Администратор', 1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `plans_ibfk_3` FOREIGN KEY (`WorkerId`) REFERENCES `workers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plans_ibfk_4` FOREIGN KEY (`DayType`) REFERENCES `daytypes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`WorkerId`) REFERENCES `workers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `statuslogs`
--
ALTER TABLE `statuslogs`
  ADD CONSTRAINT `statuslogs_ibfk_3` FOREIGN KEY (`WorkerId`) REFERENCES `workers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `statuslogs_ibfk_4` FOREIGN KEY (`StatusCode`) REFERENCES `statuses` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_4` FOREIGN KEY (`SetWorker`) REFERENCES `workers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_5` FOREIGN KEY (`SetterWorker`) REFERENCES `workers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_6` FOREIGN KEY (`Stage`) REFERENCES `taskstage` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_3` FOREIGN KEY (`Department`) REFERENCES `department` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `workers_ibfk_4` FOREIGN KEY (`AccessLevel`) REFERENCES `accesslevels` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
