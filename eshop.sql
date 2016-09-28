-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.100    Database: eshop
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `parentId` smallint(5) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `position` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idCats_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Главная',0,0,1),(2,'Категория 1',1,1,1),(3,'Категория 2',1,1,2),(4,'Категория 3',1,1,3),(5,'Категория 4',1,1,4),(6,'Категория 1.1',2,2,1),(7,'Категория 1.2',2,2,2),(8,'Категория 1.3',2,2,3),(9,'Категория 1.4',2,2,4),(10,'Категория 1.1.1',6,3,1),(11,'Категория 1.1.2',6,3,2),(12,'Категория 1.1.2.1',11,4,1),(13,'Категория 1.2.1',7,3,1),(14,'Категория 1.2.2',7,3,2),(15,'Категория 1.4.1',9,3,1),(16,'Категория 2.1',3,2,1),(17,'Категория 2.2',3,2,2),(18,'Категория 2.3',3,2,3),(19,'Категория 2.1.1',16,3,1),(20,'Категория 4.1',5,2,1),(21,'Категория 4.2',5,2,2);
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cats_has_Chars`
--

DROP TABLE IF EXISTS `Cats_has_Chars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cats_has_Chars` (
  `Cat_id` smallint(5) unsigned NOT NULL,
  `Char_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Cat_id`,`Char_id`),
  KEY `fk_Categories_has_Characteristics_Characteristics1_idx` (`Char_id`),
  KEY `fk_Categories_has_Characteristics_Categories1_idx` (`Cat_id`),
  CONSTRAINT `fk_Categories_has_Characteristics_Categories1` FOREIGN KEY (`Cat_id`) REFERENCES `Categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categories_has_Characteristics_Characteristics1` FOREIGN KEY (`Char_id`) REFERENCES `Characteristics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cats_has_Chars`
--

LOCK TABLES `Cats_has_Chars` WRITE;
/*!40000 ALTER TABLE `Cats_has_Chars` DISABLE KEYS */;
INSERT INTO `Cats_has_Chars` VALUES (2,1),(2,2),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(4,4),(5,1),(5,2),(5,3),(5,4),(5,5),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(10,10),(11,1),(11,2),(11,3),(11,4),(11,5),(11,6),(11,7),(11,8),(11,9),(11,10),(11,11),(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10),(12,11),(12,12),(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,10),(13,11),(13,12),(13,13),(14,1),(14,2),(14,3),(14,4),(14,5),(14,6),(14,7),(14,8),(14,9),(14,10),(14,11),(14,12),(14,13),(14,14),(15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7),(15,8),(15,9),(15,10),(15,11),(15,12),(15,13),(15,14),(15,15),(16,1),(16,2),(16,3),(16,4),(16,5),(16,6),(16,7),(16,8),(16,9),(16,10),(16,11),(16,12),(16,13),(16,14),(16,15),(16,16),(17,1),(17,2),(17,3),(17,4),(17,5),(17,6),(17,7),(17,8),(17,9),(17,10),(17,11),(17,12),(17,13),(17,14),(17,15),(17,16),(17,17),(18,1),(18,2),(18,3),(18,4),(18,5),(18,6),(18,7),(18,8),(18,9),(18,10),(18,11),(18,12),(18,13),(18,14),(18,15),(18,16),(18,17),(18,18),(19,1),(19,2),(19,3),(19,4),(19,5),(19,6),(19,7),(19,8),(19,9),(19,10),(19,11),(19,12),(19,13),(19,14),(19,15),(19,16),(19,17),(19,18),(19,19),(20,1),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(20,8),(20,9),(20,10),(20,11),(20,12),(20,13),(20,14),(20,15),(20,16),(20,17),(20,18),(20,19),(20,20),(21,1),(21,2),(21,3),(21,4),(21,5),(21,6),(21,7),(21,8),(21,9),(21,10),(21,11),(21,12),(21,13),(21,14),(21,15),(21,16),(21,17),(21,18),(21,19),(21,20),(21,21);
/*!40000 ALTER TABLE `Cats_has_Chars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Characteristics`
--

DROP TABLE IF EXISTS `Characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Characteristics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `priority` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idCharacteristics_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Characteristics`
--

LOCK TABLES `Characteristics` WRITE;
/*!40000 ALTER TABLE `Characteristics` DISABLE KEYS */;
INSERT INTO `Characteristics` VALUES (1,'Характеристика 1',2500),(2,'Характеристика 2',2400),(3,'Характеристика 3',2300),(4,'Характеристика 4',2200),(5,'Характеристика 5',2100),(6,'Характеристика 6',2000),(7,'Характеристика 7',1900),(8,'Характеристика 8',1800),(9,'Характеристика 9',1700),(10,'Характеристика 10',1600),(11,'Характеристика 11',1500),(12,'Характеристика 12',1400),(13,'Характеристика 13',1300),(14,'Характеристика 14',1200),(15,'Характеристика 15',1100),(16,'Характеристика 16',1000),(17,'Характеристика 17',900),(18,'Характеристика 18',800),(19,'Характеристика 19',700),(20,'Характеристика 20',600),(21,'Характеристика 21',500);
/*!40000 ALTER TABLE `Characteristics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Goods`
--

DROP TABLE IF EXISTS `Goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Categories_id` smallint(5) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `number` int(10) unsigned NOT NULL,
  `manufacturer` varchar(45) NOT NULL,
  `image` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Goods_Categories_idx` (`Categories_id`),
  CONSTRAINT `fk_Goods_Categories` FOREIGN KEY (`Categories_id`) REFERENCES `Categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goods`
