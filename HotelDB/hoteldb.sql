-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hoteldb
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.14.04.1

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
-- Table structure for table `BBackup`
--

DROP TABLE IF EXISTS `BBackup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BBackup` (
  `hotel_no` int(5) NOT NULL DEFAULT '0',
  `guest_no` int(3) NOT NULL DEFAULT '0',
  `datefrom` date NOT NULL DEFAULT '0000-00-00',
  `dateto` date DEFAULT NULL,
  `room_no` int(3) DEFAULT NULL,
  PRIMARY KEY (`hotel_no`,`guest_no`,`datefrom`),
  KEY `guest_no` (`guest_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BBackup`
--

LOCK TABLES `BBackup` WRITE;
/*!40000 ALTER TABLE `BBackup` DISABLE KEYS */;
INSERT INTO `BBackup` VALUES (1,1,'2007-02-02','2007-02-05',1);
/*!40000 ALTER TABLE `BBackup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `hotel_no` int(5) NOT NULL DEFAULT '0',
  `guest_no` int(3) NOT NULL DEFAULT '0',
  `datefrom` date NOT NULL DEFAULT '0000-00-00',
  `dateto` date DEFAULT NULL,
  `room_no` int(3) DEFAULT NULL,
  PRIMARY KEY (`hotel_no`,`guest_no`,`datefrom`),
  KEY `guest_no` (`guest_no`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`hotel_no`) REFERENCES `Hotel` (`hotel_no`),
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`guest_no`) REFERENCES `Guest` (`guest_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (2,1,'2016-07-17','2016-07-19',2),(4,2,'1991-08-02','1991-08-08',7),(5,1,'2016-09-19','2016-09-25',37),(5,2,'2016-07-17','2016-07-18',37),(7,2,'2016-07-25','2016-07-27',1),(17,1,'2016-09-05','2016-09-10',7);
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guest`
--

DROP TABLE IF EXISTS `Guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Guest` (
  `guest_no` int(3) NOT NULL DEFAULT '0',
  `guest_name` char(24) DEFAULT NULL,
  `addr` char(24) DEFAULT NULL,
  PRIMARY KEY (`guest_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guest`
--

LOCK TABLES `Guest` WRITE;
/*!40000 ALTER TABLE `Guest` DISABLE KEYS */;
INSERT INTO `Guest` VALUES (1,'Sudeep','Jalgaon'),(2,'Gaurav','Pune'),(3,'Don','London'),(5,'Paul','London'),(7,'Carel','London');
/*!40000 ALTER TABLE `Guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hotel` (
  `hotel_no` int(5) NOT NULL DEFAULT '0',
  `name` char(24) DEFAULT NULL,
  `city` char(20) DEFAULT NULL,
  PRIMARY KEY (`hotel_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
INSERT INTO `Hotel` VALUES (1,'TAJ','Mumbai'),(2,'Oberoi','Mumbai'),(3,'Rajdhani','Pune'),(4,'JW','Pune'),(5,'Westin','Pune'),(7,'KAILASH DA DHABA','London'),(11,'Hotel Legacy','London'),(17,'Hotel Royal Palace','London');
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Records`
--

DROP TABLE IF EXISTS `Records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Records` (
  `hotel_no` int(5) NOT NULL DEFAULT '0',
  `guest_no` int(3) NOT NULL DEFAULT '0',
  `datefrom` date NOT NULL DEFAULT '0000-00-00',
  `dateto` date DEFAULT NULL,
  `room_no` int(3) DEFAULT NULL,
  PRIMARY KEY (`hotel_no`,`guest_no`,`datefrom`),
  KEY `guest_no` (`guest_no`),
  KEY `myIndex` (`guest_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Records`
--

LOCK TABLES `Records` WRITE;
/*!40000 ALTER TABLE `Records` DISABLE KEYS */;
INSERT INTO `Records` VALUES (1,1,'0000-00-00','2006-07-07',1),(5,1,'0000-00-00','2016-09-10',37);
/*!40000 ALTER TABLE `Records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `room_no` int(3) NOT NULL DEFAULT '0',
  `hotel_no` int(5) NOT NULL DEFAULT '0',
  `type` char(20) DEFAULT NULL,
  `price` int(5) DEFAULT '0',
  PRIMARY KEY (`room_no`,`hotel_no`),
  KEY `hotel_no` (`hotel_no`),
  CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`hotel_no`) REFERENCES `Hotel` (`hotel_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (1,1,'AC',22050),(1,2,'AC',16538),(4,5,'Double',30),(7,1,'LUXURY',26250),(7,3,'NON-AC',5513),(7,4,'Double',20),(7,11,'Family',300),(7,17,'Family',700),(20,3,'AC',11025),(37,5,'AC',27563);
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `myView`
--

DROP TABLE IF EXISTS `myView`;
/*!50001 DROP VIEW IF EXISTS `myView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `myView` (
  `hotel_no` tinyint NOT NULL,
  `guest_no` tinyint NOT NULL,
  `dateto` tinyint NOT NULL,
  `room_no` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `myView`
--

/*!50001 DROP TABLE IF EXISTS `myView`*/;
/*!50001 DROP VIEW IF EXISTS `myView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `myView` AS select `Records`.`hotel_no` AS `hotel_no`,`Records`.`guest_no` AS `guest_no`,`Records`.`dateto` AS `dateto`,`Records`.`room_no` AS `room_no` from `Records` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-19  1:12:01
