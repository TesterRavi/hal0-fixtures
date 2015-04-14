
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

