-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: helloStranger_development
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1

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
-- Table structure for table `cookingmethods`
--

DROP TABLE IF EXISTS `cookingmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cookingmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jpn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foodglossaries`
--

DROP TABLE IF EXISTS `foodglossaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodglossaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jpn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foodstuffs`
--

DROP TABLE IF EXISTS `foodstuffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodstuffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jpn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foreigners`
--

DROP TABLE IF EXISTS `foreigners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foreigners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` int(11) DEFAULT NULL,
  `keep` int(11) DEFAULT NULL,
  `for_taboo` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `rev_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foreigners_reviews__fk` (`rev_id`) USING BTREE,
  CONSTRAINT `foreigners_ibfk_1` FOREIGN KEY (`rev_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kor_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_taste` int(11) DEFAULT NULL,
  `tag_foodstuff` int(11) DEFAULT NULL,
  `tag_cookingmethod` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `checked_menu` tinyint(1) DEFAULT NULL,
  `recommended_menu` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `rev_id` int(11) DEFAULT NULL,
  `sto_id` int(11) DEFAULT NULL,
  `eng_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jpn_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `chn_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_id` (`rev_id`) USING BTREE,
  KEY `store_id` (`sto_id`) USING BTREE,
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`sto_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menus_ibfk_2` FOREIGN KEY (`rev_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sto_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_owners_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_owners_on_reset_password_token` (`reset_password_token`) USING BTREE,
  KEY `store_id` (`sto_id`) USING BTREE,
  CONSTRAINT `owners_ibfk_1` FOREIGN KEY (`sto_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_eval` tinyint(1) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `men_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `men_picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `men_id` int(11) NOT NULL,
  `for_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `for_id` (`for_id`) USING BTREE,
  KEY `men_id` (`men_id`) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`men_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`for_id`) REFERENCES `foreigners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `beacon_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `open_time` datetime DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `rev_id` int(11) DEFAULT NULL,
  `men_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `men_id` (`men_id`) USING BTREE,
  KEY `rev_id` (`rev_id`) USING BTREE,
  CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`rev_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stores_ibfk_2` FOREIGN KEY (`men_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tastes`
--

DROP TABLE IF EXISTS `tastes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jpn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-10 17:39:55
INSERT INTO schema_migrations (version) VALUES ('20160903143132');

INSERT INTO schema_migrations (version) VALUES ('20160903181957');

INSERT INTO schema_migrations (version) VALUES ('20160909183121');

INSERT INTO schema_migrations (version) VALUES ('20161008105049');

INSERT INTO schema_migrations (version) VALUES ('20161008171700');

INSERT INTO schema_migrations (version) VALUES ('20161010043726');

INSERT INTO schema_migrations (version) VALUES ('20161010043856');

INSERT INTO schema_migrations (version) VALUES ('20161010043929');

INSERT INTO schema_migrations (version) VALUES ('20161010043953');

INSERT INTO schema_migrations (version) VALUES ('20161010043959');
