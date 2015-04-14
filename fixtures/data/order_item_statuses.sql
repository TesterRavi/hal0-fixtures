-- MySQL dump 10.13  Distrib 5.5.34, for Linux (x86_64)
--
-- Host: localhost    Database: hautelook
-- ------------------------------------------------------
-- Server version	5.5.34

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

--
-- Table structure for table `order_item_statuses`
--

DROP TABLE IF EXISTS `order_item_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item_statuses` (
  `order_item_status` varchar(25) NOT NULL,
  `definition` text NOT NULL,
  PRIMARY KEY (`order_item_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_statuses`
--

LOCK TABLES `order_item_statuses` WRITE;
/*!40000 ALTER TABLE `order_item_statuses` DISABLE KEYS */;
INSERT INTO `order_item_statuses` VALUES ('cancelled','All ordered items where completely returned \'pre-ship\' or \'during_sale\''),('delivered','Item has a record in shipment_tracking with delivery_date set and return_to_shipper_date unset'),('delivery_attempt','Item has a record in shipment_tracking with delivery_attempt_date set and delivery_date, return_to_shipper_date unset'),('error','unknown'),('in_transit','Item associated with a purchase_order that is \'in_transit\' but not \'received\''),('open','Item not associated with a valid purchase_order that has been generated after the end_date of the event'),('partially_received','Item has no record in shipment_items but is associated with an event that does have shipment_items records'),('picked','Item has a record in shipment_items and no record in shipment_tracking or no shipment_tracking.ship_date set'),('po_sent','Item associated with a purchase_order that has been \'posted\' but not \'received\' or \'in_transit\''),('received','Item associated with a purchase_order that is \'received\' and with no record in shipment_items'),('received_short','UNSUPPORTED in get_order_items_status()'),('returned','All ordered items where completely returned \'post_ship\' or \'post_event\''),('returned_to_shipper','Item has a record in shipment_tracking with delivery_date and return_to_shipper_date set'),('return_in_transit','UNSUPPORTED in get_order_items_status()'),('return_received','UNSUPPORTED in get_order_items_status()'),('return_request','UNSUPPORTED in get_order_items_status()'),('shipped','Item has a record in shipment_tracking with ship_date set and delivery_date, return_to_shipper_date and delivery_attempt_date unset'),('short','UNSUPPORTED in get_order_items_status()'),('short_in_transit','UNSUPPORTED in get_order_items_status()'),('short_pending','UNSUPPORTED in get_order_items_status()');
/*!40000 ALTER TABLE `order_item_statuses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:48
