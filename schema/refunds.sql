
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
DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refunds` (
  `refund_date` datetime NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `return_id` int(10) unsigned NOT NULL,
  `transaction_id` varchar(32) DEFAULT NULL,
  `processor` varchar(20) DEFAULT NULL,
  `refund_status` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `taxes` decimal(10,2) DEFAULT '0.00',
  `freight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `freight_taxes` decimal(10,2) NOT NULL DEFAULT '0.00',
  `surcharge` decimal(10,2) unsigned DEFAULT '0.00',
  `restocking_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `label_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `charged` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rcredit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ccredit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `scredit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `acredit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon` decimal(10,2) DEFAULT '0.00',
  `fcoupon` decimal(10,2) NOT NULL DEFAULT '0.00',
  `gift_card` decimal(10,2) DEFAULT '0.00',
  `employee_id` int(10) unsigned DEFAULT NULL,
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `check_request_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `check_sent_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `refund_reason` varchar(40) NOT NULL DEFAULT 'No reason',
  `complete_employee_id` int(10) unsigned DEFAULT NULL,
  `complete_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`refund_date`,`order_id`,`return_id`),
  KEY `FK_refunds::orders` (`order_id`),
  KEY `FK_refunds::return_id` (`return_id`),
  KEY `FK_refunds::members` (`employee_id`),
  KEY `FK_refunds::processors` (`processor`),
  KEY `FK_refunds::refund_statuses` (`refund_status`),
  KEY `FK_refunds::refund_reasons` (`refund_reason`),
  KEY `FK_refunds_1::members` (`complete_employee_id`),
  CONSTRAINT `FK_refunds::members` FOREIGN KEY (`employee_id`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_refunds::orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_refunds::processors` FOREIGN KEY (`processor`) REFERENCES `processors` (`processor`) ON UPDATE CASCADE,
  CONSTRAINT `FK_refunds::refund_reasons` FOREIGN KEY (`refund_reason`) REFERENCES `refund_reasons` (`refund_reason`) ON UPDATE CASCADE,
  CONSTRAINT `FK_refunds::refund_statuses` FOREIGN KEY (`refund_status`) REFERENCES `refund_statuses` (`refund_status`) ON UPDATE CASCADE,
  CONSTRAINT `FK_refunds::return_id` FOREIGN KEY (`return_id`) REFERENCES `returns` (`return_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_refunds_1::members` FOREIGN KEY (`complete_employee_id`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE
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

