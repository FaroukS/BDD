-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 05 Décembre 2014 à 15:01
-- Version du serveur :  5.5.38
-- Version de PHP :  5.6.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `movies_location`
--
CREATE DATABASE IF NOT EXISTS `movies_location` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `movies_location`;

-- --------------------------------------------------------

--
-- Structure de la table `actor`
--

DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
`id_actor` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
`id_booking` int(11) NOT NULL,
  `start_date_rental` datetime NOT NULL,
  `and_date_rental` datetime NOT NULL,
  `rental_shop` varchar(30) NOT NULL,
  `restitution_shop` varchar(30) NOT NULL,
  `name_movie` varchar(60) NOT NULL,
  `categorie_movie` enum('Action','Comédie','Aventure','Animation') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `contents_dvd`
--

DROP TABLE IF EXISTS `contents_dvd`;
CREATE TABLE `contents_dvd` (
  `id_DVD` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `contents_in_dvd`
--

DROP TABLE IF EXISTS `contents_in_dvd`;
CREATE TABLE `contents_in_dvd` (
  `id_DVD` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `contents_in_sup`
--

DROP TABLE IF EXISTS `contents_in_sup`;
CREATE TABLE `contents_in_sup` (
  `id_support` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `contents_support`
--

DROP TABLE IF EXISTS `contents_support`;
CREATE TABLE `contents_support` (
  `id_support` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dvd`
--

DROP TABLE IF EXISTS `dvd`;
CREATE TABLE `dvd` (
`id_DVD` int(11) NOT NULL,
  `languages` enum('français','anglais','espagnol','japonais') NOT NULL,
  `subtitiling` enum('français','anglais','espagnol','japonais') NOT NULL,
  `type_of_stereo` enum('Dolby Digital','Dolby Digital EX','Dolby Digital Live') NOT NULL,
  `rental_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
`id_employee` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `adress` varchar(200) NOT NULL,
  `starting_date` datetime NOT NULL,
  `shop_name` varchar(30) NOT NULL,
  `zone` enum('zone 1','zone 2','zone 3','zone 4') NOT NULL,
  `type` enum('Director','Saler','Mechanic') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
`id_member` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `adress` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
`id_movie` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `director_movie` varchar(60) NOT NULL,
  `production_year` datetime NOT NULL,
  `purchase_date` datetime NOT NULL,
  `categorie` enum('Action','Comédie','Aventure','Animation') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `other_support`
--

DROP TABLE IF EXISTS `other_support`;
CREATE TABLE `other_support` (
`id_support` int(11) NOT NULL,
  `type` enum('VCD','VHS') NOT NULL,
  `rental_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `plays_in`
--

DROP TABLE IF EXISTS `plays_in`;
CREATE TABLE `plays_in` (
  `id_actor` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `register_in`
--

DROP TABLE IF EXISTS `register_in`;
CREATE TABLE `register_in` (
  `id_member` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reserved`
--

DROP TABLE IF EXISTS `reserved`;
CREATE TABLE `reserved` (
  `id_booking` int(11) NOT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `shop`
--

DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
`id_shop` int(11) NOT NULL,
  `name_shop` varchar(30) NOT NULL,
  `adress_shop` varchar(200) NOT NULL,
  `rental_unit` enum('oui','non') NOT NULL,
  `zone` enum('zone 1','zone 2','zone 3','zone 4') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `works_in`
--

DROP TABLE IF EXISTS `works_in`;
CREATE TABLE `works_in` (
  `id_employee` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `actor`
--
ALTER TABLE `actor`
 ADD PRIMARY KEY (`id_actor`);

--
-- Index pour la table `booking`
--
ALTER TABLE `booking`
 ADD PRIMARY KEY (`id_booking`);

--
-- Index pour la table `contents_dvd`
--
ALTER TABLE `contents_dvd`
 ADD PRIMARY KEY (`id_DVD`,`id_shop`), ADD KEY `id_DVD` (`id_DVD`,`id_shop`), ADD KEY `id_shop` (`id_shop`);

--
-- Index pour la table `contents_in_dvd`
--
ALTER TABLE `contents_in_dvd`
 ADD PRIMARY KEY (`id_DVD`,`id_movie`), ADD KEY `id_DVD` (`id_DVD`,`id_movie`), ADD KEY `id_movie` (`id_movie`);

--
-- Index pour la table `contents_in_sup`
--
ALTER TABLE `contents_in_sup`
 ADD PRIMARY KEY (`id_support`,`id_movie`), ADD KEY `id_support` (`id_support`,`id_movie`), ADD KEY `id_movie` (`id_movie`);

--
-- Index pour la table `contents_support`
--
ALTER TABLE `contents_support`
 ADD PRIMARY KEY (`id_support`,`id_shop`), ADD KEY `id_support` (`id_support`,`id_shop`), ADD KEY `id_shop` (`id_shop`);

--
-- Index pour la table `dvd`
--
ALTER TABLE `dvd`
 ADD PRIMARY KEY (`id_DVD`);

--
-- Index pour la table `employee`
--
ALTER TABLE `employee`
 ADD PRIMARY KEY (`id_employee`);

--
-- Index pour la table `member`
--
ALTER TABLE `member`
 ADD PRIMARY KEY (`id_member`);

--
-- Index pour la table `movie`
--
ALTER TABLE `movie`
 ADD PRIMARY KEY (`id_movie`);

--
-- Index pour la table `other_support`
--
ALTER TABLE `other_support`
 ADD PRIMARY KEY (`id_support`);

--
-- Index pour la table `plays_in`
--
ALTER TABLE `plays_in`
 ADD PRIMARY KEY (`id_actor`,`id_movie`), ADD KEY `id_actor` (`id_actor`,`id_movie`), ADD KEY `id_movie` (`id_movie`);

--
-- Index pour la table `register_in`
--
ALTER TABLE `register_in`
 ADD PRIMARY KEY (`id_member`,`id_shop`), ADD KEY `id_member` (`id_member`,`id_shop`), ADD KEY `id_member_2` (`id_member`), ADD KEY `id_shop` (`id_shop`);

--
-- Index pour la table `reserved`
--
ALTER TABLE `reserved`
 ADD PRIMARY KEY (`id_booking`,`id_member`), ADD KEY `id_booking` (`id_booking`), ADD KEY `id_member` (`id_member`);

--
-- Index pour la table `shop`
--
ALTER TABLE `shop`
 ADD PRIMARY KEY (`id_shop`);

--
-- Index pour la table `works_in`
--
ALTER TABLE `works_in`
 ADD PRIMARY KEY (`id_employee`,`id_shop`), ADD KEY `id_employee` (`id_employee`,`id_shop`), ADD KEY `id_shop` (`id_shop`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `actor`
--
ALTER TABLE `actor`
MODIFY `id_actor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `booking`
--
ALTER TABLE `booking`
MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `dvd`
--
ALTER TABLE `dvd`
MODIFY `id_DVD` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `employee`
--
ALTER TABLE `employee`
MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `member`
--
ALTER TABLE `member`
MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `other_support`
--
ALTER TABLE `other_support`
MODIFY `id_support` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `shop`
--
ALTER TABLE `shop`
MODIFY `id_shop` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `contents_dvd`
--
ALTER TABLE `contents_dvd`
ADD CONSTRAINT `contents_dvd_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id_shop`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_dvd_ibfk_1` FOREIGN KEY (`id_DVD`) REFERENCES `dvd` (`id_DVD`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contents_in_dvd`
--
ALTER TABLE `contents_in_dvd`
ADD CONSTRAINT `contents_in_dvd_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_in_dvd_ibfk_1` FOREIGN KEY (`id_DVD`) REFERENCES `dvd` (`id_DVD`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contents_in_sup`
--
ALTER TABLE `contents_in_sup`
ADD CONSTRAINT `contents_in_sup_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_in_sup_ibfk_1` FOREIGN KEY (`id_support`) REFERENCES `other_support` (`id_support`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contents_support`
--
ALTER TABLE `contents_support`
ADD CONSTRAINT `contents_support_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id_shop`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_support_ibfk_1` FOREIGN KEY (`id_support`) REFERENCES `other_support` (`id_support`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `plays_in`
--
ALTER TABLE `plays_in`
ADD CONSTRAINT `plays_in_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `plays_in_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `register_in`
--
ALTER TABLE `register_in`
ADD CONSTRAINT `register_in_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id_shop`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `register_in_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reserved`
--
ALTER TABLE `reserved`
ADD CONSTRAINT `reserved_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `reserved_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `works_in`
--
ALTER TABLE `works_in`
ADD CONSTRAINT `works_in_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id_shop`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `works_in_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
