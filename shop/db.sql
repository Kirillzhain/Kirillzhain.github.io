-- MySQL dump 10.16  Distrib 10.1.31-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	10.1.31-MariaDB

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `descr` text,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (0,'не выбрано','',0),(2,'Цветы','',0),(3,'Наборы семян','',0),(5,'Зелень и пряные травы','',0),(6,'Газон','',0),(7,'Семена овощей','',0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(10,2) NOT NULL,
  `start` date NOT NULL,
  `stop` date NOT NULL,
  `name` varchar(200) NOT NULL COMMENT 'название акции/скидки',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='скидки и акции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,5.00,'2010-06-01','2025-12-31','подарочная'),(2,10.00,'2023-04-01','2023-12-31','Скидка'),(5,4.00,'2024-09-20','2025-01-31','новая');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ord_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (72,21,1,1.00,25000.00,2),(73,21,5,1.00,77000.00,2),(74,21,6,1.00,117800.00,2),(75,22,6,1.00,117800.00,4),(76,23,1,2.00,25000.00,6),(77,23,5,1.00,77000.00,6),(78,23,6,1.00,117800.00,6),(79,23,8,1.00,58700.00,6),(80,24,9,1.00,76200.00,2),(81,25,4,1.00,39000.00,2),(82,26,1,1.00,25000.00,7),(83,26,2,1.00,33250.00,7);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `descr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'пользователь'),(2,'менеджер'),(10,'администратор');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (21,'2024-12-01 16:35:38',2,0),(22,'2024-10-01 16:35:38',4,0),(23,'2024-12-01 16:44:37',6,0),(24,'2024-12-01 16:45:08',2,0),(25,'2024-12-01 16:45:46',2,0),(26,'2024-12-01 19:22:52',7,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `descr` text,
  `cat_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `discount_id` int(11) NOT NULL COMMENT 'id акции или скидки',
  `date_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `weight` int(11) NOT NULL COMMENT 'масса',
  `length` int(11) NOT NULL COMMENT 'длина',
  `width` int(11) NOT NULL COMMENT 'ширина',
  `height` int(11) NOT NULL COMMENT 'высота',
  `amount` int(11) NOT NULL COMMENT 'количество',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Горох','корневидный, диаметр внуктрикостной части 3.0 / 3.25 мм, длина 8.5 / 10 / 11.5 / 13 / 15 мм',7,45.00,0,'2024-10-01 17:53:57',0,0,0,0,1111),(2,'Петрушка','',5,111.00,1,'2024-10-01 17:55:07',0,0,0,0,74),(3,'Виола','Диаметр куста — 15-20 см',2,65.00,0,'2024-11-01 17:56:06',0,0,0,0,333),(4,'Лобелия','',3,39000.00,0,'2024-12-01 17:57:06',0,0,0,0,12),(5,'Дыня','Дыня Тося',7,20.00,0,'2024-12-01 17:57:46',0,0,0,0,365),(6,'Огурец','',7,75.00,1,'2024-12-01 17:58:43',0,0,0,0,777),(7,'Перец сладкий МАГНО F1','',7,750.00,1,'2024-11-01 17:59:11',0,0,0,0,119),(8,'Астра','',2,125.00,0,'2024-12-01 18:00:09',0,0,0,0,16),(9,'Базилик','',5,62.00,0,'2024-12-01 18:00:40',0,0,0,0,36);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` datetime NOT NULL COMMENT 'дата и время',
  `user_id` int(11) NOT NULL COMMENT 'код клиента',
  `name` varchar(200) NOT NULL COMMENT 'название отзыва',
  `content` text NOT NULL COMMENT 'содержимое отзыва',
  `mark` int(11) NOT NULL COMMENT 'оценка',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='отзывы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'2024-11-27 20:40:31',19,'мой отзыв','плохое обслуживание',2),(2,'2024-11-27 20:40:31',1,'протез хорош','',4);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `descr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (0,'открыт'),(1,'закрыт'),(2,'удален'),(4,'отменен'),(5,'ожидает доставку');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surname` varchar(100) DEFAULT NULL COMMENT 'фамилия',
  `name` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `rank` varchar(200) DEFAULT NULL COMMENT 'должность',
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `date_reg` datetime DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Широкова','Ольга','','администратор','79416165444','ул.ЗДоровья, 14','admin','admin',NULL,NULL,10),(2,'Коренко','Анастасия','Дмитриевна','','7941651654144','ул.ленина, 56-99','kor','kor',NULL,NULL,1),(4,'Дуринко','Олег','','','','','dur','dur',NULL,NULL,2),(5,'Череп','Никита','Сергеевич','','','','che','oleoche',NULL,NULL,1),(6,'Драник','Тамара','Петровна','','74165415444','','dra','dra',NULL,NULL,1),(7,'Яйценюк','Олег','','','','','ya','ya',NULL,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 16:41:01
