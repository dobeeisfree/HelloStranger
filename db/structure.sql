-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: helloStranger_development
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1
-- 2016.10.22

--
-- Table structure for table `cookingmethods`
--

DROP TABLE IF EXISTS `diaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `foreigner_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_18d8377028` (`menu_id`),
  KEY `fk_rails_4322272df7` (`store_id`),
  KEY `fk_rails_33f01abd9f` (`foreigner_id`),
  CONSTRAINT `fk_rails_18d8377028` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `fk_rails_33f01abd9f` FOREIGN KEY (`foreigner_id`) REFERENCES `foreigners` (`id`),
  CONSTRAINT `fk_rails_4322272df7` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8192 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `keep` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `for_taboo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `store_id` int(11) DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `checked_menu` tinyint(1) DEFAULT NULL,
  `quick_menu` tinyint(1) DEFAULT NULL,
  `foodglossary_id` int(11) DEFAULT NULL,
  `foodstuff_id` int(11) DEFAULT NULL,
  `foodstuff_id_2` int(11) DEFAULT NULL,
  `taste_id` int(11) DEFAULT NULL,
  `cookingmethod_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_20b0ce4e50` (`store_id`),
  KEY `fk_rails_37ad611b6a` (`foodglossary_id`),
  KEY `fk_rails_7b67bed59f` (`foodstuff_id`),
  KEY `fk_rails_6ddead576a` (`taste_id`),
  KEY `fk_rails_49250363ed` (`cookingmethod_id`),
  KEY `menus_foodstuffs__fk` (`foodstuff_id_2`),
  CONSTRAINT `fk_rails_20b0ce4e50` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `fk_rails_37ad611b6a` FOREIGN KEY (`foodglossary_id`) REFERENCES `foodglossaries` (`id`),
  CONSTRAINT `fk_rails_49250363ed` FOREIGN KEY (`cookingmethod_id`) REFERENCES `cookingmethods` (`id`),
  CONSTRAINT `fk_rails_6ddead576a` FOREIGN KEY (`taste_id`) REFERENCES `tastes` (`id`),
  CONSTRAINT `fk_rails_7b67bed59f` FOREIGN KEY (`foodstuff_id`) REFERENCES `foodstuffs` (`id`),
  CONSTRAINT `menus_foodstuffs__fk` FOREIGN KEY (`foodstuff_id_2`) REFERENCES `foodstuffs` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_owners_on_email` (`email`),
  UNIQUE KEY `index_owners_on_reset_password_token` (`reset_password_token`)
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
  `foreigner_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_be6d6ab568` (`menu_id`),
  KEY `fk_rails_402b8f23c3` (`foreigner_id`),
  CONSTRAINT `fk_rails_402b8f23c3` FOREIGN KEY (`foreigner_id`) REFERENCES `foreigners` (`id`),
  CONSTRAINT `fk_rails_be6d6ab568` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`)
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
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `beacon_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `open_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `close_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_dabcef777e` (`owner_id`),
  CONSTRAINT `fk_rails_dabcef777e` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`)
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
-- Dump completed on 2016-10-12 23:58:11
INSERT INTO schema_migrations (version) VALUES ('20160903143132');

INSERT INTO schema_migrations (version) VALUES ('20160903181957');

INSERT INTO schema_migrations (version) VALUES ('20160909183121');

INSERT INTO schema_migrations (version) VALUES ('20161008105049');

INSERT INTO schema_migrations (version) VALUES ('20161008171700');

INSERT INTO schema_migrations (version) VALUES ('20161010043726');

INSERT INTO schema_migrations (version) VALUES ('20161010043856');

INSERT INTO schema_migrations (version) VALUES ('20161010043929');

INSERT INTO schema_migrations (version) VALUES ('20161010043953');

INSERT INTO schema_migrations (version) VALUES ('20161022105811');

INSERT INTO schema_migrations (version) VALUES ('20161023043959');
