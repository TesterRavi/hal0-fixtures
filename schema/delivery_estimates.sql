
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `delivery_estimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_estimates` (
  `delivery_low_day` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_high_day` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_estimate_rule` enum('Business','Calendar') NOT NULL DEFAULT 'Business',
  `delivery_estimate_category` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `sort` tinyint(3) unsigned DEFAULT '0',
  `active` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`delivery_low_day`,`delivery_high_day`,`delivery_estimate_rule`),
  KEY `FK_delivery_estimates::delivery_estimate_categories` (`delivery_estimate_category`),
  CONSTRAINT `FK_delivery_estimates::delivery_estimate_categories` FOREIGN KEY (`delivery_estimate_category`) REFERENCES `delivery_estimate_categories` (`delivery_estimate_category`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
