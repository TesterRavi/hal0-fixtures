
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `orders_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_aud` (
  `order_id` int(10) unsigned DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `member_id` int(10) unsigned DEFAULT NULL,
  `session_id` varchar(32) DEFAULT NULL,
  `billing_id` int(10) unsigned DEFAULT NULL,
  `shipping_id` int(10) unsigned DEFAULT NULL,
  `ship_method_id` int(10) unsigned DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `card_number` varchar(10) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `transaction_type` enum('na','auth','capture','sales') DEFAULT NULL,
  `ordered` smallint(6) DEFAULT NULL,
  `tax_rate` decimal(10,4) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `taxes` decimal(10,2) DEFAULT NULL,
  `freight` decimal(10,2) DEFAULT NULL,
  `freight_class` varchar(400) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `charged` decimal(10,2) DEFAULT NULL,
  `rcredit` decimal(10,2) DEFAULT NULL,
  `ccredit` decimal(10,2) DEFAULT NULL,
  `scredit` decimal(10,2) DEFAULT NULL,
  `coupon` decimal(10,2) DEFAULT NULL,
  `gift_card` decimal(10,2) DEFAULT NULL,
  `fcoupon` decimal(10,2) DEFAULT NULL,
  `acredit` decimal(10,2) DEFAULT NULL,
  `notes` text,
  `processor` varchar(20) DEFAULT NULL,
  `sid` int(10) unsigned DEFAULT NULL,
  `mid` varchar(255) DEFAULT NULL,
  `cid` varchar(200) DEFAULT NULL,
  `aid` varchar(200) DEFAULT NULL,
  `surcharge` decimal(10,2) unsigned DEFAULT NULL,
  `surcharge_rate` decimal(10,4) unsigned DEFAULT NULL,
  `fraud` tinyint(1) unsigned DEFAULT NULL,
  `age_verified` tinyint(3) unsigned DEFAULT NULL,
  `omid_id` int(11) DEFAULT NULL,
  `action` enum('INS','UPD','DEL') DEFAULT NULL,
  `action_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_timeint` bigint(20) DEFAULT NULL
) ENGINE=BLACKHOLE DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

