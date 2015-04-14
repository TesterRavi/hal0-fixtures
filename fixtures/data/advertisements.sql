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
-- Table structure for table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisements` (
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pixel_width` int(10) unsigned NOT NULL COMMENT '300,450,600,900',
  `content` varchar(1024) NOT NULL,
  PRIMARY KEY (`end_date`,`start_date`,`pixel_width`,`content`(100))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisements`
--

LOCK TABLES `advertisements` WRITE;
/*!40000 ALTER TABLE `advertisements` DISABLE KEYS */;
INSERT INTO `advertisements` VALUES ('2009-07-01 00:00:00','2009-07-02 23:59:59',300,'<img src=\"/ads/ad_multiplecart_300x250.jpg\" alt=\"Free Shipping\"/>'),('2009-07-01 00:00:00','2009-07-02 23:59:59',600,'<img src=\"/ads/ad_freeshipping_600x250.jpg\" alt=\"Free Shipping\"/>'),('2009-07-01 00:00:00','2009-12-01 23:59:59',900,'<a href=\"/invites\"><img src=\"/msgs/300x250_referrals.jpg\" alt=\"Get your Personal Invitation Links!\" style=\"float:left\"/></a>\r\n\r\n<img src=\"/msgs/600x250_shipping_103109.jpg\" alt=\"Pay for shipping in one sale and get FREE SHIPPING on everything else in your cart until December 31!\" style=\"float:left\"/>'),('2009-12-02 00:00:00','2009-12-18 23:59:59',900,'<a href=\"/invites\"><img src=\"/msgs/december_invite_promo.png\" alt=\"During the month of December, get a $20 credit for each friend you invite that makes their first purchase before the end of January\" /></a>'),('2009-12-19 00:00:00','2009-12-24 23:59:59',900,'<a href=\"http://www.rachelzoe.com/welcome?utm_source=hautelook.com&utm_medium=site&utm_campaign=Haute%2BLook%20Site\" target=\"_blank\"><img src=\"/msgs/300x250_referrals_zoe.jpg\" alt=\"\" /></a><a href=\"/invites\"><img src=\"/msgs/600x250_20_credit.jpg\" alt=\"During the month of December, get a $20 credit for each friend you invite that makes their first purchase before the end of January\" /></a>'),('2009-12-25 00:00:00','2009-12-31 23:59:59',900,'<a href=\"/invites\"><img src=\"/msgs/december_invite_promo.png\" alt=\"During the month of December, get a $20 credit for each friend you invite that makes their first purchase before the end of January\" /></a>'),('2010-01-01 00:00:00','2010-01-13 07:59:59',900,'<a href=\"/invites\" rel=\"Advertisement: Invite Friends\"><img src=\"/msgs/10dollar_ReferFriendFooter.jpg\" alt=\"Invite your friends, receive $10 credits when they make their first purchase.\" /></a>'),('2010-01-13 08:00:00','2010-01-23 23:59:59',900,'<a href=\"/invites\"><img src=\"/dynamics/jan_raf_sweeps/event_bottom_banner.jpg\" alt=\"Invite friends, win a $5,000 Shopping Spree.\" /></a>'),('2010-01-24 00:00:00','2010-01-29 20:59:59',900,'<a href=\"/invites\"><img src=\"/msgs/10dollar_ReferFriendFooter.jpg\" alt=\"Invite your friends, receive $10 credits when they make their first purchase.\" /></a>'),('2010-01-29 21:00:00','2010-01-31 23:59:59',900,'<img src=\"/dynamics/20_for_99_Weekend/events-page-bottom-box.jpg\" alt=\"Spend $99 or more on a HauteLook order and receive a $20 bonus credit to use on a future HauteLook event. Credit will be placed in your account within 72 hours.\" />'),('2010-02-01 00:00:00','2010-04-18 23:59:59',900,'<a href=\"/invites\"><img src=\"/msgs/10dollar_ReferFriendFooter.jpg\" alt=\"Invite your friends, receive $10 credits when they make their first purchase.\" /></a>'),('2010-04-19 00:00:00','2010-04-23 23:59:59',900,'<a href=\"http://www.RachelZoe.com/?utm_source=hautelook&utm_medium=banner&utm_campaign=website\" target=\"_blank\"><img src=\"http://www.hautelookcdn.com/ads/onsite_full3.png\" alt=\"HauteLook brings you the Zoe Report, a free daily email about my latest obsessions in fashion, beauty, and lifestyle!\" /></a>'),('2010-04-24 00:00:00','2010-04-28 23:59:59',900,'<a href=\"/invites\"><img src=\"/msgs/10dollar_ReferFriendFooter.jpg\" alt=\"Invite your friends, receive $10 credits when they make their first purchase.\" /></a>'),('2010-04-29 00:00:00','2010-05-06 23:59:59',900,'<a href=\"/invites\"><img src=\"http://www.hautelookcdn.com/dynamics/spring_invite/refer_friend_footer.png\" alt=\"Invite your friends, receive $20 credits when they make their first purchase.\" /></a>'),('2010-05-07 00:00:00','2010-05-16 23:59:59',900,'<a href=\"/invites\"><img src=\"/msgs/10dollar_ReferFriendFooter.jpg\" alt=\"Invite your friends, receive $10 credits when they make their first purchase.\" /></a>'),('2010-05-17 00:00:00','2010-05-21 23:59:59',900,'<a href=\"http://www.rachelzoe.com/?utm_source=hautelook&utm_medium=banner&utm_campaign=website\" target=\"_blank\"><img src=\"http://www.hautelookcdn.com/dynamics/pr_images/rachel_zoe_may2010.jpg\" alt=\"Jet Set Summer: 20 Style Savvy Suggestions\" /></a>'),('2010-05-22 00:00:00','2010-06-27 23:59:59',900,'<a href=\"/invites\"><img src=\"/msgs/10dollar_ReferFriendFooter.jpg\" alt=\"Invite your friends, receive $10 credits when they make their first purchase.\" /></a>'),('2010-06-28 00:00:00','2010-07-06 23:59:59',900,'<a href=\"/invites\"><img src=\"http://www.hautelookcdn.com/dynamics/july_invite/order_confirmation.jpg\" alt=\"For a limited time, get $20 credits each time friends you invite make their first purchase.\" /></a>'),('2010-07-08 00:00:00','2010-07-09 00:00:00',900,'<img src=\"/images/ads/lucky_promo.jpg\" alt=\"Lucky Magazine Afternoon Pick-Me-Up\"/>'),('2010-07-07 00:00:00','2010-07-30 18:00:00',900,'<a href=\"/invites\"><img src=\"/msgs/10dollar_ReferFriendFooter.jpg\" alt=\"Invite your friends, receive $10 credits when they make their first purchase.\" /></a>'),('2010-08-02 00:00:00','2010-08-30 00:00:00',900,'<script>\r\nvar gender = Sandbox.getMember().gender;\r\nif(gender == \"M\") {\r\ndocument.getElementById(\'ad_banner\').innerHTML = \"<img src=\'/images/ads/mens_order_confirmation.jpg\' alt=\'Get a $10 credit each time a friend you invite makes their first purchase\' />\";\r\n}\r\nelse {\r\ndocument.getElementById(\'ad_banner\').innerHTML = \"<img src=\'/images/ads/womens_order_confirmation.jpg\' alt=\'Get a $10 credit each time a friend you invite makes their first purchase\' />\";\r\n}\r\n</script>'),('2010-07-30 18:00:00','2025-01-23 23:59:59',900,'<script>\r\nvar gender = Sandbox.getMember().gender;\r\nif(gender == \"M\") {\r\ndocument.getElementById(\'ad_banner\').innerHTML = \"<a href=\'/invites\'><img src=\'/images/ads/mens_order_confirmation.jpg\' alt=\'Get a $10 credit each time a friend you invite makes their first purchase\' /></a>\";\r\n}\r\nelse {\r\ndocument.getElementById(\'ad_banner\').innerHTML = \"<a href=\'/invites\'><img src=\'/images/ads/womens_order_confirmation.jpg\' alt=\'Get a $10 credit each time a friend you invite makes their first purchase\' /></a>\";\r\n}\r\n</script>');
/*!40000 ALTER TABLE `advertisements` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:02
