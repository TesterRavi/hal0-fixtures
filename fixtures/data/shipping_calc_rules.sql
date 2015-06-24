
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

LOCK TABLES `shipping_calc_rules` WRITE;
/*!40000 ALTER TABLE `shipping_calc_rules` DISABLE KEYS */;
INSERT  IGNORE INTO `shipping_calc_rules` VALUES ('flat_event: 5.95',200,'Flat per Event: $5.95',1),('flat_event: 6.95',202,'Flat per Event: $6.95',1),('flat_event: 7.95',203,'Flat per Event: $7.95',1),('flat_event: 8.95',204,'Flat per Event: $8.95',1),('flat_event: 9.95',205,'Flat per Event: $9.95',1),('flat_event: 95.95',201,'Flat per Event: $95.95',1),('flat_item: 2.95',99,'Flat per Item: $2.95',1),('flat_item: 5.95',300,'Flat per Item: $5.95',1),('flat_item: 95.95',301,'Flat per Item: $95.95',1),('free',100,'Free Shipping',1),('unknown',0,'Unknown',0),('weight',1,'Ship By Item Weight',1);
/*!40000 ALTER TABLE `shipping_calc_rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

