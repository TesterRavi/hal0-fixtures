
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
DROP TABLE IF EXISTS `member_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_classification` (
  `member_division_cd` varchar(50) NOT NULL,
  `member_department_cd` varchar(50) NOT NULL,
  `member_class_cd` varchar(50) NOT NULL,
  `member_subclass_cd` varchar(50) NOT NULL,
  `classification_desc` varchar(50) NOT NULL,
  `is_active_flag` char(1) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_division_cd`,`member_department_cd`,`member_class_cd`,`member_subclass_cd`),
  KEY `fk_member_classification_member_department` (`member_department_cd`),
  KEY `fk_member_classification_member_class` (`member_class_cd`),
  KEY `fk_member_classification_member_subclass` (`member_subclass_cd`),
  CONSTRAINT `fk_member_classification_member_class` FOREIGN KEY (`member_class_cd`) REFERENCES `member_class` (`member_class_cd`),
  CONSTRAINT `fk_member_classification_member_department` FOREIGN KEY (`member_department_cd`) REFERENCES `member_department` (`member_department_cd`),
  CONSTRAINT `fk_member_classification_member_division` FOREIGN KEY (`member_division_cd`) REFERENCES `member_division` (`member_division_cd`),
  CONSTRAINT `fk_member_classification_member_subclass` FOREIGN KEY (`member_subclass_cd`) REFERENCES `member_subclass` (`member_subclass_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

