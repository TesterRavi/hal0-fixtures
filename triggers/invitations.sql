
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`10.0.0.220`*/ /*!50003 TRIGGER invitations_bi BEFORE INSERT ON invitations FOR EACH ROW
BEGIN

 DECLARE v_inv_camp_id INT UNSIGNED DEFAULT 1;
 DECLARE v_member_incentive DECIMAL(10,2) DEFAULT 10.00;
 DECLARE v_member_specific TINYINT UNSIGNED DEFAULT 0;

 DECLARE CONTINUE HANDLER FOR 1329
  SET v_inv_camp_id = 1, v_member_incentive = 10.00, v_member_specific = 0;

 SELECT invitation_campaigns.inv_camp_id, invitation_campaigns.member_incentive, invitation_promotions.member_specific
 INTO v_inv_camp_id, v_member_incentive, v_member_specific
 FROM invitation_promotions INNER JOIN invitation_campaigns USING(inv_camp_id)
 WHERE start_date <= NOW() AND end_date > NOW()
 ORDER BY inv_camp_id DESC
 LIMIT 1;

 IF v_member_specific = 1 THEN

    SELECT invitation_campaigns_members.inv_camp_id
    INTO v_inv_camp_id
    FROM invitation_campaigns_members
    WHERE inv_camp_id = v_inv_camp_id and member_id = NEW.member_id;

 END IF;

 SET NEW.inv_camp_id = v_inv_camp_id;
 SET NEW.member_incentive = v_member_incentive;

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

