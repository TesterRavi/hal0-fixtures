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
-- Table structure for table `encore_events_log`
--

DROP TABLE IF EXISTS `encore_events_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encore_events_log` (
  `event_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `priority` tinyint(3) unsigned DEFAULT NULL,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `event_type` varchar(20) NOT NULL DEFAULT 'post_event',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `private_indicator` tinyint(1) NOT NULL DEFAULT '0',
  `split` decimal(10,2) NOT NULL DEFAULT '70.00',
  `r_holdback` tinyint(2) DEFAULT '25',
  `zoom` tinyint(1) unsigned DEFAULT '1',
  `viewable_date` datetime DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `event_status` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_low_day` int(10) unsigned DEFAULT '10',
  `delivery_high_day` int(10) unsigned DEFAULT '14',
  `delivery_canadian_offset` int(10) unsigned DEFAULT '3',
  `delivery_estimate_rule` enum('Business','Calendar') DEFAULT NULL,
  `first_payment` float(10,2) NOT NULL DEFAULT '0.00',
  `event_cap` int(10) unsigned NOT NULL DEFAULT '6',
  `handlingfee` decimal(4,2) NOT NULL DEFAULT '0.00',
  `agent` varchar(50) CHARACTER SET utf8 NOT NULL,
  `commission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `group_by_style` tinyint(1) NOT NULL DEFAULT '0',
  `adjustment` float(10,2) NOT NULL,
  `adjustment_notes` text CHARACTER SET utf8 NOT NULL,
  `short_ship` decimal(4,2) NOT NULL DEFAULT '20.00',
  `short_ship_brand` decimal(4,2) NOT NULL DEFAULT '25.00',
  `description` text CHARACTER SET utf8 NOT NULL,
  `tagline` varchar(55) NOT NULL DEFAULT '',
  `finalsale` tinyint(1) NOT NULL DEFAULT '0',
  `region` enum('west','east') NOT NULL DEFAULT 'west',
  `sort_order` int(11) NOT NULL DEFAULT '99',
  `received_date` datetime DEFAULT NULL,
  `hl_default_sale_type` enum('default','select') CHARACTER SET utf8 NOT NULL DEFAULT 'default',
  `display_brand_name` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `return_to` enum('brand','hautelook') CHARACTER SET utf8 NOT NULL DEFAULT 'brand',
  `vertical` varchar(30) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `opp_id` int(10) unsigned DEFAULT NULL,
  `event_rating` tinyint(3) unsigned DEFAULT '1' COMMENT 'rating 1 to 5 will be DEPRECATED replaced by event_type',
  `discount_range` varchar(45) DEFAULT NULL COMMENT 'ex 0-0',
  `price_range` varchar(45) DEFAULT NULL COMMENT 'ex 0-0',
  `no_skus` int(10) unsigned DEFAULT '0',
  `hazard_material` enum('Y','N') NOT NULL DEFAULT 'N',
  `studio` enum('Y','N') NOT NULL DEFAULT 'N',
  `models` enum('Y','N') NOT NULL DEFAULT 'N',
  `image_sent` enum('Y','N') NOT NULL DEFAULT 'N',
  `factor_style` tinyint(3) unsigned DEFAULT '1' COMMENT '1 to 5',
  `factor_color` tinyint(3) unsigned DEFAULT '1',
  `factor_size` tinyint(3) unsigned DEFAULT '1',
  `ots_initial` decimal(8,2) DEFAULT '0.00',
  `ots_final` decimal(8,2) DEFAULT '0.00',
  `sales_projection_initial` decimal(8,2) DEFAULT '0.00',
  `sales_projection_final` decimal(8,2) DEFAULT '0.00',
  `sales_associate` varchar(30) DEFAULT NULL,
  `oversized` enum('Y','N') NOT NULL DEFAULT 'N',
  `drop_ship` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'will be DEPRECATED replaced by event_type',
  `gift_with_purchase` enum('Y','N') NOT NULL DEFAULT 'N',
  `rma_required` enum('Y','N') NOT NULL DEFAULT 'Y',
  `prepaid_percentage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `first_payment_percentage` tinyint(3) unsigned NOT NULL DEFAULT '75',
  `first_payment_timing` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT 'days',
  `net_payment_percentage` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `net_payment_timing` tinyint(3) unsigned NOT NULL DEFAULT '35' COMMENT 'days',
  `supplier` varchar(15) DEFAULT NULL,
  `msa_group` varchar(100) NOT NULL DEFAULT '',
  `shipping_calc_rule` varchar(50) NOT NULL DEFAULT 'weight',
  `price_visible` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `discount_visible` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `preview_minutes` int(10) unsigned NOT NULL DEFAULT '15',
  `coa` varchar(50) DEFAULT NULL,
  `built_in_freight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `carrier` varchar(20) NOT NULL DEFAULT 'UPS',
  `event_display_format` varchar(25) NOT NULL DEFAULT 'Regular',
  `affinity` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `encore_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`encore_date`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encore_events_log`
--

LOCK TABLES `encore_events_log` WRITE;
/*!40000 ALTER TABLE `encore_events_log` DISABLE KEYS */;
INSERT INTO `encore_events_log` VALUES (16891,NULL,NULL,2025,'16891parkeandronenmsw','Parke & Ronen','','','pre_event',0,0,0.00,0,1,NULL,'2012-08-14 08:00:00','2012-08-18 08:00:00',50,'2012-05-15 18:20:13',5,7,3,'Business',0.00,6,0.00,'',0.00,0,0.00,'',10.00,20.00,'','Boardshorts, briefs and other swimwear',1,'west',20,NULL,'default',1,'hautelook','Apparel','Men','Swimwear',23255,1,'','',0,'N','N','N','N',1,1,1,0.00,0.00,0.00,0.00,'Tim Davis','N','N','N','Y',0,0,10,100,30,'PARKE249','','weight',0,0,15,'men',0,'UPS','Regular',1,'2012-08-19 00:01:01'),(18902,18901,2,1718,'18902costablancaownedwc','Costa Blanca','','','owned_inv',0,0,0.00,0,1,NULL,'2012-08-17 08:00:00','2012-08-20 08:00:00',50,'2012-07-11 14:19:19',10,14,3,'Business',0.00,6,0.00,'',0.00,0,0.00,'',10.00,20.00,'','On-trend styles that will transition to Fall',0,'west',99,NULL,'default',1,'hautelook','Apparel','Women','Collections Contemporary',25076,1,'','',0,'N','N','N','N',1,1,1,0.00,0.00,0.00,0.00,'Mimi Nuelle','N','N','N','Y',0,0,10,100,30,NULL,'','weight',0,0,15,'womens_apparel',0,'UPS','Regular',1,'2012-08-21 00:01:01'),(18903,18901,1,1718,'18903costablancawc','Costa Blanca','','','pre_event',0,0,0.00,0,1,NULL,'2012-08-17 08:00:00','2012-08-20 08:00:00',50,'2012-07-11 14:21:46',10,14,3,'Business',0.00,6,0.00,'',0.00,0,0.00,'',10.00,20.00,'','On-trend styles that will transition to Fall',0,'west',99,NULL,'default',1,'hautelook','Apparel','Women','Collections Contemporary',25075,1,'','',0,'N','N','N','N',1,1,1,0.00,0.00,0.00,0.00,'Mimi Nuelle','N','N','N','Y',0,0,10,100,30,'COSTA127','','weight',0,0,15,'womens_apparel',0,'UPS','Regular',1,'2012-08-21 00:01:01'),(19799,19784,NULL,5853,'19799wedgesownedwf','Wedges','','','owned_inv',0,0,0.00,0,1,NULL,'2012-08-18 08:00:00','2012-08-21 08:00:00',50,'2012-08-01 21:24:41',5,7,3,'Business',0.00,6,0.00,'',0.00,0,0.00,'',10.00,20.00,'','',0,'west',5,NULL,'default',1,'hautelook','Accessories','Women','Shoes',25693,1,NULL,NULL,0,'N','N','N','N',1,1,1,25000.00,0.00,10000.00,0.00,'Dana Hauser2','N','N','N','N',0,75,10,25,35,NULL,'','weight',0,0,15,'womens_accessories',0,'UPS','Nested Parent Child',1,'2012-08-22 00:01:01'),(19800,19784,NULL,5853,'19800flatsownedwf','Flats','','','owned_inv',0,0,0.00,0,1,NULL,'2012-08-18 08:00:00','2012-08-21 08:00:00',50,'2012-08-01 21:24:41',5,7,3,'Business',0.00,6,0.00,'',0.00,0,0.00,'',10.00,20.00,'','',0,'west',1,NULL,'default',1,'hautelook','Accessories','Women','Shoes',25695,1,NULL,NULL,0,'N','N','N','N',1,1,1,25000.00,0.00,10000.00,0.00,'Dana Hauser2','N','N','N','N',0,75,10,25,35,NULL,'','weight',0,0,15,'womens_accessories',0,'UPS','Nested Parent Child',1,'2012-08-22 00:01:01'),(19801,19784,NULL,5853,'19801sandalsownedwf','Sandals','','','owned_inv',0,0,0.00,0,1,NULL,'2012-08-18 08:00:00','2012-08-21 08:00:00',50,'2012-08-01 21:24:41',5,7,3,'Business',0.00,6,0.00,'',0.00,0,0.00,'',10.00,20.00,'','',0,'west',3,NULL,'default',1,'hautelook','Accessories','Women','Shoes',25691,1,NULL,NULL,0,'N','N','N','N',1,1,1,25000.00,0.00,10000.00,0.00,'Dana Hauser2','N','N','N','N',0,75,10,25,35,NULL,'','weight',0,0,15,'womens_accessories',0,'UPS','Nested Parent Child',1,'2012-08-22 00:01:01'),(19802,19784,NULL,5853,'19802pumpsownedwf','Pumps','','','owned_inv',0,0,0.00,0,1,NULL,'2012-08-18 08:00:00','2012-08-21 08:00:00',50,'2012-08-01 21:24:41',5,7,3,'Business',0.00,6,0.00,'',0.00,0,0.00,'',10.00,20.00,'','',0,'west',4,NULL,'default',1,'hautelook','Accessories','Women','Shoes',25694,1,NULL,NULL,0,'N','N','N','N',1,1,1,25000.00,0.00,10000.00,0.00,'Dana Hauser2','N','N','N','N',0,75,10,25,35,NULL,'','weight',0,0,15,'womens_accessories',0,'UPS','Nested Parent Child',1,'2012-08-22 00:01:01'),(19057,NULL,NULL,NULL,'19057theperfectpairwf','The Perfect Pair of Boots','','','parent',0,0,70.00,25,1,'0000-00-00 00:00:00','2012-08-25 08:00:00','2012-08-29 08:00:00',50,'2012-07-16 14:54:26',5,7,3,'Business',0.00,6,1.00,'',0.00,0,0.00,'',10.00,20.00,'','Find a new pair to wear everywhere you go',1,'west',4,NULL,'default',1,'brand','Accessories','Women','Shoes',NULL,1,NULL,NULL,0,'N','N','N','N',1,1,1,0.00,0.00,0.00,0.00,NULL,'N','N','N','Y',0,75,10,25,35,NULL,'','weight',0,0,15,'womens_accessories',0,'UPS','Nested Parent Child',0,'2012-08-30 20:00:01'),(19102,19057,3,5220,'19102heels2ownedwfchild','The Perfect Pair: Booties','','','owned_inv',0,0,0.00,0,1,NULL,'2012-08-25 08:00:00','2012-08-29 08:00:00',50,'2012-07-16 15:39:10',5,7,3,'Business',0.00,3,0.00,'',0.00,0,0.00,'',10.00,20.00,'','',0,'west',2,NULL,'default',1,'hautelook','Accessories','Women','Shoes',25147,1,NULL,NULL,0,'N','N','N','N',1,1,1,20000.00,0.00,10000.00,0.00,'Dana Hauser2','N','N','N','Y',0,0,10,100,30,NULL,'','weight',0,0,15,'womens_accessories',0,'UPS','Nested Parent Child',1,'2012-08-30 20:00:01'),(19104,19057,2,5220,'19104wedges2ownedwfchild','The Perfect Pair: Wedge Boots','','','owned_inv',0,0,0.00,0,1,NULL,'2012-08-25 08:00:00','2012-08-29 08:00:00',50,'2012-07-16 15:39:10',5,7,3,'Business',0.00,3,0.00,'',0.00,0,0.00,'',10.00,20.00,'','',0,'west',1,NULL,'default',1,'hautelook','Accessories','Women','Shoes',25145,1,NULL,NULL,0,'N','N','N','N',1,1,1,20000.00,0.00,10000.00,0.00,'Dana Hauser2','N','N','N','Y',0,0,10,100,30,NULL,'','weight',0,0,15,'womens_accessories',0,'UPS','Nested Parent Child',1,'2012-08-30 20:00:01'),(19105,19057,1,5220,'19105flats2ownedwfchild','The Perfect Pair: Boots','','','owned_inv',0,0,0.00,0,1,NULL,'2012-08-25 08:00:00','2012-08-29 08:00:00',50,'2012-07-16 15:39:10',5,7,3,'Business',0.00,3,0.00,'',0.00,0,0.00,'',10.00,20.00,'','',0,'west',4,NULL,'default',1,'hautelook','Accessories','Women','Shoes',25146,1,NULL,NULL,0,'N','N','N','N',1,1,1,20000.00,0.00,10000.00,0.00,'Dana Hauser2','N','N','N','Y',0,0,10,100,30,NULL,'','weight',0,0,15,'womens_accessories',0,'UPS','Nested Parent Child',1,'2012-08-30 20:00:01'),(17762,19428,1,3461,'17762charlesbycharlesdavidwf','Charles by Charles David','','','pre_event',0,0,0.00,0,1,NULL,'2012-08-29 08:00:00','2012-08-31 08:00:00',50,'2012-06-13 01:23:02',5,7,3,'Business',0.00,3,0.00,'',0.00,0,0.00,'HL pays shipping',10.00,20.00,'','Step into flawless day-to-night style',0,'west',99,NULL,'default',1,'hautelook','Accessories','Women','Shoes',23990,1,NULL,NULL,0,'N','N','N','N',1,1,1,82000.00,0.00,65000.00,0.00,'Dana Hauser2','N','N','N','Y',0,0,45,100,45,'CHARL5731','','weight',0,0,15,'womens_accessories',0,'UPS','Regular',1,'2012-09-01 20:00:01'),(19428,NULL,NULL,NULL,'19428charlesbycharlesdavidwf','Charles by Charles David','','','parent',0,0,70.00,25,1,NULL,'2012-08-29 08:00:00','2012-08-31 08:00:00',50,'2012-07-23 20:31:21',5,7,3,'Business',0.00,6,1.00,'',0.00,0,0.00,'',10.00,20.00,'','Step into flawless day-to-night style',1,'west',6,NULL,'default',1,'brand','Accessories','Women','Shoes',NULL,1,NULL,NULL,0,'N','N','N','N',1,1,1,0.00,0.00,0.00,0.00,NULL,'N','N','N','Y',0,75,10,25,35,NULL,'','weight',0,0,15,'womens_accessories',0,'UPS','Regular',1,'2012-09-01 20:00:01'),(19453,19428,2,3461,'19453charlesbycharlesdavidownedw','Charles by Charles David','','','owned_inv',0,0,0.00,0,1,NULL,'2012-08-29 08:00:00','2012-08-31 08:00:00',50,'2012-07-23 21:15:31',5,7,3,'Business',0.00,3,0.00,'',0.00,0,0.00,'',10.00,20.00,'','Step into flawless day-to-night style',0,'west',99,NULL,'default',1,'hautelook','Accessories','Women','Shoes',25390,1,NULL,NULL,0,'N','N','N','N',1,1,1,10000.00,0.00,5000.00,0.00,'Dana Hauser2','N','N','N','Y',0,75,10,25,35,NULL,'','weight',0,0,15,'womens_accessories',0,'UPS','Regular',1,'2012-09-01 20:00:01'),(15645,19375,1,529,'15645mackagewc','Mackage','','','pre_event',0,0,0.00,0,1,NULL,'2012-09-04 08:00:00','2012-09-07 08:00:00',50,'2012-04-06 21:27:52',5,7,3,'Business',0.00,4,0.00,'',0.00,0,0.00,'net 30 ROG',10.00,20.00,'','Wool coats, down jackets and Fall fabrics',0,'west',99,NULL,'default',1,'hautelook','Apparel','Women','Collections Contemporary',22179,1,'','',0,'N','N','N','N',1,1,1,0.00,0.00,0.00,0.00,'Andrea Braun','N','N','N','N',0,0,10,100,30,'APPG275','','weight',0,0,15,'womens_apparel',0,'UPS','Regular',1,'2012-09-08 20:00:01'),(17881,NULL,NULL,5551,'17881alicetrixiwc','Alice & Trixie','','','pre_event',0,0,0.00,0,1,NULL,'2012-09-04 08:00:00','2012-09-07 08:00:00',50,'2012-06-19 00:29:00',5,7,3,'Business',0.00,4,0.00,'',0.00,0,0.00,'net 30 rog',10.00,20.00,'','Signature prints and bright pops of color',0,'west',2,NULL,'default',1,'brand','Apparel','Women','Collections Contemporary',NULL,1,'','',0,'N','N','N','N',1,1,1,0.00,0.00,0.00,0.00,'Carly Willis','N','N','N','Y',0,0,10,100,30,'MILL1036','','weight',0,0,15,'womens_apparel',0,'UPS','Regular',1,'2012-09-08 20:00:01'),(19366,19375,2,529,'19366mackagewc','Mackage','','','owned_inv',0,0,0.00,0,1,NULL,'2012-09-04 08:00:00','2012-09-07 08:00:00',50,'2012-07-20 21:30:22',5,7,3,'Business',0.00,4,0.00,'',0.00,0,0.00,'',10.00,20.00,'','Wool coats, down jackets and Fall fabrics',0,'west',99,NULL,'default',1,'hautelook','Apparel','Women','Collections Contemporary',25418,1,NULL,NULL,0,'N','N','N','N',1,1,1,0.00,0.00,0.00,0.00,'Andrea Braun','N','N','N','Y',0,75,10,25,35,NULL,'','weight',0,0,15,'womens_apparel',0,'UPS','Regular',1,'2012-09-08 20:00:01'),(19375,NULL,NULL,NULL,'19375mackagewc','Mackage','','','parent',0,0,70.00,25,1,NULL,'2012-09-04 08:00:00','2012-09-07 08:00:00',50,'2012-07-20 21:43:56',5,7,3,'Business',0.00,6,1.00,'',0.00,0,0.00,'',10.00,20.00,'','Wool coats, down jackets and Fall fabrics',0,'west',1,NULL,'default',1,'brand','Apparel','Women','Collections Contemporary',NULL,1,NULL,NULL,0,'N','N','N','N',1,1,1,0.00,0.00,0.00,0.00,NULL,'N','N','N','Y',0,75,10,25,35,NULL,'','weight',0,0,15,'womens_apparel',0,'UPS','Regular',1,'2012-09-08 20:00:01');
/*!40000 ALTER TABLE `encore_events_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:23
