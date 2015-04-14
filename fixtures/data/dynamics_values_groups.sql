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
-- Table structure for table `dynamics_values_groups`
--

DROP TABLE IF EXISTS `dynamics_values_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamics_values_groups` (
  `dynamics_values_group` varchar(25) NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`dynamics_values_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamics_values_groups`
--

LOCK TABLES `dynamics_values_groups` WRITE;
/*!40000 ALTER TABLE `dynamics_values_groups` DISABLE KEYS */;
INSERT INTO `dynamics_values_groups` VALUES ('','Default Group',1),('expcred-62','EXPCRED-62',1),('kanban-1083','kanban-1083',1),('kanban-1260','kanban-1260',1),('kanban-1269','KANBAN-1269',1),('kanban-1296','KANBAN-1296',1),('kanban-1300','kanban-1300',1),('kanban-1311','kanban-1311',1),('kanban-1352','kanban-1352',1),('kanban-1352-redo','REDO of KANBAN-1352',1),('kanban-1385','kanban-1385',0),('kanban-1457','kanban-1457',0),('kanban-1574-a','kanban-1574-a',1),('kanban-1574-b','kanban-1574-b',1),('kanban-1638','kanban-1638 - Gmail Notification',1),('kanban-1640','kanban-1640',1),('kanban-1658','kanban-1658',1),('kanban-1672','KANBAN-1672',1),('kanban-1677','kanban-1677',1),('kanban-1714','kanban-1714',1),('kanban-1831','KANBAN-1831',1);
/*!40000 ALTER TABLE `dynamics_values_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:22
