
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_members_created_optin_date BEFORE INSERT ON members
FOR EACH ROW
  BEGIN
    SET NEW.created_date = NOW();
    SET NEW.optin_modified = NOW();
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_members_ai AFTER INSERT ON members
   FOR EACH ROW BEGIN
    INSERT INTO members_aud
            (        member_id,
        invitation_code,
        email,
        password,
        `key`,
        DEPRECATED_status,
        role,
        join_date,
        join_site,
        first_name,
        last_name,
        zipcode,
        country_iso,
        gender,
        birthday,
        last_visit,
        soft_login,
        fraud_flag,
        fetchback,
        sid,
        mid,
        cid,
        aid,
        username,
        inv_camp_id,
        pub_site_id,
        tid,
        member_status,
        optin_women,
        optin_men,
        optin_kids,
        optin_home,
        optin_third_party,
        optin_modified,
        optin,
  rack_optin,
  inc_optin,
        esp,
        notes,
        omid,
        action,
        action_date,
        action_timeint)
        VALUES
            (        NEW.member_id,
        NEW.invitation_code,
        NEW.email,
        NEW.password,
        NEW.key,
        NEW.DEPRECATED_status,
        NEW.role,
        NEW.join_date,
        NEW.join_site,
        NEW.first_name,
        NEW.last_name,
        NEW.zipcode,
        NEW.country_iso,
        NEW.gender,
        NEW.birthday,
        NEW.last_visit,
        NEW.soft_login,
        NEW.fraud_flag,
        NEW.fetchback,
        NEW.sid,
        NEW.mid,
        NEW.cid,
        NEW.aid,
        NEW.username,
        NEW.inv_camp_id,
        NEW.pub_site_id,
        NEW.tid,
        NEW.member_status,
        NEW.optin_women,
        NEW.optin_men,
        NEW.optin_kids,
        NEW.optin_home,
        NEW.optin_third_party,
        NEW.optin_modified,
        NEW.optin,
  NEW.rack_optin,
  NEW.inc_optin,
        NEW.esp,
        NEW.notes,
        NEW.omid,
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_members_au AFTER UPDATE ON members
  FOR EACH ROW BEGIN
    INSERT INTO members_aud
            (        member_id,
        invitation_code,
        email,
        password,
        `key`,
        DEPRECATED_status,
        role,
        join_date,
        join_site,
        first_name,
        last_name,
        zipcode,
        country_iso,
        gender,
        birthday,
        last_visit,
        soft_login,
        fraud_flag,
        fetchback,
        sid,
        mid,
        cid,
        aid,
        username,
        inv_camp_id,
        pub_site_id,
        tid,
        member_status,
        optin_women,
        optin_men,
        optin_kids,
        optin_home,
        optin_third_party,
        optin_modified,
        optin,
  rack_optin,
  inc_optin,
        esp,
        notes,
        omid,
            action,
        action_date,
        action_timeint)
        VALUES
            (        NEW.member_id,
        NEW.invitation_code,
        NEW.email,
        NEW.password,
        NEW.key,
        NEW.DEPRECATED_status,
        NEW.role,
        NEW.join_date,
        NEW.join_site,
        NEW.first_name,
        NEW.last_name,
        NEW.zipcode,
        NEW.country_iso,
        NEW.gender,
        NEW.birthday,
        NEW.last_visit,
        NEW.soft_login,
        NEW.fraud_flag,
        NEW.fetchback,
        NEW.sid,
        NEW.mid,
        NEW.cid,
        NEW.aid,
        NEW.username,
        NEW.inv_camp_id,
        NEW.pub_site_id,
        NEW.tid,
        NEW.member_status,
        NEW.optin_women,
        NEW.optin_men,
        NEW.optin_kids,
        NEW.optin_home,
        NEW.optin_third_party,
        NEW.optin_modified,
        NEW.optin,
  NEW.rack_optin,
  NEW.inc_optin,
        NEW.esp,
        NEW.notes,
        NEW.omid,
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_members_ad AFTER DELETE ON members
  FOR EACH ROW BEGIN
    INSERT INTO members_aud
            (        member_id,
        invitation_code,
        email,
        password,
        `key`,
        DEPRECATED_status,
        role,
        join_date,
        join_site,
        first_name,
        last_name,
        zipcode,
        country_iso,
        gender,
        birthday,
        last_visit,
        soft_login,
        fraud_flag,
        fetchback,
        sid,
        mid,
        cid,
        aid,
        username,
        inv_camp_id,
        pub_site_id,
        tid,
        member_status,
        optin_women,
        optin_men,
        optin_kids,
        optin_home,
        optin_third_party,
        optin_modified,
        optin,
  rack_optin,
  inc_optin,
        esp,
        notes,
        omid,
            action,
        action_date,
        action_timeint)
        VALUES
            (        OLD.member_id,
        OLD.invitation_code,
        OLD.email,
        OLD.password,
        OLD.key,
        OLD.DEPRECATED_status,
        OLD.role,
        OLD.join_date,
        OLD.join_site,
        OLD.first_name,
        OLD.last_name,
        OLD.zipcode,
        OLD.country_iso,
        OLD.gender,
        OLD.birthday,
        OLD.last_visit,
        OLD.soft_login,
        OLD.fraud_flag,
        OLD.fetchback,
        OLD.sid,
        OLD.mid,
        OLD.cid,
        OLD.aid,
        OLD.username,
        OLD.inv_camp_id,
        OLD.pub_site_id,
        OLD.tid,
        OLD.member_status,
        OLD.optin_women,
        OLD.optin_men,
        OLD.optin_kids,
        OLD.optin_home,
        OLD.optin_third_party,
        OLD.optin_modified,
        OLD.optin,
  OLD.rack_optin,
  OLD.inc_optin,
        OLD.esp,
        OLD.notes,
        OLD.omid,
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

