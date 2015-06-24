
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `order_items_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items_aud` (
  `item_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `event_id` int(10) unsigned DEFAULT NULL,
  `sku` int(10) unsigned DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `ordered` int(11) unsigned DEFAULT NULL,
  `taxes` decimal(10,2) DEFAULT NULL,
  `freight` decimal(10,2) DEFAULT NULL,
  `tax_rate` decimal(10,4) DEFAULT NULL,
  `freight_taxes` decimal(10,2) DEFAULT NULL,
  `surcharge` decimal(10,2) unsigned DEFAULT NULL,
  `surcharge_rate` decimal(10,4) unsigned DEFAULT NULL,
  `ship_method_id` int(10) unsigned DEFAULT NULL,
  `max_short` int(10) unsigned DEFAULT NULL,
  `current_short` int(10) unsigned DEFAULT NULL,
  `short_email_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `returnable` tinyint(3) unsigned DEFAULT NULL,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wms_sent_date` datetime DEFAULT NULL,
  `action` enum('INS','UPD','DEL') DEFAULT NULL,
  `action_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `idx_order_items_audit_action_date` (`action_date`,`item_id`)
) ENGINE=BLACKHOLE DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

