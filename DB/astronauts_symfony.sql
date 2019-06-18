-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 18. čen 2019, 17:41
-- Verze serveru: 10.1.38-MariaDB
-- Verze PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `astronauts_symfony`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `astronaut`
--

CREATE TABLE `astronaut` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `superpower` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `astronaut`
--

INSERT INTO `astronaut` (`id`, `name`, `superpower`, `birth_date`) VALUES
(1, 'Jacob Fry', 'Smollness', '2014-01-07 00:00:00'),
(9, 'Martin Cupp', 'Speed', '2014-01-01 00:00:00'),
(10, 'Joseph Fish', 'Laziness', '2018-06-28 00:00:00'),
(11, 'Nicole Sunderland', 'Nothing', '2014-04-01 00:00:00'),
(12, 'Patrick Dante', 'Faithful', '2015-05-12 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabulky `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190618121740', '2019-06-18 12:18:43');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `astronaut`
--
ALTER TABLE `astronaut`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `astronaut`
--
ALTER TABLE `astronaut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
