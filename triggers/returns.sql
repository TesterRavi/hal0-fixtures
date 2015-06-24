
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_returns_request_date BEFORE INSERT ON returns
FOR EACH ROW
BEGIN
SET NEW.request_date = NOW();
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_returns_ai AFTER INSERT ON returns
  FOR EACH ROW BEGIN
    INSERT INTO returns_aud
            (	return_id,
	request_date,
	creation_method,
	ship_date,
	received_date,
	complete_date,
	member_id,
	shipping_id,
	ship_method_id,
	return_payment_method,
	tracking_num,
	tracking_info_date,
	return_ship_method,
	returned,
	subtotal,
	taxes,
	freight,
	surcharge,
	freight_taxes,
	total,
	charged,
	rcredit,
	ccredit,
	coupon,
	fcoupon,
	giftcard,
	rlabel,
	label_cost,
	comments,
	notes,
	restocking_fee,
            action,
            action_date,
            action_timeint)
        VALUES
            (	NEW.return_id,
	NEW.request_date,
	NEW.creation_method,
	NEW.ship_date,
	NEW.received_date,
	NEW.complete_date,
	NEW.member_id,
	NEW.shipping_id,
	NEW.ship_method_id,
	NEW.return_payment_method,
	NEW.tracking_num,
	NEW.tracking_info_date,
	NEW.return_ship_method,
	NEW.returned,
	NEW.subtotal,
	NEW.taxes,
	NEW.freight,
	NEW.surcharge,
	NEW.freight_taxes,
	NEW.total,
	NEW.charged,
	NEW.rcredit,
	NEW.ccredit,
	NEW.coupon,
	NEW.fcoupon,
	NEW.giftcard,
	NEW.rlabel,
	NEW.label_cost,
	NEW.comments,
	NEW.notes,
	NEW.restocking_fee,
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_returns_au AFTER UPDATE ON returns
  FOR EACH ROW BEGIN
    INSERT INTO returns_aud
            (	return_id,
	request_date,
	creation_method,
	ship_date,
	received_date,
	complete_date,
	member_id,
	shipping_id,
	ship_method_id,
	return_payment_method,
	tracking_num,
	tracking_info_date,
	return_ship_method,
	returned,
	subtotal,
	taxes,
	freight,
	surcharge,
	freight_taxes,
	total,
	charged,
	rcredit,
	ccredit,
	coupon,
	fcoupon,
	giftcard,
	rlabel,
	label_cost,
	comments,
	notes,
	restocking_fee,
            action,
            action_date,
           action_timeint)
        VALUES
            (	NEW.return_id,
	NEW.request_date,
	NEW.creation_method,
	NEW.ship_date,
	NEW.received_date,
	NEW.complete_date,
	NEW.member_id,
	NEW.shipping_id,
	NEW.ship_method_id,
	NEW.return_payment_method,
	NEW.tracking_num,
	NEW.tracking_info_date,
	NEW.return_ship_method,
	NEW.returned,
	NEW.subtotal,
	NEW.taxes,
	NEW.freight,
	NEW.surcharge,
	NEW.freight_taxes,
	NEW.total,
	NEW.charged,
	NEW.rcredit,
	NEW.ccredit,
	NEW.coupon,
	NEW.fcoupon,
	NEW.giftcard,
	NEW.rlabel,
	NEW.label_cost,
	NEW.comments,
	NEW.notes,
	NEW.restocking_fee,
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_returns_ad AFTER DELETE ON returns
  FOR EACH ROW BEGIN
    INSERT INTO returns_aud
            (	return_id,
	request_date,
	creation_method,
	ship_date,
	received_date,
	complete_date,
	member_id,
	shipping_id,
	ship_method_id,
	return_payment_method,
	tracking_num,
	tracking_info_date,
	return_ship_method,
	returned,
	subtotal,
	taxes,
	freight,
	surcharge,
	freight_taxes,
	total,
	charged,
	rcredit,
	ccredit,
	coupon,
	fcoupon,
	giftcard,
	rlabel,
	label_cost,
	comments,
	notes,
	restocking_fee,
            action,
            action_date,
           action_timeint)
        VALUES
            (	OLD.return_id,
	OLD.request_date,
	OLD.creation_method,
	OLD.ship_date,
	OLD.received_date,
	OLD.complete_date,
	OLD.member_id,
	OLD.shipping_id,
	OLD.ship_method_id,
	OLD.return_payment_method,
	OLD.tracking_num,
	OLD.tracking_info_date,
	OLD.return_ship_method,
	OLD.returned,
	OLD.subtotal,
	OLD.taxes,
	OLD.freight,
	OLD.surcharge,
	OLD.freight_taxes,
	OLD.total,
	OLD.charged,
	OLD.rcredit,
	OLD.ccredit,
	OLD.coupon,
	OLD.fcoupon,
	OLD.giftcard,
	OLD.rlabel,
	OLD.label_cost,
	OLD.comments,
	OLD.notes,
	OLD.restocking_fee,
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

