
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
DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `sku` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `ordered` int(11) unsigned NOT NULL,
  `taxes` decimal(10,2) DEFAULT '0.00',
  `freight` decimal(10,2) NOT NULL,
  `tax_rate` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `freight_taxes` decimal(10,2) NOT NULL DEFAULT '0.00',
  `surcharge` decimal(10,2) unsigned DEFAULT '0.00',
  `surcharge_rate` decimal(10,4) unsigned DEFAULT '0.0000',
  `ship_method_id` int(10) unsigned NOT NULL,
  `max_short` int(10) unsigned NOT NULL DEFAULT '0',
  `current_short` int(10) unsigned NOT NULL DEFAULT '0',
  `short_email_sent` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `returnable` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `FK_order_items::orders` (`order_id`),
  KEY `FK_order_items::events` (`event_id`),
  KEY `FK_order_items::skus` (`sku`),
  KEY `modify_date` (`modify_date`),
  CONSTRAINT `FK_order_items::events` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_order_items::orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_order_items::skus` FOREIGN KEY (`sku`) REFERENCES `skus` (`sku`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14947203 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

