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
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `season` varchar(15) NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`season`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES ('1','Spring / Summer',1),('101','1/30/11 - 2/26/11',1),('102','2/27/11 - 4/2/11',1),('103','4/3/11 - 4/30/11',1),('104','5/1/11 - 5/28/11',1),('105','5/29/11 - 7/2/11',1),('106','7/3/11 - 7/30/11',1),('107','7/31/11 - 8/27/11',1),('108','8/28/11 - 10/1/11',1),('109','10/2/11 - 10/29/11',1),('110','10/30/11 - 11/26/11',1),('111','11/27/11 - 12/31/11',1),('112','Spring 2012',1),('113','Spring 2013',1),('2','Fall / Winter',1),('201','1/29/12 - 2/25/12',1),('202','2/26/12 - 4/1/12',1),('203','4/2/12 - 4/29/12',1),('204','4/30/12 - 5/27/12',1),('205','5/28/12 - 7/1/12',1),('206','7/2/12 - 7/29/12',1),('207','7/30/12 - 8/26/12',1),('208','8/27/12 - 9/30/12',1),('209','10/1/12 - 10/28/12',1),('210','10/29/12 - 11/25/12',1),('211','11/26/12 - 12/30/12',1),('212','Summer 2012',1),('213','Summer 2013',1),('3','Basic / Non-Seasonal',1),('312','Fall 2012',1),('313','Fall 2013',1),('412','Holiday 2012',1),('413','Holiday 2013',1),('512','Seasonal Basic 2012',1),('513','Seasonal Basic 2013',1);
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:08
