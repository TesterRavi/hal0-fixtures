
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
DROP TABLE IF EXISTS `promos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promos` (
  `promo_section` varchar(25) NOT NULL DEFAULT '',
  `promo_resource` varchar(100) NOT NULL DEFAULT '',
  `promo_group` varchar(25) NOT NULL DEFAULT '',
  `promo_placement` varchar(25) NOT NULL DEFAULT '',
  `url` varchar(300) NOT NULL DEFAULT '',
  `promo_url_action` varchar(25) DEFAULT NULL,
  `promo_type` varchar(20) NOT NULL DEFAULT 'standard',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `promo_gender` char(1) NOT NULL DEFAULT 'X',
  `promo_placement_sort` tinyint(3) unsigned DEFAULT NULL,
  `notes` text,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`start_date`,`end_date`,`promo_section`,`promo_resource`,`promo_group`,`promo_placement`,`url`,`promo_type`,`promo_gender`,`active`),
  KEY `FK_promos::promo_sections` (`promo_section`),
  KEY `FK_promos::promo_resources` (`promo_resource`),
  KEY `FK_promos::promo_groups` (`promo_group`),
  KEY `FK_promos::promo_url_actions` (`promo_url_action`),
  KEY `FK_promos::promo_types` (`promo_type`),
  KEY `FK_promos::promo_placements_promo_placement_sorts` (`promo_placement`,`promo_placement_sort`),
  CONSTRAINT `FK_promos::promo_groups` FOREIGN KEY (`promo_group`) REFERENCES `promo_groups` (`promo_group`) ON UPDATE CASCADE,
  CONSTRAINT `FK_promos::promo_placements` FOREIGN KEY (`promo_placement`) REFERENCES `promo_placements` (`promo_placement`) ON UPDATE CASCADE,
  CONSTRAINT `FK_promos::promo_placements_promo_placement_sorts` FOREIGN KEY (`promo_placement`, `promo_placement_sort`) REFERENCES `promo_placements_promo_placement_sorts` (`promo_placement`, `promo_placement_sort`) ON UPDATE CASCADE,
  CONSTRAINT `FK_promos::promo_resources` FOREIGN KEY (`promo_resource`) REFERENCES `promo_resources` (`promo_resource`) ON UPDATE CASCADE,
  CONSTRAINT `FK_promos::promo_sections` FOREIGN KEY (`promo_section`) REFERENCES `promo_sections` (`promo_section`) ON UPDATE CASCADE,
  CONSTRAINT `FK_promos::promo_types` FOREIGN KEY (`promo_type`) REFERENCES `promo_types` (`promo_type`) ON UPDATE CASCADE,
  CONSTRAINT `FK_promos::promo_url_actions` FOREIGN KEY (`promo_url_action`) REFERENCES `promo_url_actions` (`promo_url_action`) ON UPDATE CASCADE
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

