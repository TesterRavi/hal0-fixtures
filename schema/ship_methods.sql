
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
DROP TABLE IF EXISTS `ship_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ship_methods` (
  `ship_method_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ship_method` varchar(45) NOT NULL DEFAULT '',
  `agent` varchar(45) NOT NULL,
  `service_code` char(2) NOT NULL,
  `freight_class` varchar(255) NOT NULL DEFAULT 'Halo_Freight_StandardWeightFreight',
  `min_freight` decimal(7,2) unsigned NOT NULL DEFAULT '0.00',
  `max_freight` decimal(7,2) unsigned NOT NULL DEFAULT '0.00',
  `admin_selectable` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ship_method_calc_rule` varchar(50) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`ship_method_id`),
  UNIQUE KEY `ship_method` (`ship_method`),
  KEY `agent` (`agent`),
  KEY `FK_ship_methods::ship_method_calc_rules` (`ship_method_calc_rule`),
  CONSTRAINT `FK_ship_methods::ship_method_calc_rules` FOREIGN KEY (`ship_method_calc_rule`) REFERENCES `ship_method_calc_rules` (`ship_method_calc_rule`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

