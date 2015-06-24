
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

LOCK TABLES `event_types` WRITE;
/*!40000 ALTER TABLE `event_types` DISABLE KEYS */;
INSERT  IGNORE INTO `event_types` VALUES ('drop_ship','Vendor ships directly to the customer. We do not handle the inventory in our warehouse.'),('giftcard',''),('owned_inv','Blowout events using owned inventory from our warehouse.'),('parent','Parent Event Type'),('post_event','Purchase order is generated after the event based on what was sold during the event. Vendors ship merchandise to our warehouse where we then send it to the customer.'),('post_h','Post-event purchase inventory mixed with owned inventory from the warehouse.'),('pre_event','Merchandise is purchased before the event occurs and stored in the warehouse until items are sold during the event. We own all items, and keep what we do not sell through.'),('pre_h','Pre-event purchase inventory mixed with owned inventory from the warehouse.'),('pre_post_h','Both Post-event & Pre-event purchase inventory mixed with owned inventory from the warehouse.'),('service','Items sold during event are intanglible or transferred electronically.'),('stp','Temp Straight To Persistent Event'),('wine','Alcoholic Beverage Sales');
/*!40000 ALTER TABLE `event_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

