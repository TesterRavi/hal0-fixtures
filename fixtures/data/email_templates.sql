-- MySQL dump 10.13  Distrib 5.5.34, for Linux (x86_64)
--
-- Host: localhost    Database: hautelook
-- ------------------------------------------------------
-- Server version	5.5.34

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

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `email_template` varchar(20) NOT NULL,
  `exacttarget_template_id` varchar(50) NOT NULL DEFAULT '',
  `strongmail_template_id` varchar(50) NOT NULL DEFAULT '',
  `cheetahmail_template_id` varchar(50) NOT NULL,
  PRIMARY KEY (`email_template`),
  KEY `email_template` (`email_template`,`cheetahmail_template_id`,`exacttarget_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES ('booking','booking','Mailing.11836.7482','69445'),('brand_notification','brand_notification','',''),('canada','welcome','Mailing.153603.9075','78745'),('delaynotice','delaynotice','Mailing.48904.2627','69445'),('dynamic','dynamic3','Mailing.50105.3826','69445'),('earned','referral_credit_notification','Mailing.50006.1752','89826'),('financial_adjustment','financial_notification','Mailing.54000.5913',''),('gc_delivery_conf','delivery_confirmation_egiftcard','Mailing.49703.6709','69445'),('gc_order_conf','order_confirmation_egiftcard','Mailing.49705.3021','69445'),('giftreturnlabel','giftreturnlabel','Mailing.48905.5713','69445'),('gift_announcement','gift_announcement','Mailing.198298.7976','69445'),('invite','referral_invitation','Mailing.98702.2533','69372'),('order','order_confirmation','Mailing.128801.6121','69445'),('order_giftcard','egiftcard_announcement','Mailing.49407.6104','69445'),('passwordnotification','password_notification','',''),('rack_welcome','rack_welcome','',''),('reminder','referral_invitation_reminder','Mailing.98701.5179',''),('return','return_confirmation','Mailing.52227.2381','69445'),('returnlabel','return_processed','Mailing.59399.112','69445'),('return_cancel','order_cancellation','Mailing.53711.9180',''),('return_giftcard','return_giftcard','Mailing.49404.8458','69445'),('share','share','Mailing.49708.4152','69445'),('sharing','sharing','Mailing.49413.81','69445'),('ship','ship_notification','Mailing.130898.7560','69445'),('shortship','ship_shortship_notification','Mailing.55119.3080',''),('voidreturn','return_reminder_notification','Mailing.55206.9988','69445'),('voucher','order_confirmation_ecertificate','Mailing.48907.3726','120607'),('welcome','welcome','Mailing.57798.8601','76705'),('welcome_iafoffer','welcome_iafoffer','Mailing.142297.245',''),('welcome_pandora','welcome_pandora','Mailing.40279.9081','76705');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:22
