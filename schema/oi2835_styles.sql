
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
DROP TABLE IF EXISTS `oi2835_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oi2835_styles` (
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
  KEY `FK_styles::style_groups` (`style_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1043033 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 199680 kB';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

