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
-- Table structure for table `select_email_queue_records`
--

DROP TABLE IF EXISTS `select_email_queue_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `select_email_queue_records` (
  `email_queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `queue_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email_recipient` varchar(100) NOT NULL DEFAULT '',
  `email_sender` varchar(100) NOT NULL DEFAULT '',
  `email_subject` text NOT NULL,
  `email_body` text NOT NULL,
  `email_header` text NOT NULL,
  `email_metadata` text NOT NULL,
  `email_template` varchar(20) NOT NULL,
  `email_status` enum('complete','pending','retry','failed','review') NOT NULL DEFAULT 'pending',
  `raw_request` text NOT NULL,
  `raw_response` text NOT NULL,
  `send_on_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sent_date` timestamp NULL DEFAULT NULL,
  `process_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email_queue_id`),
  KEY `FK_email_queue::members` (`member_id`),
  KEY `FK_email_queue::email_templates` (`email_template`),
  KEY `queue_date` (`queue_date`,`email_status`),
  KEY `process_id` (`process_id`,`email_status`),
  KEY `email_status` (`email_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `select_email_queue_records`
--

LOCK TABLES `select_email_queue_records` WRITE;
/*!40000 ALTER TABLE `select_email_queue_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `select_email_queue_records` ENABLE KEYS */;
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
