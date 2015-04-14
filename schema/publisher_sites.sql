
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `publisher_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_sites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publisher_id` int(10) unsigned NOT NULL,
  `site_name` varchar(45) NOT NULL,
  `status` smallint(5) unsigned NOT NULL DEFAULT '0',
  `slug` varchar(20) NOT NULL,
  `url` varchar(45) NOT NULL,
  `interest` varchar(30) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `banner_hex` varchar(6) DEFAULT NULL,
  `template_id` smallint(5) unsigned NOT NULL,
  `unique_start` int(10) unsigned NOT NULL,
  `unique_finish` int(10) unsigned NOT NULL,
  `visitors_start` int(10) unsigned NOT NULL,
  `visitors_finish` int(10) unsigned NOT NULL,
  `traffic_source` varchar(45) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `FK_PublisherSites::Publishers` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1 COMMENT='Status: 0 = Pending, 10 = Active, 15 = On Hold, 20 = Decline';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

