-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: clockin_bluworks
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

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
-- Table structure for table `clock_ins`
--

DROP TABLE IF EXISTS `clock_ins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clock_ins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `signed_in_at` datetime NOT NULL,
  `location` point NOT NULL,
  `worker_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clock_ins_worker_id_foreign` (`worker_id`),
  CONSTRAINT `clock_ins_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clock_ins`
--

LOCK TABLES `clock_ins` WRITE;
/*!40000 ALTER TABLE `clock_ins` DISABLE KEYS */;
INSERT INTO `clock_ins` VALUES (1,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 10:31:56','2023-04-02 10:31:56','127.0.0.1'),(2,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 10:40:44','2023-04-02 10:40:44','127.0.0.1'),(3,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 10:41:09','2023-04-02 10:41:09','127.0.0.1'),(4,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 10:41:27','2023-04-02 10:41:27','127.0.0.1'),(5,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 10:42:40','2023-04-02 10:42:40','127.0.0.1'),(6,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 11:09:34','2023-04-02 11:09:34','127.0.0.1'),(7,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 12:32:26','2023-04-02 12:32:26','127.0.0.1'),(8,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 12:38:56','2023-04-02 12:38:56','127.0.0.1'),(9,'2023-04-01 07:45:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 13:21:44','2023-04-02 13:21:44','127.0.0.1'),(10,'2023-04-01 07:45:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 13:22:04','2023-04-02 13:22:04','127.0.0.1'),(11,'2023-04-01 07:45:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 13:22:46','2023-04-02 13:22:46','127.0.0.1'),(12,'2023-04-01 07:45:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 13:23:51','2023-04-02 13:23:51','127.0.0.1'),(13,'2023-04-01 07:45:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 13:24:12','2023-04-02 13:24:12','127.0.0.1'),(14,'2023-04-01 07:45:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-02 13:25:03','2023-04-02 13:25:03','127.0.0.1'),(15,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',4,'2023-04-02 21:39:00','2023-04-02 21:39:00','127.0.0.1'),(16,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',3,'2023-04-02 21:55:25','2023-04-02 21:55:25','127.0.0.1'),(17,'2023-04-01 12:45:56',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',2,'2023-04-02 23:06:12','2023-04-02 23:06:12','127.0.0.1'),(18,'2023-04-02 08:00:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',3,'2023-04-02 23:23:53','2023-04-02 23:23:53','127.0.0.1'),(19,'2023-04-03 02:05:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',2,'2023-04-03 00:03:59','2023-04-03 00:03:59','127.0.0.1'),(20,'2023-04-03 02:00:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-03 09:37:31','2023-04-03 09:37:31','127.0.0.1'),(21,'2023-04-03 02:02:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',2,'2023-04-03 10:14:35','2023-04-03 10:14:35','127.0.0.1'),(22,'2023-04-03 02:02:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',2,'2023-04-03 10:15:58','2023-04-03 10:15:58','127.0.0.1'),(23,'2023-04-03 02:02:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',4,'2023-04-03 10:16:31','2023-04-03 10:16:31','127.0.0.1'),(24,'2023-04-03 02:02:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',4,'2023-04-03 10:16:33','2023-04-03 10:16:33','127.0.0.1'),(25,'2023-04-03 02:02:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',4,'2023-04-03 19:12:07','2023-04-03 19:12:07','127.0.0.1'),(26,'2023-04-03 07:45:00',_binary '\0\0\0\0\0\0\0\ò\ãJþ=?@¡\æ\äŠ>@',1,'2023-04-03 19:13:20','2023-04-03 19:13:20','127.0.0.1');
/*!40000 ALTER TABLE `clock_ins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employers`
--

DROP TABLE IF EXISTS `employers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employers`
--

LOCK TABLES `employers` WRITE;
/*!40000 ALTER TABLE `employers` DISABLE KEYS */;
INSERT INTO `employers` VALUES (1,'Mrs. Crystal Zboncak','darren.hickle@example.org','2023-03-31 13:09:56','2023-03-31 13:09:56');
/*!40000 ALTER TABLE `employers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` point NOT NULL,
  `employer_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_employer_id_foreign` (`employer_id`),
  CONSTRAINT `locations_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (2,'Anna Morar V',_binary '\0\0\0\0\0\0\0R¼×†=?@Šc\Ü\\¯>@',1,'2023-03-31 13:39:09','2023-03-31 13:39:09');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (2,'2023_03_31_014117_create_employers_table',1),(3,'2023_03_31_131146_create_workers_table',1),(4,'2023_03_31_132102_create_locations_table',1),(5,'2023_03_31_132615_create_clock_ins_table',1),(8,'2019_12_14_000001_create_personal_access_tokens_table',2),(10,'2023_04_01_142045_change_check_ins_column',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employer_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workers_employer_id_foreign` (`employer_id`),
  CONSTRAINT `workers_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (1,'Seth Langworth','xcrona@example.com',1,'2023-03-31 13:19:38','2023-03-31 13:19:38'),(2,'Dr. Madilyn Kemmer','frances84@example.org',1,'2023-03-31 13:23:36','2023-03-31 13:23:36'),(3,'Rosemary Sauer DDS','emily50@example.com',1,'2023-03-31 13:24:02','2023-03-31 13:24:02'),(4,'Amina Hilpert','labadie.vidal@example.org',1,'2023-03-31 13:25:24','2023-03-31 13:25:24');
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-03 23:19:35
