-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: steamdb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(30) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'\'Overwhemingly Positive\''),(2,'\'Very Positive\''),(3,'\'Positive\''),(4,'\'Mostly Positive\''),(5,'\'Mixed\''),(6,'\'Mostly Negative\''),(7,'\'Negative\''),(8,'\'Very Negative\''),(9,'\'Overwhelmingly Negative\'');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_language`
--

DROP TABLE IF EXISTS `comment_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_language` (
  `comment_language_id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int NOT NULL,
  `language_id` int NOT NULL,
  `comment` varchar(30) NOT NULL DEFAULT 'undefined',
  PRIMARY KEY (`comment_language_id`),
  KEY `comment_language_comment_null_fk` (`comment_id`),
  KEY `comment_language_language_null_fk` (`language_id`),
  CONSTRAINT `comment_language_comment_null_fk` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  CONSTRAINT `comment_language_language_null_fk` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_language`
--

LOCK TABLES `comment_language` WRITE;
/*!40000 ALTER TABLE `comment_language` DISABLE KEYS */;
INSERT INTO `comment_language` VALUES (1,1,2,'\'好评如潮\''),(2,2,2,'\'特别好评\''),(3,3,2,'\'好评\''),(4,4,2,'\'多半好评\''),(5,5,2,'\'褒贬不一\''),(6,6,2,'\'多半差评\''),(7,7,2,'\'差评\''),(8,8,2,'\'特别差评\''),(9,9,2,'\'差评如潮\''),(19,1,3,'\'壓倒性好評\''),(20,2,3,'\'極度好評\''),(21,3,3,'\'好評\''),(22,4,3,'\'大多好評\''),(23,5,3,'\'褒貶不一\''),(24,6,3,'\'大多負評\''),(25,7,3,'\'負評\''),(26,8,3,'\'極度負評\''),(27,9,3,'\'壓倒性負評\'');
/*!40000 ALTER TABLE `comment_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `currency_id` int NOT NULL AUTO_INCREMENT,
  `currency` varchar(5) NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'USD'),(2,'CNY'),(3,'HKD');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `developer_id` int NOT NULL AUTO_INCREMENT,
  `developer` varchar(30) NOT NULL,
  PRIMARY KEY (`developer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--

LOCK TABLES `developer` WRITE;
/*!40000 ALTER TABLE `developer` DISABLE KEYS */;
INSERT INTO `developer` VALUES (1,'\'Infinity Ward\''),(2,'\'Raven Software\''),(3,'\'Beenox\''),(4,'\'Treyarch\''),(5,'\'Activision Shanghai\''),(6,'\'Demonware\''),(7,'\'Sledgehammer Games\''),(8,'\'Valve\''),(9,'\'Hidden Path Entertainment\'');
/*!40000 ALTER TABLE `developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL,
  `item_launch_date` date DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (400,'2007-10-10'),(730,'2012-08-22'),(1938090,'2022-10-28');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_comment`
--

DROP TABLE IF EXISTS `item_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_comment` (
  `item_comment_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `rate` float DEFAULT '0',
  PRIMARY KEY (`item_comment_id`),
  KEY `item_comment_comment_null_fk` (`comment_id`),
  KEY `item_comment_item_null_fk` (`item_id`),
  CONSTRAINT `item_comment_comment_null_fk` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  CONSTRAINT `item_comment_item_null_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_comment`
--

LOCK TABLES `item_comment` WRITE;
/*!40000 ALTER TABLE `item_comment` DISABLE KEYS */;
INSERT INTO `item_comment` VALUES (1,1938090,5,0.59),(2,400,1,0.97),(3,730,2,0.88);
/*!40000 ALTER TABLE `item_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_developer`
--

DROP TABLE IF EXISTS `item_developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_developer` (
  `item_develop_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `developer_id` int NOT NULL,
  PRIMARY KEY (`item_develop_id`),
  KEY `item_developer_id_developer_null_fk` (`developer_id`),
  KEY `item_developer_id_item_null_fk` (`item_id`),
  CONSTRAINT `item_developer_id_developer_null_fk` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`),
  CONSTRAINT `item_developer_id_item_null_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_developer`
--

LOCK TABLES `item_developer` WRITE;
/*!40000 ALTER TABLE `item_developer` DISABLE KEYS */;
INSERT INTO `item_developer` VALUES (1,1938090,1),(2,1938090,2),(3,1938090,3),(4,1938090,4),(5,1938090,5),(6,1938090,6),(7,1938090,7),(8,400,8),(9,730,8),(10,730,9);
/*!40000 ALTER TABLE `item_developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_name_brief`
--

DROP TABLE IF EXISTS `item_name_brief`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_name_brief` (
  `name_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(50) DEFAULT 'undefined',
  `brief` text,
  PRIMARY KEY (`name_id`),
  KEY `item_name_item_null_fk` (`item_id`),
  KEY `item_name_brief_language_null_fk` (`language_id`),
  CONSTRAINT `item_name_brief_language_null_fk` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`),
  CONSTRAINT `item_name_item_null_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_name_brief`
--

LOCK TABLES `item_name_brief` WRITE;
/*!40000 ALTER TABLE `item_name_brief` DISABLE KEYS */;
INSERT INTO `item_name_brief` VALUES (1,1938090,2,'《使命召唤®：现代战争®II 2022》 | 《战争地带2.0》','《使命召唤®：现代战争®II 2022》将玩家带入了一场前所未有的全球冲突，141特遣队的标志性队员们即将回归。'),(2,1938090,1,'\'Call of Duty®: Modern Warfare® II\'','\'Call of Duty®: Modern Warfare® II drops players into an unprecedented global conflict that features the return of the iconic Operators of Task Force 141.\''),(3,1938090,3,'\'《決勝時刻®：現代戰爭® II 2022》|《現代戰域™2.0》\'','\'《決勝時刻®：現代戰爭® II 2022》帶領玩家到一個前所未有的全球威脅，而141特遣隊的經典特戰兵將載譽歸來。\''),(4,400,2,'\'Portal\'','\'Portal™ 是 Valve 新开发的单人游戏。故事背景设定在神秘的光圈科技实验室，Portal 已被誉为业界最具创意的新游戏，它将为玩家带来数十小时独一无二的游戏体验。 此游戏旨在改变玩家在特定环境中处理、应付和推测可能性情况的方法；与 Half-Life® 2 的“重力枪”开辟在特定环境下处理目标的新方法类似。 玩家必须通过空间打开前往操纵物体和谜题的入口，解决物理难题和挑战。\''),(5,400,1,'\'Portal\'','\'Portal™ is a new single player game from Valve. Set in the mysterious Aperture Science Laboratories, Portal has been called one of the most innovative new games on the horizon and will offer gamers hours of unique gameplay.\''),(6,400,3,'\'Portal\'','\'Portal™ 是 Valve 新的單人遊戲。Portal 的場景為神秘的「光圈科學實驗室」，它已被譽為目前最富創意的新遊戲，將會帶給玩家好幾個小時的獨特遊戲體驗。 該遊戲是設計用於改變玩家在既定環境下處理、操作及猜測潛在可能性的方式；類似在任何既定狀態之下使用 Half-Life® 2 重力槍來運用物體的創舉。 玩家們必需要透過開啟傳送門移動物體及自己本身，以解開謎題與應付各項挑戰。\'');
/*!40000 ALTER TABLE `item_name_brief` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_price`
--

DROP TABLE IF EXISTS `item_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_price` (
  `price_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `currency_id` int NOT NULL,
  `price` float DEFAULT '0',
  PRIMARY KEY (`price_id`),
  KEY `item_price_item_null_fk` (`item_id`),
  KEY `item_price_currency_null_fk` (`currency_id`),
  CONSTRAINT `item_price_currency_null_fk` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`),
  CONSTRAINT `item_price_item_null_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_price`
--

LOCK TABLES `item_price` WRITE;
/*!40000 ALTER TABLE `item_price` DISABLE KEYS */;
INSERT INTO `item_price` VALUES (1,1938090,1,69.99),(2,1938090,2,446),(3,1938090,3,548),(5,400,1,9.99),(6,400,2,37),(7,400,3,52),(8,730,1,0),(9,730,2,0),(10,730,3,0);
/*!40000 ALTER TABLE `item_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_publisher`
--

DROP TABLE IF EXISTS `item_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_publisher` (
  `item_publisher_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `publisher_id` int NOT NULL,
  PRIMARY KEY (`item_publisher_id`),
  KEY `item_publisher_item_null_fk` (`item_id`),
  KEY `item_publisher_publisher_null_fk` (`publisher_id`),
  CONSTRAINT `item_publisher_item_null_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `item_publisher_publisher_null_fk` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_publisher`
--

LOCK TABLES `item_publisher` WRITE;
/*!40000 ALTER TABLE `item_publisher` DISABLE KEYS */;
INSERT INTO `item_publisher` VALUES (1,1938090,1),(2,400,2),(3,730,2);
/*!40000 ALTER TABLE `item_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_tag`
--

DROP TABLE IF EXISTS `item_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_tag` (
  `item_tag_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`item_tag_id`),
  KEY `item_tag_item_null_fk` (`item_id`),
  KEY `item_tag_tag_null_fk` (`tag_id`),
  CONSTRAINT `item_tag_item_null_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `item_tag_tag_null_fk` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_tag`
--

LOCK TABLES `item_tag` WRITE;
/*!40000 ALTER TABLE `item_tag` DISABLE KEYS */;
INSERT INTO `item_tag` VALUES (1,1938090,1),(2,1938090,2),(3,1938090,3),(4,1938090,4),(5,1938090,5),(6,400,6),(7,400,7),(8,400,8),(9,400,9),(10,400,5);
/*!40000 ALTER TABLE `item_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(15) DEFAULT 'undefined',
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'en-us'),(2,'zh-cn'),(3,'zh-tw');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher` varchar(30) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'\'Activision\''),(2,'\'Valve\'');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag` varchar(20) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_tag_uindex` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (9,'\'3D Platformer\''),(2,'\'Action\''),(10,'\'Competitive\''),(8,'\'First-Person\''),(1,'\'FPS\''),(4,'\'Multiplayer\''),(7,'\'Puzzle Platformer\''),(6,'\'Puzzle\''),(3,'\'Shooter\''),(5,'\'Singleplayer\'');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_language`
--

DROP TABLE IF EXISTS `tag_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_language` (
  `tag_language_id` int NOT NULL AUTO_INCREMENT,
  `tag_id` int NOT NULL,
  `language_id` int NOT NULL,
  `tag` varchar(20) DEFAULT 'undefined',
  PRIMARY KEY (`tag_language_id`),
  KEY `tag_language_language_null_fk` (`language_id`),
  KEY `tag_language_tag_null_fk` (`tag_id`),
  CONSTRAINT `tag_language_language_null_fk` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`),
  CONSTRAINT `tag_language_tag_null_fk` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_language`
--

LOCK TABLES `tag_language` WRITE;
/*!40000 ALTER TABLE `tag_language` DISABLE KEYS */;
INSERT INTO `tag_language` VALUES (1,1,2,'\'第一人称射击\''),(2,2,2,'\'动作\''),(3,3,2,'\'射击\''),(4,4,2,'\'多人\''),(5,5,2,'\'单人\''),(6,6,2,'\'解密\''),(7,7,2,'\'平台解密\''),(8,8,2,'\'第一人称\''),(9,9,2,'\'3D 平台\''),(10,1,3,'\'第一人稱射擊\''),(11,2,3,'\'動作\''),(12,3,3,'\'射擊\''),(13,4,3,'\'多人\''),(14,5,3,'\'單人\''),(18,6,3,'\'解謎\''),(19,7,3,'\'平台解謎\''),(20,8,3,'\'第一人稱視角\''),(21,9,3,'\'3D 平台\''),(22,10,2,'\'竞技\''),(23,10,3,'\'競技\'');
/*!40000 ALTER TABLE `tag_language` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-23 19:45:47
