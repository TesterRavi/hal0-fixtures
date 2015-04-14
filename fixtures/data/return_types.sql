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
-- Table structure for table `return_types`
--

DROP TABLE IF EXISTS `return_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_types` (
  `return_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(31) NOT NULL,
  PRIMARY KEY (`return_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_types`
--

LOCK TABLES `return_types` WRITE;
/*!40000 ALTER TABLE `return_types` DISABLE KEYS */;
INSERT INTO `return_types` VALUES (1,'Return to HL Credit'),(2,'Return to CreditCard/PayPal/BML'),(3,'Damage'),(4,'Oversold'),(5,'Short'),(6,'Warehouse'),(7,'Restocking'),(8,'Return Lost in Warehouse to HL'),(9,'Return Lost in Warehouse to CC'),(11,'Fraud'),(12,'Return Lost in Shipment'),(13,'Restocking, Remove Fee to HL'),(14,'Restocking, Remove Fee to CC'),(15,'Return to Gift Card'),(16,'Damage to Gift Card'),(17,'Warehouse to Gift Card'),(18,'Cancel'),(19,'Non Inventory'),(20,'Inventory'),(21,'In warehouse, return n/a'),(22,'Disputed'),(23,'Restocking, Remove Fee'),(24,'Lost in Warehouse');
/*!40000 ALTER TABLE `return_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:57
