
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
DROP TABLE IF EXISTS `wms_open_order_items_xdk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wms_open_order_items_xdk` (
  `order_item_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_xdk` tinyint(4) NOT NULL DEFAULT '0',
  `customer_code` int(10) unsigned NOT NULL DEFAULT '0',
  `order_item_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sale_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ordered` int(10) unsigned NOT NULL DEFAULT '0',
  `sku` int(10) unsigned NOT NULL DEFAULT '0',
  `event_id` int(10) unsigned NOT NULL DEFAULT '0',
  `event` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ship_to_code` int(10) unsigned NOT NULL DEFAULT '0',
  `ship_to_name` varchar(90) NOT NULL DEFAULT '',
  `ship_to_attention` varchar(35) NOT NULL DEFAULT '',
  `ship_to_addr1` varchar(45) NOT NULL DEFAULT '',
  `ship_to_addr2` varchar(45) NOT NULL DEFAULT '',
  `ship_to_city` varchar(45) NOT NULL DEFAULT '',
  `ship_to_state` varchar(3) NOT NULL DEFAULT '',
  `ship_to_zip` varchar(20) NOT NULL DEFAULT '',
  `ship_to_country_code` varchar(2) NOT NULL DEFAULT 'ZZ',
  `ship_to_phone` varchar(13) NOT NULL DEFAULT '',
  `processed` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

