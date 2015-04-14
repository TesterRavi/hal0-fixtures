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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_iso` varchar(2) NOT NULL DEFAULT '',
  `country_iso3` varchar(3) NOT NULL DEFAULT '',
  `country_name` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`country_iso`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AD','AND','Andorra'),('AE','ARE','United Arab Emirates'),('AF','AFG','Afghanistan'),('AG','ATG','Antigua and Barbuda'),('AI','AIA','Anguilla'),('AL','ALB','Albania'),('AM','ARM','Armenia'),('AN','ANT','Netherlands Antilles'),('AO','AGO','Angola'),('AQ','','Antarctica'),('AR','ARG','Argentina'),('AS','ASM','American Samoa'),('AT','AUT','Austria'),('AU','AUS','Australia'),('AW','ABW','Aruba'),('AZ','AZE','Azerbaijan'),('BA','BIH','Bosnia and Herzegovina'),('BB','BRB','Barbados'),('BD','BGD','Bangladesh'),('BE','BEL','Belgium'),('BF','BFA','Burkina Faso'),('BG','BGR','Bulgaria'),('BH','BHR','Bahrain'),('BI','BDI','Burundi'),('BJ','BEN','Benin'),('BM','BMU','Bermuda'),('BN','BRN','Brunei Darussalam'),('BO','BOL','Bolivia'),('BR','BRA','Brazil'),('BS','BHS','Bahamas'),('BT','BTN','Bhutan'),('BV','','Bouvet Island'),('BW','BWA','Botswana'),('BY','BLR','Belarus'),('BZ','BLZ','Belize'),('CA','CAN','Canada'),('CC','','Cocos (Keeling) Islands'),('CD','COD','Congo, The Democratic Republic of the'),('CF','CAF','Central African Republic'),('CG','COG','Congo'),('CH','CHE','Switzerland'),('CI','CIV','Cote D\'Ivoire'),('CK','COK','Cook Islands'),('CL','CHL','Chile'),('CM','CMR','Cameroon'),('CN','CHN','China'),('CO','COL','Colombia'),('CR','CRI','Costa Rica'),('CS','','Serbia and Montenegro'),('CU','CUB','Cuba'),('CV','CPV','Cape Verde'),('CX','','Christmas Island'),('CY','CYP','Cyprus'),('CZ','CZE','Czech Republic'),('DE','DEU','Germany'),('DJ','DJI','Djibouti'),('DK','DNK','Denmark'),('DM','DMA','Dominica'),('DO','DOM','Dominican Republic'),('DZ','DZA','Algeria'),('EC','ECU','Ecuador'),('EE','EST','Estonia'),('EG','EGY','Egypt'),('EH','ESH','Western Sahara'),('ER','ERI','Eritrea'),('ES','ESP','Spain'),('ET','ETH','Ethiopia'),('FI','FIN','Finland'),('FJ','FJI','Fiji'),('FK','FLK','Falkland Islands (Malvinas)'),('FM','FSM','Micronesia, Federated States of'),('FO','FRO','Faroe Islands'),('FR','FRA','France'),('GA','GAB','Gabon'),('GB','GBR','United Kingdom'),('GD','GRD','Grenada'),('GE','GEO','Georgia'),('GF','GUF','French Guiana'),('GH','GHA','Ghana'),('GI','GIB','Gibraltar'),('GL','GRL','Greenland'),('GM','GMB','Gambia'),('GN','GIN','Guinea'),('GP','GLP','Guadeloupe'),('GQ','GNQ','Equatorial Guinea'),('GR','GRC','Greece'),('GS','','South Georgia and the South Sandwich Islands'),('GT','GTM','Guatemala'),('GU','GUM','Guam'),('GW','GNB','Guinea-Bissau'),('GY','GUY','Guyana'),('HK','HKG','Hong Kong'),('HM','','Heard Island and Mcdonald Islands'),('HN','HND','Honduras'),('HR','HRV','Croatia'),('HT','HTI','Haiti'),('HU','HUN','Hungary'),('ID','IDN','Indonesia'),('IE','IRL','Ireland'),('IL','ISR','Israel'),('IN','IND','India'),('IO','','British Indian Ocean Territory'),('IQ','IRQ','Iraq'),('IR','IRN','Iran, Islamic Republic of'),('IS','ISL','Iceland'),('IT','ITA','Italy'),('JM','JAM','Jamaica'),('JO','JOR','Jordan'),('JP','JPN','Japan'),('KE','KEN','Kenya'),('KG','KGZ','Kyrgyzstan'),('KH','KHM','Cambodia'),('KI','KIR','Kiribati'),('KM','COM','Comoros'),('KN','KNA','Saint Kitts and Nevis'),('KP','PRK','Korea, Democratic People\'s Republic of'),('KR','KOR','Korea, Republic of'),('KW','KWT','Kuwait'),('KY','CYM','Cayman Islands'),('KZ','KAZ','Kazakhstan'),('LA','LAO','Lao People\'s Democratic Republic'),('LB','LBN','Lebanon'),('LC','LCA','Saint Lucia'),('LI','LIE','Liechtenstein'),('LK','LKA','Sri Lanka'),('LR','LBR','Liberia'),('LS','LSO','Lesotho'),('LT','LTU','Lithuania'),('LU','LUX','Luxembourg'),('LV','LVA','Latvia'),('LY','LBY','Libyan Arab Jamahiriya'),('MA','MAR','Morocco'),('MC','MCO','Monaco'),('MD','MDA','Moldova, Republic of'),('MG','MDG','Madagascar'),('MH','MHL','Marshall Islands'),('MK','MKD','Macedonia, the Former Yugoslav Republic of'),('ML','MLI','Mali'),('MM','MMR','Myanmar'),('MN','MNG','Mongolia'),('MO','MAC','Macao'),('MP','MNP','Northern Mariana Islands'),('MQ','MTQ','Martinique'),('MR','MRT','Mauritania'),('MS','MSR','Montserrat'),('MT','MLT','Malta'),('MU','MUS','Mauritius'),('MV','MDV','Maldives'),('MW','MWI','Malawi'),('MX','MEX','Mexico'),('MY','MYS','Malaysia'),('MZ','MOZ','Mozambique'),('NA','NAM','Namibia'),('NC','NCL','New Caledonia'),('NE','NER','Niger'),('NF','NFK','Norfolk Island'),('NG','NGA','Nigeria'),('NI','NIC','Nicaragua'),('NL','NLD','Netherlands'),('NO','NOR','Norway'),('NP','NPL','Nepal'),('NR','NRU','Nauru'),('NU','NIU','Niue'),('NZ','NZL','New Zealand'),('OM','OMN','Oman'),('PA','PAN','Panama'),('PE','PER','Peru'),('PF','PYF','French Polynesia'),('PG','PNG','Papua New Guinea'),('PH','PHL','Philippines'),('PK','PAK','Pakistan'),('PL','POL','Poland'),('PM','SPM','Saint Pierre and Miquelon'),('PN','PCN','Pitcairn'),('PR','PRI','Puerto Rico'),('PS','','Palestinian Territory'),('PT','PRT','Portugal'),('PW','PLW','Palau'),('PY','PRY','Paraguay'),('QA','QAT','Qatar'),('RE','REU','Reunion'),('RO','ROM','Romania'),('RU','RUS','Russian Federation'),('RW','RWA','Rwanda'),('SA','SAU','Saudi Arabia'),('SB','SLB','Solomon Islands'),('SC','SYC','Seychelles'),('SD','SDN','Sudan'),('SE','SWE','Sweden'),('SG','SGP','Singapore'),('SH','SHN','Saint Helena'),('SI','SVN','Slovenia'),('SJ','SJM','Svalbard and Jan Mayen'),('SK','SVK','Slovakia'),('SL','SLE','Sierra Leone'),('SM','SMR','San Marino'),('SN','SEN','Senegal'),('SO','SOM','Somalia'),('SR','SUR','Suriname'),('ST','STP','Sao Tome and Principe'),('SV','SLV','El Salvador'),('SY','SYR','Syrian Arab Republic'),('SZ','SWZ','Swaziland'),('TC','TCA','Turks and Caicos Islands'),('TD','TCD','Chad'),('TF','','French Southern Territories'),('TG','TGO','Togo'),('TH','THA','Thailand'),('TJ','TJK','Tajikistan'),('TK','TKL','Tokelau'),('TL','','Timor-Leste'),('TM','TKM','Turkmenistan'),('TN','TUN','Tunisia'),('TO','TON','Tonga'),('TR','TUR','Turkey'),('TT','TTO','Trinidad and Tobago'),('TV','TUV','Tuvalu'),('TW','TWN','Taiwan, Province of China'),('TZ','TZA','Tanzania, United Republic of'),('UA','UKR','Ukraine'),('UG','UGA','Uganda'),('UM','','United States Minor Outlying Islands'),('US','USA','United States'),('UY','URY','Uruguay'),('UZ','UZB','Uzbekistan'),('VA','VAT','Holy See (Vatican City State)'),('VC','VCT','Saint Vincent and the Grenadines'),('VE','VEN','Venezuela'),('VG','VGB','Virgin Islands, British'),('VI','VIR','Virgin Islands, U.S.'),('VN','VNM','Viet Nam'),('VU','VUT','Vanuatu'),('WF','WLF','Wallis and Futuna'),('WS','WSM','Samoa'),('YE','YEM','Yemen'),('YT','','Mayotte'),('YU','','Yugoslavia'),('ZA','ZAF','South Africa'),('ZM','ZMB','Zambia'),('ZW','ZWE','Zimbabwe'),('ZZ','','Unknown');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:00
