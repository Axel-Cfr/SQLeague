-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: SQLeague
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appartenir`
--

DROP TABLE IF EXISTS `appartenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appartenir` (
  `id_utilisateur` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_equipe`),
  KEY `id_equipe` (`id_equipe`),
  CONSTRAINT `appartenir_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  CONSTRAINT `appartenir_ibfk_2` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenir`
--

LOCK TABLES `appartenir` WRITE;
/*!40000 ALTER TABLE `appartenir` DISABLE KEYS */;
INSERT INTO `appartenir` VALUES (1,2),(3,4),(4,1);
/*!40000 ALTER TABLE `appartenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diffuser`
--

DROP TABLE IF EXISTS `diffuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diffuser` (
  `id_tournoi` int(11) NOT NULL,
  `id_platforme` int(11) NOT NULL,
  PRIMARY KEY (`id_tournoi`,`id_platforme`),
  KEY `id_platforme` (`id_platforme`),
  CONSTRAINT `diffuser_ibfk_1` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`),
  CONSTRAINT `diffuser_ibfk_2` FOREIGN KEY (`id_platforme`) REFERENCES `plateformes_difusion` (`id_platforme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diffuser`
--

LOCK TABLES `diffuser` WRITE;
/*!40000 ALTER TABLE `diffuser` DISABLE KEYS */;
INSERT INTO `diffuser` VALUES (1,1),(2,1),(2,2),(3,1);
/*!40000 ALTER TABLE `diffuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipe` (
  `id_equipe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_equipe` varchar(50) NOT NULL,
  PRIMARY KEY (`id_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Karmine Corp'),(2,'Team Vitality'),(3,'G2 Esports'),(4,'Solary');
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `id_format` int(11) NOT NULL AUTO_INCREMENT,
  `nom_format` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_format`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (1,'1v1','Classique des jeux de combat.'),(2,'5v5','Standard sur les MOBA.'),(3,'Battle Royale','Jusqu\'au dernier survivant.');
/*!40000 ALTER TABLE `format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jeux`
--

DROP TABLE IF EXISTS `jeux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeux` (
  `id_jeux` int(11) NOT NULL AUTO_INCREMENT,
  `nom_jeux` varchar(50) NOT NULL,
  PRIMARY KEY (`id_jeux`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jeux`
--

LOCK TABLES `jeux` WRITE;
/*!40000 ALTER TABLE `jeux` DISABLE KEYS */;
INSERT INTO `jeux` VALUES (1,'League of Legends'),(2,'Counter-Strike 2'),(3,'Super Smash Bros. Ultimate'),(4,'Valorant');
/*!40000 ALTER TABLE `jeux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lieu_tournoi`
--

DROP TABLE IF EXISTS `lieu_tournoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lieu_tournoi` (
  `id_lieu` int(11) NOT NULL AUTO_INCREMENT,
  `nom_lieu` varchar(50) NOT NULL,
  PRIMARY KEY (`id_lieu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieu_tournoi`
--

LOCK TABLES `lieu_tournoi` WRITE;
/*!40000 ALTER TABLE `lieu_tournoi` DISABLE KEYS */;
INSERT INTO `lieu_tournoi` VALUES (1,'Accor Arena, Paris'),(2,'Lanxess Arena, Cologne'),(3,'En Ligne (Serveurs EUW)'),(4,'Mandalay Bay, Las Vegas');
/*!40000 ALTER TABLE `lieu_tournoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obtenir`
--

DROP TABLE IF EXISTS `obtenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obtenir` (
  `id_utilisateur` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  `ID_recompense` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_equipe`,`ID_recompense`),
  KEY `id_equipe` (`id_equipe`),
  KEY `ID_recompense` (`ID_recompense`),
  CONSTRAINT `obtenir_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  CONSTRAINT `obtenir_ibfk_2` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`),
  CONSTRAINT `obtenir_ibfk_3` FOREIGN KEY (`ID_recompense`) REFERENCES `recompense` (`ID_recompense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obtenir`
--

LOCK TABLES `obtenir` WRITE;
/*!40000 ALTER TABLE `obtenir` DISABLE KEYS */;
INSERT INTO `obtenir` VALUES (1,2,2),(4,1,1);
/*!40000 ALTER TABLE `obtenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participer_equipe`
--

DROP TABLE IF EXISTS `participer_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participer_equipe` (
  `id_tournoi` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `rang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tournoi`,`id_equipe`),
  KEY `id_equipe` (`id_equipe`),
  CONSTRAINT `participer_equipe_ibfk_1` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`),
  CONSTRAINT `participer_equipe_ibfk_2` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participer_equipe`
--

LOCK TABLES `participer_equipe` WRITE;
/*!40000 ALTER TABLE `participer_equipe` DISABLE KEYS */;
INSERT INTO `participer_equipe` VALUES (1,1,18,1),(1,2,14,2),(2,2,3,1),(2,3,0,2);
/*!40000 ALTER TABLE `participer_equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participer_solo`
--

DROP TABLE IF EXISTS `participer_solo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participer_solo` (
  `id_tournoi` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `rang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tournoi`,`id_utilisateur`),
  KEY `id_utilisateur` (`id_utilisateur`),
  CONSTRAINT `participer_solo_ibfk_1` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`),
  CONSTRAINT `participer_solo_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participer_solo`
--

LOCK TABLES `participer_solo` WRITE;
/*!40000 ALTER TABLE `participer_solo` DISABLE KEYS */;
INSERT INTO `participer_solo` VALUES (3,3,1500,1),(3,6,120,64);
/*!40000 ALTER TABLE `participer_solo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plateformes_difusion`
--

DROP TABLE IF EXISTS `plateformes_difusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plateformes_difusion` (
  `id_platforme` int(11) NOT NULL AUTO_INCREMENT,
  `lien_plateforme` varchar(50) NOT NULL,
  PRIMARY KEY (`id_platforme`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plateformes_difusion`
--

LOCK TABLES `plateformes_difusion` WRITE;
/*!40000 ALTER TABLE `plateformes_difusion` DISABLE KEYS */;
INSERT INTO `plateformes_difusion` VALUES (1,'twitch.tv'),(2,'youtube.com/gaming'),(3,'kick.com');
/*!40000 ALTER TABLE `plateformes_difusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recompense`
--

DROP TABLE IF EXISTS `recompense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recompense` (
  `ID_recompense` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `argent` int(11) NOT NULL,
  `id_tournoi` int(11) NOT NULL,
  PRIMARY KEY (`ID_recompense`),
  KEY `id_tournoi` (`id_tournoi`),
  CONSTRAINT `recompense_ibfk_1` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recompense`
--

LOCK TABLES `recompense` WRITE;
/*!40000 ALTER TABLE `recompense` DISABLE KEYS */;
INSERT INTO `recompense` VALUES (1,'Champion LFL',50000,1),(2,'MVP IEM',10000,2),(3,'Gagnant EVO',25000,3);
/*!40000 ALTER TABLE `recompense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sederouler`
--

DROP TABLE IF EXISTS `sederouler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sederouler` (
  `id_tournoi` int(11) NOT NULL,
  `id_lieu` int(11) NOT NULL,
  PRIMARY KEY (`id_tournoi`,`id_lieu`),
  KEY `id_lieu` (`id_lieu`),
  CONSTRAINT `sederouler_ibfk_1` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`),
  CONSTRAINT `sederouler_ibfk_2` FOREIGN KEY (`id_lieu`) REFERENCES `lieu_tournoi` (`id_lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sederouler`
--

LOCK TABLES `sederouler` WRITE;
/*!40000 ALTER TABLE `sederouler` DISABLE KEYS */;
INSERT INTO `sederouler` VALUES (1,3),(2,2),(3,4);
/*!40000 ALTER TABLE `sederouler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournoi`
--

DROP TABLE IF EXISTS `tournoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tournoi` (
  `id_tournoi` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tournoi` varchar(50) NOT NULL,
  `id_jeux` int(11) NOT NULL,
  `id_format` int(11) NOT NULL,
  PRIMARY KEY (`id_tournoi`),
  KEY `id_jeux` (`id_jeux`),
  KEY `id_format` (`id_format`),
  CONSTRAINT `tournoi_ibfk_1` FOREIGN KEY (`id_jeux`) REFERENCES `jeux` (`id_jeux`),
  CONSTRAINT `tournoi_ibfk_2` FOREIGN KEY (`id_format`) REFERENCES `format` (`id_format`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournoi`
--

LOCK TABLES `tournoi` WRITE;
/*!40000 ALTER TABLE `tournoi` DISABLE KEYS */;
INSERT INTO `tournoi` VALUES (1,'LFL Spring Split 2026',1,2),(2,'IEM Cologne 2026',2,2),(3,'EVO 2026',3,1);
/*!40000 ALTER TABLE `tournoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_utilisateur`
--

DROP TABLE IF EXISTS `type_utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_utilisateur` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_utilisateur`
--

LOCK TABLES `type_utilisateur` WRITE;
/*!40000 ALTER TABLE `type_utilisateur` DISABLE KEYS */;
INSERT INTO `type_utilisateur` VALUES (1,'Joueur Professionnel'),(2,'Joueur Amateur'),(3,'Administrateur'),(4,'Coach');
/*!40000 ALTER TABLE `type_utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_utilisateur` varchar(50) DEFAULT NULL,
  `id_type` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_utilisateur` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'ZywOo',1),(2,'Faker',1),(3,'Glutonny',1),(4,'Saken',1),(5,'Admin_Z',3),(6,'GamerDu45',2);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'SQLeague'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-27 17:51:06
