CREATE DATABASE  IF NOT EXISTS `peliculas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `peliculas`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: peliculas
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `nombre` varchar(40) NOT NULL,
  `nombrePersonaje` varchar(40) DEFAULT NULL,
  `tituloPelicula` varchar(45) NOT NULL,
  `tomatometer` decimal(10,4) DEFAULT NULL,
  `annoDeEstreno` int(10) DEFAULT NULL,
  `ingresos` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`nombre`,`tituloPelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES ('BILLY ZANE','Greg Hutchins','A Green Story',0.1700,2013,0.0130),('BILLY ZANE','King Balek','Samson',NULL,2018,NULL),('BILLY ZANE','as Himself','Zoolander 2',0.2300,2016,29.8000),('CHADWICK BOSEMAN','TChalla/Black Panther','Black Panther',0.9800,2018,NULL),('CHADWICK BOSEMAN','TChalla/Black Panther','Captain America: Civil War',0.9100,2016,408.1000),('CHADWICK BOSEMAN','Thoth','Gods Of Egypt',0.1500,2016,31.2000),('CHADWICK BOSEMAN','Thurgood Marshall','Marshall',0.8300,2017,9.5000),('EDDIE REDMAYNE','Dug','Early Man',0.8300,2018,NULL),('EDDIE REDMAYNE','Newt Scamander','Fantastic Beasts and Where to Find Them',0.7400,2016,234.1000),('EDDIE REDMAYNE','Balem Abrasax','Jupiter Ascending',0.2600,2015,43.8000),('JACKSON RATHBONE','Rallah','Samson',NULL,2018,NULL),('JACKSON RATHBONE','Jasper Hale','The Twilight Saga: Breaking Dawn Part 2',0.4900,2012,292.3000),('JACKSON RATHBONE','Jasper Hale','Twilight Saga: Breaking Dawn Part 1',0.2500,2011,281.3000),('MICHAEL B. JORDAN','Erik Killmonger','Black Panther',0.9800,2018,NULL),('MICHAEL B. JORDAN','Adonis Johnson','Creed',0.9500,2015,81.2000),('MICHAEL B. JORDAN','Johnny Storm/The Human Torch','Fantastic Four',0.0900,2015,49.2000),('TOM HIDDLESTON','Lord Nooth','Early Man',0.8400,2018,NULL),('TOM HIDDLESTON','James Conrad','Kong: Skull Island',0.7500,2017,168.0000),('TOM HIDDLESTON','Loki','Thor: Ragnarok',0.9200,2017,312.5000);
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula` (
  `tituloPelicula` varchar(40) NOT NULL,
  `tomatometer` decimal(10,4) DEFAULT NULL,
  `ratingPromedio` decimal(10,4) DEFAULT NULL,
  `numeroDeReviews` int(10) DEFAULT NULL,
  `wantToSee` decimal(10,4) DEFAULT NULL,
  `annoDeEstreno` int(10) DEFAULT NULL,
  PRIMARY KEY (`tituloPelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES ('Black Panther',0.9800,8.3000,99,0.9500,2018),('Early Man',0.8300,6.8000,42,0.9000,2018),('Samson',NULL,NULL,NULL,0.8200,2018);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-14 12:28:18

