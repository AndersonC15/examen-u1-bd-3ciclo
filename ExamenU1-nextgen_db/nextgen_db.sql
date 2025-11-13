-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: nextgen_db
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nombre_categoria` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Procesadores'),(2,'Tarjetas Gráficas'),(3,'Placas Madre'),(4,'Memoria RAM'),(5,'Almacenamiento'),(6,'Fuentes de Poder'),(7,'Refrigeración'),(8,'Gabinetes');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `puesto` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Matteo','Coello','Vendedor'),(2,'Anderson','Pérez','Cajero'),(3,'Carla','Ramírez','Supervisor'),(4,'Daniel','Torres','Vendedor'),(5,'Lucía','Salinas','Cajero'),(6,'María','Lozano','Gerente'),(7,'Juan','Mendoza','Vendedor'),(8,'Ana','Silva','Cajero'),(9,'Roberto','Cárdenas','Supervisor'),(10,'Sofía','Guerrero','Vendedor');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL,
  `nombre_marca` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Intel'),(2,'AMD'),(3,'NVIDIA'),(4,'ASUS'),(5,'Gigabyte'),(6,'Corsair'),(7,'Kingston'),(8,'Seagate'),(9,'Western Digital'),(10,'Cooler Master');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `metodo_pago` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_sucursal` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_sucursal` (`id_sucursal`),
  KEY `fk_pedido_empleado` (`id_empleado`),
  CONSTRAINT `fk_pedido_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `fk_pedido_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2025-11-09 17:57:00','Efectivo',3,2),(2,'2025-11-06 15:44:00','Efectivo',5,5),(3,'2025-11-09 09:05:00','Efectivo',7,2),(4,'2025-11-03 14:53:00','Transferencia',8,5),(5,'2025-11-12 19:15:00','Efectivo',9,1),(6,'2025-11-13 15:13:00','Efectivo',10,6),(7,'2025-11-03 18:22:00','Efectivo',1,4),(8,'2025-11-13 15:34:00','Efectivo',2,1),(9,'2025-11-11 16:47:00','Transferencia',4,3),(10,'2025-11-06 20:51:00','Crédito',6,1),(11,'2025-11-13 20:16:00','Efectivo',5,1),(12,'2025-11-02 16:05:00','Crédito',5,3),(13,'2025-11-01 16:26:00','Crédito',7,6),(14,'2025-11-07 19:38:00','Transferencia',3,3),(15,'2025-11-07 15:01:00','Transferencia',1,5),(16,'2025-11-05 15:59:00','Transferencia',3,6),(17,'2025-11-04 14:43:00','Transferencia',3,1),(18,'2025-11-13 11:58:00','Crédito',8,2),(19,'2025-11-07 10:37:00','Transferencia',9,4),(20,'2025-11-10 09:56:00','Crédito',5,3),(21,'2025-11-02 14:12:00','Transferencia',3,3),(22,'2025-11-09 10:50:00','Crédito',5,1),(23,'2025-11-05 16:30:00','Efectivo',5,2),(24,'2025-11-13 11:23:00','Efectivo',1,6),(25,'2025-11-07 12:30:00','Crédito',10,5),(26,'2025-11-12 10:24:00','Crédito',3,6),(27,'2025-11-09 12:27:00','Crédito',5,4),(28,'2025-11-12 11:49:00','Crédito',7,2),(29,'2025-11-04 13:59:00','Crédito',1,6),(30,'2025-11-06 17:02:00','Efectivo',8,5),(31,'2025-11-02 14:33:00','Transferencia',5,1),(32,'2025-11-04 20:50:00','Transferencia',9,3),(33,'2025-11-07 09:07:00','Efectivo',5,5),(34,'2025-11-11 20:13:00','Crédito',5,4),(35,'2025-11-06 18:02:00','Crédito',3,1),(36,'2025-11-09 08:19:00','Efectivo',3,1),(37,'2025-11-11 08:24:00','Efectivo',5,4),(38,'2025-11-02 13:17:00','Efectivo',8,4),(39,'2025-11-11 09:25:00','Efectivo',5,5),(40,'2025-11-01 09:59:00','Transferencia',7,2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_producto`
--

