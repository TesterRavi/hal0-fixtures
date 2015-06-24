
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `events_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_aud` (
  `event_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `priority` tinyint(3) unsigned DEFAULT NULL,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `notes` text,
  `event_type` varchar(20) DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `private_indicator` tinyint(1) DEFAULT NULL,
  `split` decimal(10,2) DEFAULT NULL,
  `r_holdback` tinyint(2) DEFAULT NULL,
  `zoom` tinyint(1) unsigned DEFAULT NULL,
  `viewable_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `event_status` tinyint(3) unsigned DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_low_day` int(10) unsigned DEFAULT NULL,
  `delivery_high_day` int(10) unsigned DEFAULT NULL,
  `delivery_canadian_offset` int(10) unsigned DEFAULT NULL,
  `delivery_estimate_rule` enum('Business','Calendar') DEFAULT NULL,
  `first_payment` float(10,2) DEFAULT NULL,
  `event_cap` int(10) unsigned DEFAULT NULL,
  `handlingfee` decimal(4,2) DEFAULT NULL,
  `agent` varchar(50) DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `group_by_style` tinyint(1) DEFAULT NULL,
  `adjustment` float(10,2) DEFAULT NULL,
  `adjustment_notes` text,
  `short_ship` decimal(4,2) DEFAULT NULL,
  `short_ship_brand` decimal(4,2) DEFAULT NULL,
  `description` text,
  `tagline` varchar(55) DEFAULT NULL,
  `finalsale` tinyint(1) DEFAULT NULL,
  `region` enum('west','east') DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `hl_default_sale_type` enum('default','select') DEFAULT NULL,
  `display_brand_name` tinyint(3) unsigned DEFAULT NULL,
  `return_to` varchar(20) DEFAULT NULL,
  `vertical` varchar(30) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `opp_id` int(10) unsigned DEFAULT NULL,
  `event_rating` tinyint(3) unsigned DEFAULT NULL,
  `discount_range` varchar(45) DEFAULT NULL,
  `price_range` varchar(45) DEFAULT NULL,
  `no_skus` int(10) unsigned DEFAULT NULL,
  `hazard_material` enum('Y','N') DEFAULT NULL,
  `studio` enum('Y','N') DEFAULT NULL,
  `models` enum('Y','N') DEFAULT NULL,
  `image_sent` enum('Y','N') DEFAULT NULL,
  `factor_style` tinyint(3) unsigned DEFAULT NULL,
  `factor_color` tinyint(3) unsigned DEFAULT NULL,
  `factor_size` tinyint(3) unsigned DEFAULT NULL,
  `ots_initial` decimal(8,2) DEFAULT NULL,
  `ots_final` decimal(8,2) DEFAULT NULL,
  `sales_projection_initial` decimal(8,2) DEFAULT NULL,
  `sales_projection_final` decimal(8,2) DEFAULT NULL,
  `sales_associate` varchar(30) DEFAULT NULL,
  `oversized` enum('Y','N') DEFAULT NULL,
  `drop_ship` enum('Y','N') DEFAULT NULL,
  `gift_with_purchase` enum('Y','N') DEFAULT NULL,
  `rma_required` enum('Y','N') DEFAULT NULL,
  `prepaid_percentage` tinyint(3) unsigned DEFAULT NULL,
  `first_payment_percentage` tinyint(3) unsigned DEFAULT NULL,
  `first_payment_timing` tinyint(3) unsigned DEFAULT NULL,
  `net_payment_percentage` tinyint(3) unsigned DEFAULT NULL,
  `net_payment_timing` tinyint(3) unsigned DEFAULT NULL,
  `supplier` varchar(15) DEFAULT NULL,
  `msa_group` varchar(100) DEFAULT NULL,
  `shipping_calc_rule` varchar(50) DEFAULT NULL,
  `price_visible` tinyint(3) unsigned DEFAULT NULL,
  `discount_visible` tinyint(3) unsigned DEFAULT NULL,
  `preview_minutes` int(10) unsigned DEFAULT NULL,
  `coa` varchar(50) DEFAULT NULL,
  `built_in_freight` tinyint(3) unsigned DEFAULT NULL,
  `carrier` varchar(20) DEFAULT NULL,
  `event_display_format` varchar(25) DEFAULT NULL,
  `affinity` tinyint(3) unsigned DEFAULT NULL,
  `nordstrom_transfer` tinyint(3) unsigned DEFAULT NULL,
  `email_purchase_order_to` varchar(100) DEFAULT NULL,
  `first_received_in_warehouse_date` datetime DEFAULT NULL,
  `action` enum('INS','UPD','DEL') DEFAULT NULL,
  `action_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `idx_events_audit_action_date` (`action_date`,`event_id`)
) ENGINE=BLACKHOLE DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