--

LOCK TABLES `Goods` WRITE;
/*!40000 ALTER TABLE `Goods` DISABLE KEYS */;
INSERT INTO `Goods` VALUES (1,2,'Товар 1',500,10,'Производитель 1','/imgs/2/img.jpg'),(2,2,'Товар 2',123,10,'Производитель 1','/imgs/2/img.jpg'),(3,2,'Товар 3',234,10,'Производитель 1','/imgs/2/img.jpg'),(4,2,'Товар 4',50054,0,'Производитель 1','/imgs/2/img.jpg'),(5,2,'Товар 5',2344,10,'Производитель 1','/imgs/2/img.jpg'),(6,2,'Товар 6',12321,10,'Производитель 1','/imgs/2/img.jpg'),(7,3,'Товар 7',50213,10,'Производитель 1','/imgs/2/img.jpg'),(8,3,'Товар 8',123,10,'Производитель 1','/imgs/2/img.jpg'),(9,3,'Товар 9',42124,0,'Производитель 1','/imgs/2/img.jpg'),(10,4,'Товар 10',50041,10,'Производитель 1','/imgs/2/img.jpg'),(11,4,'Товар 11',5002,10,'Производитель 1','/imgs/2/img.jpg'),(12,4,'Товар 12',500124,10,'Производитель 1','/imgs/2/img.jpg'),(13,5,'Товар 13',1234,10,'Производитель 1','/imgs/2/img.jpg'),(14,5,'Товар 14',24114,0,'Производитель 1','/imgs/2/img.jpg'),(15,5,'Товар 15',500,10,'Производитель 1','/imgs/2/img.jpg'),(16,5,'Товар 16',500,10,'Производитель 1','/imgs/2/img.jpg'),(17,6,'Товар 17',500,10,'Производитель 1','/imgs/2/img.jpg'),(18,6,'Товар 18',500,10,'Производитель 1','/imgs/2/img.jpg'),(19,7,'Товар 19',500,10,'Производитель 1','/imgs/2/img.jpg'),(20,8,'Товар 20',500,0,'Производитель 1','/imgs/2/img.jpg'),(21,8,'Товар 21',500,10,'Производитель 1','/imgs/2/img.jpg'),(22,9,'Товар 22',500,10,'Производитель 1','/imgs/2/img.jpg'),(23,10,'Товар 23',500,10,'Производитель 1','/imgs/2/img.jpg'),(24,11,'Товар 24',500,10,'Производитель 1','/imgs/2/img.jpg'),(25,12,'Товар 25',500,10,'Производитель 1','/imgs/2/img.jpg'),(26,12,'Товар 26',500,0,'Производитель 1','/imgs/2/img.jpg'),(27,12,'Товар 27',500,10,'Производитель 1','/imgs/2/img.jpg'),(28,12,'Товар 28',500,10,'Производитель 1','/imgs/2/img.jpg'),(29,12,'Товар 29',500,0,'Производитель 1','/imgs/2/img.jpg'),(30,13,'Товар 30',500,10,'Производитель 1','/imgs/2/img.jpg'),(31,14,'Товар 31',500,10,'Производитель 1','/imgs/2/img.jpg'),(32,15,'Товар 32',500,10,'Производитель 1','/imgs/2/img.jpg'),(33,15,'Товар 33',500,10,'Производитель 1','/imgs/2/img.jpg'),(34,16,'Товар 34',500,10,'Производитель 1','/imgs/2/img.jpg'),(35,17,'Товар 35',500,10,'Производитель 1','/imgs/2/img.jpg'),(36,18,'Товар 36',500,10,'Производитель 1','/imgs/2/img.jpg'),(37,19,'Товар 37',500,0,'Производитель 1','/imgs/2/img.jpg'),(38,20,'Товар 38',500,10,'Производитель 1','/imgs/2/img.jpg'),(39,21,'Товар 39',500,10,'Производитель 1','/imgs/2/img.jpg'),(40,21,'Товар 40',500,10,'Производитель 1','/imgs/2/img.jpg');
/*!40000 ALTER TABLE `Goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Goods_has_Chars`
--

DROP TABLE IF EXISTS `Goods_has_Chars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Goods_has_Chars` (
  `Good_id` int(10) unsigned NOT NULL,
  `Char_id` int(10) unsigned NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`Good_id`,`Char_id`),
  KEY `fk_Goods_has_Characteristics_Characteristics1_idx` (`Char_id`),
  KEY `fk_Goods_has_Characteristics_Goods1_idx` (`Good_id`),
  CONSTRAINT `fk_Goods_has_Characteristics_Characteristics1` FOREIGN KEY (`Char_id`) REFERENCES `Characteristics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Goods_has_Characteristics_Goods1` FOREIGN KEY (`Good_id`) REFERENCES `Goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goods_has_Chars`
--

LOCK TABLES `Goods_has_Chars` WRITE;
/*!40000 ALTER TABLE `Goods_has_Chars` DISABLE KEYS */;
INSERT INTO `Goods_has_Chars` VALUES (1,1,'Значение'),(1,2,'Значение'),(2,1,'Значение'),(2,2,'Значение'),(3,1,'Значение'),(3,2,'Значение'),(4,1,'Значение'),(4,2,'Значение'),(5,1,'Значение'),(5,2,'Значение'),(6,1,'Значение'),(6,2,'Значение'),(7,1,'Значение'),(7,2,'Значение'),(8,1,'Значение'),(8,2,'Значение'),(9,1,'Значение'),(9,2,'Значение'),(10,1,'Значение'),(10,2,'Значение'),(11,1,'Значение'),(11,2,'Значение'),(12,1,'Значение'),(12,2,'Значение'),(13,1,'Значение'),(13,2,'Значение'),(14,1,'Значение'),(14,2,'Значение'),(15,1,'Значение'),(15,2,'Значение'),(15,3,'Значение ТЕСТ'),(16,1,'Значение'),(16,2,'Значение'),(17,1,'Значение'),(17,2,'Значение'),(18,1,'Значение'),(18,2,'Значение'),(19,1,'Значение'),(19,2,'Значение'),(20,1,'Значение'),(20,2,'Значение'),(21,1,'Значение'),(21,2,'Значение'),(22,1,'Значение'),(22,2,'Значение'),(23,1,'Значение'),(23,2,'Значение'),(24,1,'Значение'),(24,2,'Значение'),(25,1,'Значение'),(25,2,'Значение'),(26,1,'Значение'),(26,2,'Значение'),(27,1,'Значение'),(27,2,'Значение'),(28,1,'Значение'),(28,2,'Значение'),(29,1,'Значение'),(29,2,'Значение'),(30,1,'Значение'),(30,2,'Значение'),(31,1,'Значение'),(31,2,'Значение'),(32,1,'Значение'),(32,2,'Значение'),(33,1,'Значение'),(33,2,'Значение'),(34,1,'Значение'),(34,2,'Значение'),(35,1,'Значение'),(35,2,'Значение'),(36,1,'Значение'),(36,2,'Значение'),(37,1,'Значение'),(37,2,'Значение'),(38,1,'Значение'),(38,2,'Значение'),(39,1,'Значение'),(39,2,'Значение'),(40,1,'Значение'),(40,2,'Значение');
/*!40000 ALTER TABLE `Goods_has_Chars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Main_goods`
--

DROP TABLE IF EXISTS `Main_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Main_goods` (
  `Main_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Goods_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Main_id`,`Goods_id`),
  UNIQUE KEY `id_UNIQUE` (`Main_id`),
  UNIQUE KEY `Goods_id_UNIQUE` (`Goods_id`),
  KEY `fk_main_goods_Goods1_idx` (`Goods_id`),
  CONSTRAINT `fk_main_goods_Goods1` FOREIGN KEY (`Goods_id`) REFERENCES `Goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Main_goods`
--

LOCK TABLES `Main_goods` WRITE;
/*!40000 ALTER TABLE `Main_goods` DISABLE KEYS */;
INSERT INTO `Main_goods` VALUES (1,2),(2,3),(3,6),(4,7),(5,8),(6,10),(7,11),(8,12),(9,14),(10,15),(11,17),(12,18),(13,19),(14,22),(15,23),(16,26),(17,29),(18,33),(19,37),(20,38),(21,39);
/*!40000 ALTER TABLE `Main_goods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-28 16:11:53
