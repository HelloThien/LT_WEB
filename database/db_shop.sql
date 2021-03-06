-- MySQL dump 10.15  Distrib 10.0.34-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: phanvantam_shop
-- ------------------------------------------------------
-- Server version	10.0.34-MariaDB

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
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_category` (
  `cat_id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `parent_id` int(5) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '2',
  `create_at` int(10) NOT NULL,
  `create_by` int(1) NOT NULL,
  `modify_at` int(11) NOT NULL,
  `modify_by` int(11) NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `create_by` (`create_by`),
  KEY `modify_by` (`modify_by`),
  CONSTRAINT `tbl_category_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `tbl_category_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` (`cat_id`, `title`, `slug`, `parent_id`, `type`, `active`, `create_at`, `create_by`, `modify_at`, `modify_by`) VALUES (10,'??i???n tho???i','dien-thoai',0,2,1,1512296644,1,1513937169,1),(11,'??i???n tho???i iPhone','dien-thoai-iphone',10,2,1,1512614886,1,1513062151,1),(12,'M??y t??nh','may-tinh',0,2,1,1513096449,1,1513096449,1),(13,'C??ng ngh???','cong-nghe',0,1,1,1513183416,1,1513936783,1),(14,'Tin t???c','tin-tuc',13,1,1,1513183490,1,1513936639,1),(15,'??i???n tho???i OPPO','dien-thoai-oppo',10,2,1,1513254068,1,1513254779,1);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `buy` int(1) NOT NULL DEFAULT '0',
  `code_active` varchar(32) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_vietnamese_ci,
  `subcribe` int(1) NOT NULL DEFAULT '0',
  `create_at` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer`
--

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer` (`customer_id`, `fullname`, `email`, `address`, `phone`, `buy`, `code_active`, `note`, `subcribe`, `create_at`) VALUES (7,'Phan V??n Huy','phantam.t10@gmail.co','T??n Y??n - B???c Giang ','01656788365',1,'','',1,1513859014),(8,'Phan V??n T??m   ','phantam.t10@gmail.com','Ph?? ???? - Nam T??? Li??m - H?? N???i','01656788365',0,'','',1,1515571390),(9,NULL,'vuvanxuan195@gmail.com',NULL,NULL,0,'3772facf7eaae060c1a23f5dc62cdcde',NULL,0,0);
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detail_order`
--

DROP TABLE IF EXISTS `tbl_detail_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_detail_order` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `connect_product` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `oreder_id` (`order_id`),
  CONSTRAINT `tbl_detail_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detail_order`
--

