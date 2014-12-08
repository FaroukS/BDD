# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.38)
# Database: movies_rental
# Generation Time: 2014-12-08 15:55:47 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table actor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actor`;

CREATE TABLE `actor` (
  `id_actor` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table booking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `id_booking` int(11) NOT NULL AUTO_INCREMENT,
  `start_date_rental` date NOT NULL,
  `end_date_rental` date DEFAULT NULL,
  `id_shop` int(11) NOT NULL,
  `restitution_shop` varchar(30) DEFAULT '',
  PRIMARY KEY (`id_booking`),
  KEY `booking_shop_fk` (`id_shop`),
  CONSTRAINT `booking_shop_fk` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id_shop`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;

INSERT INTO `booking` (`id_booking`, `start_date_rental`, `end_date_rental`, `id_shop`, `restitution_shop`)
VALUES
	(10,'2014-12-10','2015-01-25',5,'shop 1'),
	(11,'2014-12-10','2014-12-25',6,'shop 3'),
	(12,'2014-12-11','2014-12-26',7,'shop 1');

/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contents_in_sup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contents_in_sup`;

CREATE TABLE `contents_in_sup` (
  `id_support` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  PRIMARY KEY (`id_support`,`id_movie`),
  KEY `id_support` (`id_support`,`id_movie`),
  KEY `id_movie` (`id_movie`),
  CONSTRAINT `contents_in_sup_ibfk_1` FOREIGN KEY (`id_support`) REFERENCES `support` (`id_support`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contents_in_sup_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `contents_in_sup` WRITE;
/*!40000 ALTER TABLE `contents_in_sup` DISABLE KEYS */;

INSERT INTO `contents_in_sup` (`id_support`, `id_movie`)
VALUES
	(5,3),
	(6,3),
	(7,3),
	(8,4),
	(9,4),
	(10,4),
	(11,5),
	(12,5),
	(13,5),
	(14,6);

/*!40000 ALTER TABLE `contents_in_sup` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contents_support
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contents_support`;

CREATE TABLE `contents_support` (
  `id_support` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  PRIMARY KEY (`id_support`,`id_shop`),
  KEY `id_support` (`id_support`,`id_shop`),
  KEY `id_shop` (`id_shop`),
  CONSTRAINT `contents_support_ibfk_1` FOREIGN KEY (`id_support`) REFERENCES `support` (`id_support`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contents_support_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id_shop`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `contents_support` WRITE;
/*!40000 ALTER TABLE `contents_support` DISABLE KEYS */;

INSERT INTO `contents_support` (`id_support`, `id_shop`)
VALUES
	(5,5),
	(6,5),
	(7,5),
	(8,6),
	(9,6),
	(10,6),
	(11,7),
	(12,7),
	(13,7),
	(14,8);

/*!40000 ALTER TABLE `contents_support` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `adress` varchar(200) NOT NULL,
  `starting_date` date NOT NULL,
  `shop_name` varchar(30) NOT NULL,
  `zone` enum('zone 1','zone 2','zone 3','zone 4') NOT NULL,
  `type` enum('Director','Saler','Mechanic') NOT NULL,
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;

INSERT INTO `employee` (`id_employee`, `firstname`, `lastname`, `adress`, `starting_date`, `shop_name`, `zone`, `type`)
VALUES
	(3,'FirstD','Boss1','Rue du first boss','2014-12-01','shop 1','zone 1','Director'),
	(4,'FirstS','Saler1','Rue du first saler','2014-12-01','shop 1','zone 1','Saler'),
	(5,'FirstM','Mechanic1','Rue du first mechanic','2014-12-01','shop 1','zone 1','Mechanic'),
	(6,'SecondD','Director2','Rue du second director','2014-12-02','shop 2','zone 2','Director'),
	(7,'SecondS','Saler2','Rue du second saler','2014-12-02','shop 2','zone 2','Saler'),
	(8,'SecondM','Mechanic2','Rue du  mechanic 2','2014-12-02','shop 2','zone 2','Mechanic'),
	(9,'ThirdD','Director3','Rue du director 3','2014-12-03','shop 3','zone 3','Director'),
	(10,'ThirdS','Saler3','Rue du saler 3','2014-12-03','shop 3','zone 3','Saler'),
	(11,'ThirdM','Mechanic3','Rue du mechanic 3','2014-12-03','shop 3','zone 3','Mechanic');

/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `adress` varchar(200) NOT NULL,
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;

INSERT INTO `member` (`id_member`, `firstname`, `lastname`, `adress`)
VALUES
	(5,'Doe','John','Rue du john doe'),
	(6,'TATA','tata','Rue du tâta'),
	(7,'TUTU','tutu','Rue du tutu'),
	(12,'hahahah','hoohohohooh','rue du pÃ¨re noel'),
	(13,'bdheab','hezkvfh','chkzvch'),
	(14,'bdheab','hezkvfh','chkzvch'),
	(15,'bdheab','hezkvfh','chkzvch');

/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table movie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `id_movie` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `director_movie` varchar(60) NOT NULL,
  `production_year` date NOT NULL,
  `purchase_date` date NOT NULL,
  `categorie` enum('Action','Comédie','Aventure','Animation') NOT NULL,
  PRIMARY KEY (`id_movie`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;

INSERT INTO `movie` (`id_movie`, `title`, `director_movie`, `production_year`, `purchase_date`, `categorie`)
VALUES
	(3,'The Incredibles','tata','2014-12-17','2014-12-18','Animation'),
	(4,'Fast and Furius','toto','2014-12-31','2014-12-19','Action'),
	(5,'The Mask','tutu','2014-12-10','2014-12-19','Comédie'),
	(6,'Le labyrinthe','titi','2014-12-25','2014-12-27','Aventure');

/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table occupied
# ------------------------------------------------------------

DROP TABLE IF EXISTS `occupied`;

CREATE TABLE `occupied` (
  `id_support` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  PRIMARY KEY (`id_support`,`id_booking`),
  KEY `id_support` (`id_support`,`id_booking`),
  KEY `id_booking` (`id_booking`),
  CONSTRAINT `occupied_ibfk_1` FOREIGN KEY (`id_support`) REFERENCES `support` (`id_support`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `occupied_ibfk_2` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `occupied` WRITE;
/*!40000 ALTER TABLE `occupied` DISABLE KEYS */;

INSERT INTO `occupied` (`id_support`, `id_booking`)
VALUES
	(5,10),
	(8,11),
	(13,12);

/*!40000 ALTER TABLE `occupied` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plays_in
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plays_in`;

CREATE TABLE `plays_in` (
  `id_actor` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  PRIMARY KEY (`id_actor`,`id_movie`),
  KEY `id_actor` (`id_actor`,`id_movie`),
  KEY `id_movie` (`id_movie`),
  CONSTRAINT `plays_in_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plays_in_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table reserved
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reserved`;

CREATE TABLE `reserved` (
  `id_booking` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  PRIMARY KEY (`id_booking`,`id_member`),
  KEY `id_booking` (`id_booking`),
  KEY `id_member` (`id_member`),
  CONSTRAINT `reserved_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserved_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `reserved` WRITE;
/*!40000 ALTER TABLE `reserved` DISABLE KEYS */;

INSERT INTO `reserved` (`id_booking`, `id_member`)
VALUES
	(10,5),
	(11,6);

/*!40000 ALTER TABLE `reserved` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `id_shop` int(11) NOT NULL AUTO_INCREMENT,
  `name_shop` varchar(30) NOT NULL,
  `adress_shop` varchar(200) NOT NULL,
  `rental_unit` enum('oui','non') NOT NULL,
  `zone` enum('zone 1','zone 2','zone 3','zone 4') NOT NULL,
  PRIMARY KEY (`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;

INSERT INTO `shop` (`id_shop`, `name_shop`, `adress_shop`, `rental_unit`, `zone`)
VALUES
	(5,'shop 1','1 rue du shop 1','oui','zone 1'),
	(6,'shop 2','2 rue du shop 2','oui','zone 2'),
	(7,'shop 3','3 rue du shop 3','oui','zone 3'),
	(8,'shop 4','4 rue du shop 4','oui','zone 4'),
	(9,'shop 5','4 rue du shop 5','oui','zone 4');

/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table support
# ------------------------------------------------------------

DROP TABLE IF EXISTS `support`;

CREATE TABLE `support` (
  `id_support` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('DVD','VCD','VHS') NOT NULL,
  `language` enum('français','anglais','espagnol','japonais') NOT NULL,
  `subtitling` enum('français','anglais','espagnol','japonais') NOT NULL,
  `type_stereo` enum('Dolby Digital','Dolby Digital EX') NOT NULL,
  PRIMARY KEY (`id_support`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;

INSERT INTO `support` (`id_support`, `type`, `language`, `subtitling`, `type_stereo`)
VALUES
	(5,'DVD','français','français','Dolby Digital'),
	(6,'VCD','français','français','Dolby Digital'),
	(7,'VHS','français','français','Dolby Digital'),
	(8,'DVD','anglais','anglais','Dolby Digital'),
	(9,'VCD','français','français','Dolby Digital'),
	(10,'VHS','français','français','Dolby Digital'),
	(11,'DVD','japonais','japonais','Dolby Digital'),
	(12,'VCD','français','français','Dolby Digital'),
	(13,'VHS','français','français','Dolby Digital'),
	(14,'DVD','espagnol','espagnol','Dolby Digital');

/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table works_in
# ------------------------------------------------------------

DROP TABLE IF EXISTS `works_in`;

CREATE TABLE `works_in` (
  `id_employee` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  PRIMARY KEY (`id_employee`,`id_shop`),
  KEY `id_employee` (`id_employee`,`id_shop`),
  KEY `id_shop` (`id_shop`),
  CONSTRAINT `works_in_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `works_in_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id_shop`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `works_in` WRITE;
/*!40000 ALTER TABLE `works_in` DISABLE KEYS */;

INSERT INTO `works_in` (`id_employee`, `id_shop`)
VALUES
	(3,5),
	(4,5),
	(5,5),
	(6,6),
	(7,6),
	(8,6),
	(9,7),
	(10,7),
	(11,7);

/*!40000 ALTER TABLE `works_in` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
