
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

LOCK TABLES `return_type_conditions` WRITE;
/*!40000 ALTER TABLE `return_type_conditions` DISABLE KEYS */;
INSERT INTO `return_type_conditions` VALUES (1,'During Sale',18,'ReturnItemsRow_DuringSale'),(2,'During Sale',2,'ReturnItemsRow_DuringSale'),(3,'Pre Ship',18,'ReturnItemsRow_PreShip'),(4,'Pre Ship',2,'ReturnItemsRow_PreShip'),(5,'Post Ship',1,'ReturnItemsRow_PostShip'),(6,'Post Ship',2,'ReturnItemsRow_PostShip'),(7,'Post Ship',3,'ReturnItemsRow_PostShip_Damaged'),(8,'Post Ship',6,'ReturnItemsRow_PostShip_Warehouse'),(9,'Post Ship',8,'ReturnItemsRow_PostShip_Lost'),(10,'Post Ship',9,'ReturnItemsRow_PostShip_Lost'),(11,'Post Ship',4,'ReturnItemsRow_PostShip_Oversold'),(12,'Post Ship',5,'ReturnItemsRow_PostShip_Short'),(13,'Post Event',7,'ReturnItemsRow_Restocking'),(15,'Post Ship',11,'ReturnItemsRow_PostShip'),(16,'Post Ship',12,'ReturnItemsRow_PostShip'),(17,'Pre Ship',11,'ReturnItemsRow_PreShip'),(18,'During Sale',11,'ReturnItemsRow_DuringSale'),(19,'Pre Ship',3,'ReturnItemsRow_PreShip'),(20,'Pre Ship',4,'ReturnItemsRow_PreShip'),(21,'Pre Ship',5,'ReturnItemsRow_PreShip'),(22,'During Sale',4,'ReturnItemsRow_DuringSale'),(23,'During Sale',5,'ReturnItemsRow_DuringSale'),(24,'Post Event',13,'ReturnItemsRow_Restocking'),(25,'Post Event',14,'ReturnItemsRow_Restocking'),(26,'Post Ship',15,'ReturnItemsRow_ReturnToGiftCard'),(27,'Post Ship',16,'ReturnItemsRow_DamageToGiftCard'),(28,'Post Ship',17,'ReturnItemsRow_WarehouseToGiftCard'),(29,'Post Event',15,'ReturnItemsRow_ReturnToGiftCard'),(30,'Post Event',16,'ReturnItemsRow_DamageToGiftCard'),(31,'Post Event',17,'ReturnItemsRow_WarehouseToGiftCard'),(32,'Pre Ship',19,'ReturnItemsRow_PreShip'),(33,'During Sale',22,'ReturnItemsRow_DuringSale'),(34,'Pre Ship',22,'ReturnItemsRow_PreShip'),(35,'Post Ship',22,'ReturnItemsRow_PostShip'),(36,'Post Event',22,'ReturnItemsRow_Restocking');
/*!40000 ALTER TABLE `return_type_conditions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

