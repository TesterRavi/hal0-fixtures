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
-- Table structure for table `federated_member_profiles`
--

DROP TABLE IF EXISTS `federated_member_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `federated_member_profiles` (
  `member_id` int(10) unsigned NOT NULL,
  `lifecycle_segment` varchar(50) NOT NULL DEFAULT 'Newborn',
  `lifecycle_segment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `loyalty_segment` varchar(50) DEFAULT NULL,
  `loyalty_segment_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `copa` varchar(50) NOT NULL DEFAULT 'default',
  `copa_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cosa` varchar(50) NOT NULL DEFAULT 'default',
  `cosa_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CONNECTION='mysql://hautelook:haute98livedb@10.0.0.248:3306/hautelook_live/member_profiles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federated_member_profiles`
--

LOCK TABLES `federated_member_profiles` WRITE;
/*!40000 ALTER TABLE `federated_member_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `federated_member_profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:25
