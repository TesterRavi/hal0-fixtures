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
-- Table structure for table `remote_users`
--

DROP TABLE IF EXISTS `remote_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remote_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `soap_class` varchar(100) NOT NULL,
  `special` text,
  PRIMARY KEY (`id`),
  KEY `K_RemoteUsers_Members_member_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remote_users`
--

LOCK TABLES `remote_users` WRITE;
/*!40000 ALTER TABLE `remote_users` DISABLE KEYS */;
INSERT INTO `remote_users` VALUES (1,323499,'Remote_Model_UserRegistration','group=620'),(2,700028,'Remote_Model_UserRegistration','group=620'),(3,1310459,'Remote_Model_DynamicProductFeeds',''),(4,421680,'Remote_Model_DynamicProductFeeds',''),(5,137965,'Remote_Model_DynamicProductFeeds',''),(6,1665196,'Remote_Model_UserRegistration','group=90684'),(7,1665580,'Remote_Model_UserRegistration','group=76233'),(8,1811177,'Remote_Model_DynamicProductFeeds',''),(10,421680,'Remote_Model_DynamicProductFeeds',''),(11,421680,'Remote_Model_DynamicProductFeeds',''),(12,2110125,'Remote_Model_DynamicProductFeeds',''),(13,2111423,'Remote_Model_DynamicProductFeeds',''),(14,1232274,'Remote_Model_DynamicProductFeeds',''),(15,2148957,'Remote_Model_DynamicProductFeeds',''),(16,2154832,'Remote_Model_DynamicProductFeeds',''),(17,2207493,'Remote_Model_DynamicProductFeeds',''),(18,2207850,'Remote_Model_DynamicProductFeeds','92185'),(19,2229055,'Remote_Model_DynamicProductFeeds',''),(20,251641,'Remote_Model_DynamicProductFeeds',''),(21,2524279,'Remote_Model_DynamicProductFeeds',''),(22,2659370,'Remote_Model_DynamicProductFeeds',''),(23,2726791,'Remote_Model_DynamicProductFeeds',''),(24,2659370,'Remote_Model_UserRegistration','group=4411'),(25,2833382,'Remote_Model_DynamicProductFeeds',''),(26,2868329,'Remote_Model_DynamicProductFeeds',''),(27,3107016,'Remote_Model_DynamicProductFeeds',''),(28,3135276,'Remote_Model_DynamicProductFeeds',''),(29,3193247,'Remote_Model_DynamicProductFeeds',''),(30,3271360,'Remote_Model_UserRegistration','group=10753'),(31,2302988,'Remote_Model_DynamicProductFeeds',''),(32,5417362,'Remote_Model_DynamicProductFeeds',''),(33,5605040,'Remote_Model_DynamicProductFeeds',''),(34,6362233,'Remote_Model_DynamicProductFeeds','');
/*!40000 ALTER TABLE `remote_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:56
