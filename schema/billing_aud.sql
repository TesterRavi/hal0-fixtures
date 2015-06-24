
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `billing_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_aud` (
  `billing_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) unsigned DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `zipcode` varchar(25) DEFAULT NULL,
  `country_iso` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `label` varchar(45) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `processor` varchar(20) DEFAULT NULL,
  `card_number_mcrypt` text,
  `card_number` varchar(5) DEFAULT NULL,
  `card_type` varchar(15) DEFAULT NULL,
  `card_token` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_exp_year` smallint(5) unsigned DEFAULT NULL,
  `card_exp_month` enum('0','01','02','03','04','05','06','07','08','09','10','11','12') DEFAULT NULL,
  `keep` tinyint(1) unsigned DEFAULT NULL,
  `paypal_ba_id` varchar(20) DEFAULT NULL,
  `bill_me_later_ref_id` varchar(20) DEFAULT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `verified` enum('Y','N') DEFAULT NULL,
  `action` enum('INS','UPD','DEL') DEFAULT NULL,
  `action_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `idx_billing_audit_action_date` (`action_date`,`billing_id`)
) ENGINE=BLACKHOLE DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

