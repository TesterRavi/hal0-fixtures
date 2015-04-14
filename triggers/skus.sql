
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_skus_created_at BEFORE INSERT ON skus
FOR EACH ROW
  BEGIN
    SET NEW.created_at = NOW();
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_skus_insert AFTER INSERT ON skus
FOR EACH ROW
  BEGIN
    INSERT INTO solr_queue_inventory (sku, triggered_at) VALUES (NEW.sku, NOW());
    INSERT INTO solr_queue_populate_sku (sku, triggered_at) VALUES (NEW.sku, NOW());

    
    CALL business_skus_map_put_sku(NEW.style_id, NEW.sku);
    CALL member_skus_map_put_sku(NEW.style_id, NEW.sku);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_skus_update AFTER UPDATE ON skus
FOR EACH ROW
  BEGIN
    IF NOT (NEW.quantity <=> OLD.quantity)
    THEN
      INSERT INTO solr_queue_inventory (sku, triggered_at) VALUES (NEW.sku, NOW());
    END IF;

    IF NOT (NEW.style_id <=> OLD.style_id)
    THEN
      

      
      CALL business_skus_map_delete_sku(NEW.sku);
      CALL member_skus_map_delete_sku(NEW.sku);

      
      CALL business_skus_map_put_sku(NEW.style_id, NEW.sku);
      CALL member_skus_map_put_sku(NEW.style_id, NEW.sku);
    END IF;

    
    IF NOT (NEW.msrp <=> OLD.msrp)
      OR NOT (NEW.price <=> OLD.price)
      OR NOT (NEW.barcode <=> OLD.barcode)
      OR NOT (NEW.upc <=> OLD.upc)
      OR NOT (NEW.size <=> OLD.size)
      OR NOT (NEW.std_size <=> OLD.std_size)
      OR NOT (NEW.color <=> OLD.color)
      OR NOT (NEW.color_family <=> OLD.color_family)
      OR NOT (NEW.location_brand_id <=> OLD.location_brand_id)
      OR NOT (NEW.location <=> OLD.location)
      OR NOT (NEW.sort <=> OLD.sort)
      OR NOT (NEW.style_id <=> OLD.style_id)
      OR NOT (NEW.clearance_date <=> OLD.clearance_date)
      OR NOT (NEW.allow_persistent_catalog <=> OLD.allow_persistent_catalog)
    THEN
      INSERT INTO solr_queue_populate_sku (sku, triggered_at) VALUES (NEW.sku, NOW());
    END IF;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_skus_delete AFTER DELETE ON skus
FOR EACH ROW
  BEGIN
    INSERT INTO solr_queue_delete (sku, triggered_at) VALUES (OLD.sku, NOW());

    DELETE FROM solr_queue_populate_sku WHERE sku = OLD.sku;
    DELETE FROM solr_queue_inventory WHERE sku = OLD.sku;
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

