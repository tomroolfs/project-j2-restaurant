-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 10 mrt 2023 om 13:58
-- Serverversie: 5.7.31
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectp6`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Bestelling`
--

DROP TABLE IF EXISTS `Bestelling`;
CREATE TABLE IF NOT EXISTS `Bestelling` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ReserveringId` int(11) NOT NULL,
  `MenuId` int(11) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bestelling_reserveringid_foreign` (`ReserveringId`),
  KEY `bestelling_menuid_foreign` (`MenuId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Betaling`
--

DROP TABLE IF EXISTS `Betaling`;
CREATE TABLE IF NOT EXISTS `Betaling` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ReserveringId` int(11) NOT NULL,
  `BetalingsCode` int(11) NOT NULL,
  `BetalingsMethode` varchar(100) NOT NULL,
  `BetalingsDatum` date NOT NULL,
  `BetalingsTijd` time NOT NULL,
  `Bedrag` double NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `betaling_reserveringid_foreign` (`ReserveringId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Contact`
--

DROP TABLE IF EXISTS `Contact`;
CREATE TABLE IF NOT EXISTS `Contact` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PersoonId` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telefoon` int(11) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_persoonid_foreign` (`PersoonId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Hoofdgerecht`
--

DROP TABLE IF EXISTS `Hoofdgerecht`;
CREATE TABLE IF NOT EXISTS `Hoofdgerecht` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `Catagorie` varchar(100) NOT NULL,
  `Prijs` double NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Menu`
--

DROP TABLE IF EXISTS `Menu`;
CREATE TABLE IF NOT EXISTS `Menu` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `VoorgerechtId` int(11) NOT NULL,
  `HoofdGerechtId` int(11) NOT NULL,
  `NagerechtId` int(11) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_voorgerechtid_foreign` (`VoorgerechtId`),
  KEY `menu_nagerechtid_foreign` (`NagerechtId`),
  KEY `menu_hoofdgerechtid_foreign` (`HoofdGerechtId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Nagerecht`
--

DROP TABLE IF EXISTS `Nagerecht`;
CREATE TABLE IF NOT EXISTS `Nagerecht` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(40) NOT NULL,
  `Catagorie` varchar(100) NOT NULL,
  `Prijs` double NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Openingstijd`
--

DROP TABLE IF EXISTS `Openingstijd`;
CREATE TABLE IF NOT EXISTS `Openingstijd` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Dag` int(11) NOT NULL,
  `Openingstijd` time NOT NULL,
  `Sluitingstijd` time NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Persoon`
--

DROP TABLE IF EXISTS `Persoon`;
CREATE TABLE IF NOT EXISTS `Persoon` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(40) NOT NULL,
  `Tussenvoegsel` varchar(20) NOT NULL,
  `Achternaam` varchar(40) NOT NULL,
  `IsVolwassen` bit(1) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Reservering`
--

DROP TABLE IF EXISTS `Reservering`;
CREATE TABLE IF NOT EXISTS `Reservering` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PersoonId` int(11) NOT NULL,
  `TariefId` int(11) NOT NULL,
  `TafelId` int(11) NOT NULL,
  `OpeningstijdId` int(11) NOT NULL,
  `ReserveringStatus` varchar(20) NOT NULL,
  `ReserveringNummer` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `AantalUren` int(11) NOT NULL,
  `BeginTijd` time NOT NULL,
  `EindTijd` time NOT NULL,
  `Volwassenen` int(11) NOT NULL,
  `Kinderen` int(11) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservering_tafelid_foreign` (`TafelId`),
  KEY `reservering_persoonid_foreign` (`PersoonId`),
  KEY `reservering_openingstijdid_foreign` (`OpeningstijdId`),
  KEY `reservering_tariefid_foreign` (`TariefId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Tafel`
--

DROP TABLE IF EXISTS `Tafel`;
CREATE TABLE IF NOT EXISTS `Tafel` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nummer` int(11) NOT NULL,
  `KindMogelijkheid` bit(1) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tarief`
--

DROP TABLE IF EXISTS `tarief`;
CREATE TABLE IF NOT EXISTS `tarief` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prijs` double NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `User`
--

DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PersoonId` int(11) NOT NULL,
  `Username` varchar(40) NOT NULL,
  `Wachtwoord` varchar(60) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_persoonid_foreign` (`PersoonId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `VoorgerechtId`
--

DROP TABLE IF EXISTS `VoorgerechtId`;
CREATE TABLE IF NOT EXISTS `VoorgerechtId` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(40) NOT NULL,
  `Catagorie` varchar(100) NOT NULL,
  `prijs` double NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `Opmerking` varchar(300) NOT NULL,
  `DatumAangemaakt` date NOT NULL,
  `DatumGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
