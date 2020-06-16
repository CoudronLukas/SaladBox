-- MySQL dump 10.17  Distrib 10.3.17-MariaDB, for debian-linux-gnueabihf (armv7l)
--
-- Host: localhost    Database: saladbox_db
-- ------------------------------------------------------
-- Server version	10.3.17-MariaDB-0+deb10u1

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
-- Table structure for table `Actie`
--

DROP TABLE IF EXISTS `Actie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Actie` (
  `actieID` int(11) NOT NULL AUTO_INCREMENT,
  `datum` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) DEFAULT NULL,
  `actuatorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`actieID`),
  KEY `fk_Actie_Actuator1_idx` (`actuatorID`),
  CONSTRAINT `fk_Actie_Actuator1` FOREIGN KEY (`actuatorID`) REFERENCES `Actuator` (`actuatorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actie`
--

LOCK TABLES `Actie` WRITE;
/*!40000 ALTER TABLE `Actie` DISABLE KEYS */;
/*!40000 ALTER TABLE `Actie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Actuator`
--

DROP TABLE IF EXISTS `Actuator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Actuator` (
  `actuatorID` int(11) NOT NULL AUTO_INCREMENT,
  `beschrijving` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`actuatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actuator`
--

LOCK TABLES `Actuator` WRITE;
/*!40000 ALTER TABLE `Actuator` DISABLE KEYS */;
/*!40000 ALTER TABLE `Actuator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meting`
--

DROP TABLE IF EXISTS `Meting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Meting` (
  `metingID` int(11) NOT NULL AUTO_INCREMENT,
  `waarde` float DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sensorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`metingID`),
  KEY `fk_Meting_Sensor_idx` (`sensorID`),
  CONSTRAINT `fk_Meting_Sensor` FOREIGN KEY (`sensorID`) REFERENCES `Sensor` (`sensorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meting`
--

LOCK TABLES `Meting` WRITE;
/*!40000 ALTER TABLE `Meting` DISABLE KEYS */;
INSERT INTO `Meting` VALUES (21,2.02,'2020-05-27 09:55:04',1),(22,2.02,'2020-05-27 09:55:14',1),(23,2.03,'2020-05-27 09:55:24',1),(24,1.97,'2020-05-27 09:55:34',1),(25,2.02,'2020-05-27 09:55:44',1),(26,2.02,'2020-05-27 09:55:55',1),(27,2.02,'2020-05-27 09:56:05',1),(28,2.02,'2020-05-27 09:56:15',1),(29,1.99,'2020-05-27 09:56:25',1),(30,1.13,'2020-05-27 09:56:36',1),(31,1.68,'2020-05-27 09:56:46',1),(32,1.08,'2020-05-27 09:56:56',1),(33,0.97,'2020-05-27 09:57:06',1),(34,1.2,'2020-05-27 09:57:17',1),(35,2.04,'2020-05-27 09:57:56',1),(36,2.04,'2020-05-27 09:57:58',1),(37,2.04,'2020-05-27 09:58:00',1),(38,2.02,'2020-05-27 09:58:02',1),(39,2.03,'2020-05-27 09:58:04',1),(40,2.04,'2020-05-27 09:58:07',1),(41,2.04,'2020-05-27 09:58:09',1),(42,2.04,'2020-05-27 09:58:11',1),(43,2.03,'2020-05-27 09:58:13',1),(44,2.02,'2020-05-27 09:58:15',1),(45,2.02,'2020-05-27 09:58:18',1),(46,2.02,'2020-05-27 09:58:20',1),(47,2.03,'2020-05-27 09:58:22',1),(48,2.03,'2020-05-27 09:58:24',1),(49,2.02,'2020-05-27 09:58:27',1),(50,2.44,'2020-05-27 09:58:29',1),(51,3.08,'2020-05-27 09:58:31',1),(52,2.98,'2020-05-27 09:58:33',1),(53,2.97,'2020-05-27 09:58:35',1),(54,3.07,'2020-05-27 09:58:38',1),(55,2.95,'2020-05-27 09:58:40',1),(56,2.98,'2020-05-27 09:58:42',1),(57,2.93,'2020-05-27 09:58:44',1),(58,3,'2020-05-27 09:58:46',1),(59,3.08,'2020-05-27 09:58:49',1),(60,3.01,'2020-05-27 09:58:51',1),(61,2.96,'2020-05-27 09:58:53',1),(62,2.7,'2020-05-27 09:58:55',1),(63,3.05,'2020-05-27 09:58:58',1),(64,2.78,'2020-05-27 09:59:00',1),(65,3.06,'2020-05-27 09:59:02',1),(66,3.1,'2020-05-27 09:59:04',1),(67,3.07,'2020-05-27 09:59:06',1),(68,3,'2020-05-27 09:59:09',1),(69,2.73,'2020-05-27 09:59:11',1),(70,2.71,'2020-05-27 09:59:13',1),(71,1.97,'2020-05-27 09:59:15',1),(72,1.98,'2020-05-27 09:59:18',1),(73,2.98,'2020-05-27 09:59:20',1),(74,2.99,'2020-05-27 09:59:22',1),(75,2.99,'2020-05-27 09:59:24',1),(76,1.98,'2020-05-27 09:59:26',1);
/*!40000 ALTER TABLE `Meting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sensor`
--

DROP TABLE IF EXISTS `Sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sensor` (
  `sensorID` int(11) NOT NULL AUTO_INCREMENT,
  `beschrijving` varchar(245) DEFAULT NULL,
  `eenheid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`sensorID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sensor`
--

LOCK TABLES `Sensor` WRITE;
/*!40000 ALTER TABLE `Sensor` DISABLE KEYS */;
INSERT INTO `Sensor` VALUES (1,'LDR','volt');
/*!40000 ALTER TABLE `Sensor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-27 12:01:43
