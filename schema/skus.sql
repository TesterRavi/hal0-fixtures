
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
DROP TABLE IF EXISTS `skus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skus` (
  `sku` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upc` varchar(15) DEFAULT NULL,
  `nupc` varchar(15) DEFAULT NULL,
  `style_id` int(10) unsigned NOT NULL,
  `color` varchar(100) NOT NULL DEFAULT '',
  `color_family` varchar(25) DEFAULT NULL,
  `size` varchar(20) NOT NULL,
  `std_size` varchar(20) DEFAULT NULL,
  `location_brand_id` int(10) unsigned DEFAULT NULL,
  `location` varchar(75) DEFAULT NULL,
  `sort` tinyint(3) unsigned NOT NULL,
  `barcode` varchar(64) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `quantity_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msrp` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `clearance_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `full_line_transfer` tinyint(1) NOT NULL DEFAULT '0',
  `allow_persistent_catalog` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sku`),
  UNIQUE KEY `upc_2` (`upc`),
  KEY `nupc` (`nupc`),
  KEY `color` (`color`),
  KEY `size` (`size`),
  KEY `FK_skus::styles` (`style_id`),
  KEY `FK_skus::redemption_locations` (`location_brand_id`,`location`),
  KEY `FK_skus::color_families` (`color_family`),
  CONSTRAINT `FK_skus::color_families` FOREIGN KEY (`color_family`) REFERENCES `color_families` (`color_family`),
  CONSTRAINT `FK_skus::redemption_locations` FOREIGN KEY (`location_brand_id`, `location`) REFERENCES `redemption_locations` (`brand_id`, `location`) ON UPDATE CASCADE,
  CONSTRAINT `FK_skus::styles` FOREIGN KEY (`style_id`) REFERENCES `styles` (`style_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2736241 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

