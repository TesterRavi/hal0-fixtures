
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

LOCK TABLES `return_reason_types` WRITE;
/*!40000 ALTER TABLE `return_reason_types` DISABLE KEYS */;
INSERT  IGNORE INTO `return_reason_types` VALUES ('Cancel',NULL,1),('Damage',NULL,1),('Damage to Gift Card',NULL,0),('Damaged',NULL,0),('Did not expect',NULL,0),('Did not fit',NULL,0),('Did not like',NULL,0),('Disputed',NULL,1),('Fraud',NULL,1),('In warehouse, return n/a',NULL,0),('Lost in Warehouse',NULL,1),('No reason',NULL,0),('Other',NULL,1),('Oversold',NULL,1),('Restocking',NULL,0),('Restocking, Remove Fee',NULL,1),('Restocking, Remove Fee to CC',NULL,0),('Restocking, Remove Fee to HL',NULL,0),('Return Lost in Shipment',NULL,1),('Return Lost in Warehouse to CC',NULL,0),('Return Lost in Warehouse to HL',NULL,0),('Return to CreditCard/PayPal/BML',NULL,0),('Return to Gift Card',NULL,0),('Return to HL Credit',NULL,0),('Short',NULL,1),('Warehouse',NULL,1),('Warehouse to Gift Card',NULL,0);
/*!40000 ALTER TABLE `return_reason_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

