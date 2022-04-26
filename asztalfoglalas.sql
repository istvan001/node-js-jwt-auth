-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2022. Ápr 25. 13:26
-- Kiszolgáló verziója: 5.7.35-38
-- PHP verzió: 7.2.34-28+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `asztalfoglalas`
--
CREATE DATABASE IF NOT EXISTS `asztalfoglalas` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `asztalfoglalas`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `asztalok`
--

CREATE TABLE `asztalok` (
  `asztalok_id` int(11) NOT NULL,
  `etterem_id` int(11) NOT NULL,
  `asztal_megnevezes` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `fo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `asztalok`
--

INSERT INTO `asztalok` (`asztalok_id`, `etterem_id`, `asztal_megnevezes`, `fo`) VALUES
(1, 1, '1', 3),
(2, 1, '2', 2),
(3, 1, '3', 4),
(4, 1, '4', 3),
(5, 1, '5', 2),
(6, 2, '1', 4),
(7, 2, '2', 4),
(8, 2, '3', 3),
(9, 2, '4', 2),
(10, 2, '5', 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ertekeles`
--

CREATE TABLE `ertekeles` (
  `ert_id` int(11) NOT NULL,
  `Etterem_id` int(11) NOT NULL,
  `ert` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `ertekeles`
--

INSERT INTO `ertekeles` (`ert_id`, `Etterem_id`, `ert`) VALUES
(58, 4, 5),
(59, 4, 1),
(69, 10, 5),
(72, 5, 5),
(73, 6, 5),
(74, 7, 3),
(75, 8, 3),
(76, 9, 4),
(77, 8, 5),
(79, 3, 5),
(80, 1, 4),
(81, 2, 5),
(82, 21, 5),
(83, 6, 5),
(84, 1, 5),
(85, 1, 4),
(86, 1, 1),
(87, 1, 1),
(88, 1, 5),
(89, 1, 5),
(90, 1, 5),
(91, 1, 5),
(92, 1, 3),
(93, 2, 3),
(94, 2, 5),
(95, 3, 3),
(96, 4, 5),
(97, 1, 5),
(98, 2, 3),
(99, 1, 1),
(100, 1, 5),
(101, 1, 1),
(102, 1, 5),
(103, 1, 5),
(104, 1, 3),
(105, 1, 5),
(106, 1, 1),
(107, 3, 3),
(108, 2, 3),
(109, 1, 5),
(110, 1, 4),
(111, 1, 4),
(112, 1, 4),
(113, 1, 5),
(114, 1, 4),
(115, 1, 4),
(116, 1, 5),
(117, 1, 5),
(118, 2, 4),
(119, 1, 3),
(120, 1, 3),
(121, 1, 3),
(122, 2, 3),
(123, 1, 5),
(124, 1, 5),
(125, 1, 5),
(126, 1, 5),
(127, 1, 5),
(128, 1, 5),
(129, 1, 5),
(130, 1, 5),
(131, 1, 5),
(132, 2, 5),
(133, 1, 5),
(134, 1, 5),
(135, 1, 5),
(136, 2, 5),
(137, 5, 1),
(138, 2, 1),
(139, 3, 1),
(140, 5, 1),
(141, 1, 5),
(142, 1, 5),
(143, 3, 5),
(144, 1, 5),
(145, 3, 5),
(146, 1, 3),
(147, 2, 5),
(148, 1, 5),
(149, 1, 5),
(150, 1, 5),
(151, 1, 5),
(152, 1, 5),
(153, 1, 5),
(154, 1, 5),
(155, 1, 5),
(156, 1, 5),
(157, 1, 5),
(158, 1, 5),
(159, 1, 3),
(160, 1, 5),
(161, 1, 5),
(162, 1, 5),
(163, 1, 5),
(164, 1, 5),
(165, 4, 3),
(166, 1, 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ertekeles2`
--

CREATE TABLE `ertekeles2` (
  `id` int(11) NOT NULL,
  `etterem_id` int(11) NOT NULL,
  `db` int(11) NOT NULL,
  `db2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `ertekeles2`
--

INSERT INTO `ertekeles2` (`id`, `etterem_id`, `db`, `db2`) VALUES
(1, 6, 6, 2),
(2, 8, 8, 3),
(3, 2, 16, 3),
(4, 1, 34, 22),
(5, 7, 3, 0),
(6, 3, 5, 5),
(7, 10, 8, 2),
(8, 21, 10, 5),
(9, 9, 4, 2),
(10, 4, 2, 1),
(11, 5, 4, 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etlapok`
--

CREATE TABLE `etlapok` (
  `id` int(11) NOT NULL,
  `etterem_id` int(11) NOT NULL,
  `nev` varchar(500) COLLATE utf8_hungarian_ci NOT NULL,
  `tipus_id` int(11) NOT NULL,
  `ar` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `etlapok`
--

INSERT INTO `etlapok` (`id`, `etterem_id`, `nev`, `tipus_id`, `ar`) VALUES
(1, 1, 'Paradicsom leves', 1, '1500FT'),
(2, 2, 'Cézár saláta', 5, '800FT'),
(3, 2, 'Karalábé', 1, '1100FT'),
(4, 2, 'Rántott sajt, rizzsel, tartármártás', 6, '900F'),
(5, 1, 'Sült krumpli', 5, '600FT'),
(6, 1, 'AZ EREDETI, HAMISÍTATLAN CSOKONAI LEVES', 1, '1390FT'),
(7, 1, 'HIDEG KÓKUSZTEJES MANGÓ LEVES', 1, '1300FT'),
(8, 1, 'MARHAHÚSLEVES', 1, '1390FT'),
(9, 1, 'SÜLT VARGÁNYA KRÉMLEVES', 1, '1390FT'),
(10, 1, 'VETRECE LEVES', 1, '1790FT'),
(11, 1, 'A \"MI\" HÁZI KRÉMESÜNK', 3, '1350 Ft'),
(12, 1, 'HÁZI KÉZMŰVES KÉKSAJT', 3, '1350FT'),
(13, 1, 'HÁZI TÚRÓVAL BESÜTÖTT PALACSINTA', 3, '1350FT'),
(14, 1, 'SAJTTORTA, CITRUSOS, PASSIO GYÜMÖLCCSEL', 3, '1350FT'),
(15, 1, 'SOMLÓI GALUSKA ÚJSZERŰEN', 3, '1350FT'),
(16, 1, 'I. TÁL\r\n\r\nSAJTTAL TÖLTÖTT CSIRKEMELL, BBQ SERTÉSTARJA, RÓMAI KÖMÉNYES ZÖLDSÉG TEMPURA, VEGYES KÖRET (2 FŐRE)', 6, '6290FT'),
(17, 1, 'II. TÁL\r\nSÜLT CSÜLÖK, SERTÉSTARJA FOKHAGYMÁS PECSENYELÉVEL, CSIRKEMELL CSÍKOK CORNFLAKES BUNDÁBAN, RÓMAI KÖMÉNYES ZÖLDSÉG TEMPURA, VEGYES KÖRET\r\n(2 FŐRE)', 6, '7790FT'),
(18, 1, 'Héjában sült burgonya', 5, '1000FT'),
(19, 1, 'Burgonyapüré', 5, '1000FT'),
(20, 1, 'Jázminrizs', 5, '1000Ft'),
(21, 1, '7up', 4, '450FT'),
(22, 1, 'Pepsi', 4, '450FT'),
(23, 1, 'Toma Almafalé', 4, '450FT'),
(24, 1, 'Lipton', 4, '400FT'),
(25, 1, 'Tropicana', 4, '450FT'),
(26, 1, 'Fogas', 2, '3790FT'),
(27, 1, 'Füstölt sóval sült BBQ lazac steak', 2, '4590FT'),
(28, 1, 'Ananászos csirkemel', 2, '2890FT'),
(29, 1, '1', 1, '1');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etterem`
--

CREATE TABLE `etterem` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `lakcim` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `telefon` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `nyitas` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `kep` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `etterem`
--

INSERT INTO `etterem` (`id`, `nev`, `lakcim`, `telefon`, `nyitas`, `kep`) VALUES
(1, 'Csokonai Étterem', 'Debrecen, Kossuth u. 21, 4024', '(06 52) 410 802', 'hétfő-péntek	12:00–22:30', '1.jpg'),
(2, 'Blaháné Étterem', 'Debrecen, Blaháné u. 13, 4024', '(06 52) 315 318', 'hétfő-péntek	11:00–13:00', '2.jpg'),
(3, 'Hajdúsági Étterem (Gödör)', 'Debrecen, Kossuth u. 12-14, 4024', '(06 52) 322 223', 'Hétfő-péntek 11:00–15:00', '3.jpg'),
(4, 'Melange Étterem', 'Debrecen, Csapó u. 24, 4024', '06 20 290 9211', 'Hétfő-péntek	10:00–24:00', '4.jpg'),
(5, 'Sparhelt Vendéglő', 'Debrecen, Sas u. 4, 4024', '06 30 989 4554', 'Hétfő-péntek	10:00–15:00', '5.jpg'),
(6, 'Barabás Étterem', ' Debrecen, Vár u. 11, 4024', '(06 52) 502 231', 'Hétfő-péntek	11:00–22:00', '6.jpg'),
(7, 'Flaska Vendéglő', 'Debrecen, Miklós u. 4, 4025', '(06 52) 414 582', 'Hétfő-péntek	11:00–22:00', '7.jpg'),
(8, 'Belga Étterem és Söröző', 'Debrecen, Piac u. 29, 4025', '(06 52) 536 373', 'Hétfő-péntek	10:00–24:00', '8.jpg'),
(9, 'Leroy Cafe', 'Debrecen, Fórum Bevásárlóközpont, Csapó u. 30, 4029', '06 30 204 0600', 'Hétfő-péntek	11:00–23:00', '9.jpg'),
(10, 'IKON Restaurant', ' Debrecen, Piac u. 23, 4025', '06 30 555 7766', 'Hétfő-péntek	11:30–23:00', '10.jpg'),
(21, 'Krúdy Étterem', ' Debrecen, Medgyessy stny. 4, 4032', '(06 52) 442 244', 'hétfő-péntek: 11:30-23:00', 'debrecen-krudy-etterem1.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `foglalas`
--

CREATE TABLE `foglalas` (
  `foglalas_id` int(11) NOT NULL,
  `etterem_id` int(11) DEFAULT NULL,
  `asztalok_id` int(11) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `ora` time DEFAULT NULL,
  `nev` varchar(50) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `telefon` varchar(50) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `foglalt` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `foglalas`
--

INSERT INTO `foglalas` (`foglalas_id`, `etterem_id`, `asztalok_id`, `datum`, `ora`, `nev`, `telefon`, `foglalt`) VALUES
(1, 1, 1, '2022-02-28', '12:00:00', 'NULL', 'NULL', 0),
(2, 1, 1, '2022-02-28', '13:00:00', 'NULL', 'NULL', 0),
(3, 1, 1, '2022-03-21', '14:00:00', NULL, NULL, 0),
(6, 1, 1, '2022-03-21', '15:00:00', 'NULL', 'NULL', 0),
(7, 1, 1, '2022-03-21', '16:00:00', 'NULL', 'NULL', 0),
(8, 1, 1, '2022-03-21', '17:00:00', 'NULL', 'NULL', 0),
(9, 1, 1, '2022-03-21', '18:00:00', 'NULL', 'NULL', 0),
(10, 1, 1, '2022-03-21', '19:00:00', 'NULL', 'NULL', 0),
(11, 1, 1, '2022-03-21', '20:00:00', 'NULL', 'NULL', 0),
(12, 1, 1, '2022-03-21', '21:00:00', 'NULL', 'NULL', 0),
(13, 1, 1, '2022-03-21', '22:00:00', 'NULL', 'NULL', 0),
(14, 1, 1, '2022-03-21', '23:00:00', 'NULL', 'NULL', 0),
(15, 1, 2, '2022-03-21', '12:00:00', 'NULL', 'NULL', 0),
(16, 1, 2, '2022-03-21', '13:00:00', 'NULL', 'NULL', 0),
(17, 1, 2, '2022-03-21', '14:00:00', NULL, NULL, 0),
(18, 1, 2, '2022-03-21', '15:00:00', 'NULL', 'NULL', 0),
(19, 1, 2, '2022-03-21', '16:00:00', 'NULL', 'NULL', 0),
(20, 1, 2, '2022-03-21', '17:00:00', 'NULL', 'NULL', 0),
(21, 1, 2, '2022-03-21', '18:00:00', 'NULL', 'NULL', 0),
(22, 1, 2, '2022-03-21', '19:00:00', 'NULL', 'NULL', 0),
(23, 1, 2, '2022-03-21', '20:00:00', 'NULL', 'NULL', 0),
(24, 1, 2, '2022-03-21', '21:00:00', 'NULL', 'NULL', 0),
(25, 1, 2, '2022-03-21', '22:00:00', 'NULL', 'NULL', 0),
(26, 1, 2, '2022-03-21', '23:00:00', 'NULL', 'NULL', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendezveny`
--

CREATE TABLE `rendezveny` (
  `rendezveny_id` int(11) NOT NULL,
  `etterem_id` int(11) NOT NULL,
  `felhasznalo` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `telefon` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `idopont` date NOT NULL,
  `foglalt` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendezveny`
--

INSERT INTO `rendezveny` (`rendezveny_id`, `etterem_id`, `felhasznalo`, `telefon`, `email`, `idopont`, `foglalt`) VALUES
(1, 1, 'Holló István', '06214567899', 'hollo@gmail.com', '2022-03-02', 1),
(20, 21, 'cdw', 'dc', 'ad', '2022-03-27', 1),
(68, 2, 'fd', 'd', 'ds', '2022-03-31', 1),
(74, 1, 'sfd', 'vys', 'vdy', '2022-05-29', 1),
(75, 1, 'wt4r', 'wr', 'erw', '2022-03-28', 1),
(76, 1, 'feas', 'xsgdf', 'dsf', '2022-04-16', 1),
(79, 1, 'wer', 'qewr', 'erqw', '2025-03-21', 1),
(80, 1, 'jmf', 'jf', 'fj', '2022-03-29', 1),
(82, 1, 'ds', 'das', 'sda', '2022-03-30', 1),
(83, 1, 'as', 'sad', 'ads', '2025-03-20', 1),
(84, 1, 'dss', 'ds', 'sda', '2025-03-22', 1),
(85, 1, 'da', 'da', 'da', '2022-05-16', 1),
(86, 1, 'dasd', 'dsa', 'das', '2022-04-30', 1),
(87, 1, 'dws', 'dsa', 'dsa', '2022-05-01', 1),
(94, 1, 'Ff', 'Cf', 'Cf', '2022-05-04', 1),
(99, 1, 'Bybe', 'Jdnd', 'Bybsb', '2022-05-05', 1),
(100, 1, 'Jsjs', 'Nxns', 'Jsjs', '2022-05-06', 1),
(101, 1, 'da', 'as', 'sad', '2022-05-11', 1),
(102, 1, 'fd', 'f', 's', '2022-05-12', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(2, 'moderator', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(3, 'admin', '2020-08-02 14:57:31', '2020-08-02 14:57:31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tipus`
--

CREATE TABLE `tipus` (
  `id` int(11) NOT NULL,
  `tipus` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tipus`
--

INSERT INTO `tipus` (`id`, `tipus`) VALUES
(1, 'leves'),
(2, 'főétel'),
(3, 'desszert'),
(4, 'ital'),
(5, 'köret'),
(6, 'egytálétel');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'user', 'user', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'mod', 'mod', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'admin', 'admin', '$2a$08$97Ze1/hXfOX44WdC62Rq8uRkog9HYC1HukRX8eld2ZEKPyenM5v.G', '2020-08-02 15:03:59', '2020-08-02 15:03:59');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 1, 3),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 2),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 3, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `velemenyek`
--

CREATE TABLE `velemenyek` (
  `velemenyid` int(11) NOT NULL,
  `Etteremid` int(11) NOT NULL,
  `velemeny_nev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `velemeny` varchar(500) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `velemenyek`
--

INSERT INTO `velemenyek` (`velemenyid`, `Etteremid`, `velemeny_nev`, `velemeny`) VALUES
(1, 1, 'Fanni', 'Nagyon fincsi nagyon jó'),
(4, 4, 'Pisti', 'nagyon jó'),
(5, 5, 'Dani', 'Nagyon tetszett a hely finomak voltak az ételek'),
(6, 6, 'Dóri', 'Alig várom már hogy legközelebb is itt ebédeljünk'),
(7, 7, 'Fütty Imre', 'Első randi helynek tökéletes'),
(8, 8, 'Beviz Elek', 'Holnap is jövünk a családdal'),
(10, 10, 'Oszkár', 'Dögös a pincérnő'),
(15, 1, 'Beviz Elek', 'Nagyon szép a hely az ételek finomak a pincérek kedvesek'),
(19, 21, 'Anikó', 'Nagyon szép hely'),
(20, 2, 'Pisti', 'Nagyon fasza'),
(22, 1, '', ''),
(23, 1, 'Ghjbb', 'Dhjgvhg'),
(24, 3, 'Hsnwnn', 'Jsjnekwlek'),
(25, 1, 'Pisti', 'Zseniális étterem'),
(26, 1, 'Pisti', 'Fantasztikus ízek'),
(27, 1, 'Hhjh', 'Vbbv');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `asztalok`
--
ALTER TABLE `asztalok`
  ADD PRIMARY KEY (`asztalok_id`),
  ADD KEY `etterem_id` (`etterem_id`);

--
-- A tábla indexei `ertekeles`
--
ALTER TABLE `ertekeles`
  ADD PRIMARY KEY (`ert_id`),
  ADD KEY `Etterem_id` (`Etterem_id`);

--
-- A tábla indexei `ertekeles2`
--
ALTER TABLE `ertekeles2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etterem_id` (`etterem_id`);

--
-- A tábla indexei `etlapok`
--
ALTER TABLE `etlapok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etterem_id` (`etterem_id`,`tipus_id`),
  ADD KEY `tipus_id` (`tipus_id`);

--
-- A tábla indexei `etterem`
--
ALTER TABLE `etterem`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `foglalas`
--
ALTER TABLE `foglalas`
  ADD PRIMARY KEY (`foglalas_id`),
  ADD KEY `FK_foglalas_asztalok` (`asztalok_id`),
  ADD KEY `Index 2` (`etterem_id`) USING BTREE;

--
-- A tábla indexei `rendezveny`
--
ALTER TABLE `rendezveny`
  ADD PRIMARY KEY (`rendezveny_id`),
  ADD KEY `etterem_id` (`etterem_id`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tipus`
--
ALTER TABLE `tipus`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- A tábla indexei `velemenyek`
--
ALTER TABLE `velemenyek`
  ADD PRIMARY KEY (`velemenyid`),
  ADD KEY `Etteremid` (`Etteremid`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `asztalok`
--
ALTER TABLE `asztalok`
  MODIFY `asztalok_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT a táblához `ertekeles`
--
ALTER TABLE `ertekeles`
  MODIFY `ert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;
--
-- AUTO_INCREMENT a táblához `ertekeles2`
--
ALTER TABLE `ertekeles2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT a táblához `etlapok`
--
ALTER TABLE `etlapok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT a táblához `etterem`
--
ALTER TABLE `etterem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT a táblához `foglalas`
--
ALTER TABLE `foglalas`
  MODIFY `foglalas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT a táblához `rendezveny`
--
ALTER TABLE `rendezveny`
  MODIFY `rendezveny_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT a táblához `tipus`
--
ALTER TABLE `tipus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT a táblához `velemenyek`
--
ALTER TABLE `velemenyek`
  MODIFY `velemenyid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `asztalok`
--
ALTER TABLE `asztalok`
  ADD CONSTRAINT `asztalok_ibfk_1` FOREIGN KEY (`etterem_id`) REFERENCES `etterem` (`id`);

--
-- Megkötések a táblához `ertekeles`
--
ALTER TABLE `ertekeles`
  ADD CONSTRAINT `ertekeles_ibfk_1` FOREIGN KEY (`Etterem_id`) REFERENCES `etterem` (`id`);

--
-- Megkötések a táblához `ertekeles2`
--
ALTER TABLE `ertekeles2`
  ADD CONSTRAINT `ertekeles2_ibfk_1` FOREIGN KEY (`etterem_id`) REFERENCES `etterem` (`id`);

--
-- Megkötések a táblához `etlapok`
--
ALTER TABLE `etlapok`
  ADD CONSTRAINT `etlapok_ibfk_1` FOREIGN KEY (`etterem_id`) REFERENCES `etterem` (`id`),
  ADD CONSTRAINT `etlapok_ibfk_2` FOREIGN KEY (`tipus_id`) REFERENCES `tipus` (`id`);

--
-- Megkötések a táblához `foglalas`
--
ALTER TABLE `foglalas`
  ADD CONSTRAINT `FK_foglalas_asztalok` FOREIGN KEY (`asztalok_id`) REFERENCES `asztalok` (`asztalok_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_foglalas_etterem` FOREIGN KEY (`etterem_id`) REFERENCES `etterem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Megkötések a táblához `rendezveny`
--
ALTER TABLE `rendezveny`
  ADD CONSTRAINT `rendezveny_ibfk_1` FOREIGN KEY (`etterem_id`) REFERENCES `etterem` (`id`);

--
-- Megkötések a táblához `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `velemenyek`
--
ALTER TABLE `velemenyek`
  ADD CONSTRAINT `velemenyek_ibfk_1` FOREIGN KEY (`Etteremid`) REFERENCES `etterem` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
