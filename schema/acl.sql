
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
DROP TABLE IF EXISTS `acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl` (
  `acl_role` varchar(100) NOT NULL,
  `acl_resource` varchar(255) NOT NULL,
  `acl_privilege` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`acl_role`,`acl_resource`,`acl_privilege`),
  KEY `FK_acl::members1` (`created_by`),
  KEY `FK_acl::members2` (`modified_by`),
  KEY `FK_acl::acl_resources` (`acl_resource`),
  KEY `FK_acl::acl_privileges` (`acl_privilege`),
  CONSTRAINT `FK_acl::acl_privileges` FOREIGN KEY (`acl_privilege`) REFERENCES `acl_privileges` (`acl_privilege`) ON UPDATE CASCADE,
  CONSTRAINT `FK_acl::acl_resources` FOREIGN KEY (`acl_resource`) REFERENCES `acl_resources` (`acl_resource`) ON UPDATE CASCADE,
  CONSTRAINT `FK_acl::acl_roles` FOREIGN KEY (`acl_role`) REFERENCES `acl_roles` (`acl_role`) ON UPDATE CASCADE,
  CONSTRAINT `FK_acl::members1` FOREIGN KEY (`created_by`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_acl::members2` FOREIGN KEY (`modified_by`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE
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

