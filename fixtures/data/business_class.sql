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
-- Table structure for table `business_class`
--

DROP TABLE IF EXISTS `business_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_class` (
  `business_class_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL,
  `is_active_flag` char(1) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`business_class_id`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_class`
--

LOCK TABLES `business_class` WRITE;
/*!40000 ALTER TABLE `business_class` DISABLE KEYS */;
INSERT INTO `business_class` VALUES (10,'Basic Dress Shirts','Y',0,'2013-10-21 23:09:51'),(10,'Blouses','Y',0,'2013-10-21 23:09:51'),(10,'Blouses/Shirts','Y',0,'2013-10-21 23:09:51'),(10,'Board Books','Y',0,'2013-10-21 23:09:51'),(10,'Boys Accessories','Y',0,'2013-10-21 23:09:51'),(10,'Bras','Y',0,'2013-10-21 23:09:51'),(10,'Cotton','Y',0,'2013-10-21 23:09:51'),(10,'Daytime','Y',0,'2013-10-21 23:09:51'),(10,'Denim','Y',0,'2013-10-21 23:09:51'),(10,'Designer Sunglasses','Y',0,'2013-10-21 23:09:51'),(10,'Dresses','Y',0,'2013-10-21 23:09:51'),(10,'Flats','Y',0,'2013-10-21 23:09:51'),(10,'Furniture','Y',0,'2013-10-21 23:09:51'),(10,'Girls Accessories','Y',0,'2013-10-21 23:09:51'),(10,'Girls Closed Shoes','Y',0,'2013-10-21 23:09:51'),(10,'Gyms And Playmats','Y',0,'2013-10-21 23:09:51'),(10,'Home Organization','Y',0,'2013-10-21 23:09:51'),(10,'Indoor','Y',0,'2013-10-21 23:09:51'),(10,'Jewelry','Y',0,'2013-10-21 23:09:51'),(10,'Ladies Watches','Y',0,'2013-10-21 23:09:51'),(10,'Long Sleeve Shirts','Y',0,'2013-10-21 23:09:51'),(10,'Makeup','Y',0,'2013-10-21 23:09:51'),(10,'Open','Y',0,'2013-10-21 23:09:51'),(10,'Pants/Denim','Y',0,'2013-10-21 23:09:51'),(10,'Sheer Hosiery','Y',0,'2013-10-21 23:09:51'),(10,'Shirts','Y',0,'2013-10-21 23:09:51'),(10,'Shoe Accessories','Y',0,'2013-10-21 23:09:51'),(10,'Shoulder','Y',0,'2013-10-21 23:09:51'),(10,'Skirts','Y',0,'2013-10-21 23:09:51'),(10,'Sport Tops','Y',0,'2013-10-21 23:09:51'),(10,'Strollers','Y',0,'2013-10-21 23:09:51'),(10,'Suits','Y',0,'2013-10-21 23:09:51'),(12,'Boys Closed Shoes','Y',0,'2013-10-21 23:09:51'),(12,'Socks And Tights','Y',0,'2013-10-21 23:09:51'),(15,'Boys Tops','Y',0,'2013-10-21 23:09:51'),(15,'Full Fit Bras','Y',0,'2013-10-21 23:09:51'),(15,'Girls Underwear','Y',0,'2013-10-21 23:09:51'),(15,'Hats','Y',0,'2013-10-21 23:09:51'),(15,'Tops','Y',0,'2013-10-21 23:09:51'),(17,'Boys Sweaters','Y',0,'2013-10-21 23:09:51'),(17,'Infant Accessories','Y',0,'2013-10-21 23:09:51'),(20,'Blouses','Y',0,'2013-10-21 23:09:51'),(20,'Bottoms','Y',0,'2013-10-21 23:09:51'),(20,'Boys One Pieces','Y',0,'2013-10-21 23:09:51'),(20,'Car Seats','Y',0,'2013-10-21 23:09:51'),(20,'Dress Shirts','Y',0,'2013-10-21 23:09:51'),(20,'Evening Handbags','Y',0,'2013-10-21 23:09:51'),(20,'Fleece','Y',0,'2013-10-21 23:09:51'),(20,'Girls Crib Shoes','Y',0,'2013-10-21 23:09:51'),(20,'Girls Tops','Y',0,'2013-10-21 23:09:51'),(20,'Home Decor','Y',0,'2013-10-21 23:09:51'),(20,'Knits','Y',0,'2013-10-21 23:09:51'),(20,'Mens Watches','Y',0,'2013-10-21 23:09:51'),(20,'Outdoor','Y',0,'2013-10-21 23:09:51'),(20,'Panties','Y',0,'2013-10-21 23:09:51'),(20,'Pants','Y',0,'2013-10-21 23:09:51'),(20,'Pumps','Y',0,'2013-10-21 23:09:51'),(20,'Rugs','Y',0,'2013-10-21 23:09:51'),(20,'Running','Y',0,'2013-10-21 23:09:51'),(20,'Separates','Y',0,'2013-10-21 23:09:51'),(20,'Short Sleeve Shirts','Y',0,'2013-10-21 23:09:51'),(20,'Skirts','Y',0,'2013-10-21 23:09:51'),(20,'Skirts/Shorts','Y',0,'2013-10-21 23:09:51'),(20,'Slip Ons','Y',0,'2013-10-21 23:09:51'),(20,'Socks','Y',0,'2013-10-21 23:09:51'),(20,'Soft Books','Y',0,'2013-10-21 23:09:51'),(20,'Sunglasses','Y',0,'2013-10-21 23:09:51'),(20,'Tees','Y',0,'2013-10-21 23:09:51'),(20,'Tents And Tunnels','Y',0,'2013-10-21 23:09:51'),(20,'Trouser Socks','Y',0,'2013-10-21 23:09:51'),(20,'Woven Tops','Y',0,'2013-10-21 23:09:51'),(20,'WTW','Y',0,'2013-10-21 23:09:51'),(21,'Open','Y',0,'2013-10-21 23:09:51'),(22,'Boys Crib Shoes','Y',0,'2013-10-21 23:09:51'),(25,'Boys Underwear','Y',0,'2013-10-21 23:09:51'),(25,'Denim','Y',0,'2013-10-21 23:09:51'),(25,'Girls Activewear','Y',0,'2013-10-21 23:09:51'),(25,'Highchairs','Y',0,'2013-10-21 23:09:51'),(25,'Science Kits','Y',0,'2013-10-21 23:09:51'),(25,'Skincare','Y',0,'2013-10-21 23:09:51'),(25,'Thongs','Y',0,'2013-10-21 23:09:51'),(25,'Unisex Watches','Y',0,'2013-10-21 23:09:51'),(30,'Bedding','Y',0,'2013-10-21 23:09:51'),(30,'Belts','Y',0,'2013-10-21 23:09:51'),(30,'Blazers','Y',0,'2013-10-21 23:09:51'),(30,'Boys Dresswear','Y',0,'2013-10-21 23:09:51'),(30,'Bra/Panty Sets','Y',0,'2013-10-21 23:09:51'),(30,'Carriers','Y',0,'2013-10-21 23:09:51'),(30,'Casual','Y',0,'2013-10-21 23:09:51'),(30,'Costume Sets','Y',0,'2013-10-21 23:09:51'),(30,'Denim','Y',0,'2013-10-21 23:09:51'),(30,'Flats','Y',0,'2013-10-21 23:09:51'),(30,'Girls Dresses','Y',0,'2013-10-21 23:09:51'),(30,'Hardcover Books','Y',0,'2013-10-21 23:09:51'),(30,'Jackets','Y',0,'2013-10-21 23:09:51'),(30,'Lace Ups','Y',0,'2013-10-21 23:09:51'),(30,'Lighting','Y',0,'2013-10-21 23:09:51'),(30,'Lingerie','Y',0,'2013-10-21 23:09:51'),(30,'Men','Y',0,'2013-10-21 23:09:51'),(30,'Outdoor Play','Y',0,'2013-10-21 23:09:51'),(30,'Readers','Y',0,'2013-10-21 23:09:51'),(30,'Satchel','Y',0,'2013-10-21 23:09:51'),(30,'Short Sleeve Knits','Y',0,'2013-10-21 23:09:51'),(30,'Shorts','Y',0,'2013-10-21 23:09:51'),(30,'Slippers','Y',0,'2013-10-21 23:09:51'),(30,'Suede-Shearling','Y',0,'2013-10-21 23:09:51'),(30,'T-Shirts','Y',0,'2013-10-21 23:09:51'),(30,'Tuxedo Shirts','Y',0,'2013-10-21 23:09:51'),(30,'Walking','Y',0,'2013-10-21 23:09:51'),(32,'Girls Sets','Y',0,'2013-10-21 23:09:51'),(35,'Bath & Body','Y',0,'2013-10-21 23:09:51'),(35,'Bikes And Scooters','Y',0,'2013-10-21 23:09:51'),(35,'Blankets And Throws','Y',0,'2013-10-21 23:09:51'),(35,'Boys Pants','Y',0,'2013-10-21 23:09:51'),(35,'Candles & Diffusers','Y',0,'2013-10-21 23:09:51'),(35,'Clogs/Mules','Y',0,'2013-10-21 23:09:51'),(35,'Clutch','Y',0,'2013-10-21 23:09:51'),(35,'Girls Sweaters','Y',0,'2013-10-21 23:09:51'),(35,'Nursing','Y',0,'2013-10-21 23:09:51'),(37,'Sleeping Bags','Y',0,'2013-10-21 23:09:51'),(40,'Active','Y',0,'2013-10-21 23:09:51'),(40,'Bow Ties','Y',0,'2013-10-21 23:09:51'),(40,'Boys Sandals','Y',0,'2013-10-21 23:09:51'),(40,'Boys Shorts','Y',0,'2013-10-21 23:09:51'),(40,'Camisoles','Y',0,'2013-10-21 23:09:51'),(40,'Costume Earrings','Y',0,'2013-10-21 23:09:51'),(40,'Crossbody','Y',0,'2013-10-21 23:09:51'),(40,'Diaper Bags','Y',0,'2013-10-21 23:09:51'),(40,'Dresses','Y',0,'2013-10-21 23:09:51'),(40,'Fashion Socks','Y',0,'2013-10-21 23:09:51'),(40,'Fleece Tops','Y',0,'2013-10-21 23:09:51'),(40,'Fragrance','Y',0,'2013-10-21 23:09:51'),(40,'Fur','Y',0,'2013-10-21 23:09:51'),(40,'Girls Bottoms','Y',0,'2013-10-21 23:09:51'),(40,'Hosiery','Y',0,'2013-10-21 23:09:51'),(40,'Long','Y',0,'2013-10-21 23:09:51'),(40,'Long Sleeve Knits','Y',0,'2013-10-21 23:09:51'),(40,'Open','Y',0,'2013-10-21 23:09:51'),(40,'Pants','Y',0,'2013-10-21 23:09:51'),(40,'Paperback Books','Y',0,'2013-10-21 23:09:51'),(40,'Rockers And Ride-Ons','Y',0,'2013-10-21 23:09:51'),(40,'Room Decor','Y',0,'2013-10-21 23:09:51'),(40,'Scarves','Y',0,'2013-10-21 23:09:51'),(40,'Seasonal Home','Y',0,'2013-10-21 23:09:51'),(40,'Sportcoats','Y',0,'2013-10-21 23:09:51'),(40,'Sweaters','Y',0,'2013-10-21 23:09:51'),(40,'Swimwear','Y',0,'2013-10-21 23:09:51'),(40,'Training','Y',0,'2013-10-21 23:09:51'),(40,'Underwear','Y',0,'2013-10-21 23:09:51'),(45,'Arts And Crafts','Y',0,'2013-10-21 23:09:51'),(45,'Backpack','Y',0,'2013-10-21 23:09:51'),(45,'Boys Activewear','Y',0,'2013-10-21 23:09:51'),(45,'Fine Earrings','Y',0,'2013-10-21 23:09:51'),(45,'Flip Flops','Y',0,'2013-10-21 23:09:51'),(45,'Girls Denim','Y',0,'2013-10-21 23:09:51'),(45,'Mens Fragrance','Y',0,'2013-10-21 23:09:51'),(45,'Pillows','Y',0,'2013-10-21 23:09:51'),(45,'Suiting','Y',0,'2013-10-21 23:09:51'),(46,'Sterling Earrings','Y',0,'2013-10-21 23:09:51'),(47,'Girls Swimwear','Y',0,'2013-10-21 23:09:51'),(50,'Activity Equipment','Y',0,'2013-10-21 23:09:51'),(50,'Boys Swimwear','Y',0,'2013-10-21 23:09:51'),(50,'Costume Necklaces','Y',0,'2013-10-21 23:09:51'),(50,'Fleece','Y',0,'2013-10-21 23:09:51'),(50,'Girls Sandals','Y',0,'2013-10-21 23:09:51'),(50,'Girls Sleepwear','Y',0,'2013-10-21 23:09:51'),(50,'Hair Goods','Y',0,'2013-10-21 23:09:51'),(50,'Loungewear','Y',0,'2013-10-21 23:09:51'),(50,'Nailcare','Y',0,'2013-10-21 23:09:51'),(50,'Pants','Y',0,'2013-10-21 23:09:51'),(50,'Pretend Play','Y',0,'2013-10-21 23:09:51'),(50,'Quilt','Y',0,'2013-10-21 23:09:51'),(50,'Sandals','Y',0,'2013-10-21 23:09:51'),(50,'Sets','Y',0,'2013-10-21 23:09:51'),(50,'Sleep Separates','Y',0,'2013-10-21 23:09:51'),(50,'Sport Socks','Y',0,'2013-10-21 23:09:51'),(50,'Sweater','Y',0,'2013-10-21 23:09:51'),(50,'Sweaters','Y',0,'2013-10-21 23:09:51'),(50,'Sweaters & Knits','Y',0,'2013-10-21 23:09:51'),(50,'Swim','Y',0,'2013-10-21 23:09:51'),(50,'T-Shirts','Y',0,'2013-10-21 23:09:51'),(50,'Tabletop','Y',0,'2013-10-21 23:09:51'),(50,'Ties','Y',0,'2013-10-21 23:09:51'),(50,'Tote','Y',0,'2013-10-21 23:09:51'),(50,'Trousers','Y',0,'2013-10-21 23:09:51'),(50,'Wall Decor','Y',0,'2013-10-21 23:09:51'),(55,'Activity Books And Flashcards','Y',0,'2013-10-21 23:09:51'),(55,'Boys Sleepwear','Y',0,'2013-10-21 23:09:51'),(55,'Cosmetic Bags','Y',0,'2013-10-21 23:09:51'),(55,'Costumes And Dress Up','Y',0,'2013-10-21 23:09:51'),(55,'Fine Necklaces','Y',0,'2013-10-21 23:09:51'),(55,'Girls Outerwear','Y',0,'2013-10-21 23:09:51'),(55,'Jackets & Outerwear','Y',0,'2013-10-21 23:09:51'),(55,'Umbrellas','Y',0,'2013-10-21 23:09:51'),(56,'Sterling Necklaces','Y',0,'2013-10-21 23:09:51'),(57,'Boys Outerwear','Y',0,'2013-10-21 23:09:51'),(57,'Girls One Pieces','Y',0,'2013-10-21 23:09:51'),(60,'Accessories','Y',0,'2013-10-21 23:09:51'),(60,'Activewear','Y',0,'2013-10-21 23:09:51'),(60,'Athletic','Y',0,'2013-10-21 23:09:51'),(60,'Backpacks And Bags','Y',0,'2013-10-21 23:09:51'),(60,'Belts','Y',0,'2013-10-21 23:09:51'),(60,'Capris','Y',0,'2013-10-21 23:09:51'),(60,'Costume Bracelets','Y',0,'2013-10-21 23:09:51'),(60,'Decorative Pillows','Y',0,'2013-10-21 23:09:51'),(60,'Denim','Y',0,'2013-10-21 23:09:51'),(60,'Developmental Toys','Y',0,'2013-10-21 23:09:51'),(60,'DVDs And CDs','Y',0,'2013-10-21 23:09:51'),(60,'Girls Sneakers','Y',0,'2013-10-21 23:09:51'),(60,'Haircare','Y',0,'2013-10-21 23:09:51'),(60,'Knit Tops','Y',0,'2013-10-21 23:09:51'),(60,'Outerwear','Y',0,'2013-10-21 23:09:51'),(60,'Short Cocktail','Y',0,'2013-10-21 23:09:51'),(60,'Sleepwear','Y',0,'2013-10-21 23:09:51'),(60,'Sneakers','Y',0,'2013-10-21 23:09:51'),(60,'Sportcoats','Y',0,'2013-10-21 23:09:51'),(60,'Storage','Y',0,'2013-10-21 23:09:51'),(60,'Sweaters','Y',0,'2013-10-21 23:09:51'),(60,'Ties','Y',0,'2013-10-21 23:09:51'),(60,'Trousers','Y',0,'2013-10-21 23:09:51'),(60,'Wallets','Y',0,'2013-10-21 23:09:51'),(60,'Wool','Y',0,'2013-10-21 23:09:51'),(61,'Umbrellas','Y',0,'2013-10-21 23:09:51'),(65,'Boys Denim','Y',0,'2013-10-21 23:09:51'),(65,'Boys Sneakers','Y',0,'2013-10-21 23:09:51'),(65,'Fine Bracelets','Y',0,'2013-10-21 23:09:51'),(65,'Hair Tools','Y',0,'2013-10-21 23:09:51'),(65,'R/C And Electronic Toys','Y',0,'2013-10-21 23:09:51'),(66,'Sterling Bracelets','Y',0,'2013-10-21 23:09:51'),(70,'Beauty Tools','Y',0,'2013-10-21 23:09:51'),(70,'Bedding','Y',0,'2013-10-21 23:09:51'),(70,'Boys Sets','Y',0,'2013-10-21 23:09:51'),(70,'Casual Collections','Y',0,'2013-10-21 23:09:51'),(70,'Costume Rings','Y',0,'2013-10-21 23:09:51'),(70,'Designer Hosiery','Y',0,'2013-10-21 23:09:51'),(70,'Dresses/Jumpsuits','Y',0,'2013-10-21 23:09:51'),(70,'Fleece','Y',0,'2013-10-21 23:09:51'),(70,'Food Storage And Bottles','Y',0,'2013-10-21 23:09:51'),(70,'Games And Puzzles','Y',0,'2013-10-21 23:09:51'),(70,'Girls Boots','Y',0,'2013-10-21 23:09:51'),(70,'Hats','Y',0,'2013-10-21 23:09:51'),(70,'Jackets','Y',0,'2013-10-21 23:09:51'),(70,'Keepsakes','Y',0,'2013-10-21 23:09:51'),(70,'Luggage','Y',0,'2013-10-21 23:09:51'),(70,'Misc Sports','Y',0,'2013-10-21 23:09:51'),(70,'Open','Y',0,'2013-10-21 23:09:51'),(70,'Outerwear','Y',0,'2013-10-21 23:09:51'),(70,'Pocket Squares','Y',0,'2013-10-21 23:09:51'),(70,'Rain','Y',0,'2013-10-21 23:09:51'),(70,'Robes','Y',0,'2013-10-21 23:09:51'),(70,'Shorts','Y',0,'2013-10-21 23:09:51'),(70,'Skirts','Y',0,'2013-10-21 23:09:51'),(70,'Slippers','Y',0,'2013-10-21 23:09:51'),(70,'Technical','Y',0,'2013-10-21 23:09:51'),(70,'Travel','Y',0,'2013-10-21 23:09:51'),(70,'Wraps','Y',0,'2013-10-21 23:09:51'),(71,'Unisex Outerwear','Y',0,'2013-10-21 23:09:51'),(72,'Scarves And Gloves','Y',0,'2013-10-21 23:09:51'),(72,'Unisex One Pieces','Y',0,'2013-10-21 23:09:51'),(75,'Bags','Y',0,'2013-10-21 23:09:51'),(75,'Fine Rings','Y',0,'2013-10-21 23:09:51'),(75,'Oral Care','Y',0,'2013-10-21 23:09:51'),(76,'Sterling Rings','Y',0,'2013-10-21 23:09:51'),(80,'Boots','Y',0,'2013-10-21 23:09:51'),(80,'Bottoms','Y',0,'2013-10-21 23:09:51'),(80,'Boys Boots','Y',0,'2013-10-21 23:09:51'),(80,'Cold Weather','Y',0,'2013-10-21 23:09:51'),(80,'Gear Accessories','Y',0,'2013-10-21 23:09:51'),(80,'Hats','Y',0,'2013-10-21 23:09:51'),(80,'Home Accessesories','Y',0,'2013-10-21 23:09:51'),(80,'Knits & Tee Shirts','Y',0,'2013-10-21 23:09:51'),(80,'Leather','Y',0,'2013-10-21 23:09:51'),(80,'Musical Toys','Y',0,'2013-10-21 23:09:51'),(80,'Open','Y',0,'2013-10-21 23:09:51'),(80,'Personal Care','Y',0,'2013-10-21 23:09:51'),(80,'Shapewear','Y',0,'2013-10-21 23:09:51'),(80,'Shorts','Y',0,'2013-10-21 23:09:51'),(80,'Shorts/Crops','Y',0,'2013-10-21 23:09:51'),(80,'Sm Leather Goods','Y',0,'2013-10-21 23:09:51'),(80,'Suits','Y',0,'2013-10-21 23:09:51'),(80,'Tights','Y',0,'2013-10-21 23:09:51'),(80,'Towels','Y',0,'2013-10-21 23:09:51'),(82,'Unisex Boots','Y',0,'2013-10-21 23:09:51'),(85,'Accessories','Y',0,'2013-10-21 23:09:51'),(85,'Bath','Y',0,'2013-10-21 23:09:51'),(85,'Gifts','Y',0,'2013-10-21 23:09:51'),(85,'Golf','Y',0,'2013-10-21 23:09:51'),(85,'Media','Y',0,'2013-10-21 23:09:51'),(85,'Open','Y',0,'2013-10-21 23:09:51'),(85,'Supplements','Y',0,'2013-10-21 23:09:51'),(85,'Swim','Y',0,'2013-10-21 23:09:51'),(85,'Unisex Sneakers','Y',0,'2013-10-21 23:09:51'),(85,'Warmwear','Y',0,'2013-10-21 23:09:51'),(90,'Accessories','Y',0,'2013-10-21 23:09:51'),(90,'Active','Y',0,'2013-10-21 23:09:51'),(90,'Bath','Y',0,'2013-10-21 23:09:51'),(90,'Beauty Bags','Y',0,'2013-10-21 23:09:51'),(90,'Dolls And Plush Toys','Y',0,'2013-10-21 23:09:51'),(90,'Dresses','Y',0,'2013-10-21 23:09:51'),(90,'Executive','Y',0,'2013-10-21 23:09:51'),(90,'Fitness Gear','Y',0,'2013-10-21 23:09:51'),(90,'Knit Tee Shirts','Y',0,'2013-10-21 23:09:51'),(90,'Open','Y',0,'2013-10-21 23:09:51'),(90,'Other','Y',0,'2013-10-21 23:09:51'),(90,'Outdoor Gear','Y',0,'2013-10-21 23:09:51'),(90,'Skate','Y',0,'2013-10-21 23:09:51'),(90,'Slipper Socks','Y',0,'2013-10-21 23:09:51'),(90,'Swim','Y',0,'2013-10-21 23:09:51'),(93,'Cold Weather Hats','Y',0,'2013-10-21 23:09:51'),(95,'Bath Toys','Y',0,'2013-10-21 23:09:51'),(95,'Gloves','Y',0,'2013-10-21 23:09:51'),(95,'Misc','Y',0,'2013-10-21 23:09:51'),(95,'Tech Accessories','Y',0,'2013-10-21 23:09:51'),(99,'Misc For History','Y',0,'2013-10-21 23:09:51'),(100,'Housewares','Y',0,'2013-10-21 23:09:51'),(110,'Kitchen','Y',0,'2013-10-21 23:09:51'),(120,'Home Office','Y',0,'2013-10-21 23:09:51'),(130,'Electronics','Y',0,'2013-10-21 23:09:51'),(140,'Books & Video','Y',0,'2013-10-21 23:09:51'),(150,'Bath','Y',0,'2013-10-21 23:09:51'),(160,'Utility Bedding','Y',0,'2013-10-21 23:09:51'),(170,'Outdoor Accessories','Y',0,'2013-10-21 23:09:51'),(180,'Services','Y',0,'2013-10-21 23:09:51'),(190,'Travel','Y',0,'2013-10-21 23:09:51');
/*!40000 ALTER TABLE `business_class` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:14