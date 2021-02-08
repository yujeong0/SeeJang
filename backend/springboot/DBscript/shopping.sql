-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopping
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `best_product`
--

DROP TABLE IF EXISTS `best_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `best_product` (
  `ranking` int NOT NULL,
  `product_no` int NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` varchar(20) NOT NULL,
  PRIMARY KEY (`ranking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `best_product`
--

LOCK TABLES `best_product` WRITE;
/*!40000 ALTER TABLE `best_product` DISABLE KEYS */;
INSERT INTO `best_product` VALUES (1,1,'CJ 비비고왕교자1.12kg','9480'),(2,20,'코카콜라 300ml*12PET','7980'),(3,21,'삼립 아침엔 밀크 식빵 330g','2180'),(4,42,'냉동 블루베리 1.5kg/봉','10800'),(5,75,'빙그레 바나나맛 우유(240ml4개) 960ml','4580');
/*!40000 ALTER TABLE `best_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_price`
--

DROP TABLE IF EXISTS `category_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_price` (
  `category_no` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `category_price` varchar(50) NOT NULL,
  PRIMARY KEY (`category_no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_price`
--

LOCK TABLES `category_price` WRITE;
/*!40000 ALTER TABLE `category_price` DISABLE KEYS */;
INSERT INTO `category_price` VALUES (1,'우유','2480'),(2,'만두 1.12kg','9480'),(3,'모짜렐라 치즈 1kg','12900'),(4,'체다 치즈 200g','2380'),(5,'요거트 450g','2980'),(6,'파스타 소스 600g','3980'),(7,'딸기 500g','8800'),(8,'올리브유 500ml','5680'),(9,'식빵 300g','2480'),(10,'햄 90g','1980'),(11,'커피믹스 250입','27200'),(12,'아메리카노 150입','25800'),(13,'물 2L 6병','5880');
/*!40000 ALTER TABLE `category_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (11),(11);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` blob NOT NULL,
  `state` char(1) NOT NULL DEFAULT 'F',
  `num` int DEFAULT NULL,
  `reg_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `seq` int NOT NULL,
  `blind` int DEFAULT '0',
  `create_at` datetime(6) DEFAULT NULL,
  `member_id` varchar(255) NOT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `member_password` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `salt_id` int DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `UK_4rw879c4q7wrgi3v64cy73b17` (`member_id`),
  KEY `FK41ji1l4hfnvsnl8wsqunkqqcj` (`salt_id`),
  CONSTRAINT `FK41ji1l4hfnvsnl8wsqunkqqcj` FOREIGN KEY (`salt_id`) REFERENCES `salt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,0,'2021-01-31 09:53:15.598000','string','string','$2a$10$Y9zPMZzzlKGum/bN6Q4dU.jdYSswq5IuwIjqcFhkAyH0cUGYVluTa',NULL,'ROLE_NOT_PERMITTED','2021-01-31 09:53:15.598000',2),(3,0,'2021-02-01 10:26:13.008000','','new0822@naver.com','$2a$10$t5Cnhhhfd9drjGicF7OleuKTDQJLUf9s4UJFs8u.9ofa7dbALmq8K',NULL,'ROLE_NOT_PERMITTED','2021-02-01 10:26:13.008000',4),(5,0,'2021-02-01 10:28:55.623000','new0822@naver.com','강민창','$2a$10$YuQNvssgYsMDhHeNp6Bs5eIktpdILij8HZcVtsSYTxJjJZBrk5b8q',NULL,'ROLE_NOT_PERMITTED','2021-02-01 10:28:55.623000',6),(7,0,'2021-02-01 11:00:51.418000','민창22@naver.com','민창','$2a$10$th5MGnV513RE6rM1QgdBau.eFHlbduJhy/2mDjF5OeEsvHUDUqdCK','네이버','ROLE_NOT_PERMITTED','2021-02-01 11:00:51.418000',8),(9,0,'2021-02-06 04:03:18.579000','cndtjq145@naver.com','단우아빠','$2a$10$FsO8d7NgiUBSMl9Nmc8MDehh8KJzAsk5uw4Q98giiFpIHUX0jjRhu',NULL,'ROLE_NOT_PERMITTED','2021-02-06 04:03:18.579000',10);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_no` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_price` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `reviewLink` varchar(1000) DEFAULT NULL,
  `imageName` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'CJ 비비고왕교자1.12kg','9480','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000025935885&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%B9%84%EB%B9%84%EA%B3%A0&srchPgNo=1&src_area=elist','1.JPG'),(2,'CJ 스팸 클래식 1,200g (200g*6입)','15980','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000009444837&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%8A%A4%ED%8C%B8&srchPgNo=1&src_area=elist','2.JPG'),(3,'동원참치 살코기 라이트스탠다드(135g×8) 1080g','14480','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000005328486&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%8F%99%EC%9B%90%EC%B0%B8%EC%B9%98&srchPgNo=1&src_area=elist','3.JPG'),(4,'피코크 정통 꿔바로우500g','6980','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000043378397&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%94%BC%EC%BD%94%ED%81%AC%20%EA%BF%94%EB%B0%94%EB%A1%9C%EC%9A%B0&srchPgNo=1&src_area=elist','4.JPG'),(5,'팜덕 훈제오리 600g','7500','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=0000008082162&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%8C%9C%EB%8D%95%20%ED%9B%88%EC%A0%9C%EC%98%A4%EB%A6%AC&srchPgNo=1&src_area=elist','5.JPG'),(6,'노브랜드 칠리 새우 400g','6580','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000025849254&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%85%B8%EB%B8%8C%EB%9E%9C%EB%93%9C%20%EC%B9%A0%EB%A6%AC%20%EC%83%88%EC%9A%B0&srchPgNo=1&src_area=elist','6.JPG'),(7,'노브랜드 쫀득한 치즈스틱 1kg','8980','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000019686834&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%85%B8%EB%B8%8C%EB%9E%9C%EB%93%9C%20%EC%B9%98%EC%A6%88%EC%8A%A4%ED%8B%B1&srchPgNo=1&src_area=elist','7.JPG'),(8,'얇은피꽉찬속 고기만두 400g*2','8480','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000032689577&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%96%87%EC%9D%80%ED%94%BC%20%EA%B3%A0%EA%B8%B0%EB%A7%8C%EB%91%90&srchPgNo=1&src_area=elist','8.JPG'),(9,'CJ 고메 바삭튀겨낸 통등심돈카츠450g','14480','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000034313770&siteNo=6001&salestrNo=2034&tlidSrchWd=%EA%B3%A0%EB%A9%94%20%EB%8F%88%EA%B0%80%EC%8A%A4&srchPgNo=1&src_area=elist','9.JPG'),(10,'CJ 비비고 구운주먹밥 김치치즈500g','6980','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000045103444&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%B9%84%EB%B9%84%EA%B3%A0%20%EA%B9%80%EC%B9%98%EC%B9%98%EC%A6%88&srchPgNo=1&src_area=elist','10.JPG'),(11,'청정원 홍초 900ml(복분자)','6980','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=0000006872089&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%B2%AD%EC%A0%95%EC%9B%90%20%ED%99%8D%EC%B4%88&srchPgNo=1&src_area=elist','11.JPG'),(12,'여명808 (140ml2개)','8300','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=0000006610022&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%97%AC%EB%AA%85808&srchPgNo=1&src_area=elist','12.JPG'),(13,'광동 비타500 100ml x 100병','38250','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=1000054075707&siteNo=6001&salestrNo=6005&tlidSrchWd=%EA%B4%91%EB%8F%99%20%EB%B9%84%ED%83%80500%20100&srchPgNo=1&src_area=elist','13.JPG'),(14,'쁘띠첼 미초 청포도 900ml X 3개','14000','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=1000021642006&siteNo=6001&salestrNo=6005&tlidSrchWd=%EC%81%98%EB%9D%A0%EC%B2%BC%20%EB%AF%B8%EC%B4%88%20%EC%B2%AD%ED%8F%AC%EB%8F%84900&srchPgNo=1&src_area=elist','14.JPG'),(15,'롯데 이프로 부족할때 350mlx20개','21770','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=1000059673791&siteNo=6001&salestrNo=6005&tlidSrchWd=%EB%A1%AF%EB%8D%B0%20%EC%9D%B4%ED%94%84%EB%A1%9C%20%EB%B6%80%EC%A1%B1%ED%95%A0%20%EB%95%8C350&srchPgNo=1&src_area=elist','15.JPG'),(16,'토레타 500mlx24페트','27550','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=1000059676247&siteNo=6001&salestrNo=6005&tlidSrchWd=%ED%86%A0%EB%A0%88%ED%83%80%20500ml&srchPgNo=1&src_area=elist','16.JPG'),(17,'글라소 비타민워터 에너지 500ml 12개','17300','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=1000043112294&siteNo=6001&salestrNo=6005&tlidSrchWd=%EA%B8%80%EB%9D%BC%EC%86%8C%20%EB%B9%84%ED%83%80%EB%AF%BC%EC%9B%8C%ED%84%B0%20%EC%97%90%EB%84%88%EC%A7%80%20500ml&srchPgNo=1&src_area=elist','17.JPG'),(18,'트레비 라임 300ml*20입','10780','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=1000017628262&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%8A%B8%EB%A0%88%EB%B9%84%20%EB%9D%BC%EC%9E%84%20300&srchPgNo=1&src_area=elist','18.JPG'),(19,'델몬트 콜드 오렌지 과즙 100%(1.89L*2) 3.78L','7980','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=0000007558817&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%8D%B8%EB%AA%AC%ED%8A%B8%20%EC%BD%9C%EB%93%9C%20%EC%98%A4%EB%A0%8C%EC%A7%80%20%EA%B3%BC%EC%A6%99100&srchPgNo=1&src_area=elist','19.JPG'),(20,'코카콜라 300ml*12PET','11480','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=1000027169026&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%BD%94%EC%B9%B4%EC%BD%9C%EB%9D%BC%20300&srchPgNo=1&src_area=elist','20.JPG'),(21,'삼립 아침엔 밀크 식빵 330g','2180','베이커리/잼','http://earlymorning.ssg.com/item/itemView.ssg?itemId=1000004979389&siteNo=7009&salestrNo=2449&tlidSrchWd=%EC%82%BC%EB%A6%BD%20%EC%95%84%EC%B9%A8%EC%97%94%20%EB%B0%80%ED%81%AC%20%EC%8B%9D%EB%B9%B5330&srchPgNo=1&src_area=elist','21.JPG'),(22,'이삼립 발효미종 단팥&피자호빵8입 720g','6980','베이커리/잼','http://emart.ssg.com/item/itemView.ssg?itemId=1000030283894&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%B0%9C%ED%9A%A8%EB%AF%B8%EC%A2%85%20%EB%8B%A8%ED%8C%A5%20%ED%98%B8%EB%B9%B5&srchPgNo=1&src_area=elist','22.JPG'),(23,'노브랜드스트로베리잼800g','4580','베이커리/잼','http://emart.ssg.com/item/itemView.ssg?itemId=1000017206906&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%85%B8%EB%B8%8C%EB%9E%9C%EB%93%9C%EB%94%B8%EA%B8%B0%EC%9E%BC&srchPgNo=1&src_area=elist','23.JPG'),(24,'삼립 버터롤 클래식 21','3780','베이커리/잼','http://emart.ssg.com/item/itemView.ssg?itemId=1000004997324&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%B2%84%ED%84%B0%EB%A1%A4%20%ED%81%B4%EB%9E%98%EC%8B%9D21&srchPgNo=1&src_area=elist','24.JPG'),(25,'땅콩버터 청크 462g','6980','베이커리/잼','http://emart.ssg.com/item/itemView.ssg?itemId=1000040570374&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%95%85%EC%BD%A9%EB%B2%84%ED%84%B0%20%EC%B2%AD%ED%81%AC462g&srchPgNo=1&src_area=elist','25.JPG'),(26,'삼립 고구마호빵4입 360g','3280','베이커리/잼','http://emart.ssg.com/item/itemView.ssg?itemId=1000036854949&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%82%BC%EB%A6%BD%20%EA%B3%A0%EA%B5%AC%EB%A7%88%ED%98%B8%EB%B9%B54%EC%9E%85&srchPgNo=1&src_area=elist','26.JPG'),(27,'풀무원 올바른 또띠아 우유(대) 225g','2980','베이커리/잼','http://emart.ssg.com/item/itemView.ssg?itemId=1000009929705&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%98%AC%EB%B0%94%EB%A5%B8%20%EB%98%90%EB%9D%A0%EC%95%84%20%EC%9A%B0%EC%9C%A0&srchPgNo=1&src_area=elist','27.JPG'),(28,'삼립 버터롤 클래식 21','3780','베이커리/잼','http://emart.ssg.com/item/itemView.ssg?itemId=1000004997324&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%B2%84%ED%84%B0%EB%A1%A4%20%ED%81%B4%EB%9E%98%EC%8B%9D&srchPgNo=1&src_area=elist','28.JPG'),(29,'피코크 미니고구마파이(생지) 292g','4980','베이커리/잼','http://emart.ssg.com/item/itemView.ssg?itemId=1000037498947&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%AF%B8%EB%8B%88%EA%B3%A0%EA%B5%AC%EB%A7%88%ED%8C%8C%EC%9D%B4&srchPgNo=1&src_area=elist','29.JPG'),(30,'노브랜드 헤이즐넛 초코크림 400g','3180','베이커리/잼','http://emart.ssg.com/item/itemView.ssg?itemId=1000017739352&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%97%A4%EC%9D%B4%EC%A6%90%EB%84%9B%20%EC%B4%88%EC%BD%94%ED%81%AC%EB%A6%BC&srchPgNo=1&src_area=elist','30.JPG'),(31,'청정원 감식초 900ml','10300','양념/오일','http://emart.ssg.com/item/itemView.ssg?itemId=0000006614778&siteNo=6001&salestrNo=2034&tlidSrchWd=%EA%B0%90%EC%8B%9D%EC%B4%88&srchPgNo=1&src_area=elist','31.JPG'),(32,'Olitaria 오로엑스트라버진올리브오일500ml','14800','양념/오일','http://emart.ssg.com/item/itemView.ssg?itemId=1000018804585&siteNo=6001&salestrNo=2034&tlidSrchWd=Olitaria%20%EC%98%A4%EB%A1%9C%EC%97%91%EC%8A%A4%ED%8A%B8%EB%9D%BC%EB%B2%84%EC%A7%84%EC%98%AC%EB%A6%AC%EB%B8%8C%EC%98%A4%EC%9D%BC&srchPgNo=1&src_area=elist','32.JPG'),(33,'CJ 하선정 남해안 멸치 덧장 명품 액젓 2469ml (3kg)','18750','양념/오일','http://emart.ssg.com/item/itemView.ssg?itemId=0000008528800&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%95%98%EC%84%A0%EC%A0%95%EB%82%A8%ED%95%B4%EC%95%88%EB%A9%B8%EC%B9%98%EC%95%A1%EC%A0%96&srchPgNo=1&src_area=elist','33.JPG'),(34,'CJ 해찬들태양초고추장 2kg(쌀)','26000','양념/오일','http://emart.ssg.com/item/itemView.ssg?itemId=0000007901296&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%95%B4%EC%B0%AC%EB%93%A4%ED%83%9C%EC%96%91%EC%B4%88%EA%B3%A0%EC%B6%94%EC%9E%A5&srchPgNo=1&src_area=elist','34.JPG'),(35,'친정엄마 매운고춧가루 200g','14000','양념/오일','http://emart.ssg.com/item/itemView.ssg?itemId=1000034222623&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%B9%9C%EC%A0%95%EC%97%84%EB%A7%88%20%EB%A7%A4%EC%9A%B4%EA%B3%A0%EC%B6%A7%EA%B0%80%EB%A3%A8&srchPgNo=1&src_area=elist','35.JPG'),(36,'한라 프리미엄 참치액 500ml','14300','양념/오일','http://emart.ssg.com/item/itemView.ssg?itemId=0000008107421&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84%20%EC%B0%B8%EC%B9%98%EC%95%A1&srchPgNo=1&src_area=elist','36.JPG'),(37,'샘표 연두 500ml(순)','9980','양념/오일','http://emart.ssg.com/item/itemView.ssg?itemId=1000027064666&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%83%98%ED%91%9C%20%EC%97%B0%EB%91%90&srchPgNo=1&src_area=elist','37.JPG'),(38,'청정원 순창 재래식생된장 2kg','12500','양념/오일','http://emart.ssg.com/item/itemView.ssg?itemId=0000006610013&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%88%9C%EC%B0%BD%20%EC%9E%AC%EB%9E%98%EC%8B%9D%EC%83%9D%EB%90%9C%EC%9E%A5&srchPgNo=1&src_area=elist','38.JPG'),(39,'청정원 까르보나라 파스타소스 350g','4780','양념/오일','http://emart.ssg.com/item/itemView.ssg?itemId=1000017987499&siteNo=6001&salestrNo=2034&tlidSrchWd=%EA%B9%8C%EB%A5%B4%EB%B3%B4%EB%82%98%EB%9D%BC%20%ED%8C%8C%EC%8A%A4%ED%83%80%EC%86%8C%EC%8A%A4%20350&srchPgNo=1&src_area=elist','39.JPG'),(40,'노브랜드 볶음깨소금 250g','4180','양념/오일','http://emart.ssg.com/item/itemView.ssg?itemId=1000023586830&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%85%B8%EB%B8%8C%EB%9E%9C%EB%93%9C%20%EB%B3%B6%EC%9D%8C%EA%B9%A8%EC%86%8C%EA%B8%88&srchPgNo=1&src_area=elist','40.JPG'),(41,'당찬사과 4~11입/봉 (1.8kg)','4180','과일','http://emart.ssg.com/item/itemView.ssg?itemId=1000011088565&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%8B%B9%EC%B0%AC%EC%82%AC%EA%B3%BC%20&srchPgNo=1&src_area=elist','41.JPG'),(42,'냉동 블루베리 1.5kg/봉','10800','과일','http://emart.ssg.com/item/itemView.ssg?itemId=1000027100032&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%83%89%EB%8F%99%20%EB%B8%94%EB%A3%A8%EB%B2%A0%EB%A6%AC&srchPgNo=1&src_area=elist','42.JPG'),(43,'고당도 샤인머스켓 청포도 1kg(2-3송이)','24900','과일','http://emart.ssg.com/item/itemView.ssg?itemId=1000037124377&siteNo=6001&salestrNo=6005&tlidSrchWd=%EA%B3%A0%EB%8B%B9%EB%8F%84%20%EC%83%A4%EC%9D%B8%EB%A8%B8%EC%8A%A4%EC%BC%93%20%EC%B2%AD%ED%8F%AC%EB%8F%84&srchPgNo=1&src_area=elist','43.JPG'),(44,'칠레산 생체리 700g (팩)','12500','과일','http://earlymorning.ssg.com/item/itemView.ssg?itemId=2097001096369&siteNo=7009&salestrNo=2449&tlidSrchWd=%EC%B9%A0%EB%A0%88%EC%82%B0%20%EC%83%9D%EC%B2%B4%EB%A6%AC%20700&srchPgNo=1&src_area=elist','44.JPG'),(45,'레드향 1.5kg/박스','15900','과일','http://emart.ssg.com/item/itemView.ssg?itemId=0000010456929&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%A0%88%EB%93%9C%ED%96%A5%201.5kg&srchPgNo=1&src_area=elist','45.JPG'),(46,'멕시코산 아보카도 5입 1kg (망)','8680','과일','http://earlymorning.ssg.com/item/itemView.ssg?itemId=2097001077429&siteNo=7009&salestrNo=2449&tlidSrchWd=%EB%A9%95%EC%8B%9C%EC%BD%94%EC%82%B0%20%EC%95%84%EB%B3%B4%EC%B9%B4%EB%8F%84&srchPgNo=1&src_area=elist','46.JPG'),(47,'미국산 석류 3~5입/봉 (1.2kg 내외)','9900','과일','http://emart.ssg.com/item/itemView.ssg?itemId=1000053696908&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%AF%B8%EA%B5%AD%EC%82%B0%20%EC%84%9D%EB%A5%98&srchPgNo=1&src_area=elist','47.JPG'),(48,'미국산 레몬10입 900g (봉)','5980','과일','http://earlymorning.ssg.com/item/itemView.ssg?itemId=2097000870267&siteNo=7009&salestrNo=2449&tlidSrchWd=%EB%AF%B8%EA%B5%AD%EC%82%B0%20%EB%A0%88%EB%AA%AC%2010%EC%9E%85&srchPgNo=1&src_area=elist','48.JPG'),(49,'대추방울토마토 750g/팩','6900','과일','http://emart.ssg.com/item/itemView.ssg?itemId=1000040830288&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%8C%80%EC%B6%94%EB%B0%A9%EC%9A%B8%ED%86%A0%EB%A7%88%ED%86%A0&srchPgNo=1&src_area=elist','49.JPG'),(50,'금실딸기 500g/팩 (특)','15900','과일','http://emart.ssg.com/item/itemView.ssg?itemId=1000014555004&siteNo=6001&salestrNo=2034&tlidSrchWd=%EA%B8%88%EC%8B%A4%EB%94%B8%EA%B8%B0%20500&srchPgNo=1&src_area=elist','50.JPG'),(51,'20년산 이맛쌀 20kg','58900','쌀/잡곡','http://emart.ssg.com/item/itemView.ssg?itemId=1000025189727&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%9D%B4%EB%A7%9B%EC%8C%80&srchPgNo=1&src_area=elist','51.JPG'),(52,'노브랜드 리얼 데일리너츠 400g (20g*20개입)','9980','쌀/잡곡','http://emart.ssg.com/item/itemView.ssg?itemId=1000026633612&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%A6%AC%EC%96%BC%20%EB%8D%B0%EC%9D%BC%EB%A6%AC%EB%84%88%EC%B8%A0%20400&srchPgNo=1&src_area=elist','52.JPG'),(53,'노브랜드 혼합 9곡 4kg','9980','쌀/잡곡','http://emart.ssg.com/item/itemView.ssg?itemId=1000015615206&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%98%BC%ED%95%A9%209%EA%B3%A1&srchPgNo=1&src_area=elist','53.JPG'),(54,'하루견과 블루베리 400g','9980','쌀/잡곡','http://emart.ssg.com/item/itemView.ssg?itemId=1000034313756&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%95%98%EB%A3%A8%EA%B2%AC%EA%B3%BC%20%EB%B8%94%EB%A3%A8%EB%B2%A0%EB%A6%AC%20400&srchPgNo=1&src_area=elist','54.JPG'),(55,'군옥수수맛아몬드 210g','7480','쌀/잡곡','http://emart.ssg.com/item/itemView.ssg?itemId=1000036426538&siteNo=6001&salestrNo=2034&tlidSrchWd=%EA%B5%B0%EC%98%A5%EC%88%98%EC%88%98%EB%A7%9B%EC%95%84%EB%AA%AC%EB%93%9C&srchPgNo=1&src_area=elist','55.JPG'),(56,'노브랜드 국내산 현미로 만든 스틱 미숫가루 600g','9980','쌀/잡곡','http://emart.ssg.com/item/itemView.ssg?itemId=1000018266489&siteNo=6001&salestrNo=2034&tlidSrchWd=%EA%B5%AD%EB%82%B4%EC%82%B0%20%ED%98%84%EB%AF%B8%EB%A1%9C%20%EB%A7%8C%EB%93%A0%20%EC%8A%A4%ED%8B%B1%20%EB%AF%B8%EC%88%AB%EA%B0%80%EB%A3%A8&srchPgNo=1&src_area=elist','56.JPG'),(57,'골든퀸현미 2kg','8980','쌀/잡곡','http://emart.ssg.com/item/itemView.ssg?itemId=0000010534716&siteNo=6001&salestrNo=2034&tlidSrchWd=%EA%B3%A8%EB%93%A0%ED%80%B8%ED%98%84%EB%AF%B8&srchPgNo=1&src_area=elist','57.JPG'),(58,'서리태 1.5kg','19800','쌀/잡곡','http://emart.ssg.com/item/itemView.ssg?itemId=1000038571566&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%84%9C%EB%A6%AC%ED%83%9C%201.5kg&srchPgNo=1&src_area=elist','58.JPG'),(59,'믹스넛 점보 프리미엄 1kg','33900','쌀/잡곡','http://emart.ssg.com/item/itemView.ssg?itemId=0000008326607&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%AF%B9%EC%8A%A4%EB%84%9B%20%EC%A0%90%EB%B3%B4%20%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84&srchPgNo=1&src_area=elist','59.JPG'),(60,'피코크 유기농 아몬드 미숫가루 500g','12980','쌀/잡곡','http://emart.ssg.com/item/itemView.ssg?itemId=1000030059540&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%9C%A0%EA%B8%B0%EB%86%8D%20%EC%95%84%EB%AA%AC%EB%93%9C%20%EB%AF%B8%EC%88%AB%EA%B0%80%EB%A3%A8&srchPgNo=1&src_area=elist','60.JPG'),(61,'맥심 모카골드 커피믹스 160입','22300','커피/차','http://emart.ssg.com/item/itemView.ssg?itemId=1000044039296&siteNo=6001&salestrNo=6005&tlidSrchWd=%EB%A7%A5%EC%8B%AC%20%EB%AA%A8%EC%B9%B4%EA%B3%A8%EB%93%9C%20%EC%BB%A4%ED%94%BC%EB%AF%B9%EC%8A%A4&srchPgNo=1&src_area=elist','61.JPG'),(62,'동서 둥글레차(1.2g*100티백) 120g','6640','커피/차','http://emart.ssg.com/item/itemView.ssg?itemId=0000007106399&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%91%A5%EA%B8%80%EB%A0%88%EC%B0%A8&srchPgNo=1&src_area=elist','62.JPG'),(63,'맥심 카누 마일드 로스트 아메리카노 미니 0.9g*100입','19000','커피/차','http://emart.ssg.com/item/itemView.ssg?itemId=0000008848271&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%B9%B4%EB%88%84%20%EB%A7%88%EC%9D%BC%EB%93%9C%20%EB%A1%9C%EC%8A%A4%ED%8A%B8%20%EC%95%84%EB%A9%94%EB%A6%AC%EC%B9%B4%EB%85%B8%20%EB%AF%B8%EB%8B%88&srchPgNo=1&src_area=elist','63.JPG'),(64,'스타벅스 하우스 블렌드 분쇄 원두 200g','10900','커피/차','http://emart.ssg.com/item/itemView.ssg?itemId=1000042357891&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%95%98%EC%9A%B0%EC%8A%A4%20%EB%B8%94%EB%A0%8C%EB%93%9C%20%EB%B6%84%EC%87%84%20%EC%9B%90%EB%91%90%20200g&srchPgNo=1&src_area=elist','64.JPG'),(65,'네스카페 돌체구스토 룽고 30캡슐','15900','커피/차','http://emart.ssg.com/item/itemView.ssg?itemId=1000043562845&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%84%A4%EC%8A%A4%EC%B9%B4%ED%8E%98%20%EB%8F%8C%EC%B2%B4%EA%B5%AC%EC%8A%A4%ED%86%A0%20%EB%A3%BD%EA%B3%A0&srchPgNo=1&src_area=elist','65.JPG'),(66,'담터 호두,아몬드 율무차 100입 1,800g','21800','커피/차','http://emart.ssg.com/item/itemView.ssg?itemId=0000006951624&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%98%B8%EB%91%90,%EC%95%84%EB%AA%AC%EB%93%9C%20%EC%9C%A8%EB%AC%B4%EC%B0%A8%20100%EC%9E%85&srchPgNo=1&src_area=elist','66.JPG'),(67,'노브랜드 자몽차 2kg','9480','커피/차','http://emart.ssg.com/item/itemView.ssg?itemId=1000014732088&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%9E%90%EB%AA%BD%EC%B0%A8&srchPgNo=1&src_area=elist','67.JPG'),(68,'맥심 카누더블샷라떼 50입 (13.5g*50개입)','19000','커피/차','http://emart.ssg.com/item/itemView.ssg?itemId=1000024635778&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%B9%B4%EB%88%84%EB%8D%94%EB%B8%94%EC%83%B7%EB%9D%BC%EB%96%BC&srchPgNo=1&src_area=elist','68.JPG'),(69,'트와이닝 잉글리쉬 블랙퍼스트 50g (2g*25티백)','6980','커피/차','http://emart.ssg.com/item/itemView.ssg?itemId=1000010434076&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%9E%89%EA%B8%80%EB%A6%AC%EC%89%AC%20%EB%B8%94%EB%9E%99%ED%8D%BC%EC%8A%A4%ED%8A%B8%2050g&srchPgNo=1&src_area=elist','69.JPG'),(70,'피코크 마몰로 리치핫초코 600g','9980','커피/차','http://emart.ssg.com/item/itemView.ssg?itemId=1000033901412&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%94%BC%EC%BD%94%ED%81%AC%20%EB%A7%88%EB%AA%B0%EB%A1%9C%20%EB%A6%AC%EC%B9%98%ED%95%AB%EC%B4%88%EC%BD%94&srchPgNo=1&src_area=elist','70.JPG'),(71,'매일 앱솔루트 명작 2단계 800G','19920','우유/유제품','http://emart.ssg.com/item/itemView.ssg?itemId=1000019476825&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%95%B1%EC%86%94%EB%A3%A8%ED%8A%B8%20%EB%AA%85%EC%9E%91%202%EB%8B%A8%EA%B3%84&srchPgNo=1&src_area=elist','71.JPG'),(72,'서울우유 1000ml 나100%','19920','우유/유제품','http://emart.ssg.com/item/itemView.ssg?itemId=0000006615474&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%84%9C%EC%9A%B8%EC%9A%B0%EC%9C%A0%201000ml&srchPgNo=1&src_area=elist','72.JPG'),(73,'서울우유 체다 슬라이스 치즈(300g2개입) 600g','7190','우유/유제품','http://emart.ssg.com/item/itemView.ssg?itemId=0000008895612&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%B2%B4%EB%8B%A4%20%EC%8A%AC%EB%9D%BC%EC%9D%B4%EC%8A%A4%20%EC%B9%98%EC%A6%88&srchPgNo=1&src_area=elist','73.JPG'),(74,'서울우유 비요뜨 초코링 (143g*2개)','2550','우유/유제품','http://emart.ssg.com/item/itemView.ssg?itemId=0000007900507&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%B9%84%EC%9A%94%EB%9C%A8%20%EC%B4%88%EC%BD%94%EB%A7%81&srchPgNo=1&src_area=elist','74.JPG'),(75,'빙그레 바나나맛 우유(240ml4개) 960ml','4580','우유/유제품','http://emart.ssg.com/item/itemView.ssg?itemId=0000006615596&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%B0%94%EB%82%98%EB%82%98%EB%A7%9B%EC%9A%B0%EC%9C%A0&srchPgNo=1&src_area=elist','75.JPG'),(76,'서울우유 프레시 버터 80g*3입','6080','우유/유제품','http://emart.ssg.com/item/itemView.ssg?itemId=1000004584293&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%94%84%EB%A0%88%EC%8B%9C%20%EB%B2%84%ED%84%B0&srchPgNo=1&src_area=elist','76.JPG'),(77,'요플레 클래식 플레인 (85g4개)','2800','우유/유제품','http://emart.ssg.com/item/itemView.ssg?itemId=0000006615615&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%81%B4%EB%9E%98%EC%8B%9D%20%ED%94%8C%EB%A0%88%EC%9D%B8&srchPgNo=1&src_area=elist','77.JPG'),(78,'매일 소화가 잘되는 멸균우유 (190ml16)','11180','우유/유제품','http://emart.ssg.com/item/itemView.ssg?itemId=1000018889460&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%86%8C%ED%99%94%EA%B0%80%20%EC%9E%98%EB%90%98%EB%8A%94%20%EB%A9%B8%EA%B7%A0%EC%9A%B0%EC%9C%A0&srchPgNo=1&src_area=elist','78.JPG'),(79,'소와나무 이태리안피자치즈 800g','11980','우유/유제품','http://emart.ssg.com/item/itemView.ssg?itemId=1000030820894&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%86%8C%EC%99%80%EB%82%98%EB%AC%B4%20%EC%9D%B4%ED%83%9C%EB%A6%AC%EC%95%88%ED%94%BC%EC%9E%90%EC%B9%98%EC%A6%88&srchPgNo=1&src_area=elist','79.JPG'),(80,'압타밀 프로누트라 어드밴스 1단계 800g','28900','우유/유제품','http://emart.ssg.com/item/itemView.ssg?itemId=1000050320752&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%95%95%ED%83%80%EB%B0%80%20%ED%94%84%EB%A1%9C%EB%88%84%ED%8A%B8%EB%9D%BC%20%EC%96%B4%EB%93%9C%EB%B0%B4%EC%8A%A4&srchPgNo=1&src_area=elist','80.JPG');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review` (
  `comment_no` int NOT NULL AUTO_INCREMENT,
  `product_no` int NOT NULL,
  `member_id` varchar(20) NOT NULL,
  `member_name` varchar(200) NOT NULL,
  `score` varchar(200) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `date` date DEFAULT (now()),
  PRIMARY KEY (`comment_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
INSERT INTO `product_review` VALUES (1,14,'string','string','5','1','2021-02-02');
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salt`
--

DROP TABLE IF EXISTS `salt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salt` (
  `id` int NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salt`
--

LOCK TABLES `salt` WRITE;
/*!40000 ALTER TABLE `salt` DISABLE KEYS */;
INSERT INTO `salt` VALUES (2,'$2a$10$Y9zPMZzzlKGum/bN6Q4dU.'),(4,'$2a$10$t5Cnhhhfd9drjGicF7Oleu'),(6,'$2a$10$YuQNvssgYsMDhHeNp6Bs5e'),(8,'$2a$10$th5MGnV513RE6rM1QgdBau'),(10,'$2a$10$FsO8d7NgiUBSMl9Nmc8MDe');
/*!40000 ALTER TABLE `salt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_list`
--

DROP TABLE IF EXISTS `shopping_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_list` (
  `shopping_list_no` int NOT NULL AUTO_INCREMENT,
  `member_id` varchar(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` varchar(20) DEFAULT NULL,
  `checked` tinyint(1) DEFAULT (false),
  PRIMARY KEY (`shopping_list_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_list`
--

LOCK TABLES `shopping_list` WRITE;
/*!40000 ALTER TABLE `shopping_list` DISABLE KEYS */;
INSERT INTO `shopping_list` VALUES (1,'new0822@naver.com','딸기잼','5000',0),(2,'cndtjq145@naver.com','노브랜드 칠리 새우 400g','6580',0);
/*!40000 ALTER TABLE `shopping_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_list_product`
--

DROP TABLE IF EXISTS `shopping_list_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_list_product` (
  `shopping_list_no` int NOT NULL,
  `product_no` int NOT NULL,
  `quantity` int DEFAULT NULL,
  KEY `product_no` (`product_no`),
  KEY `shopping_list_no` (`shopping_list_no`),
  CONSTRAINT `shopping_list_product_ibfk_1` FOREIGN KEY (`product_no`) REFERENCES `product` (`product_no`),
  CONSTRAINT `shopping_list_product_ibfk_2` FOREIGN KEY (`shopping_list_no`) REFERENCES `shopping_list` (`shopping_list_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_list_product`
--

LOCK TABLES `shopping_list_product` WRITE;
/*!40000 ALTER TABLE `shopping_list_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_list_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish_list`
--

DROP TABLE IF EXISTS `wish_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish_list` (
  `wish_no` int NOT NULL AUTO_INCREMENT,
  `member_id` varchar(20) NOT NULL,
  `link` varchar(200) NOT NULL,
  `site_name` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `price` varchar(20) NOT NULL,
  PRIMARY KEY (`wish_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_list`
--

LOCK TABLES `wish_list` WRITE;
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
INSERT INTO `wish_list` VALUES (2,'cndtjq145@naver.com','https://www.coupang.com/vp/products/296011355?itemId=1096246769&vendorItemId=5617019683','쿠팡','곰곰 블루베리 (냉동), 1kg, 2개','12,650');
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-08 18:52:15
