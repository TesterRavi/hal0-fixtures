
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
DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returns` (
  `return_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_date` datetime NOT NULL,
  `creation_method` enum('manual','automated') CHARACTER SET utf8 NOT NULL DEFAULT 'manual',
  `ship_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `received_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `complete_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `member_id` int(10) unsigned NOT NULL,
  `shipping_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ship_method_id` int(10) unsigned NOT NULL DEFAULT '3',
  `return_payment_method` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'Original_Payment',
  `tracking_num` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `tracking_info_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `return_ship_method` varchar(30) DEFAULT NULL,
  `returned` int(10) unsigned NOT NULL DEFAULT '0',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `taxes` decimal(10,2) NOT NULL,
  `freight` decimal(10,2) NOT NULL,
  `surcharge` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `freight_taxes` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `charged` decimal(10,2) NOT NULL,
  `rcredit` decimal(10,2) NOT NULL,
  `ccredit` decimal(10,2) NOT NULL,
  `coupon` decimal(10,2) DEFAULT '0.00',
  `fcoupon` decimal(10,2) NOT NULL,
  `giftcard` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rlabel` tinyint(1) DEFAULT '0',
  `label_cost` decimal(10,2) DEFAULT '0.00',
  `comments` text CHARACTER SET utf8,
  `notes` text CHARACTER SET utf8,
  `restocking_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_id`),
  KEY `FK_returns::members` (`member_id`),
  KEY `FK_returns::shipping` (`shipping_id`),
  KEY `FK_returns::ship_methods` (`ship_method_id`),
  KEY `tracking_num` (`tracking_num`,`ship_method_id`,`request_date`,`tracking_info_date`,`return_id`),
  KEY `FK_returns::return_payment_methods` (`return_payment_method`),
  KEY `FK_returns::return_ship_methods` (`return_ship_method`),
  CONSTRAINT `FK_returns::members` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_returns::return_payment_methods` FOREIGN KEY (`return_payment_method`) REFERENCES `return_payment_methods` (`return_payment_method`) ON UPDATE CASCADE,
  CONSTRAINT `FK_returns::return_ship_methods` FOREIGN KEY (`return_ship_method`) REFERENCES `return_ship_methods` (`return_ship_method`),
  CONSTRAINT `FK_returns::shipping` FOREIGN KEY (`shipping_id`) REFERENCES `shipping` (`shipping_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_returns::ship_methods` FOREIGN KEY (`ship_method_id`) REFERENCES `ship_methods` (`ship_method_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5277882 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 148480 kB';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

