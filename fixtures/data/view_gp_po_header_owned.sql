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
-- Temporary table structure for view `view_gp_po_header_owned`
--

DROP TABLE IF EXISTS `view_gp_po_header_owned`;
/*!50001 DROP VIEW IF EXISTS `view_gp_po_header_owned`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_gp_po_header_owned` (
  `po_id` tinyint NOT NULL,
  `po_date` tinyint NOT NULL,
  `po_notes` tinyint NOT NULL,
  `region` tinyint NOT NULL,
  `delivery_method` tinyint NOT NULL,
  `supplier` tinyint NOT NULL,
  `event_id` tinyint NOT NULL,
  `confirm_with` tinyint NOT NULL,
  `ship_method` tinyint NOT NULL,
  `event_type` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `purchased` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_gp_po_header_owned`
--

/*!50001 DROP TABLE IF EXISTS `view_gp_po_header_owned`*/;
/*!50001 DROP VIEW IF EXISTS `view_gp_po_header_owned`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`hautelook`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_gp_po_header_owned` AS select `view_gp_po_header_internal_owned`.`po_id` AS `po_id`,`view_gp_po_header_internal_owned`.`post_date` AS `po_date`,`view_gp_po_header_internal_owned`.`description` AS `po_notes`,`view_gp_po_header_internal_owned`.`region` AS `region`,`view_gp_po_header_internal_owned`.`delivery_method` AS `delivery_method`,`view_gp_po_header_internal_owned`.`supplier` AS `supplier`,`view_gp_po_header_internal_owned`.`event_id` AS `event_id`,`view_gp_po_header_internal_owned`.`confirm_with` AS `confirm_with`,`view_gp_po_header_internal_owned`.`ship_method` AS `ship_method`,`view_gp_po_header_internal_owned`.`event_type` AS `event_type`,`view_gp_po_header_internal_owned`.`title` AS `title`,`view_gp_po_header_internal_owned`.`purchased` AS `purchased` from `view_gp_po_header_internal_owned` group by `view_gp_po_header_internal_owned`.`po_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:06:09
