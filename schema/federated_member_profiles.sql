
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `federated_member_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `federated_member_profiles` (
  `member_id` int(10) unsigned NOT NULL,
  `lifecycle_segment` varchar(50) NOT NULL DEFAULT 'Newborn',
  `lifecycle_segment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `loyalty_segment` varchar(50) DEFAULT NULL,
  `loyalty_segment_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `copa` varchar(50) NOT NULL DEFAULT 'default',
  `copa_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cosa` varchar(50) NOT NULL DEFAULT 'default',
  `cosa_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CONNECTION='mysql://hautelook:haute98livedb@10.0.0.248:3306/hautelook_live/member_profiles';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

