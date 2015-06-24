
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
DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invitation_code` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL DEFAULT '',
  `key` varchar(40) NOT NULL DEFAULT '',
  `DEPRECATED_status` int(10) unsigned NOT NULL,
  `role` int(10) unsigned NOT NULL,
  `join_date` datetime NOT NULL,
  `join_site` varchar(20) DEFAULT NULL,
  `first_name` varchar(40) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `zipcode` varchar(35) NOT NULL DEFAULT '',
  `country_iso` varchar(2) DEFAULT NULL,
  `gender` enum('M','F') NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `last_visit` datetime NOT NULL,
  `soft_login` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fraud_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fetchback` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '100' COMMENT 'google analytics source id',
  `mid` varchar(255) DEFAULT NULL,
  `cid` varchar(200) DEFAULT NULL,
  `aid` varchar(200) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `inv_camp_id` int(10) unsigned NOT NULL DEFAULT '15',
  `pub_site_id` int(10) unsigned DEFAULT NULL,
  `tid` varchar(255) DEFAULT NULL,
  `member_status` varchar(20) NOT NULL DEFAULT 'active',
  `optin_women` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `optin_men` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `optin_kids` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `optin_home` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `optin_third_party` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `optin_modified` datetime NOT NULL,
  `optin` varchar(20) NOT NULL DEFAULT 'none',
  `rack_optin` varchar(20) NOT NULL DEFAULT 'none',
  `inc_optin` varchar(20) DEFAULT NULL,
  `esp` enum('cheetahMail','strongMail') NOT NULL DEFAULT 'strongMail',
  `notes` text NOT NULL,
  `omid` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `invitation_code` (`invitation_code`),
  UNIQUE KEY `username` (`username`),
  KEY `role` (`role`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `FK_Members::PublisherSites` (`pub_site_id`),
  KEY `FK_members::countries` (`country_iso`),
  KEY `FK_members::campaigns` (`sid`),
  KEY `FK_members::invitation_campaigns` (`inv_camp_id`),
  KEY `api_key` (`key`),
  KEY `FK_members::member_statuses` (`member_status`),
  KEY `FK_members::optins` (`optin`),
  KEY `FK_members::rack_optins` (`rack_optin`),
  KEY `FK_members::join_sites` (`join_site`),
  KEY `FK_members::inc_optins` (`inc_optin`),
  CONSTRAINT `FK_members::campaigns` FOREIGN KEY (`sid`) REFERENCES `campaigns` (`sid`),
  CONSTRAINT `FK_members::countries` FOREIGN KEY (`country_iso`) REFERENCES `countries` (`country_iso`) ON UPDATE CASCADE,
  CONSTRAINT `FK_members::inc_optins` FOREIGN KEY (`inc_optin`) REFERENCES `optins` (`optin`),
  CONSTRAINT `FK_members::invitation_campaigns` FOREIGN KEY (`inv_camp_id`) REFERENCES `invitation_campaigns` (`inv_camp_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_members::join_sites` FOREIGN KEY (`join_site`) REFERENCES `join_sites` (`join_site`),
  CONSTRAINT `FK_members::member_statuses` FOREIGN KEY (`member_status`) REFERENCES `member_statuses` (`member_status`),
  CONSTRAINT `FK_members::optins` FOREIGN KEY (`optin`) REFERENCES `optins` (`optin`),
  CONSTRAINT `FK_Members::PublisherSites` FOREIGN KEY (`pub_site_id`) REFERENCES `publisher_sites` (`site_id`),
  CONSTRAINT `FK_members::rack_optins` FOREIGN KEY (`rack_optin`) REFERENCES `optins` (`optin`)
) ENGINE=InnoDB AUTO_INCREMENT=26976036 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 8192 kB';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

