
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

LOCK TABLES `email_queue` WRITE;
/*!40000 ALTER TABLE `email_queue` DISABLE KEYS */;
INSERT INTO `email_queue` VALUES (1,1,'2012-10-18 15:59:40','test@user.com','hautelook@hautelookmail.com','Welcome to HauteLook','Female','a:3:{s:2:\"To\";a:3:{i:0;s:25:\"Test User <test@user.com>\";s:6:\"append\";b:1;i:1;s:13:\"test@user.com\";}s:4:\"From\";a:2:{i:0;s:39:\"HauteLook <hautelook@hautelookmail.com>\";s:6:\"append\";b:1;}s:7:\"Subject\";a:1:{i:0;s:20:\"Welcome to HauteLook\";}}','a:11:{s:6:\"gender\";s:6:\"female\";s:7:\"country\";s:7:\"welcome\";s:10:\"first_name\";s:4:\"Test\";s:9:\"last_name\";s:4:\"User\";s:4:\"name\";s:9:\"Test User\";s:9:\"hl_credit\";s:0:\"\";s:17:\"member_first_name\";s:0:\"\";s:16:\"member_last_name\";s:0:\"\";s:15:\"pending_invites\";s:0:\"\";s:16:\"personal_message\";s:0:\"\";s:9:\"member_id\";s:1:\"1\";}','welcome','pending','a:8:{s:4:\"TYPE\";s:7:\"welcome\";s:9:\"MEMBER_ID\";s:1:\"1\";s:6:\"GENDER\";s:6:\"female\";s:10:\"FIRST_NAME\";s:0:\"\";s:9:\"LAST_NAME\";s:0:\"\";s:4:\"MISC\";s:0:\"\";s:19:\"INVITERS_FROM_EMAIL\";s:0:\"\";s:20:\"UNUSED_CREDIT_AMOUNT\";s:0:\"\";}','','2012-10-18 15:59:40',NULL,NULL);
/*!40000 ALTER TABLE `email_queue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

