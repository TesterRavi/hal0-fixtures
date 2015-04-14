
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `publisher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `publisher_class` varchar(3) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `slug` varchar(20) NOT NULL,
  `address` varchar(45) NOT NULL,
  `address2` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(3) DEFAULT NULL,
  `zip` varchar(10) NOT NULL,
  `country_iso` varchar(2) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `pay_first_name` varchar(45) NOT NULL,
  `pay_last_name` varchar(45) NOT NULL,
  `pay_address` varchar(45) NOT NULL,
  `pay_address2` varchar(45) NOT NULL,
  `pay_city` varchar(45) NOT NULL,
  `pay_state` varchar(3) DEFAULT NULL,
  `pay_zip` varchar(10) NOT NULL,
  `pay_country_iso` varchar(2) DEFAULT NULL,
  `pay_phone` varchar(15) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`publisher_id`),
  KEY `member_id` (`member_id`),
  KEY `publisher_class` (`publisher_class`),
  KEY `FK_publishers::states` (`state`,`country_iso`),
  KEY `FK_publishers::states2` (`pay_state`,`pay_country_iso`),
  CONSTRAINT `FK_Publishers::Members` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `FK_Publishers::PublisherClasses` FOREIGN KEY (`publisher_class`) REFERENCES `publisher_classes` (`publisher_class`) ON UPDATE CASCADE,
  CONSTRAINT `FK_publishers::states` FOREIGN KEY (`state`, `country_iso`) REFERENCES `states` (`state`, `country_iso`),
  CONSTRAINT `FK_publishers::states2` FOREIGN KEY (`pay_state`, `pay_country_iso`) REFERENCES `states` (`state`, `country_iso`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COMMENT='Status: 0 = Pending, 10 = Active, 15 = On Hold, 20 = Decline';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

