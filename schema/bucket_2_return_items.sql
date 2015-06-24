
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
DROP TABLE IF EXISTS `bucket_2_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bucket_2_return_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `sku` int(10) unsigned NOT NULL,
  `return_reason_type` varchar(40) NOT NULL DEFAULT 'No reason',
  `transaction_id` varchar(32) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '1',
  `return_item_status` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `taxes` decimal(10,2) NOT NULL,
  `freight` decimal(10,2) NOT NULL,
  `freight_taxes` decimal(10,2) NOT NULL DEFAULT '0.00',
  `surcharge` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `restocking_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `charged` decimal(10,2) NOT NULL,
  `rcredit` decimal(10,2) NOT NULL,
  `ccredit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon` decimal(10,2) NOT NULL,
  `fcoupon` decimal(10,2) NOT NULL,
  `giftcard` decimal(10,2) NOT NULL DEFAULT '0.00',
  `label_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `give_back_coupon_flag` tinyint(1) NOT NULL DEFAULT '0',
  `timeframe` enum('during_sale','pre_ship','post_ship','post_event') DEFAULT NULL,
  `ship_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `receive_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `complete_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `void_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tracking_num` varchar(30) NOT NULL DEFAULT '',
  `tracking_info_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reason` varchar(45) DEFAULT NULL,
  `processor` enum('Authnet') NOT NULL DEFAULT 'Authnet',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `check_request_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `check_sent_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gift_return` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `FK_return_items::return_item_statuses` (`return_item_status`),
  KEY `FK_return_items::events` (`event_id`),
  KEY `FK_return_items::skus` (`sku`),
  KEY `FK_return_items::orders` (`order_id`),
  KEY `FK_return_items::returns` (`return_id`),
  KEY `modify_date` (`modify_date`),
  KEY `FK_return_items::return_reason_types` (`return_reason_type`)
) ENGINE=InnoDB AUTO_INCREMENT=17548490 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 487424 kB';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

