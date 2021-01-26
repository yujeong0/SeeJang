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
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'[CJ] 비비고왕교자1.12kg','9480','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000025935885&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%B9%84%EB%B9%84%EA%B3%A0&srchPgNo=1&src_area=elist'),(2,'CJ 스팸 클래식 1,200g (200g*6입)','15980','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000009444837&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%8A%A4%ED%8C%B8&srchPgNo=1&src_area=elist'),(3,'동원참치 살코기 라이트스탠다드(135g×8) 1080g','14480','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000005328486&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%8F%99%EC%9B%90%EC%B0%B8%EC%B9%98&srchPgNo=1&src_area=elist'),(4,'피코크 정통 꿔바로우500g','6980','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000043378397&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%94%BC%EC%BD%94%ED%81%AC%20%EA%BF%94%EB%B0%94%EB%A1%9C%EC%9A%B0&srchPgNo=1&src_area=elist'),(5,'[팜덕] 훈제오리 600g','7500','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=0000008082162&siteNo=6001&salestrNo=2034&tlidSrchWd=%ED%8C%9C%EB%8D%95%20%ED%9B%88%EC%A0%9C%EC%98%A4%EB%A6%AC&srchPgNo=1&src_area=elist'),(6,'[노브랜드] 칠리 새우 400g','6580','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000025849254&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%85%B8%EB%B8%8C%EB%9E%9C%EB%93%9C%20%EC%B9%A0%EB%A6%AC%20%EC%83%88%EC%9A%B0&srchPgNo=1&src_area=elist'),(7,'[노브랜드] 쫀득한 치즈스틱 1kg','8980','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000019686834&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%85%B8%EB%B8%8C%EB%9E%9C%EB%93%9C%20%EC%B9%98%EC%A6%88%EC%8A%A4%ED%8B%B1&srchPgNo=1&src_area=elist'),(8,'얇은피꽉찬속 고기만두 400g*2','8480','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000032689577&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%96%87%EC%9D%80%ED%94%BC%20%EA%B3%A0%EA%B8%B0%EB%A7%8C%EB%91%90&srchPgNo=1&src_area=elist'),(9,'[CJ] 고메 바삭튀겨낸 통등심돈카츠450g','14480','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000034313770&siteNo=6001&salestrNo=2034&tlidSrchWd=%EA%B3%A0%EB%A9%94%20%EB%8F%88%EA%B0%80%EC%8A%A4&srchPgNo=1&src_area=elist'),(10,'CJ 비비고 구운주먹밥 김치치즈500g','6980','냉장/냉동','http://emart.ssg.com/item/itemView.ssg?itemId=1000045103444&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%B9%84%EB%B9%84%EA%B3%A0%20%EA%B9%80%EC%B9%98%EC%B9%98%EC%A6%88&srchPgNo=1&src_area=elist'),(11,'청정원 홍초 900ml(복분자)','6980','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=0000006872089&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%B2%AD%EC%A0%95%EC%9B%90%20%ED%99%8D%EC%B4%88&srchPgNo=1&src_area=elist'),(12,'여명808 (140ml2개)','8300','생수/음료','http://emart.ssg.com/item/itemView.ssg?itemId=0000006610022&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%97%AC%EB%AA%85808&srchPgNo=1&src_area=elist'),(13,'광동 비타500 100ml x 100병','38250','생수/음료',NULL),(14,'쁘띠첼 미초 청포도 900ml X 3개','14000','생수/음료',NULL),(15,'롯데 이프로 부족할때 350mlx20개','21770','생수/음료',NULL),(16,'토레타 500mlx24페트','27550','생수/음료',NULL),(17,'글라소 비타민워터 에너지 500ml 12개','17300','생수/음료',NULL),(18,'[트레비] 라임 300ml*20입','10780','생수/음료',NULL),(19,'[델몬트] 콜드 오렌지 과즙 100%(1.89L*2) 3.78L','7980','생수/음료',NULL),(20,'코카콜라 300ml*12PET','11480','생수/음료',NULL),(21,'삼립 아침엔 밀크 식빵 330g','2180','베이커리/잼',NULL),(22,'이삼립 발효미종 단팥&피자호빵8입 720g','6980','베이커리/잼',NULL),(23,'노브랜드스트로베리잼800g','4580','베이커리/잼',NULL),(24,'[삼립] 버터롤 클래식 21','3780','베이커리/잼',NULL),(25,'땅콩버터 청크 462g','6980','베이커리/잼',NULL),(26,'삼립 고구마호빵4입 360g','3280','베이커리/잼',NULL),(27,'[풀무원] 올바른 또띠아 우유(대) 225g','2980','베이커리/잼',NULL),(28,'[삼립] 버터롤 클래식 21','3780','베이커리/잼',NULL),(29,'[피코크] 미니고구마파이(생지) 292g','4980','베이커리/잼',NULL),(30,'노브랜드 헤이즐넛 초코크림 400g','3180','베이커리/잼',NULL),(31,'[청정원] 감식초 900ml','10300','양념/오일',NULL),(32,'Olitaria 오로엑스트라버진올리브오일500ml','14800','양념/오일',NULL),(33,'[CJ] 하선정 남해안 멸치 덧장 명품 액젓 2469ml (3kg)','18750','양념/오일',NULL),(34,'CJ 해찬들태양초고추장 2kg(쌀)','26000','양념/오일',NULL),(35,'친정엄마 매운고춧가루 200g','14000','양념/오일',NULL),(36,'[한라] 프리미엄 참치액 500ml','14300','양념/오일',NULL),(37,'샘표 연두 500ml(순)','9980','양념/오일',NULL),(38,'[청정원] 순창 재래식생된장 2kg','12500','양념/오일',NULL),(39,'[청정원] 까르보나라 파스타소스 350g','4780','양념/오일',NULL),(40,'노브랜드 볶음깨소금 250g','4180','양념/오일',NULL),(41,'당찬사과 4~11입/봉 (1.8kg)','4180','과일',NULL),(42,'냉동 블루베리 1.5kg/봉','10800','과일',NULL),(43,'고당도 샤인머스켓 청포도 1kg(2-3송이)','24900','과일',NULL),(44,'칠레산 생체리 700g (팩)','12500','과일',NULL),(45,'레드향 1.5kg/박스','15900','과일',NULL),(46,'멕시코산 아보카도 5입 1kg (망)','8680','과일',NULL),(47,'[미국산] 석류 3~5입/봉 (1.2kg 내외)','9900','과일',NULL),(48,'미국산 레몬10입 900g (봉)','5980','과일',NULL),(49,'대추방울토마토 750g/팩','6900','과일',NULL),(50,'금실딸기 500g/팩 (특)','15900','과일',NULL),(51,'[20년산] 이맛쌀 20kg','58900','쌀/잡곡',NULL),(52,'[노브랜드] 리얼 데일리너츠 400g (20g*20개입)','9980','쌀/잡곡',NULL),(53,'[노브랜드] 혼합 9곡 4kg','9980','쌀/잡곡',NULL),(54,'하루견과 블루베리 400g','9980','쌀/잡곡',NULL),(55,'군옥수수맛아몬드 210g','7480','쌀/잡곡',NULL),(56,'[노브랜드] 국내산 현미로 만든 스틱 미숫가루 600g','9980','쌀/잡곡',NULL),(57,'골든퀸현미 2kg','8980','쌀/잡곡',NULL),(58,'서리태 1.5kg','19800','쌀/잡곡',NULL),(59,'믹스넛 점보 프리미엄 1kg','33900','쌀/잡곡',NULL),(60,'[피코크]유기농 아몬드 미숫가루 500g','12980','쌀/잡곡',NULL),(61,'맥심 모카골드 커피믹스 160입','2230','커피/차',NULL),(62,'[동서] 둥글레차(1.2g*100티백) 120g','6640','커피/차',NULL),(63,'[맥심] 카누 마일드 로스트 아메리카노 미니 0.9g*100입','19000','커피/차',NULL),(64,'[스타벅스] 하우스 블렌드 분쇄 원두 200g','10900','커피/차',NULL),(65,'네스카페 돌체구스토 룽고 30캡슐','15900','커피/차',NULL),(66,'[담터] 호두,아몬드 율무차 100입 1,800g','21800','커피/차',NULL),(67,'[노브랜드] 자몽차 2kg','9480','커피/차',NULL),(68,'[맥심]카누더블샷라떼 50입 (13.5g*50개입)','19000','커피/차',NULL),(69,'[트와이닝] 잉글리쉬 블랙퍼스트 50g (2g*25티백)','6980','커피/차',NULL),(70,'피코크 마몰로 리치핫초코 600g','9980','커피/차',NULL),(71,'[매일] 앱솔루트 명작 2단계 800G','19920','우유/유제품',NULL),(72,'서울우유 1000ml 나100%','19920','우유/유제품',NULL),(73,'[서울우유] 체다 슬라이스 치즈(300g2개입) 600g','7190','우유/유제품',NULL),(74,'[서울우유] 비요뜨 초코링 (143g*2개)','2550','우유/유제품',NULL),(75,'[빙그레] 바나나맛 우유(240ml4개) 960ml','4580','우유/유제품',NULL),(76,'[서울우유] 프레시 버터 80g*3입','6080','우유/유제품',NULL),(77,'[요플레] 클래식 플레인 (85g4개)','2800','우유/유제품',NULL),(78,'[매일] 소화가 잘되는 멸균우유 (190ml16)','11180','우유/유제품',NULL),(79,'소와나무 이태리안피자치즈 800g','11980','우유/유제품',NULL),(80,'압타밀 프로누트라 어드밴스 1단계 800g','28900','우유/유제품',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-26 15:49:47
