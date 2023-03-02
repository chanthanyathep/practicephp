-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: store
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `id_emp` varchar(30) NOT NULL,
  `First_name` varchar(30) DEFAULT NULL,
  `Last_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES ('user1234','First_emp','Last_emp');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_`
--

DROP TABLE IF EXISTS `order_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_` (
  `id_order` varchar(30) NOT NULL,
  `orderdate` date DEFAULT NULL,
  `id_emp` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_emp` (`id_emp`),
  CONSTRAINT `order__ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `emp` (`id_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_`
--

LOCK TABLES `order_` WRITE;
/*!40000 ALTER TABLE `order_` DISABLE KEYS */;
INSERT INTO `order_` VALUES ('520221','2022-02-05','user1234'),('520222','2022-02-05','user1234');
/*!40000 ALTER TABLE `order_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id_order_detail` int NOT NULL AUTO_INCREMENT,
  `id_order` varchar(30) DEFAULT NULL,
  `id_product` varchar(30) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id_order_detail`),
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order_` (`id_order`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,'520221','0001',3),(2,'520222','0001',1),(3,'520222','0002',1),(4,'520222','0003',1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` varchar(30) NOT NULL,
  `nameProduct` varchar(30) DEFAULT NULL,
  `selling_price` int DEFAULT NULL,
  `id_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_product` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('0001','Est',11,'D001'),('0002','Pepsi',11,'D001'),('0003','Coke',11,'D001');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_product` varchar(30) NOT NULL,
  `quantity` int DEFAULT NULL,
  `cost_price` int DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('0001',30,10),('0002',30,10),('0003',30,10);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_product`
--

DROP TABLE IF EXISTS `type_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_product` (
  `id_type` varchar(30) NOT NULL,
  `nameType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_product`
--

LOCK TABLES `type_product` WRITE;
/*!40000 ALTER TABLE `type_product` DISABLE KEYS */;
INSERT INTO `type_product` VALUES ('D001','drink_type'),('D002','FOOD'),('D003','OTHER');
/*!40000 ALTER TABLE `type_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-15 14:03:31
