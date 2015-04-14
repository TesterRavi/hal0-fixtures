-- MySQL dump 10.13  Distrib 5.5.34, for Linux (x86_64)
--
-- Host: localhost    Database: hautelook
-- ------------------------------------------------------
-- Server version	5.5.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `return_ship_methods`
--

DROP TABLE IF EXISTS `return_ship_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_ship_methods` (
  `return_ship_method` varchar(30) NOT NULL,
  `agent` varchar(10) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL,
  `return_ship_methods_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_ship_method`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_ship_methods`
--

LOCK TABLES `return_ship_methods` WRITE;
/*!40000 ALTER TABLE `return_ship_methods` DISABLE KEYS */;
INSERT INTO `return_ship_methods` VALUES ('DHL Ground','DHL','DHL Domestic Service','2012-10-02 04:48:41'),('Fedex Ground','FEDEX','FEDEX Domestic Service','2012-10-02 04:48:41'),('Landmark Australia','LANDMARK','Landmark Australian Service','2012-10-02 04:48:41'),('Landmark Canada','LANDMARK','Landmark Canadian Service','2012-10-02 04:48:41'),('Newgistics','USPS','Newgistics Domestic Service','2012-10-02 04:48:41'),('UPS Canada','UPS','UPS Canadian Service','2012-10-02 04:48:41'),('USPS','USPS','U.S. Postal Service','2012-10-02 04:48:41');
/*!40000 ALTER TABLE `return_ship_methods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:04
