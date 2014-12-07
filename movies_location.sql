-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 07 Décembre 2014 à 21:45
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
  `end_date_rental` datetime NOT NULL,
  `rental_shop` varchar(30) NOT NULL,
  `restitution_shop` varchar(30) NOT NULL,
  `name_movie` varchar(60) NOT NULL,
  `categorie_movie` enum('Action','Comédie','Aventure','Animation') NOT NULL,
  `type` enum('DVD','VCD','VHS') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `booking`
--

INSERT INTO `booking` (`id_booking`, `start_date_rental`, `end_date_rental`, `rental_shop`, `restitution_shop`, `name_movie`, `categorie_movie`, `type`) VALUES
(10, '2014-12-10 00:00:00', '2015-01-25 00:00:00', 'shop 1', 'shop 1', 'The Incredible', 'Animation', 'DVD'),
(11, '2014-12-10 00:00:00', '2014-12-25 00:00:00', 'shop 2', 'shop 3', 'Fast and Furius', 'Action', 'DVD'),
(12, '2014-12-11 00:00:00', '2014-12-26 00:00:00', 'shop 3', 'shop 1', 'The Mask', 'Comédie', 'VHS');

-- --------------------------------------------------------

--
-- Structure de la table `contents_in_sup`
--

DROP TABLE IF EXISTS `contents_in_sup`;
CREATE TABLE `contents_in_sup` (
  `id_support` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `contents_in_sup`
--

INSERT INTO `contents_in_sup` (`id_support`, `id_movie`) VALUES
(5, 3),
(6, 3),
(7, 3),
(8, 4),
(9, 4),
(10, 4),
(11, 5),
(12, 5),
(13, 5),
(14, 6);

-- --------------------------------------------------------

--
-- Structure de la table `contents_support`
--

DROP TABLE IF EXISTS `contents_support`;
CREATE TABLE `contents_support` (
  `id_support` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `contents_support`
--

INSERT INTO `contents_support` (`id_support`, `id_shop`) VALUES
(5, 5),
(6, 5),
(7, 5),
(8, 6),
(9, 6),
(10, 6),
(11, 7),
(12, 7),
(13, 7),
(14, 8);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `employee`
--

INSERT INTO `employee` (`id_employee`, `firstname`, `lastname`, `adress`, `starting_date`, `shop_name`, `zone`, `type`) VALUES
(3, 'FirstD', 'Boss1', 'Rue du first boss', '2014-12-01 00:00:00', 'shop 1', 'zone 1', 'Director'),
(4, 'FirstS', 'Saler1', 'Rue du first saler', '2014-12-01 00:00:00', 'shop 1', 'zone 1', 'Saler'),
(5, 'FirstM', 'Mechanic1', 'Rue du first mechanic', '2014-12-01 00:00:00', 'shop 1', 'zone 1', 'Mechanic'),
(6, 'SecondD', 'Director2', 'Rue du second director', '2014-12-02 00:00:00', 'shop 2', 'zone 2', 'Director'),
(7, 'SecondS', 'Saler2', 'Rue du second saler', '2014-12-02 00:00:00', 'shop 2', 'zone 2', 'Saler'),
(8, 'SecondM', 'Mechanic2', 'Rue du  mechanic 2', '2014-12-02 00:00:00', 'shop 2', 'zone 2', 'Mechanic'),
(9, 'ThirdD', 'Director3', 'Rue du director 3', '2014-12-03 00:00:00', 'shop 3', 'zone 3', 'Director'),
(10, 'ThirdS', 'Saler3', 'Rue du saler 3', '2014-12-03 00:00:00', 'shop 3', 'zone 3', 'Saler'),
(11, 'ThirdM', 'Mechanic3', 'Rue du mechanic 3', '2014-12-03 00:00:00', 'shop 3', 'zone 3', 'Mechanic');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `member`
--

INSERT INTO `member` (`id_member`, `firstname`, `lastname`, `adress`) VALUES
(5, 'Doe', 'John', 'Rue du john doe'),
(6, 'TATA', 'tata', 'Rue du tâta'),
(7, 'TUTU', 'tutu', 'Rue du tutu');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `movie`
--

INSERT INTO `movie` (`id_movie`, `title`, `director_movie`, `production_year`, `purchase_date`, `categorie`) VALUES
(3, 'The Incredibles', 'tata', '2014-12-17 00:00:00', '2014-12-18 00:00:00', 'Animation'),
(4, 'Fast and Furius', 'toto', '2014-12-31 00:00:00', '2014-12-19 00:00:00', 'Action'),
(5, 'The Mask', 'tutu', '2014-12-10 00:00:00', '2014-12-19 00:00:00', 'Comédie'),
(6, 'Le labyrinthe', 'titi', '2014-12-25 00:00:00', '2014-12-27 00:00:00', 'Aventure');

-- --------------------------------------------------------

--
-- Structure de la table `occupied`
--

DROP TABLE IF EXISTS `occupied`;
CREATE TABLE `occupied` (
  `id_support` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `occupied`
--

INSERT INTO `occupied` (`id_support`, `id_booking`) VALUES
(5, 10),
(8, 11),
(13, 12);

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
-- Structure de la table `reserved`
--

DROP TABLE IF EXISTS `reserved`;
CREATE TABLE `reserved` (
  `id_booking` int(11) NOT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `reserved`
--

INSERT INTO `reserved` (`id_booking`, `id_member`) VALUES
(10, 5),
(11, 6),
(12, 7);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `shop`
--

INSERT INTO `shop` (`id_shop`, `name_shop`, `adress_shop`, `rental_unit`, `zone`) VALUES
(5, 'shop 1', '1 rue du shop 1', 'oui', 'zone 1'),
(6, 'shop 2', '2 rue du shop 2', 'oui', 'zone 2'),
(7, 'shop 3', '3 rue du shop 3', 'oui', 'zone 3'),
(8, 'shop 4', '4 rue du shop 4', 'oui', 'zone 4'),
(9, 'shop 5', '4 rue du shop 5', 'oui', 'zone 4');

-- --------------------------------------------------------

--
-- Structure de la table `support`
--

DROP TABLE IF EXISTS `support`;
CREATE TABLE `support` (
`id_support` int(11) NOT NULL,
  `type` enum('DVD','VCD','VHS') NOT NULL,
  `rental_number` int(11) NOT NULL,
  `language` enum('français','anglais','espagnol','japonais') NOT NULL,
  `subtitling` enum('français','anglais','espagnol','japonais') NOT NULL,
  `type_stereo` enum('Dolby Digital','Dolby Digital EX') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `support`
--

INSERT INTO `support` (`id_support`, `type`, `rental_number`, `language`, `subtitling`, `type_stereo`) VALUES
(5, 'DVD', 1, 'français', 'français', 'Dolby Digital'),
(6, 'VCD', 2, 'français', 'français', 'Dolby Digital'),
(7, 'VHS', 3, 'français', 'français', 'Dolby Digital'),
(8, 'DVD', 4, 'anglais', 'anglais', 'Dolby Digital'),
(9, 'VCD', 5, 'français', 'français', 'Dolby Digital'),
(10, 'VHS', 6, 'français', 'français', 'Dolby Digital'),
(11, 'DVD', 7, 'japonais', 'japonais', 'Dolby Digital'),
(12, 'VCD', 8, 'français', 'français', 'Dolby Digital'),
(13, 'VHS', 9, 'français', 'français', 'Dolby Digital'),
(14, 'DVD', 10, 'espagnol', 'espagnol', 'Dolby Digital');

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
-- Contenu de la table `works_in`
--

INSERT INTO `works_in` (`id_employee`, `id_shop`) VALUES
(3, 5),
(4, 5),
(5, 5),
(6, 6),
(7, 6),
(8, 6),
(9, 7),
(10, 7),
(11, 7);

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
-- Index pour la table `occupied`
--
ALTER TABLE `occupied`
 ADD PRIMARY KEY (`id_support`,`id_booking`), ADD KEY `id_support` (`id_support`,`id_booking`), ADD KEY `id_booking` (`id_booking`);

--
-- Index pour la table `plays_in`
--
ALTER TABLE `plays_in`
 ADD PRIMARY KEY (`id_actor`,`id_movie`), ADD KEY `id_actor` (`id_actor`,`id_movie`), ADD KEY `id_movie` (`id_movie`);

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
-- Index pour la table `support`
--
ALTER TABLE `support`
 ADD PRIMARY KEY (`id_support`);

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
MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `employee`
--
ALTER TABLE `employee`
MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `member`
--
ALTER TABLE `member`
MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `shop`
--
ALTER TABLE `shop`
MODIFY `id_shop` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `support`
--
ALTER TABLE `support`
MODIFY `id_support` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `contents_in_sup`
--
ALTER TABLE `contents_in_sup`
ADD CONSTRAINT `contents_in_sup_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_in_sup_ibfk_1` FOREIGN KEY (`id_support`) REFERENCES `support` (`id_support`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contents_support`
--
ALTER TABLE `contents_support`
ADD CONSTRAINT `contents_support_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id_shop`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_support_ibfk_1` FOREIGN KEY (`id_support`) REFERENCES `support` (`id_support`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `occupied`
--
ALTER TABLE `occupied`
ADD CONSTRAINT `occupied_ibfk_2` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `occupied_ibfk_1` FOREIGN KEY (`id_support`) REFERENCES `support` (`id_support`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `plays_in`
--
ALTER TABLE `plays_in`
ADD CONSTRAINT `plays_in_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `plays_in_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`) ON DELETE CASCADE ON UPDATE CASCADE;

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
