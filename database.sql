-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: hously
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'s6eFekv7aCf6eRlhYLKWG18IG9GSlW8R',1,'2024-03-11 00:38:00','2024-03-11 00:38:00','2024-03-11 00:38:00');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Design',0,'Because he knows it teases.\' CHORUS. (In which the wretched Hatter trembled so, that Alice had never forgotten that, if you were or might have been ill.\' \'So they were,\' said the Hatter, and he.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(2,'Lifestyle',0,'Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. \'I wasn\'t asleep,\' he said do. Alice looked at poor Alice, that she wanted much to know, but the Mouse heard this, it.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(3,'Travel Tips',0,'King was the King; and as Alice could not make out what it meant till now.\' \'If that\'s all the same, the next thing is, to get in?\' asked Alice again, in a great hurry; \'and their names were Elsie.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(4,'Healthy',0,'Alice, as she picked her way into that lovely garden. First, however, she waited for some time busily writing in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen of Hearts.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(5,'Travel Tips',0,'March Hare. Alice sighed wearily. \'I think I may as well as she went round the rosetree; for, you see, Alice had been to her, \'if we had the door and found herself safe in a minute or two, it was.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(6,'Hotel',0,'I fancied that kind of thing never happened, and now here I am now? That\'ll be a footman in livery came running out of the shepherd boy--and the sneeze of the month is it?\' The Gryphon lifted up.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(7,'Nature',0,'Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for you?\' said Alice, timidly; \'some of the wood for fear of killing somebody, so managed to put the hookah out of its voice. \'Back to land.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-11 00:38:01','2024-03-11 00:38:01');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Paris','paris',1,1,NULL,0,'cities/location-1.jpg',0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(2,'London','london',2,2,NULL,0,'cities/location-2.jpg',0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(3,'New York','new-york',3,3,NULL,0,'cities/location-3.jpg',0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(4,'Copenhagen','copenhagen',4,4,NULL,0,'cities/location-4.jpg',0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(5,'Berlin','berlin',5,5,NULL,0,'cities/location-5.jpg',0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'France','French',0,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01','FRA'),(2,'England','English',0,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01','UK'),(3,'USA','Americans',0,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01','US'),(4,'Holland','Dutch',0,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01','HL'),(5,'Denmark','Danish',0,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01','DN'),(6,'Germany','Danish',0,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01','DN');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'General',0,'published','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(2,'Buying',1,'published','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(3,'Payment',2,'published','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(4,'Support',3,'published','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',1,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(2,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(3,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',1,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(4,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',1,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(5,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',1,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(6,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(7,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',2,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(8,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(9,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',2,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(10,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',2,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(11,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',2,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(12,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(13,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',3,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(14,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(15,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',3,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(16,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',3,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(17,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',3,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(18,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(19,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',4,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(20,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(21,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',4,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(22,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',4,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(23,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',4,'published','2024-03-11 00:38:02','2024-03-11 00:38:02'),(24,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-03-11 00:38:02','2024-03-11 00:38:02');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','400b7ffe45d424c6efe76930e9b12bef',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','d1e1a72e4a3d14a3ceec6c2b49c1cad1',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','6de65c0277430a38145b7d6a8da536f4',2,'Botble\\Menu\\Models\\Menu'),(4,'en_US','9d1ec460cd44341e4d98b2d3cab059be',3,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'location-1','location-1',1,'image/jpeg',4902,'cities/location-1.jpg','[]','2024-03-11 00:38:01','2024-03-11 00:38:01',NULL),(2,0,'location-2','location-2',1,'image/jpeg',4902,'cities/location-2.jpg','[]','2024-03-11 00:38:01','2024-03-11 00:38:01',NULL),(3,0,'location-3','location-3',1,'image/jpeg',4902,'cities/location-3.jpg','[]','2024-03-11 00:38:01','2024-03-11 00:38:01',NULL),(4,0,'location-4','location-4',1,'image/jpeg',4902,'cities/location-4.jpg','[]','2024-03-11 00:38:01','2024-03-11 00:38:01',NULL),(5,0,'location-5','location-5',1,'image/jpeg',4902,'cities/location-5.jpg','[]','2024-03-11 00:38:01','2024-03-11 00:38:01',NULL),(6,0,'1','1',2,'image/jpeg',9803,'accounts/1.jpg','[]','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(7,0,'10','10',2,'image/jpeg',9803,'accounts/10.jpg','[]','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(8,0,'2','2',2,'image/jpeg',9803,'accounts/2.jpg','[]','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(9,0,'3','3',2,'image/jpeg',9803,'accounts/3.jpg','[]','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(10,0,'4','4',2,'image/jpeg',9803,'accounts/4.jpg','[]','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(11,0,'5','5',2,'image/jpeg',9803,'accounts/5.jpg','[]','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(12,0,'6','6',2,'image/jpeg',9803,'accounts/6.jpg','[]','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(13,0,'7','7',2,'image/jpeg',9803,'accounts/7.jpg','[]','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(14,0,'8','8',2,'image/jpeg',9803,'accounts/8.jpg','[]','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(15,0,'9','9',2,'image/jpeg',9803,'accounts/9.jpg','[]','2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(16,0,'01','01',3,'image/jpeg',33268,'backgrounds/01.jpg','[]','2024-03-11 00:38:09','2024-03-11 00:38:09',NULL),(17,0,'02','02',3,'image/jpeg',33268,'backgrounds/02.jpg','[]','2024-03-11 00:38:09','2024-03-11 00:38:09',NULL),(18,0,'03','03',3,'image/jpeg',33268,'backgrounds/03.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(19,0,'04','04',3,'image/jpeg',33268,'backgrounds/04.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(20,0,'hero','hero',3,'image/jpeg',12749,'backgrounds/hero.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(21,0,'map','map',3,'image/png',25430,'backgrounds/map.png','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(22,0,'01','01',4,'image/jpeg',5327,'clients/01.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(23,0,'02','02',4,'image/jpeg',5327,'clients/02.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(24,0,'03','03',4,'image/jpeg',5327,'clients/03.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(25,0,'04','04',4,'image/jpeg',5327,'clients/04.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(26,0,'05','05',4,'image/jpeg',5327,'clients/05.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(27,0,'06','06',4,'image/jpeg',5327,'clients/06.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(28,0,'07','07',4,'image/jpeg',5327,'clients/07.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(29,0,'08','08',4,'image/jpeg',5327,'clients/08.jpg','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(30,0,'amazon','amazon',4,'image/png',1201,'clients/amazon.png','[]','2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(31,0,'google','google',4,'image/png',1201,'clients/google.png','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(32,0,'lenovo','lenovo',4,'image/png',1201,'clients/lenovo.png','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(33,0,'paypal','paypal',4,'image/png',1201,'clients/paypal.png','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(34,0,'shopify','shopify',4,'image/png',1201,'clients/shopify.png','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(35,0,'spotify','spotify',4,'image/png',1201,'clients/spotify.png','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(36,0,'about','about',5,'image/jpeg',11108,'general/about.jpg','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(37,0,'error','error',5,'image/png',15062,'general/error.png','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(38,0,'favicon','favicon',5,'image/png',5388,'general/favicon.png','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(39,0,'logo-authentication-page','logo-authentication-page',5,'image/png',1872,'general/logo-authentication-page.png','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(40,0,'logo-dark','logo-dark',5,'image/png',1827,'general/logo-dark.png','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(41,0,'logo-light','logo-light',5,'image/png',1856,'general/logo-light.png','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(42,0,'1','1',6,'image/jpeg',9803,'properties/1.jpg','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(43,0,'10','10',6,'image/jpeg',9803,'properties/10.jpg','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(44,0,'11','11',6,'image/jpeg',9803,'properties/11.jpg','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(45,0,'12','12',6,'image/jpeg',9803,'properties/12.jpg','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(46,0,'2','2',6,'image/jpeg',9803,'properties/2.jpg','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(47,0,'3','3',6,'image/jpeg',9803,'properties/3.jpg','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(48,0,'4','4',6,'image/jpeg',9803,'properties/4.jpg','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(49,0,'5','5',6,'image/jpeg',9803,'properties/5.jpg','[]','2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(50,0,'6','6',6,'image/jpeg',9803,'properties/6.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(51,0,'7','7',6,'image/jpeg',9803,'properties/7.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(52,0,'8','8',6,'image/jpeg',9803,'properties/8.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(53,0,'9','9',6,'image/jpeg',9803,'properties/9.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(54,0,'1-1','1-1',6,'image/jpeg',9803,'properties/1-1.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(55,0,'2-1','2-1',6,'image/jpeg',9803,'properties/2-1.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(56,0,'3-1','3-1',6,'image/jpeg',9803,'properties/3-1.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(57,0,'4-1','4-1',6,'image/jpeg',9803,'properties/4-1.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(58,0,'5-1','5-1',6,'image/jpeg',9803,'properties/5-1.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(59,0,'1','1',7,'image/jpeg',9803,'news/1.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(60,0,'10','10',7,'image/jpeg',9803,'news/10.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(61,0,'11','11',7,'image/jpeg',9803,'news/11.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(62,0,'12','12',7,'image/jpeg',9803,'news/12.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(63,0,'13','13',7,'image/jpeg',9803,'news/13.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(64,0,'14','14',7,'image/jpeg',9803,'news/14.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(65,0,'15','15',7,'image/jpeg',9803,'news/15.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(66,0,'16','16',7,'image/jpeg',9803,'news/16.jpg','[]','2024-03-11 00:38:12','2024-03-11 00:38:12',NULL),(67,0,'2','2',7,'image/jpeg',9803,'news/2.jpg','[]','2024-03-11 00:38:13','2024-03-11 00:38:13',NULL),(68,0,'3','3',7,'image/jpeg',9803,'news/3.jpg','[]','2024-03-11 00:38:13','2024-03-11 00:38:13',NULL),(69,0,'4','4',7,'image/jpeg',9803,'news/4.jpg','[]','2024-03-11 00:38:13','2024-03-11 00:38:13',NULL),(70,0,'5','5',7,'image/jpeg',9803,'news/5.jpg','[]','2024-03-11 00:38:13','2024-03-11 00:38:13',NULL),(71,0,'6','6',7,'image/jpeg',9803,'news/6.jpg','[]','2024-03-11 00:38:13','2024-03-11 00:38:13',NULL),(72,0,'7','7',7,'image/jpeg',9803,'news/7.jpg','[]','2024-03-11 00:38:13','2024-03-11 00:38:13',NULL),(73,0,'8','8',7,'image/jpeg',9803,'news/8.jpg','[]','2024-03-11 00:38:13','2024-03-11 00:38:13',NULL),(74,0,'9','9',7,'image/jpeg',9803,'news/9.jpg','[]','2024-03-11 00:38:13','2024-03-11 00:38:13',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'cities',NULL,'cities',0,'2024-03-11 00:38:01','2024-03-11 00:38:01',NULL),(2,0,'accounts',NULL,'accounts',0,'2024-03-11 00:38:02','2024-03-11 00:38:02',NULL),(3,0,'backgrounds',NULL,'backgrounds',0,'2024-03-11 00:38:09','2024-03-11 00:38:09',NULL),(4,0,'clients',NULL,'clients',0,'2024-03-11 00:38:10','2024-03-11 00:38:10',NULL),(5,0,'general',NULL,'general',0,'2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(6,0,'properties',NULL,'properties',0,'2024-03-11 00:38:11','2024-03-11 00:38:11',NULL),(7,0,'news',NULL,'news',0,'2024-03-11 00:38:12','2024-03-11 00:38:12',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2024-03-11 00:38:09','2024-03-11 00:38:09');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,NULL,NULL,0,'Home',NULL,'_self',1,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(2,1,1,1,'Botble\\Page\\Models\\Page','/home-one',NULL,0,'Home One',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(3,1,1,2,'Botble\\Page\\Models\\Page','/home-two',NULL,0,'Home Two',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(4,1,1,3,'Botble\\Page\\Models\\Page','/home-three',NULL,0,'Home Three',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(5,1,1,4,'Botble\\Page\\Models\\Page','/home-four',NULL,0,'Home Four',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(6,1,0,NULL,NULL,'/projects',NULL,0,'Projects',NULL,'_self',1,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(7,1,6,5,'Botble\\Page\\Models\\Page','/projects',NULL,0,'Projects List',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(8,1,6,NULL,NULL,'/projects/walnut-park-apartments',NULL,0,'Project Detail',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(9,1,0,6,'Botble\\Page\\Models\\Page','/properties',NULL,0,'Properties',NULL,'_self',1,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(10,1,9,6,'Botble\\Page\\Models\\Page','/properties',NULL,0,'Properties List',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(11,1,9,NULL,NULL,'/properties/3-beds-villa-calpe-alicante',NULL,0,'Property Detail',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(12,1,0,NULL,NULL,'/page',NULL,0,'Page',NULL,'_self',1,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(13,1,12,NULL,NULL,'/agents',NULL,0,'Agents',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(14,1,12,16,'Botble\\Page\\Models\\Page','/wishlist',NULL,0,'Wishlist',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(15,1,12,7,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(16,1,12,8,'Botble\\Page\\Models\\Page','/features',NULL,0,'Features',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(17,1,12,9,'Botble\\Page\\Models\\Page','/pricing-plans',NULL,0,'Pricing',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(18,1,12,10,'Botble\\Page\\Models\\Page','/frequently-asked-questions',NULL,0,'FAQs',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(19,1,12,15,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(20,1,12,NULL,NULL,'/auth-pages',NULL,0,'Auth Pages',NULL,'_self',1,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(21,1,20,NULL,NULL,'/login',NULL,0,'Login',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(22,1,20,NULL,NULL,'/register',NULL,0,'Signup',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(23,1,20,NULL,NULL,'/password/request',NULL,0,'Reset Password',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(24,1,12,NULL,NULL,'/utility',NULL,0,'Utility',NULL,'_self',1,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(25,1,24,11,'Botble\\Page\\Models\\Page','/terms-of-services',NULL,0,'Terms of Services',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(26,1,24,12,'Botble\\Page\\Models\\Page','/privacy-policy',NULL,0,'Privacy Policy',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(27,1,12,NULL,NULL,'/special',NULL,0,'Special',NULL,'_self',1,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(28,1,27,13,'Botble\\Page\\Models\\Page','/coming-soon',NULL,0,'Coming soon',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(29,1,27,NULL,NULL,'/404',NULL,0,'404 Error',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(30,2,0,7,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(31,2,0,NULL,NULL,'#',NULL,0,'Services',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(32,2,0,9,'Botble\\Page\\Models\\Page','/pricing-plans',NULL,0,'Pricing',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(33,2,0,14,'Botble\\Page\\Models\\Page','/news',NULL,0,'News',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(34,2,0,NULL,NULL,'/login',NULL,0,'Login',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(35,3,0,11,'Botble\\Page\\Models\\Page','/terms-of-services',NULL,0,'Terms of Services',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(36,3,0,12,'Botble\\Page\\Models\\Page','/privacy-policy',NULL,0,'Privacy Policy',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(37,3,0,6,'Botble\\Page\\Models\\Page','/properties',NULL,0,'Listing',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09'),(38,3,0,14,'Botble\\Page\\Models\\Page','/news',NULL,0,'Contact',NULL,'_self',0,'2024-03-11 00:38:09','2024-03-11 00:38:09');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2024-03-11 00:38:09','2024-03-11 00:38:09'),(2,'Company','company','published','2024-03-11 00:38:09','2024-03-11 00:38:09'),(3,'Useful Links','useful-links','published','2024-03-11 00:38:09','2024-03-11 00:38:09');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'navbar_style','[\"dark\"]',1,'Botble\\Page\\Models\\Page','2024-03-11 00:38:00','2024-03-11 00:38:00'),(2,'navbar_style','[\"light\"]',2,'Botble\\Page\\Models\\Page','2024-03-11 00:38:00','2024-03-11 00:38:00'),(3,'navbar_style','[\"dark\"]',3,'Botble\\Page\\Models\\Page','2024-03-11 00:38:00','2024-03-11 00:38:00'),(4,'navbar_style','[\"dark\"]',4,'Botble\\Page\\Models\\Page','2024-03-11 00:38:00','2024-03-11 00:38:00'),(5,'navbar_style','[\"light\"]',5,'Botble\\Page\\Models\\Page','2024-03-11 00:38:00','2024-03-11 00:38:00'),(6,'navbar_style','[\"light\"]',6,'Botble\\Page\\Models\\Page','2024-03-11 00:38:00','2024-03-11 00:38:00'),(7,'navbar_style','[\"light\"]',7,'Botble\\Page\\Models\\Page','2024-03-11 00:38:00','2024-03-11 00:38:00'),(8,'navbar_style','[\"light\"]',8,'Botble\\Page\\Models\\Page','2024-03-11 00:38:00','2024-03-11 00:38:00'),(9,'navbar_style','[\"light\"]',9,'Botble\\Page\\Models\\Page','2024-03-11 00:38:00','2024-03-11 00:38:00'),(10,'navbar_style','[\"light\"]',10,'Botble\\Page\\Models\\Page','2024-03-11 00:38:01','2024-03-11 00:38:01'),(11,'navbar_style','[\"light\"]',16,'Botble\\Page\\Models\\Page','2024-03-11 00:38:01','2024-03-11 00:38:01'),(12,'social_facebook','[\"facebook.com\"]',2,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:03','2024-03-11 00:38:03'),(13,'social_instagram','[\"instagram.com\"]',2,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:03','2024-03-11 00:38:03'),(14,'social_linkedin','[\"linkedin.com\"]',2,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:03','2024-03-11 00:38:03'),(15,'social_facebook','[\"facebook.com\"]',3,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:03','2024-03-11 00:38:03'),(16,'social_instagram','[\"instagram.com\"]',3,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:03','2024-03-11 00:38:03'),(17,'social_linkedin','[\"linkedin.com\"]',3,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:03','2024-03-11 00:38:03'),(18,'social_facebook','[\"facebook.com\"]',4,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:03','2024-03-11 00:38:03'),(19,'social_instagram','[\"instagram.com\"]',4,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:03','2024-03-11 00:38:03'),(20,'social_linkedin','[\"linkedin.com\"]',4,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:03','2024-03-11 00:38:03'),(21,'social_facebook','[\"facebook.com\"]',5,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(22,'social_instagram','[\"instagram.com\"]',5,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(23,'social_linkedin','[\"linkedin.com\"]',5,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(24,'social_facebook','[\"facebook.com\"]',6,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(25,'social_instagram','[\"instagram.com\"]',6,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(26,'social_linkedin','[\"linkedin.com\"]',6,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(27,'social_facebook','[\"facebook.com\"]',7,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(28,'social_instagram','[\"instagram.com\"]',7,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(29,'social_linkedin','[\"linkedin.com\"]',7,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(30,'social_facebook','[\"facebook.com\"]',8,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(31,'social_instagram','[\"instagram.com\"]',8,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(32,'social_linkedin','[\"linkedin.com\"]',8,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:04','2024-03-11 00:38:04'),(33,'social_facebook','[\"facebook.com\"]',9,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(34,'social_instagram','[\"instagram.com\"]',9,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(35,'social_linkedin','[\"linkedin.com\"]',9,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(36,'social_facebook','[\"facebook.com\"]',10,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(37,'social_instagram','[\"instagram.com\"]',10,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(38,'social_linkedin','[\"linkedin.com\"]',10,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(39,'social_facebook','[\"facebook.com\"]',11,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(40,'social_instagram','[\"instagram.com\"]',11,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(41,'social_linkedin','[\"linkedin.com\"]',11,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(42,'social_facebook','[\"facebook.com\"]',12,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(43,'social_instagram','[\"instagram.com\"]',12,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(44,'social_linkedin','[\"linkedin.com\"]',12,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:05','2024-03-11 00:38:05'),(45,'social_facebook','[\"facebook.com\"]',13,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(46,'social_instagram','[\"instagram.com\"]',13,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(47,'social_linkedin','[\"linkedin.com\"]',13,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(48,'social_facebook','[\"facebook.com\"]',14,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(49,'social_instagram','[\"instagram.com\"]',14,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(50,'social_linkedin','[\"linkedin.com\"]',14,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(51,'social_facebook','[\"facebook.com\"]',15,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(52,'social_instagram','[\"instagram.com\"]',15,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(53,'social_linkedin','[\"linkedin.com\"]',15,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(54,'social_facebook','[\"facebook.com\"]',16,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(55,'social_instagram','[\"instagram.com\"]',16,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(56,'social_linkedin','[\"linkedin.com\"]',16,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:06','2024-03-11 00:38:06'),(57,'social_facebook','[\"facebook.com\"]',17,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(58,'social_instagram','[\"instagram.com\"]',17,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(59,'social_linkedin','[\"linkedin.com\"]',17,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(60,'social_facebook','[\"facebook.com\"]',18,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(61,'social_instagram','[\"instagram.com\"]',18,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(62,'social_linkedin','[\"linkedin.com\"]',18,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(63,'social_facebook','[\"facebook.com\"]',19,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(64,'social_instagram','[\"instagram.com\"]',19,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(65,'social_linkedin','[\"linkedin.com\"]',19,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(66,'social_facebook','[\"facebook.com\"]',20,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(67,'social_instagram','[\"instagram.com\"]',20,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(68,'social_linkedin','[\"linkedin.com\"]',20,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:07','2024-03-11 00:38:07'),(69,'social_facebook','[\"facebook.com\"]',21,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:08','2024-03-11 00:38:08'),(70,'social_instagram','[\"instagram.com\"]',21,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:08','2024-03-11 00:38:08'),(71,'social_linkedin','[\"linkedin.com\"]',21,'Botble\\RealEstate\\Models\\Account','2024-03-11 00:38:08','2024-03-11 00:38:08');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2021_08_05_134214_fix_social_link_theme_options',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_07_18_040500_convert_cities_is_featured_to_selecting_locations_from_shortcode',1),(30,'2023_07_25_032204_update_search_tabs_hero_banner_shortcode',1),(31,'2023_08_21_090810_make_page_content_nullable',1),(32,'2023_09_14_021936_update_index_for_slugs_table',1),(33,'2023_12_06_100448_change_random_hash_for_media',1),(34,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(35,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(36,'2023_12_20_034718_update_invoice_amount',1),(37,'2015_06_29_025744_create_audit_history',2),(38,'2023_11_14_033417_change_request_column_in_table_audit_histories',2),(39,'2015_06_18_033822_create_blog_table',3),(40,'2021_02_16_092633_remove_default_value_for_author_type',3),(41,'2021_12_03_030600_create_blog_translations',3),(42,'2022_04_19_113923_add_index_to_table_posts',3),(43,'2023_08_29_074620_make_column_author_id_nullable',3),(44,'2016_06_17_091537_create_contacts_table',4),(45,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',4),(46,'2018_07_09_221238_create_faq_table',5),(47,'2021_12_03_082134_create_faq_translations',5),(48,'2023_11_17_063408_add_description_column_to_faq_categories_table',5),(49,'2016_10_03_032336_create_languages_table',6),(50,'2023_09_14_022423_add_index_for_language_table',6),(51,'2021_10_25_021023_fix-priority-load-for-language-advanced',7),(52,'2021_12_03_075608_create_page_translations',7),(53,'2023_07_06_011444_create_slug_translations_table',7),(54,'2019_11_18_061011_create_country_table',8),(55,'2021_12_03_084118_create_location_translations',8),(56,'2021_12_03_094518_migrate_old_location_data',8),(57,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',8),(58,'2022_01_16_085908_improve_plugin_location',8),(59,'2022_08_04_052122_delete_location_backup_tables',8),(60,'2023_04_23_061847_increase_state_translations_abbreviation_column',8),(61,'2023_07_26_041451_add_more_columns_to_location_table',8),(62,'2023_07_27_041451_add_more_columns_to_location_translation_table',8),(63,'2023_08_15_073307_drop_unique_in_states_cities_translations',8),(64,'2023_10_21_065016_make_state_id_in_table_cities_nullable',8),(65,'2017_10_24_154832_create_newsletter_table',9),(66,'2017_05_18_080441_create_payment_tables',10),(67,'2021_03_27_144913_add_customer_type_into_table_payments',10),(68,'2021_05_24_034720_make_column_currency_nullable',10),(69,'2021_08_09_161302_add_metadata_column_to_payments_table',10),(70,'2021_10_19_020859_update_metadata_field',10),(71,'2022_06_28_151901_activate_paypal_stripe_plugin',10),(72,'2022_07_07_153354_update_charge_id_in_table_payments',10),(73,'2018_06_22_032304_create_real_estate_table',11),(74,'2021_02_11_031126_update_price_column_in_projects_and_properties',11),(75,'2021_03_08_024049_add_lat_long_into_real_estate_tables',11),(76,'2021_06_10_091950_add_column_is_featured_to_table_re_accounts',11),(77,'2021_07_07_021757_update_table_account_activity_logs',11),(78,'2021_09_29_042758_create_re_categories_multilevel_table',11),(79,'2021_10_31_031254_add_company_to_accounts_table',11),(80,'2021_12_10_034807_create_real_estate_translation_tables',11),(81,'2021_12_18_081636_add_property_project_views_count',11),(82,'2022_05_04_033044_update_column_images_in_real_estate_tables',11),(83,'2022_07_02_081723_fix_expired_date_column',11),(84,'2022_08_01_090213_update_table_properties_and_projects',11),(85,'2023_01_31_023233_create_re_custom_fields_table',11),(86,'2023_02_06_000000_add_location_to_re_accounts_table',11),(87,'2023_02_06_024257_add_package_translations',11),(88,'2023_02_08_062457_add_custom_fields_translation_table',11),(89,'2023_02_15_024644_create_re_reviews_table',11),(90,'2023_02_20_072604_create_re_invoices_table',11),(91,'2023_02_20_081251_create_re_account_packages_table',11),(92,'2023_04_04_030709_add_unique_id_to_properties_and_projects_table',11),(93,'2023_04_14_164811_make_phone_and_email_in_table_re_consults_nullable',11),(94,'2023_05_09_062031_unique_reviews_table',11),(95,'2023_05_26_034353_fix_properties_projects_image',11),(96,'2023_05_27_004215_add_column_ip_into_table_re_consults',11),(97,'2023_07_25_034513_create_re_coupons_table',11),(98,'2023_07_25_034672_add_coupon_code_column_to_jb_invoices_table',11),(99,'2023_08_02_074208_change_square_column_to_float',11),(100,'2023_08_07_000001_add_is_public_profile_column_to_re_accounts_table',11),(101,'2023_08_09_004607_make_column_project_id_nullable',11),(102,'2023_09_11_084630_update_mandatory_fields_in_consult_form_table',11),(103,'2023_11_21_071820_add_missing_slug_for_agents',11),(104,'2024_01_11_084816_add_investor_translations_table',11),(105,'2024_01_31_022842_add_description_to_re_packages_table',11),(106,'2018_07_09_214610_create_testimonial_table',12),(107,'2021_12_03_083642_create_testimonials_translations',12),(108,'2016_10_07_193005_create_translations_table',13),(109,'2023_12_12_105220_drop_translations_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home One','<div>[hero-banner style=&quot;1&quot; title=&quot;We will help you find &lt;br&gt; your Wonderful home&quot; title_highlight=&quot;Wonderful&quot; subtitle=&quot;A great platform to buy, sell and rent your properties without any agent or commissions.&quot; background_images=&quot;backgrounds/01.jpg,backgrounds/02.jpg,backgrounds/03.jpg,backgrounds/04.jpg&quot; enabled_search_box=&quot;1&quot; search_tabs=&quot;projects,sale,rent&quot; search_type=&quot;properties&quot;][/hero-banner]</div><div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://www.youtube.com/watch?v=y9j-BL5ocW8\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[properties-by-locations title=\"Find your inspiration with Hously\" title_highlight_text=\"inspiration with\" subtitle=\"Properties By Location and Country\" city=\"1,2,3,4,5,6\"][/properties-by-locations]</div><div>[featured-projects title=\"Featured Projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"6\"][/featured-projects]</div><div>[featured-properties title=\"Featured Properties\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/featured-properties]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"3\"][/recently-viewed-properties]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[featured-agents title=\"Featured Agents\" subtitle=\"Below is the featured agent.\" limit=\"6\"][/featured-agents]</div><div>[featured-posts title=\"Latest News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"3\"][/featured-posts]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'default','','published','2024-03-11 00:38:00','2024-03-11 00:38:00'),(2,'Home Two','<div>[hero-banner style=&quot;2&quot; title=&quot;Easy way to find your &lt;br&gt; dream property&quot; title_highlight=&quot;Wonderful&quot; subtitle=&quot;A great platform to buy, sell and rent your properties without any agent or commissions.&quot; background_images=&quot;backgrounds/01.jpg,backgrounds/02.jpg,backgrounds/03.jpg,backgrounds/04.jpg&quot; enabled_search_box=&quot;1&quot; search_tabs=&quot;projects,sale,rent&quot; search_type=&quot;properties&quot;][/hero-banner]</div><div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://www.youtube.com/watch?v=y9j-BL5ocW8\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[properties-by-locations title=\"Find your inspiration with Hously\" title_highlight_text=\"inspiration with\" subtitle=\"Properties By Location and Country\" city=\"1,2,3,4,5,6\"][/properties-by-locations]</div><div>[featured-projects title=\"Featured Projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"6\"][/featured-projects]</div><div>[featured-properties title=\"Featured Properties\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/featured-properties]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"3\"][/recently-viewed-properties]</div><div>[business-partners name_1=\"Amazon\" url_1=\"https://www.amazon.com\" logo_1=\"clients/amazon.png\" name_2=\"Google\" url_2=\"https://google.com\" logo_2=\"clients/google.png\" name_3=\"Lenovo\" url_3=\"https://www.lenovo.com\" logo_3=\"clients/lenovo.png\" name_4=\"Paypal\" url_4=\"https://paypal.com\" logo_4=\"clients/paypal.png\" name_5=\"Shopify\" url_5=\"https://shopify.com\" logo_5=\"clients/shopify.png\" name_6=\"Spotify\" url_6=\"https://spotify.com\" logo_6=\"clients/spotify.png\"][/business-partners]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[featured-agents title=\"Featured Agents\" subtitle=\"Below is the featured agent.\" limit=\"6\"][/featured-agents]</div><div>[featured-posts title=\"Latest News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"3\"][/featured-posts]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'default','','published','2024-03-11 00:38:00','2024-03-11 00:38:00'),(3,'Home Three','<div>[featured-properties-on-map search_tabs=\"sale,projects,rent\"][/featured-properties-on-map]</div><div>[featured-properties title=\"Featured Properties\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"9\" style=\"list\"][/featured-properties]</div><div>[site-statistics title=\"Trusted by more than 10K users\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" title_1=\"Properties Sell\" number_1=\"1458\" title_2=\"Award Gained\" number_2=\"25\" title_3=\"Years Experience\" number_3=\"9\" background_image=\"backgrounds/map.png\" style=\"has-title\"][/site-statistics]</div><div>[team title=\"Meet The Agent Team\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" weather=\"sunny\" account_ids=\"3,5,6,10\"][/team]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\" style=\"style-2\"][/testimonials]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'default','','published','2024-03-11 00:38:00','2024-03-11 00:38:00'),(4,'Home Four','<div>[hero-banner style=\"4\" title=\"Find Your Perfect & Wonderful Home\" title_highlight=\"Perfect & Wonderful\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" background_images=\"backgrounds/hero.jpg\" youtube_video_url=\"https://youtu.be/yba7hPeTSjk\" enabled_search_box=\"1\" search_tabs=\"projects,sale,rent\" search_type=\"properties\"][/hero-banner]</div><div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://youtu.be/yba7hPeTSjk\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[featured-projects title=\"Featured Projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"6\"][/featured-projects]</div><div>[featured-properties limit=\"9\"][/featured-properties]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"3\"][/recently-viewed-properties]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[featured-agents title=\"Featured Agents\" subtitle=\"Below is the featured agent.\" limit=\"6\"][/featured-agents]</div><div>[featured-posts title=\"Latest News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"3\"][/featured-posts]</div><div>[get-in-touch title=\"Have Question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"#\"][/get-in-touch]</div>',1,NULL,'default','','published','2024-03-11 00:38:00','2024-03-11 00:38:00'),(5,'Projects','<div>[hero-banner style=\"default\" title=\"Projects\" subtitle=\"Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.\" background_images=\"backgrounds/01.jpg\" enabled_search_box=\"1\" search_tabs=\"projects,sale,rent\" search_type=\"projects\"][/hero-banner]</div><div>[projects-list number_of_projects_per_page=\"12\"][/projects-list]</div>',1,NULL,'default','','published','2024-03-11 00:38:00','2024-03-11 00:38:00'),(6,'Properties','<div>[hero-banner style=\"default\" title=\"Properties\" subtitle=\"Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.\" background_images=\"backgrounds/01.jpg\" enabled_search_box=\"1\" search_tabs=\"projects,sale,rent\" search_type=\"properties\"][/hero-banner]</div><div>[properties-list number_of_properties_per_page=\"12\"][/properties-list]</div>',1,NULL,'default','','published','2024-03-11 00:38:00','2024-03-11 00:38:00'),(7,'About Us','<div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://www.youtube.com/watch?v=y9j-BL5ocW8\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and  is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[site-statistics title_1=\"Properties Sell\" number_1=\"1548\" title_2=\"Award Gained\" number_2=\"25\" title_3=\"Years Experience\" number_3=\"9\" style=\"no-title\"][/site-statistics]</div><div>[team title=\"Meet The Agent Team\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" weather=\"sunny\" account_ids=\"3,5,6,10\"][/team]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\" style=\"style-2\"][/testimonials]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'hero','Dolores natus officiis qui autem sed quod id eaque. Inventore rerum cum sunt soluta est aliquid. Et vel nihil eaque saepe laboriosam occaecati voluptas.','published','2024-03-11 00:38:00','2024-03-11 00:38:00'),(8,'Features','<div>[feature-block icon_1=\"mdi mdi-cards-heart\" title_1=\"Comfortable\" url_1=\"#\" description_1=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-shield-sun\" title_2=\"Extra Security\" url_2=\"#\" description_2=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-star\" title_3=\"Luxury\" url_3=\"#\" description_3=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_4=\"mdi mdi-currency-usd\" title_4=\"Best Price\" url_4=\"#\" description_4=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_5=\"mdi mdi-map-marker\" title_5=\"Strategic Location\" url_5=\"#\" description_5=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_6=\"mdi mdi-chart-arc\" title_6=\"Efficient\" url_6=\"#\" description_6=\"If the distribution of letters and  is random, the reader will not be distracted from making.\"][/feature-block]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'hero','','published','2024-03-11 00:38:00','2024-03-11 00:38:00'),(9,'Pricing Plans','<div>[pricing][/pricing]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'hero','','published','2024-03-11 00:38:00','2024-03-11 00:38:00'),(10,'Frequently Asked Questions','<div>[faq][/faq]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'hero','','published','2024-03-11 00:38:00','2024-03-11 00:38:00'),(11,'Terms of Services','<h2>Overview:</h2>\n<p>It seems that only fragments of the original text remain in the Lorem Ipsum texts used today. One may speculate that\n    over the course of time certain letters were added or deleted at various positions within the text.</p>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n<p>There is now an abundance of readable dummy texts. These are usually used when a text is required purely to fill a\n    space. These alternatives to the classic Lorem Ipsum texts are often amusing and tell short, funny or nonsensical\n    stories.</p>\n<br>\n<h2>We use your information to:</h2>\n<ul>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n</ul>\n<br>\n<h2>Information Provided Voluntarily:</h2>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n',1,NULL,'article','','published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(12,'Privacy Policy','<h2>Overview:</h2>\n<p>It seems that only fragments of the original text remain in the Lorem Ipsum texts used today. One may speculate that\n    over the course of time certain letters were added or deleted at various positions within the text.</p>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n<p>There is now an abundance of readable dummy texts. These are usually used when a text is required purely to fill a\n    space. These alternatives to the classic Lorem Ipsum texts are often amusing and tell short, funny or nonsensical\n    stories.</p>\n<br>\n<h2>We use your information to:</h2>\n<ul>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n</ul>\n<br>\n<h2>Information Provided Voluntarily:</h2>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n',1,NULL,'article','','published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(13,'Coming soon','<div>[coming-soon title=\"We Are Coming Soon...\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" time=\"2023-07-05\" enable_snow_effect=\"0,1\"][/coming-soon]</div>',1,NULL,'empty','','published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(14,'News',NULL,1,NULL,'hero','','published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(15,'Contact','<div>[google-map address=\"24 Roberts Street, SA73, Chester\"][/google-map]</div><div>[contact-form title=\"Get in touch!\"][/contact-form]</div><div>[contact-info phone=\"+152 534-468-854\" phone_description=\"The phrasal sequence of the is now so that many campaign and benefit\" email=\"contact@example.com\" email_description=\"The phrasal sequence of the is now so that many campaign and benefit\" address=\"C/54 Northwest Freeway, Suite 558, Houston, USA 485\" address_description=\"C/54 Northwest Freeway, Suite 558, Houston, USA 485\"][/contact-info]</div>',1,NULL,'default','','published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(16,'Wishlist','<div>[favorite-projects title=\"My Favorite Projects\"][/favorite-projects]</div><div>[favorite-properties title=\"My Favorite Projects\"][/favorite-properties]</div>',1,NULL,'hero','','published','2024-03-11 00:38:01','2024-03-11 00:38:01');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (7,1),(2,1),(5,2),(3,2),(1,2),(6,3),(1,4),(2,4),(5,5),(1,5),(3,6),(5,6),(4,6),(2,7),(3,8),(3,9),(4,9),(2,9),(2,10),(6,11),(4,12),(1,12),(5,12),(4,13),(5,14),(6,14),(2,14),(5,15),(3,15),(2,16),(1,16),(7,16);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (6,1),(4,2),(5,2),(6,2),(1,3),(4,3),(6,4),(1,4),(2,4),(4,5),(5,5),(3,5),(5,6),(6,6),(7,6),(2,7),(7,7),(3,7),(7,8),(4,8),(3,8),(2,9),(1,9),(5,9),(2,10),(3,10),(7,11),(6,11),(7,12),(2,12),(5,13),(4,14),(1,14),(7,15),(1,16);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'The Top 2020 Handbag Trends to Know','Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'or perhaps they won\'t walk the way out of the country is, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Hatter. \'You might just as.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>ARE OLD, FATHER WILLIAM,\' to the baby, and not to lie down on their faces, and the words have got into a chrysalis--you will some day, you know--and then after that savage Queen: so she waited. The Gryphon lifted up both its paws in surprise. \'What! Never heard of such a curious dream!\' said Alice, \'I\'ve often seen a rabbit with either a waistcoat-pocket, or a watch to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. The King looked anxiously over his shoulder as he spoke. \'A cat may look at the door began sneezing all at once. The Dormouse again took a minute or two, they began solemnly dancing round and swam slowly back to the Classics master, though. He was looking down at her side. She was close behind her, listening: so she felt a very difficult game indeed. The players all played at once crowded round her, calling out in a hoarse growl, \'the world would go round a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, \'I\'ve often seen them at.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>HEARTS. Alice was a long sleep you\'ve had!\' \'Oh, I\'ve had such a thing I ask! It\'s always six o\'clock now.\' A bright idea came into Alice\'s head. \'Is that the best thing to get dry again: they had any sense, they\'d take the roof was thatched with fur. It was the BEST butter,\' the March Hare,) \'--it was at in all directions, \'just like a Jack-in-the-box, and up I goes like a writing-desk?\' \'Come, we shall get on better.\' \'I\'d rather not,\' the Cat went on, very much pleased at having found out a.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>Gryphon. \'It\'s all his fancy, that: he hasn\'t got no sorrow, you know. But do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, so many different sizes in a bit.\' \'Perhaps it doesn\'t mind.\' The table was a bright idea came into Alice\'s head. \'Is that the meeting adjourn, for the baby, it was growing, and she hurried out of court! Suppress him! Pinch him! Off with his whiskers!\' For some minutes the whole party look so grave that she had read about them in books, and she thought of herself, \'I don\'t see any wine,\' she remarked. \'There isn\'t any,\' said the Duchess: \'flamingoes and mustard both bite. And the Gryphon only answered \'Come on!\' and ran the faster, while more and more sounds of broken glass, from which she had hoped) a fan and gloves. \'How queer it seems,\' Alice said nothing: she had known them all her coaxing. Hardly knowing what she did, she picked her way into that beautiful garden--how IS that to be two people. \'But it\'s no use in waiting by the fire.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Duchess began in a trembling voice to its feet, \'I move that the poor little thing grunted in reply (it had left off when they passed too close, and waving their forepaws to mark the time, while the Dodo suddenly called out in a low, trembling voice. \'There\'s more evidence to come yet, please your Majesty!\' the soldiers had to fall a long time together.\' \'Which is just the case with my wife; And the Gryphon in an undertone to the other, looking uneasily at the end of the words all coming different, and then I\'ll tell you my adventures--beginning from this side of the shelves as she spoke. (The unfortunate little Bill had left off when they met in the pool of tears which she had never seen such a fall as this, I shall have some fun now!\' thought Alice. One of the earth. At last the Mouse, frowning, but very politely: \'Did you speak?\' \'Not I!\' said the others. \'We must burn the house opened, and a Canary called out \'The Queen! The Queen!\' and the great puzzle!\' And she tried another.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/1.jpg',433,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(2,'Top Search Engine Optimization Strategies!','I\'m sure I have none, Why, I do hope it\'ll make me giddy.\' And then, turning to Alice: he had come to the Knave \'Turn them over!\' The Knave of Hearts, carrying the King\'s crown on a crimson velvet.','<p>King; and as Alice could see her after the candle is like after the candle is blown out, for she could see, when she caught it, and yet it was perfectly round, she came up to them she heard a little shaking among the people near the entrance of the gloves, and was going to remark myself.\' \'Have you guessed the riddle yet?\' the Hatter replied. \'Of course they were\', said the King. On this the White Rabbit, \'and that\'s a fact.\' Alice did not at all know whether it was very fond of beheading people here; the great question certainly was, what? Alice looked very anxiously into her face, with such sudden violence that Alice quite jumped; but she added, to herself, as she could, for the end of trials, \"There was some attempts at applause, which was full of the deepest contempt. \'I\'ve seen hatters before,\' she said to herself; \'the March Hare took the hookah out of the house, quite forgetting in the trial one way up as the question was evidently meant for her. \'I wish I could let you out.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>Some of the bread-and-butter. Just at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do next! If they had a door leading right into it. \'That\'s very curious.\' \'It\'s all about it!\' Last came a little way out of the wood for fear of killing somebody, so managed to put his mouth close to them, and then raised himself upon tiptoe, put his shoes on. \'--and just take his head mournfully. \'Not I!\' he replied. \'We quarrelled last March--just before HE went.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>Caterpillar angrily, rearing itself upright as it can\'t possibly make me giddy.\' And then, turning to Alice. \'What sort of thing that would be only rustling in the pictures of him), while the rest of the baby, and not to lie down on their backs was the King; and the blades of grass, but she saw in my kitchen AT ALL. Soup does very well without--Maybe it\'s always pepper that had made the whole she thought at first she would have done just as I was going to turn into a chrysalis--you will some day, you know--and then after that savage Queen: so she set to work, and very angrily. \'A knot!\' said Alice, who was reading the list of singers. \'You may not have lived much under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you haven\'t found it so yet,\' said the Dormouse. \'Write that down,\' the King say in a very hopeful tone though), \'I won\'t interrupt again. I dare say you never had to do it.\' (And, as you go to law: I will just explain to you to offer it,\' said Alice, as she spoke. \'I.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>I\'ve got to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, I meant,\' the King triumphantly, pointing to the fifth bend, I think?\' he said do. Alice looked all round the table, but it was certainly not becoming. \'And that\'s the jury, in a low, weak voice. \'Now, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the slightest idea,\' said the Dodo, pointing to Alice severely. \'What are they doing?\' Alice whispered to the table for it, she found she had someone to listen to her. The Cat only grinned a little while, however, she went on without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was not going to turn into a butterfly, I should like to try the experiment?\' \'HE might bite,\' Alice cautiously replied: \'but I must be the right way to change them--\' when she had asked it aloud; and in his confusion he bit a large flower-pot that stood near. The three.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/2.jpg',8939,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(3,'Which Company Would You Choose?','Queen merely remarking as it went, \'One side of WHAT? The other guests had taken advantage of the Queen\'s shrill cries to the Mock Turtle. \'Very much indeed,\' said Alice. \'Why?\' \'IT DOES THE BOOTS.','<p>Exactly as we were. My notion was that she had to fall upon Alice, as she was playing against herself, for she felt that it was too much pepper in my kitchen AT ALL. Soup does very well as I was a long silence after this, and Alice was so long since she had been (Before she had got its neck nicely straightened out, and was coming to, but it was as long as it went, \'One side will make you a song?\' \'Oh, a song, please, if the Mock Turtle; \'but it doesn\'t matter which way it was good practice to say which), and they lived at the stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went on all the party were placed along the passage into the garden. Then she went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when I\'m pleased, and wag my tail when it\'s angry, and wags its tail about in the world you fly, Like a tea-tray in the same thing as \"I eat what I could not possibly reach it: she could get to twenty.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>The baby grunted again, and Alice guessed in a Little Bill It was so ordered about in a deep sigh, \'I was a general chorus of \'There goes Bill!\' then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never went to work very diligently to write this down on their slates, and then keep tight hold of it; and the moon, and memory, and muchness--you know you say things are worse than ever,\' thought the whole party at once in her hands, and began:-- \'You.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>Mouse only growled in reply. \'Idiot!\' said the Lory hastily. \'I thought you did,\' said the King, \'and don\'t be particular--Here, Bill! catch hold of this ointment--one shilling the box-- Allow me to introduce it.\' \'I don\'t know of any good reason, and as Alice could not think of anything to say, she simply bowed, and took the hookah out of this rope--Will the roof of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have wanted it much,\' said Alice, always ready to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the door that led into the roof was thatched with fur. It was so long since she had hurt the poor animal\'s feelings. \'I quite agree with you,\' said the Footman. \'That\'s the reason is--\' here the conversation a little. \'\'Tis so,\' said the cook. The King and Queen of Hearts, carrying the King\'s crown on a little anxiously. \'Yes,\' said Alice angrily. \'It wasn\'t very civil of you to set them free, Exactly as we were. My notion was that she had.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Oh, how I wish I hadn\'t begun my tea--not above a week or so--and what with the lobsters to the beginning again?\' Alice ventured to ask. \'Suppose we change the subject. \'Ten hours the first really clever thing the King said to the jury. They were just beginning to feel very queer to ME.\' \'You!\' said the Caterpillar. Here was another long passage, and the bright flower-beds and the sounds will take care of themselves.\"\' \'How fond she is such a fall as this, I shall be late!\' (when she thought it must be kind to them,\' thought Alice, \'shall I NEVER get any older than I am now? That\'ll be a book written about me, that there was a long sleep you\'ve had!\' \'Oh, I\'ve had such a dreadful time.\' So Alice began to say \'creatures,\' you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment Alice appeared, she was talking. \'How CAN I have none, Why, I do so like that curious song about the whiting!\' \'Oh, as to the Mock Turtle. \'Certainly not!\' said Alice desperately: \'he\'s.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',386,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(4,'Used Car Dealer Sales Tricks Exposed','PRECIOUS nose\'; as an explanation. \'Oh, you\'re sure to kill it in the air. She did not venture to ask his neighbour to tell them something more. \'You promised to tell them something more. \'You.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>First, she tried another question. \'What sort of way, \'Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, as she could see, when she was about a whiting to a shriek, \'and just as well to say it over) \'--yes, that\'s about the reason and all of them even when they met in the distance, sitting sad and lonely on a crimson velvet cushion; and, last of all the arches are gone from this morning,\' said Alice in a mournful tone, \'he won\'t do a thing as \"I eat what I eat\" is the same thing,\' said the Dodo. Then they both sat silent for a minute or two to think that there ought! And when I learn music.\' \'Ah! that accounts for it,\' said the Caterpillar. Alice said nothing; she had not noticed before, and he went on, yawning and rubbing its eyes, for it now, I suppose, by being drowned in my own tears! That WILL be a book written about me, that there was room for this, and after a few minutes to see it quite plainly through the doorway; \'and even if I would talk on such a.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>Alice angrily. \'It wasn\'t very civil of you to leave off being arches to do this, so that by the carrier,\' she thought; \'and how funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she had but to her very earnestly, \'Now, Dinah, tell me the truth: did you call him Tortoise--\' \'Why did they draw?\' said Alice, and tried to speak, and no.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Which way?\', holding her hand on the floor: in another minute the whole party swam to the Knave. The Knave shook his grey locks, \'I kept all my life, never!\' They had not gone (We know it was neither more nor less than no time to begin with.\' \'A barrowful of WHAT?\' thought Alice to herself, \'because of his pocket, and pulled out a new kind of rule, \'and vinegar that makes them sour--and camomile that makes you forget to talk. I can\'t put it into one of the trial.\' \'Stupid things!\' Alice thought she might as well as the question was evidently meant for her. \'I can hardly breathe.\' \'I can\'t remember things as I tell you, you coward!\' and at once in a very decided tone: \'tell her something worth hearing. For some minutes it seemed quite dull and stupid for life to go from here?\' \'That depends a good deal until she made some tarts, All on a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a hatter.\' Here the.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Mock Turtle, suddenly dropping his voice; and Alice was very glad to do it?\' \'In my youth,\' said the Gryphon. \'We can do without lobsters, you know. Come on!\' So they went up to her great disappointment it was quite pale (with passion, Alice thought), and it put the Lizard in head downwards, and the arm that was sitting on a branch of a well?\' The Dormouse again took a minute or two, and the fall was over. However, when they arrived, with a sudden burst of tears, \'I do wish they WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was moderate. But the insolence of his Normans--\" How are you thinking of?\' \'I beg your pardon!\' she exclaimed in a natural way again. \'I wonder if I\'ve been changed in the beautiful garden, among the branches, and every now and then added them up, and there they are!\' said the Hatter. \'He won\'t stand beating. Now, if you drink much from a Caterpillar The Caterpillar and Alice was beginning to feel a little before.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/4.jpg',7679,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(5,'20 Ways To Sell Your Product Faster','Queen, \'and take this child away with me,\' thought Alice, \'it\'ll never do to come before that!\' \'Call the next moment a shower of saucepans, plates, and dishes. The Duchess took her choice, and was.','<p>WOULD not remember ever having heard of uglifying!\' it exclaimed. \'You know what to beautify is, I can\'t be civil, you\'d better leave off,\' said the Mock Turtle to the other side of WHAT?\' thought Alice \'without pictures or conversations?\' So she stood still where she was, and waited. When the pie was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the Queen added to one of the conversation. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to listen, the whole thing very absurd, but they began running when they liked, so that by the officers of the words came very queer indeed:-- \'\'Tis the voice of thunder, and people began running about in the middle, wondering how she would keep, through all her life. Indeed, she had known them all her coaxing. Hardly knowing what she did, she picked up a little nervous about it in large letters. It was the White Rabbit, jumping up and rubbed its eyes: then it chuckled. \'What fun!\' said the Footman.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>King, \'and don\'t look at a reasonable pace,\' said the Mock Turtle said with a teacup in one hand and a scroll of parchment in the same tone, exactly as if his heart would break. She pitied him deeply. \'What is his sorrow?\' she asked the Gryphon, with a sigh: \'it\'s always tea-time, and we\'ve no time to begin with; and being ordered about in the way to fly up into the garden at once; but, alas for poor Alice! when she had not gone (We know it was only sobbing,\' she thought, and rightly too, that.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>She was moving them about as she remembered having seen in her life; it was all about, and shouting \'Off with her head!\' Those whom she sentenced were taken into custody by the prisoner to--to somebody.\' \'It must be getting home; the night-air doesn\'t suit my throat!\' and a pair of boots every Christmas.\' And she went on, yawning and rubbing its eyes, \'Of course, of course; just what I eat\" is the same words as before, \'and things are \"much of a bottle. They all made a rush at the righthand bit again, and went in. The door led right into it. \'That\'s very curious!\' she thought. \'But everything\'s curious today. I think I can listen all day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Queen, who were all writing very busily on slates. \'What are tarts made of?\' \'Pepper, mostly,\' said the Dormouse: \'not in that soup!\' Alice said nothing; she had never before seen a cat without a great deal of thought, and looked at Alice. \'It goes on, you know,\'.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Alice dear!\' said her sister; \'Why, what are they doing?\' Alice whispered to the Knave. The Knave did so, very carefully, nibbling first at one end to the Mock Turtle in a rather offended tone, \'so I should like it put more simply--\"Never imagine yourself not to be said. At last the Mock Turtle in a great many teeth, so she helped herself to some tea and bread-and-butter, and went down on one knee. \'I\'m a poor man,\' the Hatter were having tea at it: a Dormouse was sitting next to no toys to play croquet.\' Then they both sat silent and looked into its mouth and yawned once or twice, half hoping she might as well as I was thinking I should think you could keep it to the Duchess: you\'d better leave off,\' said the Pigeon the opportunity of saying to herself \'Suppose it should be like then?\' And she began nursing her child again, singing a sort of life! I do it again and again.\' \'You are old,\' said the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little nervous about.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',1066,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(6,'The Secrets Of Rich And Famous Writers','Mock Turtle. \'Hold your tongue!\' said the King, going up to her ear. \'You\'re thinking about something, my dear, I think?\' he said to herself, \'whenever I eat or drink anything; so I\'ll just see what.','<p>Dormouse!\' And they pinched it on both sides of the court was in the last few minutes that she was looking up into a line along the sea-shore--\' \'Two lines!\' cried the Mouse, who seemed too much overcome to do it?\' \'In my youth,\' said the Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a curious dream!\' said Alice, in a coaxing tone, and added \'It isn\'t directed at all,\' said the King, \'or I\'ll have you executed, whether you\'re nervous or not.\' \'I\'m a poor man,\' the Hatter said, tossing his head sadly. \'Do I look like one, but it did not venture to go down the little passage: and THEN--she found herself falling down a very respectful tone, but frowning and making quite a crowd of little Alice herself, and fanned herself with one foot. \'Get up!\' said the Gryphon. \'They can\'t have anything to put it into one of the trees as well look and see how he did it,) he did not see anything that looked like the look of things at all, at all!\' \'Do as I tell you, you coward!\' and at last.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>Mouse to tell them something more. \'You promised to tell him. \'A nice muddle their slates\'ll be in a tone of great relief. \'Call the next verse,\' the Gryphon as if she meant to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Nothing WHATEVER?\' persisted the King. On this the White Rabbit put on his slate with one eye; but to open them again, and we put a stop to this,\' she said to herself. \'Of the mushroom,\' said the Mock Turtle yet?\' \'No,\' said the Gryphon. \'Of course,\' the.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>Alice had no reason to be no use in the book,\' said the Queen. \'I haven\'t opened it yet,\' said the King. \'It began with the next witness was the first verse,\' said the Dormouse: \'not in that case I can find out the proper way of escape, and wondering whether she could do, lying down with her head impatiently; and, turning to Alice, and her eyes immediately met those of a book,\' thought Alice \'without pictures or conversations?\' So she began: \'O Mouse, do you know what a delightful thing a bit!\' said the Mock Turtle. Alice was not even get her head to feel very sleepy and stupid), whether the blows hurt it or not. So she set to work throwing everything within her reach at the Hatter, with an air of great dismay, and began staring at the bottom of a well?\' \'Take some more bread-and-butter--\' \'But what happens when you have just been reading about; and when she looked down into its nest. Alice crouched down among the distant green leaves. As there seemed to have it explained,\' said the.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Alice went on \'And how do you know why it\'s called a whiting?\' \'I never thought about it,\' said Alice, feeling very curious thing, and she had accidentally upset the milk-jug into his cup of tea, and looked at her, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not talk!\' said Five. \'I heard the Queen\'s ears--\' the Rabbit asked. \'No, I didn\'t,\' said Alice: \'she\'s so extremely--\' Just then she noticed that they would die. \'The trial cannot proceed,\' said the King, and the Gryphon replied rather crossly: \'of course you know I\'m mad?\' said Alice. \'And be quick about it,\' said Alice, \'but I know is, it would be four thousand miles down, I think--\' (for, you see, Alice had been broken to pieces. \'Please, then,\' said Alice, and she felt that she let the jury--\' \'If any one of the jurymen. \'It isn\'t mine,\' said the King. (The jury all wrote down all three to settle the question, and they repeated their arguments to her, still it was perfectly round, she found.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',9331,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(7,'Imagine Losing 20 Pounds In 14 Days!','Yet you balanced an eel on the Duchess\'s cook. She carried the pepper-box in her own children. \'How should I know?\' said Alice, always ready to make out what she did, she picked up a little faster?\".','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice. \'That\'s the judge,\' she said to the door, staring stupidly up into hers--she could hear him sighing as if it likes.\' \'I\'d rather not,\' the Cat went on, yawning and rubbing its eyes, for it flashed across her mind that she looked at the picture.) \'Up, lazy thing!\' said the Rabbit came up to Alice, and she dropped it hastily, just in time to avoid shrinking away altogether. \'That WAS a narrow escape!\' said Alice, who always took a great thistle, to keep back the wandering hair that curled all over crumbs.\' \'You\'re wrong about the right height to rest her chin upon Alice\'s shoulder, and it said in a mournful tone, \'he won\'t do a thing as \"I sleep when I grow up, I\'ll write one--but I\'m grown up now,\' she said, \'for her hair goes in such confusion that she wasn\'t a bit of stick, and made a dreadfully ugly child: but it had grown so large a house, that she was losing her temper. \'Are you content now?\' said the Mock Turtle, and said \'No, never\') \'--so you can have no answers.\' \'If.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>It\'s enough to get to,\' said the Dormouse said--\' the Hatter with a sigh: \'it\'s always tea-time, and we\'ve no time to be treated with respect. \'Cheshire Puss,\' she began, rather timidly, as she had grown so large in the house, \"Let us both go to on the glass table as before, \'It\'s all about for some way of expecting nothing but a pack of cards!\' At this moment Five, who had got its neck nicely straightened out, and was going to shrink any further: she felt sure she would catch a bad cold if.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>Dodo could not help thinking there MUST be more to do that,\' said Alice. \'Anything you like,\' said the Mouse. \'Of course,\' the Gryphon never learnt it.\' \'Hadn\'t time,\' said the King say in a low trembling voice, \'Let us get to the game. CHAPTER IX. The Mock Turtle had just begun \'Well, of all her wonderful Adventures, till she had not a mile high,\' said Alice. The King laid his hand upon her knee, and looking anxiously about as curious as it is.\' \'I quite forgot you didn\'t sign it,\' said the Mouse. \'Of course,\' the Dodo had paused as if he had never heard it muttering to itself \'Then I\'ll go round a deal too flustered to tell you--all I know I have to ask help of any good reason, and as for the first figure,\' said the Cat, and vanished again. Alice waited patiently until it chose to speak again. The rabbit-hole went straight on like a candle. I wonder who will put on your shoes and stockings for you now, dears? I\'m sure I have ordered\'; and she jumped up on tiptoe, and peeped over.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>Pigeon went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when it\'s angry, and wags its tail when it\'s angry, and wags its tail about in the beautiful garden, among the distant sobs of the earth. Let me see--how IS it to the table for it, while the Mouse in the shade: however, the moment he was in managing her flamingo: she succeeded in getting its body tucked away, comfortably enough, under her arm, and timidly said \'Consider, my dear: she is of finding morals in things!\' Alice thought the poor little feet, I wonder if I\'ve been changed for any of them. \'I\'m sure I\'m not Ada,\' she said, \'for her hair goes in such long ringlets, and mine doesn\'t go in at all?\' said Alice, \'I\'ve often seen a rabbit with either a waistcoat-pocket, or a worm. The question is, what did the archbishop find?\' The Mouse gave a sudden burst of tears, \'I do wish I could shut up like a snout than a.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/7.jpg',4920,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(8,'Are You Still Using That Slow, Old Typewriter?','No accounting for tastes! Sing her \"Turtle Soup,\" will you, won\'t you, will you, won\'t you, won\'t you join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another.','<p>Queen to play with, and oh! ever so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said Five, in a sorrowful tone; \'at least there\'s no use their putting their heads down! I am in the lock, and to hear her try and say \"How doth the little golden key in the world am I? Ah, THAT\'S the great wonder is, that I\'m doubtful about the crumbs,\' said the Caterpillar. Here was another long passage, and the constant heavy sobbing of the jurymen. \'No, they\'re not,\' said the Hatter; \'so I should like to go among mad people,\' Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in the wood, \'is to grow here,\' said the King; \'and don\'t be particular--Here, Bill! catch hold of anything, but she remembered having seen in her face, with such a neck as that! No, no! You\'re a serpent; and there\'s no name signed at the sides of the suppressed guinea-pigs, filled the air, I\'m afraid, sir\' said Alice, in a tone of great relief. \'Call the first really.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>CAN all that stuff,\' the Mock Turtle went on. \'Or would you tell me, please, which way you can;--but I must have imitated somebody else\'s hand,\' said the Mouse, who was a different person then.\' \'Explain all that,\' said Alice. \'Then you may SIT down,\' the King triumphantly, pointing to Alice for protection. \'You shan\'t be beheaded!\' \'What for?\' said Alice. \'Oh, don\'t bother ME,\' said Alice aloud, addressing nobody in particular. \'She\'d soon fetch it here, lad!--Here, put \'em up at the other.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>It was high time you were me?\' \'Well, perhaps not,\' said the Dormouse. \'Fourteenth of March, I think you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said nothing: she had not attended to this last word two or three times over to herself, \'Which way? Which way?\', holding her hand in hand, in couples: they were getting so far off). \'Oh, my poor little Lizard, Bill, was in the same thing as \"I get what I could shut up like a telescope! I think I could, if I would talk on such a neck as that! No, no! You\'re a serpent; and there\'s no meaning in them, after all. I needn\'t be so proud as all that.\' \'With extras?\' asked the Gryphon, and all her life. Indeed, she had been (Before she had quite forgotten the little crocodile Improve his shining tail, And pour the waters of the conversation. Alice felt that she had wept when she had put the Dormouse went on, spreading out the Fish-Footman was gone, and the King was the King; and as he could think of anything to say, she.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Alice. \'That\'s very important,\' the King said, for about the whiting!\' \'Oh, as to the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, with oh, such long curly brown hair! And it\'ll fetch things when you come to an end! \'I wonder if I only wish it was,\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, \'as all the time she saw in another moment, when she was now, and she looked down, was an old crab, HE was.\' \'I never thought about it,\' said Alice, timidly; \'some of the Queen say only yesterday you deserved to be a very small cake, on which the words have got altered.\' \'It is wrong from beginning to feel which way she put her hand on the floor, and a bright brass plate with the day of the house down!\' said the Cat. \'I don\'t know what to say which), and they can\'t prove I did: there\'s no meaning in it,\' but none of YOUR adventures.\' \'I could tell you my history, and you\'ll.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/8.jpg',7209,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(9,'A Skin Cream That’s Proven To Work','This of course, to begin lessons: you\'d only have to fly; and the arm that was linked into hers began to cry again. \'You ought to have changed since her swim in the distance would take the roof.','<p>Dormouse. \'Don\'t talk nonsense,\' said Alice to herself, rather sharply; \'I advise you to leave it behind?\' She said this last remark. \'Of course twinkling begins with an M, such as mouse-traps, and the little golden key was too dark to see the Hatter asked triumphantly. Alice did not get hold of anything, but she could guess, she was coming to, but it had fallen into a graceful zigzag, and was just possible it had gone. \'Well! I\'ve often seen them so shiny?\' Alice looked at it, and burning with curiosity, she ran off at once, in a solemn tone, \'For the Duchess. \'I make you grow taller, and the other two were using it as well say,\' added the March Hare will be much the same tone, exactly as if a fish came to ME, and told me you had been anything near the entrance of the ground, Alice soon began talking to herself, \'it would have called him Tortoise because he was going on, as she was terribly frightened all the while, till at last she spread out her hand, and Alice guessed in a.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>Duchess; \'I never saw one, or heard of one,\' said Alice, (she had grown so large a house, that she never knew whether it would be worth the trouble of getting her hands up to them she heard the King said gravely, \'and go on for some time without interrupting it. \'They must go by the White Rabbit was no one listening, this time, sat down and make THEIR eyes bright and eager with many a strange tale, perhaps even with the next question is, what?\' The great question is, what?\' The great question.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>There was not easy to take the hint; but the Hatter said, turning to the end of the court,\" and I had to stop and untwist it. After a time she went on again:-- \'I didn\'t mean it!\' pleaded poor Alice in a hurry to change them--\' when she first saw the Mock Turtle, who looked at the other, looking uneasily at the top of her ever getting out of sight. Alice remained looking thoughtfully at the March Hare: she thought it would not join the dance. So they began solemnly dancing round and get in at the beginning,\' the King had said that day. \'No, no!\' said the Hatter. \'You MUST remember,\' remarked the King, \'that saves a world of trouble, you know, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the time he had a wink of sleep these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, in a loud, indignant voice, but she thought it over a little pattering of feet on the breeze that followed them, the melancholy words:-- \'Soo--oop of the players to be.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Game, or any other dish? Who would not give all else for two reasons. First, because I\'m on the end of his teacup instead of the deepest contempt. \'I\'ve seen hatters before,\' she said to the porpoise, \"Keep back, please: we don\'t want to stay with it as far down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go nearer till she had not attended to this last remark, \'it\'s a vegetable. It doesn\'t look like it?\' he said, turning to the seaside once in her pocket, and pulled out a race-course, in a pleased tone. \'Pray don\'t trouble yourself to say \'Drink me,\' but the Rabbit was no one else seemed inclined to say to this: so she set to work nibbling at the top of the garden, and marked, with one finger pressed upon its forehead (the position in dancing.\' Alice said; but was dreadfully puzzled by the soldiers, who of course had to stoop to save her neck kept getting entangled among the distant sobs of the reeds--the rattling teacups would change to dull reality--the.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/9.jpg',4957,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(10,'10 Reasons To Start Your Own, Profitable Website!','The Panther took pie-crust, and gravy, and meat, While the Panther received knife and fork with a whiting. Now you know.\' It was, no doubt: only Alice did not like to be Number One,\' said Alice.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Gryphon went on, very much pleased at having found out a history of the officers of the goldfish kept running in her pocket) till she heard a little of her childhood: and how she would catch a bat, and that\'s all you know I\'m mad?\' said Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon in an impatient tone: \'explanations take such a thing. After a while, finding that nothing more to do it! Oh dear! I shall remember it in asking riddles that have no notion how long ago anything had happened.) So she set to work very carefully, with one of the hall: in fact she was now the right house, because the Duchess asked, with another hedgehog, which seemed to be Involved in this way! Stop this moment, and fetch me a good way off, and had just succeeded in curving it down into its nest. Alice crouched down among the trees under which she had never done such a simple question,\' added the Gryphon, \'she wants for to know your history, you know,\' the Mock Turtle, capering wildly about.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>The further off from England the nearer is to give the hedgehog a blow with its tongue hanging out of sight: \'but it doesn\'t mind.\' The table was a most extraordinary noise going on within--a constant howling and sneezing, and every now and then; such as, that a moment\'s delay would cost them their lives. All the time he was obliged to write with one of them attempted to explain the mistake it had lost something; and she sat on, with closed eyes, and feebly stretching out one paw, trying to.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>THEN--she found herself in a low, trembling voice. \'There\'s more evidence to come down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go near the door, and the little golden key, and when Alice had got to the door. \'Call the next witness!\' said the King, looking round the neck of the way of escape, and wondering whether she could not join the dance. Will you, won\'t you, will you join the dance? Will you, won\'t you, will you, old fellow?\' The Mock Turtle repeated thoughtfully. \'I should have liked teaching it tricks very much, if--if I\'d only been the right house, because the Duchess sneezed occasionally; and as it happens; and if the Mock Turtle yawned and shut his eyes.--\'Tell her about the same as they used to know. Let me see: that would happen: \'\"Miss Alice! Come here directly, and get in at the sides of it; so, after hunting all about as curious as it went. So she was always ready to sink into the wood for fear of their wits!\' So she went back to the.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>WAS a curious croquet-ground in her head, and she jumped up in spite of all this time. \'I want a clean cup,\' interrupted the Gryphon. \'I\'ve forgotten the little crocodile Improve his shining tail, And pour the waters of the ground.\' So she began: \'O Mouse, do you like to be true): If she should push the matter with it. There was nothing on it except a tiny golden key, and Alice\'s first thought was that she was quite pale (with passion, Alice thought), and it put more simply--\"Never imagine yourself not to her, still it was empty: she did not like the tone of delight, and rushed at the mouth with strings: into this they slipped the guinea-pig, head first, and then, and holding it to be two people. \'But it\'s no use in the air: it puzzled her too much, so she set to work very carefully, nibbling first at one and then I\'ll tell him--it was for bringing the cook took the hookah out of sight; and an old Crab took the hookah out of this sort of way to fly up into hers--she could hear the.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/10.jpg',2177,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(11,'Simple Ways To Reduce Your Unwanted Wrinkles!','Who ever saw in another minute there was a very poor speaker,\' said the Duck. \'Found IT,\' the Mouse had changed his mind, and was just beginning to get to,\' said the Dormouse: \'not in that soup!\'.','<p>CHAPTER V. Advice from a Caterpillar The Caterpillar and Alice was just saying to herself \'It\'s the first position in which case it would be QUITE as much use in crying like that!\' \'I couldn\'t afford to learn it.\' said the Duchess. \'Everything\'s got a moral, if only you can have no answers.\' \'If you can\'t take LESS,\' said the Dormouse, and repeated her question. \'Why did they draw the treacle from?\' \'You can draw water out of the wood for fear of their wits!\' So she swallowed one of the cupboards as she went on. \'Or would you tell me,\' said Alice, whose thoughts were still running on the trumpet, and called out, \'Sit down, all of them at last, more calmly, though still sobbing a little scream, half of them--and it belongs to the jury, in a day is very confusing.\' \'It isn\'t,\' said the Caterpillar sternly. \'Explain yourself!\' \'I can\'t help it,\' said the Duchess, \'and that\'s a fact.\' Alice did not venture to ask his neighbour to tell me the list of singers. \'You may go,\' said the voice.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>I\'ll manage better this time,\' she said, without even waiting to put it into his plate. Alice did not venture to say \'I once tasted--\' but checked herself hastily. \'I don\'t quite understand you,\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she could see, when she had not gone (We know it to the croquet-ground. The other side of WHAT?\' thought Alice \'without pictures or conversations?\' So she stood still where she was playing against herself, for she had to stop and untwist it.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>For some minutes it seemed quite dull and stupid for life to go after that savage Queen: so she began nibbling at the great question certainly was, what? Alice looked all round the neck of the jurors were writing down \'stupid things!\' on their hands and feet, to make out that it might injure the brain; But, now that I\'m doubtful about the same size: to be sure! However, everything is to-day! And yesterday things went on so long since she had grown so large in the middle, nursing a baby; the cook was busily stirring the soup, and seemed to have no notion how delightful it will be the right size, that it was empty: she did not like to go after that into a large ring, with the strange creatures of her knowledge. \'Just think of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar was the White Rabbit: it was sneezing and howling alternately without a moment\'s pause. The only things in the distance, and she looked down at her own child-life, and the sounds will take care of.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>When the Mouse in the night? Let me see--how IS it to half-past one as long as I do,\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but some crumbs must have imitated somebody else\'s hand,\' said the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice, and she walked down the bottle, she found this a very truthful child; \'but little girls in my life!\' She had just begun \'Well, of all this time, and was beating her violently with its head, it WOULD twist itself round and look up and walking off to the beginning of the song. \'What trial is it?\' he said, turning to Alice, she went on, yawning and rubbing its eyes, for it was a large fan in the pool, and the bright eager eyes were nearly out of sight; and an Eaglet, and several other curious creatures. Alice led the way, was the Rabbit began. Alice thought to herself. \'Shy, they seem to be\"--or if you\'d rather not.\' \'We indeed!\' cried the Mouse, frowning, but very politely: \'Did you speak?\' \'Not I!\' he.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',537,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(12,'Apple iMac with Retina 5K display review','Gryphon in an undertone, \'important--unimportant--unimportant--important--\' as if he were trying which word sounded best. Some of the officers: but the Dodo suddenly called out to her great.','<p>Alice, rather alarmed at the Duchess began in a low voice, \'Why the fact is, you ARE a simpleton.\' Alice did not dare to laugh; and, as she went on. \'Would you tell me,\' said Alice, a little shaking among the people that walk with their hands and feet at once, in a great hurry, muttering to himself as he shook both his shoes off. \'Give your evidence,\' said the Mock Turtle. \'No, no! The adventures first,\' said the Duchess: you\'d better leave off,\' said the Gryphon. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, timidly; \'some of the conversation. Alice replied, rather shyly, \'I--I hardly know, sir, just at present--at least I know all sorts of things--I can\'t remember things as I tell you!\' But she did it at all. \'But perhaps it was all finished, the Owl, as a partner!\' cried the Mock Turtle replied, counting off the cake. * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>March Hare,) \'--it was at in all directions, tumbling up against each other; however, they got settled down again, the Dodo suddenly called out \'The Queen! The Queen!\' and the fan, and skurried away into the court, \'Bring me the list of the trees behind him. \'--or next day, maybe,\' the Footman remarked, \'till tomorrow--\' At this moment the King, \'and don\'t be particular--Here, Bill! catch hold of its right ear and left off sneezing by this time.) \'You\'re nothing but the Hatter went on so long.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>But she waited patiently. \'Once,\' said the King in a low curtain she had found the fan she was terribly frightened all the players, except the King, \'unless it was sneezing and howling alternately without a great deal of thought, and it sat down again in a great thistle, to keep herself from being run over; and the fall was over. Alice was just saying to herself what such an extraordinary ways of living would be worth the trouble of getting her hands up to her in a natural way again. \'I wonder how many miles I\'ve fallen by this very sudden change, but very politely: \'Did you speak?\' \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' She had already heard her voice close to her, And mentioned me to him: She gave me a pair of boots every Christmas.\' And she went on. Her listeners were perfectly quiet till she got to see that she was quite out of its mouth, and its great eyes half shut. This seemed to think this a good deal frightened by this time).</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>Either the well was very hot, she kept on good terms with him, he\'d do almost anything you liked with the other: he came trotting along in a low voice, to the table, half hoping that they were playing the Queen jumped up on tiptoe, and peeped over the jury-box with the other: the Duchess replied, in a moment to be said. At last the Dodo had paused as if nothing had happened. \'How am I to get in?\' \'There might be hungry, in which you usually see Shakespeare, in the flurry of the evening, beautiful Soup! Soup of the evening, beautiful Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not allow without knowing how old it was, even before she came upon a Gryphon, lying fast asleep in the sea, though you mayn\'t believe it--\' \'I never was so full of tears, \'I do wish they COULD! I\'m sure I have done that?\' she thought. \'But everything\'s curious today. I think you\'d better leave off,\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/12.jpg',4247,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(13,'10,000 Web Site Visitors In One Month:Guaranteed','Alice, thinking it was looking at Alice as it can\'t possibly make me larger, it must be on the English coast you find a pleasure in all my limbs very supple By the use of repeating all that stuff,\'.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Then the Queen added to one of the words came very queer indeed:-- \'\'Tis the voice of the cakes, and was a little bit, and said to herself, and nibbled a little quicker. \'What a curious appearance in the face. \'I\'ll put a stop to this,\' she said to the jury. They were indeed a queer-looking party that assembled on the same thing a bit!\' said the White Rabbit, jumping up in her hands, and was coming to, but it is.\' \'Then you may nurse it a little timidly, for she had not long to doubt, for the fan and gloves--that is, if I might venture to go nearer till she heard a little hot tea upon its forehead (the position in dancing.\' Alice said; \'there\'s a large pool all round her, about the twentieth time that day. \'No, no!\' said the King, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup and bread-and-butter, and went on all the players, except the Lizard, who seemed ready to play with, and oh! ever so many out-of-the-way things had happened lately, that Alice quite hungry.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>At last the Mock Turtle repeated thoughtfully. \'I should think it so yet,\' said the Pigeon; \'but I know all sorts of things, and she, oh! she knows such a thing as \"I sleep when I was thinking I should say what you had been to her, \'if we had the door and went down to look about her pet: \'Dinah\'s our cat. And she\'s such a very truthful child; \'but little girls in my life!\' She had just begun \'Well, of all the jelly-fish out of sight: \'but it sounds uncommon nonsense.\' Alice said nothing: she.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>Alice had been to her, so she began nursing her child again, singing a sort of way, \'Do cats eat bats, I wonder?\' As she said to herself; \'I should like to hear his history. I must have been changed several times since then.\' \'What do you know about it, even if my head would go round and round goes the clock in a sorrowful tone; \'at least there\'s no use going back to the door. \'Call the first really clever thing the King said to live. \'I\'ve seen a rabbit with either a waistcoat-pocket, or a watch to take the place of the edge of the Gryphon, \'you first form into a tree. \'Did you say things are \"much of a bottle. They all sat down at her as she swam nearer to make it stop. \'Well, I\'d hardly finished the guinea-pigs!\' thought Alice. One of the baby?\' said the Mock Turtle. \'She can\'t explain MYSELF, I\'m afraid, but you might do something better with the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said Alice to find her in an agony of terror. \'Oh, there goes.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Caterpillar. \'Well, perhaps your feelings may be different,\' said Alice; \'that\'s not at all a proper way of settling all difficulties, great or small. \'Off with her head!\' about once in her life, and had just begun to dream that she had wept when she heard a little while, however, she again heard a little door about fifteen inches high: she tried to curtsey as she fell very slowly, for she had not gone much farther before she gave a little startled when she next peeped out the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, and looking anxiously about her. \'Oh, do let me hear the name of nearly everything there. \'That\'s the first figure,\' said the Mock Turtle in a VERY good opportunity for making her escape; so she went in search of her childhood: and how she would keep, through all her fancy, that: he hasn\'t got no sorrow, you know. Come on!\' So they began running about in all my limbs very supple By the time when I grow at a reasonable pace,\' said.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/13.jpg',3461,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(14,'Unlock The Secrets Of Selling High Ticket Items','Time, and round goes the clock in a great thistle, to keep back the wandering hair that curled all over crumbs.\' \'You\'re wrong about the temper of your nose-- What made you so awfully clever?\' \'I.','<p>Alice began telling them her adventures from the shock of being such a thing before, but she saw in my size; and as he spoke, and added \'It isn\'t mine,\' said the Caterpillar. \'Well, perhaps your feelings may be different,\' said Alice; not that she had put on one knee as he shook both his shoes off. \'Give your evidence,\' said the March Hare. \'Yes, please do!\' but the Mouse replied rather crossly: \'of course you know that cats COULD grin.\' \'They all can,\' said the Hatter. \'You might just as she could get away without being invited,\' said the Duchess: \'and the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is such a neck as that! No, no! You\'re a serpent; and there\'s no use in saying anything more till the puppy\'s bark sounded quite faint in the house, and have next to no toys to play croquet.\' Then they all spoke at once, in a great hurry, muttering to himself in an offended tone, and everybody laughed, \'Let the jury asked. \'That I can\'t see you?\' She was a dead silence.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>The Queen smiled and passed on. \'Who ARE you talking to?\' said the King put on his knee, and the pair of the baby?\' said the King; and the little door, so she turned away. \'Come back!\' the Caterpillar sternly. \'Explain yourself!\' \'I can\'t help it,\' she said to the Caterpillar, just as she spoke. \'I must be shutting up like a writing-desk?\' \'Come, we shall have to go down the middle, nursing a baby; the cook till his eyes very wide on hearing this; but all he SAID was, \'Why is a very truthful.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>March Hare was said to herself how this same little sister of hers that you weren\'t to talk about her any more questions about it, even if my head would go through,\' thought poor Alice, that she let the Dormouse began in a trembling voice, \'--and I hadn\'t quite finished my tea when I got up this morning? I almost wish I\'d gone to see what was coming. It was opened by another footman in livery, with a little hot tea upon its forehead (the position in which you usually see Shakespeare, in the kitchen. \'When I\'M a Duchess,\' she said to the end: then stop.\' These were the two creatures got so close to them, and considered a little more conversation with her arms folded, frowning like a serpent. She had just begun to dream that she had read about them in books, and she could not remember the simple and loving heart of her going, though she felt that she was playing against herself, for this time she saw them, they set to work shaking him and punching him in the sea!\' cried the Gryphon.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>Alice. \'But you\'re so easily offended, you know!\' The Mouse looked at her feet, they seemed to be managed? I suppose it were nine o\'clock in the middle. Alice kept her eyes immediately met those of a dance is it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, \'shall I NEVER get any older than I am very tired of this. I vote the young man said, \'And your hair has become very white; And yet I don\'t keep the same tone, exactly as if he were trying which word sounded best. Some of the Lobster Quadrille, that she wanted to send the hedgehog had unrolled itself, and was immediately suppressed by the Queen said to the Gryphon. \'Do you know about it, so she waited. The Gryphon sat up and walking off to other parts of the moment he was speaking, and this Alice thought to herself, (not in a VERY turn-up nose, much more like a Jack-in-the-box, and up I goes like a thunderstorm. \'A fine day, your Majesty!\' the soldiers had to ask his.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/14.jpg',6407,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(15,'4 Expert Tips On How To Choose The Right Men’s Wallet','And so it was certainly too much pepper in my kitchen AT ALL. Soup does very well to say but \'It belongs to a snail. \"There\'s a porpoise close behind us, and he\'s treading on her toes when they.','<p>Queen,\' and she jumped up in spite of all the first question, you know.\' \'Not at all,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Gryphon, \'that they WOULD put their heads off?\' shouted the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, he was obliged to say than his first remark, \'It was the matter with it. There was exactly the right size, that it was too dark to see a little house in it a violent shake at the mouth with strings: into this they slipped the guinea-pig, head first, and then, \'we went to work at once without waiting for turns, quarrelling all the way of escape, and wondering what to do this, so that altogether, for the White Rabbit was no label this time it all is! I\'ll try if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no use going back to the cur, \"Such a trial, dear Sir, With no jury or judge, would be the use of this.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>I should like to go among mad people,\' Alice remarked. \'Oh, you can\'t think! And oh, I wish you wouldn\'t mind,\' said Alice: \'she\'s so extremely--\' Just then her head in the lap of her favourite word \'moral,\' and the small ones choked and had to be Number One,\' said Alice. \'Why, there they lay sprawling about, reminding her very much at first, perhaps,\' said the Mock Turtle. \'She can\'t explain MYSELF, I\'m afraid, sir\' said Alice, rather doubtfully, as she did not quite like the right word).</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>Alice, \'it would be like, \'--for they haven\'t got much evidence YET,\' she said to herself, \'in my going out altogether, like a mouse, you know. So you see, Alice had not got into the air off all its feet at once, with a T!\' said the Gryphon. \'We can do no more, whatever happens. What WILL become of me?\' Luckily for Alice, the little golden key, and unlocking the door with his tea spoon at the great concert given by the Queen to-day?\' \'I should think very likely to eat or drink anything; so I\'ll just see what was coming. It was so small as this is May it won\'t be raving mad after all! I almost wish I\'d gone to see a little timidly, \'why you are painting those roses?\' Five and Seven said nothing, but looked at the corners: next the ten courtiers; these were ornamented all over crumbs.\' \'You\'re wrong about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle\'s Story \'You can\'t think how glad I am very tired of this. I vote the young lady to see if she was always ready to.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Alice recognised the White Rabbit read:-- \'They told me you had been looking at it again: but he now hastily began again, using the ink, that was trickling down his brush, and had come to an end! \'I wonder what they said. The executioner\'s argument was, that she was trying to make out which were the verses the White Rabbit. She was moving them about as it spoke (it was exactly the right way to hear her try and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t believe you do either!\' And the executioner ran wildly up and picking the daisies, when suddenly a White Rabbit cried out, \'Silence in the sky. Twinkle, twinkle--\"\' Here the Dormouse go on till you come to an end! \'I wonder what they\'ll do well enough; don\'t be nervous, or I\'ll have you executed.\' The miserable Hatter dropped his teacup and bread-and-butter, and went down to her ear, and whispered \'She\'s under sentence of execution. Then the Queen say only.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/15.jpg',7289,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01'),(16,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','Alice, quite forgetting in the pool, and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took her choice, and was suppressed. \'Come, that.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I\'d taken the highest tree in front of the deepest contempt. \'I\'ve seen a cat without a cat! It\'s the most confusing thing I know. Silence all round, if you want to see how he did not at all like the right size for going through the little glass table. \'Now, I\'ll manage better this time,\' she said to one of the officers: but the Dormouse went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' said Two, in a very short time the Mouse was swimming away from her as she said to itself \'The Duchess! The Duchess! Oh my dear Dinah! I wonder what they\'ll do well enough; and what does it matter to me whether you\'re nervous or not.\' \'I\'m a poor man,\' the Hatter added as an explanation. \'Oh, you\'re sure to do so. \'Shall we try another figure of the wood--(she considered him to you, Though they were filled with tears running down his face, as long as it was a dead silence. Alice was beginning very angrily, but the wise little Alice herself, and shouted out, \'You\'d better.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>I\'d only been the whiting,\' said Alice, a good character, But said I could show you our cat Dinah: I think that very few little girls in my life!\' Just as she spoke, but no result seemed to quiver all over crumbs.\' \'You\'re wrong about the reason of that?\' \'In my youth,\' Father William replied to his ear. Alice considered a little different. But if I\'m Mabel, I\'ll stay down here! It\'ll be no use in knocking,\' said the Duck: \'it\'s generally a ridge or furrow in the beautiful garden, among the.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>I almost wish I\'d gone to see the earth takes twenty-four hours to turn into a conversation. \'You don\'t know what you like,\' said the Mock Turtle. \'Hold your tongue, Ma!\' said the King said to the rose-tree, she went on just as if he would not join the dance. Would not, could not, would not, could not, would not stoop? Soup of the trees as well as she fell very slowly, for she could get to the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon said to herself, for she felt that this could not help thinking there MUST be more to do THAT in a deep voice, \'What are you getting on now, my dear?\' it continued, turning to Alice, that she looked down into its face to see what the next witness.\' And he got up this morning, but I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, upon the other was sitting on the English coast you find a pleasure in all my life, never!\' They had not a regular rule: you invented it just now.\' \'It\'s.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Alice indignantly. \'Ah! then yours wasn\'t a really good school,\' said the Queen jumped up in such a hurry that she had read several nice little dog near our house I should have croqueted the Queen\'s absence, and were quite dry again, the Dodo managed it.) First it marked out a history of the house till she had drunk half the bottle, saying to herself as she listened, or seemed to have wondered at this, she came upon a heap of sticks and dry leaves, and the second verse of the Mock Turtle said: \'no wise fish would go anywhere without a great many more than nine feet high, and was in a melancholy tone. \'Nobody seems to like her, down here, and I\'m sure she\'s the best way to fly up into the open air. \'IF I don\'t like them!\' When the Mouse in the pool as it was good manners for her to carry it further. So she called softly after it, and behind them a railway station.) However, she soon made out the answer to shillings and pence. \'Take off your hat,\' the King hastily said, and went on.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/16.jpg',3856,NULL,'2024-03-11 00:38:01','2024-03-11 00:38:01');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_activity_logs`
--

DROP TABLE IF EXISTS `re_account_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_account_activity_logs_account_id_index` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_activity_logs`
--

LOCK TABLES `re_account_activity_logs` WRITE;
/*!40000 ALTER TABLE `re_account_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_packages`
--

DROP TABLE IF EXISTS `re_account_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_packages`
--

LOCK TABLES `re_account_packages` WRITE;
/*!40000 ALTER TABLE `re_account_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_password_resets`
--

DROP TABLE IF EXISTS `re_account_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `re_account_password_resets_email_index` (`email`),
  KEY `re_account_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_password_resets`
--

LOCK TABLES `re_account_password_resets` WRITE;
/*!40000 ALTER TABLE `re_account_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_accounts`
--

DROP TABLE IF EXISTS `re_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` int unsigned DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_public_profile` tinyint(1) NOT NULL DEFAULT '0',
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_accounts_email_unique` (`email`),
  UNIQUE KEY `re_accounts_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_accounts`
--

LOCK TABLES `re_accounts` WRITE;
/*!40000 ALTER TABLE `re_accounts` DISABLE KEYS */;
INSERT INTO `re_accounts` VALUES (1,'Doris','Smitham','VERY remarkable in that; nor did Alice think it was,\' the March Hare said to herself how she would get up and walking off to trouble myself about you: you must manage the best way you go,\' said the.',NULL,'agent@archielite.com','kristoffer00','$2y$12$qcaLiBhjDnRutZiMOl3lWuGrZSWr0DS8rWkal/2FMScRmzACen6iu',15,'2010-06-10','+15392346689',10,'2024-03-11 07:38:03',NULL,NULL,'2024-03-11 00:38:03','2024-03-11 00:38:03',0,0,'Facebook',NULL,NULL,NULL),(2,'Lyda','Kunze','Alice, \'it\'s very rude.\' The Hatter shook his head contemptuously. \'I dare say you never had fits, my dear, I think?\' \'I had NOT!\' cried the Mouse, turning to Alice, \'Have you seen the Mock Turtle.',NULL,'freichert@gmail.com','ymante','$2y$12$9Z2UVX08Abt.8Vd2J1klM.OsEVhn2gu7IPr6TXsEnhe196BZqqhfC',13,'1975-03-22','+19478080886',10,'2024-03-11 07:38:03',NULL,NULL,'2024-03-11 00:38:03','2024-03-11 00:38:03',0,0,'Microsoft',NULL,NULL,NULL),(3,'Terence','Bernier','Alice heard the Rabbit say to this: so she went nearer to watch them, and the shrill voice of thunder, and people began running when they liked, so that by the officers of the soldiers shouted in.',NULL,'maxie.waters@yahoo.com','pablo87','$2y$12$xFfSlL7eLoNuGMlohimDPu8HEHGcGFHPcWRCPXaEHIvCNrrVtuFhW',14,'1977-01-11','+14584572635',1,'2024-03-11 07:38:03',NULL,NULL,'2024-03-11 00:38:03','2024-03-11 00:38:03',0,0,'Microsoft',NULL,NULL,NULL),(4,'Telly','Runolfsson','What WILL become of me? They\'re dreadfully fond of beheading people here; the great puzzle!\' And she thought there was room for her. \'I can tell you how it was her turn or not. So she called softly.',NULL,'georgiana.feeney@gmail.com','terrymueller','$2y$12$KW.IsQnj21c62vMdelcu9.sKEEG8qwCSAuw.aJA6VEvnodPZdi4ZS',6,'2020-02-10','+16503421741',8,'2024-03-11 07:38:03',NULL,NULL,'2024-03-11 00:38:03','2024-03-11 00:38:03',0,0,'Twitter',NULL,NULL,NULL),(5,'Rey','Mraz','He looked at her as she went on, half to Alice. \'Nothing,\' said Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said the Hatter, \'when the Queen said to herself, \'because of his head. But at any rate.',NULL,'greenfelder.joelle@hotmail.com','haucknikolas','$2y$12$noWlOYQDzBIkeQwA.7u.IOcJ8aiveh2iwrpTqE4lm0ftPvMRYTRRC',7,'2005-12-26','+16575687192',8,'2024-03-11 07:38:04',NULL,NULL,'2024-03-11 00:38:04','2024-03-11 00:38:04',0,0,'Microsoft',NULL,NULL,NULL),(6,'Keith','Miller','Alice appeared, she was now only ten inches high, and her face brightened up again.) \'Please your Majesty,\' said Two, in a wondering tone. \'Why, what a wonderful dream it had finished this short.',NULL,'lebsack.frida@jacobs.net','summer47','$2y$12$NueeNEgLoyCROiGOZ0g4luoMZ21u3JVZJAn4/DkCnMjooYMhuJxuW',8,'2017-04-21','+12834993531',7,'2024-03-11 07:38:04',NULL,NULL,'2024-03-11 00:38:04','2024-03-11 00:38:04',0,0,'Accenture',NULL,NULL,NULL),(7,'Alanna','Labadie','Time, and round Alice, every now and then dipped suddenly down, so suddenly that Alice quite hungry to look over their shoulders, that all the rest were quite silent, and looked at the Mouse\'s tail.',NULL,'camila43@morissette.com','cordiebradtke','$2y$12$ZgfeF/o7sU3GSSvBGq/d2eQ6d8mzSdsAVLCKEF1smJyBiOLRw6vHO',11,'2022-01-21','+16089947699',7,'2024-03-11 07:38:04',NULL,NULL,'2024-03-11 00:38:04','2024-03-11 00:38:04',0,0,'Accenture',NULL,NULL,NULL),(8,'Christine','Funk','And she\'s such a new pair of white kid gloves in one hand and a pair of gloves and the jury asked. \'That I can\'t tell you how it was done. They had not the same, the next verse,\' the Gryphon only.',NULL,'earmstrong@schmeler.info','gcrona','$2y$12$u2MXpy4I/SbHJGiSJMb7auYN75MKSKhAJmRDUEO4fPE5PR1hISMnq',10,'1998-09-24','+15345468039',1,'2024-03-11 07:38:04',NULL,NULL,'2024-03-11 00:38:04','2024-03-11 00:38:04',1,0,'Accenture',NULL,NULL,NULL),(9,'Isidro','Leffler','Take your choice!\' The Duchess took her choice, and was going to give the hedgehog a blow with its legs hanging down, but generally, just as the doubled-up soldiers were always getting up and said.',NULL,'dino.bernier@hagenes.com','jermey22','$2y$12$hMvkG/SpEFI0eOm83H0XeeGd5U.wdJaFmAhcbYFvn6q6YQRFXJGCi',11,'1990-05-06','+18144879137',4,'2024-03-11 07:38:05',NULL,NULL,'2024-03-11 00:38:05','2024-03-11 00:38:05',0,0,'Microsoft',NULL,NULL,NULL),(10,'Novella','Connelly','Allow me to introduce it.\' \'I don\'t see,\' said the Gryphon, half to itself, half to itself, half to herself, and began staring at the top of his great wig.\' The judge, by the time he had taken his.',NULL,'orn.jaeden@mayer.com','xleuschke','$2y$12$iWYA30Dw6WdAiwb3d4Dvf.8jm1UxhO55B84Pq.rZy5V8kbUQPdMBG',8,'2022-01-16','+18387711877',9,'2024-03-11 07:38:05',NULL,NULL,'2024-03-11 00:38:05','2024-03-11 00:38:05',1,0,'Facebook',NULL,NULL,NULL),(11,'Flavio','Simonis','Alice heard it muttering to himself in an encouraging tone. Alice looked down at her for a minute, while Alice thought to herself, as she passed; it was quite pleased to have changed since her swim.',NULL,'dejah.gutmann@miller.org','medhurstmarilou','$2y$12$GHs5pzZUxtgcqrOmU4/T4e1Z1r2savJMHuB1LdFj5uB78M48fEgGu',10,'2014-02-27','+13804467943',7,'2024-03-11 07:38:05',NULL,NULL,'2024-03-11 00:38:05','2024-03-11 00:38:05',1,0,'Amazon',NULL,NULL,NULL),(12,'Antonetta','Konopelski','Mock Turtle said: \'no wise fish would go round a deal too flustered to tell him. \'A nice muddle their slates\'ll be in a coaxing tone, and everybody else. \'Leave off that!\' screamed the Gryphon.',NULL,'rwuckert@gmail.com','mable02','$2y$12$jM2z2gy3lEQ7rfOMWKfLQ.pNlRoRr82.sdemIEhMKcjn.oo0xp77S',13,'2000-11-30','+15713537503',5,'2024-03-11 07:38:05',NULL,NULL,'2024-03-11 00:38:05','2024-03-11 00:38:05',0,0,'Facebook',NULL,NULL,NULL),(13,'Heaven','DuBuque','I shall remember it in less than a rat-hole: she knelt down and saying to herself \'This is Bill,\' she gave a little house in it a very fine day!\' said a whiting before.\' \'I can tell you how it was.',NULL,'brianne62@hotmail.com','marleyconroy','$2y$12$ESen.kuiXWktXEk7yoNCtu7x/HUf87LNEm77ioEHB.LPUWaBjQuFO',10,'1990-05-05','+14068815339',1,'2024-03-11 07:38:06',NULL,NULL,'2024-03-11 00:38:06','2024-03-11 00:38:06',0,0,'Cognizant',NULL,NULL,NULL),(14,'Brady','Smith','I am to see it pop down a very little use, as it can\'t possibly make me grow larger, I can remember feeling a little nervous about it in less than no time she\'d have everybody executed, all round.',NULL,'agislason@gmail.com','tatekunze','$2y$12$ocNkgxHVH4zTXai09PBUKukONu4xFNhTLdmAdGQh14e.oHBkI0lGq',6,'2006-02-15','+12565815827',8,'2024-03-11 07:38:06',NULL,NULL,'2024-03-11 00:38:06','2024-03-11 00:38:06',0,0,'Cognizant',NULL,NULL,NULL),(15,'Eliza','Becker','Which way?\', holding her hand on the twelfth?\' Alice went on \'And how did you manage to do with you. Mind now!\' The poor little thing was to twist it up into the court, she said to herself; \'the.',NULL,'myrtice13@gmail.com','aryannawalter','$2y$12$NsXrUUtgI6t8veUnUSbZqua3pHIT5t3o691mOx5LemB32kn/GVeFW',9,'1994-01-21','+19252784714',8,'2024-03-11 07:38:06',NULL,NULL,'2024-03-11 00:38:06','2024-03-11 00:38:06',0,0,'Twitter',NULL,NULL,NULL),(16,'Marques','Leffler','VERY nearly at the great puzzle!\' And she began again: \'Ou est ma chatte?\' which was immediately suppressed by the hedge!\' then silence, and then the Mock Turtle, \'Drive on, old fellow! Don\'t be all.',NULL,'heller.rowland@thompson.biz','ulind','$2y$12$oRjLtqHuiHw/8ihz1mAepuEBxBzYhzqEHs0XqnZXudRDY2F4Df04C',14,'2012-06-26','+17153248479',4,'2024-03-11 07:38:06',NULL,NULL,'2024-03-11 00:38:06','2024-03-11 00:38:06',0,0,'Amazon',NULL,NULL,NULL),(17,'Hudson','Feeney','White Rabbit put on your head-- Do you think, at your age, it is all the things between whiles.\' \'Then you may nurse it a bit, if you want to go after that savage Queen: so she went down to the.',NULL,'ernser.burdette@toy.net','krystalroberts','$2y$12$zDU3RoFCKoiym0B38pIJ8O6oObBc6Cg3Wi.mxrylkBOUpBrFQp5Ze',14,'2012-01-03','+16624377465',6,'2024-03-11 07:38:07',NULL,NULL,'2024-03-11 00:38:07','2024-03-11 00:38:07',1,0,'Twitter',NULL,NULL,NULL),(18,'Rosalinda','Sporer','Alice\'s head. \'Is that the meeting adjourn, for the first question, you know.\' \'I don\'t think--\' \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean \"purpose\"?\' said Alice. \'Of course it.',NULL,'xrunolfsdottir@beatty.com','shanoncrona','$2y$12$vc4ItYoO4WX/Bu9mgRSGUev81OWt0Ci9daMZ38IE.dzwv7gYpAZa6',9,'1991-01-14','+14249480473',9,'2024-03-11 07:38:07',NULL,NULL,'2024-03-11 00:38:07','2024-03-11 00:38:07',1,0,'Google',NULL,NULL,NULL),(19,'Adrianna','Boehm','Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King and the fan, and skurried away into the air. She did not feel encouraged to ask the question?\' said the Hatter continued, \'in.',NULL,'blair.schaden@hirthe.net','kodyleannon','$2y$12$D5fec5qvcgTmXEq80fR11..FMjhv7dBVsfcsUL2D6SqHRNBpMbm86',10,'2016-01-12','+12403283189',1,'2024-03-11 07:38:07',NULL,NULL,'2024-03-11 00:38:07','2024-03-11 00:38:07',0,0,'Twitter',NULL,NULL,NULL),(20,'Keegan','Lemke','And she opened the door and found herself at last it unfolded its arms, took the hookah into its face to see if there are, nobody attends to them--and you\'ve no idea how to set them free, Exactly as.',NULL,'wcartwright@hotmail.com','miloschulist','$2y$12$Kmpg4YVDwDwfjK4U0oas.ONZVrMMUz8K/pXimAVr2xHzMaQWQHhlG',13,'1979-04-06','+12836916711',5,'2024-03-11 07:38:07',NULL,NULL,'2024-03-11 00:38:07','2024-03-11 00:38:07',0,0,'Cognizant',NULL,NULL,NULL),(21,'Kraig','Hagenes','I\'m never sure what I\'m going to do next, when suddenly a White Rabbit blew three blasts on the floor, and a bright brass plate with the time,\' she said these words her foot as far down the middle.',NULL,'odell95@feest.com','kailey93','$2y$12$urRUt4b249ak0zqNH6SLkegI55JKAeZcpUE7fY0FLN3PWaIyY.dgq',12,'1993-10-31','+16159837020',6,'2024-03-11 07:38:08',NULL,NULL,'2024-03-11 00:38:08','2024-03-11 00:38:08',0,0,'Facebook',NULL,NULL,NULL);
/*!40000 ALTER TABLE `re_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories`
--

DROP TABLE IF EXISTS `re_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories`
--

LOCK TABLES `re_categories` WRITE;
/*!40000 ALTER TABLE `re_categories` DISABLE KEYS */;
INSERT INTO `re_categories` VALUES (1,'Apartment','Alice as it could go, and making quite a conversation of it had grown so large a house, that she had read about them in books, and she sat still just as I\'d taken the highest tree in front of them.','published',0,1,'2024-03-11 00:38:00','2024-03-11 00:38:00',0),(2,'Villa','Dinah, and saying to herself in the distance. \'Come on!\' and ran off, thinking while she was quite surprised to see anything; then she remembered trying to fix on one, the cook was busily stirring.','published',0,0,'2024-03-11 00:38:00','2024-03-11 00:38:00',0),(3,'Condo','I suppose?\' said Alice. \'Of course not,\' said the Hatter. He came in sight of the court was in confusion, getting the Dormouse sulkily remarked, \'If you do. I\'ll set Dinah at you!\' There was.','published',0,0,'2024-03-11 00:38:00','2024-03-11 00:38:00',0),(4,'House','It quite makes my forehead ache!\' Alice watched the White Rabbit, with a pair of gloves and a large canvas bag, which tied up at the beginning,\' the King said, for about the crumbs,\' said the.','published',0,0,'2024-03-11 00:38:00','2024-03-11 00:38:00',0),(5,'Land','Alice noticed with some surprise that the way wherever she wanted to send the hedgehog to, and, as the White Rabbit, \'but it doesn\'t mind.\' The table was a little startled when she went on eagerly.','published',0,0,'2024-03-11 00:38:00','2024-03-11 00:38:00',0),(6,'Commercial property','Alice thought to herself. (Alice had no very clear notion how delightful it will be When they take us up and to hear his history. I must be the best of educations--in fact, we went to school in the.','published',0,0,'2024-03-11 00:38:00','2024-03-11 00:38:00',0);
/*!40000 ALTER TABLE `re_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories_translations`
--

DROP TABLE IF EXISTS `re_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_categories_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories_translations`
--

LOCK TABLES `re_categories_translations` WRITE;
/*!40000 ALTER TABLE `re_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consults`
--

DROP TABLE IF EXISTS `re_consults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consults` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `property_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consults`
--

LOCK TABLES `re_consults` WRITE;
/*!40000 ALTER TABLE `re_consults` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_coupons`
--

DROP TABLE IF EXISTS `re_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_coupons`
--

LOCK TABLES `re_coupons` WRITE;
/*!40000 ALTER TABLE `re_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_currencies`
--

DROP TABLE IF EXISTS `re_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_currencies`
--

LOCK TABLES `re_currencies` WRITE;
/*!40000 ALTER TABLE `re_currencies` DISABLE KEYS */;
INSERT INTO `re_currencies` VALUES (1,'USD','$',1,0,0,1,1,'2024-03-11 00:38:00','2024-03-11 00:38:00'),(2,'EUR','€',0,2,1,0,0.84,'2024-03-11 00:38:00','2024-03-11 00:38:00'),(3,'VND','₫',0,0,1,0,23203,'2024-03-11 00:38:00','2024-03-11 00:38:00');
/*!40000 ALTER TABLE `re_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options`
--

DROP TABLE IF EXISTS `re_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_options`
--

LOCK TABLES `re_custom_field_options` WRITE;
/*!40000 ALTER TABLE `re_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options_translations`
--

DROP TABLE IF EXISTS `re_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_options_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_options_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_options_translations`
--

LOCK TABLES `re_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_values`
--

DROP TABLE IF EXISTS `re_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `custom_field_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_values`
--

LOCK TABLES `re_custom_field_values` WRITE;
/*!40000 ALTER TABLE `re_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_values_translations`
--

DROP TABLE IF EXISTS `re_custom_field_values_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_values_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_values_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_values_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_values_translations`
--

LOCK TABLES `re_custom_field_values_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_field_values_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_values_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_fields`
--

DROP TABLE IF EXISTS `re_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorable_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_fields`
--

LOCK TABLES `re_custom_fields` WRITE;
/*!40000 ALTER TABLE `re_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_fields_translations`
--

DROP TABLE IF EXISTS `re_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_fields_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_fields_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_fields_translations`
--

LOCK TABLES `re_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities`
--

DROP TABLE IF EXISTS `re_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities`
--

LOCK TABLES `re_facilities` WRITE;
/*!40000 ALTER TABLE `re_facilities` DISABLE KEYS */;
INSERT INTO `re_facilities` VALUES (1,'Hospital','mdi mdi-hospital','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(2,'Super Market','mdi mdi-cart-plus','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(3,'School','mdi mdi-school','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(4,'Entertainment','mdi mdi-bed-outline','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(5,'Pharmacy','mdi mdi-mortar-pestle-plus','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(6,'Airport','mdi mdi-airplane-takeoff','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(7,'Railways','mdi mdi-subway','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(8,'Bus Stop','mdi mdi-bus','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(9,'Beach','mdi mdi-beach','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(10,'Mall','mdi mdi-shopping','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(11,'Bank','mdi mdi-bank-check','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(12,'Fitness','mdi mdi-weight-lifter','published','2024-03-11 00:38:08','2024-03-11 00:38:08');
/*!40000 ALTER TABLE `re_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_distances`
--

DROP TABLE IF EXISTS `re_facilities_distances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities_distances` (
  `facility_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`facility_id`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_distances`
--

LOCK TABLES `re_facilities_distances` WRITE;
/*!40000 ALTER TABLE `re_facilities_distances` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_facilities_distances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_translations`
--

DROP TABLE IF EXISTS `re_facilities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_facilities_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_facilities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_translations`
--

LOCK TABLES `re_facilities_translations` WRITE;
/*!40000 ALTER TABLE `re_facilities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_facilities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_features`
--

DROP TABLE IF EXISTS `re_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_features`
--

LOCK TABLES `re_features` WRITE;
/*!40000 ALTER TABLE `re_features` DISABLE KEYS */;
INSERT INTO `re_features` VALUES (1,'Wifi',NULL,'published'),(2,'Parking',NULL,'published'),(3,'Swimming pool',NULL,'published'),(4,'Balcony',NULL,'published'),(5,'Garden',NULL,'published'),(6,'Security',NULL,'published'),(7,'Fitness center',NULL,'published'),(8,'Air Conditioning',NULL,'published'),(9,'Central Heating  ',NULL,'published'),(10,'Laundry Room',NULL,'published'),(11,'Pets Allow',NULL,'published'),(12,'Spa &amp; Massage',NULL,'published');
/*!40000 ALTER TABLE `re_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_features_translations`
--

DROP TABLE IF EXISTS `re_features_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_features_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_features_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_features_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_features_translations`
--

LOCK TABLES `re_features_translations` WRITE;
/*!40000 ALTER TABLE `re_features_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_features_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_investors`
--

DROP TABLE IF EXISTS `re_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_investors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_investors`
--

LOCK TABLES `re_investors` WRITE;
/*!40000 ALTER TABLE `re_investors` DISABLE KEYS */;
INSERT INTO `re_investors` VALUES (1,'National Pension Service','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(2,'Generali','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(3,'Temasek','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(4,'China Investment Corporation','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(5,'Government Pension Fund Global','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(6,'PSP Investments','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(7,'MEAG Munich ERGO','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(8,'HOOPP','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(9,'BT Group','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(10,'New York City ERS','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(11,'New Jersey Division of Investment','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(12,'State Super','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(13,'Shinkong','published','2024-03-11 00:38:08','2024-03-11 00:38:08'),(14,'Rest Super','published','2024-03-11 00:38:08','2024-03-11 00:38:08');
/*!40000 ALTER TABLE `re_investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_investors_translations`
--

DROP TABLE IF EXISTS `re_investors_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_investors_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_investors_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_investors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_investors_translations`
--

LOCK TABLES `re_investors_translations` WRITE;
/*!40000 ALTER TABLE `re_investors_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_investors_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_invoice_items`
--

DROP TABLE IF EXISTS `re_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_invoice_items`
--

LOCK TABLES `re_invoice_items` WRITE;
/*!40000 ALTER TABLE `re_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_invoices`
--

DROP TABLE IF EXISTS `re_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_invoices_code_unique` (`code`),
  KEY `re_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `re_invoices_payment_id_index` (`payment_id`),
  KEY `re_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_invoices`
--

LOCK TABLES `re_invoices` WRITE;
/*!40000 ALTER TABLE `re_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages`
--

DROP TABLE IF EXISTS `re_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `percent_save` int unsigned NOT NULL DEFAULT '0',
  `number_of_listings` int unsigned NOT NULL,
  `account_limit` int unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_packages`
--

LOCK TABLES `re_packages` WRITE;
/*!40000 ALTER TABLE `re_packages` DISABLE KEYS */;
INSERT INTO `re_packages` VALUES (1,'Free First Post',0.00,1,0,1,1,0,0,'published','2024-03-11 00:38:08','2024-03-11 00:38:08',NULL),(2,'Single Post',250.00,1,0,1,NULL,0,1,'published','2024-03-11 00:38:08','2024-03-11 00:38:08',NULL),(3,'5 Posts',1000.00,1,20,5,NULL,0,0,'published','2024-03-11 00:38:08','2024-03-11 00:38:08',NULL);
/*!40000 ALTER TABLE `re_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages_translations`
--

DROP TABLE IF EXISTS `re_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_packages_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_packages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_packages_translations`
--

LOCK TABLES `re_packages_translations` WRITE;
/*!40000 ALTER TABLE `re_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_categories`
--

DROP TABLE IF EXISTS `re_project_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_project_categories` (
  `project_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`project_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_project_categories`
--

LOCK TABLES `re_project_categories` WRITE;
/*!40000 ALTER TABLE `re_project_categories` DISABLE KEYS */;
INSERT INTO `re_project_categories` VALUES (1,2),(1,4),(1,5),(2,6),(3,2),(3,3),(3,5),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,6),(6,1),(6,3),(6,4),(6,6),(7,1),(7,2),(7,4),(7,5),(7,6),(8,5),(9,1),(9,4),(9,5),(9,6),(10,1),(10,2),(10,6),(11,1),(11,2),(11,3),(11,4),(11,5),(12,1),(13,3),(14,2),(14,4),(14,6),(15,1),(15,2),(15,4),(15,5),(16,2),(16,3),(16,5),(16,6),(17,5),(18,1),(18,4),(18,6);
/*!40000 ALTER TABLE `re_project_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_features`
--

DROP TABLE IF EXISTS `re_project_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_project_features` (
  `project_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_project_features`
--

LOCK TABLES `re_project_features` WRITE;
/*!40000 ALTER TABLE `re_project_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_project_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects`
--

DROP TABLE IF EXISTS `re_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `number_block` int DEFAULT NULL,
  `number_floor` smallint DEFAULT NULL,
  `number_flat` smallint DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `date_finish` date DEFAULT NULL,
  `date_sell` date DEFAULT NULL,
  `price_from` decimal(15,0) DEFAULT NULL,
  `price_to` decimal(15,0) DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_projects_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects`
--

LOCK TABLES `re_projects` WRITE;
/*!40000 ALTER TABLE `re_projects` DISABLE KEYS */;
INSERT INTO `re_projects` VALUES (1,'Walnut Park Apartments','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\"]','19118 Stoltenberg Throughway Apt. 947\nNew Meaganport, TX 94199',11,7,26,2852,0,'1974-05-20','1990-01-05',3111,7536,1,1,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','43.042037','-75.288573',3681,6,3,NULL),(2,'Sunshine Wonder Villas','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\"]','84877 Renner Motorway Apt. 102\nJohnsonberg, AR 69397',14,4,1,84,0,'1982-04-14','2012-07-14',7213,12783,1,4,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','43.69406','-76.37364',5423,5,4,NULL),(3,'Diamond Island','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\"]','284 Mark Gateway\nDeantown, MS 78794',11,3,48,4249,1,'1988-04-07','1993-10-28',9687,10777,1,3,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','43.514566','-76.097509',4545,4,4,NULL),(4,'The Nassim','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\"]','18252 Hoppe Overpass Suite 390\nNew Roderickburgh, AL 93753-1419',10,7,38,1346,1,'1988-03-11','1996-12-21',384,3358,1,1,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','43.585175','-75.048377',7840,5,1,NULL),(5,'Vinhomes Grand Park','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\"]','50762 Kautzer Keys Apt. 412\nLexieburgh, SD 00694-3693',4,3,15,3216,1,'2007-04-15','2008-03-08',3013,9292,1,5,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','43.224005','-75.252444',7355,3,4,NULL),(6,'The Metropole Thu Thiem','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/5.jpg\"]','675 Evie Ports\nSchambergermouth, CA 46491',14,8,46,4082,1,'2022-05-22','1977-06-18',5251,14373,1,2,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','42.741498','-76.341381',5653,2,1,NULL),(7,'Villa on Grand Avenue','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\"]','6215 Collier Mountain Suite 907\nFidelside, ND 14986-7597',3,6,15,3784,1,'1997-09-14','2020-08-19',2319,3463,1,5,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','42.861207','-74.867653',9387,3,1,NULL),(8,'Traditional Food Restaurant','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\"]','6500 Wiegand Land Apt. 225\nJarrellburgh, AZ 19278',10,7,16,1924,1,'2001-04-13','1978-05-29',9478,14380,1,1,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','42.948896','-75.238282',7943,2,6,NULL),(9,'Villa on Hollywood Boulevard','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\"]','8617 Santina Square Suite 640\nLamarton, MO 80991-3931',3,4,36,3537,0,'2022-04-29','2018-06-19',4628,7759,1,2,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','42.989667','-75.626886',337,6,6,NULL),(10,'Office Space at Northwest 107th','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\"]','88502 D\'Amore Divide Apt. 708\nEast Beaulah, AK 72901',8,8,28,63,1,'1985-10-20','1982-11-30',8476,13391,1,5,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','43.139136','-76.620837',8692,1,6,NULL),(11,'Home in Merrick Way','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/3.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/7.jpg\"]','39426 Koby Rapid\nOpalhaven, WA 11685-5923',12,6,35,1552,1,'1970-07-28','2007-09-01',1172,2859,1,3,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','42.483227','-75.391162',5953,2,3,NULL),(12,'Adarsh Greens','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/2.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','430 Vandervort Lodge Apt. 268\nSouth Torrance, FL 33739-1359',13,7,26,115,1,'2014-07-24','1997-07-13',2785,5482,1,4,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','43.285084','-75.299455',9974,4,6,NULL),(13,'Rustomjee Evershine Global City','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\"]','313 Marcelina Rue\nArchibaldport, NV 29704-5654',14,5,39,324,1,'1989-05-03','2021-09-08',5700,13026,1,2,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','43.565417','-76.062747',955,5,5,NULL),(14,'Godrej Exquisite','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\"]','14006 Kaleigh Summit\nBoehmhaven, TN 64284',5,2,18,979,0,'2019-05-06','2005-10-18',5232,12087,1,2,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','42.889107','-76.331501',9699,5,4,NULL),(15,'Godrej Prime','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/4.jpg\"]','88603 Kling Union\nStiedemannchester, ME 61924-0854',11,9,24,2432,1,'2016-04-14','1972-10-12',5209,14302,1,1,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','42.815069','-75.146486',1862,3,6,NULL),(16,'PS Panache','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\"]','877 Conor Stravenue\nCarolinefort, IN 56573-1693',5,4,31,3597,1,'1976-03-18','1991-01-13',5120,6236,1,1,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','42.529745','-75.74212',8695,3,4,NULL),(17,'Upturn Atmiya Centria','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\"]','366 Dejon Mountains Apt. 955\nVenashire, ID 16224-9519',8,4,42,700,1,'1979-07-14','2012-02-09',9253,12235,1,4,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','43.204643','-75.508507',142,1,2,NULL),(18,'Brigade Oasis','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\"]','168 Octavia Springs\nBartolettitown, AR 48234',1,7,29,3424,0,'1984-05-30','2006-10-20',564,4498,1,3,'selling',1,'Botble\\ACL\\Models\\User','2024-03-11 00:38:08','2024-03-11 00:38:08','43.195105','-75.895142',8069,4,4,NULL);
/*!40000 ALTER TABLE `re_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects_translations`
--

DROP TABLE IF EXISTS `re_projects_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_projects_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_projects_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_projects_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects_translations`
--

LOCK TABLES `re_projects_translations` WRITE;
/*!40000 ALTER TABLE `re_projects_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_projects_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties`
--

DROP TABLE IF EXISTS `re_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_properties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sale',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `project_id` bigint unsigned DEFAULT '0',
  `number_bedroom` int DEFAULT NULL,
  `number_bathroom` int DEFAULT NULL,
  `number_floor` int DEFAULT NULL,
  `square` double DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `city_id` bigint unsigned DEFAULT NULL,
  `period` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `moderation_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `expire_date` date DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_properties_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties`
--

LOCK TABLES `re_properties` WRITE;
/*!40000 ALTER TABLE `re_properties` DISABLE KEYS */;
INSERT INTO `re_properties` VALUES (1,'3 Beds Villa Calpe, Alicante','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','668 Kuphal Hill\nNoeliamouth, OK 15967','[\"properties\\/11.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\"]',9,7,10,62,90,284800.00,NULL,1,2,'month','renting',8,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.53327','-76.312353',89531,5,5,NULL),(2,'Lavida Plus Office-tel 1 Bedroom','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','97128 Georgianna Estate Apt. 502\nElisabethtown, WV 35350','[\"properties\\/6.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\"]',1,9,5,57,850,186100.00,NULL,0,1,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','42.887186','-75.69806',89981,2,5,NULL),(3,'Vinhomes Grand Park Studio 1 Bedroom','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','562 Brigitte Village Apt. 679\nKundeberg, MD 41531','[\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\"]',17,2,8,38,90,400100.00,NULL,0,2,'month','renting',8,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','42.684632','-75.639523',19349,2,4,NULL),(4,'The Sun Avenue Office-tel 1 Bedroom','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','173 Jaqueline Ramp Suite 446\nVaughnberg, VA 40615-8395','[\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\"]',3,5,3,3,430,140300.00,NULL,0,3,'month','renting',10,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','44.010378','-74.807048',40982,6,3,NULL),(5,'Property For sale, Johannesburg, South Africa','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','5637 Dallin Bypass Apt. 863\nFloridahaven, GA 78540-3690','[\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\"]',18,3,7,57,900,159300.00,NULL,0,5,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.663238','-75.447239',36155,3,4,NULL),(6,'Stunning French Inspired Manor','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','4874 Vickie Harbors Apt. 377\nLueilwitzfurt, IA 85152-9940','[\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\"]',15,3,4,99,950,850200.00,NULL,1,2,'month','selling',7,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','42.608893','-75.912618',93312,2,4,NULL),(7,'Villa for sale at Bermuda Dunes','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','28784 Harber Groves\nJakubowskistad, MD 99894-9452','[\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\"]',18,8,2,16,70,359500.00,NULL,0,4,'month','renting',8,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.449947','-75.853128',86530,2,3,NULL),(8,'Walnut Park Apartment','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','365 Kassulke Manor\nEast Haleighland, ID 81862','[\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\"]',12,1,9,47,1000,779400.00,NULL,0,2,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.235855','-76.023127',24822,3,6,NULL),(9,'5 beds luxury house','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','4808 Jean Stream Apt. 859\nNew Kellenport, NV 25847','[\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\"]',9,3,8,64,580,524700.00,NULL,0,5,'month','selling',13,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.697083','-74.910905',28515,2,1,NULL),(10,'Family Victorian \"View\" Home','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','50833 Gerhold Forks Apt. 097\nWest Augustus, CA 25354-3388','[\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\"]',17,3,5,88,810,597000.00,NULL,0,3,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.28164','-76.455034',25563,4,3,NULL),(11,'Osaka Heights Apartment','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','996 Lavinia Square\nBergstrommouth, AL 37203-2501','[\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\"]',14,10,2,23,500,462400.00,NULL,0,1,'month','renting',17,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','42.960285','-76.220353',81323,2,5,NULL),(12,'Private Estate Magnificent Views','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','23810 Esperanza Key Suite 812\nPort Joaquinport, CA 40456','[\"properties\\/3.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\"]',11,10,3,48,530,899100.00,NULL,1,2,'month','selling',21,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','42.625859','-74.784012',49093,4,5,NULL),(13,'Thompson Road House for rent','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','5570 Treutel Street Suite 574\nEast Rosella, NC 17988','[\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\"]',10,8,4,37,640,113300.00,NULL,0,1,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','42.74227','-76.655836',66477,4,6,NULL),(14,'Brand New 1 Bedroom Apartment In First Class Location','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','8100 Murazik Expressway Apt. 885\nRodriguezfurt, AL 88602','[\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\"]',6,7,1,42,410,891700.00,NULL,1,3,'month','selling',16,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.656695','-76.534357',73160,6,5,NULL),(15,'Elegant family home presents premium modern living','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','688 Alene Ford\nSouth Magalichester, AR 24395','[\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\"]',15,8,1,34,870,528600.00,NULL,1,2,'month','renting',9,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.235257','-74.888113',90804,4,6,NULL),(16,'Luxury Apartments in Singapore for Sale','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','2767 Karen Hills Apt. 635\nWest Ottilie, OH 87476','[\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\"]',10,8,5,75,590,404300.00,NULL,0,2,'month','renting',20,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.456939','-76.478686',24539,3,3,NULL),(17,'5 room luxury penthouse for sale in Kuala Lumpur','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','939 Rosina Estate\nLake Lilyan, OR 09075-2031','[\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\"]',7,10,8,17,710,397800.00,NULL,0,4,'month','selling',20,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','42.611427','-74.839231',1803,2,1,NULL),(18,'2 Floor house in Compound Pejaten Barat Kemang','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','467 Alexandria Islands Apt. 207\nWest Kenyonborough, ND 13592-0557','[\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\"]',9,9,7,84,780,754700.00,NULL,0,3,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','42.663753','-75.373588',12993,1,6,NULL),(19,'Apartment Muiderstraatweg in Diemen','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','11746 Beier Trail\nEast Alysha, AL 32250-4275','[\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\"]',10,9,7,13,10,202900.00,NULL,0,4,'month','renting',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.75478','-75.02923',27699,1,2,NULL),(20,'Nice Apartment for rent in Berlin','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','142 Powlowski Circle\nMonahanland, MT 77809-0661','[\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\"]',2,4,2,43,480,803500.00,NULL,0,1,'month','selling',20,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.310097','-75.441441',9899,6,2,NULL),(21,'Pumpkin Key - Private Island','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','275 Carson Rapids\nJamarview, TN 75873-4380','[\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\"]',18,10,2,20,410,477900.00,NULL,1,1,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-03-11 00:38:08','2024-03-11 00:38:08','43.392934','-75.413812',37166,3,5,NULL);
/*!40000 ALTER TABLE `re_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties_translations`
--

DROP TABLE IF EXISTS `re_properties_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_properties_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_properties_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_properties_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties_translations`
--

LOCK TABLES `re_properties_translations` WRITE;
/*!40000 ALTER TABLE `re_properties_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_properties_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_categories`
--

DROP TABLE IF EXISTS `re_property_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_property_categories` (
  `property_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`property_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_categories`
--

LOCK TABLES `re_property_categories` WRITE;
/*!40000 ALTER TABLE `re_property_categories` DISABLE KEYS */;
INSERT INTO `re_property_categories` VALUES (1,1),(1,2),(1,4),(1,6),(2,3),(3,4),(3,6),(4,1),(4,2),(4,3),(4,5),(4,6),(5,1),(5,2),(5,3),(5,4),(5,6),(6,2),(7,1),(7,2),(7,4),(7,6),(8,1),(8,2),(8,4),(8,5),(8,6),(9,1),(9,2),(9,3),(9,5),(9,6),(10,1),(10,3),(11,1),(11,4),(11,5),(12,3),(12,5),(13,1),(13,4),(13,5),(13,6),(14,1),(14,2),(14,3),(14,4),(15,2),(15,3),(15,4),(15,5),(15,6),(16,2),(17,1),(17,5),(17,6),(18,2),(18,3),(18,5),(19,1),(19,2),(19,3),(19,4),(20,1),(21,2),(21,5),(21,6);
/*!40000 ALTER TABLE `re_property_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_features`
--

DROP TABLE IF EXISTS `re_property_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_property_features` (
  `property_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_features`
--

LOCK TABLES `re_property_features` WRITE;
/*!40000 ALTER TABLE `re_property_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_property_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_reviews`
--

DROP TABLE IF EXISTS `re_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `reviewable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint unsigned NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_unique` (`account_id`,`reviewable_id`,`reviewable_type`),
  KEY `re_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_reviews`
--

LOCK TABLES `re_reviews` WRITE;
/*!40000 ALTER TABLE `re_reviews` DISABLE KEYS */;
INSERT INTO `re_reviews` VALUES (1,15,'Botble\\RealEstate\\Models\\Property',15,2,'HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, Alice could bear: she got up this morning, but I think it would be like, but it had been. But her sister on the OUTSIDE.\' He unfolded the paper as he spoke.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(2,1,'Botble\\RealEstate\\Models\\Property',6,3,'Alice: \'three inches is such a new.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(3,8,'Botble\\RealEstate\\Models\\Project',14,3,'At last the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little different. But if I\'m Mabel, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice again, in a low, trembling voice. \'There\'s more evidence to come yet, please your Majesty?\' he asked.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(4,1,'Botble\\RealEstate\\Models\\Property',7,4,'There seemed to Alice with one of the jury had a pencil that squeaked. This of course, to begin lessons: you\'d only have to fly; and.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(5,11,'Botble\\RealEstate\\Models\\Property',20,5,'Off with his nose, you know?\' \'It\'s the thing at all. However, \'jury-men\' would have appeared to them to be no use in waiting by the way I want to get to,\' said the Caterpillar. \'Well, perhaps your feelings may.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(6,1,'Botble\\RealEstate\\Models\\Project',6,5,'The Queen\'s argument was, that she began shrinking directly. As soon as she was losing her temper. \'Are you content now?\' said the King. \'Nearly two miles high,\' added the March Hare and the fan, and.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(7,19,'Botble\\RealEstate\\Models\\Property',6,5,'No room!\' they cried out when they liked, and left foot, so as to prevent its undoing itself,) she carried it off. \'If everybody minded their own business,\' the Duchess replied, in a low, hurried tone. He looked at the Caterpillar\'s making.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(8,8,'Botble\\RealEstate\\Models\\Project',15,2,'Rabbit was no longer to be a walrus or.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(9,5,'Botble\\RealEstate\\Models\\Property',2,3,'Mary Ann, and be turned out of it, and very nearly carried it out.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(10,6,'Botble\\RealEstate\\Models\\Property',4,4,'And beat him when he sneezes; For he can thoroughly enjoy The pepper when he pleases!\' CHORUS. \'Wow! wow! wow!\' \'Here! you may SIT down,\' the King was the cat.) \'I hope they\'ll.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(11,15,'Botble\\RealEstate\\Models\\Project',16,2,'Alice. \'Well, I hardly know--No more, thank ye; I\'m.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(12,18,'Botble\\RealEstate\\Models\\Property',9,2,'And in she went. Once more she found to be two people. \'But it\'s no use their putting their heads down! I am very tired of being all alone here!\' As she said these words her foot slipped, and in despair she put her hand on the trumpet, and then the puppy jumped into the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(13,4,'Botble\\RealEstate\\Models\\Property',5,5,'It sounded an excellent opportunity for croqueting one of the Shark, But, when the race was over. Alice was very uncomfortable, and, as the whole she thought to herself. Imagine her surprise, when the White Rabbit, jumping up and walking away. \'You insult me by talking such nonsense!\' \'I.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(14,5,'Botble\\RealEstate\\Models\\Property',15,5,'Mouse, who was talking. Alice could see her after the rest of it at all,\' said Alice: \'--where\'s the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(15,3,'Botble\\RealEstate\\Models\\Property',16,5,'ME,\' said the Queen, but she did not feel encouraged to ask his neighbour to tell its age, there was nothing so VERY wide, but she could guess, she was a.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(16,13,'Botble\\RealEstate\\Models\\Property',15,5,'Dinah my dear! Let this be a very small cake, on which the wretched Hatter trembled so, that Alice had no very clear notion how delightful it will be the use of a good deal worse off than before, as the March.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(17,9,'Botble\\RealEstate\\Models\\Property',18,4,'Alice \'without pictures or conversations?\' So she began shrinking directly. As soon as the March Hare. \'It was much pleasanter at home,\'.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(18,15,'Botble\\RealEstate\\Models\\Project',1,3,'I had to kneel down on one knee. \'I\'m a poor man, your Majesty,\' said the Cat. \'I\'d nearly forgotten that I\'ve got to come upon.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(19,18,'Botble\\RealEstate\\Models\\Project',4,5,'There was certainly not becoming. \'And that\'s the jury, in a day is very confusing.\' \'It isn\'t,\' said the Caterpillar. Alice folded her hands, and she hastily dried her eyes anxiously fixed on.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(20,10,'Botble\\RealEstate\\Models\\Property',19,4,'Duchess said to the jury, who instantly made a snatch in the air. This time there could be no sort of use in saying anything more till the Pigeon in a tone of great curiosity. \'Soles and eels, of course,\' the Mock Turtle with a pair of white kid gloves: she took up the other, trying every.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(21,4,'Botble\\RealEstate\\Models\\Project',9,5,'Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' said Alice, (she had grown so large a house, that she tipped.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(22,18,'Botble\\RealEstate\\Models\\Property',1,1,'Hatter began, in rather a complaining tone, \'and they drew all manner of things--everything that begins with an M, such as.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(24,16,'Botble\\RealEstate\\Models\\Property',5,5,'I will tell you my history, and you\'ll understand why it is.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(25,17,'Botble\\RealEstate\\Models\\Project',8,1,'Alice had got its neck nicely straightened out, and was gone in a voice outside, and stopped to listen. The Fish-Footman began by taking the little creature down, and was.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(26,2,'Botble\\RealEstate\\Models\\Property',15,5,'Alice; \'it\'s laid for a minute or two to think.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(27,13,'Botble\\RealEstate\\Models\\Property',16,4,'ME,\' but nevertheless she uncorked it and put it into his cup of tea, and looked at her for a good thing!\' she said to herself; \'his eyes are so VERY much out of its mouth and yawned once or twice, and shook itself. Then it got down off.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(28,18,'Botble\\RealEstate\\Models\\Property',4,1,'So she set to work, and very soon found an opportunity of.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(29,9,'Botble\\RealEstate\\Models\\Property',10,3,'An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must be a letter, written by the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(30,10,'Botble\\RealEstate\\Models\\Property',1,1,'VERY turn-up nose, much more like a serpent. She had quite forgotten the little golden key and hurried off at once, she found a little way off, panting, with its mouth open, gazing up into a line along.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(31,21,'Botble\\RealEstate\\Models\\Project',4,4,'Mock Turtle, \'Drive on, old fellow!.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(32,6,'Botble\\RealEstate\\Models\\Property',9,5,'Alice the moment she appeared on the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(33,11,'Botble\\RealEstate\\Models\\Property',7,1,'Off with his head!\' or \'Off with his nose Trims his belt and his friends shared their never-ending meal, and the choking of the what?\' said the King: \'leave out that part.\' \'Well, at any rate I\'ll never go.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(34,4,'Botble\\RealEstate\\Models\\Property',21,5,'MINE.\' The Queen turned crimson with fury, and, after glaring at her feet, for it was empty: she did not answer, so Alice ventured to.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(35,20,'Botble\\RealEstate\\Models\\Property',10,4,'CAN all that green stuff be?\' said.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(36,5,'Botble\\RealEstate\\Models\\Project',7,3,'Dormouse fell asleep instantly, and neither of the evening, beautiful Soup! Soup of the Lobster; I heard him declare, \"You have baked me too brown, I must have been a holiday?\' \'Of course not,\' said the Gryphon. \'The reason is,\' said the Pigeon. \'I\'m NOT a serpent, I tell you!\'.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(37,19,'Botble\\RealEstate\\Models\\Property',1,4,'Next came the guests, mostly Kings and Queens, and among them.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(38,9,'Botble\\RealEstate\\Models\\Project',11,4,'Mock Turtle replied in an offended tone, and added with a deep sigh, \'I was a.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(39,6,'Botble\\RealEstate\\Models\\Project',17,4,'There could be NO mistake about it: it was growing, and she felt a little glass box that was linked into hers began to feel very queer indeed:-- \'\'Tis the voice of thunder, and people began running about in all my life, never!\' They had not.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(40,8,'Botble\\RealEstate\\Models\\Project',3,3,'QUITE right, I\'m afraid,\' said Alice, seriously, \'I\'ll have nothing more to be Number One,\' said.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(41,10,'Botble\\RealEstate\\Models\\Project',16,3,'Trims his belt and his friends shared their.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(42,12,'Botble\\RealEstate\\Models\\Project',11,4,'Dormouse, not choosing to notice this last word with such a fall as this, I shall remember it in less than a pig, my dear,\' said Alice, (she had grown in the distance. \'And yet what a long.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(43,14,'Botble\\RealEstate\\Models\\Project',3,1,'Lory, as soon as look at it!\' This.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(44,10,'Botble\\RealEstate\\Models\\Property',12,3,'FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she walked down the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(45,15,'Botble\\RealEstate\\Models\\Project',8,5,'Alice could hear him sighing as if nothing had happened. \'How am I.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(46,14,'Botble\\RealEstate\\Models\\Project',4,1,'Alice had got to do,\' said the Mock Turtle: \'nine the next, and so on.\' \'What a funny watch!\' she remarked. \'It tells the day and night! You see the Queen. \'You make me grow larger, I can.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(47,2,'Botble\\RealEstate\\Models\\Property',8,4,'It was so ordered about in a great letter, nearly as she added, to herself, as usual. I wonder what CAN have happened to you? Tell us all about as it was over at last: \'and I do so like that curious.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(48,16,'Botble\\RealEstate\\Models\\Property',20,5,'Hearts were seated on their slates, when the Rabbit was.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(49,2,'Botble\\RealEstate\\Models\\Project',12,1,'I\'m sure she\'s the best plan.\' It sounded an excellent opportunity for showing off her head!\' Those whom she.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(50,19,'Botble\\RealEstate\\Models\\Property',12,5,'And he got up and down looking for eggs, I know all the same, shedding gallons of tears, but said nothing. \'When we were.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(51,15,'Botble\\RealEstate\\Models\\Project',6,3,'Alice felt so desperate that she ought to have finished,\' said the Caterpillar. Alice folded her hands, and began:-- \'You are all pardoned.\'.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(52,3,'Botble\\RealEstate\\Models\\Project',2,4,'Mouse was speaking, so that altogether, for the moment he was obliged to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it makes me grow large again, for this time the Queen in a Little Bill It was as steady as ever; Yet you balanced an eel on the shingle--will you come to an end! \'I wonder how many.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(53,12,'Botble\\RealEstate\\Models\\Property',6,3,'Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' the King said, with a kind of sob, \'I\'ve tried the effect of lying down on one knee as he came, \'Oh! the Duchess, \'as pigs have to turn into a conversation. \'You don\'t know what.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(54,19,'Botble\\RealEstate\\Models\\Property',11,4,'LESS,\' said the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon in an undertone to the jury, and the turtles all advance! They are waiting on the second verse of the conversation. Alice felt a little shriek.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(55,13,'Botble\\RealEstate\\Models\\Property',17,4,'I get SOMEWHERE,\' Alice added as an unusually large saucepan flew close by it, and behind it, it occurred to her full size by this time, as it spoke (it was Bill, the Lizard).','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(56,10,'Botble\\RealEstate\\Models\\Property',18,5,'However, she did not like to be managed? I suppose Dinah\'ll be sending me on messages next!\' And she kept tossing the baby was.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(57,4,'Botble\\RealEstate\\Models\\Project',16,1,'Mary Ann, and be turned out of the Gryphon, and the White Rabbit was no label this time with great curiosity, and this Alice would not give all else for two Pennyworth only of beautiful Soup? Pennyworth only of beautiful Soup?.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(58,3,'Botble\\RealEstate\\Models\\Property',3,1,'That WILL be a lesson to you to offer it,\' said Alice angrily. \'It wasn\'t very.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(59,1,'Botble\\RealEstate\\Models\\Property',10,4,'Duchess, digging her sharp little chin. \'I\'ve a right to grow up any more HERE.\' \'But then,\'.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(60,10,'Botble\\RealEstate\\Models\\Project',1,2,'Cat went on, \'I must go back by railway,\' she said this, she was coming back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves: she took courage, and went down to her great delight it fitted! Alice opened the door of the accident, all except the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(61,5,'Botble\\RealEstate\\Models\\Project',4,4,'I ask! It\'s always six o\'clock now.\' A bright idea came into her face. \'Very,\' said Alice: \'three inches is such a nice.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(62,4,'Botble\\RealEstate\\Models\\Project',13,3,'Yet you turned a back-somersault in at once.\' And in she went. Once more she.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(64,20,'Botble\\RealEstate\\Models\\Property',8,1,'March Hare, who had been looking at it again: but he would not open any of them. However, on the top of his tail. \'As if it makes me grow larger, I can reach the key; and if the Queen was silent. The Dormouse shook itself, and was going.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(65,2,'Botble\\RealEstate\\Models\\Property',12,4,'Alice had no very clear notion how long ago anything had happened.) So she set to work nibbling at the end.\' \'If.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(66,4,'Botble\\RealEstate\\Models\\Property',19,1,'Alice. \'I\'m glad they don\'t seem to have him with them,\' the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(67,5,'Botble\\RealEstate\\Models\\Project',9,1,'Allow me to introduce it.\' \'I don\'t know the way down one side and then quietly marched off after the birds! Why, she\'ll eat a little scream, half of them--and it belongs to the King, and the Mock Turtle, \'Drive on, old fellow! Don\'t be all day about it!\' Last came a little nervous about it while.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(68,15,'Botble\\RealEstate\\Models\\Property',13,2,'Dormouse went on, \'and most things twinkled after that--only the March Hare. \'Then it ought to be beheaded!\' \'What for?\' said the Mouse, in a rather offended tone, and everybody else. \'Leave off that!\' screamed the Gryphon. \'Turn a somersault in the lock.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(69,9,'Botble\\RealEstate\\Models\\Property',4,3,'No, I\'ve made up my mind about it; if I\'m not myself, you see.\' \'I don\'t know what to uglify is, you ARE a simpleton.\' Alice did not see anything that had fallen into the way to change the subject. \'Ten hours the first sentence in her brother\'s Latin Grammar, \'A mouse--of.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(70,8,'Botble\\RealEstate\\Models\\Property',1,3,'And the Eaglet bent down its head down, and nobody spoke for some time without interrupting it. \'They were learning to draw,\' the Dormouse.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(71,17,'Botble\\RealEstate\\Models\\Project',18,5,'I can\'t quite follow it as to size,\' Alice hastily.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(72,19,'Botble\\RealEstate\\Models\\Property',4,5,'And yet I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, as we needn\'t try to find my way into that lovely garden. I think it was,\' the March Hare went on. Her listeners were.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(73,1,'Botble\\RealEstate\\Models\\Project',11,1,'Caterpillar angrily, rearing itself.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(74,9,'Botble\\RealEstate\\Models\\Project',18,5,'Lory, who at last she spread out her hand, and.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(75,20,'Botble\\RealEstate\\Models\\Project',8,4,'Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was moderate. But the insolence of his pocket, and was surprised to find quite a new pair of white kid gloves in one hand and a bright idea came into Alice\'s head. \'Is that the Queen said to one of the cattle in the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(76,20,'Botble\\RealEstate\\Models\\Property',3,1,'Alice put down the middle, wondering how she was saying, and the reason so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said Alice. \'It must have.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(77,19,'Botble\\RealEstate\\Models\\Project',18,3,'There were doors all round the court and got behind him, and very angrily. \'A knot!\' said Alice, very earnestly. \'I\'ve had nothing else to do, and perhaps after all it might injure the brain; But, now that I\'m doubtful about the reason is--\'.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(78,3,'Botble\\RealEstate\\Models\\Project',14,5,'Hatter went on, very much of a procession,\' thought she, \'if people had all to lie down upon.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(79,11,'Botble\\RealEstate\\Models\\Project',15,3,'At last the Dodo solemnly presented the thimble, saying \'We beg your pardon!\' cried Alice hastily.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(80,4,'Botble\\RealEstate\\Models\\Property',3,1,'Caterpillar. \'Is that all?\' said the Caterpillar called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came flying down upon their faces. There was nothing on it in a confused way, \'Prizes!.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(81,2,'Botble\\RealEstate\\Models\\Project',15,3,'If I or she fell past it. \'Well!\' thought Alice to herself. \'I dare say you never to lose YOUR temper!\' \'Hold your tongue!\' added the Gryphon; and then she had to run back into the jury-box, or they would die. \'The trial cannot proceed,\' said the King said to the door.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(82,3,'Botble\\RealEstate\\Models\\Property',14,1,'See how eagerly the lobsters and the whole party look so grave that she still held the pieces of mushroom in her.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(83,12,'Botble\\RealEstate\\Models\\Property',5,1,'Gryphon; and then added them up, and began to tremble. Alice looked down at once, she found herself safe in a bit.\' \'Perhaps it.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(84,7,'Botble\\RealEstate\\Models\\Project',18,5,'Queen left off, quite out of court! Suppress him! Pinch him! Off with his head!\' or \'Off with her.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(85,7,'Botble\\RealEstate\\Models\\Property',3,3,'Alice could bear: she got into the way out of THIS!\' (Sounds of more energetic remedies--\' \'Speak.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(86,5,'Botble\\RealEstate\\Models\\Property',8,2,'Pray how did you ever eat a bat?\' when suddenly, thump! thump! down she came up to them she heard one of the March Hare: she thought to herself, \'to be going messages for a conversation. \'You don\'t know what they\'re like.\' \'I believe so,\' Alice.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(87,8,'Botble\\RealEstate\\Models\\Property',2,1,'Five! Don\'t go splashing paint over me like that!\' \'I couldn\'t.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(88,16,'Botble\\RealEstate\\Models\\Property',14,5,'Northumbria--\"\' \'Ugh!\' said the Lory. Alice replied thoughtfully. \'They have.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(89,15,'Botble\\RealEstate\\Models\\Project',12,5,'Alice replied, so eagerly.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(90,16,'Botble\\RealEstate\\Models\\Project',10,4,'King hastily said, and went in. The door led right into a graceful zigzag, and was going to do it?\' \'In my.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(91,3,'Botble\\RealEstate\\Models\\Project',18,2,'Why, there\'s hardly enough of it at all; however, she went back to yesterday, because I was a paper label, with the clock. For instance, if you were all shaped like the name: however, it only grinned a little hot tea upon its forehead (the position in which the March Hare said to the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(92,19,'Botble\\RealEstate\\Models\\Project',12,3,'I ask! It\'s always six o\'clock.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(93,6,'Botble\\RealEstate\\Models\\Property',15,3,'BEST butter,\' the March Hare was said to the jury, and the three gardeners at it, and they repeated their arguments to her, one on each side, and opened their eyes and mouths so VERY nearly at the door and found quite a large kitchen, which was full of.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(94,9,'Botble\\RealEstate\\Models\\Property',13,3,'Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said the voice. \'Fetch me my gloves this moment!\' Then came a rumbling of little Alice herself, and nibbled a little animal (she couldn\'t guess of what sort it was) scratching and scrambling about.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(95,6,'Botble\\RealEstate\\Models\\Property',11,4,'Lobster Quadrille?\' the Gryphon replied rather impatiently: \'any shrimp could have told you that.\' \'If I\'d been the whiting,\' said Alice, a little sharp bark just over her head in the world! Oh, my dear Dinah! I wonder.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(96,3,'Botble\\RealEstate\\Models\\Project',7,2,'Off--\' \'Nonsense!\' said Alice, whose thoughts were still running on the floor: in another.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(97,5,'Botble\\RealEstate\\Models\\Property',17,5,'Edwin and Morcar, the earls of.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(98,11,'Botble\\RealEstate\\Models\\Property',15,3,'I suppose, by being drowned in my own tears! That WILL be a person of authority over Alice. \'Stand up and to hear the name of the Lobster Quadrille, that she ought to be patted on.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(99,3,'Botble\\RealEstate\\Models\\Property',1,4,'King, \'or I\'ll have you executed, whether you\'re nervous or not.\' \'I\'m a poor man,\' the Hatter grumbled: \'you shouldn\'t have put it more.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(100,14,'Botble\\RealEstate\\Models\\Property',20,1,'RABBIT\' engraved upon it. She went in without knocking, and hurried upstairs, in great fear lest she should meet the real Mary Ann, and be turned out of the evening, beautiful Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not stoop? Soup of the evening.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(101,2,'Botble\\RealEstate\\Models\\Project',17,5,'Pigeon. \'I can tell you how the game was going on shrinking rapidly: she soon made out that part.\' \'Well, at any rate I\'ll never go THERE again!\' said Alice in a whisper.) \'That would be the use of a candle is blown out, for.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(103,2,'Botble\\RealEstate\\Models\\Property',2,2,'I\'ve had such a wretched height to be.\' \'It is a raven like a serpent. She had quite a large kitchen, which was full of soup. \'There\'s certainly too much frightened to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it all is! I\'ll try if I know is, something comes at me like that!\' He got.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(105,4,'Botble\\RealEstate\\Models\\Project',7,2,'While the Duchess was sitting next to her. \'I wish I could show you our cat Dinah: I think you\'d take a fancy to herself how she would get up and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(106,11,'Botble\\RealEstate\\Models\\Project',14,5,'I wonder what Latitude was, or Longitude either, but thought they were playing the Queen of Hearts, who only bowed and smiled in reply. \'Idiot!\' said the Hatter with a soldier on each side to.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(107,3,'Botble\\RealEstate\\Models\\Project',13,2,'Alice, who always took a great hurry, muttering to itself in a very hopeful tone though), \'I won\'t interrupt again. I dare say you never even.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(109,12,'Botble\\RealEstate\\Models\\Project',13,1,'She did it so yet,\' said the Dormouse. \'Don\'t talk nonsense,\' said Alice desperately.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(111,11,'Botble\\RealEstate\\Models\\Project',2,1,'On various pretexts they all crowded round her head. \'If I eat one of the singers in the sun. (IF you don\'t know what you were all talking.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(112,21,'Botble\\RealEstate\\Models\\Property',16,4,'Cheshire cat,\' said the Gryphon, and, taking Alice by the officers of the bread-and-butter. Just at this moment the King, with an important air, \'are you all ready? This is the same thing a bit!\' said the Cat. \'Do you know that you\'re mad?\' \'To begin with,\' said the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(115,7,'Botble\\RealEstate\\Models\\Project',11,4,'AND WASHING--extra.\"\' \'You couldn\'t have wanted it much,\' said Alice, in a low, hurried tone. He looked at Alice, and she was trying to find my way into that lovely garden. I think you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said with a T!\' said the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(116,17,'Botble\\RealEstate\\Models\\Project',5,4,'Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice began to tremble. Alice looked at it, and kept doubling itself.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(117,11,'Botble\\RealEstate\\Models\\Property',12,4,'And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then her head was so ordered about by mice and rabbits. I almost wish I\'d gone to see if she had not long to doubt, for the next verse.\'.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(118,1,'Botble\\RealEstate\\Models\\Property',21,1,'VERY nearly at the sudden change, but she.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(119,9,'Botble\\RealEstate\\Models\\Property',5,2,'With gently smiling jaws!\' \'I\'m sure I\'m not myself, you see.\' \'I don\'t quite understand you,\' she said, as politely as she could, and soon found herself lying on their slates, and then sat upon it.) \'I\'m glad they don\'t give birthday presents like that!\' By this time she saw in another moment.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(120,14,'Botble\\RealEstate\\Models\\Property',13,4,'Then came a little sharp bark just over her head to hide a smile: some of them say, \'Look out now, Five! Don\'t go splashing paint over me like a frog; and both the hedgehogs were out of THIS!\' (Sounds of more broken.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(121,21,'Botble\\RealEstate\\Models\\Property',12,1,'I can\'t show it you myself,\' the Mock Turtle in a trembling voice to its feet, \'I move that the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(122,4,'Botble\\RealEstate\\Models\\Property',17,3,'Alice thought to herself, \'if one only.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(124,11,'Botble\\RealEstate\\Models\\Project',16,1,'And argued each case with my wife; And the Eaglet bent down its head down, and felt quite strange at first; but she had gone through that day. \'A likely story indeed!\' said Alice.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(125,15,'Botble\\RealEstate\\Models\\Project',2,2,'Oh, my dear Dinah! I wonder what they\'ll do well enough; don\'t be particular--Here, Bill! catch hold of anything, but she got into a chrysalis--you will some day, you know--and then after that into a tree. By the time they were all locked; and when she went nearer to watch them, and just as if.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(126,5,'Botble\\RealEstate\\Models\\Project',10,4,'Conqueror, whose cause was favoured by the little magic bottle had now had its full effect, and she went on in the distance. \'And yet what a wonderful dream it had VERY long claws and a pair.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(127,1,'Botble\\RealEstate\\Models\\Project',15,3,'For instance, suppose it doesn\'t understand English,\' thought Alice; but she could even make out which were the cook, and a piece of it at all; however, she again heard a little different. But if I\'m not myself, you see.\' \'I don\'t even know what it was.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(128,11,'Botble\\RealEstate\\Models\\Project',8,1,'Owl, as a boon, Was kindly permitted to pocket the spoon: While the Owl had the door and went back for a long argument with the bread-knife.\' The March Hare said to herself as.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(129,8,'Botble\\RealEstate\\Models\\Property',14,2,'March Hare said in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the baby, and not to be no use their putting their heads down! I am now? That\'ll be a letter, after all: it\'s a very small cake, on which the wretched Hatter.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(130,13,'Botble\\RealEstate\\Models\\Property',19,4,'Footman went on all the other end of the garden: the roses growing on it except a tiny little thing!\' It did so indeed, and much sooner than she had expected: before she made her feel very queer indeed:-- \'\'Tis the voice of the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(131,1,'Botble\\RealEstate\\Models\\Project',16,3,'Hatter. He came in sight of the jurors had a bone in his throat,\' said the Caterpillar. Alice folded her hands, and she tried to fancy.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(132,20,'Botble\\RealEstate\\Models\\Project',2,4,'Alice, \'a great girl like you,\' (she might well say this), \'to go on in the sea!\' cried the Gryphon. \'They can\'t have anything.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(133,13,'Botble\\RealEstate\\Models\\Project',8,5,'YOU must cross-examine the next moment she felt unhappy. \'It was the first question, you know.\' He was looking for eggs, I know I have to whisper a hint to Time, and round the thistle again.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(134,15,'Botble\\RealEstate\\Models\\Property',4,5,'Gryphon: \'I went to school every day--\' \'I\'VE been to her, still it had gone. \'Well! I\'ve often seen a rabbit with either a waistcoat-pocket, or a watch to take out of its voice. \'Back to land again, and put it more clearly,\' Alice replied very.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(135,15,'Botble\\RealEstate\\Models\\Property',11,2,'Alice was very deep, or she should push the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an honest man.\' There was no label this time she found a little bottle that stood near the door as you say pig, or fig?\' said the Rabbit in a Little Bill It was.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(136,4,'Botble\\RealEstate\\Models\\Property',8,1,'First, she dreamed of little Alice and all would change to tinkling sheep-bells, and the Panther received knife and fork with a trumpet in one hand, and made a dreadfully ugly child: but it had lost something; and she dropped it hastily, just in time to see if.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(138,9,'Botble\\RealEstate\\Models\\Project',2,5,'Alice had been (Before she had accidentally upset the milk-jug into his plate. Alice did not get hold of it; then Alice put down the little creature down, and nobody.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(139,13,'Botble\\RealEstate\\Models\\Project',3,3,'Alice (she was rather glad there WAS no one to listen to her, so she waited. The Gryphon lifted up both its paws in surprise. \'What! Never heard of \"Uglification,\"\' Alice ventured to say. \'What is his.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(140,20,'Botble\\RealEstate\\Models\\Project',16,5,'Queen said to herself, \'the way all the players, except the Lizard, who seemed to Alice severely. \'What are you getting on now, my dear?\' it continued, turning to Alice, that she wanted to send the hedgehog.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(141,4,'Botble\\RealEstate\\Models\\Project',6,3,'Caterpillar. This was such a tiny little thing!\' It did so indeed, and much sooner than she had wept when she turned to the Queen. \'Their heads are gone, if it likes.\' \'I\'d rather finish my tea,\' said the Gryphon: and it was very hot, she kept on good terms with him, he\'d do.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(142,4,'Botble\\RealEstate\\Models\\Project',1,1,'Alice hastily replied; \'at least--at least I mean what I eat\" is the driest thing I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes--and still as she passed; it was impossible to say it over) \'--yes, that\'s about the twentieth.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(143,13,'Botble\\RealEstate\\Models\\Property',13,2,'Alice took up the little door into that lovely garden. First, however, she waited patiently. \'Once,\' said the King. On this the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(144,10,'Botble\\RealEstate\\Models\\Project',15,4,'I!\' he replied. \'We quarrelled last March--just before HE.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(145,2,'Botble\\RealEstate\\Models\\Project',13,1,'I didn\'t know that cats COULD grin.\' \'They all can,\' said the King in a tone of great dismay, and began whistling. \'Oh, there\'s no use now,\' thought poor Alice, \'it would be worth the trouble of getting her hands on her toes when they passed too close, and.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(146,16,'Botble\\RealEstate\\Models\\Project',14,5,'I grow at a king,\' said Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon went on, looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall sit here,\' the Footman continued in the after-time, be.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(147,5,'Botble\\RealEstate\\Models\\Property',4,3,'Paris, and Paris is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must go and get in at all?\' said the Hatter. \'You MUST remember,\' remarked the King, \'and don\'t be nervous, or I\'ll kick you down stairs!\' \'That is not said right,\' said the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(148,21,'Botble\\RealEstate\\Models\\Property',11,4,'Alice. \'I don\'t know of any one; so, when the Rabbit hastily interrupted. \'There\'s a great interest in.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(149,9,'Botble\\RealEstate\\Models\\Project',1,2,'There was nothing so VERY nearly at the end of the hall: in fact she was beginning to see anything; then she walked on in the air. She did it at all. \'But perhaps he can\'t help it,\' said the Footman, and began an account of the Lizard\'s.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(150,7,'Botble\\RealEstate\\Models\\Project',16,5,'The Caterpillar and Alice heard the King said to herself, (not in a low, trembling voice. \'There\'s more evidence to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(151,2,'Botble\\RealEstate\\Models\\Project',6,1,'Let me see: that would be worth the trouble of.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(153,1,'Botble\\RealEstate\\Models\\Project',4,5,'I eat or drink under the sea,\' the Gryphon at the bottom of a feather flock together.\"\' \'Only mustard isn\'t.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(154,5,'Botble\\RealEstate\\Models\\Project',8,1,'NEVER come to the company generally, \'You are all pardoned.\' \'Come, THAT\'S a good many voices all talking together: she made her draw back in their proper places--ALL,\' he repeated with great curiosity, and this Alice thought she might as well look and see after some.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(155,13,'Botble\\RealEstate\\Models\\Property',7,1,'MORE than nothing.\' \'Nobody asked.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(156,12,'Botble\\RealEstate\\Models\\Property',2,3,'Alice said nothing; she had been all the children she knew.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(157,13,'Botble\\RealEstate\\Models\\Property',4,4,'Alice replied thoughtfully. \'They have their tails in their proper places--ALL,\' he repeated with great curiosity, and this Alice thought she might as well as I get it home?\' when it had lost.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(158,12,'Botble\\RealEstate\\Models\\Project',12,5,'I\'ve offended it again!\' For the Mouse was bristling all over, and she had but to get through was more and more puzzled, but she did not wish to offend the Dormouse again, so she went on, without attending to.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(159,18,'Botble\\RealEstate\\Models\\Project',18,4,'White Rabbit blew three blasts on the slate. \'Herald, read the accusation!\' said the King, who had got to come yet.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(161,7,'Botble\\RealEstate\\Models\\Property',12,5,'However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the use of this rope--Will the roof off.\' After a while she remembered how small she was a little worried. \'Just about as.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(162,5,'Botble\\RealEstate\\Models\\Project',5,2,'Bill,\' thought Alice,) \'Well, I hardly know--No.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(163,4,'Botble\\RealEstate\\Models\\Project',17,3,'English!\' said the Caterpillar, just as she went on, turning to the porpoise, \"Keep back, please: we don\'t want to go! Let me think: was I the same thing a bit!\' said the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(165,16,'Botble\\RealEstate\\Models\\Property',15,4,'OUTSIDE.\' He unfolded the paper as he fumbled over the jury-box with the Queen, the royal children, and make THEIR.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(166,3,'Botble\\RealEstate\\Models\\Project',5,3,'I almost think I must sugar my hair.\" As a duck with its eyelids, so he did,\' said the Gryphon, and the Mock Turtle a little.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(168,12,'Botble\\RealEstate\\Models\\Project',1,5,'I am so VERY tired of this. I vote the young man said, \'And your hair has become very white; And yet I wish I hadn\'t cried so much!\' Alas! it was too.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(169,6,'Botble\\RealEstate\\Models\\Project',13,3,'What WILL become of it; so, after hunting all about it!\' Last.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(171,21,'Botble\\RealEstate\\Models\\Project',13,4,'You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head with great curiosity. \'It\'s a Cheshire cat,\' said the Hatter: \'but you.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(173,10,'Botble\\RealEstate\\Models\\Property',16,2,'Alice, she went on growing, and, as there was silence for some way, and the second time round, she came in with the other bit. Her chin was pressed hard.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(174,12,'Botble\\RealEstate\\Models\\Property',16,4,'So you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the door between us. For instance, suppose it were nine o\'clock in the kitchen that did not appear, and after a minute or.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(175,2,'Botble\\RealEstate\\Models\\Property',20,1,'Dodo replied very politely, feeling quite pleased to find quite a conversation of it altogether; but after a pause: \'the reason is, that there\'s any one left alive!\' She was close behind us, and he\'s treading.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(177,6,'Botble\\RealEstate\\Models\\Property',7,3,'THAT is--\"Take care of the baby?\' said the Cat, \'if you only kept on good terms with him, he\'d do almost anything you liked with the bones and the Panther were sharing a pie--\' [later editions continued as follows When the sands are all pardoned.\'.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(178,20,'Botble\\RealEstate\\Models\\Project',1,3,'I wonder what Latitude or Longitude.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(179,16,'Botble\\RealEstate\\Models\\Project',18,5,'She stretched herself up closer to Alice\'s side as she listened, or seemed to follow, except a.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(180,19,'Botble\\RealEstate\\Models\\Project',2,4,'Alice called after it; and as it can\'t possibly make me.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(182,2,'Botble\\RealEstate\\Models\\Property',5,4,'I\'m not myself, you see.\' \'I don\'t see how he.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(185,21,'Botble\\RealEstate\\Models\\Property',17,4,'Queen ordering off her knowledge, as there seemed to have the experiment tried. \'Very true,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he spoke, and then nodded. \'It\'s no business there, at any.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(186,15,'Botble\\RealEstate\\Models\\Property',21,5,'Duck. \'Found IT,\' the Mouse was swimming away from him, and said anxiously to herself, for she was ready to sink into the.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(188,11,'Botble\\RealEstate\\Models\\Property',21,2,'Jack-in-the-box, and up the fan and a large caterpillar, that was linked into hers began to cry again, for she had to sing \"Twinkle, twinkle, little bat! How I wonder if I shall have to fly; and the words \'DRINK ME\' beautifully printed on it (as she had plenty of time as she leant against a.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(189,5,'Botble\\RealEstate\\Models\\Project',1,4,'King said to herself, \'it would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(190,17,'Botble\\RealEstate\\Models\\Project',12,1,'I hadn\'t begun my tea--not above a week or so--and what with the grin, which remained some time without interrupting it. \'They must go and live in that soup!\' Alice said very politely, \'if I had our.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(191,2,'Botble\\RealEstate\\Models\\Property',13,3,'Mock Turtle: \'why, if a dish or kettle had been.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(194,6,'Botble\\RealEstate\\Models\\Project',5,1,'I give you fair warning,\' shouted the Gryphon.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(196,7,'Botble\\RealEstate\\Models\\Project',1,5,'I get\" is the same words as before, \'It\'s all about as curious as it was over at last, and they repeated their arguments to her, And mentioned me to introduce it.\' \'I don\'t quite understand you,\' she said, \'than waste it in large letters. It was the Cat said, waving its right.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(197,19,'Botble\\RealEstate\\Models\\Project',17,4,'French lesson-book. The Mouse did not quite know what \"it\" means well enough, when I learn music.\' \'Ah! that accounts for it,\' said the young man said, \'And your hair has become very white; And yet I don\'t care which happens!\'.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(198,3,'Botble\\RealEstate\\Models\\Property',5,3,'Some of the earth. At last the Dodo suddenly called out in a solemn tone, \'For the Duchess.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(199,3,'Botble\\RealEstate\\Models\\Property',15,2,'Alice, rather alarmed at the sudden change, but very glad to do THAT in a soothing tone: \'don\'t be angry about it. And yet I don\'t believe you.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08'),(200,20,'Botble\\RealEstate\\Models\\Project',3,1,'Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse looked at the place of the table, half hoping she might as well as she was saying, and the sound of many footsteps, and Alice was very fond of pretending to be trampled under its feet, ran round the table.','approved','2024-03-11 00:38:08','2024-03-11 00:38:08');
/*!40000 ALTER TABLE `re_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"extensions.index\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"plugins.captcha\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"plugins.real-estate\":true,\"real-estate.settings\":true,\"property.index\":true,\"property.create\":true,\"property.edit\":true,\"property.destroy\":true,\"project.index\":true,\"project.create\":true,\"project.edit\":true,\"project.destroy\":true,\"property_feature.index\":true,\"property_feature.create\":true,\"property_feature.edit\":true,\"property_feature.destroy\":true,\"investor.index\":true,\"investor.create\":true,\"investor.edit\":true,\"investor.destroy\":true,\"review.index\":true,\"review.create\":true,\"review.edit\":true,\"review.destroy\":true,\"consult.index\":true,\"consult.create\":true,\"consult.edit\":true,\"consult.destroy\":true,\"property_category.index\":true,\"property_category.create\":true,\"property_category.edit\":true,\"property_category.destroy\":true,\"facility.index\":true,\"facility.create\":true,\"facility.edit\":true,\"facility.destroy\":true,\"account.index\":true,\"account.create\":true,\"account.edit\":true,\"account.destroy\":true,\"package.index\":true,\"package.create\":true,\"package.edit\":true,\"package.destroy\":true,\"consults.index\":true,\"consults.edit\":true,\"consults.destroy\":true,\"real-estate.custom-fields.index\":true,\"real-estate.custom-fields.create\":true,\"real-estate.custom-fields.edit\":true,\"real-estate.custom-fields.destroy\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"invoice.template\":true,\"import-properties.index\":true,\"export-properties.index\":true,\"import-projects.index\":true,\"export-projects.index\":true,\"coupons.index\":true,\"coupons.destroy\":true,\"real-estate.settings.general\":true,\"real-estate.settings.currencies\":true,\"real-estate.settings.accounts\":true,\"real-estate.settings.invoices\":true,\"real-estate.settings.invoice-template\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}','Admin users role',1,1,1,'2024-03-11 00:38:00','2024-03-11 00:38:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2024-03-11 00:38:00'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"faq\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"real-estate\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\"]',NULL,'2024-03-11 00:38:00'),(6,'language_hide_default','1',NULL,'2024-03-11 00:38:00'),(7,'language_switcher_display','dropdown',NULL,'2024-03-11 00:38:00'),(8,'language_display','all',NULL,'2024-03-11 00:38:00'),(9,'language_hide_languages','[]',NULL,'2024-03-11 00:38:00'),(10,'media_random_hash','4fc2951f1859d79b37be03566be70a10',NULL,NULL),(11,'theme','hously',NULL,NULL),(12,'show_admin_bar','1',NULL,NULL),(15,'permalink-botble-blog-models-post','news',NULL,NULL),(16,'permalink-botble-blog-models-category','news',NULL,NULL),(17,'payment_cod_status','1',NULL,NULL),(18,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(19,'payment_bank_transfer_status','1',NULL,NULL),(20,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,NULL),(21,'payment_stripe_payment_type','stripe_checkout',NULL,NULL),(22,'admin_logo','general/logo-light.png',NULL,NULL),(23,'admin_favicon','general/favicon.png',NULL,NULL),(25,'cookie_consent_message','Your experience on this site will be improved by allowing cookies',NULL,NULL),(26,'cookie_consent_learn_more_url','https://hously.test/cookie-policy',NULL,NULL),(27,'cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(28,'real_estate_enable_review_feature','1',NULL,NULL),(29,'real_estate_reviews_per_page','10',NULL,NULL),(30,'theme-hously-site_title','Hously',NULL,NULL),(31,'theme-hously-seo_title','Find your favorite homes at Hously',NULL,NULL),(32,'theme-hously-site_description','A great platform to buy, sell and rent your properties without any agent or commissions.',NULL,NULL),(33,'theme-hously-seo_description','A great platform to buy, sell and rent your properties without any agent or commissions.',NULL,NULL),(34,'theme-hously-copyright','© 2024 Archi Elite JSC. All right reserved.',NULL,NULL),(35,'theme-hously-favicon','general/favicon.png',NULL,NULL),(36,'theme-hously-logo','general/logo-light.png',NULL,NULL),(37,'theme-hously-logo_dark','general/logo-dark.png',NULL,NULL),(38,'theme-hously-404_page_image','general/error.png',NULL,NULL),(39,'theme-hously-primary_font','League Spartan',NULL,NULL),(40,'theme-hously-primary_color','#16a34a',NULL,NULL),(41,'theme-hously-secondary_color','#15803D',NULL,NULL),(42,'theme-hously-homepage_id','1',NULL,NULL),(43,'theme-hously-authentication_enable_snowfall_effect','1',NULL,NULL),(44,'theme-hously-authentication_background_image','backgrounds/01.jpg',NULL,NULL),(45,'theme-hously-categories_background_image','backgrounds/01.jpg',NULL,NULL),(46,'theme-hously-logo_authentication_page','general/logo-authentication-page.png',NULL,NULL),(47,'theme-hously-default_page_cover_image','backgrounds/01.jpg',NULL,NULL),(48,'theme-hously-projects_list_page_id','5',NULL,NULL),(49,'theme-hously-properties_list_page_id','6',NULL,NULL),(50,'theme-hously-blog_page_id','14',NULL,NULL),(51,'theme-hously-projects_list_layout','grid',NULL,NULL),(52,'theme-hously-properties_list_layout','grid',NULL,NULL),(53,'theme-hously-number_of_related_properties','6',NULL,NULL),(54,'theme-hously-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-facebook\"},{\"key\":\"social-url\",\"value\":\"#\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-instagram\"},{\"key\":\"social-url\",\"value\":\"#\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-twitter\"},{\"key\":\"social-url\",\"value\":\"#\"}],[{\"key\":\"social-name\",\"value\":\"LinkedIn\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-linkedin\"},{\"key\":\"social-url\",\"value\":\"#\"}]]',NULL,NULL),(55,'theme-hously-enabled_toggle_theme_mode','1',NULL,NULL),(56,'theme-hously-default_theme_mode','system',NULL,NULL),(57,'theme-hously-show_whatsapp_button_on_consult_form','1',NULL,NULL),(58,'theme-hously-vi-primary_font','Roboto',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2024-03-11 00:38:00','2024-03-11 00:38:00'),(2,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2024-03-11 00:38:00','2024-03-11 00:38:00'),(3,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2024-03-11 00:38:00','2024-03-11 00:38:00'),(4,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2024-03-11 00:38:00','2024-03-11 00:38:00'),(5,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2024-03-11 00:38:00','2024-03-11 00:38:00'),(6,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2024-03-11 00:38:00','2024-03-11 00:38:00'),(7,'home-one',1,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:00','2024-03-11 00:38:00'),(8,'home-two',2,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:00','2024-03-11 00:38:00'),(9,'home-three',3,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:00','2024-03-11 00:38:00'),(10,'home-four',4,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:00','2024-03-11 00:38:00'),(11,'projects',5,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:00','2024-03-11 00:38:00'),(12,'properties',6,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:00','2024-03-11 00:38:00'),(13,'about-us',7,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:00','2024-03-11 00:38:00'),(14,'features',8,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:00','2024-03-11 00:38:00'),(15,'pricing-plans',9,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:00','2024-03-11 00:38:00'),(16,'frequently-asked-questions',10,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:01','2024-03-11 00:38:01'),(17,'terms-of-services',11,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:01','2024-03-11 00:38:01'),(18,'privacy-policy',12,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:01','2024-03-11 00:38:01'),(19,'coming-soon',13,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:01','2024-03-11 00:38:01'),(20,'news',14,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:01','2024-03-11 00:38:01'),(21,'contact',15,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:01','2024-03-11 00:38:01'),(22,'wishlist',16,'Botble\\Page\\Models\\Page','','2024-03-11 00:38:01','2024-03-11 00:38:01'),(23,'design',1,'Botble\\Blog\\Models\\Category','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(24,'lifestyle',2,'Botble\\Blog\\Models\\Category','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(25,'travel-tips',3,'Botble\\Blog\\Models\\Category','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(26,'healthy',4,'Botble\\Blog\\Models\\Category','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(27,'travel-tips',5,'Botble\\Blog\\Models\\Category','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(28,'hotel',6,'Botble\\Blog\\Models\\Category','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(29,'nature',7,'Botble\\Blog\\Models\\Category','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(30,'new',1,'Botble\\Blog\\Models\\Tag','tag','2024-03-11 00:38:01','2024-03-11 00:38:01'),(31,'event',2,'Botble\\Blog\\Models\\Tag','tag','2024-03-11 00:38:01','2024-03-11 00:38:01'),(32,'villa',3,'Botble\\Blog\\Models\\Tag','tag','2024-03-11 00:38:01','2024-03-11 00:38:01'),(33,'apartment',4,'Botble\\Blog\\Models\\Tag','tag','2024-03-11 00:38:01','2024-03-11 00:38:01'),(34,'condo',5,'Botble\\Blog\\Models\\Tag','tag','2024-03-11 00:38:01','2024-03-11 00:38:01'),(35,'luxury-villa',6,'Botble\\Blog\\Models\\Tag','tag','2024-03-11 00:38:01','2024-03-11 00:38:01'),(36,'family-home',7,'Botble\\Blog\\Models\\Tag','tag','2024-03-11 00:38:01','2024-03-11 00:38:01'),(37,'the-top-2020-handbag-trends-to-know',1,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(38,'top-search-engine-optimization-strategies',2,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(39,'which-company-would-you-choose',3,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(40,'used-car-dealer-sales-tricks-exposed',4,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(41,'20-ways-to-sell-your-product-faster',5,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(42,'the-secrets-of-rich-and-famous-writers',6,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(43,'imagine-losing-20-pounds-in-14-days',7,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(44,'are-you-still-using-that-slow-old-typewriter',8,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(45,'a-skin-cream-thats-proven-to-work',9,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(46,'10-reasons-to-start-your-own-profitable-website',10,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(47,'simple-ways-to-reduce-your-unwanted-wrinkles',11,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(48,'apple-imac-with-retina-5k-display-review',12,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(49,'10000-web-site-visitors-in-one-monthguaranteed',13,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(50,'unlock-the-secrets-of-selling-high-ticket-items',14,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(51,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',15,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(52,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',16,'Botble\\Blog\\Models\\Post','news','2024-03-11 00:38:01','2024-03-11 00:38:01'),(53,'walnut-park-apartments',1,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(54,'sunshine-wonder-villas',2,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(55,'diamond-island',3,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(56,'the-nassim',4,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(57,'vinhomes-grand-park',5,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(58,'the-metropole-thu-thiem',6,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(59,'villa-on-grand-avenue',7,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(60,'traditional-food-restaurant',8,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(61,'villa-on-hollywood-boulevard',9,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(62,'office-space-at-northwest-107th',10,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(63,'home-in-merrick-way',11,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(64,'adarsh-greens',12,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(65,'rustomjee-evershine-global-city',13,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(66,'godrej-exquisite',14,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(67,'godrej-prime',15,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(68,'ps-panache',16,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(69,'upturn-atmiya-centria',17,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(70,'brigade-oasis',18,'Botble\\RealEstate\\Models\\Project','projects','2024-03-11 00:38:08','2024-03-11 00:38:08'),(71,'3-beds-villa-calpe-alicante',1,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(72,'lavida-plus-office-tel-1-bedroom',2,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(73,'vinhomes-grand-park-studio-1-bedroom',3,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(74,'the-sun-avenue-office-tel-1-bedroom',4,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(75,'property-for-sale-johannesburg-south-africa',5,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(76,'stunning-french-inspired-manor',6,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(77,'villa-for-sale-at-bermuda-dunes',7,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(78,'walnut-park-apartment',8,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(79,'5-beds-luxury-house',9,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(80,'family-victorian-view-home',10,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(81,'osaka-heights-apartment',11,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(82,'private-estate-magnificent-views',12,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(83,'thompson-road-house-for-rent',13,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(84,'brand-new-1-bedroom-apartment-in-first-class-location',14,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(85,'elegant-family-home-presents-premium-modern-living',15,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(86,'luxury-apartments-in-singapore-for-sale',16,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(87,'5-room-luxury-penthouse-for-sale-in-kuala-lumpur',17,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(88,'2-floor-house-in-compound-pejaten-barat-kemang',18,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(89,'apartment-muiderstraatweg-in-diemen',19,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(90,'nice-apartment-for-rent-in-berlin',20,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(91,'pumpkin-key-private-island',21,'Botble\\RealEstate\\Models\\Property','properties','2024-03-11 00:38:08','2024-03-11 00:38:08'),(92,'doris',1,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(93,'lyda',2,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(94,'terence',3,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(95,'telly',4,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(96,'rey',5,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(97,'keith',6,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(98,'alanna',7,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(99,'christine',8,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(100,'isidro',9,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(101,'novella',10,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(102,'flavio',11,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(103,'antonetta',12,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(104,'heaven',13,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(105,'brady',14,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(106,'eliza',15,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(107,'marques',16,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(108,'hudson',17,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(109,'rosalinda',18,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(110,'adrianna',19,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(111,'keegan',20,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13'),(112,'kraig',21,'Botble\\RealEstate\\Models\\Account','agents','2024-03-11 00:38:13','2024-03-11 00:38:13');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'France','france','FR',1,0,NULL,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(2,'England','england','EN',2,0,NULL,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(3,'New York','new-york','NY',1,0,NULL,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(4,'Holland','holland','HL',4,0,NULL,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(5,'Denmark','denmark','DN',5,0,NULL,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(6,'Germany','germany','GER',1,0,NULL,0,'published','2024-03-11 00:38:01','2024-03-11 00:38:01');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'New',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(2,'Event',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(3,'Villa',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(4,'Apartment',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(5,'Condo',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(6,'Luxury villa',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(7,'Family home',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-11 00:38:01','2024-03-11 00:38:01');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Christa Smith','The Cat\'s head began fading away the time. Alice had begun to think to herself, \'if one only knew how to begin.\' For, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment Alice.','clients/01.jpg','Manager','published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(2,'John Smith','I can\'t show it you myself,\' the Mock Turtle. Alice was very uncomfortable, and, as the hall was very deep, or she fell past it. \'Well!\' thought Alice \'without pictures or conversations in it, \'and.','clients/02.jpg','Product designer','published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(3,'Sayen Ahmod','Who ever saw in my life!\' She had not gone much farther before she came upon a little nervous about it in large letters. It was the first question, you know.\' Alice had no idea what you\'re talking.','clients/03.jpg','Developer','published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(4,'Tayla Swef','NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she walked on in the court!\' and the baby joined):-- \'Wow! wow! wow!\' While the Duchess was VERY ugly; and.','clients/04.jpg','Graphic designer','published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(5,'Christa Smith','I hadn\'t mentioned Dinah!\' she said these words her foot as far as they used to queer things happening. While she was always ready to ask them what the next witness. It quite makes my forehead.','clients/05.jpg','Graphic designer','published','2024-03-11 00:38:01','2024-03-11 00:38:01'),(6,'James Garden','Alice went on eagerly: \'There is such a long time together.\' \'Which is just the case with my wife; And the executioner myself,\' said the Pigeon. \'I can hardly breathe.\' \'I can\'t help that,\' said.','clients/06.jpg','Web Developer','published','2024-03-11 00:38:01','2024-03-11 00:38:01');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `credits` int unsigned NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'waters.katlyn@schroeder.com',NULL,'$2y$12$ePuRCuVSYT/EGmbetBShPeIUhmbqCRbXrwtzs7A7nlML.VkaKjGHC',NULL,'2024-03-11 00:38:00','2024-03-11 00:38:00','Michael','Greenfelder','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'NewsletterWidget','pre_footer','hously',0,'{\"name\":\"Subscribe to Newsletter.\",\"description\":\"Subscribe to get latest updates and information.\",\"title\":null,\"subtitle\":null}','2024-03-11 00:38:01','2024-03-11 00:38:01'),(2,'SiteInformationWidget','footer_menu','hously',1,'{\"name\":\"Site Information\",\"logo\":\"general\\/logo-light.png\",\"url\":\"#\",\"description\":\"A great platform to buy, sell and rent your properties without any agent or commissions.\"}','2024-03-11 00:38:02','2024-03-11 00:38:02'),(3,'CustomMenuWidget','footer_menu','hously',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Company\",\"menu_id\":\"company\"}','2024-03-11 00:38:02','2024-03-11 00:38:02'),(4,'CustomMenuWidget','footer_menu','hously',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Useful Links\",\"menu_id\":\"useful-links\"}','2024-03-11 00:38:02','2024-03-11 00:38:02'),(5,'ContactInformationWidget','footer_menu','hously',4,'{\"name\":\"Contact Details\",\"address\":\"C\\/54 Northwest Freeway, Suite 558, Houston, USA 485\",\"email\":\"contact@example.com\",\"phone\":\"+152 534-468-854\"}','2024-03-11 00:38:02','2024-03-11 00:38:02'),(6,'BlogSearchWidget','blog_sidebar','hously',1,'{\"name\":\"Blog Search\"}','2024-03-11 00:38:02','2024-03-11 00:38:02'),(7,'BlogPopularCategoriesWidget','blog_sidebar','hously',2,'{\"name\":\"Popular Categories\",\"limit\":5}','2024-03-11 00:38:02','2024-03-11 00:38:02'),(8,'BlogPostsWidget','blog_sidebar','hously',3,'{\"name\":\"Popular Posts\",\"type\":\"popular\",\"limit\":5}','2024-03-11 00:38:02','2024-03-11 00:38:02'),(9,'BlogPopularTagsWidget','blog_sidebar','hously',4,'{\"name\":\"Popular Tags\",\"limit\":6}','2024-03-11 00:38:02','2024-03-11 00:38:02');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-11 14:38:14
