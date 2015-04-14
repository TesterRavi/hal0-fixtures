
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `shipment_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment_tracking` (
  `shipment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tracking_num` varchar(25) NOT NULL DEFAULT '',
  `ship_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_attempt_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_estimate_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `return_to_shipper_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email_notification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email_notification_type` enum('full','partial','remainder') DEFAULT NULL,
  `tracking_info` varchar(150) NOT NULL DEFAULT '',
  `tracking_info_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `label_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `group_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `source` varchar(25) NOT NULL DEFAULT 'gearman',
  PRIMARY KEY (`tracking_num`,`shipment_id`),
  KEY `FK_shipment_tracking::shipments` (`shipment_id`),
  KEY `ship_date` (`ship_date`),
  KEY `email_notification_type` (`email_notification_type`),
  KEY `tracking_info_date` (`tracking_info_date`),
  KEY `delivery_date` (`delivery_date`,`tracking_info_date`),
  KEY `FK_shipment_tracking::shipment_tracking_sources` (`source`),
  CONSTRAINT `FK_shipment_tracking::shipments` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`shipment_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_shipment_tracking::shipment_tracking_sources` FOREIGN KEY (`source`) REFERENCES `shipment_tracking_sources` (`shipment_tracking_source`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

