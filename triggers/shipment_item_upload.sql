
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER shipment_item_upload_ai AFTER INSERT
ON shipment_item_upload FOR EACH ROW
BEGIN

DECLARE is_casi_event int unsigned default 0;
DECLARE CONTINUE HANDLER FOR 1329
  SET is_casi_event = 0;

SELECT warehouse_id
INTO is_casi_event
FROM purchase_orders
WHERE event_id = NEW.event_id AND warehouse_id = 3
LIMIT 1;

IF (is_casi_event != 0 ) THEN

  INSERT IGNORE INTO shipment_items(shipment_id, order_id, event_id, sku, quantity, print_date)
  VALUES
  (NEW.shipment_id, NEW.order_id, NEW.event_id, NEW.sku, NEW.quantity, NEW.upload_date);

  UPDATE `events`
  SET event_status = 80
  WHERE event_id =  NEW.event_id AND event_status = 50;

  INSERT IGNORE INTO shipment_item_upload_exceptions(order_id, sku)
  SELECT return_items.order_id, return_items.sku
  FROM return_items INNER JOIN order_items USING(order_id, sku)
  WHERE return_item_status = 100 AND return_items.order_id = NEW.order_id AND return_items.sku = NEW.sku
  GROUP BY return_items.order_id, return_items.sku
  HAVING COUNT(*) > (SUM(ordered) - COUNT(*));

END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

