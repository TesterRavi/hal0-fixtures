
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
DROP TABLE IF EXISTS `rtr_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rtr_audit_log` (
  `rtr_audit_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `employee_id` int(11) unsigned NOT NULL,
  `store_id` int(11) unsigned NOT NULL,
  `transaction_id` varchar(255) NOT NULL DEFAULT '',
  `register_id` int(11) unsigned NOT NULL,
  `processed_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` varchar(255) NOT NULL DEFAULT '',
  `return_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rtr_audit_log_id`),
  KEY `store_id` (`store_id`),
  KEY `return_id` (`return_id`),
  KEY `create_ts` (`create_ts`),
  KEY `rtr_audit_action` (`action`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `rtr_audit_action` FOREIGN KEY (`action`) REFERENCES `rtr_audit_actions` (`rtr_audit_action`)
) ENGINE=InnoDB AUTO_INCREMENT=12017833 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