DROP TABLE IF EXISTS `pedido_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_producto` (
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_en_pedido` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`,`id_producto`),
  KEY `fk_pp_producto` (`id_producto`),
  CONSTRAINT `fk_pp_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `fk_pp_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_producto`
--

LOCK TABLES `pedido_producto` WRITE;
/*!40000 ALTER TABLE `pedido_producto` DISABLE KEYS */;
INSERT INTO `pedido_producto` VALUES (1,15,5,910.95),(1,27,4,147.03),(1,28,3,1482.66),(1,31,4,1096.67),(1,51,2,1181.23),(2,9,4,973.78),(2,15,4,910.95),(2,19,3,712.80),(2,24,4,89.00),(2,50,2,231.51),(3,5,2,609.02),(3,35,3,680.64),(3,42,5,264.09),(4,30,5,1020.10),(4,38,2,1299.22),(5,4,3,248.16),(5,7,3,573.73),(5,40,4,511.06),(5,50,5,231.51),(5,59,3,604.48),(6,8,2,1241.16),(6,15,3,910.95),(6,24,4,89.00),(6,25,2,1423.90),(6,55,2,1017.54),(6,57,3,269.66),(7,20,4,688.63),(7,37,5,951.88),(7,50,1,231.51),(8,9,2,973.78),(8,27,5,147.03),(9,1,5,777.34),(9,3,2,946.83),(9,6,4,565.39),(9,53,4,397.24),(10,36,4,713.12),(10,40,1,511.06),(10,43,4,1080.36),(11,10,1,100.94),(11,14,3,1435.40),(12,18,3,768.72),(12,31,1,1096.67),(12,36,2,713.12),(12,45,4,1256.84),(12,49,1,1166.57),(12,51,1,1181.23),(13,24,4,89.00),(13,50,1,231.51),(13,51,3,1181.23),(14,3,4,946.83),(14,14,2,1435.40),(14,30,3,1020.10),(15,2,5,1420.71),(15,19,4,712.80),(15,20,3,688.63),(15,41,2,803.92),(15,44,4,373.16),(16,27,3,147.03),(16,37,4,951.88),(16,55,5,1017.54),(16,57,2,269.66),(17,11,5,1016.97),(17,29,1,146.85),(17,59,2,604.48),(18,20,9,688.63),(18,38,1,1299.22),(18,39,5,1122.82),(19,8,3,1241.16),(19,15,4,910.95),(19,34,4,672.48),(20,15,4,910.95),(20,37,4,951.88),(21,4,3,248.16),(21,7,1,573.73),(21,26,3,523.40),(21,29,4,146.85),(21,47,1,920.90),(22,27,1,147.03),(22,35,4,680.64),(22,43,4,1080.36),(23,9,4,973.78),(23,28,5,1482.66),(24,20,1,688.63),(24,35,1,680.64),(25,2,2,1420.71),(25,31,3,1096.67),(25,50,1,231.51),(25,52,2,376.46),(25,60,2,809.97),(26,4,5,248.16),(26,16,4,710.97),(26,24,5,89.00),(26,26,1,523.40),(26,27,4,147.03),(26,60,3,809.97),(27,5,3,609.02),(27,13,5,112.18),(27,15,7,910.95),(27,49,5,1166.57),(28,15,3,910.95),(28,25,1,1423.90),(28,33,2,1192.48),(28,38,3,1299.22),(28,54,1,1143.48),(29,30,3,1020.10),(29,55,5,1017.54),(30,4,5,248.16),(30,28,2,1482.66),(31,1,4,777.34),(31,25,4,1423.90),(31,41,5,803.92),(31,57,4,269.66),(32,6,2,565.39),(32,8,1,1241.16),(32,34,4,672.48),(32,36,2,713.12),(32,48,2,948.62),(32,50,5,231.51),(33,1,4,777.34),(33,3,3,946.83),(33,7,1,573.73),(33,12,1,528.85),(33,17,3,556.09),(33,22,3,952.21),(34,17,5,556.09),(34,41,4,803.92),(35,7,3,573.73),(35,23,3,1277.72),(35,46,2,174.24),(35,47,4,920.90),(36,16,2,710.97),(36,42,2,264.09),(36,54,2,1143.48),(37,11,5,1016.97),(37,16,5,710.97),(37,23,5,1277.72),(37,51,2,1181.23),(37,52,4,376.46),(38,7,5,573.73),(38,41,1,803.92),(38,54,3,1143.48),(39,38,2,1299.22),(39,41,4,803.92),(39,47,3,920.90),(40,7,2,573.73),(40,24,2,89.00),(40,35,4,680.64),(40,48,5,948.62),(40,55,5,1017.54);
/*!40000 ALTER TABLE `pedido_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `stock` int DEFAULT NULL,
  `precio_unitario` decimal(12,2) DEFAULT NULL,
  `id_marca` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_marca` (`id_marca`),
  KEY `fk_producto_categoria` (`id_categoria`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_producto_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Almacenamiento Kingston 1','Almacenamiento de la marca Kingston modelo 1',10,777.34,7,5),(2,'Refrigeración ASUS 2','Refrigeración de la marca ASUS modelo 2',90,1420.71,4,7),(3,'Refrigeración AMD 3','Refrigeración de la marca AMD modelo 3',61,946.83,2,7),(4,'Almacenamiento Seagate 4','Almacenamiento de la marca Seagate modelo 4',9,248.16,8,5),(5,'Procesadores Gigabyte 5','Procesadores de la marca Gigabyte modelo 5',96,609.02,5,1),(6,'Placas Madre Cooler Master 6','Placas Madre de la marca Cooler Master modelo 6',81,565.39,10,3),(7,'Fuentes de Poder NVIDIA 7','Fuentes de Poder de la marca NVIDIA modelo 7',42,573.73,3,6),(8,'Gabinetes Kingston 8','Gabinetes de la marca Kingston modelo 8',80,1241.16,7,8),(9,'Placas Madre Corsair 9','Placas Madre de la marca Corsair modelo 9',7,973.78,6,3),(10,'Refrigeración Cooler Master 10','Refrigeración de la marca Cooler Master modelo 10',26,100.94,10,7),(11,'Fuentes de Poder Corsair 11','Fuentes de Poder de la marca Corsair modelo 11',44,1016.97,6,6),(12,'Gabinetes Western Digital 12','Gabinetes de la marca Western Digital modelo 12',82,528.85,9,8),(13,'Gabinetes NVIDIA 13','Gabinetes de la marca NVIDIA modelo 13',85,112.18,3,8),(14,'Almacenamiento NVIDIA 14','Almacenamiento de la marca NVIDIA modelo 14',11,1435.40,3,5),(15,'Fuentes de Poder Cooler Master 15','Fuentes de Poder de la marca Cooler Master modelo 15',33,910.95,10,6),(16,'Procesadores Intel 16','Procesadores de la marca Intel modelo 16',92,710.97,1,1),(17,'Memoria RAM AMD 17','Memoria RAM de la marca AMD modelo 17',86,556.09,2,4),(18,'Gabinetes Western Digital 18','Gabinetes de la marca Western Digital modelo 18',25,768.72,9,8),(19,'Almacenamiento NVIDIA 19','Almacenamiento de la marca NVIDIA modelo 19',13,712.80,3,5),(20,'Memoria RAM Kingston 20','Memoria RAM de la marca Kingston modelo 20',95,688.63,7,4),(21,'Gabinetes Corsair 21','Gabinetes de la marca Corsair modelo 21',24,702.45,6,8),(22,'Fuentes de Poder Kingston 22','Fuentes de Poder de la marca Kingston modelo 22',63,952.21,7,6),(23,'Gabinetes Gigabyte 23','Gabinetes de la marca Gigabyte modelo 23',97,1277.72,5,8),(24,'Gabinetes Gigabyte 24','Gabinetes de la marca Gigabyte modelo 24',64,89.00,5,8),(25,'Tarjetas Gráficas AMD 25','Tarjetas Gráficas de la marca AMD modelo 25',5,1423.90,2,2),(26,'Tarjetas Gráficas ASUS 26','Tarjetas Gráficas de la marca ASUS modelo 26',35,523.40,4,2),(27,'Memoria RAM Corsair 27','Memoria RAM de la marca Corsair modelo 27',6,147.03,6,4),(28,'Fuentes de Poder Western Digital 28','Fuentes de Poder de la marca Western Digital modelo 28',34,1482.66,9,6),(29,'Memoria RAM AMD 29','Memoria RAM de la marca AMD modelo 29',96,146.85,2,4),(30,'Gabinetes Gigabyte 30','Gabinetes de la marca Gigabyte modelo 30',79,1020.10,5,8),(31,'Refrigeración Western Digital 31','Refrigeración de la marca Western Digital modelo 31',97,1096.67,9,7),(32,'Almacenamiento Cooler Master 32','Almacenamiento de la marca Cooler Master modelo 32',39,894.31,10,5),(33,'Tarjetas Gráficas Gigabyte 33','Tarjetas Gráficas de la marca Gigabyte modelo 33',91,1192.48,5,2),(34,'Fuentes de Poder NVIDIA 34','Fuentes de Poder de la marca NVIDIA modelo 34',39,672.48,3,6),(35,'Fuentes de Poder Seagate 35','Fuentes de Poder de la marca Seagate modelo 35',71,680.64,8,6),(36,'Almacenamiento Kingston 36','Almacenamiento de la marca Kingston modelo 36',18,713.12,7,5),(37,'Almacenamiento NVIDIA 37','Almacenamiento de la marca NVIDIA modelo 37',54,951.88,3,5),(38,'Placas Madre AMD 38','Placas Madre de la marca AMD modelo 38',83,1299.22,2,3),(39,'Almacenamiento Gigabyte 39','Almacenamiento de la marca Gigabyte modelo 39',70,1122.82,5,5),(40,'Tarjetas Gráficas Kingston 40','Tarjetas Gráficas de la marca Kingston modelo 40',98,511.06,7,2),(41,'Almacenamiento Cooler Master 41','Almacenamiento de la marca Cooler Master modelo 41',30,803.92,10,5),(42,'Tarjetas Gráficas Cooler Master 42','Tarjetas Gráficas de la marca Cooler Master modelo 42',65,264.09,10,2),(43,'Fuentes de Poder Intel 43','Fuentes de Poder de la marca Intel modelo 43',45,1080.36,1,6),(44,'Gabinetes Kingston 44','Gabinetes de la marca Kingston modelo 44',77,373.16,7,8),(45,'Fuentes de Poder AMD 45','Fuentes de Poder de la marca AMD modelo 45',32,1256.84,2,6),(46,'Memoria RAM Corsair 46','Memoria RAM de la marca Corsair modelo 46',57,174.24,6,4),(47,'Fuentes de Poder Kingston 47','Fuentes de Poder de la marca Kingston modelo 47',76,920.90,7,6),(48,'Fuentes de Poder Intel 48','Fuentes de Poder de la marca Intel modelo 48',27,948.62,1,6),(49,'Tarjetas Gráficas AMD 49','Tarjetas Gráficas de la marca AMD modelo 49',50,1166.57,2,2),(50,'Almacenamiento Gigabyte 50','Almacenamiento de la marca Gigabyte modelo 50',40,231.51,5,5),(51,'Memoria RAM Cooler Master 51','Memoria RAM de la marca Cooler Master modelo 51',78,1181.23,10,4),(52,'Procesadores Seagate 52','Procesadores de la marca Seagate modelo 52',70,376.46,8,1),(53,'Placas Madre AMD 53','Placas Madre de la marca AMD modelo 53',81,397.24,2,3),(54,'Refrigeración ASUS 54','Refrigeración de la marca ASUS modelo 54',78,1143.48,4,7),(55,'Almacenamiento Intel 55','Almacenamiento de la marca Intel modelo 55',37,1017.54,1,5),(56,'Gabinetes Corsair 56','Gabinetes de la marca Corsair modelo 56',55,1007.25,6,8),(57,'Placas Madre Corsair 57','Placas Madre de la marca Corsair modelo 57',43,269.66,6,3),(58,'Memoria RAM Kingston 58','Memoria RAM de la marca Kingston modelo 58',9,458.58,7,4),(59,'Fuentes de Poder Cooler Master 59','Fuentes de Poder de la marca Cooler Master modelo 59',96,604.48,10,6),(60,'Refrigeración Gigabyte 60','Refrigeración de la marca Gigabyte modelo 60',22,809.97,5,7);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'NextGen_LojaNorte','Loja','Av. Universitaria y Sucre','0991112233'),(2,'NextGen_LojaSur','Loja','Calle Rocafuerte y 9 de Octubre','0994445566'),(3,'NextGen_LojaCentro','Loja','Av. Amazonas y Colón','0985556677'),(4,'NextGen_LojaOeste','Loja','Av. Solano y Bolívar','0983332211'),(5,'NextGen_CatamayoCentro','Catamayo','Calle Bolívar y 10 de Agosto','0997778899'),(6,'NextGen_CatamayoNorte','Catamayo','Av. La Paz y Guayaquil','0998889900'),(7,'NextGen_Macara','Macara','Calle 24 de Mayo y Sucre','0999990011'),(8,'NextGen_Zozoranga','Zozoranga','Av. Principal y 5 de Junio','0991113322'),(9,'NextGen_Calvas','Calvas','Calle Central y Amazonas','0992224433'),(10,'NextGen_Paltas','Paltas','Av. Libertad y Colón','0993335544');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_detalle_pedidos`
