
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `invitation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inv_camp_id` int(10) unsigned NOT NULL,
  `invitation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invitation_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `join_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `member_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned DEFAULT NULL,
  `friend_email` varchar(100) NOT NULL,
  `member_incentive` decimal(10,2) NOT NULL DEFAULT '0.00',
  `friend_incentive` decimal(10,2) NOT NULL DEFAULT '0.00',
  `purchase_required` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0= No purchase required to earn credit, 1=purchase required to earn credit',
  `purchase_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `purchase_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0=inactive, 1=active',
  `self_referral` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=Not a self referral, 1=Is a self referral',
  PRIMARY KEY (`invitation_id`),
  UNIQUE KEY `member_id` (`member_id`,`friend_email`),
  KEY `friend_id` (`friend_id`,`join_date`),
  KEY `friend_email` (`friend_email`),
  CONSTRAINT `FK_invitations::members` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_invitations::members2` FOREIGN KEY (`friend_id`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7835838 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 9216 kB';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

