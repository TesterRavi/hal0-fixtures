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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category` varchar(30) NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('Accessories'),('ActiveWear'),('ActiveWear Tops'),('Art'),('Arts & Crafts'),('Baby Toys'),('Bags'),('Baked Goods & Desserts'),('Bath Accessories'),('Bath Time'),('Beauty Electronics'),('Bedding'),('Bedding Sets'),('Belts'),('Bicycles'),('Bodysuits'),('Books/Music/Videos'),('Bottoms'),('Building Sets & Blocks'),('Candles'),('Candy and Chocolate'),('Candy_and Chocolate'),('Casual Collections'),('Cheese'),('Coffee & Tea'),('Collections'),('Collections Better'),('Collections Casual'),('Collections Contemporary'),('Collections Designer'),('Collections VOT'),('Color'),('Cooking Wreaths & Garlands'),('Cookware'),('Costume Jewelry'),('Cutlery'),('Decor & Gifting'),('Denim'),('Designer Watches'),('Diaper Bags & Carriers'),('Dinnerware'),('Dinnerware & Serveware'),('Dolls'),('Domestic Wine'),('Dress Furnishings'),('Dress Pants'),('Dresses'),('Electrics'),('Feeding & Bath'),('Fine Jewelry'),('Fragrance'),('Fruit'),('Furnishings'),('Gadgets & Tools'),('Games & Puzzles'),('Gear'),('Gift Certificate'),('Gifts'),('Gifts & Accessories'),('Glassware & Bar'),('Gourmet Popcorn'),('Hair Accessories'),('Hair Care'),('Haire Care'),('Handbags'),('Hors D\'oeuvres'),('Imported Wine'),('Indoor Accent'),('Indoor Casegoods'),('Indoor Furniture'),('Indoor Occasional'),('Intimate Apparel'),('Irons & Steamers'),('Jackets and Blazers'),('Jackets_and Blazers'),('Jewelry'),('Knitwear'),('Layette & Infantwear'),('Learning'),('Leather Outerwear'),('Lighting'),('Long Sleeve Knits'),('Long Sleeve Wovens'),('LS Wovens'),('Luggage'),('Maternity'),('Mealtime'),('Meat'),('Meat & Seafood'),('MISC'),('Mixed Wine'),('Nails'),('Non Alcoholic Beverage'),('Nuts'),('Oils & Vinegar'),('One Pieces'),('Oral Care'),('Out & About'),('Outdoor Furniture'),('Outdoor Play'),('Outerwear'),('Pajamas'),('Pantry Ingredients'),('Pants'),('Personal Care'),('Personal Furnishings'),('Pet Food'),('Petite'),('Pillows'),('Plus'),('Plush Toys'),('Premium Denim'),('Prepared Food'),('Pretend Play'),('Ride Ons'),('Room Decor & Gifting'),('RTA'),('Rugs'),('Scales'),('Seafood & Fish'),('Seasonal'),('Service'),('Sets'),('Shoes'),('Short Sleeve Knits'),('Shorts'),('Skincare'),('Sleepwear'),('Small Leather Goods'),('Soup'),('Sportswear'),('Sterling Jewelry'),('Storage'),('Strollers & Carseats'),('Suits'),('Sunglasses'),('Supplies'),('Sweaters'),('Swimwear'),('Table Linens'),('Tailored Clothing'),('Tops'),('Towels'),('Toys'),('Tuxedos'),('Unisex'),('Vacuums'),('Vests'),('Vitamins'),('VOT Denim'),('Watch'),('Watches');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER add_third_party_category AFTER INSERT
ON categories FOR EACH ROW
BEGIN

INSERT IGNORE INTO third_party_categories
 SET category = NEW.category;

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

-- Dump completed on 2015-02-24  0:05:05
