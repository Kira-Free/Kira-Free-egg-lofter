-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: lofter
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `attention` int(11) NOT NULL DEFAULT '0',
  `image` varchar(45) NOT NULL DEFAULT 'null',
  `introduce` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'无为',1,'https://img.yzcdn.cn/vant/cat.jpeg',NULL),(2,'美人志',1,'https://img.yzcdn.cn/vant/cat.jpeg','只发精品'),(3,'牛牛很忙',1,'https://img.yzcdn.cn/vant/cat.jpeg',NULL),(4,'左撇子的猫咪',1,'https://img.yzcdn.cn/vant/cat.jpeg','只发精品'),(5,'宋威',1,'null',NULL),(6,'大懒猫',1,'null','只发精品');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` varchar(20) NOT NULL,
  `w_id` varchar(20) NOT NULL,
  `w_name` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `img` text NOT NULL,
  `label` varchar(245) NOT NULL,
  `portrait` varchar(245) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES ('10001','2','美人志','2020-01-16 00:00:00','http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmK1VmanVtZnlsblVOOW9DY2R6NXo4eEpPWVJwZ1JrZ1ZRPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmeFJXQWFvSklCWlFZdUVUWi9Oc1ZNNW9PbmFKbFNwMjZnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf3.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmMWU5MURjcXVGWTJuNG5qQ3o4UVJXTlJaVlNyOWtwWktRPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmN2dsNzduNnhpM1hGSUxvSlRObkQ2anRVUkRieFRxTDFnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf5.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmeTZBSlUxQ3I4SVp4MjJKV0lTYXp0dXhndXhlZ0tCYzFnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf6.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmeWdRMW5IWXh0WThLalB5cC9RT0JzVDdmeGMzaE1ocXdnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf5.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmMFdBQ3ZlM3hBTmg4Z1hOODVtVXFTSDJOUFlacnBKbkFBPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmK0Ewc0taRklPYWZvU0kxaE9SSmdxeHRNUmt0c1FpZWFBPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg','创造者计划,国风年度封面,人像,摄影,少女','http://imglf3.nosdn0.126.net/img/UmVCZWovcnBrY2R2Z0FiVkIzQTVLVlhHaTlsOVM0TTVJUFYrNkZJUzN5SHBvdkNXaDhOQVdBPT0.jpg?imageView&amp;thumbnail=1680x0&amp;quality=96&amp;stripmeta=0&amp;type=jpg'),('10002','3','牛牛很忙','2020-01-16 00:00:00','http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmK1VmanVtZnlsblVOOW9DY2R6NXo4eEpPWVJwZ1JrZ1ZRPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmeFJXQWFvSklCWlFZdUVUWi9Oc1ZNNW9PbmFKbFNwMjZnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf3.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmMWU5MURjcXVGWTJuNG5qQ3o4UVJXTlJaVlNyOWtwWktRPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmN2dsNzduNnhpM1hGSUxvSlRObkQ2anRVUkRieFRxTDFnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf5.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmeTZBSlUxQ3I4SVp4MjJKV0lTYXp0dXhndXhlZ0tCYzFnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf6.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmeWdRMW5IWXh0WThLalB5cC9RT0JzVDdmeGMzaE1ocXdnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf5.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmMFdBQ3ZlM3hBTmg4Z1hOODVtVXFTSDJOUFlacnBKbkFBPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmK0Ewc0taRklPYWZvU0kxaE9SSmdxeHRNUmt0c1FpZWFBPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg','创造者计划,国风年度封面,人像,摄影,少女','http://imglf3.nosdn0.126.net/img/UmVCZWovcnBrY2R2Z0FiVkIzQTVLVlhHaTlsOVM0TTVJUFYrNkZJUzN5SHBvdkNXaDhOQVdBPT0.jpg?imageView&amp;thumbnail=1680x0&amp;quality=96&amp;stripmeta=0&amp;type=jpg'),('10003','1','无为','2020-01-16 00:00:00','http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmK1VmanVtZnlsblVOOW9DY2R6NXo4eEpPWVJwZ1JrZ1ZRPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmeFJXQWFvSklCWlFZdUVUWi9Oc1ZNNW9PbmFKbFNwMjZnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf3.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmMWU5MURjcXVGWTJuNG5qQ3o4UVJXTlJaVlNyOWtwWktRPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmN2dsNzduNnhpM1hGSUxvSlRObkQ2anRVUkRieFRxTDFnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf5.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmeTZBSlUxQ3I4SVp4MjJKV0lTYXp0dXhndXhlZ0tCYzFnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf6.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmeWdRMW5IWXh0WThLalB5cC9RT0JzVDdmeGMzaE1ocXdnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf5.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmMFdBQ3ZlM3hBTmg4Z1hOODVtVXFTSDJOUFlacnBKbkFBPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg,http://imglf4.nosdn0.126.net/img/Z1BLSkRxVFQzdE1JQmhzcVJKNXVmK0Ewc0taRklPYWZvU0kxaE9SSmdxeHRNUmt0c1FpZWFBPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg','创造者计划,国风年度封面,人像,摄影,少女','http://imglf3.nosdn0.126.net/img/UmVCZWovcnBrY2R2Z0FiVkIzQTVLVlhHaTlsOVM0TTVJUFYrNkZJUzN5SHBvdkNXaDhOQVdBPT0.jpg?imageView&amp;thumbnail=1680x0&amp;quality=96&amp;stripmeta=0&amp;type=jpg');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL,
  `password` varchar(16) NOT NULL DEFAULT '123456',
  `name` varchar(45) NOT NULL DEFAULT 'null',
  `image` varchar(45) NOT NULL DEFAULT 'null',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'15179479855','123','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(2,'14444444444','123','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(3,'17111111111','123','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(4,'15222222222','3392','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(5,'15333333333','1065','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(6,'17222222222','8110','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(7,'15888888888','5433','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(8,'15888888883','407','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(9,'15231111113','8022','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(11,'15111111111','123','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(12,'15121111111','9391','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(13,'15174546111','7852','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(14,'15423423432','236','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(15,'14151112311','1600','用户','https://img.yzcdn.cn/vant/cat.jpeg'),(16,'15435123333','123456','用户','https://img.yzcdn.cn/vant/cat.jpeg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lofter'
--

--
-- Dumping routines for database 'lofter'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-28 17:55:49
