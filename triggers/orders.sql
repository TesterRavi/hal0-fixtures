
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_orders_ai AFTER INSERT ON orders
  FOR EACH ROW BEGIN
    INSERT INTO orders_aud
            (	order_id,
	order_date,
	member_id,
	session_id,
	billing_id,
	shipping_id,
	ship_method_id,
	payment_method,
	card_number,
	transaction_id,
	transaction_type,
	ordered,
	tax_rate,
	subtotal,
	taxes,
	freight,
	freight_class,
	total,
	charged,
	rcredit,
	ccredit,
	scredit,
	coupon,
	gift_card,
	fcoupon,
	acredit,
	notes,
	processor,
	sid,
	mid,
	cid,
	aid,
	surcharge,
	surcharge_rate,
	fraud,
	age_verified,
                omid_id,
             action,
            action_date,
           action_timeint)
        VALUES
            (	NEW.order_id,
	NEW.order_date,
	NEW.member_id,
	NEW.session_id,
	NEW.billing_id,
	NEW.shipping_id,
	NEW.ship_method_id,
	NEW.payment_method,
	NEW.card_number,
	NEW.transaction_id,
	NEW.transaction_type,
	NEW.ordered,
	NEW.tax_rate,
	NEW.subtotal,
	NEW.taxes,
	NEW.freight,
	NEW.freight_class,
	NEW.total,
	NEW.charged,
	NEW.rcredit,
	NEW.ccredit,
	NEW.scredit,
	NEW.coupon,
	NEW.gift_card,
	NEW.fcoupon,
	NEW.acredit,
	NEW.notes,
	NEW.processor,
	NEW.sid,
	NEW.mid,
	NEW.cid,
	NEW.aid,
	NEW.surcharge,
	NEW.surcharge_rate,
	NEW.fraud,	
	NEW.age_verified,
                NEW.omid_id,
             'INS',
             now(),
 (select conv(concat(substring(uid, 16, 3) , substring(uid, 10, 4) , substring(uid, 1, 8) ), 16, 10) as timeint from (select uuid() uid) a)
            );
  END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_orders_au AFTER UPDATE ON orders
  FOR EACH ROW BEGIN
    INSERT INTO orders_aud
            (	order_id,
	order_date,
	member_id,
	session_id,
	billing_id,
	shipping_id,
	ship_method_id,
	payment_method,
	card_number,
	transaction_id,
	transaction_type,
	ordered,
	tax_rate,
	subtotal,
	taxes,
	freight,
	freight_class,
	total,
	charged,
	rcredit,
	ccredit,
	scredit,
	coupon,
	gift_card,
	fcoupon,
	acredit,
	notes,
	processor,
	sid,
	mid,
	cid,
	aid,
	surcharge,
	surcharge_rate,
	fraud,
	age_verified,
                omid_id,
            action,
            action_date,
           action_timeint)

        VALUES
            (	NEW.order_id,
	NEW.order_date,
	NEW.member_id,
	NEW.session_id,
	NEW.billing_id,
	NEW.shipping_id,
	NEW.ship_method_id,
	NEW.payment_method,
	NEW.card_number,
	NEW.transaction_id,
	NEW.transaction_type,
	NEW.ordered,
	NEW.tax_rate,
	NEW.subtotal,
	NEW.taxes,
	NEW.freight,
	NEW.freight_class,
	NEW.total,
	NEW.charged,
	NEW.rcredit,
	NEW.ccredit,
	NEW.scredit,
	NEW.coupon,
	NEW.gift_card,
	NEW.fcoupon,
	NEW.acredit,
	NEW.notes,
	NEW.processor,
	NEW.sid,
	NEW.mid,
	NEW.cid,
	NEW.aid,
	NEW.surcharge,
	NEW.surcharge_rate,
	NEW.fraud,
	NEW.age_verified,
                NEW.omid_id,
             'UPD',
            now(),
 (select conv(concat(substring(uid, 16, 3) , substring(uid, 10, 4) , substring(uid, 1, 8) ), 16, 10) as timeint from (select uuid() uid) a)
 
            );
  END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_orders_ad AFTER DELETE ON orders
  FOR EACH ROW BEGIN
    INSERT INTO orders_aud
            (	order_id,
	order_date,
	member_id,
	session_id,
	billing_id,
	shipping_id,
	ship_method_id,
	payment_method,
	card_number,
	transaction_id,
	transaction_type,
	ordered,
	tax_rate,
	subtotal,
	taxes,
	freight,
	freight_class,
	total,
	charged,
	rcredit,
	ccredit,
	scredit,
	coupon,
	gift_card,
	fcoupon,
	acredit,
	notes,
	processor,
	sid,
	mid,
	cid,
	aid,
	surcharge,
	surcharge_rate,
	fraud,
	age_verified,
                omid_id,
            action,
            action_date,
           action_timeint)

        VALUES
            (	OLD.order_id,
	OLD.order_date,
	OLD.member_id,
	OLD.session_id,
	OLD.billing_id,
	OLD.shipping_id,
	OLD.ship_method_id,
	OLD.payment_method,
	OLD.card_number,
	OLD.transaction_id,
	OLD.transaction_type,
	OLD.ordered,
	OLD.tax_rate,
	OLD.subtotal,
	OLD.taxes,
	OLD.freight,
	OLD.freight_class,
	OLD.total,
	OLD.charged,
	OLD.rcredit,
	OLD.ccredit,
	OLD.scredit,
	OLD.coupon,
	OLD.gift_card,
	OLD.fcoupon,
	OLD.acredit,
	OLD.notes,
	OLD.processor,
	OLD.sid,
	OLD.mid,
	OLD.cid,
	OLD.aid,
	OLD.surcharge,
	OLD.surcharge_rate,
	OLD.fraud,
	OLD.age_verified,
                OLD.omid_id,
             'DEL',
            now(),
 (select conv(concat(substring(uid, 16, 3) , substring(uid, 10, 4) , substring(uid, 1, 8) ), 16, 10) as timeint from (select uuid() uid) a)
             );
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

