
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
DROP TABLE IF EXISTS `styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `styles` (
  `style_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style_num` varchar(45) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `qualifier` varchar(30) NOT NULL DEFAULT '',
  `description` text,
  `fiber_content` text,
  `returnable` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `call_required_return` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `choke_hazard` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '100',
  `subtitle` varchar(255) DEFAULT NULL,
  `additional_information` text,
  `care` text,
  `material` text NOT NULL,
  `additional_details` text,
  `more_information` text,
  `weight` decimal(5,2) NOT NULL DEFAULT '1.00',
  `hl_sale_type` enum('default','select') NOT NULL DEFAULT 'default',
  `quad_id` int(11) DEFAULT NULL,
  `max_items_per_person` smallint(6) unsigned DEFAULT NULL,
  `country_iso` varchar(2) DEFAULT 'US',
  `size_chart` varchar(40) DEFAULT NULL,
  `measurement_guide` varchar(40) DEFAULT NULL,
  `hazmat_instruction` varchar(10) DEFAULT NULL,
  `hazmat_ship_method` varchar(10) DEFAULT NULL,
  `hazmat_type` varchar(10) DEFAULT NULL,
  `season` varchar(15) DEFAULT NULL,
  `shipping_calc_rule` varchar(50) NOT NULL DEFAULT 'weight',
  `style_group_id` varchar(50) DEFAULT NULL,
  `allow_persistent_catalog` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `last_seen_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`style_id`),
  UNIQUE KEY `style_num` (`style_num`,`brand_id`),
  KEY `FK_Styles::HazmatInstructions` (`hazmat_instruction`),
  KEY `FK_Styles::HazmatShipMethod` (`hazmat_ship_method`),
  KEY `FK_Styles::HazmatTypes` (`hazmat_type`),
  KEY `FK_styles::countries` (`country_iso`),
  KEY `FK_styles::quads` (`quad_id`),
  KEY `FK_styles::size_charts` (`size_chart`),
  KEY `FK_styles::measurement_guides` (`measurement_guide`),
  KEY `FK_styles::brands` (`brand_id`),
  KEY `FK_styles::seasons` (`season`),
  KEY `FK_styles::shipping_calc_rules` (`shipping_calc_rule`),
  KEY `FK_styles::style_groups` (`style_group_id`),
  CONSTRAINT `FK_styles::brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_styles::countries` FOREIGN KEY (`country_iso`) REFERENCES `countries` (`country_iso`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Styles::HazmatInstructions` FOREIGN KEY (`hazmat_instruction`) REFERENCES `hazmat_instructions` (`hazmat_instruction`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Styles::HazmatShipMethod` FOREIGN KEY (`hazmat_ship_method`) REFERENCES `hazmat_ship_methods` (`hazmat_ship_method`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Styles::HazmatTypes` FOREIGN KEY (`hazmat_type`) REFERENCES `hazmat_types` (`hazmat_type`) ON UPDATE CASCADE,
  CONSTRAINT `FK_styles::measurement_guides` FOREIGN KEY (`measurement_guide`) REFERENCES `measurement_guides` (`measurement_guide`) ON UPDATE CASCADE,
  CONSTRAINT `FK_styles::quads` FOREIGN KEY (`quad_id`) REFERENCES `quads` (`quad_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_styles::seasons` FOREIGN KEY (`season`) REFERENCES `seasons` (`season`) ON UPDATE CASCADE,
  CONSTRAINT `FK_styles::shipping_calc_rules` FOREIGN KEY (`shipping_calc_rule`) REFERENCES `shipping_calc_rules` (`shipping_calc_rule`) ON UPDATE CASCADE,
  CONSTRAINT `FK_styles::size_charts` FOREIGN KEY (`size_chart`) REFERENCES `size_charts` (`size_chart`) ON UPDATE CASCADE,
  CONSTRAINT `FK_styles::style_groups` FOREIGN KEY (`style_group_id`) REFERENCES `style_groups` (`style_group_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1325533 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 199680 kB';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

