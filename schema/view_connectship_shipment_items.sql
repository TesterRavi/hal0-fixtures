
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50001 DROP TABLE IF EXISTS `view_connectship_shipment_items`*/;
/*!50001 DROP VIEW IF EXISTS `view_connectship_shipment_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`hautelook`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_connectship_shipment_items` AS select `shipment_items`.`shipment_id` AS `shipment_id`,`shipment_items`.`order_id` AS `order_id`,`shipment_items`.`event_id` AS `event_id`,`shipment_items`.`sku` AS `sku`,`shipment_items`.`quantity` AS `quantity`,`styles`.`name` AS `style_name`,`styles`.`country_iso` AS `country_iso`,`styles`.`fiber_content` AS `fiber_content`,if((`styles`.`weight` <= 0),0.1,`styles`.`weight`) AS `weight`,`styles`.`material` AS `material`,`inventory`.`sale_price` AS `sale_price`,`quads`.`vertical` AS `vertical`,`quads`.`department` AS `department`,`quads`.`category` AS `category`,`quads`.`subcategory` AS `subcategory`,if((`styles`.`hazmat_type` is not null),1,0) AS `hazmat` from ((((`shipment_items` join `inventory` on(((`inventory`.`event_id` = `shipment_items`.`event_id`) and (`inventory`.`sku` = `shipment_items`.`sku`)))) join `skus` on((`skus`.`sku` = `shipment_items`.`sku`))) join `styles` on((`styles`.`style_id` = `skus`.`style_id`))) join `quads` on((`quads`.`quad_id` = `styles`.`quad_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

