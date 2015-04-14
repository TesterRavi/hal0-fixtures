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
-- Table structure for table `member_subclass`
--

DROP TABLE IF EXISTS `member_subclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_subclass` (
  `member_subclass_cd` varchar(50) NOT NULL,
  `is_active_flag` char(1) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_subclass_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_subclass`
--

LOCK TABLES `member_subclass` WRITE;
/*!40000 ALTER TABLE `member_subclass` DISABLE KEYS */;
INSERT INTO `member_subclass` VALUES ('','Y',0,'2013-10-21 23:13:17'),('Art','Y',0,'2013-10-21 23:13:17'),('Backpacks','Y',0,'2013-10-21 23:13:17'),('Blouses / Shirts','Y',0,'2013-10-21 23:13:17'),('Body Jewelry','Y',0,'2013-10-21 23:13:17'),('Bootcut','Y',0,'2013-10-21 23:13:17'),('Bottoms','Y',0,'2013-10-21 23:13:17'),('Boyfriend','Y',0,'2013-10-21 23:13:17'),('Bracelets','Y',0,'2014-02-19 10:03:26'),('Brooch / Pin','Y',0,'2013-10-21 23:13:17'),('Capris','Y',0,'2013-10-21 23:13:17'),('Cardigans','Y',0,'2013-10-21 23:13:17'),('Cashmere','Y',0,'2013-10-21 23:13:17'),('Casual','Y',0,'2013-10-21 23:13:17'),('Casual Long Sleeve','Y',0,'2013-10-21 23:13:17'),('Charms','Y',0,'2013-10-21 23:13:17'),('Clutches','Y',0,'2013-11-20 07:52:54'),('Cold Weather Hats','Y',0,'2013-10-21 23:13:17'),('Component Jackets','Y',0,'2014-01-14 13:56:31'),('Component Pant','Y',0,'2013-10-21 23:13:17'),('Component Vests','Y',0,'2014-01-14 13:56:31'),('Components Formalwear','Y',0,'2013-10-21 23:13:17'),('Cowl Neck','Y',0,'2013-10-21 23:13:17'),('Cropped','Y',0,'2013-10-21 23:13:17'),('Crossbody Bags','Y',0,'2013-10-21 23:13:17'),('Date tops','Y',0,'2013-10-21 23:13:17'),('Day to Night','Y',0,'2013-10-21 23:13:17'),('Daytime','Y',0,'2015-02-23 23:59:21'),('Dress','Y',0,'2013-10-21 23:13:17'),('Dress Shirt','Y',0,'2013-10-21 23:13:17'),('Earrings','Y',0,'2013-10-21 23:13:17'),('Evening Bags','Y',0,'2013-10-21 23:13:17'),('Flare & Wide Leg','Y',0,'2014-01-14 13:57:06'),('Gloves','Y',0,'2013-10-21 23:13:17'),('Hardside Luggage','Y',0,'2013-10-21 23:13:17'),('Hats','Y',0,'2013-10-21 23:13:17'),('Henley','Y',0,'2013-10-21 23:13:17'),('Jackets','Y',0,'2013-10-21 23:13:17'),('Jeggings & Leggings','Y',0,'2014-01-14 13:57:05'),('Jumpsuits & Rompers','Y',0,'2014-01-14 13:57:06'),('Leggings','Y',0,'2013-10-21 23:13:17'),('Maxi','Y',0,'2014-01-14 13:56:23'),('Mirrors & Clocks','Y',0,'2013-10-21 23:13:17'),('Necklaces','Y',0,'2013-10-21 23:13:17'),('Occasion','Y',0,'2013-10-21 23:13:17'),('Optical','Y',0,'2013-10-21 23:13:17'),('Pants','Y',0,'2013-10-21 23:13:17'),('Petites','Y',0,'2013-10-21 23:13:17'),('Pullovers','Y',0,'2014-01-14 13:56:27'),('Relaxed','Y',0,'2013-10-21 23:13:17'),('Rings','Y',0,'2014-02-19 10:03:22'),('Satchels','Y',0,'2013-10-21 23:13:17'),('Scarves','Y',0,'2013-10-21 23:13:17'),('Sets','Y',0,'2013-10-21 23:13:17'),('Shorts','Y',0,'2013-10-21 23:13:17'),('Shorts & Skirts','Y',0,'2014-01-14 13:57:05'),('Shoulder Bags','Y',0,'2013-10-21 23:13:17'),('Skinny','Y',0,'2013-10-21 23:13:17'),('Skirts','Y',0,'2013-10-21 23:13:17'),('Sleeveless','Y',0,'2013-10-21 23:13:17'),('Slim','Y',0,'2013-10-21 23:13:17'),('Softside Luggage','Y',0,'2013-10-21 23:13:17'),('Sportcoats','Y',0,'2013-10-21 23:13:17'),('Sports bras','Y',0,'2013-10-21 23:13:17'),('Straight','Y',0,'2013-10-21 23:13:17'),('Strap','Y',0,'2013-10-21 23:13:17'),('Suits','Y',0,'2013-10-21 23:13:17'),('Sunglasses','Y',0,'2013-10-21 23:13:17'),('Sweater','Y',0,'2013-10-21 23:13:17'),('Sweaters','Y',0,'2013-10-21 23:13:17'),('Sweatpants','Y',0,'2013-10-21 23:13:17'),('Sweatshirts / Hoodies','Y',0,'2013-10-21 23:13:17'),('Tank','Y',0,'2013-10-21 23:13:17'),('Tanks','Y',0,'2013-10-21 23:13:17'),('Tees','Y',0,'2013-10-21 23:13:17'),('Topcoats','Y',0,'2013-10-21 23:13:17'),('Tops','Y',0,'2015-02-23 23:59:21'),('Totes','Y',0,'2013-10-21 23:13:17'),('Travel','Y',0,'2013-10-21 23:13:17'),('Tunics','Y',0,'2013-10-21 23:13:17'),('Turtleneck','Y',0,'2013-10-21 23:13:17'),('Vests','Y',0,'2013-10-21 23:13:17'),('Wear to Work','Y',0,'2013-10-21 23:13:17'),('Wraps','Y',0,'2013-10-21 23:13:17'),('Wraps & Ponchos','Y',0,'2014-01-14 13:56:27'),('Yoga','Y',0,'2013-10-21 23:13:17');
/*!40000 ALTER TABLE `member_subclass` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:42
