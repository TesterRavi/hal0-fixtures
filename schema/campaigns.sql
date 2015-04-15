
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
DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_channel` varchar(25) DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  `site` varchar(50) NOT NULL,
  `campaign` varchar(30) NOT NULL DEFAULT '',
  `placement` varchar(50) DEFAULT NULL,
  `creative` varchar(50) DEFAULT NULL,
  `adgroup` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `matchtype` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `campaigns_unique` (`campaign_channel`,`account`,`site`,`campaign`,`placement`,`creative`,`adgroup`,`keyword`,`matchtype`,`description`),
  KEY `FK_campaigns::campaign_channels` (`campaign_channel`),
  KEY `FK_campaigns::campaigns` (`campaign`),
  CONSTRAINT `FK_campaigns::campaign_channels` FOREIGN KEY (`campaign_channel`) REFERENCES `campaign_channels` (`campaign_channel`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=545819 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 169984 kB';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

