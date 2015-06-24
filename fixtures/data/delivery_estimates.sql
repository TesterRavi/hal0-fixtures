
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

LOCK TABLES `delivery_estimates` WRITE;
/*!40000 ALTER TABLE `delivery_estimates` DISABLE KEYS */;
INSERT  IGNORE INTO `delivery_estimates` VALUES (1,1,'Calendar','Expedited Delivery Dates','',13,1),(1,2,'Business','Expedited Delivery Dates','',1,1),(2,3,'Business','Expedited Delivery Dates','',2,1),(2,5,'Business','Estimated Delivery Dates','',3,1),(3,7,'Business','Estimated Delivery Dates','',4,1),(4,6,'Business','Estimated Delivery Dates','',5,1),(5,7,'Business','Estimated Delivery Dates','',6,1),(6,9,'Business','Estimated Delivery Dates','',7,1),(7,10,'Business','Estimated Delivery Dates','',8,1),(8,11,'Business','Estimated Delivery Dates','',9,1),(10,12,'Business','Estimated Delivery Dates','',10,1),(10,14,'Business','Estimated Delivery Dates','',11,1),(14,21,'Business','Extended Delivery Dates','',12,1),(35,42,'Calendar','Extended Delivery Dates','',14,1),(42,56,'Calendar','Extended Delivery Dates','',15,1),(56,63,'Calendar','Extended Delivery Dates','',16,1);
/*!40000 ALTER TABLE `delivery_estimates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

