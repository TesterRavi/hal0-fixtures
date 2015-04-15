
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
DROP TABLE IF EXISTS `promos_event_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promos_event_tabs` (
  `promo_section` varchar(25) NOT NULL DEFAULT '',
  `promo_resource` varchar(100) NOT NULL DEFAULT '',
  `promo_group` varchar(25) NOT NULL DEFAULT '',
  `promo_placement` varchar(25) NOT NULL DEFAULT '',
  `url` varchar(300) NOT NULL DEFAULT '',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `promo_gender` char(1) NOT NULL DEFAULT 'X',
  `event_tab` varchar(50) NOT NULL,
  `promo_type` varchar(20) NOT NULL DEFAULT 'standard',
  PRIMARY KEY (`start_date`,`end_date`,`promo_section`,`promo_resource`,`promo_group`,`promo_placement`,`url`,`promo_type`,`promo_gender`,`event_tab`),
  KEY `promos_event_tabs::event_tabs` (`event_tab`),
  CONSTRAINT `promos_event_tabs::event_tabs` FOREIGN KEY (`event_tab`) REFERENCES `event_tabs` (`event_tab`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `promos_event_tabs::promos` FOREIGN KEY (`start_date`, `end_date`, `promo_section`, `promo_resource`, `promo_group`, `promo_placement`, `url`, `promo_type`, `promo_gender`) REFERENCES `promos` (`start_date`, `end_date`, `promo_section`, `promo_resource`, `promo_group`, `promo_placement`, `url`, `promo_type`, `promo_gender`) ON DELETE CASCADE ON UPDATE CASCADE
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

