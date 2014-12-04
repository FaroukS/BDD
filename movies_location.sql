-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 04 Décembre 2014 à 17:47
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
-- Structure de la table `Actor`
--

DROP TABLE IF EXISTS `Actor`;
CREATE TABLE `Actor` (
`id_actor` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
CREATE TABLE `Booking` (
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
-- Structure de la table `DVD`
--

DROP TABLE IF EXISTS `DVD`;
CREATE TABLE `DVD` (
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
-- Structure de la table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
CREATE TABLE `Movie` (
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

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Actor`
--
ALTER TABLE `Actor`
 ADD PRIMARY KEY (`id_actor`);

--
-- Index pour la table `Booking`
--
ALTER TABLE `Booking`
 ADD PRIMARY KEY (`id_booking`);

--
-- Index pour la table `DVD`
--
ALTER TABLE `DVD`
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
-- Index pour la table `Movie`
--
ALTER TABLE `Movie`
 ADD PRIMARY KEY (`id_movie`);

--
-- Index pour la table `other_support`
--
ALTER TABLE `other_support`
 ADD PRIMARY KEY (`id_support`);

--
-- Index pour la table `shop`
--
ALTER TABLE `shop`
 ADD PRIMARY KEY (`id_shop`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Actor`
--
ALTER TABLE `Actor`
MODIFY `id_actor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Booking`
--
ALTER TABLE `Booking`
MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `DVD`
--
ALTER TABLE `DVD`
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
-- AUTO_INCREMENT pour la table `Movie`
--
ALTER TABLE `Movie`
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
