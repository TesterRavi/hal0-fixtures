
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
DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing` (
  `billing_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `address2` varchar(45) NOT NULL DEFAULT '',
  `city` varchar(45) NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT '',
  `zipcode` varchar(25) NOT NULL DEFAULT '',
  `country_iso` varchar(2) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `label` varchar(45) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `processor` varchar(20) DEFAULT NULL,
  `card_number_mcrypt` text NOT NULL,
  `card_number` varchar(5) NOT NULL DEFAULT '',
  `card_type` enum('na','visa','master','amex','discover') NOT NULL DEFAULT 'na',
  `email` varchar(100) NOT NULL DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_exp_year` smallint(5) unsigned NOT NULL DEFAULT '0',
  `card_exp_month` enum('0','01','02','03','04','05','06','07','08','09','10','11','12') NOT NULL DEFAULT '0',
  `keep` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `paypal_ba_id` varchar(20) NOT NULL DEFAULT '',
  `bill_me_later_ref_id` varchar(20) NOT NULL DEFAULT '',
  `payment_method` varchar(10) DEFAULT NULL,
  `verified` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`billing_id`),
  UNIQUE KEY `state` (`state`,`member_id`,`first_name`,`last_name`,`address`,`address2`,`city`,`zipcode`,`phone`,`card_number`,`card_type`,`email`,`card_exp_year`,`card_exp_month`,`paypal_ba_id`,`bill_me_later_ref_id`),
  KEY `FK_billing::payment_methods` (`payment_method`),
  KEY `FK_billing::countries` (`country_iso`),
  KEY `FK_billing::members` (`member_id`),
  CONSTRAINT `FK_billing::countries` FOREIGN KEY (`country_iso`) REFERENCES `countries` (`country_iso`) ON UPDATE CASCADE,
  CONSTRAINT `FK_billing::members` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `FK_billing::payment_methods` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`payment_method`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1599682 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; (`state`) REFER `hautelook_dev/states';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

