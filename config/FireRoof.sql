-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.4.12-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour fireroof
DROP DATABASE IF EXISTS `fireroof`;
CREATE DATABASE IF NOT EXISTS `fireroof` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fireroof`;

-- Listage de la structure de la table fireroof. articlesave
DROP TABLE IF EXISTS `articlesave`;
CREATE TABLE IF NOT EXISTS `articlesave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `idSource` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idSource` (`idSource`),
  CONSTRAINT `articlesave_ibfk_1` FOREIGN KEY (`idSource`) REFERENCES `source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table fireroof.articlesave : ~0 rows (environ)
DELETE FROM `articlesave`;
/*!40000 ALTER TABLE `articlesave` DISABLE KEYS */;
/*!40000 ALTER TABLE `articlesave` ENABLE KEYS */;

-- Listage de la structure de la table fireroof. favorite_articlesave
DROP TABLE IF EXISTS `favorite_articlesave`;
CREATE TABLE IF NOT EXISTS `favorite_articlesave` (
  `idUser` int(11) NOT NULL,
  `idArticleSave` int(11) NOT NULL,
  `favorite` int(1) DEFAULT 1,
  PRIMARY KEY (`idUser`,`idArticleSave`),
  KEY `FK_favorite_articlesave_articlesave` (`idArticleSave`),
  CONSTRAINT `FK_favorite_articlesave_articlesave` FOREIGN KEY (`idArticleSave`) REFERENCES `articlesave` (`id`),
  CONSTRAINT `FK_favorite_articlesave_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Listage des données de la table fireroof.favorite_articlesave : ~0 rows (environ)
DELETE FROM `favorite_articlesave`;
/*!40000 ALTER TABLE `favorite_articlesave` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_articlesave` ENABLE KEYS */;

-- Listage de la structure de la table fireroof. favorite_keyword
DROP TABLE IF EXISTS `favorite_keyword`;
CREATE TABLE IF NOT EXISTS `favorite_keyword` (
  `idUser` int(11) NOT NULL,
  `idKeyword` int(11) NOT NULL,
  `favorite` int(1) DEFAULT 1,
  PRIMARY KEY (`idUser`,`idKeyword`),
  KEY `FK__keyword` (`idKeyword`),
  CONSTRAINT `FK__keyword` FOREIGN KEY (`idKeyword`) REFERENCES `keyword` (`id`),
  CONSTRAINT `FK__user` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table fireroof.favorite_keyword : ~0 rows (environ)
DELETE FROM `favorite_keyword`;
/*!40000 ALTER TABLE `favorite_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_keyword` ENABLE KEYS */;

-- Listage de la structure de la table fireroof. favorite_source
DROP TABLE IF EXISTS `favorite_source`;
CREATE TABLE IF NOT EXISTS `favorite_source` (
  `idUser` int(11) NOT NULL,
  `idSource` int(11) NOT NULL,
  `favorite` int(1) DEFAULT 1,
  PRIMARY KEY (`idUser`,`idSource`),
  KEY `FK_favorite_source_source` (`idSource`),
  CONSTRAINT `FK_favorite_source_source` FOREIGN KEY (`idSource`) REFERENCES `source` (`id`),
  CONSTRAINT `FK_favorite_source_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Listage des données de la table fireroof.favorite_source : ~0 rows (environ)
DELETE FROM `favorite_source`;
/*!40000 ALTER TABLE `favorite_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_source` ENABLE KEYS */;

-- Listage de la structure de la table fireroof. keyword
DROP TABLE IF EXISTS `keyword`;
CREATE TABLE IF NOT EXISTS `keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content` (`content`),
  UNIQUE KEY `content_2` (`content`),
  UNIQUE KEY `content_3` (`content`),
  UNIQUE KEY `content_4` (`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table fireroof.keyword : ~0 rows (environ)
DELETE FROM `keyword`;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;

-- Listage de la structure de la table fireroof. language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortName` varchar(20) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table fireroof.language : ~0 rows (environ)
DELETE FROM `language`;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`id`, `shortName`, `fullName`) VALUES
	(1, 'Fr', 'Français');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

-- Listage de la structure de la table fireroof. source
DROP TABLE IF EXISTS `source`;
CREATE TABLE IF NOT EXISTS `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `idLang` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idLang` (`idLang`),
  CONSTRAINT `source_ibfk_1` FOREIGN KEY (`idLang`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table fireroof.source : ~0 rows (environ)
DELETE FROM `source`;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
/*!40000 ALTER TABLE `source` ENABLE KEYS */;

-- Listage de la structure de la table fireroof. user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `privilegeLevel` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username_2` (`username`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `username_3` (`username`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `username_4` (`username`),
  UNIQUE KEY `email_4` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table fireroof.user : ~2 rows (environ)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `privilegeLevel`) VALUES
	(1, 'admin', 'admin@admin.fr', 'admin', 1),
	(2, 'test', 'test@test.fr', 'test', 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
