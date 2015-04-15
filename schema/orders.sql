
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `member_id` int(10) unsigned NOT NULL,
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `billing_id` int(10) unsigned NOT NULL,
  `shipping_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ship_method_id` int(10) unsigned NOT NULL,
  `payment_method` varchar(10) NOT NULL DEFAULT '',
  `card_number` varchar(10) NOT NULL DEFAULT '0',
  `transaction_id` varchar(20) NOT NULL DEFAULT '',
  `transaction_type` enum('na','auth','capture','sales') NOT NULL DEFAULT 'na',
  `ordered` smallint(6) NOT NULL DEFAULT '0',
  `tax_rate` decimal(10,4) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `taxes` decimal(10,2) DEFAULT '0.00',
  `freight` decimal(10,2) NOT NULL,
  `freight_class` varchar(400) NOT NULL DEFAULT 'Halo_Freight_StandardFreight',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `charged` decimal(10,2) NOT NULL,
  `rcredit` decimal(10,2) NOT NULL,
  `ccredit` decimal(10,2) NOT NULL,
  `scredit` decimal(10,2) NOT NULL,
  `coupon` decimal(10,2) DEFAULT '0.00',
  `gift_card` decimal(10,2) DEFAULT '0.00',
  `fcoupon` decimal(10,2) NOT NULL,
  `acredit` decimal(10,2) NOT NULL,
  `notes` text NOT NULL,
  `processor` varchar(20) DEFAULT NULL,
  `sid` int(10) unsigned NOT NULL DEFAULT '100',
  `mid` varchar(255) DEFAULT NULL,
  `cid` varchar(200) DEFAULT NULL,
  `aid` varchar(200) DEFAULT NULL,
  `surcharge` decimal(10,2) unsigned DEFAULT '0.00',
  `surcharge_rate` decimal(10,4) unsigned DEFAULT '0.0000',
  `fraud` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `age_verified` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `ship_method_id` (`ship_method_id`),
  KEY `FK_orders::campaigns` (`sid`),
  KEY `FK_orders::members` (`member_id`),
  KEY `FK_orders::shipping` (`shipping_id`),
  KEY `FK_orders::billing` (`billing_id`),
  KEY `FK_orders::processors` (`processor`),
  KEY `order_date` (`order_date`,`order_id`,`member_id`),
  CONSTRAINT `FK_orders::billing` FOREIGN KEY (`billing_id`) REFERENCES `billing` (`billing_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_orders::campaigns` FOREIGN KEY (`sid`) REFERENCES `campaigns` (`sid`),
  CONSTRAINT `FK_orders::members` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_orders::processors` FOREIGN KEY (`processor`) REFERENCES `processors` (`processor`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Orders::ShipMethods` FOREIGN KEY (`ship_method_id`) REFERENCES `ship_methods` (`ship_method_id`),
  CONSTRAINT `FK_orders::shipping` FOREIGN KEY (`shipping_id`) REFERENCES `shipping` (`shipping_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7539554 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

