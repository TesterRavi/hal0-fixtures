
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50001 DROP VIEW IF EXISTS `view_gp_po_header`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`10.0.0.220` SQL SECURITY DEFINER */
/*!50001 VIEW `view_gp_po_header` AS select `view_gp_po_header_internal`.`po_id` AS `po_id`,`view_gp_po_header_internal`.`post_date` AS `po_date`,`view_gp_po_header_internal`.`description` AS `po_notes`,`view_gp_po_header_internal`.`region` AS `region`,`view_gp_po_header_internal`.`delivery_method` AS `delivery_method`,`view_gp_po_header_internal`.`supplier` AS `supplier`,`view_gp_po_header_internal`.`event_id` AS `event_id`,`view_gp_po_header_internal`.`confirm_with` AS `confirm_with`,`view_gp_po_header_internal`.`ship_method` AS `ship_method`,`view_gp_po_header_internal`.`event_type` AS `event_type`,`view_gp_po_header_internal`.`first_payment_percentage` AS `first_payment_percentage`,`view_gp_po_header_internal`.`first_payment_timing` AS `first_payment_timing`,`view_gp_po_header_internal`.`net_payment_percentage` AS `net_payment_percentage`,`view_gp_po_header_internal`.`net_payment_timing` AS `net_payment_timing` from `view_gp_po_header_internal` group by `view_gp_po_header_internal`.`po_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

