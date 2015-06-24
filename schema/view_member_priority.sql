
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50001 DROP VIEW IF EXISTS `view_member_priority`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`10.0.0.220` SQL SECURITY DEFINER */
/*!50001 VIEW `view_member_priority` AS select `members`.`member_id` AS `member_id`,(case when ((`orders`.`order_id` is not null) and (`members`.`last_visit` >= (curdate() - interval 30 day))) then 1 when ((`orders`.`order_id` is not null) and (`members`.`last_visit` < (curdate() - interval 30 day))) then 2 when (isnull(`orders`.`order_id`) and (`members`.`last_visit` >= (curdate() - interval 30 day))) then 3 when ((`members`.`join_date` >= (curdate() - interval 60 day)) and isnull(`orders`.`order_id`) and (`members`.`last_visit` > `members`.`join_date`) and (`members`.`last_visit` < (curdate() - interval 30 day))) then 4 when (((`members`.`join_date` <= (curdate() - interval 60 day)) and (cast(`members`.`last_visit` as date) = cast(`members`.`join_date` as date))) or (`members`.`last_visit` < (curdate() - interval 120 day))) then 6 when isnull(`orders`.`order_id`) then 5 else 7 end) AS `priority`,substring_index(`members`.`email`,_latin1'@',-(1)) AS `domain` from (`members` left join `orders` on((`members`.`member_id` = `orders`.`member_id`))) group by `members`.`member_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

