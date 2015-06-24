
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

LOCK TABLES `checkout_summary` WRITE;
/*!40000 ALTER TABLE `checkout_summary` DISABLE KEYS */;
INSERT  IGNORE INTO `checkout_summary` VALUES (22894117,'standard','O:13:\"Checkout_Data\":11:{s:5:\"order\";O:8:\"stdClass\":20:{s:11:\"shipping_id\";s:7:\"2239517\";s:10:\"billing_id\";s:7:\"6893362\";s:9:\"member_id\";s:8:\"22894117\";s:7:\"freight\";N;s:14:\"ship_method_id\";i:3;s:9:\"surcharge\";d:0;s:14:\"surcharge_rate\";d:0;s:8:\"subtotal\";d:0;s:7:\"ordered\";i:0;s:5:\"notes\";s:8:\"CI[]CI\r\n\";s:8:\"tax_rate\";d:0;s:5:\"taxes\";d:0;s:5:\"total\";d:0;s:7:\"charged\";d:0;s:6:\"credit\";d:0;s:3:\"sid\";i:100;s:3:\"mid\";N;s:3:\"cid\";N;s:3:\"aid\";N;s:4:\"omid\";s:0:\"\";}s:4:\"gift\";N;s:10:\"gift_order\";N;s:4:\"cart\";a:0:{}s:14:\"item_surcharge\";s:0:\"\";s:12:\"store_credit\";d:0;s:18:\"store_credit_state\";s:4:\"auto\";s:11:\"secure_code\";N;s:12:\"total_saving\";d:0;s:9:\"bml_promo\";i:1;s:15:\"warning_message\";s:0:\"\";}','2015-06-19 15:41:17');
/*!40000 ALTER TABLE `checkout_summary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

