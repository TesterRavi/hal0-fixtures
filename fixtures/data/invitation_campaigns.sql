
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

LOCK TABLES `invitation_campaigns` WRITE;
/*!40000 ALTER TABLE `invitation_campaigns` DISABLE KEYS */;
INSERT  IGNORE INTO `invitation_campaigns` VALUES (1,'DEFAULT','DEFAULT',10.00,0.00,1,1),(2,'ASSOCIATE 10','ASSOCIATE 10',10.00,0.00,1,1),(3,'ASSOCIATE 5','ASSOCIATE 5',5.00,0.00,1,1),(4,'ASSOCIATE 0','ASSOCIATE 0',0.00,0.00,1,1),(5,'Extra','Extra free membeships',0.00,0.00,1,0),(6,'Dec Invite A Friend Promo','Starting on December 2nd through December 31st, members will get a $20 credit, instead of a $10 credit each time a friend they invite from December 2nd through December 31st makes their first purchase before February 1st.',10.00,0.00,1,1),(7,'Spring $20 Invite A Friend Promo',' ',20.00,0.00,1,1),(8,'June 2010 $20 Invite a Friend Promo','Starting on June 28 midnight through July 6 11:59pm',20.00,NULL,1,1),(9,'Steals Deals Double Credit Deal','We agreed to double her referral credit on the first purchase of any friend that she referred starting in September. Increase the referral credit from $10 to $20. http://www.stealsdeals.blogspot.com/ Christine Shimizu',20.00,0.00,1,1),(10,'Promo 405','',20.00,0.00,1,1),(11,'Promo 441','Promo 441',20.00,0.00,1,1),(12,'Promo 645','',10.00,10.00,1,1),(13,'Promo 673','Promo 673',25.00,0.00,1,1),(14,'Kanban 366','',10.00,0.00,1,1),(15,'OLOP-2611','Tom\'s member incentive increase',20.00,0.00,1,1);
/*!40000 ALTER TABLE `invitation_campaigns` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

