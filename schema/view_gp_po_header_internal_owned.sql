
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50001 DROP TABLE IF EXISTS `view_gp_po_header_internal_owned`*/;
/*!50001 DROP VIEW IF EXISTS `view_gp_po_header_internal_owned`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`hautelook`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_gp_po_header_internal_owned` AS select `purchase_orders`.`po_id` AS `po_id`,cast(`purchase_orders`.`post_date` as char(19) charset utf8) AS `post_date`,cast(`purchase_orders`.`description` as char(70) charset utf8) AS `description`,`skus`.`sku` AS `sku`,`styles`.`style_num` AS `style_num`,`purchase_orders_line_items`.`purchased` AS `purchased`,`purchase_orders_line_items`.`cost` AS `cost`,`purchase_orders_line_items`.`line_nbr` AS `line_nbr`,if((`events`.`drop_ship` = 'Y'),'drop_ship','standard') AS `delivery_method`,`events`.`supplier` AS `supplier`,`events`.`event_id` AS `event_id`,`events`.`region` AS `region`,`events`.`title` AS `title`,`events`.`event_type` AS `event_type`,nullif(1,1) AS `ship_method`,'shipping@hautelook.com' AS `confirm_with` from ((((`events` left join `purchase_orders` on((`purchase_orders`.`event_id` = `events`.`event_id`))) left join `purchase_orders_line_items` on((`purchase_orders`.`po_id` = `purchase_orders_line_items`.`po_id`))) left join `skus` on((`purchase_orders_line_items`.`sku` = `skus`.`sku`))) left join `styles` on((`skus`.`style_id` = `styles`.`style_id`))) where (`events`.`event_type` in ('owned_inv','pre_h','pre_event','pre_post_h')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

