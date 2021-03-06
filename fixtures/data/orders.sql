
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

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT  IGNORE INTO `orders` VALUES (20060089,'2015-06-12 11:11:06',22894117,'j3860u3iunfoe4ekro362ake91',6316909,2590999,3,'NORDSTROM_DEBIT','5243','200600895501d6ba88a4','capture',2,9.5000,119.94,11.40,0.00,'Halo_Freight_StandardFreight',131.34,33.67,53.68,20.00,0.00,23.99,0.00,0.00,0.00,'Apr 27, 2015 1:34:09 PM by Alba Gamboa, #23193099\nper finance, tc already processed by prev agent. sent email to mbr to adv. -ag\n---------\nApr 26, 2015 5:12:48 PM by brianna harris, #22730805\nInvalid FAS Request - TC completed by Becky Joh, #21843166. Going forward please review/locate oringinal order for rtn credit to process TC as done by bjj - BH\n---------\nApr 22, 2015 1:25:53 PM by Becky Joh, #21843166\nMbr upset no f/u was made on Monday. adj $53.67 hlc back to OFP from order 20017757, original order where return credit was from-bjj\n---------\nApr 20, 2015 11:52:25 AM by Alba Gamboa, #23193099\nSaid that full refund should have gone to cc, adv that 73.69hlc was used on order, so w/rtn, the credit will get refunded that way. wanted amt refunded back to cc, tried doing tc but unable to, sent finance req to process. -ag\n---------\nCI[157230715,157230757]CI\r\n','3Delta',99999,NULL,NULL,NULL,0.00,0.0000,0,0,NULL,NULL,'2015-06-19 21:51:24'),(21401203,'2015-06-18 08:38:38',22894117,'9nr7bap1uae4smgq2een57g786',6743277,5769543,3,'VISA','3476','21401203555a077e8b35','capture',3,6.2500,57.91,4.12,7.95,'Halo_Freight_StandardFreight',69.98,19.98,0.00,0.00,0.00,0.00,50.00,0.00,0.00,'CI[170255514,170254541,170256517]CI\r\n','3Delta',99999,NULL,NULL,NULL,0.00,0.0000,0,0,NULL,NULL,'2015-05-18 08:38:39'),(21695465,'2015-06-02 13:10:57',22894117,'4lh2akcfmbammg5ejdb7ek9u30',4737513,4692351,3,'MASTER','8705','21695465556e0dd1c38d','capture',2,6.0000,90.00,6.24,13.95,'Halo_Freight_StandardFreight',110.19,110.19,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'CI[173278244,173278211]CI\r\n','3Delta',99999,NULL,NULL,NULL,0.00,0.0000,0,0,NULL,NULL,'2015-06-02 13:10:58'),(21695509,'2015-06-02 13:12:48',22894117,'gmfuhlhs90lm65a9mav35jps36',2342627,2239517,3,'PAYPAL','','3X398170KE146064F','sales',5,7.0000,96.00,7.42,9.95,'Halo_Freight_StandardFreight',113.37,113.37,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'CI[173277857,173277894,173277806,173277314,173278051]CI\r\n','PayPalRefTx',99999,NULL,NULL,NULL,0.00,0.0000,0,0,NULL,NULL,'2015-06-02 13:12:51'),(21695628,'2015-06-02 13:17:41',22894117,'du7ire9pcnf3ado3mpfjc97rq5',6521753,5025968,3,'NORDSTROM_DEBIT','3129','21695628556e0f657731','capture',3,7.6000,167.00,12.68,9.95,'Halo_Freight_StandardFreight',189.63,189.63,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'CI[173279553,173278867,173278656]CI\r\n','3Delta',99999,NULL,NULL,NULL,0.00,0.0000,1,0,NULL,NULL,'2015-06-02 13:17:42'),(21696046,'2015-06-02 13:37:34',22894117,'gabpmd3vrq152qqcou989qle30',5166135,2912130,3,'AMEX','7003','21696046556e140ee29b','capture',1,8.8750,29.00,3.47,9.95,'Halo_Freight_StandardFreight',42.42,42.42,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'CI[173283079]CI\r\n','3Delta',99999,NULL,NULL,NULL,0.00,0.0000,0,0,NULL,NULL,'2015-06-02 13:37:36');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

