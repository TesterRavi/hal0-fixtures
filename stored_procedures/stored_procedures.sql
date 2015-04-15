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
CREATE DEFINER=`root`@`localhost` FUNCTION `CONVERT_TO_BASE`(num BIGINT, base SMALLINT ) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
BEGIN
DECLARE chars CHAR(36) DEFAULT "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
DECLARE stream CHAR(32) DEFAULT "";
DECLARE res INT;
WHILE num > 0 DO
SET res = num % base;
SET num = num DIV base;
SET stream = CONCAT(MID( chars, res + 1, 1 ), stream);
END WHILE;
RETURN stream; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `correct_missing_short_urls_slash`(URL text) RETURNS text CHARSET latin1
    DETERMINISTIC
BEGIN

SET URL = REPLACE(URL, 'www2', 'www');

IF URL REGEXP '^http:/[^/]' = 1 THEN RETURN REPLACE(URL, 'http:/', 'http://');
ELSE RETURN URL;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_email_purchase_order_to`(vertical_param varchar(30), department_param varchar(30), category_param varchar(30)) RETURNS varchar(100) CHARSET latin1
    DETERMINISTIC
begin


CASE
  WHEN category_param IN('Shoes','Handbags') THEN return 'Shoes.HandbagsAP@hautelook.com';
  WHEN department_param = 'Baby & Kids' THEN return 'KidsAP@hautelook.com';
  WHEN vertical_param IN('Jewelry','Accessories') OR category_param IN('Watches','Watch') THEN return 'JewelryAP@hautelook.com';
  WHEN vertical_param = 'Apparel' THEN return 'ApparelAP@hautelook.com';
  WHEN vertical_param = 'Home' THEN return 'HomeAP@hautelook.com';
  WHEN vertical_param = 'Beauty' THEN return 'BeautyAP@hautelook.com';
  ELSE return '';

END CASE;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_item_net_ordered`(dirty_item_id INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN

DECLARE v_net_ordered int signed default 0;

DECLARE CONTINUE HANDLER FOR 1329
  SET v_net_ordered = NULL;


SELECT (order_items.ordered - COALESCE(SUM(return_items.item_id IS NOT NULL AND return_items.return_item_status > 10), 0) - COALESCE(SUM(shipment_items.quantity), 0)) AS net_ordered

INTO v_net_ordered

FROM order_items
LEFT JOIN return_items ON order_items.order_id = return_items.order_id AND order_items.sku = return_items.sku
LEFT JOIN shipment_items ON shipment_items.order_id = order_items.order_id AND shipment_items.sku = order_items.sku

WHERE order_items.item_id = dirty_item_id
GROUP BY order_items.item_id;

RETURN v_net_ordered;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_item_purchase_order_status`(dirty_item_id INT UNSIGNED) RETURNS varchar(20) CHARSET latin1
    DETERMINISTIC
    COMMENT 'Has the purchase order associated with this order item been crea'
BEGIN

DECLARE v_po_status enum('posted', 'received', 'in_transit') default null;

DECLARE CONTINUE HANDLER FOR 1329
  SET v_po_status = NULL;

SELECT
CASE WHEN purchase_orders.received_date != 0 THEN 'received'
     WHEN purchase_orders.in_transit_date != 0 THEN 'in_transit'
     WHEN purchase_orders.post_date != 0 THEN 'posted'
     ELSE NULL END AS po_status

   INTO v_po_status
   FROM purchase_orders
   INNER JOIN order_items USING(event_id)
   INNER JOIN `events` USING(event_id)
   WHERE order_items.item_id = dirty_item_id
     AND purchase_orders.purchase_order_status > 10
     AND ((NOW() > `events`.end_date AND purchase_orders.post_date >= `events`.end_date) OR (NOW() <= `events`.end_date))
   ORDER BY purchase_orders.po_id DESC
   LIMIT 1;

RETURN v_po_status;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_item_return_status`(dirty_item_id INT UNSIGNED) RETURNS varchar(20) CHARSET latin1
    DETERMINISTIC
    COMMENT 'What is the quantity of this item that has not been returned pre'
BEGIN

DECLARE v_ordered, v_complete_returns, v_complete_cancellations int unsigned default 0;
DECLARE v_status ENUM('returned', 'cancelled') default null;

DECLARE CONTINUE HANDLER FOR 1329
  SET v_status = NULL;


SELECT order_items.ordered, SUM(return_items.item_id IS NOT NULL AND return_items.return_item_status = 100) AS complete_returns,
SUM(return_items.item_id IS NOT NULL AND return_items.return_item_status = 100 AND return_items.timeframe in('pre_ship', 'during_sale')) AS complete_cancellations

INTO v_ordered, v_complete_returns, v_complete_cancellations

FROM order_items LEFT JOIN return_items USING(order_id, sku)

WHERE order_items.item_id = dirty_item_id
GROUP BY order_items.item_id;

  CASE WHEN (v_ordered - IF(v_complete_returns > v_ordered, v_ordered, v_complete_returns)) > 0 THEN SET v_status = NULL;
       WHEN (v_ordered - IF(v_complete_cancellations > v_ordered, v_ordered, v_complete_cancellations)) <= 0 THEN SET v_status = 'cancelled';
       ELSE SET v_status = 'returned';
  END CASE;


RETURN v_status;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_item_shipment_status`(dirty_item_id INT UNSIGNED) RETURNS varchar(30) CHARSET latin1
    DETERMINISTIC
    COMMENT 'Has the purchase order associated with this order item been crea'
BEGIN

DECLARE v_shipment_status enum('returned_to_shipper', 'delivered', 'delivery_attempt', 'shipped', 'picked', 'partially_received') default null;

DECLARE CONTINUE HANDLER FOR 1329
  SET v_shipment_status = NULL;



SELECT
CASE
 WHEN shipment_tracking.delivery_date > 0 AND return_to_shipper_date > 0 THEN 'returned_to_shipper'
 WHEN shipment_tracking.delivery_date > 0 AND return_to_shipper_date = 0 THEN 'delivered'
 WHEN shipment_tracking.delivery_attempt_date > shipment_tracking.delivery_date THEN 'delivery_attempt'
 WHEN shipment_tracking.delivery_date = 0 AND  shipment_tracking.return_to_shipper_date = 0 AND shipment_tracking.delivery_attempt_date = 0 AND shipment_tracking.ship_date > 0 THEN 'shipped'
 WHEN shipment_items.shipment_id IS NOT NULL AND (shipment_tracking.shipment_id IS NULL OR shipment_tracking.ship_date = 0) THEN 'picked'
 WHEN shipment_items.shipment_id IS NULL AND ((SELECT COUNT(1) AS shipment_item_cnt FROM shipment_items WHERE event_id = order_items.event_id GROUP BY event_id) > 0) THEN 'partially_received'
 ELSE null
END AS shipment_status

INTO v_shipment_status

FROM order_items

LEFT JOIN shipment_items USING(order_id, sku)
LEFT JOIN shipment_tracking USING(shipment_id)

WHERE order_items.item_id = dirty_item_id
GROUP BY order_items.item_id;

RETURN v_shipment_status;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_order_items_status`(dirty_item_id int unsigned) RETURNS varchar(20) CHARSET latin1
    DETERMINISTIC
    COMMENT 'What is the status of this order item?'
BEGIN

  DECLARE oi_status varchar(20) DEFAULT 'unknown';
  DECLARE v_po_status enum('posted', 'received', 'in_transit') default null;
  DECLARE v_shipment_status enum('returned_to_shipper', 'delivered', 'delivery_attempt', 'shipped', 'picked', 'partially_received') default null;
  DECLARE v_returned ENUM('returned', 'cancelled') default null;

  SET v_po_status = get_item_purchase_order_status(dirty_item_id);
  SET v_returned = get_item_return_status(dirty_item_id);
  SET v_shipment_status = get_item_shipment_status(dirty_item_id);



  CASE
    WHEN v_returned = 'returned' THEN SET oi_status = 'returned';
    WHEN v_returned = 'cancelled' THEN SET oi_status = 'cancelled';
    WHEN v_shipment_status = 'returned_to_shipper' THEN SET oi_status = 'returned_to_shipper';
    WHEN v_shipment_status = 'delivered' THEN SET oi_status = 'delivered';
    WHEN v_shipment_status = 'delivery_attempt' THEN SET oi_status = 'delivery_attempt';
    WHEN v_shipment_status = 'shipped' THEN SET oi_status = 'shipped';
    WHEN v_shipment_status = 'picked' THEN SET oi_status = 'picked';
    WHEN v_shipment_status = 'partially_received' THEN SET oi_status = 'partially_received';
    WHEN v_po_status = 'received' THEN SET oi_status = 'received';
    WHEN v_po_status = 'in_transit' THEN SET oi_status = 'in_transit';
    WHEN v_po_status = 'posted' THEN SET oi_status = 'po_sent';
    WHEN v_po_status IS NULL THEN SET oi_status = 'open';
    ELSE SET oi_status = 'unknown';
  END CASE;

  RETURN oi_status;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purchase_order_id`(event_id_param int unsigned) RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE v_po_id int unsigned default null;

DECLARE CONTINUE HANDLER FOR 1329
  SET v_po_id = null;


SELECT purchase_orders.po_id
  INTO v_po_id
FROM purchase_orders
INNER JOIN `events` USING(event_id)
WHERE `events`.event_id = event_id_param
    AND purchase_orders.purchase_order_status >= 75
    AND purchase_orders.received_date > 0
    AND ((NOW() > `events`.end_date AND purchase_orders.post_date >= `events`.end_date) OR (NOW() <= `events`.end_date))
ORDER BY purchase_orders.po_id DESC
LIMIT 1;

RETURN v_po_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_authnet_log`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
into purgeable
from authnet_log
where create_date < current_date() - interval 1 month;

RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_avatax_log`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
into purgeable
from avatax_log
where create_date < current_date() - interval 3 month;

RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_bill_me_later_log`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
INTO purgeable
from bill_me_later_log
where create_date < CURRENT_DATE() - INTERVAL 3 MONTH;


RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_cart_items`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
into purgeable
from cart_items
where expires_at < CURRENT_DATE();

RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_error_log`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
INTO purgeable
from error_log
where `timestamp` < current_date() - interval 1 month;


RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_events_members`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
INTO purgeable
from `events` inner join events_members using(event_id)
where events.end_date < now();


RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_litle_log`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
into purgeable
from litle_log where create_date < current_date() - interval 3 MONTH;

RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_mas_log`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
INTO purgeable
from mas_log
where create_date < current_date() - interval 1 month;


RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_member_logins`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
INTO purgeable
from member_logins
where login_date < current_date();

RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_merchant_account_transactions`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
into purgeable
from merchant_account_transactions where create_date < current_date() - interval 3 MONTH;

RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_paypal_log`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
INTO purgeable
from paypal_log
where create_date < CURRENT_DATE() - INTERVAL 3 MONTH;


RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_returns_log`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
into purgeable
from returns_log
where `timestamp` < current_date() - interval 1 month;

RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_return_items`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
INTO purgeable
from return_items
where return_item_status = 25 AND modify_date < NOW() - interval 30 minute;


RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_shipment_item_upload`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
into purgeable
from shipment_item_upload
where upload_date < current_date();

RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_purgeable_ups_quality_shipment`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE purgeable int UNSIGNED default 0;

select count(*)
INTO purgeable
from ups_quality_shipment
where create_date < current_date() - interval 3 month;


RETURN purgeable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_shipment_id`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN

DECLARE new_shipment_id int unsigned default 0;










  INSERT IGNORE INTO shipments
  SET delivery_method = 'standard';

  SELECT last_insert_id() INTO new_shipment_id;



RETURN new_shipment_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_ship_method_id_by_carrier`(ship_method_param varchar(45)) RETURNS int(10) unsigned
    DETERMINISTIC
begin

RETURN IF(ship_method_param NOT REGEXP 'USPS', NULL, 37);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_event_multipriced`(event_id_param int unsigned) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN

  DECLARE v_status BOOL DEFAULT false;

  DECLARE CONTINUE HANDLER FOR 1329
    SET v_status = false;

  SELECT true AS multipriced
  INTO v_status
  FROM inventory
    INNER JOIN skus USING(sku)
    INNER JOIN styles USING(style_id)
  WHERE inventory.event_id = event_id_param
  GROUP BY inventory.event_id, styles.style_id
  HAVING COUNT(DISTINCT sale_price) > 1;

  RETURN v_status;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_parent`(event_id_param int unsigned) RETURNS tinyint(3) unsigned
    DETERMINISTIC
BEGIN

DECLARE v_is_parent int unsigned default null;
DECLARE no_resultset condition for 1329;

DECLARE CONTINUE HANDLER FOR 1329
  SET v_is_parent = 0;

SELECT 1 as parent
INTO v_is_parent
FROM `events`
WHERE parent_id = event_id_param
LIMIT 1;

RETURN v_is_parent;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `WORK_DATE_ADD`(dirty_focal_date date, dirty_day_increment int unsigned) RETURNS date
    DETERMINISTIC
    COMMENT 'Increment date by work days'
BEGIN

DECLARE day_increment int unsigned default 1;
DECLARE desired_date date default null;

add_work_days: LOOP

SET desired_date = (dirty_focal_date + interval day_increment day);

IF WORK_DATE_DIFF(desired_date, dirty_focal_date) = dirty_day_increment THEN
  LEAVE add_work_days;
ELSE
  SET day_increment = day_increment + 1;
END IF;

END LOOP add_work_days;

RETURN desired_date;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `WORK_DATE_DIFF`(b date, a date) RETURNS int(11)
    DETERMINISTIC
    COMMENT 'working day difference for 2 dates'
BEGIN
DECLARE freedays int;
SET freedays = 0;

SET @x = DATEDIFF(b, a);
IF @x<0 THEN
SET @m = a;
SET a = b;
SET b = @m;
SET @m = -1;
ELSE
SET @m = 1;
END IF;
SET @x = abs(@x) + 1;

SET @w1 = WEEKDAY(a)+1;
SET @wx1 = 8-@w1;
IF @w1>5 THEN
SET @w1 = 0;
ELSE
SET @w1 = 6-@w1;
END IF;

SET @wx2 = WEEKDAY(b)+1;
SET @w2 = @wx2;
IF @w2>5 THEN
SET @w2 = 5;
END IF;

SET @weeks = (@x-@wx1-@wx2)/7;
SET @noweekends = (@weeks*5)+@w1+@w2;

SET @result = @noweekends-freedays;
RETURN (@result*@m) - 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_zero_out_giftcard`(in giftcard_number_param varchar(30))
BEGIN

SET @gn = giftcard_number_param;

PREPARE log_stmt FROM
'INSERT IGNORE INTO admin_zero_out_giftcard_log(giftcard_number, previous_amount)
SELECT giftcard_number, amount
FROM giftcards
WHERE giftcard_number = ?';

EXECUTE log_stmt USING @gn;

PREPARE stmt FROM
'UPDATE giftcards
SET amount = 0.00
WHERE giftcard_number = ?';

EXECUTE stmt USING @gn;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `business_skus_map_delete_sku`(
  IN _sku int(10) unsigned
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM business_skus_map
    WHERE sku = _sku
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `business_skus_map_delete_style`(
  IN _style_id int(10) unsigned
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM business_skus_map
    WHERE sku IN (
      SELECT sku
      FROM skus
      WHERE style_id = _style_id
    )
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `business_skus_map_put_sku`(
  IN _style_id int(10) unsigned,
  IN _sku int(10) unsigned
)
    MODIFIES SQL DATA
BEGIN
    REPLACE business_skus_map (
      sku,
      business_division_id,
      business_department_id,
      business_department_cd,
      business_class_id,
      business_class_cd,
      business_subclass_id,
      business_subclass_cd,
      is_active_flag,
      concurrent_version_no,
      created_by_user_id
    )
    SELECT
      _sku,
      bqm.business_division_id,
      bqm.business_department_id,
      bqm.business_department_cd,
      bqm.business_class_id,
      bqm.business_class_cd,
      bqm.business_subclass_id,
      bqm.business_subclass_cd,
      'Y', 
      0, 
      0 
    FROM styles
    JOIN business_quad_map bqm ON bqm.quad_id = styles.quad_id
    WHERE
      styles.style_id = _style_id
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `business_skus_map_put_style_quad`(
  IN _style_id int(10) unsigned,
  IN _quad_id int(11)
)
    MODIFIES SQL DATA
BEGIN
    REPLACE business_skus_map (
      sku,
      business_division_id,
      business_department_id,
      business_department_cd,
      business_class_id,
      business_class_cd,
      business_subclass_id,
      business_subclass_cd,
      is_active_flag,
      concurrent_version_no,
      created_by_user_id
    )
    SELECT
      skus.sku,
      bqm.business_division_id,
      bqm.business_department_id,
      bqm.business_department_cd,
      bqm.business_class_id,
      bqm.business_class_cd,
      bqm.business_subclass_id,
      bqm.business_subclass_cd,
      'Y', 
      0, 
      0 
    FROM skus
    JOIN business_quad_map bqm ON bqm.quad_id = _quad_id
    WHERE skus.style_id = _style_id
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_negative_return_credits`()
begin

CALL clean_negative_return_credits_rollback();
CALL clean_negative_return_credits_step_1();
CALL clean_negative_return_credits_step_2();

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_negative_return_credits_certify`()
begin

select member_id
, SUM(amount) as remaining_credit_balance
, SUM(IF(`type` = 1, amount, 0)) as sponsor_credit_balance
, SUM(IF(`type` = 2, amount, 0)) as return_credit_balance
, SUM(IF(`type` = 3, amount, 0)) as compensation_credit_balance
, SUM(IF(`type` = 4, amount, 0)) as award_credit_balance
FROM ledger
GROUP BY member_id
HAVING return_credit_balance < 0 AND remaining_credit_balance >= 0;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_negative_return_credits_rollback`()
begin

declare table_missing condition for 1146;

declare exit handler for table_missing
BEGIN


CREATE TABLE IF NOT EXISTS clean_negative_return_credits_log
(
  member_id int unsigned
  , credit_debit varchar(6)
  , ledger_type tinyint unsigned
  , amount decimal(10, 2)
  , employee_id int unsigned default 0
  , notes varchar(15) default 'EXPCRED_23'
  , log_date timestamp not null default current_timestamp
) engine = innodb default charset=latin1;

END;

delete ignore ledger, clean_negative_return_credits_log
from clean_negative_return_credits_log
inner join ledger on ledger.member_id = clean_negative_return_credits_log.member_id
  AND ledger.create_date = clean_negative_return_credits_log.log_date
  AND ledger.employee_id = clean_negative_return_credits_log.employee_id
  AND ledger.credit_debit = clean_negative_return_credits_log.credit_debit
  AND ledger.`type` = clean_negative_return_credits_log.ledger_type
  AND ledger.amount = clean_negative_return_credits_log.amount
  AND ledger.notes = clean_negative_return_credits_log.notes;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_negative_return_credits_step_1`()
begin


CREATE TABLE IF NOT EXISTS clean_negative_return_credits
(
  member_id int unsigned primary key
  , remaining_credit_balance decimal(10, 2) not null default 0
  , sponsor_credit_balance decimal(10, 2) not null default 0
  , return_credit_balance decimal(10, 2) not null default 0
  , compensation_credit_balance decimal(10, 2) not null default 0
  , award_credit_balance decimal(10, 2) not null default 0
  , clean_date timestamp not null default current_timestamp
) ENGINE = INNODB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO clean_negative_return_credits(member_id, remaining_credit_balance, sponsor_credit_balance, return_credit_balance, compensation_credit_balance, award_credit_balance)
select member_id
, SUM(amount) as remaining_credit_balance
, SUM(IF(`type` = 1, amount, 0)) as sponsor_credit_balance
, SUM(IF(`type` = 2, amount, 0)) as return_credit_balance
, SUM(IF(`type` = 3, amount, 0)) as compensation_credit_balance
, SUM(IF(`type` = 4, amount, 0)) as award_credit_balance
FROM ledger
GROUP BY member_id
HAVING return_credit_balance < 0 AND remaining_credit_balance >= 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_negative_return_credits_step_2`()
begin


DECLARE done bool default false;
DECLARE v_member_id, v_employee_id int unsigned default 0;
DECLARE v_sponsor_credit_balance, v_return_credit_balance, v_compensation_credit_balance, v_award_credit_balance, v_remaining_adj_balance decimal(10, 2) default 0;

DECLARE cur CURSOR FOR
SELECT member_id, sponsor_credit_balance, return_credit_balance, compensation_credit_balance, award_credit_balance
FROM clean_negative_return_credits;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = TRUE;


SELECT member_id
FROM members WHERE email = 'clean_credit@hautelook.com'
INTO v_employee_id;


OPEN cur;

clean_by_member: LOOP

FETCH cur INTO v_member_id, v_sponsor_credit_balance, v_return_credit_balance, v_compensation_credit_balance, v_award_credit_balance;
IF done THEN CLOSE cur; LEAVE clean_by_member; END IF;

SET v_remaining_adj_balance = ABS(v_return_credit_balance);


IF v_remaining_adj_balance > 0 AND v_sponsor_credit_balance > 0 THEN
BEGIN

SET v_sponsor_credit_balance = IF(v_remaining_adj_balance < v_sponsor_credit_balance, v_remaining_adj_balance, v_sponsor_credit_balance);
SET v_remaining_adj_balance = v_remaining_adj_balance - v_sponsor_credit_balance;

INSERT INTO clean_negative_return_credits_log(member_id, credit_debit, ledger_type, amount, employee_id)
VALUES(v_member_id, 'debit', 1, (-1 * v_sponsor_credit_balance), v_employee_id);

INSERT INTO clean_negative_return_credits_log(member_id, credit_debit, ledger_type, amount, employee_id)
VALUES(v_member_id, 'credit', 2, v_sponsor_credit_balance, v_employee_id);

END;
END IF;


IF v_remaining_adj_balance > 0 AND v_compensation_credit_balance > 0 THEN
BEGIN

SET v_compensation_credit_balance = IF(v_remaining_adj_balance < v_compensation_credit_balance, v_remaining_adj_balance, v_compensation_credit_balance);
SET v_remaining_adj_balance = v_remaining_adj_balance - v_compensation_credit_balance;

INSERT INTO clean_negative_return_credits_log(member_id, credit_debit, ledger_type, amount, employee_id)
VALUES(v_member_id, 'debit', 3, (-1 * v_compensation_credit_balance), v_employee_id);

INSERT INTO clean_negative_return_credits_log(member_id, credit_debit, ledger_type, amount, employee_id)
VALUES(v_member_id, 'credit', 2, v_compensation_credit_balance, v_employee_id);

END;
END IF;



IF v_remaining_adj_balance > 0 AND v_award_credit_balance > 0 THEN
BEGIN

SET v_award_credit_balance = IF(v_remaining_adj_balance < v_award_credit_balance, v_remaining_adj_balance, v_award_credit_balance);
SET v_remaining_adj_balance = v_remaining_adj_balance - v_award_credit_balance;

INSERT INTO clean_negative_return_credits_log(member_id, credit_debit, ledger_type, amount, employee_id)
VALUES(v_member_id, 'debit', 4, (-1 * v_award_credit_balance), v_employee_id);

INSERT INTO clean_negative_return_credits_log(member_id, credit_debit, ledger_type, amount, employee_id)
VALUES(v_member_id, 'credit', 2, v_award_credit_balance, v_employee_id);

END;
END IF;

END LOOP clean_by_member;

INSERT IGNORE INTO ledger(member_id, credit_debit, `type`, amount, employee_id, notes, create_date)
select member_id, credit_debit, ledger_type, amount, employee_id, notes, log_date
from clean_negative_return_credits_log;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `extend_promo`(p_group VARCHAR(25), p_end_date DATETIME, until_date DATETIME)
BEGIN

DECLARE done, loop_count, day_count INT DEFAULT 0;
DECLARE c_promo_section, c_promo_resource, c_promo_group, c_promo_placement, c_url, c_promo_url_action, c_promo_type, c_promo_gender, c_event_tab VARCHAR(100);
DECLARE c_start_date, c_end_date, c_modified_date DATETIME;
DECLARE c_active, c_promo_placement_sort INT;
DECLARE c_notes TEXT;

DECLARE cur1 CURSOR FOR                       
    SELECT * FROM promos WHERE promo_group = p_group AND end_date = p_end_date;
    
DECLARE cur2 CURSOR FOR                       
    SELECT * FROM promos_event_tabs WHERE promo_group = p_group AND end_date = p_end_date;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

open cur1;

read_loop: LOOP

    FETCH cur1 INTO c_promo_section, c_promo_resource, c_promo_group, c_promo_placement, c_url, c_promo_url_action, c_promo_type, 
                    c_start_date, c_end_date, c_active, c_promo_gender, c_promo_placement_sort, c_notes, c_modified_date;
    IF done = 1 
        THEN LEAVE read_loop; 
    END IF;
    
    SELECT datediff(until_date, c_end_date) INTO loop_count;
    
    SET day_count = 1;   
    
    WHILE loop_count > 0 DO
    
        INSERT INTO promos VALUES (
            c_promo_section, c_promo_resource, c_promo_group, c_promo_placement, c_url, c_promo_url_action, c_promo_type, 
            adddate(c_start_date, INTERVAL day_count day), adddate(c_end_date, INTERVAL day_count day), c_active, c_promo_gender, 
            c_promo_placement_sort, c_notes, null
        );
        
        SET loop_count = loop_count - 1;                           
        SET day_count = day_count + 1;                           
    
    END WHILE;
    
end loop;

close cur1;

SET done = 0;

open cur2;

read_loop2: LOOP

    FETCH cur2 INTO c_promo_section, c_promo_resource, c_promo_group, c_promo_placement, c_url, c_start_date, c_end_date, 
                    c_promo_gender, c_event_tab, c_promo_type;
    IF done = 1 
        THEN LEAVE read_loop2; 
    END IF;
    
    SELECT datediff(until_date, c_end_date) INTO loop_count;
    
    SET day_count = 1;   
    
    WHILE loop_count > 0 DO
    
        INSERT INTO promos_event_tabs VALUES (
            c_promo_section, c_promo_resource, c_promo_group, c_promo_placement, c_url, adddate(c_start_date, INTERVAL day_count day),
            adddate(c_end_date, INTERVAL day_count day), c_promo_gender, c_event_tab, c_promo_type
        );
        
        SET loop_count = loop_count - 1;                           
        SET day_count = day_count + 1;                           
    
    END WHILE;
    
end loop;

close cur2;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_anniversary_coupons`()
BEGIN

DECLARE count INT DEFAULT 0;

while count < 50 do
    SET count = count + 1;
    INSERT IGNORE INTO coupons 
        (coupon_code, coupon_type, amount, max_discount, employee_use, start_date, expiration_date)
    VALUES  
        
        
		(concat('30pctOFF', cast(substring(md5(rand()), -3) as char)), 'percent_off', 30.00,  250.00, 1, '2012-10-11', 
        '2013-10-11 23:59:59');
end while; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_building_bins`()
begin

INSERT INTO building_bins(building_bin, building)
SELECT building_bin, building
FROM gp_building_bins
ON DUPLICATE KEY UPDATE building = VALUES(building);

TRUNCATE TABLE gp_building_bins;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_dglp`(landing_page_param varchar(100), resource_type_param varchar(15), resource_param varchar(100), resource_style_param varchar(100), section_param varchar(25), template_param varchar(100))
BEGIN

DECLARE EXIT HANDLER FOR 1329
  begin select 'Either section or template does not exist in parent tables'; end;

SET @landing_page_param = landing_page_param;
SET @resource_type_param = resource_type_param;
SET @resource_param = resource_param;
SET @resource_style_param = resource_style_param;
SET @section_param = section_param;
SET @template_param = template_param;

IF section_param IS NOT NULL THEN

SELECT section
FROM dglp_sections
WHERE section = @section_param
into @section_param;

END IF;

IF template_param IS NOT NULL THEN

SELECT template
FROM dglp_templates
WHERE template = @template_param
into @template_param;

PREPARE insert_update_stmt FROM
'INSERT INTO dglp_landing_pages(landing_page, template)
VALUES(?, ?)
ON DUPLICATE KEY UPDATE template = VALUES(template)';

EXECUTE insert_update_stmt USING @landing_page_param, @template_param;

END IF;



PREPARE insert_ignore_stmt FROM
'INSERT IGNORE INTO dglp_resources(resource_type, resource)
VALUES(?, ?)';

PREPARE replace_stmt FROM
'REPLACE INTO dglp_landing_pages_dglp_resources(landing_page, resource_type, resource, resource_style, section)
VALUES
(?, ?, ?, ?, ?)';


EXECUTE insert_ignore_stmt USING @resource_type_param, @resource_param;
EXECUTE replace_stmt USING @landing_page_param, @resource_type_param, @resource_param, @resource_style_param, @section_param;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_gp_approved_skus_for_skus_building_bins`(in date_param date)
begin

DECLARE low_date, high_date datetime;


CALL get_inventory_accuracy_date_range(date_param, low_date, high_date);

DROP TABLE IF EXISTS gp_approved_skus_for_skus_building_bins;
CREATE TABLE IF NOT EXISTS gp_approved_skus_for_skus_building_bins(sku int unsigned, event_id int unsigned, primary key(sku, event_id));

INSERT IGNORE INTO gp_approved_skus_for_skus_building_bins(sku, event_id)
SELECT inventory.sku, inventory.event_id
FROM `events`
INNER JOIN inventory USING(event_id)
WHERE event_type IN('pre_event', 'owned_inv')
AND start_date BETWEEN low_date AND high_date;

DELETE IGNORE skus_building_bins FROM gp_approved_skus_for_skus_building_bins INNER JOIN skus_building_bins USING(sku, event_id);


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_gp_approved_skus_for_skus_building_bins_by_event`(IN event_id_param INT UNSIGNED)
begin

DROP TABLE IF EXISTS gp_approved_skus_for_skus_building_bins;
CREATE TABLE IF NOT EXISTS gp_approved_skus_for_skus_building_bins(sku int unsigned, event_id int unsigned, primary key(sku, event_id));

INSERT IGNORE INTO gp_approved_skus_for_skus_building_bins(sku, event_id)
SELECT inventory.sku, inventory.event_id
FROM `events`
INNER JOIN inventory USING(event_id)
LEFT JOIN skus_building_bins USING(sku)
WHERE inventory.event_id = event_id_param
AND skus_building_bins.sku IS NULL;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_internal_coupon_codes`(in prefix_param varchar(10), in number_of_coupons_param int unsigned )
begin

DECLARE coupon_counter int unsigned default 0;


drop table if exists internal_coupon_codes;
create table internal_coupon_codes
(
  coupon_code varchar(25) primary key
) engine = myisam default charset=latin1 row_format=fixed;


IF number_of_coupons_param > 100000 OR number_of_coupons_param <= 0 THEN
 SET number_of_coupons_param = 1;
END IF;



generate_coupon_codes: LOOP
IF coupon_counter < number_of_coupons_param THEN SET coupon_counter = coupon_counter + 1; ELSE LEAVE generate_coupon_codes; END IF;
insert ignore into internal_coupon_codes(coupon_code)
select CONCAT(prefix_param, CONVERT_TO_BASE(coupon_counter, 36), UPPER(CAST(SUBSTRING(MD5(RAND()), -2) AS char(2))));

END LOOP generate_coupon_codes;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_manual_ship`(in event_id_param int unsigned)
begin

set @event_id = event_id_param;

drop table if exists OPEN_ORDER_ITEMS;
create table if not exists OPEN_ORDER_ITEMS(order_id int unsigned, event_id int unsigned, sku int unsigned, ordered int unsigned, key(order_id, sku, event_id));

prepare stmt from
"INSERT IGNORE INTO OPEN_ORDER_ITEMS(order_id, event_id, sku, ordered)
select order_id, event_id, sku, ordered
from order_items
where event_id IN(?)
  and get_order_items_status(item_id) NOT IN('shipped','delivered','returned','cancelled','returned_to_shipper');";

execute stmt using @event_id;

INSERT IGNORE INTO shipment_tracking (shipment_id, tracking_num, ship_date, delivery_date, email_notification_date, email_notification_type, source)
SELECT shipment_items.shipment_id, 'MANUAL SHIP' as tracking_num, current_date() as ship_date, current_date() as delivery_date, current_date() as email_notification_date, 'full' as email_notification_type, 'connect_ship' as source
FROM OPEN_ORDER_ITEMS
INNER JOIN shipment_items USING(order_id, sku, event_id);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_mass_promos_manual`()
begin

DECLARE counter int unsigned default 0;

SET @promo_date = 0;

testing: LOOP

SET counter = counter + 1;
IF counter > 345 THEN
  LEAVE testing;
END IF;

select '2012-01-21' + interval counter day into @promo_date;
call generate_promos_bottom_promo(concat(@promo_date, ' 00:00:00'), concat(@promo_date,' 23:59:59'));

END LOOP testing;

select counter, @promo_date;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_promos_bottom_promo`(in start_date_param datetime, in end_date_param datetime)
begin

SET @start_date = start_date_param;
SET @end_date = end_date_param;
SELECT concat(DATE_FORMAT(@start_date, '%y%m%d%h%i%s'), '_DB') INTO @promo_group;


insert ignore into promo_groups(promo_group, description)
values(@promo_group, concat('bottom_promo auto generated at ', NOW()));


insert ignore into promos(promo_section, promo_resource, promo_group, promo_placement, url, promo_url_action, promo_type, start_date, end_date, active, promo_placement_sort, notes)
values
('event_page', 'Mobile_NewGrid.jpg', @promo_group, 'bottom_promo', 'http://www.hautelook.com/apps/iphone', '_self', 'standard', @start_date, @end_date, 1, null , '');

insert ignore into promos_event_tabs(promo_section, promo_resource, promo_group, promo_placement, url, start_date, end_date, event_tab)
values
('event_page', 'Mobile_NewGrid.jpg', @promo_group, 'bottom_promo', 'http://www.hautelook.com/apps/iphone', @start_date, @end_date, 'All Events'),
('event_page', 'Mobile_NewGrid.jpg', @promo_group, 'bottom_promo', 'http://www.hautelook.com/apps/iphone', @start_date, @end_date, 'Beauty'),
('event_page', 'Mobile_NewGrid.jpg', @promo_group, 'bottom_promo', 'http://www.hautelook.com/apps/iphone', @start_date, @end_date, 'Home'),
('event_page', 'Mobile_NewGrid.jpg', @promo_group, 'bottom_promo', 'http://www.hautelook.com/apps/iphone', @start_date, @end_date, 'Kids'),
('event_page', 'Mobile_NewGrid.jpg', @promo_group, 'bottom_promo', 'http://www.hautelook.com/apps/iphone', @start_date, @end_date, 'Men'),
('event_page', 'Mobile_NewGrid.jpg', @promo_group, 'bottom_promo', 'http://www.hautelook.com/apps/iphone', @start_date, @end_date, 'Women');

insert ignore into promos_genders(promo_section, promo_resource, promo_group, promo_placement, url, start_date, end_date, gender)
values
('event_page', 'Mobile_NewGrid.jpg', @promo_group, 'bottom_promo', 'http://www.hautelook.com/apps/iphone', @start_date, @end_date, 'F'),
('event_page', 'Mobile_NewGrid.jpg', @promo_group, 'bottom_promo', 'http://www.hautelook.com/apps/iphone', @start_date, @end_date, 'M');

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_promos_grid_promo_large`(in start_date_param datetime, in end_date_param datetime)
begin

SET @start_date = start_date_param;
SET @end_date = end_date_param;
SELECT concat(DATE_FORMAT(@start_date, '%y%m%d%h%i%s'), '_DB'), concat(DATE_FORMAT(@start_date, '%y%m%d%h%i%s'), '_DBhack')
INTO @promo_group, @promo_group2;


insert ignore into promo_groups(promo_group, description)
values
(@promo_group, concat('grid_promo auto generated at ', NOW())),
(@promo_group2, concat('grid_promo auto generated at ', NOW()));

insert ignore into promos(promo_section, promo_resource, promo_group, promo_placement, url, promo_url_action, promo_type, start_date, end_date, active, promo_placement_sort, notes)
values
('event_page', 'InviteAFriend_Home_lrg1.jpg', @promo_group, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, null , null),
('event_page', 'InviteAFriend_Kids_lrg2.jpg', @promo_group, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, null , null),
('event_page', 'InviteAFriend_Men_Winter_lrg2.jpg', @promo_group, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, null , null),
('event_page', 'InviteAFriend_Women_Winter_lrg2.jpg', @promo_group2, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, null , null),
('event_page', 'InviteAFriend_Women_Winter_lrg2.jpg', @promo_group, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, null , null),
('event_page', 'InviteAFriend_Men_Winter_lrg2.jpg', @promo_group2, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, null , null);

insert ignore into promos_event_tabs(promo_section, promo_resource, promo_group, promo_placement, url, start_date, end_date, event_tab)
values
('event_page', 'InviteAFriend_Home_lrg1.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'Home'),
('event_page', 'InviteAFriend_Kids_lrg2.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'Kids'),
('event_page', 'InviteAFriend_Men_Winter_lrg2.jpg', @promo_group, 'grid_promo','', @start_date, @end_date, 'Men'),
('event_page', 'InviteAFriend_Men_Winter_lrg2.jpg', @promo_group2, 'grid_promo','', @start_date, @end_date, 'All Events'),
('event_page', 'InviteAFriend_Women_Winter_lrg2.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'Women'),
('event_page', 'InviteAFriend_Women_Winter_lrg2.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'Beauty'),
('event_page', 'InviteAFriend_Women_Winter_lrg2.jpg', @promo_group2, 'grid_promo', '', @start_date, @end_date, 'All Events');

insert ignore into promos_genders(promo_section, promo_resource, promo_group, promo_placement, url, start_date, end_date, gender)
values
('event_page', 'InviteAFriend_Home_lrg1.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'M'),
('event_page', 'InviteAFriend_Home_lrg1.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'F'),
('event_page', 'InviteAFriend_Kids_lrg2.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'M'),
('event_page', 'InviteAFriend_Kids_lrg2.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'F'),
('event_page', 'InviteAFriend_Men_Winter_lrg2.jpg', @promo_group, 'grid_promo','', @start_date, @end_date, 'M'),
('event_page', 'InviteAFriend_Men_Winter_lrg2.jpg', @promo_group, 'grid_promo','', @start_date, @end_date, 'F'),
('event_page', 'InviteAFriend_Women_Winter_lrg2.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'M'),
('event_page', 'InviteAFriend_Women_Winter_lrg2.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'F'),
('event_page', 'InviteAFriend_Women_Winter_lrg2.jpg', @promo_group2, 'grid_promo', '', @start_date, @end_date, 'F'),
('event_page', 'InviteAFriend_Men_Winter_lrg2.jpg', @promo_group2, 'grid_promo', '', @start_date, @end_date, 'M');

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_promos_grid_promo_small`(in start_date_param datetime, in end_date_param datetime)
begin

SET @start_date = start_date_param;
SET @end_date = end_date_param;
SELECT concat(DATE_FORMAT(@start_date, '%y%m%d%h%i%s'), '_DB'), concat(DATE_FORMAT(@start_date, '%y%m%d%h%i%s'), '_DBhack')
INTO @promo_group, @promo_group2;


insert ignore into promo_groups(promo_group, description)
values
(@promo_group, concat('grid_promo auto generated at ', NOW())),
(@promo_group2, concat('grid_promo auto generated at ', NOW()));


insert ignore into promos(promo_section, promo_resource, promo_group, promo_placement, url, promo_url_action, promo_type, start_date, end_date, active, promo_placement_sort, notes)
values
('event_page', 'InviteAFriend_Beauty_small1.jpg', @promo_group, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, 1 , ''),
('event_page', 'InviteAFriend_Home_small.jpg', @promo_group, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, 1 , ''),
('event_page', 'InviteAFriend_Kids_small.jpg', @promo_group, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, 1 , ''),
('event_page', 'InviteAFriend_Men_Winter_small1.jpg', @promo_group, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, 1 , ''),
('event_page', 'InviteAFriend_Men_Winter_small1.jpg',  @promo_group2, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, 1 , ''),
('event_page', 'InviteAFriend_Women_Winter_small1.jpg', @promo_group, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, 1 , ''),
('event_page', 'InviteAFriend_Women_Winter_small1.jpg',  @promo_group2, 'grid_promo', '', 'widget', 'invite_a_friend', @start_date, @end_date, 1, 1 , '');

insert ignore into promos_event_tabs(promo_section, promo_resource, promo_group, promo_placement, url, start_date, end_date, event_tab)
values
('event_page', 'InviteAFriend_Beauty_small1.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'Beauty'),
('event_page', 'InviteAFriend_Home_small.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'Home'),
('event_page', 'InviteAFriend_Kids_small.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'Kids'),
('event_page', 'InviteAFriend_Men_Winter_small1.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'Men'),
('event_page', 'InviteAFriend_Men_Winter_small1.jpg',  @promo_group2, 'grid_promo', '', @start_date, @end_date, 'All Events'),
('event_page', 'InviteAFriend_Women_Winter_small1.jpg', @promo_group, 'grid_promo', '',  @start_date, @end_date, 'Women'),
('event_page', 'InviteAFriend_Women_Winter_small1.jpg',  @promo_group2, 'grid_promo', '', @start_date, @end_date, 'All Events');

insert ignore into promos_genders(promo_section, promo_resource, promo_group, promo_placement, url, start_date, end_date, gender)
values
('event_page', 'InviteAFriend_Beauty_small1.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'M'),
('event_page', 'InviteAFriend_Home_small.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'M'),
('event_page', 'InviteAFriend_Kids_small.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'M'),
('event_page', 'InviteAFriend_Men_Winter_small1.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'M'),
('event_page', 'InviteAFriend_Men_Winter_small1.jpg',  @promo_group2, 'grid_promo', '', @start_date, @end_date, 'M'),
('event_page', 'InviteAFriend_Women_Winter_small1.jpg', @promo_group, 'grid_promo', '',  @start_date, @end_date, 'M'),

('event_page', 'InviteAFriend_Beauty_small1.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'F'),
('event_page', 'InviteAFriend_Home_small.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'F'),
('event_page', 'InviteAFriend_Kids_small.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'F'),
('event_page', 'InviteAFriend_Men_Winter_small1.jpg', @promo_group, 'grid_promo', '', @start_date, @end_date, 'F'),
('event_page', 'InviteAFriend_Women_Winter_small1.jpg', @promo_group, 'grid_promo', '',  @start_date, @end_date, 'F'),
('event_page', 'InviteAFriend_Women_Winter_small1.jpg',  @promo_group2, 'grid_promo', '', @start_date, @end_date, 'F');

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_promos_top_promo`(in start_date_param datetime, in end_date_param datetime)
begin

SET @start_date = start_date_param;
SET @end_date = end_date_param;
SELECT concat(DATE_FORMAT(@start_date, '%y%m%d%h%i%s'), '_DB') INTO @promo_group;


insert ignore into promo_groups(promo_group, description)
values(@promo_group, concat('top_promo auto generated at ', NOW()));


insert ignore into promos(promo_section, promo_resource, promo_group, promo_placement, url, promo_url_action, promo_type, start_date, end_date, active, promo_placement_sort, notes)
values
('event_page', 'beginat8.png', @promo_group, 'top_promo', '', null, 'standard', @start_date, @end_date, 1, null , '');

insert ignore into promos_event_tabs(promo_section, promo_resource, promo_group, promo_placement, url, start_date, end_date, event_tab)
values
('event_page', 'beginat8.png', @promo_group, 'top_promo', '', @start_date, @end_date, 'All Events'),
('event_page', 'beginat8.png', @promo_group, 'top_promo', '', @start_date, @end_date, 'Beauty'),
('event_page', 'beginat8.png', @promo_group, 'top_promo', '', @start_date, @end_date, 'Home'),
('event_page', 'beginat8.png', @promo_group, 'top_promo', '', @start_date, @end_date, 'Kids'),
('event_page', 'beginat8.png', @promo_group, 'top_promo', '', @start_date, @end_date, 'Men'),
('event_page', 'beginat8.png', @promo_group, 'top_promo', '', @start_date, @end_date, 'Women');

insert ignore into promos_genders(promo_section, promo_resource, promo_group, promo_placement, url, start_date, end_date, gender)
values
('event_page', 'beginat8.png', @promo_group, 'top_promo', '', @start_date, @end_date, 'F'),
('event_page', 'beginat8.png', @promo_group, 'top_promo', '', @start_date, @end_date, 'M');

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_purchase_order_line_nbr`(dirty_po_id int unsigned)
BEGIN

SET @v_line_nbr := 0;

UPDATE purchase_orders_line_items
SET line_nbr = @v_line_nbr  := @v_line_nbr + 1
WHERE po_id = dirty_po_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_purchase_order_line_nbrs`()
BEGIN

DECLARE done bool default false;
DECLARE v_po_id int unsigned default 0;

DECLARE cur CURSOR FOR
SELECT po_id FROM purchase_orders_line_items WHERE line_nbr = 0 GROUP BY po_id;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = TRUE;

OPEN cur;

generate_line_nbr: LOOP

FETCH cur INTO v_po_id;
IF done THEN CLOSE cur; LEAVE generate_line_nbr; END IF;

CALL generate_purchase_order_line_nbr(v_po_id);

END LOOP generate_line_nbr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_shipments_from_wms`()
BEGIN

drop table if exists tmp_shipment_ids;
create table if not exists tmp_shipment_ids(shipment_id int unsigned, tracking_num varchar(25), primary key(tracking_num), key(tracking_num, shipment_id));
insert ignore into tmp_shipment_ids(shipment_id, tracking_num)
select get_shipment_id() as shipment_id, wms_shipment_item_import.tracking_num
from wms_shipment_item_import
inner join order_items using(order_id, event_id, sku)
group by tracking_num;

INSERT IGNORE INTO shipment_items(shipment_id, order_id, event_id, sku, quantity, ship_method_id, print_date)
select tmp_shipment_ids.shipment_id, wms_shipment_item_import.order_id, wms_shipment_item_import.event_id, wms_shipment_item_import.sku, wms_shipment_item_import.quantity, COALESCE(get_ship_method_id_by_carrier(wms_shipment_item_import.ship_method), order_items.ship_method_id), NOW() as print_date
from wms_shipment_item_import
inner join tmp_shipment_ids using(tracking_num)
inner join order_items using(order_id, event_id, sku);

INSERT IGNORE INTO shipment_tracking(shipment_id, tracking_num, ship_date, source, delivery_estimate_date)
select tmp_shipment_ids.shipment_id, wms_shipment_item_import.tracking_num, wms_shipment_item_import.ship_date, 'high_jump' as source, IF(order_items.ship_method_id != 35, (NOW() + interval 3 day), (NOW() + interval 5 day)) as delivery_estimate_date
from wms_shipment_item_import
inner join tmp_shipment_ids using(tracking_num)
inner join order_items using(order_id, event_id, sku)
group by tmp_shipment_ids.tracking_num;

insert ignore into high_jump_container_shipments(high_jump_container, shipment_id)
select high_jump_container, shipment_id
from wms_shipment_item_import
inner join tmp_shipment_ids using(tracking_num)
group by tmp_shipment_ids.tracking_num, wms_shipment_item_import.high_jump_container;

drop table if exists tmp_shipment_ids;

insert ignore into wms_shipment_item_import_log(high_jump_container, order_id, sku, event_id, quantity, tracking_num, ship_date, ship_method, import_date)
select high_jump_container, order_id, sku, event_id, quantity, tracking_num, ship_date, ship_method, import_date
from wms_shipment_item_import;

truncate wms_shipment_item_import;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_vouchers`(IN dirty_order_id int unsigned, IN dirty_event_id int unsigned)
BEGIN

DECLARE done BOOL DEFAULT FALSE;
DECLARE v_voucher_code varchar(16) default '';
DECLARE v_total, v_total_units, v_order_id, v_event_id, v_sku int unsigned default 0;
DECLARE v_counter, v_counter2 int unsigned default 1;
DECLARE v_first_name varchar(40) default '';
DECLARE v_last_name varchar(50) default '';
DECLARE v_email varchar(100) default '';
DECLARE v_style_num varchar(45) default '';
DECLARE v_style_name varchar(255) default '';

DECLARE cur CURSOR FOR
SELECT CONCAT('HL', CONVERT_TO_BASE(order_items.item_id, 36), UPPER(CAST(SUBSTRING(MD5(RAND()), -4) AS char(32)))) as voucher, orders.order_id, order_items.event_id,
members.first_name, members.last_name, members.email, styles.style_num, styles.name as style_name, SUM(order_items.ordered) AS total_units, order_items.sku
FROM orders
INNER JOIN order_items USING(order_id)
INNER JOIN members USING(member_id)
INNER JOIN skus USING(sku)
INNER JOIN styles USING(style_id)
WHERE orders.order_id = dirty_order_id AND order_items.event_id = dirty_event_id
GROUP BY skus.sku;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = TRUE;

SELECT SUM(order_items.ordered) AS total_units
INTO v_total
FROM order_items
WHERE order_items.order_id = dirty_order_id AND order_items.event_id = dirty_event_id;

OPEN cur;

voucher_orders: LOOP

FETCH cur INTO v_voucher_code, v_order_id, v_event_id, v_first_name, v_last_name, v_email, v_style_num, v_style_name, v_total_units, v_sku;
IF done THEN CLOSE cur; LEAVE voucher_orders; END IF;

build_voucher_codes: LOOP

IF v_counter2 > v_total_units THEN SET v_counter2 := 1; LEAVE build_voucher_codes; END IF;

REPLACE INTO vouchers(voucher_code, order_id, sku, event_id, first_name, last_name, email, style_num, style_name)
VALUES (CONCAT(v_voucher_code, LPAD(v_counter, 2, 0)), v_order_id, v_sku, v_event_id, v_first_name, v_last_name, v_email, v_style_num, v_style_name);

SET v_counter2 := v_counter2 + 1;
SET v_counter := v_counter + 1;
END LOOP build_voucher_codes;

END LOOP voucher_orders;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_vouchers_by_event`(IN dirty_event_id int unsigned)
BEGIN

DECLARE done BOOL DEFAULT FALSE;
DECLARE v_order_id int unsigned default 0;

DECLARE cur CURSOR FOR
SELECT order_items.order_id
FROM order_items
LEFT JOIN vouchers USING(order_id, sku)
WHERE vouchers.order_id IS NULL AND order_items.event_id = dirty_event_id and get_order_items_status(order_items.item_id) NOT IN ('returned', 'cancelled')
GROUP BY order_items.order_id;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = TRUE;

OPEN cur;

gen_vouchers: LOOP

 FETCH cur INTO v_order_id;
 IF done THEN
    CLOSE cur;
    LEAVE gen_vouchers;
 END IF;

 CALL generate_vouchers(v_order_id, dirty_event_id);

END LOOP gen_vouchers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_wrapp_coupon_codes`()
BEGIN
DECLARE count, count2, tot_count INT DEFAULT 0;
DECLARE amount DECIMAL (10,2);

while count < 1005 do
    SET count = count + 1;
    INSERT IGNORE INTO coupons 
        (coupon_code, amount, start_date, expiration_date, single_member_use)
    VALUES  
        (concat('WRAPP10', lpad(count, 4, '0')), 5, '2012-06-28', '2012-09-30 23:59:59', 1);
end while; 

set count = 0;
set tot_count = 1005;

while count < 42 do
    SET tot_count = tot_count + 1;
    INSERT IGNORE INTO coupons 
        (coupon_code, amount, start_date, single_member_use)
    VALUES
        (concat('WRAPP10', tot_count), 10, '2012-06-28', 1);
    SET count = count + 1;
end while; 

set count = 0;
set tot_count = 1047;
set amount = 15;

while count2 < 18 do
    while count < 20 do
        SET tot_count = tot_count + 1;
        INSERT IGNORE INTO coupons 
            (coupon_code, amount, start_date, single_member_use)
        VALUES
            (concat('WRAPP10', tot_count), amount, '2012-06-28', 1);
        SET count = count + 1;        
    end while; 
    set count = 0;
    set amount = amount + 5;
    SET count2 = count2 + 1;
end while;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_bml_id_length_by_member`(in member_id_param int unsigned)
begin

SET @member_id = member_id_param;

PREPARE stmt FROM
"SELECT create_date, CHAR_LENGTH(bill_me_later_ref_id) as length
                                  FROM billing
                                  WHERE member_id = ? and active = 1 AND payment_method = 'BML'";

EXECUTE stmt USING @member_id;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_connectship_shipments`(in shipment_id_param int unsigned)
BEGIN


SELECT shipment_items.shipment_id,
  CONCAT(shipping.first_name, ' ', shipping.last_name) AS shipper_name,
  shipping.company, shipping.address, shipping.address2, shipping.city, shipping.state, shipping.zipcode, shipping.country_iso, shipping.phone,
  IF(SUM(order_items.price * shipment_items.quantity) > 500, 1, 0) AS high_value,
  IF(SUM(`styles`.hazmat_type IS NOT NULL) > 0 OR shipping.state IN('HI', 'AK', 'PR'), 1, 0) AS ground_only,
  0 AS air_only,
  IF(SUM(styles_shipping_rules.shipping_rule = 'no_3_day') > 0 OR shipping.state IN('HI', 'AK', 'PR'), 0, 1) AS upgradeable,
  IF(SUM(order_items.price * shipment_items.quantity) > 1600, 1, 0) AS commercial,
  IF(SUM(`styles`.hazmat_type IS NOT NULL) > 0, 1, 0) AS hazmat,
  quads.vertical,
  quads.department

FROM shipment_items
LEFT JOIN shipment_tracking USING(shipment_id)
INNER JOIN order_items ON order_items.order_id = shipment_items.order_id AND order_items.sku = shipment_items.sku
INNER JOIN `events` ON `events`.event_id = order_items.event_id
INNER JOIN skus ON skus.sku = order_items.sku
INNER JOIN styles ON styles.style_id = skus.style_id
INNER JOIN orders ON orders.order_id = order_items.order_id
INNER JOIN shipping ON shipping.shipping_id = orders.shipping_id
LEFT JOIN quads ON quads.quad_id = styles.quad_id
LEFT JOIN styles_shipping_rules ON styles.style_id = styles_shipping_rules.style_id
WHERE shipment_items.shipment_id = shipment_id_param AND `events`.event_status < 90
GROUP BY shipment_items.shipment_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_event_document_sets`(in event_id_param int unsigned)
BEGIN

SELECT shipments.shipment_id, shipments.create_date, shipments.document_set AS document_set, document_sets.document_set_label, shipments.delivery_method, delivery_methods.description,
                    COUNT(DISTINCT shipment_items.order_id) AS total_orders, shipment_items.print_date,
                    COUNT(DISTINCT shipment_items.shipment_id) AS picked_orders,
                    COUNT(DISTINCT shipments.shipment_id) AS total_boxes,
                    COUNT(DISTINCT shipment_items.shipment_id) AS picked_boxes,
                    COUNT(DISTINCT shipment_tracking.shipment_id) AS shipped_boxes
                FROM shipments
                INNER JOIN document_sets USING(document_set)
                INNER JOIN shipment_items USING(shipment_id)
                INNER JOIN delivery_methods USING(delivery_method)
                LEFT JOIN shipment_tracking USING(shipment_id)
                WHERE shipment_items.event_id = event_id_param AND (shipment_tracking.source != 'CASI' OR shipment_tracking.source IS NULL)
                GROUP BY shipments.document_set;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_event_shipment_units`(in dirty_event_id int unsigned)
BEGIN

CREATE TEMPORARY TABLE hash_order_items_ordered
(
  order_id int unsigned not null,
  sku int unsigned not null,
  ordered int unsigned not null,
  primary key(order_id, sku)
);

INSERT IGNORE INTO hash_order_items_ordered(order_id, sku, ordered)
SELECT order_id, sku, SUM(ordered) as total_ordered
     FROM order_items
     WHERE event_id = dirty_event_id
     GROUP BY order_id, sku;

CREATE TEMPORARY TABLE hash_order_items_returned
(
  order_id int unsigned not null,
  sku int unsigned not null,
  returned int unsigned not null,
  primary key(order_id, sku)
);

INSERT IGNORE INTO hash_order_items_returned(order_id, sku, returned)
SELECT order_id, sku, COUNT(*) AS returned
      FROM return_items
      WHERE event_id = dirty_event_id AND return_item_status = 100
      GROUP BY order_id, sku;

CREATE TEMPORARY TABLE hash_order_items_shipped
(
  order_id int unsigned not null,
  sku int unsigned not null,
  shipped int unsigned not null,
  primary key(order_id, sku)
);

INSERT IGNORE INTO hash_order_items_shipped(order_id, sku, shipped)
SELECT order_id, sku, SUM(quantity) AS shipped
      FROM shipment_items
      WHERE event_id = dirty_event_id
      GROUP BY order_id, sku;

SELECT event_id, COUNT(DISTINCT order_id) AS total_unshipped_orders, SUM(unshipped_units) AS total_unshipped_units
FROM

  (SELECT dirty_event_id AS event_id, order_ttls.order_id, order_ttls.sku, order_ttls.ordered, return_ttls.returned, shipment_ttls.shipped,
    (order_ttls.ordered - COALESCE(return_ttls.returned, 0) - COALESCE(shipment_ttls.shipped, 0)) AS unshipped_units
     FROM hash_order_items_ordered AS order_ttls
       LEFT JOIN hash_order_items_returned AS return_ttls USING(order_id, sku)
       LEFT JOIN hash_order_items_shipped AS shipment_ttls USING(order_id, sku)
    GROUP BY order_id, sku
    HAVING unshipped_units > 0) AS order_shipment_info

GROUP BY event_id;

DROP TABLE IF EXISTS hash_order_items_ordered;
DROP TABLE IF EXISTS hash_order_items_returned;
DROP TABLE IF EXISTS hash_order_items_shipped;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_event_size_sort`(IN event_id_csv_param text)
BEGIN

SET @prepared_sql :=

CONCAT(
	'SELECT numeric_sizes.*
	FROM
	
	  (SELECT sku, style_id, size, sort
	   FROM events_styles
	   INNER JOIN skus USING(style_id)
     INNER JOIN inventory USING(sku, event_id)
	   WHERE event_id IN (', event_id_csv_param, ')
       AND size != \'OS\'
       AND size REGEXP \'[0-9]\'
       AND size NOT REGEXP \'[[:alpha:]]\'
       AND inventory.available > 0
       AND inventory.active = 1
	   GROUP BY size
	   ORDER BY IF(size = \'00\', -1, CONVERT(size, decimal(4,2))) ASC) AS numeric_sizes
	
	UNION ALL
	
	SELECT alphanumeric_sizes.*
	FROM
	
	  (SELECT sku, style_id, size, sort
	   FROM events_styles
	   INNER JOIN skus USING(style_id)
     INNER JOIN inventory USING(sku, event_id)
	   WHERE event_id IN (', event_id_csv_param, ')
       AND size != \'OS\'
       AND size REGEXP \'[[:alpha:]]\'
       AND inventory.available > 0
       AND inventory.active = 1
	   GROUP BY size
	   ORDER BY style_id, sort ASC) AS alphanumeric_sizes

	UNION ALL

	SELECT exceptional_sizes.*
	FROM
	
	  (SELECT sku, style_id, size, sort
	   FROM events_styles
	   INNER JOIN skus USING(style_id)
     INNER JOIN inventory USING(sku, event_id)
	   WHERE event_id IN (', event_id_csv_param, ')
       AND size = \'OS\'
       AND inventory.available > 0
       AND inventory.active = 1
   GROUP BY size) AS exceptional_sizes'
);

PREPARE stmt FROM @prepared_sql;

EXECUTE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_event_unpicked_orders`(in dirty_event_id int unsigned)
BEGIN

CREATE TEMPORARY TABLE hash_order_items_ordered_deux
(
  item_id int unsigned not null,
  order_id int unsigned not null,
  sku int unsigned not null,
  ordered int unsigned not null,
  price decimal(10,2) NOT NULL,
  ship_method_id int unsigned not null,
  freight decimal(10,2) not null,
  freight_taxes decimal(10,2) not null,
  primary key(order_id, sku)
);

INSERT INTO hash_order_items_ordered_deux(item_id, order_id, sku, ordered, price, ship_method_id, freight, freight_taxes)
SELECT item_id, order_id, sku, SUM(ordered) as total_ordered, price, ship_method_id, freight, freight_taxes
     FROM order_items
     WHERE event_id = dirty_event_id
     GROUP BY order_id, sku;

CREATE TEMPORARY TABLE hash_order_items_returned_deux
(
  order_id int unsigned not null,
  sku int unsigned not null,
  returned int unsigned not null,
  primary key(order_id, sku)
);

INSERT INTO hash_order_items_returned_deux(order_id, sku, returned)
SELECT order_id, sku, COUNT(*) AS returned
      FROM return_items
      WHERE event_id = dirty_event_id AND return_item_status IN(50, 75, 100)
      GROUP BY order_id, sku;

CREATE TEMPORARY TABLE hash_order_items_shipped_deux
(
  order_id int unsigned not null,
  sku int unsigned not null,
  shipped int unsigned not null,
  primary key(order_id, sku)
);

INSERT INTO hash_order_items_shipped_deux(order_id, sku, shipped)
SELECT order_id, sku, SUM(quantity) AS shipped
      FROM shipment_items
      WHERE event_id = dirty_event_id
      GROUP BY order_id, sku;

SELECT order_ttls.order_id, order_ttls.item_id, dirty_event_id AS event_id, order_ttls.sku, order_ttls.ordered, return_ttls.returned, shipment_ttls.shipped,
    order_ttls.ship_method_id, order_ttls.price, (order_ttls.ordered - COALESCE(return_ttls.returned, 0) - COALESCE(shipment_ttls.shipped, 0)) AS unshipped_units,
    orders.member_id, orders.shipping_id, IF(gift_orders.order_id IS NULL, 0, 1) as gift, order_ttls.freight, order_ttls.freight_taxes
     FROM hash_order_items_ordered_deux AS order_ttls
       INNER JOIN orders USING(order_id)
       LEFT JOIN gift_orders USING(order_id)
       LEFT JOIN hash_order_items_returned_deux AS return_ttls USING(order_id, sku)
       LEFT JOIN hash_order_items_shipped_deux AS shipment_ttls USING(order_id, sku)
    GROUP BY order_id, sku
    HAVING unshipped_units > 0
    ORDER BY member_id, order_date;

DROP TEMPORARY TABLE IF EXISTS hash_order_items_ordered_deux;
DROP TEMPORARY TABLE IF EXISTS hash_order_items_returned_deux;
DROP TEMPORARY TABLE IF EXISTS hash_order_items_shipped_deux;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_friend_status`(in member_id_param int unsigned, in friend_email_param varchar(100))
BEGIN

SET @member_id_param = member_id_param;
SET @friend_email_param = friend_email_param;

PREPARE stmt FROM

'SELECT
    (SELECT COALESCE(SUM((CASE WHEN email IS NOT NULL THEN 1 ELSE 0 END)),0) FROM members WHERE email = ?) AS is_member,
    COALESCE(SUM((CASE WHEN send_date IS NOT NULL THEN 1 ELSE 0 END)),0) AS already_reminded,
    COALESCE(SUM((CASE WHEN send_date IS NULL AND friend_id IS NULL THEN 1 ELSE 0 END)),0) AS needs_reminder
    FROM invitations
    LEFT JOIN invitation_reminders USING (invitation_id)
    LEFT JOIN members ON invitations.friend_email = members.email
    WHERE invitations.member_id = ? AND invitations.friend_email = ?';

EXECUTE stmt USING @friend_email_param, @member_id_param, @friend_email_param;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_getaways_by_member`(in member_id_param int unsigned)
begin

SET @member_id = member_id_param;

PREPARE stmt FROM
"select property_promotion.name as event, property_promotion.path as event_code, reserved_stay.property_promotion_id as event_id,
reserved_stay.locator as order_id, reserved_stay.`status` as order_item_status, reserved_stay.price as subtotal,
reserved_stay.tax as taxes, reserved_stay.total as total, reserved_stay.reserved_at as order_date, property.name as brand, reserved_stay.checkin, reserved_stay.checkout, property.checkin_time, property.checkout_time,
room_type.code as room_type_code, room_type.name as room_type_name, rate_plan.code as rate_plan_code, rate_plan.name as rate_plan_name,
address.line1 as address_line1, address.line2 as address_line2, address.city as address_city, address.country_code, address.region_code, address.postal_code,
address.phone as property_phone, reserved_stay.gift_cards_total, reserved_stay.credits_total, reserved_stay.tax_deferred_payment as deferred_fees,
reserved_stay.guests, reserved_stay.rooms, guest.first_name as guest_first_name, guest.last_name as guest_last_name, guest.email as guest_email,
guest.phone as guest_phone, orders.billing_id, local_content_image.web_contents_url as reservation_image

from getaways.reserved_stay
inner join getaways.property_promotion on reserved_stay.property_promotion_id = property_promotion.id
inner join getaways.property on property_promotion.property_id = property.id
inner join getaways.address on address_id = address.id
inner join getaways.rate on rate.id = reserved_stay.rate_id
inner join getaways.rate_plan on rate_plan.id = rate.rate_plan_id
inner join getaways.room_type on room_type.id = rate.room_type_id
inner join getaways.guest on guest.id = reserved_stay.guest_id
inner join getaways.person on person.id = reserved_stay.person_id
inner join getaway_orders on getaway_orders.locator = reserved_stay.locator
inner join orders on orders.order_id = getaway_orders.order_id
left join getaways.local_content_image on local_content_image.content_item_id = property.content_id and image_size = 'RESERVATION_IMAGE'
where person.hautelook_member_id = ?";

EXECUTE stmt USING @member_id;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_inventory_accuracy_date_range`(in date_param date, out low_date datetime, out high_date datetime)
BEGIN

CASE DAYOFWEEK(date_param)
 WHEN 1 THEN
   SET low_date = 0;
   SET high_date = 0;

 WHEN 2 THEN
   SET low_date = date_param + INTERVAL 1 DAY;
   SET high_date = CONCAT((date_param + INTERVAL 1 DAY), ' 23:59:59');

 WHEN 3 THEN
   SET low_date = date_param + INTERVAL 1 DAY;
   SET high_date = CONCAT((date_param + INTERVAL 1 DAY), ' 23:59:59');

 WHEN 4 THEN
   SET low_date = date_param + INTERVAL 1 DAY;
   SET high_date = CONCAT((date_param + INTERVAL 1 DAY), ' 23:59:59');

 WHEN 5 THEN
   SET low_date = date_param + INTERVAL 1 DAY;
   SET high_date = CONCAT((date_param + INTERVAL 1 DAY), ' 23:59:59');

 WHEN 6 THEN
   SET low_date = date_param + INTERVAL 1 DAY;
   SET high_date = CONCAT((date_param + INTERVAL 3 DAY), ' 23:59:59');

 WHEN 7 THEN
   SET low_date = 0;
   SET high_date = 0;

 ELSE
   SET low_date = 0;
   SET high_date = 0;
END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_inventory_accuracy_summary`(in date_param date)
BEGIN

DECLARE low_date, high_date datetime;

call get_inventory_accuracy_date_range(date_param, low_date, high_date);

SELECT `events`.event_id, `events`.title as event, DATE_FORMAT(`events`.start_date, '%W, %M %d, %Y  %l%p') as event_starts_on, `events`.event_status, event_statuses.description as event_status_desc, `events`.event_type
FROM `events` INNER JOIN inventory USING(event_id) INNER JOIN event_statuses USING(event_status)
WHERE event_type IN('pre_event', 'owned_inv')
AND start_date BETWEEN low_date AND high_date
GROUP BY event_id
ORDER BY event_type;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_order_confirmation`(in order_id_param int unsigned)
BEGIN

SELECT
good_images.*,

order_items.*,
(order_items.ordered * order_items.price) AS line_total,
events.title AS event_title,
events.finalsale AS event_finalsale,
events.code AS event_code, events.end_date, events.tagline,
events.event_type, inventory.sale_price,

inventory.discount,
inventory.retail_price, inventory.inventory_id,

skus.color,
skus.size,
skus.style_id,
styles.name,
styles.style_num,
styles.returnable,
`events`.delivery_low_day,
`events`.delivery_high_day,
`events`.delivery_canadian_offset,
`events`.delivery_estimate_rule,
brands.brand,

good_images.color AS image_color,

good_images.image_id

FROM order_items

INNER JOIN events ON events.event_id = order_items.event_id
INNER JOIN inventory ON order_items.sku = inventory.sku AND order_items.event_id = inventory.event_id
INNER JOIN skus ON order_items.sku = skus.sku
INNER JOIN styles ON skus.style_id = styles.style_id
INNER JOIN brands ON events.brand_id = brands.brand_id

LEFT JOIN images AS good_images ON skus.style_id = good_images.style_id AND LOWER(replace(skus.color," ","_")) = LOWER(good_images.color)
LEFT JOIN images AS gi ON gi.style_id = good_images.style_id AND gi.color = good_images.color AND good_images.sort > gi.sort

WHERE order_items.order_id = order_id_param
AND gi.image_id IS NULL
group by styles.style_id, skus.color, good_images.sort, skus.size;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_parent_shared_styles`(IN parent_event_id_param INT UNSIGNED)
BEGIN


drop temporary table if exists child_style_ids, child_style_nums, shared_style_ids, shared_style_nums;

create temporary table child_style_ids(event_id int unsigned, parent_id int unsigned, style_id int unsigned, primary key(parent_id, style_id, event_id));
insert ignore into child_style_ids(event_id, parent_id, style_id)
select event_id, parent_id, style_id
from events
INNER JOIN inventory USING(event_id)
INNER JOIN skus USING(sku)
WHERE inventory.active = 1 and parent_id = parent_event_id_param;


create temporary table child_style_nums(event_id int unsigned, parent_id int unsigned, style_num varchar(45) not null, primary key(parent_id, style_num, event_id));
insert ignore into child_style_nums(event_id, parent_id, style_num)
select event_id, parent_id, style_num
from events
INNER JOIN inventory USING(event_id)
INNER JOIN skus USING(sku)
INNER JOIN styles USING(style_id)
WHERE inventory.active = 1 and parent_id = parent_event_id_param;

create temporary table if not exists shared_style_ids(style_id int unsigned primary key);
insert ignore into shared_style_ids(style_id)
SELECT style_id
FROM child_style_ids
GROUP BY parent_id, style_id
HAVING COUNT(DISTINCT child_style_ids.event_id) > 1;

create temporary table if not exists shared_style_nums(style_num varchar(45) primary key);
insert ignore into shared_style_nums(style_num)
SELECT style_num
FROM child_style_nums
GROUP BY parent_id, style_num
HAVING COUNT(DISTINCT child_style_nums.event_id) > 1;

SELECT inventory.event_id, styles.style_num, styles.style_id
, SUM(inventory.available) as total_available, SUM(inventory.sold) as total_sold, SUM(inventory.returned) as total_returned
FROM shared_style_ids
inner join styles using(style_id)
INNER JOIN skus USING(style_id)
INNER JOIN inventory USING(sku)
INNER JOIN `events` USING(event_id)
WHERE `events`.parent_id = parent_event_id_param AND inventory.active = 1
GROUP BY styles.style_id, inventory.event_id

UNION

SELECT inventory.event_id, styles.style_num, styles.style_id
, SUM(inventory.available) as total_available, SUM(inventory.sold) as total_sold, SUM(inventory.returned) as total_returned
FROM shared_style_nums
inner join styles using(style_num)
INNER JOIN skus USING(style_id)
INNER JOIN inventory USING(sku)
INNER JOIN `events` USING(event_id)
WHERE `events`.parent_id = parent_event_id_param AND inventory.active = 1
GROUP BY styles.style_num, inventory.event_id;

drop temporary table if exists child_style_ids, child_style_nums, shared_style_ids, shared_style_nums;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_private_event_by_member`(in member_id_param int unsigned)
BEGIN

DECLARE member_role tinyint unsigned default 100;
DECLARE CONTINUE HANDLER FOR 1329
  SET member_role = 100;

SET @member_id = member_id_param;

drop temporary table if exists tmp_member_private_events;
create temporary table if not exists tmp_member_private_events(event_id int unsigned primary key);

select role
INTO member_role
FROM members
WHERE member_id = member_id_param;

CASE WHEN member_role > 10 THEN
PREPARE stmt FROM
'INSERT IGNORE INTO tmp_member_private_events(event_id)
SELECT events_members.event_id
FROM events_members INNER JOIN `events` USING(event_id)
WHERE events_members.member_id = ? AND end_date > NOW() AND private = 1';

EXECUTE stmt USING @member_id;

WHEN member_role = 10 THEN
PREPARE stmt FROM
'INSERT IGNORE INTO tmp_member_private_events(event_id)
SELECT event_id
FROM brand_contacts INNER JOIN `events` USING(brand_id)
WHERE member_id = ? AND end_date > NOW() AND private = 1';

EXECUTE stmt USING @member_id;

WHEN member_role < 10 THEN
PREPARE stmt FROM
'INSERT IGNORE INTO tmp_member_private_events(event_id)
SELECT event_id
FROM events
WHERE end_date > NOW() AND private = 1';

EXECUTE stmt;

ELSE
PREPARE stmt FROM
'INSERT IGNORE INTO tmp_member_private_events(event_id)
SELECT events_members.event_id
FROM events_members INNER JOIN `events` USING(event_id)
WHERE events_members.member_id = ? AND end_date > NOW() AND private = 1';

EXECUTE stmt USING @member_id;

END CASE;


SELECT `events`.`event_id`, `events`.`title`, `events`.`start_date`, `events`.`end_date`
FROM `events`
INNER JOIN tmp_member_private_events USING(event_id)
ORDER BY `events`.`end_date` ASC;

drop temporary table if exists tmp_member_private_events;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_received_events`()
BEGIN

SELECT *
FROM
	(SELECT `events`.event_id, `events`.title, `events`.end_date AS received_date
	FROM `events`
	WHERE event_type IN('drop_ship', 'service')
	AND `events`.end_date < NOW()

	UNION ALL

	SELECT `events`.event_id, `events`.title, purchase_orders.received_date
	FROM `events`
	INNER JOIN purchase_orders USING(event_id)
	WHERE event_type = 'owned_inv'
	AND purchase_orders.po_id = get_purchase_order_id(`events`.event_id)
	AND purchase_orders.purchase_order_type != 'Consignment'

	UNION ALL
	
	SELECT `events`.event_id, `events`.title, purchase_orders.received_date
	FROM `events`
	INNER JOIN purchase_orders USING(event_id)
	WHERE event_type NOT IN ('owned_inv', 'drop_ship', 'service')
	AND purchase_orders.po_id = get_purchase_order_id(`events`.event_id)
	AND purchase_orders.purchase_order_type = 'Consignment') AS dogbaby

ORDER BY received_date DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_shipment_confirmation`(in order_id_param int unsigned, in shipment_id_param int unsigned)
BEGIN

SELECT
good_images.*,

order_items.*,
(order_items.ordered * order_items.price) AS line_total,
events.title AS event_title,
events.finalsale AS event_finalsale,
events.code AS event_code, events.end_date, events.tagline,
events.event_type, inventory.sale_price,

inventory.discount,
inventory.retail_price, inventory.inventory_id,

skus.color,
skus.size,
skus.style_id,
styles.name,
styles.style_num,
styles.returnable,
CONCAT(events.delivery_low_day,' - ',events.delivery_high_day,' ',events.delivery_estimate_rule,' Days') AS shiptime,
brands.brand,

good_images.color AS image_color,

good_images.image_id,
ship_methods.agent

FROM order_items
INNER JOIN ship_methods USING(ship_method_id)
INNER JOIN events ON events.event_id = order_items.event_id
INNER JOIN inventory ON order_items.sku = inventory.sku AND order_items.event_id = inventory.event_id
INNER JOIN skus ON order_items.sku = skus.sku
INNER JOIN styles ON skus.style_id = styles.style_id
LEFT JOIN brands ON events.brand_id = brands.brand_id
INNER JOIN shipment_items ON
shipment_items.order_id = order_items.order_id AND
shipment_items.sku = order_items.sku AND
shipment_items.event_id = order_items.event_id AND
shipment_items.shipment_id = shipment_id_param


LEFT JOIN images AS good_images ON skus.style_id = good_images.style_id AND LOWER(replace(skus.color," ","_")) = LOWER(good_images.color)
LEFT JOIN images AS gi ON gi.style_id = good_images.style_id AND gi.color = good_images.color AND good_images.sort > gi.sort

WHERE (order_items.order_id =  order_id_param)
AND gi.image_id IS NULL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_shipment_confirm_email_full`()
BEGIN

  SELECT shipment_tracking.shipment_id, CAST(GROUP_CONCAT(DISTINCT shipment_tracking.tracking_num SEPARATOR ', ' ) AS CHAR(200)) AS tracking_nums,
  shipment_tracking.delivery_estimate_date, shipment_tracking.delivery_date, shipment_items.order_id, COUNT(DISTINCT st2.email_notification_type) AS distinct_notification_types, shipment_tracking.email_notification_date
  FROM shipment_tracking
  INNER JOIN shipment_items ON shipment_tracking.shipment_id = shipment_items.shipment_id
  INNER JOIN shipment_items AS si2 ON si2.order_id = shipment_items.order_id
  INNER JOIN shipment_tracking AS st2 ON si2.shipment_id = st2.shipment_id

  WHERE shipment_tracking.email_notification_type IS NULL AND shipment_tracking.ship_date > 0 AND st2.ship_date > 0 AND shipment_items.ship_method_id != 42
  GROUP BY shipment_tracking.shipment_id
  HAVING distinct_notification_types = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_shipment_confirm_email_partial`()
BEGIN

  SELECT shipment_tracking.shipment_id, CAST(GROUP_CONCAT(DISTINCT shipment_tracking.tracking_num SEPARATOR ', ' ) AS CHAR(200)) AS tracking_nums,
  shipment_tracking.delivery_estimate_date, shipment_tracking.delivery_date, shipment_items.order_id, shipment_tracking.email_notification_date
  FROM shipment_tracking
  INNER JOIN shipment_items ON shipment_tracking.shipment_id = shipment_items.shipment_id
  INNER JOIN shipment_items AS si2 ON si2.order_id = shipment_items.order_id
  INNER JOIN shipment_tracking AS st2 ON si2.shipment_id = st2.shipment_id

  WHERE shipment_tracking.email_notification_type IS NULL AND shipment_tracking.ship_date > 0
    AND st2.email_notification_type = 'partial' AND st2.ship_date > 0 AND shipment_items.ship_method_id != 42
  GROUP BY shipment_tracking.shipment_id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ups_tracking_fifo`()
BEGIN

drop temporary table if exists raw_data_set_chunk_fifo;
create temporary table if not exists raw_data_set_chunk_fifo
(
 shipment_id int unsigned not null,
 tracking_num varchar(25) not null,
 ship_date datetime not null,
 delivery_date datetime not null,
 tracking_info varchar(150) not null,
 return_to_shipper_date datetime not null,
 delivery_attempt_date datetime not null,
 delivery_estimate_date datetime not null,
 order_date datetime not null,
 primary key(tracking_num)
);
insert ignore into raw_data_set_chunk_fifo (shipment_id, tracking_num, ship_date, delivery_date, tracking_info, return_to_shipper_date, delivery_attempt_date, delivery_estimate_date, order_date)
select shipment_tracking.shipment_id, shipment_tracking.tracking_num, shipment_tracking.ship_date,
shipment_tracking.delivery_date, shipment_tracking.tracking_info, shipment_tracking.return_to_shipper_date,
shipment_tracking.delivery_attempt_date, shipment_tracking.delivery_estimate_date,
orders.order_date
from orders
inner join shipment_items using(order_id)
inner join shipment_tracking using(shipment_id)
where order_date > NOW() - INTERVAL 60 DAY
AND shipment_items.ship_method_id IN ( SELECT sm.ship_method_id FROM ship_methods sm WHERE sm.agent = 'UPS' )
AND shipment_tracking.delivery_date = 0 and tracking_info_date < NOW() - INTERVAL 1 DAY
ORDER BY shipment_items.shipment_id ASC
limit 300;

select * from raw_data_set_chunk_fifo;

drop temporary table if exists raw_data_set_chunk_fifo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ups_tracking_lifo`()
BEGIN

drop temporary table if exists raw_data_set_chunk_lifo;
create temporary table if not exists raw_data_set_chunk_lifo
(
 shipment_id int unsigned not null,
 tracking_num varchar(25) not null,
 ship_date datetime not null,
 delivery_date datetime not null,
 tracking_info varchar(150) not null,
 return_to_shipper_date datetime not null,
 delivery_attempt_date datetime not null,
 delivery_estimate_date datetime not null,
 order_date datetime not null,
 primary key(tracking_num)
);
insert ignore into raw_data_set_chunk_lifo (shipment_id, tracking_num, ship_date, delivery_date, tracking_info, return_to_shipper_date, delivery_attempt_date, delivery_estimate_date, order_date)
select shipment_tracking.shipment_id, shipment_tracking.tracking_num, shipment_tracking.ship_date,
shipment_tracking.delivery_date, shipment_tracking.tracking_info, shipment_tracking.return_to_shipper_date,
shipment_tracking.delivery_attempt_date, shipment_tracking.delivery_estimate_date,
orders.order_date
from orders
inner join shipment_items using(order_id)
inner join shipment_tracking using(shipment_id)
where order_date > NOW() - INTERVAL 60 DAY
AND shipment_items.ship_method_id IN ( SELECT sm.ship_method_id FROM ship_methods sm WHERE sm.agent = 'UPS' )
AND shipment_tracking.delivery_date = 0 and tracking_info_date < NOW() - INTERVAL 1 DAY
ORDER BY shipment_items.shipment_id DESC
limit 300;

select * from raw_data_set_chunk_lifo;

drop temporary table if exists raw_data_set_chunk_lifo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ups_tracking_returns_fifo`()
BEGIN

SELECT `returns`.return_id, `returns`.request_date, `returns`.tracking_num, `returns`.ship_date, `returns`.received_date

FROM `returns`

WHERE

`returns`.tracking_num > 0 AND
`returns`.ship_method_id IN ( SELECT sm.ship_method_id FROM ship_methods sm WHERE sm.agent  = 'UPS' ) AND
`returns`.request_date > (NOW() - INTERVAL 30 day) AND
`returns`.tracking_info_date < (NOW() - INTERVAL 1 day)

ORDER BY `returns`.return_id ASC
LIMIT 100;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ups_tracking_returns_lifo`()
BEGIN

SELECT `returns`.return_id, `returns`.request_date, `returns`.tracking_num, `returns`.ship_date, `returns`.received_date

FROM `returns`

WHERE

`returns`.tracking_num > 0 AND
`returns`.ship_method_id IN ( SELECT sm.ship_method_id FROM ship_methods sm WHERE sm.agent  = 'UPS' ) AND
`returns`.request_date > (NOW() - INTERVAL 30 day) AND
`returns`.tracking_info_date < (NOW() - INTERVAL 1 day)

ORDER BY `returns`.return_id DESC
LIMIT 100;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `member_skus_map_delete_sku`(
  IN _sku int(10) unsigned
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM member_skus_map
    WHERE sku = _sku
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `member_skus_map_delete_style`(
  IN _style_id int(10) unsigned
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM member_skus_map
    WHERE sku IN (
      SELECT sku
      FROM skus
      WHERE style_id = _style_id
    )
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `member_skus_map_put_sku`(
  IN _style_id int(10) unsigned,
  IN _sku int(10) unsigned
)
    MODIFIES SQL DATA
BEGIN
    REPLACE member_skus_map (
      sku,
      member_division_cd,
      member_department_cd,
      member_class_cd,
      member_subclass_cd,
      is_active_flag,
      created_by_user_id
    )
    SELECT
      _sku,
      mbm.member_division_cd,
      mbm.member_department_cd,
      mbm.member_class_cd,
      mbm.member_subclass_cd,
      'Y', 
      0 
    FROM styles
    JOIN business_quad_map bqm ON bqm.quad_id = styles.quad_id
    JOIN member_business_map mbm USING (
      business_division_id,
      business_department_id,
      business_department_cd,
      business_class_id,
      business_class_cd,
      business_subclass_id,
      business_subclass_cd
    )
    WHERE
      styles.style_id = _style_id
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `member_skus_map_put_style_quad`(
  IN _style_id int(10) unsigned,
  IN _quad_id int(11)
)
    MODIFIES SQL DATA
BEGIN
    REPLACE member_skus_map (
      sku,
      member_division_cd,
      member_department_cd,
      member_class_cd,
      member_subclass_cd,
      is_active_flag,
      created_by_user_id
    )
    SELECT
      skus.sku,
      mbm.member_division_cd,
      mbm.member_department_cd,
      mbm.member_class_cd,
      mbm.member_subclass_cd,
      'Y', 
      0 
    FROM skus
    JOIN business_quad_map bqm ON bqm.quad_id = _quad_id
    JOIN member_business_map mbm USING (
      business_division_id,
      business_department_id,
      business_department_cd,
      business_class_id,
      business_class_cd,
      business_subclass_id,
      business_subclass_cd
    )
    WHERE skus.style_id = _style_id
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `optimize_tables`()
BEGIN

OPTIMIZE TABLE sessions;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `perform_maintenance`()
begin


call generate_purchase_order_line_nbrs();


call purge_expired_credit_cards();

call purge_landmark_labels();

call purge_ups_labels();

call purge_email_queue();

CALL purge_checkout_summary();

call purge_remote_communication_log();

call purge_preview_event_batches();

call purge_db_error_log();

CALL reassign_member_sids();

CALL optimize_tables();

CALL reconcile_returns_complete_date();

UPDATE styles
SET returnable = 1
WHERE returnable = 0 AND call_required_return = 1;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_checkout_summary`()
begin

DELETE FROM checkout_summary
WHERE create_date < (NOW() - INTERVAL 1 day);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_db_error_log`()
begin

drop table if exists purge_db_error_log;
create table if not exists purge_db_error_log(id int primary key) engine=MyISAM default charset=latin1 row_format=fixed;
insert ignore into purge_db_error_log(id)
select id from db_error_log
where `timestamp` < current_date() - interval 1 month
limit 500000;

delete db_error_log from purge_db_error_log inner join db_error_log using(id);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_email_queue`()
begin

drop table if exists purge_email_queue;
create table if not exists purge_email_queue(email_queue_id int unsigned primary key)
SELECT email_queue_id
FROM email_queue
WHERE queue_date < (NOW() - INTERVAL 5 day)
AND email_status IN ('complete', 'failed');

delete email_queue from purge_email_queue inner join email_queue using(email_queue_id);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_expired_credit_cards`()
begin

update billing
set active = 0
where
payment_method = 'CC'
and active = 1
and card_type != 'na'
and (card_exp_year < year(curdate()) or
(card_exp_year = year(curdate()) and card_exp_month < month(curdate())));

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_landmark_labels`()
begin

delete from landmark_labels where created_date < current_date() - interval 4 month;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_preview_event_batches`()
BEGIN

DELETE preview_event_dynamics FROM preview_event_batches
INNER JOIN preview_event_dynamics USING(preview_event_batch)
WHERE preview_event_batches.active = 0;

DELETE preview_events FROM preview_event_batches
INNER JOIN preview_events USING(preview_event_batch)
WHERE preview_event_batches.active = 0;

DELETE preview_event_batches_filters FROM preview_event_batches
INNER JOIN preview_event_batches_filters USING(preview_event_batch)
WHERE preview_event_batches.active = 0;

DELETE preview_event_members FROM preview_event_batches
INNER JOIN preview_event_members USING(preview_event_batch)
WHERE preview_event_batches.active = 0;

DELETE FROM preview_event_batches
WHERE preview_event_batches.active = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_remote_communication_log`()
begin

drop table if exists purge_remote_communication_log;
create table if not exists purge_remote_communication_log(id bigint unsigned unsigned primary key) engine=MyISAM default charset=latin1 ROW_FORMAT=fixed;
INSERT IGNORE INTO purge_remote_communication_log(id)
SELECT remote_communication_log.id FROM remote_communication_log where `timestamp` < (NOW() - INTERVAL 30 day);

DELETE remote_communication_log FROM purge_remote_communication_log INNER JOIN remote_communication_log USING(id);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_shipment_item_upload_exceptions`()
begin

truncate shipment_item_upload_exceptions;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_skus_building_bins`()
begin




drop table if exists exclude_these_skus;
create table if not exists exclude_these_skus(sku int unsigned primary key);
insert ignore into exclude_these_skus(sku)
select sku
from skus_building_bins inner join inventory using(sku) inner join events using(event_id)
where end_date > CURRENT_DATE() and start_date < CURRENT_DATE();


insert ignore into purge_skus_building_bins_log(sku, building_bin, quantity, modify_date, purge_date, purge_time)
select sku, building_bin, quantity, modify_date, current_date() as purge_date, current_time() as purge_time
from skus_building_bins left join exclude_these_skus using(sku)
where modify_date < current_date() - interval 14 day
and exclude_these_skus.sku IS NULL;



delete ignore skus_building_bins from skus_building_bins
left join exclude_these_skus using(sku)
where modify_date < current_date() - interval 14 day and exclude_these_skus.sku IS NULL;


drop table if exists exclude_these_skus;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_skus_building_bins_by_event`(IN event_id_param INT UNSIGNED)
BEGIN

declare table_missing condition for 1146;
declare table_not_exist_warning condition for 1051;

declare continue handler for table_not_exist_warning BEGIN END;

declare exit handler for table_missing
BEGIN

CREATE TABLE IF NOT EXISTS `purge_skus_building_bins_by_event_log` (
  `sku` int(10) unsigned NOT NULL DEFAULT '0',
  `building_bin` varchar(11) NOT NULL DEFAULT '',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `modify_date` timestamp not null default 0,
  `purge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY (`sku`,`building_bin`),
  KEY `modify_date` (`modify_date`,`sku`),
  KEY (`purge_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SELECT 'Operation halted. Please re-run this sproc';

END;


drop table if exists TMP_purge_skus_building_bins_by_event;
create table if not exists TMP_purge_skus_building_bins_by_event(sku int unsigned primary key);

insert ignore into TMP_purge_skus_building_bins_by_event(sku)
SELECT sku
FROM inventory
WHERE event_id = event_id_param;

INSERT IGNORE INTO purge_skus_building_bins_by_event_log(sku, building_bin, quantity, modify_date)
select skus_building_bins.sku, skus_building_bins.building_bin, skus_building_bins.quantity, skus_building_bins.modify_date
from skus_building_bins
inner join TMP_purge_skus_building_bins_by_event using(sku);

delete ignore skus_building_bins
from skus_building_bins
inner join TMP_purge_skus_building_bins_by_event using(sku);

drop table if exists TMP_purge_skus_building_bins_by_event;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purge_ups_labels`()
begin

drop table if exists purge_ups_labels;
create table if not exists purge_ups_labels(ups_label_id int unsigned primary key) engine=MyISAM default charset=latin1 ROW_FORMAT=fixed;
INSERT IGNORE INTO purge_ups_labels(ups_label_id)
select ups_label_id from ups_labels where created_date < current_date() - interval 1 month;

delete ups_labels from purge_ups_labels inner join ups_labels using(ups_label_id);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reassign_member_sids`()
BEGIN


CREATE TEMPORARY TABLE MEMBER_SID_PUB_SITE_REASSIGN(member_id int unsigned primary key, pub_site_id int unsigned, sid int unsigned)
SELECT members.member_id, members.pub_site_id, members.sid,
CASE pub_site_id
  WHEN 14 THEN 92185
  WHEN 19 THEN 87304
  WHEN 21 THEN 46438
  WHEN 24 THEN 37554
END AS new_sid

FROM members
WHERE (pub_site_id = 14 AND sid != 92185)
   OR (pub_site_id = 19 AND sid != 87304)
   OR (pub_site_id = 21 AND sid != 46438)
   OR (pub_site_id = 24 AND sid != 37554);

UPDATE MEMBER_SID_PUB_SITE_REASSIGN INNER JOIN members USING(member_id)
SET members.sid = MEMBER_SID_PUB_SITE_REASSIGN.new_sid;

DROP TABLE IF EXISTS MEMBER_SID_PUB_SITE_REASSIGN;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reconcile_members_last_visit`()
BEGIN

INSERT IGNORE INTO internal_reconcile_member_last_visit(member_id, last_visit_date)
select member_id, login_date from members_last_login
order by member_id asc
limit 5000;

update internal_reconcile_member_last_visit inner join members using(member_id)
set members.last_visit = internal_reconcile_member_last_visit.last_visit_date;

delete members_last_login from internal_reconcile_member_last_visit inner join members_last_login using(member_id);

truncate internal_reconcile_member_last_visit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reconcile_returns_complete_date`()
begin


drop table if exists tmp_unset_return_complete_date;
create table if not exists tmp_unset_return_complete_date
(
return_id int unsigned primary key,
complete_date datetime not null default '0000-00-00 00:00:00'
);

INSERT IGNORE INTO tmp_unset_return_complete_date(return_id, complete_date)
select return_items.return_id, `returns`.complete_date
from return_items INNER JOIN `returns` USING(return_id)
where `returns`.complete_date > 0
group by return_items.return_id
HAVING SUM(return_item_status NOT IN(100,10)) > 0;

UPDATE IGNORE tmp_unset_return_complete_date inner join `returns` using(return_id)
SET `returns`.complete_date = 0;

insert ignore into unset_return_complete_date(return_id, complete_date)
select return_id, complete_date
from tmp_unset_return_complete_date;

delete ignore unset_return_complete_date from unset_return_complete_date where unset_date < current_date() - interval 1 year;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_inventory_available`(in date_param date)
begin



DECLARE low_date, high_date datetime;


CALL get_inventory_accuracy_date_range(date_param, low_date, high_date);

DROP TABLE IF EXISTS affected_skus, affected_sku_event_quantities, change_inventory;


CREATE TABLE IF NOT EXISTS affected_skus(sku int unsigned, event_id int unsigned, primary key(sku, event_id));
INSERT IGNORE INTO affected_skus(sku, event_id)
SELECT sku, event_id
FROM `events` INNER JOIN inventory USING(event_id)
WHERE event_type IN('pre_event', 'owned_inv')
AND start_date BETWEEN low_date AND high_date;


CREATE TABLE IF NOT EXISTS affected_sku_event_quantities(sku int unsigned, event_id int unsigned, quantity int unsigned, primary key(event_id, sku));
INSERT IGNORE INTO affected_sku_event_quantities(sku, event_id, quantity)
SELECT affected_skus.sku, affected_skus.event_id, SUM(skus_building_bins.quantity) as total_qty
FROM affected_skus INNER JOIN skus_building_bins USING(sku, event_id)
GROUP BY affected_skus.sku, affected_skus.event_id;

CREATE TABLE IF NOT EXISTS change_inventory
(
  event_id int unsigned,
  sku int unsigned,
  previous_available int unsigned,
  new_available int unsigned,
  change_date timestamp not null default current_timestamp,
  primary key(event_id, sku)
);

INSERT IGNORE INTO change_inventory(event_id, sku, previous_available, new_available)
SELECT inventory.event_id, inventory.sku, inventory.available, 0
FROM affected_skus inner join inventory using(event_id, sku)
WHERE inventory.sold <= 0;

REPLACE INTO change_inventory(event_id, sku, previous_available, new_available)
SELECT inventory.event_id, inventory.sku, inventory.available, IF(affected_sku_event_quantities.quantity < inventory.available, affected_sku_event_quantities.quantity, inventory.available)
FROM affected_sku_event_quantities INNER JOIN inventory USING(event_id, sku)
WHERE inventory.sold <= 0 AND inventory.active = 1;

UPDATE IGNORE change_inventory INNER JOIN inventory USING(event_id, sku)
SET inventory.available = change_inventory.new_available;

INSERT IGNORE INTO inventory_accuracy_log(event_id, sku, previous_available, new_available, change_date, event, brand, style_num, style, color, size, was_inventory_active, event_start_date, event_start_time)
SELECT change_inventory.event_id, change_inventory.sku, change_inventory.previous_available, change_inventory.new_available, change_inventory.change_date, events.title as event, brands.brand, styles.style_num, styles.name as style, skus.color, skus.size, inventory.active, DATE(`events`.start_date), TIME(`events`.start_date)
FROM change_inventory
INNER JOIN inventory USING(event_id, sku)
INNER JOIN events USING(event_id)
INNER JOIN brands USING(brand_id)
INNER JOIN skus USING(sku)
INNER JOIN styles USING(style_id);

DROP TABLE IF EXISTS affected_skus, affected_sku_event_quantities, change_inventory;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_orders_getaways_notes`()
begin

drop table if exists TMP_getaway_orders;
create table if not exists TMP_getaway_orders
(
  order_id int unsigned,
  property_promotion_id int unsigned,
  notes text,
  primary key(order_id)
);

insert ignore into TMP_getaway_orders(order_id, property_promotion_id, notes)
SELECT getaway_orders.order_id, reserved_stay.property_promotion_id, replace(replace(orders.notes, '#', ''), locator, concat(locator, ' Getaways Event ', property_promotion.path))
FROM getaway_orders
inner join orders using(order_id)
inner join getaways.reserved_stay using(locator)
inner join getaways.property_promotion on property_promotion.id = reserved_stay.property_promotion_id
WHERE getaway_orders.property_promotion_id IS NULL;

update ignore TMP_getaway_orders inner join orders using(order_id)
set orders.notes = TMP_getaway_orders.notes;

update ignore  TMP_getaway_orders inner join getaway_orders using(order_id)
set getaway_orders.property_promotion_id = TMP_getaway_orders.property_promotion_id;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_shipment_items_ship_method_id`(shipment_id_param int unsigned, ship_method_param varchar(45))
begin

SET @si = shipment_id_param;
SET @sm = ship_method_param;

PREPARE stmt FROM
'UPDATE IGNORE shipment_items
SET ship_method_id = COALESCE(get_ship_method_id_by_carrier(?), shipment_items.ship_method_id)
WHERE shipment_id = ?';

EXECUTE stmt USING @sm, @si;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `solr_queue_delete_lock`()
    MODIFIES SQL DATA
BEGIN
    SET @connection_id = CONNECTION_ID();
    SET @lock_date = NOW();

    UPDATE solr_queue_delete
    SET
      locked_since = @lock_date,
      connection_id = @connection_id
    WHERE
      locked_since IS NULL
    LIMIT 1
    ;

    SELECT *
    FROM solr_queue_delete
    WHERE
      locked_since = @lock_date
      AND connection_id = @connection_id
    LIMIT 1
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `solr_queue_event_status_changed_lock`()
    MODIFIES SQL DATA
BEGIN
    SET @connection_id = CONNECTION_ID();
    SET @lock_date = NOW();

    UPDATE solr_queue_event_status_changed
    SET
      locked_since = @lock_date,
      connection_id = @connection_id
    WHERE
      locked_since IS NULL
    LIMIT 1
    ;

    SELECT *
    FROM solr_queue_event_status_changed
    WHERE
      locked_since = @lock_date
      AND connection_id = @connection_id
    LIMIT 1
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `solr_queue_flash_lock`()
    MODIFIES SQL DATA
BEGIN
    SET @connection_id = CONNECTION_ID();
    SET @lock_date = NOW();

    UPDATE solr_queue_flash
    SET
      locked_since = @lock_date,
      connection_id = @connection_id
    WHERE
      locked_since IS NULL
    LIMIT 1
    ;

    SELECT *
    FROM solr_queue_flash
    WHERE
      locked_since = @lock_date
      AND connection_id = @connection_id
    LIMIT 1
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `solr_queue_inventory_lock`()
    MODIFIES SQL DATA
BEGIN
    SET @connection_id = CONNECTION_ID();
    SET @lock_date = NOW();

    UPDATE solr_queue_inventory
    SET
      locked_since = @lock_date,
      connection_id = @connection_id
    WHERE
      locked_since IS NULL
    LIMIT 1
    ;

    SELECT *
    FROM solr_queue_inventory
    WHERE
      locked_since = @lock_date
      AND connection_id = @connection_id
    LIMIT 1
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `solr_queue_populate_sku_lock`()
    MODIFIES SQL DATA
BEGIN
    SET @connection_id = CONNECTION_ID();
    SET @lock_date = NOW();

    UPDATE solr_queue_populate_sku
    SET
      locked_since = @lock_date,
      connection_id = @connection_id
    WHERE
      locked_since IS NULL
    LIMIT 1
    ;

    SELECT *
    FROM solr_queue_populate_sku
    WHERE
      locked_since = @lock_date
      AND connection_id = @connection_id
    LIMIT 1
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `solr_queue_populate_style_lock`()
    MODIFIES SQL DATA
BEGIN
    SET @connection_id = CONNECTION_ID();
    SET @lock_date = NOW();

    UPDATE solr_queue_populate_style
    SET
      locked_since = @lock_date,
      connection_id = @connection_id
    WHERE
      locked_since IS NULL
    LIMIT 1
    ;

    SELECT *
    FROM solr_queue_populate_style
    WHERE
      locked_since = @lock_date
      AND connection_id = @connection_id
    LIMIT 1
    ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sync_getaways_orders`()
begin


insert into getaway_orders(order_id, locator)
select order_id, left(trim(substring_index(notes, ' # ', -1)), 8) as reference_id
from orders where notes regexp 'Getaways Reference'
on duplicate key update locator = VALUES(locator);

update ignore getaway_orders INNER JOIN getaways.reserved_stay USING(locator)
SET getaway_orders.property_promotion_id = reserved_stay.property_promotion_id
where getaway_orders.property_promotion_id IS NULL and reserved_stay.property_promotion_id IS NOT NULL;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

