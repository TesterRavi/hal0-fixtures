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
-- Temporary table structure for view `view_giftcards`
--

DROP TABLE IF EXISTS `view_giftcards`;
/*!50001 DROP VIEW IF EXISTS `view_giftcards`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_giftcards` (
  `order_id` tinyint NOT NULL,
  `card_number` tinyint NOT NULL,
  `create_date` tinyint NOT NULL,
  `schedule_date` tinyint NOT NULL,
  `redeemed` tinyint NOT NULL,
  `balance` tinyint NOT NULL,
  `card_order_status` tinyint NOT NULL,
  `recipient_email` tinyint NOT NULL,
  `recipient_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_giftcards`
--

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
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:06:09
