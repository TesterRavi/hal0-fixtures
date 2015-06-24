
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `returns_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returns_aud` (
  `return_id` int(10) unsigned DEFAULT NULL,
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creation_method` enum('manual','automated') DEFAULT NULL,
  `ship_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `received_date` datetime DEFAULT NULL,
  `complete_date` datetime DEFAULT NULL,
  `member_id` int(10) unsigned DEFAULT NULL,
  `shipping_id` int(10) unsigned DEFAULT NULL,
  `ship_method_id` int(10) unsigned DEFAULT NULL,
  `return_payment_method` varchar(30) DEFAULT NULL,
  `tracking_num` varchar(32) DEFAULT NULL,
  `tracking_info_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `return_ship_method` varchar(30) DEFAULT NULL,
  `returned` int(10) unsigned DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `taxes` decimal(10,2) DEFAULT NULL,
  `freight` decimal(10,2) DEFAULT NULL,
  `surcharge` decimal(10,2) unsigned DEFAULT NULL,
  `freight_taxes` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `charged` decimal(10,2) DEFAULT NULL,
  `rcredit` decimal(10,2) DEFAULT NULL,
  `ccredit` decimal(10,2) DEFAULT NULL,
  `coupon` decimal(10,2) DEFAULT NULL,
  `fcoupon` decimal(10,2) DEFAULT NULL,
  `giftcard` decimal(10,2) DEFAULT NULL,
  `rlabel` tinyint(1) DEFAULT NULL,
  `label_cost` decimal(10,2) DEFAULT NULL,
  `comments` text,
  `notes` text,
  `restocking_fee` decimal(10,2) DEFAULT NULL,
  `action` enum('INS','UPD','DEL') DEFAULT NULL,
  `action_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action_timeint` bigint(20) DEFAULT NULL
) ENGINE=BLACKHOLE DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

