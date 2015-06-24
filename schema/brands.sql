
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
DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL DEFAULT '',
  `tax_id` varchar(45) NOT NULL,
  `DEPRECATED_shiptime` varchar(45) NOT NULL,
  `delivery_low_day` int(10) unsigned DEFAULT '10',
  `delivery_high_day` int(10) unsigned DEFAULT '14',
  `delivery_canadian_offset` int(10) unsigned DEFAULT '3',
  `delivery_estimate_rule` enum('Business','Calendar') DEFAULT NULL,
  `brand_status` enum('inactive','active') NOT NULL DEFAULT 'active',
  `warehouse_id` int(10) unsigned NOT NULL DEFAULT '1',
  `check_payable` varchar(100) NOT NULL,
  `corporate_name` varchar(100) NOT NULL,
  `brand_parent_id` int(10) unsigned DEFAULT NULL,
  `size_chart` varchar(40) DEFAULT NULL,
  `measurement_guide` varchar(40) DEFAULT NULL,
  `allow_persistent_catalog` tinyint(1) NOT NULL DEFAULT '1',
  `nordstrom_brand` tinyint(1) NOT NULL DEFAULT '0',
  `display_brand_name` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand` (`brand`,`size_chart`,`brand_parent_id`,`corporate_name`),
  KEY `FK_brands::brand_parents` (`brand_parent_id`),
  KEY `FK_brands::warehouses` (`warehouse_id`),
  KEY `FK_brands::size_charts` (`size_chart`),
  KEY `FK_brands::measurement_guides` (`measurement_guide`),
  KEY `FK_brands::delivery_estimates` (`delivery_low_day`,`delivery_high_day`,`delivery_estimate_rule`),
  CONSTRAINT `FK_brands::brand_parents` FOREIGN KEY (`brand_parent_id`) REFERENCES `brand_parents` (`brand_parent_id`),
  CONSTRAINT `FK_brands::delivery_estimates` FOREIGN KEY (`delivery_low_day`, `delivery_high_day`, `delivery_estimate_rule`) REFERENCES `delivery_estimates` (`delivery_low_day`, `delivery_high_day`, `delivery_estimate_rule`) ON UPDATE CASCADE,
  CONSTRAINT `FK_brands::measurement_guides` FOREIGN KEY (`measurement_guide`) REFERENCES `measurement_guides` (`measurement_guide`) ON UPDATE CASCADE,
  CONSTRAINT `FK_brands::size_charts` FOREIGN KEY (`size_chart`) REFERENCES `size_charts` (`size_chart`) ON UPDATE CASCADE,
  CONSTRAINT `FK_brands::warehouses` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15234 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

