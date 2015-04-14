
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `business_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_classification` (
  `business_division_id` varchar(50) NOT NULL,
  `business_department_id` int(11) NOT NULL,
  `business_department_cd` varchar(50) NOT NULL DEFAULT '',
  `business_class_id` int(11) NOT NULL,
  `business_class_cd` varchar(50) NOT NULL DEFAULT '',
  `business_subclass_id` int(11) NOT NULL,
  `business_subclass_cd` varchar(50) NOT NULL DEFAULT '',
  `classification_desc` varchar(50) NOT NULL,
  `is_active_flag` char(1) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`business_division_id`,`business_department_id`,`business_department_cd`,`business_class_id`,`business_class_cd`,`business_subclass_id`,`business_subclass_cd`),
  KEY `fk_business_classification_business_department_id` (`business_department_id`),
  KEY `fk_business_classification_class_id` (`business_class_id`),
  CONSTRAINT `fk_business_classification_business_department_id` FOREIGN KEY (`business_department_id`) REFERENCES `business_department` (`business_department_id`),
  CONSTRAINT `fk_business_classification_business_division_id` FOREIGN KEY (`business_division_id`) REFERENCES `business_division` (`business_division_id`),
  CONSTRAINT `fk_business_classification_class_id` FOREIGN KEY (`business_class_id`) REFERENCES `business_class` (`business_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

