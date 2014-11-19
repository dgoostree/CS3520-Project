-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: web_dev_project
-- ------------------------------------------------------
-- Server version	5.6.21-log
CREATE SCHEMA `web_dev_project` ;
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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_number` int(11) NOT NULL,
  `brand` varchar(15) NOT NULL,
  `param` varchar(10) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(45) NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`item_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (38422,'In Win','White',119.99,'./images/cases/8422','Case'),(39160,'Cooler Master','Black',159.99,'./images/cases/19160','Case'),(39213,'Cooler Master','Black',129.99,'./images/cases/19213','Case'),(39225,'Cooler Master','Black',179.99,'./images/cases/19225','Case'),(39260,'Cooler Master','White',159.99,'./images/cases/19260','Case'),(33191,'Thermaltake','Black',139.99,'./images/cases/33191','Case'),(33192,'Thermaltake','White',249.99,'./images/cases/33192','Case'),(46066,'NZXT','Red',139.99,'./images/cases/46066','Case'),(46098,'NZXT','Gunmetal',219.99,'./images/cases/46098','Case'),(46107,'NZXT','Red',119.99,'./images/cases/46107','Case'),(46112,'NZXT','Gunmetal',139.99,'./images/cases/46112','Case'),(47053,'Rosewill','Black',129.99,'./images/cases/47053','Case'),(47158,'Rosewill','White',129.99,'./images/cases/47158','Case'),(47187,'Rosewill','Gunmetal',139.99,'./images/cases/47187','Case'),(54003,'Phanteks','Black',99.99,'./images/cases/54003','Case'),
(56530,'HGST','3 TB',104.99,'./images/harddrives/hgst','Hard-drive'),(56531,'HGST','2 TB',85.98,'./images/harddrives/hgst','Hard-drive'),(56532,'HGST','500 GB',50.99,'./images/harddrives/hgst','Hard-drive'),(56540,'Western Digital','1 TB',54.99,'./images/harddrives/wd','Hard-drive'),(56541,'Western Digital','1 TB',74.99,'./images/harddrives/wd','Hard-drive'),(56542,'Western Digital','2 TB',82.99,'./images/harddrives/wd','Hard-drive'),(56543,'Western Digital','500 GB',49.99,'./images/harddrives/wd','Hard-drive'),(56544,'Western Digital','2 TB',86.99,'./images/harddrives/wd','Hard-drive'),(56545,'Western Digital','3 TB',99.99,'./images/harddrives/wd','Hard-drive'),(56550,'Seagate','1 TB',59.99,'./images/harddrives/seagate','Hard-drive'),(56551,'Seagate','2 TB',84.99,'./images/harddrives/seagate','Hard-drive'),(56552,'Seagate','3 TB',101.99,'./images/harddrives/seagate','Hard-drive'),
(14900,'GSkill','8GB',81.99,'./images/memory/gskill','Memory'),(14901,'GSkill','16GB',159.99,'./images/memory/gskill','Memory'),(14902,'GSkill','4GB',39.99,'./images/memory/gskill','Memory'),(14903,'GSkill','32GB',210.99,'./images/memory/gskill','Memory'),(14904,'Corsair','4GB',42.99,'./images/memory/corsair','Memory'),(14905,'Corsair','8GB',90.99,'./images/memory/corsair','Memory'),(14906,'Corsair','16GB',174.99,'./images/memory/corsair','Memory'),(14907,'Corsair','32GB',222.99,'./images/memory/corsair','Memory'),(14908,'Crucial','4GB',45.99,'./images/memory/crucial','Memory'),(14909,'Crucial','8GB',89.99,'./images/memory/crucial','Memory'),(14910,'Crucial','16GB',171.99,'./images/memory/crucial','Memory'),(14911,'Crucial','32GB',201.99,'./images/memory/crucial','Memory'),(14912,'Kingston','4GB',43.99,'./images/memory/kingston','Memory'),(14913,'Kingston','8GB',79.99,'./images/memory/kingston','Memory'),(14914,'Kingston','16GB',165.99,'./images/memory/kingston','Memory'),(14915,'Kingston','32GB',215.99,'./images/memory/kingston','Memory'),
(20001,'Samsung','17 Inch',119.99,'./images/monitors/samsung','Monitor'),(20002,'LG','17 Inch',139.99,'./images/monitors/lg','Monitor'),(20003,'ViewSonic','17 Inch',99.99,'./images/monitors/viewsonic','Monitor'),(20004,'Samsung','21 Inch',259.99,'./images/monitors/samsung','Monitor'),(20005,'LG','21 Inch',222.99,'./images/monitors/lg','Monitor'),(20006,'ASUS','21 Inch',114.99,'./images/monitors/asus','Monitor'),(20007,'Philips','21 Inch',539.99,'./images/monitors/philips','Monitor'),(20008,'ViewSonic','21 Inch',145.99,'./images/monitors/viewsonic','Monitor'),(20009,'Samsung','24 Inch',199.99,'./images/monitors/samsung','Monitor'),(20010,'LG','24 Inch',199.99,'./images/monitors/lg','Monitor'),(20011,'ASUS','24 Inch',151.99,'./images/monitors/asus','Monitor'),(20012,'Philips','24 Inch',185.13,'./images/monitors/philips','Monitor'),(20013,'ViewSonic','24 Inch',149.99,'./images/monitors/viewsonic','Monitor'),(20014,'Samsung','27 Inch',249.99,'./images/monitors/samsung','Monitor'),(20015,'LG','27 Inch',559.99,'./images/monitors/lg','Monitor');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `billing_address` varchar(60) NOT NULL,
  `mailing_address` varchar(60) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES ('amylee','8132Tfuf','Amy','Everitt','amy@gmail.com','5804 Fox Run Dr., Plainsboro, NJ 08540','5804 Fox Run Dr., Plainsboro, NJ 08540','906-202-3155'),('dgoostree','gooseman85','Darren','Goostree','dgoose@yahoo.com','9624 NW 7th Cir., Martinez, CA 94510','9624 NW 7th Cir., Martinez, CA 94510','707-654-8133'),('dmarco','CS3520','Dan','Marconette','dmarco@csueastbay.edu','58000 Carlos Bee Blvd., Hayward, CA 95060',NULL,'609-623-5800'),('jasmith','1234','Jane','Smith','jasmith@gmail.com','15326 Holly Ln., Conroe, TX 77909','15326 Holly Ln., Conroe, TX 77909','936-264-1585'),('jdoe','4321','John','Doe','jdoe@yahoo.com','5804 Lombard St., San Francisco, CA 94555',NULL,'707-315-8135'),('jsmith','1234','John','Smith','jsmith@gmail.com','15326 Holly Ln., Conroe, TX 77909',NULL,'936-264-1585'),('kdoe','5555','Kim','Doe','kdoe@yahoo.com','5555 Main St., Palo Alto, CA 94566','5555 Main St., Palo Alto, CA 94566','906-609-6969'),('keveritt','12remember','Keith','Everitt','keveritt@gmail.com','6363 Jessica Marie St., North Las Vegas, NV 84591','6363 Jessica Marie St., North Las Vegas, NV 84591','702-374-1724'),('madams','pugsley13','Morticia','Adams','madamadam@aol.com','1313 Mockingbird Ln., Hollywood, CA 90201','1313 Mockingbird Ln., Hollywood, CA 90201','666-666-0666');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-18 17:51:44
