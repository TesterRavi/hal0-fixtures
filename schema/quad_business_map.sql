
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
DROP TABLE IF EXISTS `quad_business_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quad_business_map` (
  `business_division_id` varchar(50) NOT NULL,
  `business_department_id` int(11) NOT NULL,
  `business_department_cd` varchar(50) NOT NULL DEFAULT '',
  `business_class_id` int(11) NOT NULL,
  `business_class_cd` varchar(50) NOT NULL DEFAULT '',
  `business_subclass_id` int(11) NOT NULL,
  `business_subclass_cd` varchar(50) NOT NULL DEFAULT '',
  `quad_id` int(11) NOT NULL,
  `is_active_flag` char(1) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`quad_id`,`business_division_id`,`business_department_id`,`business_department_cd`,`business_class_id`,`business_class_cd`,`business_subclass_id`,`business_subclass_cd`),
  KEY `fk_quad_business_map_business_classification` (`business_division_id`,`business_department_id`,`business_department_cd`,`business_class_id`,`business_class_cd`,`business_subclass_id`,`business_subclass_cd`),
  KEY `fk_quad_business_map_quad_id` (`quad_id`),
  CONSTRAINT `fk_quad_business_map_business_classification` FOREIGN KEY (`business_division_id`, `business_department_id`, `business_department_cd`, `business_class_id`, `business_class_cd`, `business_subclass_id`, `business_subclass_cd`) REFERENCES `business_classification` (`business_division_id`, `business_department_id`, `business_department_cd`, `business_class_id`, `business_class_cd`, `business_subclass_id`, `business_subclass_cd`) ON UPDATE CASCADE,
  CONSTRAINT `fk_quad_business_map_quad_id` FOREIGN KEY (`quad_id`) REFERENCES `quads` (`quad_id`)
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

