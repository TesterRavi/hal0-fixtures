
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `giftcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giftcards` (
  `giftcard_number` varchar(255) NOT NULL,
  `giftcard_template` varchar(25) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `return_item_id` int(10) unsigned DEFAULT NULL,
  `return_id` int(10) unsigned DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `recipient_name` varchar(100) NOT NULL DEFAULT '',
  `sender_name` varchar(100) NOT NULL DEFAULT '',
  `recipient_email` varchar(100) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `schedule_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_type` varchar(25) NOT NULL DEFAULT 'hautelook',
  PRIMARY KEY (`giftcard_number`),
  UNIQUE KEY `number` (`giftcard_number`),
  KEY `FK_giftcards::order_items` (`order_item_id`),
  KEY `FK_giftcards::giftcard_templates` (`giftcard_template`),
  KEY `FK_giftcards::return_items` (`return_item_id`),
  KEY `FK_giftcards::returns` (`return_id`),
  CONSTRAINT `FK_giftcards::giftcard_templates` FOREIGN KEY (`giftcard_template`) REFERENCES `giftcard_templates` (`giftcard_template`) ON UPDATE CASCADE,
  CONSTRAINT `FK_giftcards::order_items` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`item_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_giftcards::returns` FOREIGN KEY (`return_id`) REFERENCES `returns` (`return_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_giftcards::return_items` FOREIGN KEY (`return_item_id`) REFERENCES `return_items` (`item_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

