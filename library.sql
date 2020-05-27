-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Czas generowania: 27 Maj 2020, 21:49
-- Wersja serwera: 5.7.23
-- Wersja PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `library`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autorzy`
--

DROP TABLE IF EXISTS `autorzy`;
CREATE TABLE IF NOT EXISTS `autorzy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imie` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nazwisko` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `autorzy`
--

INSERT INTO `autorzy` (`id`, `imie`, `nazwisko`) VALUES
(1, 'Jan', 'Kochanowski'),
(2, 'Adam', 'Mickiewicz'),
(3, 'Juliusz', 'Slowacki'),
(4, 'Andrzej', 'Sapkowski'),
(5, 'Stefan', 'Zeromski'),
(14, 'Aleksander', 'Fredro');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tabela_id`
--

DROP TABLE IF EXISTS `tabela_id`;
CREATE TABLE IF NOT EXISTS `tabela_id` (
  `id_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_autor` int(11) NOT NULL,
  `id_tytul` int(11) NOT NULL,
  PRIMARY KEY (`id_id`),
  KEY `autorzy` (`id_autor`),
  KEY `tytuly` (`id_tytul`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `tabela_id`
--

INSERT INTO `tabela_id` (`id_id`, `id_autor`, `id_tytul`) VALUES
(1, 2, 5),
(2, 1, 6),
(3, 5, 3),
(4, 3, 2),
(5, 4, 4),
(6, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tytuly`
--

DROP TABLE IF EXISTS `tytuly`;
CREATE TABLE IF NOT EXISTS `tytuly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tytul` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ISBN` bigint(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `tytuly`
--

INSERT INTO `tytuly` (`id`, `tytul`, `ISBN`) VALUES
(1, 'Dziady cz.4', 9788395386213),
(2, 'Kordian', 9788366482852),
(3, 'Ludzie Bezdomni', 9788365755698),
(4, 'Wiedzmin', 9788380692848),
(5, 'Dziady cz.2', 9788365458896),
(6, 'Treny', 9788395045592),
(10, 'Zemsta', 444);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `tabela_id`
--
ALTER TABLE `tabela_id`
  ADD CONSTRAINT `autorzy` FOREIGN KEY (`id_autor`) REFERENCES `autorzy` (`id`),
  ADD CONSTRAINT `tytuly` FOREIGN KEY (`id_tytul`) REFERENCES `tytuly` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