LOCK TABLES `tbl_detail_order` WRITE;
/*!40000 ALTER TABLE `tbl_detail_order` DISABLE KEYS */;
INSERT INTO `tbl_detail_order` (`detail_id`, `name`, `price`, `qty`, `total_price`, `connect_product`, `order_id`) VALUES (85,'Laptop HP Probook 440 G2 LED Backlit',13230000,1,13230000,7,1),(86,'Motorola Moto G5S Plus',6990000,1,6990000,11,2),(87,'??i???n tho???i iPhone 8 64G',20990000,1,20990000,5,3),(88,'??i???n tho???i iPhone 8 64G',20990000,2,41980000,5,4),(89,'Laptop HP Probook 440',9000000,1,9000000,6,4),(90,'Laptop HP Probook 440 G2 LED Backlit',13230000,1,13230000,7,5);
/*!40000 ALTER TABLE `tbl_detail_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_filter`
--

DROP TABLE IF EXISTS `tbl_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type` int(1) NOT NULL COMMENT '1=>filter by price .2=> filter by category',
  `max_price` int(11) DEFAULT NULL,
  `min_price` int(11) DEFAULT '0',
  `cat_id` int(11) DEFAULT NULL,
  `create_at` int(12) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '2',
  `create_by` int(11) NOT NULL,
  `modify_at` int(12) NOT NULL,
  `modify_by` int(11) NOT NULL,
  PRIMARY KEY (`filter_id`),
  KEY `cat_id` (`cat_id`),
  KEY `create_by` (`create_by`),
  KEY `modify_by` (`modify_by`),
  CONSTRAINT `tbl_filter_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `tbl_filter_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `tbl_filter_ibfk_3` FOREIGN KEY (`cat_id`) REFERENCES `tbl_category` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_filter`
--

LOCK TABLES `tbl_filter` WRITE;
/*!40000 ALTER TABLE `tbl_filter` DISABLE KEYS */;
INSERT INTO `tbl_filter` (`filter_id`, `title`, `type`, `max_price`, `min_price`, `cat_id`, `create_at`, `active`, `create_by`, `modify_at`, `modify_by`) VALUES (11,'T??? 1.000.000?? ?????n 5.000.000??',1,5000000,1000000,NULL,1512573657,1,1,1515631537,1),(13,'M??y t??nh',2,NULL,NULL,12,1512573802,1,1,1513361285,1),(14,'??i???n tho???i',2,NULL,NULL,10,1513137088,1,1,1513937289,1),(22,'T??? 5.000.000 ?????n 10.000.000',1,10000000,5000000,NULL,1515631367,1,1,1515631367,1),(23,'T??? 10.000.000 ?????n 15.000.000',1,15000000,10000000,NULL,1515631491,1,1,1515631491,1);
/*!40000 ALTER TABLE `tbl_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_history`
--

DROP TABLE IF EXISTS `tbl_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `happen_at` int(11) NOT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_history`
--

LOCK TABLES `tbl_history` WRITE;
/*!40000 ALTER TABLE `tbl_history` DISABLE KEYS */;
INSERT INTO `tbl_history` (`history_id`, `content`, `type`, `user_id`, `parent_id`, `happen_at`) VALUES (13,NULL,'login',1,0,1513650734),(15,NULL,'login',1,0,1513656051),(16,NULL,'login',3,0,1513668415),(17,NULL,'login',1,0,1513668427),(18,NULL,'login',3,0,1513668689),(19,NULL,'login',1,0,1513677246),(20,NULL,'login',1,0,1513692663),(21,NULL,'login',3,0,1513697524),(22,NULL,'login',1,0,1513753441),(23,NULL,'login',1,0,1513764499),(24,NULL,'login',1,0,1513778611),(25,NULL,'login',1,0,1513836712),(26,NULL,'login',1,0,1513913535),(27,NULL,'login',1,0,1513929267),(29,'X??a th??nh c??ng Menu : M??y t??nh.T???o ng??y 18/12/2017','drop',1,27,1513933597),(30,'X??a th??nh c??ng Menu : Trang ch???.T???o ng??y 20/12/2017','drop',1,27,1513933604),(31,'X??a th??nh c??ng Menu : Li??n h???.T???o ng??y 07/12/2017','drop',1,27,1513933612),(32,'X??a th??nh c??ng Menu : H??m nay.T???o ng??y 07/12/2017','drop',1,27,1513933617),(33,'X??a th??nh c??ng Menu : Trang ch???.T???o ng??y 07/12/2017','drop',1,27,1513933627),(34,'C???p nh???p th??nh c??ng Menu : ??i???n tho???i','edit',1,27,1513933827),(35,'Th??m th??nh c??ng Menu : Li??n ','add',1,27,1513933891),(37,'???? ????a trang : Why do we use it v??o th??ng r??c ','edit',1,27,1513935078),(38,'???? c???p nh???p danh m???c : C??ng ngh???','edit',1,27,1513936783),(39,'X??a th??nh c??ng danh m???c : \"dxc\" .???????c t???o l??c ','drop',1,27,1513937025),(40,'???? c???p nh???p danh m???c : ??i???n tho???i','edit',1,27,1513937169),(41,'???? ????a b??? l???c :  v??o th??ng r??c ','drop',1,27,1513937707),(42,'???? ????a b??? l???c : M??y t??nh v??o th??ng r??c ','drop',1,27,1513937758),(43,'???? ????a b??? l???c : 1.000.000?? - 2.000.000?? v??o th??ng r??c ','drop',1,27,1513937896),(44,'???? ????a b??? l???c : ??i???n tho???i v??o th??ng r??c ','drop',1,27,1513937913),(45,'???? ????a b??i vi???t : \' OPPO A83 r?? r??? th??ng s??? c???u h??nh s??? d???ng b???o m???t khu??n m???t \' v??o th??ng r??c . ','drop',1,27,1513938820),(46,'C???p nh???p b??i vi???t : \'\' ','edit',1,27,1513939616),(47,'C???p nh???p b??i vi???t : \'\' ','edit',1,27,1513939760),(48,'C???p nh???p b??i vi???t : \'\' ','edit',1,27,1513939775),(49,'C???p nh???p b??i vi???t : \'Section 11033 of de Finibus Bonorum et Malorum written by Cicero in 45 BC\' ','edit',1,27,1513940140),(50,'???? ????a b??i vi???t : \' Section 11033 of de Finibus Bonorum et Malorum written by Cicero in 45 BC \' v??o th??ng r??c . ','drop',1,27,1513940246),(51,'???? x??a b??i vi???t : \' Section 11033 of de Finibus Bonorum et Malorum written by Cicero in 45 BC \' .???????c t???o l??c 15/12/2017','drop',1,27,1513940523),(52,NULL,'login',1,0,1513952123),(59,'???? ????a s???n ph???m : \' HTC U Ultra Sapphire \' v??o th??ng r??c ','drop',1,52,1513953013),(60,'???? ????a s???n ph???m : \' Sony Xperia XA Ultra \' v??o th??ng r??c ','drop',1,52,1513953132),(61,'???? ????a s???n ph???m : \' HTC U Ultra Sapphire \' v??o th??ng r??c ','drop',1,52,1513953154),(62,'???? ????a s???n ph???m : \' Huawei Nova 2i \' v??o th??ng r??c ','drop',1,52,1513953154),(63,'???? ????a s???n ph???m : \' Sony Xperia XA Ultra \' v??o th??ng r??c ','drop',1,52,1513953154),(64,'C???p nh???p b??i vi???t : \'OPPO A83 r?? r??? th??ng s??? c???u h??nh s??? d???ng b???o m???t khu??n m???t\' ','edit',1,52,1513953229),(65,NULL,'login',1,0,1513956365),(66,NULL,'login',5,0,1513956397),(67,NULL,'login',1,0,1513956622),(68,NULL,'login',5,0,1513958288),(69,NULL,'login',1,0,1513958323),(70,NULL,'login',1,0,1513958358),(71,NULL,'login',5,0,1513959731),(72,'Th??m b??i vi???t : \'??i???n tho???i c?? b???n h??? tr??? 4G c???a Nokia v???a ?????t ch???ng nh???n Bluetooth\' ','add',5,71,1513960290),(73,'C???p nh???p b??i vi???t : \'??i???n tho???i c?? b???n h??? tr??? 4G c???a Nokia v???a ?????t ch???ng nh???n Bluetooth\' ','edit',5,71,1513960503),(74,NULL,'login',1,0,1513961181),(75,NULL,'login',6,0,1513961220),(76,NULL,'login',6,0,1513963303),(78,NULL,'login',1,0,1514029783),(79,NULL,'login',1,0,1514100289),(80,NULL,'login',1,0,1514711516),(81,NULL,'login',1,0,1514711519),(82,NULL,'login',1,0,1514711520),(83,NULL,'login',1,0,1514711522),(84,NULL,'login',1,0,1514711682),(85,NULL,'login',1,0,1514727512),(87,'???? ????a b??i vi???t : \' ??i???n tho???i c?? b???n h??? tr??? 4G c???a Nokia v???a ?????t ch???ng nh???n Bluetooth \' v??o th??ng r??c . ','drop',1,85,1514734871),(88,'???? ????a b??i vi???t : \' OPPO A83 r?? r??? th??ng s??? c???u h??nh s??? d???ng b???o m???t khu??n m???t \' v??o th??ng r??c . ','drop',1,85,1514735072),(89,'???? ????a b??i vi???t : \' ??i???n tho???i c?? b???n h??? tr??? 4G c???a Nokia v???a ?????t ch???ng nh???n Bluetooth \' v??o th??ng r??c . ','drop',1,85,1514735072),(90,'???? ????a s???n ph???m : \' Sony Xperia XA Ultra \' v??o th??ng r??c ','drop',1,85,1514738148),(92,'???? ????a s???n ph???m : \' Huawei Nova 2i \' v??o th??ng r??c ','drop',1,85,1514738243),(93,'???? ????a s???n ph???m : \' Sony Xperia XA Ultra \' v??o th??ng r??c ','drop',1,85,1514738243),(94,'???? ????a s???n ph???m : \' Samsung Galaxy A5 \' v??o th??ng r??c ','drop',1,85,1514738243),(95,'???? ????a s???n ph???m : \' Motorola Moto G5S Plus \' v??o th??ng r??c ','drop',1,85,1514738243),(96,'???? ????a s???n ph???m : \' Laptop HP Probook 440 \' v??o th??ng r??c ','drop',1,85,1514738243),(97,'???? ????a s???n ph???m : \' Laptop HP Probook 440 G2 LED \' v??o th??ng r??c ','drop',1,85,1514738243),(98,'???? ????a s???n ph???m : \' Laptop HP Probook 440 G2 LED Backlit \' v??o th??ng r??c ','drop',1,85,1514738243),(99,'???? ????a s???n ph???m : \' Laptop HP Probook 440 \' v??o th??ng r??c ','drop',1,85,1514738243),(100,'???? ????a s???n ph???m : \' ??i???n tho???i iPhone 8 64G \' v??o th??ng r??c ','drop',1,85,1514738243),(101,NULL,'login',1,0,1514768070),(102,NULL,'login',1,0,1514773453),(103,'???? ????a b??? l???c : ??i???n tho???i v??o th??ng r??c ','drop',1,102,1514775818),(104,'???? ????a b??? l???c : ??i???n tho???i v??o th??ng r??c ','drop',1,102,1514775857),(105,NULL,'login',5,0,1514793340),(106,NULL,'login',1,0,1514944058),(107,NULL,'login',1,0,1515196489),(108,NULL,'login',1,0,1515229584),(109,NULL,'login',1,0,1515574108),(110,'C???p nh???p th??nh c??ng Menu : ??i???n tho???i','edit',1,109,1515574979),(111,'C???p nh???p th??nh c??ng Menu : ??i???n tho???i iPhone','edit',1,109,1515574982),(112,NULL,'login',1,0,1515583589),(113,NULL,'login',1,0,1515583589),(114,'C???p nh???p th??nh c??ng Menu : ??i???n tho???i','edit',1,113,1515583694),(115,'C???p nh???p th??nh c??ng Menu : ??i???n tho???i iPhone','edit',1,113,1515583735),(116,'Th??m th??nh c??ng Menu : Tablet','add',1,113,1515584687),(117,'C???p nh???p th??nh c??ng Menu : Tablet','edit',1,113,1515584764),(118,'X??a th??nh c??ng Menu : Li??n .T???o ng??y 22/12/2017','drop',1,113,1515584778),(119,'Th??m th??nh c??ng Menu : ??i???n tho???i','add',1,113,1515584830),(120,'X??a th??nh c??ng Menu : Trang ch???.T???o ng??y 15/12/2017','drop',1,113,1515584866),(121,'Th??m th??nh c??ng Menu : Trang ch???','add',1,113,1515584898),(122,'Th??m th??nh c??ng Menu : Trang ch???','add',1,113,1515584958),(123,'Th??m th??nh c??ng Menu : M??y t??nh','add',1,113,1515585017),(124,'C???p nh???p th??nh c??ng Menu : Trang ch???','edit',1,113,1515585040),(125,'C???p nh???p th??nh c??ng Menu : ??i???n tho???i','edit',1,113,1515585056),(126,'C???p nh???p th??nh c??ng Menu : M??y t??nh','edit',1,113,1515585064),(127,'C???p nh???p th??nh c??ng Menu : Tablet','edit',1,113,1515585074),(128,'C???p nh???p th??nh c??ng Menu : Tin t???c','edit',1,113,1515585082),(129,'Th??m th??nh c??ng Menu : Tai nghe','add',1,113,1515585611),(130,'Th??m th??nh c??ng Menu : Tin t???c','add',1,113,1515585645),(131,'Th??m th??nh c??ng Menu : ??i???n tho???i OPPO','add',1,113,1515585696),(132,NULL,'login',1,0,1515627584),(133,'Th??m th??nh c??ng Menu : ??i???n tho???i','add',1,132,1515627849),(134,'Th??m th??nh c??ng Menu : ??i???n tho???i OPPO','add',1,132,1515627886),(135,'Th??m th??nh c??ng Menu : ??i???n tho???i iPhone','add',1,132,1515627981),(136,'Th??m th??nh c??ng Menu : M??y t??nh','add',1,132,1515628008),(137,'Th??m th??nh c??ng Menu : Tablet','add',1,132,1515628036),(138,'Th??m th??nh c??ng Menu : Tai nghe','add',1,132,1515628065),(139,'Th??m s???n ph???m : \' ??i???n tho???i Samsung Galaxy J7 Pro \'','add',1,132,1515629614),(140,'C???p nh???p s???n ph???m : \' ??i???n tho???i Samsung Galaxy J7 Pro \'','edit',1,132,1515629868),(141,'C???p nh???p s???n ph???m : \' ??i???n tho???i Samsung Galaxy J7 Pro \'','edit',1,132,1515629925),(142,'C???p nh???p s???n ph???m : \' HTC U Ultra Sapphire \'','edit',1,132,1515629961),(143,'C???p nh???p s???n ph???m : \' HTC U Ultra Sapphire \'','edit',1,132,1515630147),(144,'C???p nh???p s???n ph???m : \' ??i???n tho???i Samsung Galaxy J7 Pro \'','edit',1,132,1515630175),(145,'???? th??m b??? l???c : T??? 5.000.000 ?????n 10.000.000','add',1,132,1515631233),(146,'???? th??m b??? l???c : T??? 5.000.000 ?????n 10.000.000','add',1,132,1515631256),(147,'???? th??m b??? l???c : T??? 5.000.000 ?????n 10.000.000','add',1,132,1515631283),(148,'???? th??m b??? l???c : T??? 5.000.000 ?????n 10.000.000','add',1,132,1515631294),(149,'???? th??m b??? l???c : T??? 5.000.000 ?????n 10.000.000','add',1,132,1515631296),(150,'???? th??m b??? l???c : T??? 5.000.000 ?????n 10.000.000','add',1,132,1515631329),(151,'???? th??m b??? l???c : T??? 5.000.000 ?????n 10.000.000','add',1,132,1515631341),(152,'???? th??m b??? l???c : T??? 5.000.000 ?????n 10.000.000','add',1,132,1515631367),(153,'???? ????a b??? l???c : T??? 5.000.000 ?????n 10.000.000 v??o th??ng r??c ','drop',1,132,1515631374),(154,'???? ????a b??? l???c : T??? 5.000.000 ?????n 10.000.000 v??o th??ng r??c ','drop',1,132,1515631399),(155,'???? x??a b??? l???c : \' T??? 5.000.000 ?????n 10.000.000 \'.???????c t???o l??c 11/01/2018','drop',1,132,1515631408),(156,'???? th??m b??? l???c : T??? 10.000.000 ?????n 15.000.000','add',1,132,1515631491),(157,'???? c???p nh???p b??? l???c : T??? 1.000.000?? ?????n 5.000.000??','edit',1,132,1515631537),(158,NULL,'login',1,0,1515719602),(159,NULL,'login',1,0,1516176171),(160,NULL,'login',5,0,1516759160),(161,NULL,'login',5,0,1517215735),(162,NULL,'login',1,0,1517239025),(163,NULL,'login',1,0,1517302360),(164,NULL,'login',1,0,1517404680),(165,NULL,'login',1,0,1517468288),(166,'C???p nh???p s???n ph???m : \' ??i???n tho???i Samsung Galaxy J7 Pro \'','edit',1,165,1517468312),(167,NULL,'login',1,0,1517477448),(168,NULL,'login',1,0,1517539383),(169,NULL,'login',1,0,1517547205),(170,NULL,'login',1,0,1517556400),(171,'Th??m th??nh c??ng Menu : li??n h???','add',1,170,1517560846),(172,'X??a th??nh c??ng Menu : li??n h???.T???o ng??y 02/02/2018','drop',1,170,1517561064),(173,NULL,'login',1,0,1517562158),(174,NULL,'login',1,0,1518145602),(175,NULL,'login',1,0,1518178618),(176,NULL,'login',1,0,1519380707),(177,NULL,'login',1,0,1519445955),(178,NULL,'login',1,0,1519614731),(179,NULL,'login',1,0,1519639312),(180,NULL,'login',1,0,1519722931),(199,NULL,'login',1,0,1519831172),(200,'Th??m th??nh c??ng trang : ggggg','add',1,199,1519836243),(201,'Th??m trang : ggggg','add',1,199,1519836244),(202,'???? ????a trang : \" ggggg \" v??o th??ng r??c ','edit',1,199,1519836253),(203,'???? ????a trang : \" ggggg \" v??o th??ng r??c ','edit',1,199,1519836284),(204,'???? ????a trang : \" ggggg \" v??o th??ng r??c ','edit',1,199,1519836290),(205,NULL,'login',1,0,1519843465),(206,NULL,'login',1,0,1519915330),(207,NULL,'login',1,0,1519976054),(208,'???? ????a trang : \" Where does it come from \" v??o th??ng r??c ','edit',1,207,1519976100),(209,NULL,'login',1,0,1520007795),(210,NULL,'login',1,0,1520085555),(211,NULL,'login',1,0,1520101378),(212,'Th??m th??nh c??ng trang : gi???i thi???u','add',1,211,1520149189),(213,'Th??m trang : gi???i thi???u','add',1,211,1520149189),(214,'Th??m th??nh c??ng Menu : abcxyz','add',1,211,1520149283),(215,'Th??m th??nh c??ng Menu : ??sssasas','add',1,211,1520149379),(216,'X??a th??nh c??ng Menu : ??sssasas.T???o ng??y 04/03/2018','drop',1,211,1520149441),(217,'X??a th??nh c??ng Menu : abcxyz.T???o ng??y 04/03/2018','drop',1,211,1520149447),(218,'Th??m th??nh c??ng Menu : abcxyz','add',1,211,1520149699),(219,'X??a th??nh c??ng Menu : abcxyz.T???o ng??y 04/03/2018','drop',1,211,1520149761),(220,'Th??m th??nh c??ng Menu : abcxyz','add',1,211,1520149777),(221,'X??a th??nh c??ng Menu : abcxyz.T???o ng??y 04/03/2018','drop',1,211,1520149821),(222,'Th??m th??nh c??ng Menu : abcxyz','add',1,211,1520149854),(223,'X??a th??nh c??ng Menu : abcxyz.T???o ng??y 04/03/2018','drop',1,211,1520149937),(224,'Th??m th??nh c??ng Menu : abcxyz','add',1,211,1520149954),(225,'Th??m th??nh c??ng Menu : v??? trang ch???','add',1,211,1520151753),(226,'X??a th??nh c??ng Menu : v??? trang ch???.T???o ng??y 04/03/2018','drop',1,211,1520151845),(227,'X??a th??nh c??ng Menu : abcxyz.T???o ng??y 04/03/2018','drop',1,211,1520151851),(228,'Th??m th??nh c??ng Menu : abcxyz','add',1,211,1520156297),(229,'Th??m th??nh c??ng Menu : ??sssasas','add',1,211,1520156346),(230,'X??a th??nh c??ng Menu : abcxyz.T???o ng??y 04/03/2018','drop',1,211,1520156409),(231,'X??a th??nh c??ng Menu : ??sssasas.T???o ng??y 04/03/2018','drop',1,211,1520156414),(232,NULL,'login',1,0,1520181951),(233,'X??a th??nh c??ng Menu : ??i???n tho???i OPPO.T???o ng??y 11/01/2018','drop',1,232,1520181982),(234,'Th??m th??nh c??ng Menu : ??i???n tho???i sam sung','add',1,232,1520182017),(235,NULL,'login',1,0,1520217854),(236,NULL,'login',5,0,1520217880);
/*!40000 ALTER TABLE `tbl_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_media`
--

DROP TABLE IF EXISTS `tbl_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_media` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `caption` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `id_connect` int(11) DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '2',
  `type` int(1) NOT NULL,
  `create_at` int(11) NOT NULL,
  `create_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`media_id`),
  KEY `id_connect` (`id_connect`),
  KEY `create_by` (`create_by`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_media`
--

LOCK TABLES `tbl_media` WRITE;
/*!40000 ALTER TABLE `tbl_media` DISABLE KEYS */;
INSERT INTO `tbl_media` (`media_id`, `url`, `title`, `caption`, `id_connect`, `active`, `type`, `create_at`, `create_by`) VALUES (1,'public/images/sytem/post.jpg','???nh m???c ?????nh cho b??i vi???t',NULL,0,3,3,999999999,1),(2,'public/images/sytem/product.jpg','???nh m???c ?????nh cho s???n ph???m',NULL,0,3,2,999999999,1),(3,'public/images/sytem/avatar.jpg','???nh m???c ?????nh cho ng?????i d??ng ','???nh m???c ?????nh cho ng?????i d??ng ',0,3,1,11111111,1),(178,'public/images/post/bai1.jpg','bai1','undefined',6,1,2,1512295082,1),(180,'public/images/post/bai3.jpg','bai3','undefined',8,1,2,1512295815,1),(184,'public/images/product/product(copy-1).png','Product','undefined',1,1,3,1512296605,1),(186,'public/images/product/product(copy-5).jpg','Product','undefined',1,1,3,1512296757,1),(216,'public/images/product/product.jpg','Product','undefined',1,1,3,1512446214,1),(220,'public/images/product/product(copy-2).jpg','Product','undefined',1,1,3,1512449268,1),(222,'public/images/product/product(copy-1).jpg','Product','undefined',1,1,3,1512456009,1),(231,'public/images/product/product.png','Product','undefined',1,1,3,1512469668,1),(241,'public/images/avatar/phan-van-khuong(copy-1).png','Phan V??n Kh????ng','undefined',1,1,1,1512844286,1),(250,'public/images/product/slider-250.png','Slider 250','L??? h???i Sam sung tr??? g??p',15,1,3,1512925584,1),(251,'public/images/product/slider-2(copy-1).png','Slider 2','Q??a t???ng h???p d???n t??? OPPO',16,1,3,1512990105,1),(252,'public/images/product/dien-thoai-iphone-x-64gb(copy-5).png','??i???n tho???i iPhone X 64GB','undefined',4,1,3,1513061962,1),(253,'public/images/product/dien-thoai-iphone-x-64gb(copy-4).png','??i???n tho???i iPhone X 64GB','undefined',4,1,3,1513061969,1),(254,'public/images/product/dien-thoai-iphone-x-64gb(copy-3).png','??i???n tho???i iPhone X 64GB','undefined',4,1,3,1513061981,1),(255,'public/images/product/dien-thoai-iphone-x-64gb(copy-2).png','??i???n tho???i iPhone X 64GB','undefined',4,1,3,1513061996,1),(256,'public/images/product/dien-thoai-iphone-x-64gb(copy-1).png','??i???n tho???i iPhone X 64GB','undefined',4,1,3,1513062005,1),(257,'public/images/product/dien-thoai-iphone-8-64g.png','??i???n tho???i iPhone 8 64G','undefined',5,1,3,1513062246,1),(258,'public/images/product/dien-thoai-iphone-8-64gb(copy-3).png','??i???n tho???i iPhone 8 64GB','undefined',5,1,3,1513062264,1),(259,'public/images/product/dien-thoai-iphone-8-64gb(copy-2).png','??i???n tho???i iPhone 8 64GB','undefined',5,1,3,1513062269,1),(260,'public/images/product/dien-thoai-iphone-8-64gb(copy-1).png','??i???n tho???i iPhone 8 64GB','undefined',5,1,3,1513062274,1),(261,'public/images/product/mien-phi-van-chuyen(copy-1).png','Mi???n ph?? v???n chuy???n','undefined',1,1,3,1513100331,1),(265,'public/images/post/oppo-a83-ro-ri-thong-so-cau-hinh-su-dung-bao-mat-khuon-mat(copy-1).png','OPPO A83 r?? r??? th??ng s??? c???u h??nh s??? d???ng b???o m???t khu??n m???t','undefined',1,1,2,1513183552,1),(266,'public/images/product/dien-thoai-iphone-x-64gb(copy-7).png','??i???n tho???i iPhone X 64GB','undefined',4,1,3,1513353408,1),(267,'public/images/product/dien-thoai-iphone-x-64gb(copy-6).png','??i???n tho???i iPhone X 64GB','undefined',4,1,3,1513353434,1),(268,'public/images/product/dien-thoai-iphone-x-64gb.png','??i???n tho???i iPhone X 64GB','undefined',4,1,3,1513353440,1),(273,'public/images/avatar/phan-van-khuong.png','Phan V??n Kh????ng','undefined',1,1,1,1513495703,1),(274,'public/images/product/laptop-hp-probook-440.png','Laptop HP Probook 440','undefined',6,1,3,1513550174,1),(275,'public/images/product/what-is-lorem-ipsum(copy-2).png','What is Lorem Ipsum','undefined',6,1,3,1513550180,1),(276,'public/images/product/what-is-lorem-ipsum(copy-1).png','What is Lorem Ipsum','undefined',6,1,3,1513550190,1),(277,'public/images/product/laptop-hp-probook-440-g2-led-backlit.png','Laptop HP Probook 440 G2 LED Backlit','undefined',7,1,3,1513550830,1),(278,'public/images/product/laptop-hp-probook-440-g2-led-backlit(copy-5).png','Laptop HP Probook 440 G2 LED Backlit','undefined',7,1,3,1513550836,1),(279,'public/images/product/laptop-hp-probook-440-g2-led-backlit(copy-4).png','Laptop HP Probook 440 G2 LED Backlit','undefined',7,1,3,1513550843,1),(280,'public/images/product/laptop-hp-probook-440-g2-led-backlit(copy-3).png','Laptop HP Probook 440 G2 LED Backlit','undefined',7,1,3,1513550849,1),(281,'public/images/product/laptop-hp-probook-440-g2-led-backlit(copy-2).png','Laptop HP Probook 440 G2 LED Backlit','undefined',7,1,3,1513550864,1),(282,'public/images/product/laptop-hp-probook-440-g2-led-backlit(copy-1).png','Laptop HP Probook 440 G2 LED Backlit','undefined',7,1,3,1513550872,1),(283,'public/images/product/laptop-hp-probook-440-g2-led(copy-1).png','Laptop HP Probook 440 G2 LED','undefined',8,1,3,1513551001,1),(288,'public/images/product/laptop-hp-probook-440(copy-4).png','Laptop HP Probook 440','undefined',9,1,3,1513551643,1),(289,'public/images/product/laptop-hp-probook-440(copy-3).png','Laptop HP Probook 440','undefined',9,1,3,1513551648,1),(290,'public/images/product/laptop-hp-probook-440(copy-2).png','Laptop HP Probook 440','undefined',9,1,3,1513551679,1),(297,'public/images/product/thanh-toan-nhanh(copy-1).png','Thanh to??n nhanh','undefined',4,1,3,1513697637,1),(298,'public/images/product/dat-hang-online(copy-1).png','?????t h??ng online','undefined',5,1,3,1513697680,1),(299,'public/images/product/motorola-moto-g5s-plus(copy-5).png','Motorola Moto G5S Plus','undefined',11,1,3,1513698568,1),(300,'public/images/product/motorola-moto-g5s-plus.png','Motorola Moto G5S Plus','undefined',11,1,3,1513698569,1),(301,'public/images/product/motorola-moto-g5s-plus(copy-4).png','Motorola Moto G5S Plus','undefined',11,1,3,1513698574,1),(302,'public/images/product/motorola-moto-g5s-plus(copy-3).png','Motorola Moto G5S Plus','undefined',11,1,3,1513698579,1),(303,'public/images/product/motorola-moto-g5s-plus(copy-2).png','Motorola Moto G5S Plus','undefined',11,1,3,1513698586,1),(304,'public/images/product/motorola-moto-g5s-plus(copy-1).png','Motorola Moto G5S Plus','undefined',11,1,3,1513698595,1),(305,'public/images/product/samsung-galaxy-a5.png','Samsung Galaxy A5','undefined',12,1,3,1513698696,1),(306,'public/images/product/sony-xperia-xa-ultra.png','Sony Xperia XA Ultra','undefined',13,1,3,1513700052,1),(307,'public/images/product/huawei-nova-2i.png','Huawei Nova 2i','undefined',15,1,3,1513700264,1),(308,'public/images/product/htc-u-ultra-sapphire.png','HTC U Ultra Sapphire','undefined',16,1,3,1513700659,1),(309,'public/images/product/htc-u-ultra-sapphire(copy-5).png','HTC U Ultra Sapphire','undefined',16,1,3,1513700665,1),(310,'public/images/product/htc-u-ultra-sapphire(copy-4).png','HTC U Ultra Sapphire','undefined',16,1,3,1513700669,1),(311,'public/images/product/htc-u-ultra-sapphire(copy-3).png','HTC U Ultra Sapphire','undefined',16,1,3,1513700673,1),(312,'public/images/product/htc-u-ultra-sapphire(copy-2).png','HTC U Ultra Sapphire','undefined',16,1,3,1513700677,1),(313,'public/images/product/htc-u-ultra-sapphire(copy-1).png','HTC U Ultra Sapphire','undefined',16,1,3,1513700681,1),(314,'public/images/post/dien-thoai-co-ban-ho-tro-4g-cua-nokia-vua-dat-chung-nhan-bluetooth(copy-1).png','??i???n tho???i c?? b???n h??? tr??? 4G c???a Nokia v???a ?????t ch???ng nh???n Bluetooth','undefined',2,1,2,1513960285,5),(315,'public/images/product/mien-phi-van-chuyen(copy-1).png','Mi???n ph?? v???n chuy???n',NULL,5,1,3,1515574694,1),(316,'public/images/product/samsung.png','Samsung','',1,1,3,1515586065,1),(317,'public/images/product/tra-gop-sam-sung.png','Tr??? g??p Sam sung','',2,1,3,1515586205,1),(318,'public/images/product/thanh-toan-nhanh.png','Thanh to??n nhanh',NULL,6,1,3,1515629046,1),(319,'public/images/product/tiet-kiem-hon.png','Ti???t ki???m h??n',NULL,7,1,3,1515629094,1),(320,'public/images/product/tu-van-247(copy-1).png','T?? v???n 24/7',NULL,8,1,3,1515629151,1),(321,'public/images/product/dat-hang-online.png','?????t h??ng online',NULL,9,1,3,1515629218,1),(322,'public/images/product/dien-thoai-samsung-galaxy-j7-pro(copy-1).png','??i???n tho???i Samsung Galaxy J7 Pro',NULL,17,1,3,1515629608,1),(323,'public/images/product/3499704f027336546022b340f1e45304.jpg',NULL,NULL,0,2,3,1517468300,1),(324,'public/images/product/dien-thoai-samsung-galaxy-j7-pro.png','??i???n tho???i Samsung Galaxy J7 Pro',NULL,17,1,3,1517468311,1),(325,'public/images/product/5b00c11f36a0a3a3656165c704773c2c.jpg',NULL,NULL,0,2,3,1517547215,1);
/*!40000 ALTER TABLE `tbl_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 => page .2 => cat_post. 3 => cat_product',
  `connect_to` int(11) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '2',
  `link` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `location` int(1) NOT NULL COMMENT '1=> header . 2=> footer 3- sidebar 4-> response',
  `ordinal` int(2) NOT NULL,
  `create_at` int(12) NOT NULL,
  `modify_at` int(12) NOT NULL,
  `create_by` int(11) NOT NULL,
  `modify_by` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `modify_by` (`modify_by`),
  KEY `create_by` (`create_by`),
  CONSTRAINT `tbl_menu_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `tbl_menu_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menu`
--

LOCK TABLES `tbl_menu` WRITE;
/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
INSERT INTO `tbl_menu` (`menu_id`, `title`, `type`, `connect_to`, `parent_id`, `active`, `link`, `location`, `ordinal`, `create_at`, `modify_at`, `create_by`, `modify_by`) VALUES (3,'Ch??nh s??ch tr??? g??p',1,2,6,1,'where-does-it-come-from.html',2,1,1512619090,1513757048,1,1),(6,'Ch??nh s??ch mua h??ng',1,2,0,1,'where-does-it-come-from.html',2,1,1512982583,1513756153,1,1),(7,'Ch??nh s??ch b???o h??nh - ?????i tr???',1,6,6,1,'why-do-we-use-i.html',2,4,1512985619,1513756987,1,1),(8,'Quy ?????nh - ch??nh s??ch',1,2,6,1,'where-does-it-come-from.html',2,3,1513015664,1513756996,1,1),(9,'Tablet',3,10,0,1,'san-pham/dien-thoai',1,4,1513016412,1515585074,1,1),(10,'Tin t???c',2,13,0,1,'cong-nghe',1,5,1513303403,1515585082,1,1),(11,'??i???n tho???i',3,10,0,1,'san-pham/dien-thoai',3,1,1513303781,1515583694,1,1),(12,'??i???n tho???i iPhone',3,11,11,1,'san-pham/dien-thoai-iphone',3,2,1513307289,1515583735,1,1),(15,'M??y t??nh',3,12,0,1,'san-pham/may-tinh',3,1,1513550602,1513758319,1,1),(19,'Tablet',3,15,0,1,'san-pham/dien-thoai-oppo',3,1,1515584687,1515584687,1,1),(20,'??i???n tho???i',3,10,0,1,'san-pham/dien-thoai',1,2,1515584830,1515585056,1,1),(21,'Trang ch???',4,NULL,0,1,'trang-chu.html',1,1,1515584958,1515585040,1,1),(22,'M??y t??nh',3,12,0,1,'san-pham/may-tinh',1,3,1515585017,1515585064,1,1),(23,'Tai nghe',3,10,0,1,'san-pham/dien-thoai',3,1,1515585611,1515585611,1,1),(24,'Tin t???c',2,13,0,1,'tin-tuc/cong-nghe',3,1,1515585645,1515585645,1,1),(25,'??i???n tho???i OPPO',3,15,11,1,'san-pham/dien-thoai-oppo',3,1,1515585696,1515585696,1,1),(26,'??i???n tho???i',3,10,0,1,'san-pham/dien-thoai',4,1,1515627849,1515627849,1,1),(28,'??i???n tho???i iPhone',3,11,26,1,'san-pham/dien-thoai-iphone',4,1,1515627981,1515627981,1,1),(29,'M??y t??nh',3,12,0,1,'san-pham/may-tinh',4,1,1515628008,1515628008,1,1),(30,'Tablet',3,12,0,1,'san-pham/may-tinh',4,1,1515628036,1515628036,1,1),(31,'Tai nghe',3,12,0,1,'san-pham/may-tinh',4,1,1515628065,1515628065,1,1),(32,'??i???n tho???i sam sung',3,10,0,2,'san-pham/dien-thoai',1,1,1520182017,1520182017,1,1);
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `code_order` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `buyer` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '3',
  `payment_method` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `code_active` varchar(33) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `create_at` int(12) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `code_order` (`code_order`),
  KEY `buyer` (`buyer`),
  CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`buyer`) REFERENCES `tbl_customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order`
--

LOCK TABLES `tbl_order` WRITE;
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
INSERT INTO `tbl_order` (`order_id`, `code_order`, `buyer`, `active`, `payment_method`, `code_active`, `total_price`, `total_qty`, `create_at`) VALUES (1,'VSZ-1',7,3,'direct-payment','235980b03cfc7ffd9f1d6468a7d382dd',13230000,1,1513858271),(2,'VSZ-2',7,3,'direct-payment','',6990000,1,1513859014),(3,'VSZ-3',8,4,'direct-payment','',20990000,1,1513859936),(4,'VSZ-4',8,3,'direct-payment','dca802c97173fb76e5ca1eea09a2ca68',50980000,3,1515560301),(5,'VSZ-5',8,2,'direct-payment','6b17ccf125e5f88ef6c8e2fbaca16a6f',13230000,1,1515571390);
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_page`
--

DROP TABLE IF EXISTS `tbl_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_page` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `active` int(1) NOT NULL DEFAULT '2',
  `create_at` int(11) NOT NULL,
  `modify_by` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `modify_at` int(11) NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `modify_by` (`modify_by`),
  KEY `create_by` (`create_by`),
  CONSTRAINT `tbl_page_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `tbl_page_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_page`
--

LOCK TABLES `tbl_page` WRITE;
/*!40000 ALTER TABLE `tbl_page` DISABLE KEYS */;
INSERT INTO `tbl_page` (`page_id`, `title`, `slug`, `content`, `active`, `create_at`, `modify_by`, `create_by`, `modify_at`) VALUES (1,'gi???i thi???u','gioi-thieu','<p>shop ????? ??i???n t??? vs shop</p>\r\n',1,1520149189,1,1,1520149189);
/*!40000 ALTER TABLE `tbl_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_post`
--

DROP TABLE IF EXISTS `tbl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `thumbnail` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `active` int(1) NOT NULL DEFAULT '2',
  `view` int(11) DEFAULT '1',
  `create_at` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `modify_at` int(11) NOT NULL,
  `modify_by` int(11) NOT NULL,
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `thumbnail` (`thumbnail`),
  KEY `cat_id` (`cat_id`),
  KEY `modify_by` (`modify_by`),
  KEY `creat_by` (`create_by`),
  CONSTRAINT `tbl_post_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `tbl_post_ibfk_2` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `tbl_post_ibfk_3` FOREIGN KEY (`cat_id`) REFERENCES `tbl_category` (`cat_id`),
  CONSTRAINT `tbl_post_ibfk_4` FOREIGN KEY (`thumbnail`) REFERENCES `tbl_media` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_post`
--

LOCK TABLES `tbl_post` WRITE;
/*!40000 ALTER TABLE `tbl_post` DISABLE KEYS */;
INSERT INTO `tbl_post` (`post_id`, `title`, `excerpt`, `content`, `thumbnail`, `cat_id`, `slug`, `active`, `view`, `create_at`, `create_by`, `modify_at`, `modify_by`) VALUES (1,'OPPO A83 r?? r??? th??ng s??? c???u h??nh s??? d???ng b???o m???t khu??n m???t','            ?????u th&aacute;ng 12 v???a qua, c?? quan TENAA ??&atilde; th???a nh???n s??? xu???t hi???n c???a OPPO A83 v???i thi???t k??? to&agrave;n m&agrave;n h&igrave;nh. M???i ??&acirc;y, ngu???n tin r&ograve; r??? l???i cho ch&uacute;ng ta...\r\n        ','<h2 dir=\"ltr\">?????u th&aacute;ng 12 v???a qua, c?? quan&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/fcc-ccc-la-gi-vi-sao-smartphone-muon-ban-ra-phai-duoc-ho-chung-nhan--1024896\" target=\"_blank\" title=\"TENAA\" type=\"TENAA\">TENAA</a>&nbsp;??&atilde; th???a nh???n s??? xu???t hi???n c???a&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/tim-kiem?key=OPPO+A83\" target=\"_blank\" title=\"OPPO A83 \" type=\"OPPO A83 \">OPPO A83</a>v???i thi???t k??? m&agrave;n h&igrave;nh tr&agrave;n vi???n. M???i ??&acirc;y, ngu???n tin r&ograve; r??? l???i cho ch&uacute;ng ta bi???t th&ecirc;m c???u h&igrave;nh c???a m&aacute;y.</h2>\r\n\r\n<p><img alt=\"Th??ng tin r?? r??? v??? c???u h??nh c???a OPPO A83\" src=\"https://cdn4.tgdd.vn/Files/2017/12/13/1050119/oppo-a83-leak-2_600x459.jpg\" title=\"Th??ng tin r?? r??? v??? c???u h??nh c???a OPPO A83\" /></p>\r\n\r\n<p dir=\"ltr\">Theo ??&oacute;, OPPO A83 s??? c&oacute; m&agrave;n h&igrave;nh 5.7 inch HD+ t??? l??? 18:9 ??ang ng&agrave;y c&agrave;ng th???nh h&agrave;nh, trang b??? b??? vi x??? l&yacute; Helio P23 ??i k&egrave;m 2 GB RAM + 16 GB ROM (h??? tr??? khe c???m th??? nh??? microSD).</p>\r\n\r\n<p><img alt=\"Th??ng tin r?? r??? v??? c???u h??nh c???a OPPO A83\" src=\"https://cdn1.tgdd.vn/Files/2017/12/13/1050119/oppo-a83-leak-3_600x512.jpg\" title=\"Th??ng tin r?? r??? v??? c???u h??nh c???a OPPO A83\" /></p>\r\n\r\n<p dir=\"ltr\">Nh&igrave;n v&agrave;o nh???ng h&igrave;nh ???nh ???????c cung c???p c&oacute; th??? th???y r???ng OPPO A83 kh&ocirc;ng ???????c t&iacute;ch h???p c???m bi???n v&acirc;n tay. Thay v&agrave;o ??&oacute;, nhi???u ng?????i tin r???ng m&aacute;y s??? s??? d???ng ch???c n??ng b???o m???t nh???n di???n khu&ocirc;n m???t. Ngo&agrave;i ra, s???n ph???m n&agrave;y c&ograve;n s??? h???u camera tr?????c sau 5/13 MP v&agrave; vi&ecirc;n pin dung l?????ng 3.180 mAh.</p>\r\n\r\n<p><img alt=\"Th??ng tin r?? r??? v??? c???u h??nh c???a OPPO A83\" src=\"https://cdn3.tgdd.vn/Files/2017/12/13/1050119/oppo-a83-leak-1_600x291.jpg\" title=\"Th??ng tin r?? r??? v??? c???u h??nh c???a OPPO A83\" /></p>\r\n\r\n<p>Th&ocirc;ng s??? c???u h&igrave;nh c???a tin ?????n n&agrave;y ho&agrave;n to&agrave;n ph&ugrave; h???p v???i nh???ng th&ocirc;ng tin c???a c?? quan TENAA cung c???p t??? tr?????c ??&oacute;. Ch??a h???t, trang&nbsp;<a href=\"http://playfuldroid.com/oppo-a83-specs-surface-may-arrive-with-facial-recognition-instead-of-fingerprint-scanner/\" rel=\"nofollow\" target=\"_blank\" title=\"playfuldroid \" type=\"playfuldroid \">playfuldroid</a>&nbsp;c&ograve;n cho bi???t th&ecirc;m, OPPO A83 c&oacute; k&iacute;ch th?????c 150.5 x73.1 x 7.7 mm, xu???t hi???n v???i t&ugrave;y ch???n m&agrave;u v&agrave;ng v&agrave; ??en cho ng?????i d&ugrave;ng ch???n l???a.</p>\r\n\r\n<p dir=\"ltr\">D??? ki???n, OPPO s??? c&ocirc;ng b??? OPPO A83 v&agrave;o ng&agrave;y 30/12 t???i v???i gi&aacute; b&aacute;n kho???ng 1.199 NDT (g???n 4.1 tri???u ?????ng).</p>\r\n',265,14,'oppo-a83-ro-ri-thong-so-cau-hinh-su-dung-bao-mat-k',1,31,1513183556,1,1513953229,1),(2,'??i???n tho???i c?? b???n h??? tr??? 4G c???a Nokia v???a ?????t ch???ng nh???n Bluetooth','M???t v&agrave;i th&ocirc;ng tin g???n nh???t cho th???y, HMD s???p ra m???t m???t ??i???n tho???i &quot;c???c g???ch&quot; h??? tr??? 4G. V&agrave; m???i nh???t, c&aacute;c model TA-1047, TA-1060 ??&atilde; ?????t ch???ng nh???n t???i&nbsp;FCC. D??? ki???n ??&acirc;y ch&iacute;nh l&agrave; nh???ng ??i???n tho???i c?? b???n h??? tr??? 4G tuy kh&ocirc;ng ph???i l&agrave; smartphone.','<h2>M???t v&agrave;i th&ocirc;ng tin g???n nh???t cho th???y, HMD s???p ra m???t m???t ??i???n tho???i &quot;c???c g???ch&quot; h??? tr??? 4G. V&agrave; m???i nh???t, c&aacute;c model TA-1047, TA-1060 ??&atilde; ?????t ch???ng nh???n t???i&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/fcc-ccc-la-gi-vi-sao-smartphone-muon-ban-ra-phai-duoc-ho-chung-nhan--1024896\" target=\"_blank\" title=\"FCC\">FCC</a>. D??? ki???n ??&acirc;y ch&iacute;nh l&agrave; nh???ng ??i???n tho???i c?? b???n h??? tr??? 4G tuy kh&ocirc;ng ph???i l&agrave; smartphone.</h2>\r\n\r\n<p>Theo&nbsp;<a href=\"https://www.gizmochina.com/2017/12/21/4g-nokia-feature-phone-receives-bluetooth-sig-certification-launch-nearing/\" rel=\"nofollow\" target=\"_blank\" title=\"Nokia\">gizmochina</a>, m???u ??i???n tho???i c?? b???n h??? tr??? 4G c???a&nbsp;<a href=\"https://www.thegioididong.com/dtdd-nokia\" target=\"_blank\" title=\"Nokia \">Nokia</a>&nbsp;c??ng v???a ?????t ch???ng nh???n t???i t??? ch???c Bluetooth SIG, ??i???u n&agrave;y ch???ng t??? m&aacute;y ??&atilde; s???n s&agrave;ng ra m???t.</p>\r\n\r\n<p>Bluetooth SIG ??&atilde; ch???ng nh???n 5 model g???m: Nokia TA-1047, TA-1060, TA-1056, TA-1079 v&agrave; TA-1066. D?????ng nh?? ??&acirc;y l&agrave; 5 bi???n th??? c???a m???u ??i???n tho???i nghe g???i s???p ra m???t.</p>\r\n\r\n<p><img alt=\"??i???n tho???i c???c g???ch Nokia h??? tr??? 4G ?????t ch???ng nh???n Bluetooth\" src=\"https://cdn.tgdd.vn/Files/2017/12/21/1052290/nokia-2_800x300.jpg\" title=\"??i???n tho???i c???c g???ch Nokia h??? tr??? 4G ?????t ch???ng nh???n Bluetooth\" /></p>\r\n\r\n<p>D??? ki???n chi???c ??i???n tho???i m???i n&agrave;y s??? l&ecirc;n k??? ??? nhi???u th??? tr?????ng kh&aacute;c nhau v???i 2 phi&ecirc;n b???n l&agrave; 1 SIM v&agrave; 2 SIM. Ngo&agrave;i ra, ph???n m&ocirc; t??? ph???n m???m cho th???y m&aacute;y kh&ocirc;ng ch???y Android, r???t c&oacute; th??? s??? t&iacute;ch h???p h??? ??i???u h&agrave;nh series 30+ Feature OS t????ng t??? nh??&nbsp;<a href=\"https://www.thegioididong.com/dtdd/nokia-3310-2017\" target=\"_blank\" title=\"Nokia 3310\">Nokia 3310</a>&nbsp;(2017).</p>\r\n\r\n<p>Danh s&aacute;ch tr&ecirc;n FCC cho th???y m&aacute;y c&oacute; k&iacute;ch th?????c l&agrave; 133 x 68 mm. N&oacute; ???????c suy ??o&aacute;n s??? s??? d???ng b&agrave;n ph&iacute;m QWERTY gi???ng v???i Nokia E72.</p>\r\n',314,14,'dien-thoai-co-ban-ho-tro-4g-cua-nokia-vua-dat-chung-nhan-bluetooth',2,23,1513960290,5,1513960503,5);
/*!40000 ALTER TABLE `tbl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `favorite` int(1) NOT NULL DEFAULT '0',
  `name` varchar(220) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `percen` int(11) DEFAULT '0',
  `thumb` int(11) NOT NULL,
  `img_involve` varchar(220) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `depict` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `price` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `info` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `create_at` int(11) NOT NULL,
  `total_product` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '2',
  `discount` int(11) DEFAULT NULL,
  `create_by` int(11) NOT NULL,
  `modify_by` int(11) NOT NULL,
  `modify_at` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `thumb` (`thumb`),
  KEY `cat_id` (`cat_id`),
  KEY `create_by` (`create_by`),
  KEY `modify_by` (`modify_by`),
  CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `tbl_product_ibfk_3` FOREIGN KEY (`thumb`) REFERENCES `tbl_media` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` (`product_id`, `favorite`, `name`, `slug`, `percen`, `thumb`, `img_involve`, `depict`, `price`, `cat_id`, `info`, `create_at`, `total_product`, `active`, `discount`, `create_by`, `modify_by`, `modify_at`) VALUES (4,1,'??i???n tho???i iPhone X 64GB','dien-thoai-iphone-x-64gb',10,252,'[\"268\",\"267\",\"266\",\"256\",\"255\",\"254\",\"253\"]','<h2><a href=\"https://www.thegioididong.com/dtdd-apple-iphone\" target=\"_blank\" title=\"??i???n tho???i iPhone\">iPhone</a>&nbsp;X l&agrave; chi???c smartphone ???????c r???t nhi???u ng?????i mong ch??? b???i ??&acirc;y ???????c xem l&agrave; chi???c m&aacute;y ????? Apple k??? ni???m 10 n??m chi???c iPhone ?????u ti&ecirc;n ???????c b&aacute;n ra.</h2>\r\n\r\n<h3><strong>Thi???t k??? ?????t ph&aacute;</strong></h3>\r\n\r\n<p>Nh?? c&aacute;c b???n c??ng ??&atilde; bi???t th&igrave; ??&atilde; 4 n??m k??? t??? iPhone 6 v&agrave; iPhone 6 Plus Apple v???n ch??a c&oacute; thay ?????i n&agrave;o ??&aacute;ng k??? trong thi???t k??? c???a m&igrave;nh.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb1.jpg\" onclick=\"return false;\"><img alt=\"Thi???t k??? ?????t ph??\" src=\"https://cdn4.tgdd.vn/Products/Images/42/114115/iphone-x-64gb1.jpg\" title=\"Thi???t k??? ?????t ph??\" /></a></p>\r\n\r\n<p>Nh??ng v???i iPhone X th&igrave; ??&oacute; l???i l&agrave; 1 c&acirc;u chuy???n ho&agrave;n to&agrave;n kh&aacute;c, m&aacute;y chuy???n qua s??? d???ng m&agrave;n h&igrave;nh t??? l??? 19,5:9 m???i m??? v???i ph???n di???n t&iacute;ch hi???n th??? m???t tr?????c c???c l???n.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb2.jpg\" onclick=\"return false;\"><img alt=\"Thi???t k??? ?????t ph??\" src=\"https://cdn1.tgdd.vn/Products/Images/42/114115/iphone-x-64gb2.jpg\" title=\"Thi???t k??? ?????t ph??\" /></a></p>\r\n\r\n<p>M???t l??ng k&iacute;nh h??? tr??? s???c nhanh kh&ocirc;ng d&acirc;y c??ng nh?? ph???n camera k&eacute;p ?????t d???c c??ng l&agrave; nh???ng th??? ?????u ti&ecirc;n xu???t hi???n tr&ecirc;n 1 chi???c iPhone.</p>\r\n\r\n<h3><strong>M&agrave;n h&igrave;nh v???i tai th???</strong></h3>\r\n\r\n<p>??i???m khi???n iPhone X b??? ch&ecirc; nhi???u nh???t ??&oacute; ch&iacute;nh l&agrave; ph???n &quot;tai th???&quot; ph&iacute;a tr&ecirc;n m&agrave;n h&igrave;nh, Apple ??&atilde; ch???p nh???n ??i???u n&agrave;y ????? ?????t c???m camera&nbsp;TrueDept m???i c???a h&atilde;ng.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb15.jpg\" onclick=\"return false;\"><img alt=\"M??n h??nh v???i tai th???\" src=\"https://cdn3.tgdd.vn/Products/Images/42/114115/iphone-x-64gb15.jpg\" title=\"M??n h??nh v???i tai th???\" /></a></p>\r\n\r\n<p>M&agrave;n h&igrave;nh k&iacute;ch th?????c 5.8 inch ????? ph&acirc;n gi???i&nbsp;1125 x 2436 pixels ??em ?????n kh??? n??ng hi???n th??? xu???t s???c.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb20.jpg\" onclick=\"return false;\"><img alt=\"M??n h??nh v???i tai th???\" src=\"https://cdn.tgdd.vn/Products/Images/42/114115/iphone-x-64gb20.jpg\" title=\"M??n h??nh v???i tai th???\" /></a></p>\r\n\r\n<p>iPhone X s??? d???ng t???m n???n&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-oled-la-gi-905762\" target=\"_blank\" title=\"T??m hi???u m??n h??nh OLED\">OLED</a>&nbsp;(???????c tinh ch???nh b???i Apple) thay v&igrave; LCD nh?? nh???ng chi???c iPhone tr?????c ??&acirc;y v&agrave; ??i???u n&agrave;y ??em l???i cho m&aacute;y 1 m&agrave;u ??en th??? hi???n r???t s&acirc;u c??ng kh??? n??ng t&aacute;i t???o m&agrave;u s???c kh&ocirc;ng k&eacute;m ph???n ch&iacute;nh x&aacute;c.</p>\r\n\r\n<h3><strong>Face ID t???o n&ecirc;n ?????t ph&aacute;</strong></h3>\r\n\r\n<p>Touch ID tr&ecirc;n iPhone X ??&atilde; b??? lo???i b???, thay v&agrave;o ??&oacute; l&agrave; b???n s??? chuy???n qua s??? d???ng Face ID, m???t ph????ng th???c b???o m???t sinh tr???c h???c m???i c???a Apple.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb7.jpg\" onclick=\"return false;\"><img alt=\"Face ID t???o n??n ?????t ph??\" src=\"https://cdn2.tgdd.vn/Products/Images/42/114115/iphone-x-64gb7.jpg\" title=\"Face ID t???o n??n ?????t ph??\" /></a></p>\r\n\r\n<p>V???i s??? tr??? gi&uacute;p c???a c???m&nbsp;camera&nbsp;TrueDept th&igrave; iPhone X c&oacute; kh??? n??ng nh???n di???n khu&ocirc;n m???t 3D c???a ng?????i d&ugrave;ng t??? ??&oacute; m??? kh&oacute;a chi???c iPhone m???t c&aacute;ch nhanh ch&oacute;ng.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb11.jpg\" onclick=\"return false;\"><img alt=\"Face ID t???o n??n ?????t ph??\" src=\"https://cdn4.tgdd.vn/Products/Images/42/114115/iphone-x-64gb11.jpg\" title=\"Face ID t???o n??n ?????t ph??\" /></a></p>\r\n\r\n<p>Tuy s??? h??i h???t h???ng khi Touch ID ??&atilde; qu&aacute; quen thu???c tr&ecirc;n nh???ng chi???c iPhone nh?? t???c ????? c??ng nh?? tr???i nghi???m &quot;kh&oacute;a nh?? kh&ocirc;ng kh&oacute;a&quot; c???a Face ID ho&agrave;n to&agrave;n c&oacute; th??? khi???n b???n y&ecirc;n t&acirc;m s??? d???ng.</p>\r\n\r\n<h3><strong>Thao t&aacute;c vu???t v&agrave; vu???t</strong></h3>\r\n\r\n<p>Kh&ocirc;ng c&ograve;n ph&iacute;m Home c???ng n&ecirc;n c&aacute;c thao t&aacute;c tr&ecirc;n iPhone X c??ng ho&agrave;n to&agrave;n kh&aacute;c so v???i nh???ng ??&agrave;n anh ??i tr?????c.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb3.jpg\" onclick=\"return false;\"><img alt=\"Thao t??c vu???t v?? vu???t\" src=\"https://cdn1.tgdd.vn/Products/Images/42/114115/iphone-x-64gb3.jpg\" title=\"Thao t??c vu???t v?? vu???t\" /></a></p>\r\n\r\n<p>Gi??? ??&acirc;y ch??? v???i thao t&aacute;c vu???t v&agrave; vu???t t??? c???nh d?????i l&agrave; b???n ??&atilde; c&oacute; th??? truy c???p v&agrave;o ??a nhi???m, tr??? v??? m&agrave;n h&igrave;nh Home m???t c&aacute;ch nhanh ch&oacute;ng.</p>\r\n\r\n<h3><strong>Camera c???i ti???n</strong></h3>\r\n\r\n<p>iPhone X v???n s??? h???u b??? ??&ocirc;i camera v???i ????? ph&acirc;n gi???i 12 MP nh??ng camera tele th??? 2 v???i kh???u ????? ???????c n&acirc;ng l&ecirc;n m???c f/2.4 so v???i f/2.8 c???a iPhone 7 Plus.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb19.jpg\" onclick=\"return false;\"><img alt=\"Camera c???i ti???n\" src=\"https://cdn3.tgdd.vn/Products/Images/42/114115/iphone-x-64gb19.jpg\" title=\"Camera c???i ti???n\" /></a></p>\r\n\r\n<p>Ngo&agrave;i ra th&igrave; c??? 2 camera tr&ecirc;n iPhone X ?????u s??? h???u cho m&igrave;nh kh??? n??ng ch???ng rung quang h???c gi&uacute;p b???n d??? d&agrave;ng b???t tr???n m???i kho???nh kh???c trong cu???c s???ng.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb9.jpg\" onclick=\"return false;\"><img alt=\"Camera c???i ti???n\" src=\"https://cdn.tgdd.vn/Products/Images/42/114115/iphone-x-64gb9.jpg\" title=\"Camera c???i ti???n\" /></a></p>\r\n\r\n<p>Camera tr?????c ????? ph&acirc;n gi???i 7 MP v???i kh??? n??ng selfie x&oacute;a ph&ocirc;ng ??&aacute;p ???ng t???t m???i nhu c???u t??? s?????ng c???a gi???i tr??? hi???n nay.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb8.jpg\" onclick=\"return false;\"><img alt=\"Camera c???i ti???n\" src=\"https://cdn2.tgdd.vn/Products/Images/42/114115/iphone-x-64gb8.jpg\" title=\"Camera c???i ti???n\" /></a></p>\r\n\r\n<p>B??? ??&ocirc;i camera tr&ecirc;n iPhone X ???????c ??&aacute;nh gi&aacute; r???t cao v??? ch???t l?????ng ???nh ch???p v&agrave; l&agrave; m???t trong nh???ng chi???c camera phone ch???p ???nh ?????p nh???t trong n??m 2017.</p>\r\n\r\n<h3><strong>Hi???u n??ng m???nh m???</strong></h3>\r\n\r\n<p>Hi???u n??ng c???a nh???ng chi???c iPhone ch??a bao gi??? l&agrave; v???n ????? v&agrave; v???i iPhone X th&igrave; m???i th??? v???n r???t ???n t?????ng.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb10.jpg\" onclick=\"return false;\"><img alt=\"Hi???u n??ng m???nh m???\" src=\"https://cdn4.tgdd.vn/Products/Images/42/114115/iphone-x-64gb10.jpg\" title=\"Hi???u n??ng m???nh m???\" /></a></p>\r\n\r\n<p>Con chip&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/chi-tiet-a11-bionic-chip-co-nhieu-thanh-phan-apple-tu-trong-nhat-tu-truoc-den-nay-1021653\" target=\"_blank\" title=\"Apple A11 Bionic 6 nh??n\">Apple A11 Bionic 6 nh&acirc;n</a>&nbsp;k???t h???p v???i 3 GB RAM th&igrave; iPhone X t??? tin l&agrave; chi???c&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" title=\"??i???n tho???i di ?????ng\">smartphone</a>&nbsp;m???nh m??? nh???t m&agrave; Apple t???ng s???n xu???t.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb13.jpg\" onclick=\"return false;\"><img alt=\"Hi???u n??ng m???nh m???\" src=\"https://cdn1.tgdd.vn/Products/Images/42/114115/iphone-x-64gb13.jpg\" title=\"Hi???u n??ng m???nh m???\" /></a></p>\r\n\r\n<p>Ngo&agrave;i ra v???i iPhone X th&igrave; Apple c??ng nh???n m???nh v???i tr???i nghi???m th???c t??? ???o t??ng c?????ng gi&uacute;p b???n c&oacute; nh???ng ph&uacute;t gi&acirc;y th?? gi&atilde;n th&uacute; v???.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114115/iphone-x-64gb17.jpg\" onclick=\"return false;\"><img alt=\"Hi???u n??ng m???nh m???\" src=\"https://cdn3.tgdd.vn/Products/Images/42/114115/iphone-x-64gb17.jpg\" title=\"Hi???u n??ng m???nh m???\" /></a></p>\r\n\r\n<p>Vi&ecirc;n pin tr&ecirc;n iPhone X c&oacute; dung l?????ng&nbsp;2716 mAh (l???n h??n c??? tr&ecirc;n iPhone 8 Plus) cho b???n s??? d???ng kh&aacute; ???n trong kho???ng m???t ng&agrave;y li&ecirc;n t???c.</p>\r\n',29990000,11,'H??? ??i???u h&agrave;nh:	iOS 11\r\nCamera sau:	2 camera 12 MP\r\nCamera tr?????c:	7 MP\r\nCPU:	Apple A11 Bionic 6 nh&acirc;n\r\nRAM:	3 GB\r\nB??? nh??? trong:	64 GB\r\nTh??? SIM:	1 Nano SIM, H??? tr??? 4G\r\nDung l?????ng pin:	2716 mAh, c&oacute; s???c nhanh',1513062011,10,1,26990000,1,1,1513353441),(5,1,'??i???n tho???i iPhone 8 64G','dien-thoai-iphone-8-64g',NULL,257,'[\"260\",\"259\",\"258\"]','<h3>Thay ?????i phong c&aacute;ch thi???t k???</h3>\r\n\r\n<p>iPhone 8 k???t h???p gi???a nh???ng ???????ng n&eacute;t ??&atilde; l&agrave;m n&ecirc;n chu???n m???c, th????ng hi???u v???i s??? th???i th?????ng v&agrave; hi???n ?????i c???a m???t l??ng ph??? k&iacute;nh c?????ng l???c thay v&igrave; nguy&ecirc;n kh???i kim lo???i. ??i???m thi???t k??? n&agrave;y mang l???i ????? b&oacute;ng b???y, ?????p m???t h??n cho s???n ph???m.</p>\r\n\r\n<h2><a href=\"https://cdn.tgdd.vn/Files/2017/09/13/1021096/p9122094_800x450.jpg\" onclick=\"return false;\"><img alt=\"Tr??n tay iPhone 8\" src=\"https://cdn.tgdd.vn/Files/2017/09/13/1021096/p9122094_800x450.jpg\" title=\"Tr??n tay iPhone 8\" /></a></h2>\r\n\r\n<p>M???t l??ng k&iacute;nh gi&uacute;p iPhone 8 ???????c t&iacute;ch h???p c&ocirc;ng ngh??? s???c kh&ocirc;ng d&acirc;y hi???n ?????i m&agrave; ng?????i d&ugrave;ng mong ?????i t??? l&acirc;u. Ngo&agrave;i ra c&ograve;n l&agrave; l???n ?????u ti&ecirc;n Apple trang b??? c&ocirc;ng ngh??? s???c pin nhanh cho iPhone.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Files/2017/09/13/1021096/p9122088_800x451.jpg\" onclick=\"return false;\"><img alt=\"Tr??n tay iPhone 8\" src=\"https://cdn2.tgdd.vn/Files/2017/09/13/1021096/p9122088_800x451.jpg\" title=\"Tr??n tay iPhone 8\" /></a></p>\r\n\r\n<p>Phong c&aacute;ch m???i c??ng ?????ng th???i lo???i b??? ho&agrave;n to&agrave;n nh???ng chi ti???t th???a nh?? ph???n anten tr&ecirc;n m???t l??ng ????? ????a thi???t k??? iPhone 8 ?????n ????? ho&agrave;n h???o.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Files/2017/09/13/1021096/p9122102_800x450.jpg\" onclick=\"return false;\"><img alt=\"Tr??n tay iPhone 8\" src=\"https://cdn4.tgdd.vn/Files/2017/09/13/1021096/p9122102_800x450.jpg\" title=\"Tr??n tay iPhone 8\" /></a></p>\r\n\r\n<h3>M&agrave;n h&igrave;nh ch???t l?????ng</h3>\r\n\r\n<p>M???t tr?????c iPhone 8 v???n s??? h???u m&agrave;n h&igrave;nh 4.7 inch ????? ph&acirc;n gi???i Retina HD nh??ng ???????c Apple n&acirc;ng c???p v&agrave; g???i b???ng c&aacute;i t&ecirc;n Retina HD True Tone v???i kh??? n??ng hi???n th??? m&agrave;u ch&iacute;nh x&aacute;c h??n. Ph&iacute;m home c???m ???ng l???c 3D Touch t&iacute;ch h???p v???i c??? c???m bi???n v&acirc;n tay.&nbsp;</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Files/2017/09/13/1021096/p9122098_800x451.jpg\" onclick=\"return false;\"><img alt=\"Tr??n tay iPhone 8\" src=\"https://cdn1.tgdd.vn/Files/2017/09/13/1021096/p9122098_800x451.jpg\" title=\"Tr??n tay iPhone 8\" /></a></p>\r\n\r\n<h3>N&acirc;ng c???p camera</h3>\r\n\r\n<p>Camera ch&iacute;nh c&oacute; ????? ph&acirc;n gi???i 12 MP, kh???u ????? F/1.8 c&ugrave;ng r???t nhi???u c???i ti???n v??? h&igrave;nh ???nh, ????? s???c n&eacute;t, t???c ????? hay kh??? n??ng ch???p thi???u s&aacute;ng. Ngo&agrave;i ra c&ograve;n n&acirc;ng c???p m???t v&agrave;i ??i???m nh?? h??? tr??? quay video 4K @60fps, v&agrave; n&acirc;ng ti???p video 240fps l&ecirc;n ????? ph&acirc;n gi???i 1080p.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Files/2017/09/13/1021096/p9122104_800x451.jpg\" onclick=\"return false;\"><img alt=\"Tr??n tay iPhone 8\" src=\"https://cdn3.tgdd.vn/Files/2017/09/13/1021096/p9122104_800x451.jpg\" title=\"Tr??n tay iPhone 8\" /></a></p>\r\n\r\n<p>Camera tr?????c v???n c&oacute; ????? ph&acirc;n gi???i 7 MP c&ugrave;ng kh???u ????? F/2.2.</p>\r\n\r\n<p>??i???m n???i b???t nh???t ph???i k??? ?????n l&agrave; t&iacute;nh n??ng ch???p &aacute;nh s&aacute;ng s&acirc;n kh???u cho ph&eacute;p thay ?????i g&oacute;c h???t s&aacute;ng v&agrave;o khu&ocirc;n m???t t???o ra c&aacute;c b???c ???nh ngh??? thu???t nh?? trong ph&ograve;ng studio chuy&ecirc;n nghi???p.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114112/iphone-8-256gb-h5-1.jpg\" onclick=\"return false;\"><img alt=\"iphone-8-256gb\" src=\"https://cdn.tgdd.vn/Products/Images/42/114112/iphone-8-256gb-h5-1.jpg\" title=\"iphone-8-256gb\" /></a></p>\r\n\r\n<h3>C???u h&igrave;nh m???nh m??? nh???t</h3>\r\n\r\n<p>??i???m qua c???u h&igrave;nh, iPhone 8 s??? s??? d???ng con chip 6 nh&acirc;n A11 Bionic t????ng t??? nh?? tr&ecirc;n&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-x-64gb\" target=\"_blank\" title=\"iPhone X\" type=\"iPhone X\">iPhone X</a>, chip c&oacute; s???c m???nh cao c???p nh???t t&iacute;nh ?????n th???i ??i???m ra m???t iPhone 8, c&ugrave;ng 2 GB RAM.&nbsp;&nbsp;</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Files/2017/09/13/1021096/p9122097_800x451.jpg\" onclick=\"return false;\"><img alt=\"Tr??n tay iPhone 8\" src=\"https://cdn2.tgdd.vn/Files/2017/09/13/1021096/p9122097_800x451.jpg\" title=\"Tr??n tay iPhone 8\" /></a></p>\r\n\r\n<p>K???t h???p c&ugrave;ng phi&ecirc;n b???n iOS 11, c??? iPhone 8 nh???n m???nh v&agrave;o kh??? n??ng tr&igrave;nh chi???u th???c t??? ???o AR mang ?????n nh???ng tr???i nghi???m ho&agrave;n to&agrave;n kh&aacute;c bi???t so v???i tr?????c ??&acirc;y.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114112/iphone-8-256gb-h10-1.jpg\" onclick=\"return false;\"><img alt=\"iphone-8-256gb\" src=\"https://cdn4.tgdd.vn/Products/Images/42/114112/iphone-8-256gb-h10-1.jpg\" title=\"iphone-8-256gb\" /></a></p>\r\n\r\n<h3>Ch???ng n?????c, b???i cao c???p</h3>\r\n\r\n<p>iPhone 8 kh&ocirc;ng qu&ecirc;n t&iacute;ch h???p chu???n ch???ng n?????c, b???i cao c???p mang ?????n s??? an to&agrave;n, b???n b??? c??ng nh?? kh??? n??ng s??? d???ng l&acirc;u d&agrave;i ch???ng ch???u nhi???u ??i???u ki???n th???i ti???t.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/114112/iphone-8-256gb-h1-1.jpg\" onclick=\"return false;\"><img alt=\"iPhone 8 256GB\" src=\"https://cdn1.tgdd.vn/Products/Images/42/114112/iphone-8-256gb-h1-1.jpg\" title=\"iPhone 8 256GB\" /></a></p>\r\n',20990000,11,'M&agrave;n h&igrave;nh:	LED-backlit IPS LCD, 4.7&quot;, Retina HD\r\nH??? ??i???u h&agrave;nh:	iOS 11\r\nCamera sau:	12 MP\r\nCamera tr?????c:	7 MP\r\nCPU:	Apple A11 Bionic 6 nh&acirc;n\r\nRAM:	2 GB\r\nB??? nh??? trong:	64 GB',1513062277,20,1,NULL,1,1,1513333612),(6,1,'Laptop HP Probook 440','laptop-hp-probook-440',10,274,'[\"276\",\"275\"]','<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n',10000000,12,'M&agrave;n h&igrave;nh:	LED-backlit IPS LCD, 4.7&quot;, Retina HD H??? ??i???u h&agrave;nh:	iOS 11 Camera sau:	12 MP Camera tr?????c:	7 MP CPU:	Apple A11 Bionic 6 nh&acirc;n RAM:	2 GB B??? nh??? trong:	64 GB',1513550200,20,1,9000000,1,1,1513550920),(7,1,'Laptop HP Probook 440 G2 LED Backlit','laptop-hp-probook-440-g2-led-backlit',10,277,'[\"282\",\"281\",\"280\",\"279\",\"278\"]','<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n',14700000,12,'B??? vi x??? l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)\r\nCache upto 2.7 GHz\r\nB??? nh??? RAM :4 GB (DDR3 Bus 1600 MHz)\r\n????? h???a :Intel HD Graphics\r\n??? ????a c???ng :500 GB (HDD)',1513550876,100,1,13230000,1,1,1513550876),(8,1,'Laptop HP Probook 440 G2 LED','laptop-hp-probook-440-g2-led',20,283,NULL,'<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n',10000000,12,'B??? vi x??? l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)\r\nCache upto 2.7 GHz\r\nB??? nh??? RAM :4 GB (DDR3 Bus 1600 MHz)\r\n????? h???a :Intel HD Graphics\r\n??? ????a c???ng :500 GB (HDD)',1513551007,100,1,8000000,1,1,1513697789),(9,1,'Laptop HP Probook 440','laptop-hp-probook',10,288,'[\"290\",\"289\"]','<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n',10000000,12,'B??? vi x??? l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)\r\nCache upto 2.7 GHz\r\nB??? nh??? RAM :4 GB (DDR3 Bus 1600 MHz)\r\n????? h???a :Intel HD Graphics\r\n??? ????a c???ng :500 GB (HDD)',1513551700,100,1,9000000,1,1,1513697777),(11,0,'Motorola Moto G5S Plus','motorola-moto-g5s-plus',NULL,300,'[\"304\",\"303\",\"302\",\"301\",\"299\"]','<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n',6990000,15,'B??? vi x??? l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz B??? nh??? RAM :4 GB (DDR3 Bus 1600 MHz) ????? h???a :Intel HD Graphics ??? ????a c???ng :500 GB (HDD)',1513698599,10,1,NULL,1,1,1513698599),(12,0,'Samsung Galaxy A5','samsung-galaxy-a5',20,305,NULL,'<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n',7990000,10,'B??? vi x??? l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz B??? nh??? RAM :4 GB (DDR3 Bus 1600 MHz) ????? h???a :Intel HD Graphics ??? ????a c???ng :500 GB (HDD)',1513698700,10,1,6390000,1,1,1513698700),(13,1,'Sony Xperia XA Ultra','sony-xperia-xa-ultra',10,306,NULL,'<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n',6990000,10,'B??? vi x??? l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz B??? nh??? RAM :4 GB (DDR3 Bus 1600 MHz) ????? h???a :Intel HD Graphics ??? ????a c???ng :500 GB (HDD)',1513700060,10,1,6291000,1,1,1513700137),(15,0,'Huawei Nova 2i','huawei-nova-2i',NULL,307,NULL,'<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n',5990000,15,'B??? vi x??? l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz B??? nh??? RAM :4 GB (DDR3 Bus 1600 MHz) ????? h???a :Intel HD Graphics ??? ????a c???ng :500 GB (HDD)',1513700268,10,1,NULL,1,1,1513700268),(16,0,'HTC U Ultra Sapphire','htc-u-ultra-sapphire',NULL,308,'[\"313\",\"312\",\"311\",\"310\",\"309\"]','<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch h???p cho doanh nghi???p v&agrave; nh???ng ng?????i l&agrave;m v??n ph&ograve;ng. Do ??&oacute;, ngo&agrave;i c???u h&igrave;nh t???t, thi???t k??? b???n b???, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; kh??? n??ng b???o m???t to&agrave;n di???n gi&uacute;p b???n lu&ocirc;n y&ecirc;n t&acirc;m v??? d??? li???u c???a m&igrave;nh.</p>\r\n',9788890,10,'B??? vi x??? l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz B??? nh??? RAM :4 GB (DDR3 Bus 1600 MHz) ????? h???a :Intel HD Graphics ??? ????a c???ng :500 GB (HDD)',1513700687,10,1,NULL,1,1,1515630147),(17,1,'??i???n tho???i Samsung Galaxy J7 Pro','dien-thoai-samsung-galaxy-j7-pro',NULL,322,'[\"324\"]','<h2>?????c ??i???m n???i b???t c???a Samsung Galaxy J7 Pro</h2>\r\n\r\n<p><img src=\"https://cdn4.tgdd.vn/Products/Images/42/103404/Slider/vi-vn-samsung-galaxy-j7-pro-(1).jpg\" /></p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/tin-tuc/kinh-cuong-luc-la-gi--596319#gorillaglass4\" target=\"_blank\">T&igrave;m hi???u th&ecirc;m</a></p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/hoi-dap/samsung-exynos-7870-843409\" target=\"_blank\">T&igrave;m hi???u th&ecirc;m</a></p>\r\n\r\n<p>B??? s???n ph???m chu???n: H???p, Pin, S???c, Tai nghe, S&aacute;ch h?????ng d???n</p>\r\n\r\n<h2>Samsung Galaxy J7 Pro l&agrave; m???t chi???c smartphone ph&ugrave; h???p v???i nh???ng ng?????i y&ecirc;u th&iacute;ch m???t s???n ph???m pin t???t, th&iacute;ch h??? ??i???u h&agrave;nh m???i c&ugrave;ng nh???ng t&iacute;nh n??ng ??i k&egrave;m ?????c quy???n c???a&nbsp;<a href=\"https://www.thegioididong.com/dtdd-samsung\" target=\"_blank\" title=\"??i???n tho???i Samsung\">Samsung</a>.</h2>\r\n\r\n<h3><strong>Thi???t k??? ?????c ??&aacute;o</strong></h3>\r\n\r\n<p>???n t?????ng ?????u ti&ecirc;n v??? thi???t k??? c???a chi???c&nbsp;Samsung Galaxy J7 Pro ch&iacute;nh l&agrave; m???t l??ng c???a m&aacute;y. ???????ng c???t ??ng ten ??? m???t sau ???????c ho&agrave;n thi???n d???ng ??n v&agrave;o th&acirc;n sau m&aacute;y sau ??&oacute; ??i l&ecirc;n g???n nh?? ch??? U r???t ?????c bi???t,&nbsp;l??? m???t.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro4.jpg\" onclick=\"return false;\"><img alt=\"Thi???t k??? m???i l???\" src=\"https://cdn.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro4.jpg\" title=\"Thi???t k??? m???i l???\" /></a></p>\r\n\r\n<p><em>Thi???t k??? m???i l???</em></p>\r\n\r\n<p>M&aacute;y cho c???m gi&aacute;c c???m n???m kh&aacute; ?????m tay, ch???c ch???n v???i khung kim lo???i bo cong m???m m???i ??? c&aacute;c g&oacute;c.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro6.jpg\" onclick=\"return false;\"><img alt=\"C???m bi???n v??n tay m???t ch???m\" src=\"https://cdn2.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro6.jpg\" title=\"C???m bi???n v??n tay m???t ch???m\" /></a></p>\r\n\r\n<p><em>C???m bi???n v&acirc;n tay m???t ch???m</em></p>\r\n\r\n<p>Ph&iacute;a tr?????c v???n l&agrave; m&agrave;n h&igrave;nh 5.5 inch ????? ph&acirc;n gi???i Full HD, tr&ecirc;n t???m n???n&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-super-amoled-la-gi-905770\" target=\"_blank\" title=\"T??m hi???u m??n h??nh Super AMOLED\">Super AMOLED</a>&nbsp;v&agrave; ???????c b???o v??? b???i k&iacute;nh c?????ng l???c bo cong 2.5D.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro7.jpg\" onclick=\"return false;\"><img alt=\"M??n h??nh l???n, s???c n??t\" src=\"https://cdn4.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro7.jpg\" title=\"M??n h??nh l???n, s???c n??t\" /></a></p>\r\n\r\n<p><em>M&agrave;n h&igrave;nh l???n, s???c n&eacute;t</em></p>\r\n',6990000,10,'M&agrave;n h&igrave;nh:	Super AMOLED, 5.5&quot;, Full HD\r\nH??? ??i???u h&agrave;nh:	Android 7.0\r\nCamera sau:	13 MP\r\nCamera tr?????c:	13 MP\r\nCPU:	Exynos 7870 8 nh&acirc;n 64-bit\r\nRAM:	3 GB',1515629614,100,1,NULL,1,1,1517468312);
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_slider`
--

DROP TABLE IF EXISTS `tbl_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_slider` (
  `slider_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `thumb` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '2',
  `create_at` int(12) NOT NULL,
  `modify_at` int(12) NOT NULL,
  `create_by` int(5) NOT NULL,
  `modify_by` int(5) NOT NULL,
  PRIMARY KEY (`slider_id`),
  KEY `thumb` (`thumb`),
  KEY `create_by` (`create_by`),
  KEY `modify_by` (`modify_by`),
  CONSTRAINT `tbl_slider_ibfk_1` FOREIGN KEY (`thumb`) REFERENCES `tbl_media` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_slider`
--

LOCK TABLES `tbl_slider` WRITE;
/*!40000 ALTER TABLE `tbl_slider` DISABLE KEYS */;
INSERT INTO `tbl_slider` (`slider_id`, `title`, `thumb`, `active`, `create_at`, `modify_at`, `create_by`, `modify_by`) VALUES (1,'Samsung',316,1,1515586078,1515586078,1,1),(2,'Tr??? g??p Sam sung ',317,1,1515586220,1515586220,1,1);
/*!40000 ALTER TABLE `tbl_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_support`
--

DROP TABLE IF EXISTS `tbl_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `depict` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `thumb` int(10) NOT NULL,
  `link` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT '2',
  `page_connect` int(11) NOT NULL,
  `create_at` int(11) NOT NULL,
  `modify_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thumb` (`thumb`),
  KEY `page_connect` (`page_connect`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_support`
--

LOCK TABLES `tbl_support` WRITE;
/*!40000 ALTER TABLE `tbl_support` DISABLE KEYS */;
INSERT INTO `tbl_support` (`id`, `title`, `depict`, `thumb`, `link`, `active`, `page_connect`, `create_at`, `modify_at`) VALUES (5,'Mi???n ph?? v???n chuy???n','T???n tay kh??ch h??ng',315,NULL,1,0,1515574721,1515574721),(6,'Thanh to??n nhanh','H??? tr??? nhi???u h??nh th???c',318,NULL,1,0,1515629048,1515629048),(7,'Ti???t ki???m h??n','V???i nhi???u ??u ????i c???c l???n',319,'why-do-we-use-i.html',1,6,1515629098,1515629098),(8,'T?? v???n 24/7','1900.9999',320,'why-do-we-use-i.html',1,6,1515629152,1515629152),(9,'?????t h??ng online','Thao t??c ????n gi???n',321,'why-do-we-use-i.html',1,6,1515629219,1515629219);
/*!40000 ALTER TABLE `tbl_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sytem`
--

DROP TABLE IF EXISTS `tbl_sytem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sytem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `describe` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `tel` varchar(13) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `per_page` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sytem`
--

LOCK TABLES `tbl_sytem` WRITE;
/*!40000 ALTER TABLE `tbl_sytem` DISABLE KEYS */;
INSERT INTO `tbl_sytem` (`id`, `title`, `describe`, `tel`, `address`, `email`, `per_page`) VALUES (1,'vshop','Vshop lu??n cung c???p lu??n l?? s???n ph???m ch??nh h??ng c?? th??ng tin r?? r??ng, ch??nh s??ch ??u ????i c???c l???n cho kh??ch h??ng c?? th??? th??nh vi??n.','01698411857','106 - Tr???n B??nh - C???u Gi???y - H?? N???i','phantam.t10@gmail.com',8);
/*!40000 ALTER TABLE `tbl_sytem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `password` varchar(32) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `avatar` int(11) DEFAULT NULL,
  `level` int(1) NOT NULL DEFAULT '3',
  `salt` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `fullname` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` text COLLATE utf8mb4_vietnamese_ci,
  `tel` varchar(13) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `facebook` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `modify_at` int(12) DEFAULT NULL,
  `code_confirm` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT '{}',
  `create_at` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `avatar` (`avatar`),
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`avatar`) REFERENCES `tbl_media` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` (`user_id`, `password`, `email`, `avatar`, `level`, `salt`, `active`, `fullname`, `address`, `tel`, `facebook`, `modify_at`, `code_confirm`, `create_at`) VALUES (1,'23737df6fce285b2eac4c728937a1977','phantam.t10@gmail.com',273,1,'f5f7e1c69d39eeab514bb22e9da42313',1,'Phan V??n T??m','','01698411857','',1519976075,'[]',1511658087),(5,'87f5cc93cac27f2712a20000a8188936','phanhuy.t10@gmail.com',NULL,2,'db936adf80fcfde49bb6c795505b11ad',1,'Phan Huy',NULL,NULL,NULL,1513961210,'{}',1513956306),(6,'2cdf43a22bd3bd61c92d0a5c088dbecc','phankhuong.t10@gmail.com',NULL,3,'792a7362132bfca13a8d35ac5127bf6f',2,'Phan Kh????ng',NULL,NULL,NULL,1513961200,'{\"reset_pass\":{\"code\":\"16bc367ed731da444a3a705f3baf8e4c\",\"time\":1513962851}}',1513961200);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'phanvantam_shop'
--

--
-- Dumping routines for database 'phanvantam_shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-06  9:51:55
