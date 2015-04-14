
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `coupon_code` varchar(25) NOT NULL,
  `coupon_type` enum('dollar_off','flat_shipping','free_shipping','percent_off') NOT NULL DEFAULT 'dollar_off',
  `amount` decimal(10,2) NOT NULL,
  `min_purchase` decimal(10,2) NOT NULL,
  `max_discount` decimal(10,2) NOT NULL,
  `min_join_date` date DEFAULT NULL,
  `max_join_date` date DEFAULT NULL,
  `reusable` tinyint(1) NOT NULL DEFAULT '0',
  `single_member_use` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `employee_use` tinyint(1) NOT NULL DEFAULT '0',
  `all_use` int(10) unsigned NOT NULL DEFAULT '1',
  `first_purchase_only` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `coupon_campaign_id` int(10) unsigned DEFAULT NULL,
  `member_specific` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email_specific` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `event_specific` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `category_specific` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expiration_date` datetime DEFAULT NULL,
  `extend_on_return` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `coupon_rule` varchar(25) DEFAULT NULL,
  `employee_id` int(10) unsigned DEFAULT NULL,
  `owner` varchar(100) NOT NULL DEFAULT '',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`coupon_code`),
  KEY `FK_coupons::coupon_campaigns` (`coupon_campaign_id`),
  KEY `FK_coupons::coupon_rules` (`coupon_rule`),
  CONSTRAINT `FK_coupons::coupon_campaigns` FOREIGN KEY (`coupon_campaign_id`) REFERENCES `coupon_campaigns` (`coupon_campaign_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_coupons::coupon_rules` FOREIGN KEY (`coupon_rule`) REFERENCES `coupon_rules` (`coupon_rule`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