--

DROP TABLE IF EXISTS `vista_detalle_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_detalle_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalle_pedidos` AS SELECT 
 1 AS `id_pedido`,
 1 AS `fecha_hora`,
 1 AS `metodo_pago`,
 1 AS `sucursal`,
 1 AS `empleado`,
 1 AS `apellido`,
 1 AS `producto`,
 1 AS `cantidad`,
 1 AS `precio_en_pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_bajo_stock`
--

DROP TABLE IF EXISTS `vista_productos_bajo_stock`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_bajo_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_bajo_stock` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre_producto`,
 1 AS `stock`,
 1 AS `precio_unitario`,
 1 AS `nombre_marca`,
 1 AS `nombre_categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_por_empleado`
--

DROP TABLE IF EXISTS `vista_ventas_por_empleado`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_por_empleado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_por_empleado` AS SELECT 
 1 AS `id_empleado`,
 1 AS `nombre_empleado`,
 1 AS `apellido`,
 1 AS `total_facturado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_detalle_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalle_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalle_pedidos` AS select `pe`.`id_pedido` AS `id_pedido`,`pe`.`fecha_hora` AS `fecha_hora`,`pe`.`metodo_pago` AS `metodo_pago`,`s`.`nombre` AS `sucursal`,`e`.`nombre` AS `empleado`,`e`.`apellido` AS `apellido`,`p`.`nombre` AS `producto`,`pp`.`cantidad` AS `cantidad`,`pp`.`precio_en_pedido` AS `precio_en_pedido` from ((((`pedido` `pe` join `sucursal` `s` on((`pe`.`id_sucursal` = `s`.`id_sucursal`))) join `empleado` `e` on((`pe`.`id_empleado` = `e`.`id_empleado`))) join `pedido_producto` `pp` on((`pe`.`id_pedido` = `pp`.`id_pedido`))) join `producto` `p` on((`pp`.`id_producto` = `p`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_bajo_stock`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_bajo_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_bajo_stock` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre_producto`,`p`.`stock` AS `stock`,`p`.`precio_unitario` AS `precio_unitario`,`m`.`nombre_marca` AS `nombre_marca`,`c`.`nombre_categoria` AS `nombre_categoria` from ((`producto` `p` join `marca` `m` on((`p`.`id_marca` = `m`.`id_marca`))) join `categoria` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) where (`p`.`stock` < 20) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_por_empleado`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_por_empleado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_por_empleado` AS select `e`.`id_empleado` AS `id_empleado`,`e`.`nombre` AS `nombre_empleado`,`e`.`apellido` AS `apellido`,sum((`pp`.`precio_en_pedido` * `pp`.`cantidad`)) AS `total_facturado` from ((`empleado` `e` join `pedido` `pe` on((`e`.`id_empleado` = `pe`.`id_empleado`))) join `pedido_producto` `pp` on((`pe`.`id_pedido` = `pp`.`id_pedido`))) group by `e`.`id_empleado`,`e`.`nombre`,`e`.`apellido` */;
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

-- Dump completed on 2025-11-13 11:57:41
