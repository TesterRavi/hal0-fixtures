
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
DROP TABLE IF EXISTS `dynamics_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamics_values` (
  `subdomain` varchar(20) NOT NULL DEFAULT '*',
  `controller` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL,
  `module` varchar(45) NOT NULL DEFAULT '',
  `class_name` varchar(45) NOT NULL,
  `key` varchar(45) NOT NULL,
  `value` text NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `dynamics_values_group` varchar(25) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`class_name`,`controller`,`action`,`module`,`key`,`end_date`,`start_date`,`subdomain`,`dynamics_values_group`,`url`),
  KEY `FK_dynamics_values_1` (`controller`,`action`,`module`,`class_name`),
  KEY `FK_dynamics_values::subdomains` (`subdomain`),
  KEY `FK_dynamics_values::dynamics_values_groups` (`dynamics_values_group`),
  CONSTRAINT `FK_dynamics_values::dynamics_values_groups` FOREIGN KEY (`dynamics_values_group`) REFERENCES `dynamics_values_groups` (`dynamics_values_group`) ON UPDATE CASCADE,
  CONSTRAINT `FK_dynamics_values::subdomains` FOREIGN KEY (`subdomain`) REFERENCES `subdomains` (`subdomain`) ON UPDATE CASCADE,
  CONSTRAINT `FK_dynamics_values_1` FOREIGN KEY (`controller`, `action`, `module`, `class_name`) REFERENCES `dynamics` (`controller`, `action`, `module`, `class_name`) ON UPDATE CASCADE
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

