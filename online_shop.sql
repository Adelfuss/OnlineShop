-- MySQL dump 10.13  Distrib 5.6.43, for Win64 (x86_64)
--
-- Host: localhost    Database: ishop2
-- ------------------------------------------------------
-- Server version	5.6.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attribute_group`
--

DROP TABLE IF EXISTS `attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group`
--

LOCK TABLES `attribute_group` WRITE;
/*!40000 ALTER TABLE `attribute_group` DISABLE KEYS */;
INSERT INTO `attribute_group` VALUES (1,'Механизм'),(2,'Стекло'),(3,'Ремешок'),(4,'Корпус'),(5,'Индикация');
/*!40000 ALTER TABLE `attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_product`
--

DROP TABLE IF EXISTS `attribute_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_product` (
  `attr_id` int(10) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`attr_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_product`
--

LOCK TABLES `attribute_product` WRITE;
/*!40000 ALTER TABLE `attribute_product` DISABLE KEYS */;
INSERT INTO `attribute_product` VALUES (1,1),(2,4),(2,5),(2,11),(2,15),(2,16),(2,17),(2,20),(2,21),(2,22),(3,12),(3,23),(3,24),(3,25),(3,26),(4,2),(4,3),(4,27),(4,28),(5,1),(5,4),(5,5),(5,12),(5,13),(6,2),(6,29),(6,30),(6,31),(6,32),(6,33),(7,3),(7,6),(8,1),(9,2),(9,14),(10,4),(10,5),(10,13),(11,7),(11,8),(11,9),(11,10),(12,1),(14,3),(16,1),(16,4),(16,5);
/*!40000 ALTER TABLE `attribute_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_value`
--

DROP TABLE IF EXISTS `attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `attr_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  KEY `attr_group_id` (`attr_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_value`
--

LOCK TABLES `attribute_value` WRITE;
/*!40000 ALTER TABLE `attribute_value` DISABLE KEYS */;
INSERT INTO `attribute_value` VALUES (1,'Механика с автоподзаводом',1),(2,'Механика с ручным заводом',1),(3,'Кварцевый от батарейки',1),(4,'Кварцевый от солнечного аккумулятора',1),(5,'Сапфировое',2),(6,'Минеральное',2),(7,'Полимерное',2),(8,'Стальной',3),(9,'Кожаный',3),(10,'Каучуковый',3),(11,'Полимерный',3),(12,'Нержавеющая сталь',4),(13,'Титановый сплав',4),(14,'Латунь',4),(15,'Полимер',4),(16,'Керамика',4),(17,'Алюминий',4),(18,'Аналоговые',5),(19,'Цифровые',5);
/*!40000 ALTER TABLE `attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'brand_no_image.jpg',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Casio','casio','abt-1.jpg','Описание категории Casio'),(2,'Citizen','citizen','abt-2.jpg','In sit amet sapien eros Integer dolore magna aliqua'),(3,'Royal London','royal-london','abt-3.jpg','In sit amet sapien eros Integer dolore magna aliqua'),(4,'Seiko','seiko','seiko.png',NULL),(5,'Diesel','diesel','diesel.png',NULL);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `parent_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Men','men',0,'Men','Men'),(2,'Women','women',0,'Women','Women'),(3,'Kids','kids',0,'Kids','Kids'),(4,'Электронные','elektronnye',1,'Электронные','Электронные'),(5,'Механические','mehanicheskie',1,'mehanicheskie','mehanicheskie'),(6,'Casio','casio',4,'Casio','Casio'),(7,'Citizen','citizen',4,'Citizen','Citizen'),(8,'Royal London','royal-london',5,'Royal London','Royal London'),(9,'Seiko','seiko',5,'Seiko','Seiko'),(10,'Epos','epos',5,'Epos','Epos'),(11,'Электронные','elektronnye-11',2,'Электронные','Электронные'),(12,'Механические','mehanicheskie-12',2,'Механические','Механические'),(13,'Adriatica','adriatica',11,'Adriatica','Adriatica'),(14,'Anne Klein','anne-klein',12,'Anne Klein','Anne Klein');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(10) NOT NULL,
  `symbol_right` varchar(10) NOT NULL,
  `value` float(15,2) NOT NULL,
  `base` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'гривна','UAH','','грн.',25.80,'0'),(2,'доллар','USD','$','',1.00,'1'),(3,'Евро','EUR','€','',0.88,'0');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,2,'s-1.jpg'),(2,2,'s-2.jpg'),(3,2,'s-3.jpg');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modification`
--

DROP TABLE IF EXISTS `modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modification`
--

LOCK TABLES `modification` WRITE;
/*!40000 ALTER TABLE `modification` DISABLE KEYS */;
INSERT INTO `modification` VALUES (1,1,'Silver',300),(2,1,'Black',300),(3,1,'Dark Black',305),(4,1,'Red',310),(5,2,'Silver',80),(6,2,'Red',70);
/*!40000 ALTER TABLE `modification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` tinyint(3) unsigned NOT NULL,
  `brand_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `content` text,
  `price` float NOT NULL DEFAULT '0',
  `old_price` float NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'no_image.jpg',
  `hit` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  KEY `category_id` (`category_id`,`brand_id`),
  KEY `hit` (`hit`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,6,1,'Casio MRP-700-1AVEF','casio-mrp-700-1avef',NULL,300,0,'1',NULL,NULL,'p-1.png','0'),(2,6,1,'Casio MQ-24-7BUL','casio-mq-24-7bul','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique, diam in consequat iaculis, est purus iaculis mauris, imperdiet facilisis ante ligula at nulla. Quisque volutpat nulla risus, id maximus ex aliquet ut. Suspendisse potenti. Nulla varius lectus id turpis dignissim porta. Quisque magna arcu, blandit quis felis vehicula, feugiat gravida diam. Nullam nec turpis ligula. Aliquam quis blandit elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada aliquet. In varius lorem lorem, semper bibendum lectus lobortis ac.</p>\n\n                                            <p>Mauris placerat vitae lorem gravida viverra. Mauris in fringilla ex. Nulla facilisi. Etiam scelerisque tincidunt quam facilisis lobortis. In malesuada pulvinar neque a consectetur. Nunc aliquam gravida purus, non malesuada sem accumsan in. Morbi vel sodales libero.</p>',70,80,'1',NULL,NULL,'p-2.png','1'),(3,6,1,'Casio GA-1000-1AER','casio-ga-1000-1aer',NULL,400,0,'1',NULL,NULL,'p-3.png','1'),(4,7,2,'Citizen JP1010-00E','citizen-jp1010-00e',NULL,400,0,'1',NULL,NULL,'p-4.png','1'),(5,7,2,'Citizen BJ2111-08E','citizen-bj2111-08e',NULL,500,0,'1',NULL,NULL,'p-5.png','1'),(6,7,2,'Citizen AT0696-59E','citizen-at0696-59e',NULL,350,355,'1',NULL,NULL,'p-6.png','1'),(7,6,3,'Q&Q Q956J302Y','q-and-q-q956j302y',NULL,20,0,'1',NULL,NULL,'p-7.png','1'),(8,6,4,'Royal London 41040-01','royal-london-41040-01',NULL,90,0,'1',NULL,NULL,'p-8.png','1'),(9,6,4,'Royal London 20034-02','royal-london-20034-02',NULL,110,0,'1',NULL,NULL,'no_image.png','0'),(10,6,4,'Royal London 41156-02','royal-london-41156-02','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique, diam in consequat iaculis, est purus iaculis mauris, imperdiet facilisis ante ligula at nulla. Quisque volutpat nulla risus, id maximus ex aliquet ut. Suspendisse potenti. Nulla varius lectus id turpis dignissim porta. Quisque magna arcu, blandit quis felis vehicula, feugiat gravida diam. Nullam nec turpis ligula. Aliquam quis blandit elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada aliquet. In varius lorem lorem, semper bibendum lectus lobortis ac.</p>\n\n                                            <p>Mauris placerat vitae lorem gravida viverra. Mauris in fringilla ex. Nulla facilisi. Etiam scelerisque tincidunt quam facilisis lobortis. In malesuada pulvinar neque a consectetur. Nunc aliquam gravida purus, non malesuada sem accumsan in. Morbi vel sodales libero.</p>',100,0,'1',NULL,NULL,'no_image.png','1'),(11,3,2,'Тестовый товар','testovyy-tovar','контент...',10,0,'1',NULL,NULL,'no_image.png','0'),(12,7,2,'Часы 1','chasy-1',NULL,100,0,'1',NULL,NULL,'no_image.png','0'),(13,7,2,'Часы 2','chasy-2',NULL,105,0,'1',NULL,NULL,'no_image.png','0'),(14,7,2,'Часы 3','chasy-3',NULL,110,0,'1',NULL,NULL,'no_image.png','0'),(15,7,2,'Часы 4','chasy-4',NULL,115,0,'1',NULL,NULL,'no_image.png','0'),(16,7,2,'Часы 5','chasy-5',NULL,115,0,'1',NULL,NULL,'no_image.png','0'),(17,7,2,'Часы 6','chasy-6',NULL,120,0,'1',NULL,NULL,'no_image.png','0'),(20,7,2,'Часы 7','chasy-7',NULL,120,0,'1',NULL,NULL,'no_image.png','0'),(21,7,2,'Часы 8','chasy-8',NULL,120,0,'1',NULL,NULL,'no_image.png','0'),(22,7,2,'Часы 9','chasy-9',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(23,7,2,'Часы 10','chasy-10',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(24,7,2,'Часы 11','chasy-11',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(25,7,2,'Часы 12','chasy-12',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(26,7,2,'Часы 13','chasy-13',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(27,7,2,'Часы 14','chasy-14',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(28,7,2,'Часы 15','chasy-15',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(29,7,2,'Часы 16','chasy-16',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(30,7,2,'Часы 17','chasy-17',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(31,7,2,'Часы 18','chasy-18',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(32,7,2,'Часы 19','chasy-19',NULL,125,0,'1',NULL,NULL,'no_image.png','0'),(33,7,2,'Часы 20','chasy-20',NULL,125,0,'1',NULL,NULL,'no_image.png','0');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_product`
--

DROP TABLE IF EXISTS `related_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `related_product` (
  `product_id` int(10) unsigned NOT NULL,
  `related_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_product`
--

LOCK TABLES `related_product` WRITE;
/*!40000 ALTER TABLE `related_product` DISABLE KEYS */;
INSERT INTO `related_product` VALUES (1,2),(1,5),(2,5),(2,10),(5,1),(5,7),(5,8);
/*!40000 ALTER TABLE `related_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-30 23:40:15
