
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `brand_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_parents` (
  `brand_parent_id` int(10) unsigned NOT NULL COMMENT 'rightnow CRM organization id',
  `brand_parent` varchar(45) NOT NULL,
  `profile_code` varchar(5) DEFAULT NULL,
  `brand_parent_status` enum('Active','Inactive','Out of Business') NOT NULL DEFAULT 'Active',
  `last_checked` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`brand_parent_id`),
  UNIQUE KEY `brand_parent` (`brand_parent`),
  KEY `FK_brand_parents::brand_profile` (`profile_code`),
  CONSTRAINT `FK_brand_parents::brand_profile` FOREIGN KEY (`profile_code`) REFERENCES `brand_profile` (`profile_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

