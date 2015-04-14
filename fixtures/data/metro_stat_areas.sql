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
-- Table structure for table `metro_stat_areas`
--

DROP TABLE IF EXISTS `metro_stat_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metro_stat_areas` (
  `msa` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`msa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metro_stat_areas`
--

LOCK TABLES `metro_stat_areas` WRITE;
/*!40000 ALTER TABLE `metro_stat_areas` DISABLE KEYS */;
INSERT INTO `metro_stat_areas` VALUES ('Abbeville LA'),('Aberdeen SD'),('Aberdeen WA'),('Abilene TX'),('Ada OK'),('Adjuntas PR'),('Adrian MI'),('Aguadilla-Isabela-San SebastiÃ¡n PR'),('Akron OH'),('Alamogordo NM'),('Albany GA'),('Albany-Lebanon OR'),('Albany-Schenectady-Troy NY'),('Albemarle NC'),('Albert Lea MN'),('Albertville AL'),('Albuquerque NM'),('Alexander City AL'),('Alexandria LA'),('Alexandria MN'),('Alice TX'),('Allegan MI'),('Allentown-Bethlehem-Easton PA-NJ'),('Alma MI'),('Alpena MI'),('Altoona PA'),('Altus OK'),('Amarillo TX'),('Americus GA'),('Ames IA'),('Amsterdam NY'),('Anchorage AK'),('Anderson IN'),('Anderson SC'),('Andrews TX'),('Angola IN'),('Ann Arbor MI'),('Anniston-Oxford AL'),('Appleton WI'),('Arcadia FL'),('Ardmore OK'),('Arkadelphia AR'),('Asheville NC'),('Ashland OH'),('Ashtabula OH'),('Astoria OR'),('Atchison KS'),('Athens OH'),('Athens TN'),('Athens TX'),('Athens-Clarke County GA'),('Atlanta-Sandy Springs-Marietta GA'),('Atlantic City NJ'),('Auburn IN'),('Auburn NY'),('Auburn-Opelika AL'),('Augusta-Richmond County GA-SC'),('Augusta-Waterville ME'),('Austin MN'),('Austin-Round Rock-San Marcos TX'),('Bainbridge GA'),('Bakersfield-Delano CA'),('Baltimore-Towson MD'),('Bangor ME'),('Baraboo WI'),('Barnstable Town MA'),('Barre VT'),('Bartlesville OK'),('Bastrop LA'),('Batavia NY'),('Batesville AR'),('Baton Rouge LA'),('Battle Creek MI'),('Bay City MI'),('Bay City TX'),('Beatrice NE'),('Beaumont-Port Arthur TX'),('Beaver Dam WI'),('Beckley WV'),('Bedford IN'),('Beeville TX'),('Bellefontaine OH'),('Bellingham WA'),('Bemidji MN'),('Bend OR'),('Bennettsville SC'),('Bennington VT'),('Berlin NH-VT'),('Big Rapids MI'),('Big Spring TX'),('Billings MT'),('Binghamton NY'),('Birmingham-Hoover AL'),('Bishop CA'),('Bismarck ND'),('Blackfoot ID'),('Blacksburg-Christiansburg-Radford VA'),('Bloomington IN'),('Bloomington-Normal IL'),('Bloomsburg-Berwick PA'),('Bluefield WV-VA'),('Blytheville AR'),('Bogalusa LA'),('Boise City-Nampa ID'),('Bonham TX'),('Boone IA'),('Boone NC'),('Borger TX'),('Boston-Cambridge-Quincy MA-NH'),('Boulder CO'),('Bowling Green KY'),('Bozeman MT'),('Bradford PA'),('Brainerd MN'),('Branson MO'),('Bremerton-Silverdale WA'),('Brenham TX'),('Brevard NC'),('Bridgeport-Stamford-Norwalk CT'),('Brigham City UT'),('Brookhaven MS'),('Brookings OR'),('Brookings SD'),('Brownsville TN'),('Brownsville-Harlingen TX'),('Brownwood TX'),('Brunswick GA'),('Bucyrus OH'),('Buffalo-Niagara Falls NY'),('Burley ID'),('Burlington IA-IL'),('Burlington NC'),('Burlington-South Burlington VT'),('Butte-Silver Bow MT'),('Cadillac MI'),('Calhoun GA'),('Cambridge MD'),('Cambridge OH'),('Camden AR'),('Campbellsville KY'),('Canon City CO'),('Canton IL'),('Canton-Massillon OH'),('Cape Coral-Fort Myers FL'),('Cape Girardeau-Jackson MO-IL'),('Carbondale IL'),('Carlsbad-Artesia NM'),('Carson City NV'),('Casper WY'),('Cedar City UT'),('Cedar Rapids IA'),('Cedartown GA'),('Celina OH'),('Central City KY'),('Centralia IL'),('Centralia WA'),('Chambersburg PA'),('Champaign-Urbana IL'),('Charleston WV'),('Charleston-Mattoon IL'),('Charleston-North Charleston SC'),('Charlotte-Gastonia-Rock Hill NC-SC'),('Charlottesville VA'),('Chattanooga TN-GA'),('Chester SC'),('Cheyenne WY'),('Chicago-Naperville-Joliet IL-IN-WI'),('Chico CA'),('Chillicothe OH'),('Cincinnati-Middletown OH-KY-IN'),('Claremont NH'),('Clarksburg WV'),('Clarksdale MS'),('Clarksville TN-KY'),('Clearlake CA'),('Cleveland MS'),('Cleveland TN'),('Cleveland-Elyria-Mentor OH'),('Clewiston FL'),('Clinton IA'),('Clovis NM'),('Coamo PR'),('Coeur d\'Alene ID'),('Coeur dAlene ID'),('Coffeyville KS'),('Coldwater MI'),('College Station-Bryan TX'),('Colorado Springs CO'),('Columbia MO'),('Columbia SC'),('Columbia TN'),('Columbus GA-AL'),('Columbus IN'),('Columbus MS'),('Columbus NE'),('Columbus OH'),('Concord NH'),('Connersville IN'),('Cookeville TN'),('Coos Bay OR'),('Corbin KY'),('Cordele GA'),('Corinth MS'),('Cornelia GA'),('Corning NY'),('Corpus Christi TX'),('Corsicana TX'),('Cortland NY'),('Corvallis OR'),('Coshocton OH'),('Crawfordsville IN'),('Crescent City CA'),('Crestview-Fort Walton Beach-Destin FL'),('Crossville TN'),('Crowley LA'),('Cullman AL'),('Culpeper VA'),('Cumberland MD-WV'),('Dallas-Fort Worth-Arlington TX'),('Dalton GA'),('Danville IL'),('Danville KY'),('Danville VA'),('Daphne-Fairhope-Foley AL'),('Davenport-Moline-Rock Island IA-IL'),('Dayton OH'),('Decatur AL'),('Decatur IL'),('Decatur IN'),('Defiance OH'),('Del Rio TX'),('Deltona-Daytona Beach-Ormond Beach FL'),('Deming NM'),('Denver-Aurora CO'),('DeRidder LA'),('Des Moines-West Des Moines IA'),('Detroit-Warren-Livonia MI'),('Dickinson ND'),('Dillon SC'),('Dixon IL'),('Dodge City KS'),('Dothan AL'),('Douglas GA'),('Dover DE'),('Dublin GA'),('DuBois PA'),('Dubuque IA'),('Duluth MN-WI'),('Dumas TX'),('Duncan OK'),('Dunn NC'),('Durango CO'),('Durant OK'),('Durham NC'),('Dyersburg TN'),('Eagle Pass TX'),('East Liverpool-Salem OH'),('East Stroudsburg PA'),('Easton MD'),('Eau Claire WI'),('Edwards CO'),('Effingham IL'),('El Campo TX'),('El Centro CA'),('El Dorado AR'),('El Paso TX'),('Elizabeth City NC'),('Elizabethtown KY'),('Elk City OK'),('Elkhart-Goshen IN'),('Elko NV'),('Ellensburg WA'),('Elmira NY'),('Emporia KS'),('Enid OK'),('Enterprise-Ozark AL'),('Erie PA'),('Escanaba MI'),('Espanola NM'),('Eufaula AL-GA'),('Eugene-Springfield OR'),('Eureka-Arcata-Fortuna CA'),('Evanston WY'),('Evansville IN-KY'),('Fairbanks AK'),('Fairmont MN'),('Fairmont WV'),('Fajardo PR'),('Fallon NV'),('Fargo ND-MN'),('Faribault-Northfield MN'),('Farmington MO'),('Farmington NM'),('Fayetteville NC'),('Fayetteville-Springdale-Rogers AR-MO'),('Fergus Falls MN'),('Fernley NV'),('Findlay OH'),('Fitzgerald GA'),('Flagstaff AZ'),('Flint MI'),('Florence SC'),('Florence-Muscle Shoals AL'),('Fond du Lac WI'),('Forest City NC'),('Forrest City AR'),('Fort Collins-Loveland CO'),('Fort Dodge IA'),('Fort Leonard Wood MO'),('Fort Madison-Keokuk IA-MO'),('Fort Morgan CO'),('Fort Payne AL'),('Fort Polk South LA'),('Fort Smith AR-OK'),('Fort Valley GA'),('Fort Wayne IN'),('Frankfort IN'),('Frankfort KY'),('Fredericksburg TX'),('Freeport IL'),('Fremont NE'),('Fremont OH'),('Fresno CA'),('Gadsden AL'),('Gaffney SC'),('Gainesville FL'),('Gainesville GA'),('Gainesville TX'),('Galesburg IL'),('Gallup NM'),('Garden City KS'),('Gardnerville Ranchos NV'),('Georgetown SC'),('Gettysburg PA'),('Gillette WY'),('Glasgow KY'),('Glens Falls NY'),('Gloversville NY'),('Goldsboro NC'),('Granbury TX'),('Grand Forks ND-MN'),('Grand Island NE'),('Grand Junction CO'),('Grand Rapids-Wyoming MI'),('Grants NM'),('Grants Pass OR'),('Great Bend KS'),('Great Falls MT'),('Greeley CO'),('Green Bay WI'),('Greeneville TN'),('Greensboro-High Point NC'),('Greensburg IN'),('Greenville MS'),('Greenville NC'),('Greenville OH'),('Greenville-Mauldin-Easley SC'),('Greenwood MS'),('Greenwood SC'),('Grenada MS'),('Guayama PR'),('Gulfport-Biloxi MS'),('Guymon OK'),('Hagerstown-Martinsburg MD-WV'),('Hammond LA'),('Hanford-Corcoran CA'),('Hannibal MO'),('Harriman TN'),('Harrisburg IL'),('Harrisburg-Carlisle PA'),('Harrison AR'),('Harrisonburg VA'),('Hartford-West Hartford-East Hartford CT'),('Hastings NE'),('Hattiesburg MS'),('Havre MT'),('Hays KS'),('Heber UT'),('Helena MT'),('Helena-West Helena AR'),('Henderson NC'),('Hereford TX'),('Hickory-Lenoir-Morganton NC'),('Hilo HI'),('Hilton Head Island-Beaufort SC'),('Hinesville-Fort Stewart GA'),('Hobbs NM'),('Holland-Grand Haven MI'),('Homosassa Springs FL'),('Honolulu HI'),('Hood River OR'),('Hope AR'),('Hot Springs AR'),('Houghton MI'),('Houma-Bayou Cane-Thibodaux LA'),('Houston-Sugar Land-Baytown TX'),('Hudson NY'),('Humboldt TN'),('Huntingdon PA'),('Huntington IN'),('Huntington-Ashland WV-KY-OH'),('Huntsville AL'),('Huntsville TX'),('Huron SD'),('Hutchinson KS'),('Hutchinson MN'),('Idaho Falls ID'),('Indiana PA'),('Indianapolis-Carmel IN'),('Indianola MS'),('Iowa City IA'),('Iron Mountain MI-WI'),('Ithaca NY'),('Jackson MI'),('Jackson MS'),('Jackson TN'),('Jackson WY-ID'),('Jacksonville FL'),('Jacksonville IL'),('Jacksonville NC'),('Jacksonville TX'),('Jamestown ND'),('Jamestown-Dunkirk-Fredonia NY'),('Janesville WI'),('Jasper IN'),('Jayuya PR'),('Jefferson City MO'),('Jennings LA'),('Jesup GA'),('Johnson City TN'),('Johnstown PA'),('Jonesboro AR'),('Joplin MO'),('Juneau AK'),('Kahului-Wailuku HI'),('Kalamazoo-Portage MI'),('Kalispell MT'),('Kankakee-Bradley IL'),('Kansas City MO-KS'),('Kapaa HI'),('Kearney NE'),('Keene NH'),('Kendallville IN'),('Kennett MO'),('Kennewick-Richland-Pasco WA'),('Kerrville TX'),('Ketchikan AK'),('Key West FL'),('Kill Devil Hills NC'),('Killeen-Temple-Fort Hood TX'),('Kingsport-Bristol-Bristol TN-VA'),('Kingston NY'),('Kingsville TX'),('Kinston NC'),('Kirksville MO'),('Klamath Falls OR'),('Knoxville TN'),('Kodiak AK'),('Kokomo IN'),('La Crosse WI-MN'),('La Follette TN'),('La Grande OR'),('Laconia NH'),('Lafayette IN'),('Lafayette LA'),('LaGrange GA'),('Lake Charles LA'),('Lake City FL'),('Lake Havasu City-Kingman AZ'),('Lakeland FL'),('Lamesa TX'),('Lancaster PA'),('Lancaster SC'),('Lansing-East Lansing MI'),('Laramie WY'),('Laredo TX'),('Las Cruces NM'),('Las Vegas NM'),('Las Vegas-Paradise NV'),('Laurel MS'),('Laurinburg NC'),('Lawrence KS'),('Lawrenceburg TN'),('Lawton OK'),('Lebanon MO'),('Lebanon NH-VT'),('Lebanon PA'),('Levelland TX'),('Lewisburg PA'),('Lewisburg TN'),('Lewiston ID-WA'),('Lewiston-Auburn ME'),('Lewistown PA'),('Lexington NE'),('Lexington Park MD'),('Lexington-Fayette KY'),('Liberal KS'),('Lima OH'),('Lincoln IL'),('Lincoln NE'),('Lincolnton NC'),('Little Rock-North Little Rock-Conway AR'),('Lock Haven PA'),('Logan UT-ID'),('Logansport IN'),('London KY'),('Longview TX'),('Longview WA'),('Los Alamos NM'),('Los Angeles-Long Beach-Santa Ana CA'),('Louisville/Jefferson County KY-IN'),('Lubbock TX'),('Lufkin TX'),('Lumberton NC'),('Lynchburg VA'),('Macomb IL'),('Macon GA'),('Madera CA'),('Madison IN'),('Madison WI'),('Madisonville KY'),('Magnolia AR'),('Malone NY'),('Manchester-Nashua NH'),('Manhattan KS'),('Manitowoc WI'),('Mankato-North Mankato MN'),('Mansfield OH'),('Marble Falls TX'),('Marinette WI-MI'),('Marion IN'),('Marion OH'),('Marion-Herrin IL'),('Marquette MI'),('Marshall MN'),('Marshall MO'),('Marshall TX'),('Marshalltown IA'),('Marshfield-Wisconsin Rapids WI'),('Martin TN'),('Martinsville VA'),('Maryville MO'),('Mason City IA'),('Mayagüez PR'),('Mayfield KY'),('Maysville KY'),('McAlester OK'),('McAllen-Edinburg-Mission TX'),('McComb MS'),('McMinnville TN'),('McPherson KS'),('Meadville PA'),('Medford OR'),('Memphis TN-MS-AR'),('Menomonie WI'),('Merced CA'),('Meridian MS'),('Merrill WI'),('Mexico MO'),('Miami OK'),('Miami-Fort Lauderdale-Pompano Beach FL'),('Michigan City-La Porte IN'),('Middlesborough KY'),('Midland MI'),('Midland TX'),('Milledgeville GA'),('Milwaukee-Waukesha-West Allis WI'),('Minden LA'),('Mineral Wells TX'),('Minneapolis-St. Paul-Bloomington MN-WI'),('Minot ND'),('Missoula MT'),('Mitchell SD'),('Moberly MO'),('Mobile AL'),('Modesto CA'),('Monroe LA'),('Monroe MI'),('Monroe WI'),('Montgomery AL'),('Montrose CO'),('Morehead City NC'),('Morgan City LA'),('Morgantown WV'),('Morristown TN'),('Moscow ID'),('Moses Lake WA'),('Moultrie GA'),('Mount Airy NC'),('Mount Pleasant MI'),('Mount Pleasant TX'),('Mount Sterling KY'),('Mount Vernon IL'),('Mount Vernon OH'),('Mount Vernon-Anacortes WA'),('Mountain Home AR'),('Mountain Home ID'),('Muncie IN'),('Murray KY'),('Muscatine IA'),('Muskegon-Norton Shores MI'),('Muskogee OK'),('Myrtle Beach-Conway-North Myrtle Beach SC'),('Nacogdoches TX'),('Napa CA'),('Naples-Marco Island FL'),('Nashville-Davidson--Murfreesboro--Franklin TN'),('Natchez MS-LA'),('Natchitoches LA'),('New Bern NC'),('New Castle IN'),('New Castle PA'),('New Haven-Milford CT'),('New Iberia LA'),('New Orleans-Metairie-Kenner LA'),('New Philadelphia-Dover OH'),('New Ulm MN'),('New York-Northern New Jersey-Long Island NY-NJ-PA'),('Newberry SC'),('Newport TN'),('Newton IA'),('Niles-Benton Harbor MI'),('Nogales AZ'),('Norfolk NE'),('North Platte NE'),('North Port-Bradenton-Sarasota FL'),('North Vernon IN'),('North Wilkesboro NC'),('Norwalk OH'),('Norwich-New London CT'),('Oak Harbor WA'),('Oak Hill WV'),('Ocala FL'),('Ocean City NJ'),('Ocean Pines MD'),('Odessa TX'),('Ogden-Clearfield UT'),('Ogdensburg-Massena NY'),('Oil City PA'),('Okeechobee FL'),('Oklahoma City OK'),('Olean NY'),('Olympia WA'),('Omaha-Council Bluffs NE-IA'),('Oneonta NY'),('Ontario OR-ID'),('Opelousas-Eunice LA'),('Orangeburg SC'),('Orlando-Kissimmee-Sanford FL'),('Oshkosh-Neenah WI'),('Oskaloosa IA'),('Ottawa-Streator IL'),('Ottumwa IA'),('Owatonna MN'),('Owensboro KY'),('Owosso MI'),('Oxford MS'),('Oxnard-Thousand Oaks-Ventura CA'),('Paducah KY-IL'),('Pahrump NV'),('Palatka FL'),('Palestine TX'),('Palm Bay-Melbourne-Titusville FL'),('Palm Coast FL'),('Pampa TX'),('Panama City-Lynn Haven FL'),('Paragould AR'),('Paris TN'),('Paris TX'),('Parkersburg-Marietta-Vienna WV-OH'),('Parsons KS'),('Pascagoula MS'),('Payson AZ'),('Pecos TX'),('Pella IA'),('Pendleton-Hermiston OR'),('Pensacola-Ferry Pass-Brent FL'),('Peoria IL'),('Peru IN'),('Philadelphia-Camden-Wilmington PA-NJ-DE-MD'),('Phoenix Lake-Cedar Ridge CA'),('Phoenix-Mesa-Glendale AZ'),('Picayune MS'),('Pierre Part LA'),('Pierre SD'),('Pine Bluff AR'),('Pittsburg KS'),('Pittsburgh PA'),('Pittsfield MA'),('Plainview TX'),('Platteville WI'),('Plattsburgh NY'),('Plymouth IN'),('Pocatello ID'),('Point Pleasant WV-OH'),('Ponca City OK'),('Ponce PR'),('Pontiac IL'),('Poplar Bluff MO'),('Port Angeles WA'),('Port St. Lucie FL'),('Portales NM'),('Portland-South Portland-Biddeford ME'),('Portland-Vancouver-Hillsboro OR-WA'),('Portsmouth OH'),('Pottsville PA'),('Poughkeepsie-Newburgh-Middletown NY'),('Prescott AZ'),('Price UT'),('Prineville OR'),('Providence-New Bedford-Fall River RI-MA'),('Provo-Orem UT'),('Pueblo CO'),('Pullman WA'),('Punta Gorda FL'),('Quincy IL-MO'),('Racine WI'),('Raleigh-Cary NC'),('Rapid City SD'),('Raymondville TX'),('Reading PA'),('Red Bluff CA'),('Red Wing MN'),('Redding CA'),('Reno-Sparks NV'),('Rexburg ID'),('Richmond IN'),('Richmond VA'),('Richmond-Berea KY'),('Rio Grande City-Roma TX'),('Riverside-San Bernardino-Ontario CA'),('Riverton WY'),('Roanoke Rapids NC'),('Roanoke VA'),('Rochelle IL'),('Rochester MN'),('Rochester NY'),('Rock Springs WY'),('Rockford IL'),('Rockingham NC'),('Rockland ME'),('Rocky Mount NC'),('Rolla MO'),('Rome GA'),('Roseburg OR'),('Roswell NM'),('Ruidoso NM'),('Russellville AR'),('Ruston LA'),('Rutland VT'),('Sacramento--Arden-Arcade--Roseville CA'),('Safford AZ'),('Saginaw-Saginaw Township North MI'),('Salem OR'),('Salina KS'),('Salinas CA'),('Salisbury MD'),('Salisbury NC'),('Salt Lake City UT'),('San Angelo TX'),('San Antonio-New Braunfels TX'),('San Diego-Carlsbad-San Marcos CA'),('San Francisco-Oakland-Fremont CA'),('San Germán-Cabo Rojo PR'),('San Jose-Sunnyvale-Santa Clara CA'),('San Juan-Caguas-Guaynabo PR'),('San Luis Obispo-Paso Robles CA'),('Sandusky OH'),('Sanford NC'),('Santa Barbara-Santa Maria-Goleta CA'),('Santa Cruz-Watsonville CA'),('Santa Fe NM'),('Santa Isabel PR'),('Santa Rosa-Petaluma CA'),('Sault Ste. Marie MI'),('Savannah GA'),('Sayre PA'),('Scottsbluff NE'),('Scottsboro AL'),('Scottsburg IN'),('Scranton--Wilkes-Barre PA'),('Seaford DE'),('Searcy AR'),('Seattle-Tacoma-Bellevue WA'),('Sebastian-Vero Beach FL'),('Sebring FL'),('Sedalia MO'),('Selinsgrove PA'),('Selma AL'),('Seneca Falls NY'),('Seneca SC'),('Sevierville TN'),('Seymour IN'),('Shawnee OK'),('Sheboygan WI'),('Shelby NC'),('Shelbyville TN'),('Shelton WA'),('Sheridan WY'),('Sherman-Denison TX'),('Show Low AZ'),('Shreveport-Bossier City LA'),('Sidney OH'),('Sierra Vista-Douglas AZ'),('Sikeston MO'),('Silver City NM'),('Silverthorne CO'),('Sioux City IA-NE-SD'),('Sioux Falls SD'),('Snyder TX'),('Somerset KY'),('Somerset PA'),('South Bend-Mishawaka IN-MI'),('Southern Pines-Pinehurst NC'),('Spartanburg SC'),('Spearfish SD'),('Spencer IA'),('Spirit Lake IA'),('Spokane WA'),('Springfield IL'),('Springfield MA'),('Springfield MO'),('Springfield OH'),('St. Cloud MN'),('St. George UT'),('St. Joseph MO-KS'),('St. Louis MO-IL'),('St. Marys GA'),('St. Marys PA'),('Starkville MS'),('State College PA'),('Statesboro GA'),('Statesville-Mooresville NC'),('Staunton-Waynesboro VA'),('Stephenville TX'),('Sterling CO'),('Sterling IL'),('Steubenville-Weirton OH-WV'),('Stevens Point WI'),('Stillwater OK'),('Stockton CA'),('Storm Lake IA'),('Sturgis MI'),('Sulphur Springs TX'),('Summerville GA'),('Sumter SC'),('Sunbury PA'),('Susanville CA'),('Sweetwater TX'),('Syracuse NY'),('Tahlequah OK'),('Talladega-Sylacauga AL'),('Tallahassee FL'),('Tallulah LA'),('Tampa-St. Petersburg-Clearwater FL'),('Taos NM'),('Taylorville IL'),('Terre Haute IN'),('Texarkana TX-Texarkana AR'),('The Dalles OR'),('The Villages FL'),('Thomaston GA'),('Thomasville GA'),('Thomasville-Lexington NC'),('Tiffin OH'),('Tifton GA'),('Toccoa GA'),('Toledo OH'),('Topeka KS'),('Torrington CT'),('Traverse City MI'),('Trenton-Ewing NJ'),('Troy AL'),('Truckee-Grass Valley CA'),('Tucson AZ'),('Tullahoma TN'),('Tulsa OK'),('Tupelo MS'),('Tuscaloosa AL'),('Tuskegee AL'),('Twin Falls ID'),('Tyler TX'),('Ukiah CA'),('Union City TN-KY'),('Union SC'),('Urbana OH'),('Utica-Rome NY'),('Utuado PR'),('Uvalde TX'),('Valdosta GA'),('Vallejo-Fairfield CA'),('Valley AL'),('Van Wert OH'),('Vermillion SD'),('Vernal UT'),('Vernon TX'),('Vicksburg MS'),('Victoria TX'),('Vidalia GA'),('Vincennes IN'),('Vineland-Millville-Bridgeton NJ'),('Virginia Beach-Norfolk-Newport News VA-NC'),('Visalia-Porterville CA'),('Wabash IN'),('Waco TX'),('Wahpeton ND-MN'),('Walla Walla WA'),('Walterboro SC'),('Wapakoneta OH'),('Warner Robins GA'),('Warren PA'),('Warrensburg MO'),('Warsaw IN'),('Washington Court House OH'),('Washington IN'),('Washington NC'),('Washington-Arlington-Alexandria DC-VA-MD-WV'),('Waterloo-Cedar Falls IA'),('Watertown SD'),('Watertown-Fort Atkinson WI'),('Watertown-Fort Drum NY'),('Wauchula FL'),('Wausau WI'),('Waycross GA'),('Weatherford OK'),('Wenatchee WA'),('West Plains MO'),('West Point MS'),('Wheeling WV-OH'),('Whitewater WI'),('Wichita Falls TX'),('Wichita KS'),('Williamsport PA'),('Willimantic CT'),('Williston ND'),('Willmar MN'),('Wilmington NC'),('Wilmington OH'),('Wilson NC'),('Winchester VA-WV'),('Winfield KS'),('Winona MN'),('Winston-Salem NC'),('Woodward OK'),('Wooster OH'),('Worcester MA'),('Worthington MN'),('Yakima WA'),('Yankton SD'),('Yauco PR'),('Yazoo City MS'),('York-Hanover PA'),('Youngstown-Warren-Boardman OH-PA'),('Yuba City CA'),('Yuma AZ'),('Zanesville OH');
/*!40000 ALTER TABLE `metro_stat_areas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24  0:05:45
