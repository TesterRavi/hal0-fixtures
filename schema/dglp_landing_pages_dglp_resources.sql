
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `dglp_landing_pages_dglp_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dglp_landing_pages_dglp_resources` (
  `landing_page` varchar(100) NOT NULL,
  `resource_type` varchar(15) NOT NULL,
  `resource` varchar(100) NOT NULL,
  `resource_style` varchar(100) NOT NULL,
  `section` varchar(25) NOT NULL,
  PRIMARY KEY (`landing_page`,`resource_type`,`resource`,`resource_style`,`section`),
  KEY `FK_dglp_templates_dglp_resources::dglp_resources` (`resource_type`,`resource`),
  KEY `FK_dglp_templates_dglp_resources::dglp_sections` (`section`),
  CONSTRAINT `FK_dglp_templates_dglp_resources::dglp_landing_pages` FOREIGN KEY (`landing_page`) REFERENCES `dglp_landing_pages` (`landing_page`) ON UPDATE CASCADE,
  CONSTRAINT `FK_dglp_templates_dglp_resources::dglp_resources` FOREIGN KEY (`resource_type`, `resource`) REFERENCES `dglp_resources` (`resource_type`, `resource`) ON UPDATE CASCADE,
  CONSTRAINT `FK_dglp_templates_dglp_resources::dglp_sections` FOREIGN KEY (`section`) REFERENCES `dglp_sections` (`section`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

