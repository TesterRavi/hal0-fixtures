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
-- Table structure for table `omniture_page_variables`
--

DROP TABLE IF EXISTS `omniture_page_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omniture_page_variables` (
  `opv_module` varchar(45) NOT NULL DEFAULT '',
  `opv_controller` varchar(45) NOT NULL DEFAULT '',
  `opv_action` varchar(45) NOT NULL DEFAULT '',
  `opv_variable` varchar(45) NOT NULL DEFAULT '',
  `opv_value` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`opv_module`,`opv_controller`,`opv_action`,`opv_variable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omniture_page_variables`
--

LOCK TABLES `omniture_page_variables` WRITE;
/*!40000 ALTER TABLE `omniture_page_variables` DISABLE KEYS */;
INSERT INTO `omniture_page_variables` VALUES ('default','index','index','s_pageName','Non-Member Home'),('default','index','index','s_channel','Login'),('default','index','index','s_prop1','Landing Page'),('default','index','index','s_prop2','Non-Member/No Cookie'),('default','index','index','s_events','Event 1'),('default','login','index','s_pageName','Member Home'),('default','login','index','s_channel','Login'),('default','login','index','s_prop1','Landing Page'),('default','login','index','s_prop2','Current Member'),('default','login','index','s_events','event1'),('default','support','help','s_pageName','Ignore'),('default','support','help','s_channel','Help'),('default','help','terms','s_pageName','Terms'),('default','help','terms','s_channel','Help'),('default','help','terms','s_prop1','Help'),('default','help','terms','s_prop2','Terms of Service'),('default','help','privacy','s_pageName','Privacy'),('default','help','privacy','s_channel','Help'),('default','help','privacy','s_prop1','Help'),('default','help','privacy','s_prop2','Privacy'),('default','press','video','s_pageName','Ignore'),('default','press','video','s_channel','Press'),('default','events','all','s_channel','Events'),('default','events','all','s_prop1','Events'),('default','events','all','s_events','event4'),('default','events','preview','s_channel','Events'),('default','events','preview','s_prop1','Events'),('default','events','preview','s_events','event4'),('default','events','category','s_channel','Events'),('default','events','category','s_events','event4'),('default','events','category','s_prop1','Events'),('default','events','about','s_channel','About the Brand'),('default','events','about','s_prop1','About the Brand'),('default','catalog','index','s_channel','Catalog'),('default','catalog','index','s_prop1','Catalog'),('default','catalog','index','s_events','event5'),('default','inventory','show','s_channel','Products'),('default','inventory','show','s_events','event6,prodView'),('default','inventory','show','s_prop1','Products'),('default','member','account','s_pageName','My Account'),('default','member','account','s_channel','Members'),('default','member','account','s_prop1','Members'),('default','member','account','s_prop2','Account'),('default','member','orders','s_pageName','My Orders'),('default','member','orders','s_channel','Members'),('default','member','orders','s_prop1','Members'),('default','member','orders','s_prop2','Orders'),('default','member','returns','s_pageName','My Returns'),('default','member','returns','s_channel','Members'),('default','member','returns','s_prop1','Members'),('default','member','returns','s_prop2','Returns'),('default','member','billing','s_pageName','My Billing and Shipping'),('default','member','billing','s_channel','Members'),('default','member','billing','s_prop1','Members'),('default','member','billing','s_prop2','Billing and Shipping'),('default','member','invites','s_pageName','My Invites'),('default','member','invites','s_channel','Members'),('default','member','invites','s_prop1','Members'),('default','member','invites','s_prop2','Invites'),('default','checkout','billing','s_pageName','Checkout-Billing'),('default','checkout','billing','s_channel','Checkout'),('default','checkout','billing','s_prop1','Checkout'),('default','checkout','billing','s_prop2','Billing'),('default','checkout','billing','s_events','scView,event7'),('default','checkout','billing-new','s_pageName','Checkout-Billing New'),('default','checkout','billing-new','s_channel','Checkout'),('default','checkout','billing-new','s_prop1','Checkout'),('default','checkout','billing-new','s_prop2','Billing-New'),('default','checkout','billing-new','s_events','event7'),('default','checkout','confirm','s_pageName','Checkout-Confirm'),('default','checkout','confirm','s_channel','Checkout'),('default','checkout','confirm','s_prop1','Checkout'),('default','checkout','confirm','s_prop2','Confirm'),('default','checkout','confirm','s_events','scCheckout'),('default','checkout','complete','s_pageName','Checkout-Complete'),('default','checkout','complete','s_channel','Checkout'),('default','checkout','complete','s_prop1','Checkout'),('default','checkout','complete','s_prop2','Complete'),('default','checkout','complete','s_events','purchase'),('default','about','index','s_pageName','About'),('default','about','index','s_prop1','Footer Link'),('default','about','index','s_prop2','About'),('default','affiliate','index','s_pageName','Affiliate'),('default','affiliate','index','s_prop1','Footer Link'),('default','affiliate','index','s_prop2','Affiliate'),('default','dglp','campaign','s_channel','Campaigns'),('default','dglp','campaign','s_prop1','Campaigns'),('default','publishers-images','index','s_channel','Publisher'),('default','publishers-images','index','s_prop1','Publishers'),('default','publishers-images','index','s_prop2','Iframe Image'),('default','invite','index','s_pageName','Invitee Home Page'),('default','cart-items','create','s_pageName','Popup - Add to Cart'),('default','cart-items','create','s_events',' scAdd,scView,'),('default','cart-items','create','s_prop1','Ajax'),('default','cart-items','create','s_prop2','Add to Cart'),('default','cart-items','create','s_prop3','Popup'),('default','cart-items','deactivate','s_pageName','Popup - Remove from Cart'),('default','cart-items','deactivate','s_events','scRemove,scView'),('default','cart-items','deactivate','s_prop1','Ajax'),('default','cart-items','deactivate','s_prop2','Remove From Cart'),('default','cart-items','deactivate','s_prop3','No Popup'),('default','error','error','s_pageName',''),('default','error','error','s_PageType','errorPage'),('default','dgaw','event','s_pageName','Ignore'),('default','dgaw','calendar','s_pageName','Ignore'),('default','dgaw','product','s_pageName','Ignore'),('default','careers','index','s_pageName','Careers'),('default','careers','index','s_prop1','Footer Link'),('default','careers','index','s_prop2','Careers'),('default','cart-items','update','s_pageName','Popup - Update Cart'),('default','cart-items','update','s_events','event11,scView'),('default','cart-items','update','s_prop1','Ajax'),('default','cart-items','update','s_prop2','Update Cart'),('default','cart-items','update','s_prop3','Popup'),('default','inventory','show','s_eVar10','Products'),('default','forgot-password','index','s_pageName','Forgot Password'),('default','forgot-password','index','s_channel','Login'),('default','forgot-password','index','s_prop2','Current Member'),('default','forgot-password','retrieve','s_pageName','Forgot Password - Retrieve'),('default','forgot-password','retrieve','s_channel','Login'),('default','forgot-password','retrieve','s_prop2','Current Member'),('default','forgot-password','update-password','s_pageName','Forgot Password - Update'),('default','forgot-password','update-password','s_channel','Login'),('default','forgot-password','update-password','s_prop2','Current Member'),('default','unsubscribe','index','s_pageName','Unsubscribe'),('default','unsubscribe','index','s_channel','Unsubscribe'),('default','unsubscribe','confirm','s_pageName','Unsubscribe - Confirm'),('default','unsubscribe','confirm','s_channel','Unsubscribe'),('default','unsubscribe','reason','s_pageName','Unsubscribe - Reason'),('default','unsubscribe','reason','s_channel','Unsubscribe'),('default','bridge','twitter','s_pageName','Twitter Click'),('default','bridge','facebook','s_pageName','Facebook Click'),('default','dglp','index','s_channel','Non-Member Landing'),('default','dglp','index','s_prop1','Non-Member Landing');
/*!40000 ALTER TABLE `omniture_page_variables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:47
