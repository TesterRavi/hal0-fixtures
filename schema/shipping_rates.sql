
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
DROP TABLE IF EXISTS `shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_rates` (
  `shipping_rates_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_weight` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_rate` decimal(7,2) unsigned NOT NULL DEFAULT '0.00',
  `country_iso` varchar(2) NOT NULL DEFAULT 'US',
  `shipping_rates_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `shipping_rates_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shipping_rates_modified_by` varchar(30) DEFAULT '0',
  `ship_method_id` int(10) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`shipping_rates_id`),
  KEY `FK_shipping_rates::countries` (`country_iso`),
  KEY `FK_shipping_rates::ship_methods` (`ship_method_id`),
  KEY `shipping_weight` (`shipping_weight`,`country_iso`),
  CONSTRAINT `FK_shipping_rates::countries` FOREIGN KEY (`country_iso`) REFERENCES `countries` (`country_iso`) ON UPDATE CASCADE,
  CONSTRAINT `FK_shipping_rates::ship_methods` FOREIGN KEY (`ship_method_id`) REFERENCES `ship_methods` (`ship_method_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

