
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
DROP TABLE IF EXISTS `members_optin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_optin_log` (
  `members_optin_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `email` varchar(100) NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `optin` varchar(20) DEFAULT NULL,
  `rack_optin` varchar(20) DEFAULT NULL,
  `inc_optin` varchar(20) DEFAULT NULL,
  `members_optin_source` varchar(30) NOT NULL,
  PRIMARY KEY (`members_optin_log_id`),
  KEY `FK_members_optin_log_id::members` (`member_id`),
  KEY `FK_members_optin_log_id::optins` (`optin`),
  KEY `FK_members_optin_log_id::rack_optins` (`rack_optin`),
  KEY `FK_members_optin_log_id::inc_optins` (`inc_optin`),
  KEY `FK_members_optin_log_id::members_optin_sources` (`members_optin_source`),
  CONSTRAINT `FK_members_optin_log::inc_optins` FOREIGN KEY (`inc_optin`) REFERENCES `optins` (`optin`),
  CONSTRAINT `FK_members_optin_log::members` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_members_optin_log::members_optin_sources` FOREIGN KEY (`members_optin_source`) REFERENCES `members_optin_sources` (`members_optin_source`),
  CONSTRAINT `FK_members_optin_log::optins` FOREIGN KEY (`optin`) REFERENCES `optins` (`optin`),
  CONSTRAINT `FK_members_optin_log::rack_optins` FOREIGN KEY (`rack_optin`) REFERENCES `optins` (`optin`)
) ENGINE=InnoDB AUTO_INCREMENT=29834211 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

