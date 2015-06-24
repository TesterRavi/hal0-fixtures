
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
DROP TABLE IF EXISTS `members_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_aud` (
  `member_id` int(10) unsigned NOT NULL,
  `invitation_code` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `key` varchar(40) NOT NULL,
  `DEPRECATED_status` int(10) unsigned NOT NULL,
  `role` int(10) unsigned NOT NULL,
  `join_date` datetime NOT NULL,
  `join_site` varchar(20) DEFAULT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `zipcode` varchar(35) NOT NULL,
  `country_iso` varchar(2) DEFAULT NULL,
  `gender` enum('M','F') NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `last_visit` datetime NOT NULL,
  `soft_login` tinyint(3) unsigned NOT NULL,
  `fraud_flag` tinyint(1) unsigned NOT NULL,
  `fetchback` tinyint(1) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `mid` varchar(255) DEFAULT NULL,
  `cid` varchar(200) DEFAULT NULL,
  `aid` varchar(200) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `inv_camp_id` int(10) unsigned NOT NULL,
  `pub_site_id` int(10) unsigned DEFAULT NULL,
  `tid` varchar(255) DEFAULT NULL,
  `member_status` varchar(20) NOT NULL,
  `optin_women` tinyint(3) unsigned NOT NULL,
  `optin_men` tinyint(3) unsigned NOT NULL,
  `optin_kids` tinyint(3) unsigned NOT NULL,
  `optin_home` tinyint(3) unsigned NOT NULL,
  `optin_third_party` tinyint(3) unsigned NOT NULL,
  `optin_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `optin` varchar(20) NOT NULL,
  `rack_optin` varchar(20) NOT NULL,
  `inc_optin` varchar(20) DEFAULT NULL,
  `esp` enum('cheetahMail','strongMail') NOT NULL,
  `notes` text NOT NULL,
  `omid` int(11) DEFAULT NULL,
  `action` enum('INS','UPD','DEL') NOT NULL DEFAULT 'INS',
  `action_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action_timeint` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`,`action`,`action_date`,`action_timeint`)
) ENGINE=BLACKHOLE DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

