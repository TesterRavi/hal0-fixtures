
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50001 DROP VIEW IF EXISTS `view_gp_po_header_internal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`10.0.0.220` SQL SECURITY DEFINER */
/*!50001 VIEW `view_gp_po_header_internal` AS select `purchase_orders`.`po_id` AS `po_id`,cast(`purchase_orders`.`post_date` as char(19) charset utf8) AS `post_date`,cast(`purchase_orders`.`description` as char(70) charset utf8) AS `description`,`skus`.`sku` AS `sku`,`styles`.`style_num` AS `style_num`,`purchase_orders_line_items`.`purchased` AS `purchased`,`purchase_orders_line_items`.`cost` AS `cost`,`purchase_orders_line_items`.`line_nbr` AS `line_nbr`,if((`events`.`drop_ship` = _latin1'Y'),_utf8'drop_ship',_utf8'standard') AS `delivery_method`,`events`.`supplier` AS `supplier`,`events`.`event_id` AS `event_id`,`events`.`region` AS `region`,`events`.`event_type` AS `event_type`,nullif(1,1) AS `ship_method`,_utf8'shipping@hautelook.com' AS `confirm_with`,`events`.`first_payment_percentage` AS `first_payment_percentage`,`events`.`first_payment_timing` AS `first_payment_timing`,`events`.`net_payment_percentage` AS `net_payment_percentage`,`events`.`net_payment_timing` AS `net_payment_timing` from ((((`purchase_orders` join `events` on((`purchase_orders`.`event_id` = `events`.`event_id`))) join `purchase_orders_line_items` on((`purchase_orders`.`po_id` = `purchase_orders_line_items`.`po_id`))) join `skus` on((`purchase_orders_line_items`.`sku` = `skus`.`sku`))) join `styles` on((`skus`.`style_id` = `styles`.`style_id`))) where ((`events`.`supplier` <> _latin1'HAUTE1246') and (`purchase_orders`.`post_date` >= (curdate() - interval 14 day)) and (`purchase_orders`.`purchase_order_status` >= 50) and (((now() > `events`.`end_date`) and (`purchase_orders`.`post_date` >= `events`.`end_date`)) or (now() <= `events`.`end_date`))) order by `purchase_orders`.`purchase_order_status` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

