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
-- Table structure for table `subdomains`
--

DROP TABLE IF EXISTS `subdomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdomains` (
  `subdomain` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`subdomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdomains`
--

LOCK TABLES `subdomains` WRITE;
/*!40000 ALTER TABLE `subdomains` DISABLE KEYS */;
INSERT INTO `subdomains` VALUES ('','Publisher Sites - '),('*','Default wildcard'),('anewmode','Publisher Sites - anewmode.com'),('bagbliss','Publisher Sites - BagBliss.com'),('bazaar','Harpers Bazaar'),('blingware','Publisher Sites - www.hautelook.com'),('blogher','BlogHer'),('chris','chris'),('chris-test','chris test'),('cosmogirl','Cosmo Girl'),('cosmopolitan','Cosmopolitan'),('countryliving','Country Living'),('denimology','Publisher Sites - denimology.com'),('details','Details'),('earlybird','Earlybird - William Rast'),('esquire','Esquire'),('fashionablemedia','Publisher Sites - thefashionablehousewife.com'),('foodnetwork','The Food Network'),('getaways','Getaways / Bonvoyou'),('hautelookandy','Publisher Sites - hautelookandy.wordpress.com'),('housebeauprivate','House Beautiful Private Event'),('housebeautiful','House Beautiful'),('housekeeping','Good Housekeeping'),('idkhsdi','I dont know how she does it'),('JediTemple','Publisher Sites - www.JediTemple.com'),('lucky','Lucky Magazine'),('marieclaire','Marie Claire'),('men','men'),('mens','mens'),('more','More Magazine Cobranded Reg'),('onbrd','test'),('oprah','Oprah'),('realbeauty','Real Beauty'),('redbook','Redbook'),('seventeen','Seventeen'),('shape','SHAPE Magazine Partnership'),('shoparatti','Partnership with Shoparatti'),('sobieblog','Publisher Sites - www.sobieblog.com'),('spamag','Spa Magazine'),('styehive','Publisher Sites - www.stylehive.com'),('temptalia','Publisher Sites - temptalia.com'),('testchris',''),('thebudgetbabe','Publisher Sites - www.thebudgetbabe.com'),('townandcountry','Town and Country'),('veranda','Veranda'),('visa','Partnership with VISA'),('vitaljuice','Publisher Sites - www.vitaljuice.com'),('www','Main HauteLook site'),('www2','www2');
/*!40000 ALTER TABLE `subdomains` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:21
