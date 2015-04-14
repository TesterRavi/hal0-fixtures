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
-- Table structure for table `shipping_dynamic_calc_rules`
--

DROP TABLE IF EXISTS `shipping_dynamic_calc_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_dynamic_calc_rules` (
  `shipping_dynamic_calc_rule` varchar(50) NOT NULL DEFAULT '',
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `definition` text NOT NULL,
  `apply_rule` enum('before','after') NOT NULL DEFAULT 'before',
  PRIMARY KEY (`start_date`,`end_date`,`shipping_dynamic_calc_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_dynamic_calc_rules`
--

LOCK TABLES `shipping_dynamic_calc_rules` WRITE;
/*!40000 ALTER TABLE `shipping_dynamic_calc_rules` DISABLE KEYS */;
INSERT INTO `shipping_dynamic_calc_rules` VALUES ('flat_dynamic_select','2010-12-07 05:00:00','2010-12-08 08:00:00','{\r\n    \"3628\": {\r\n        \"price\": 3.00\r\n    }\r\n}','after'),('flat_dynamic_select','2010-12-08 08:00:00','2010-12-11 16:00:00','{\r\n    \"4769\": {\r\n        \"price\": 3.00\r\n    },\r\n    \"4792\": {\r\n        \"price\": 3.00\r\n    }\r\n}','after'),('flat_dynamic_select','2010-12-29 08:00:00','2011-01-07 08:00:00','{\r\n    \"5223\": {\r\n        \"price\": 0.00\r\n    }\r\n}','after'),('flat_dynamic_all','2011-04-15 04:00:00','2011-04-18 06:59:59','{\"price\": 0.00, \"threshold\": 50.00}','after'),('flat_dynamic_all','2011-05-27 04:00:00','2011-05-31 06:59:59','{\"price\": 0.00, \"threshold\": 50.00}','after'),('flat_dynamic_all','2011-07-01 04:00:00','2011-07-05 06:59:59','{\"price\": 0.00, \"threshold\": 50.00}','after'),('employee_free','2011-07-01 04:00:00','2020-07-05 06:59:59','{\"threshold\": 20.00}','after'),('flat_dynamic_all','2012-08-31 04:00:00','2012-09-04 06:59:59','{\"price\": 0.00, \"threshold\": 100.00, \"countries\": [\"US\"]}','after');
/*!40000 ALTER TABLE `shipping_dynamic_calc_rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:58
