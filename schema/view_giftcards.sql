
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50001 DROP TABLE IF EXISTS `view_giftcards`*/;
/*!50001 DROP VIEW IF EXISTS `view_giftcards`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`hautelook`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_giftcards` AS select `order_items`.`order_id` AS `order_id`,`giftcards`.`giftcard_number` AS `card_number`,`giftcards`.`create_date` AS `create_date`,`giftcards`.`schedule_date` AS `schedule_date`,sum(coalesce(`giftcard_usage`.`amount`,0)) AS `redeemed`,(`giftcards`.`amount` - sum(coalesce(`giftcard_usage`.`amount`,0))) AS `balance`,if(((`giftcards`.`schedule_date` > 0) and (`giftcards`.`schedule_date` < now())),'Scheduled','Delivered') AS `card_order_status`,`giftcards`.`recipient_email` AS `recipient_email`,`giftcards`.`recipient_name` AS `recipient_name` from ((`giftcards` left join `giftcard_usage` on((`giftcards`.`giftcard_number` = `giftcard_usage`.`giftcard_number`))) left join `order_items` on((`giftcards`.`order_item_id` = `order_items`.`item_id`))) group by `giftcards`.`giftcard_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

