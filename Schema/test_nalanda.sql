-- MySQL dump 10.13  Distrib 5.7.12, for osx10.11 (x86_64)
--
-- Host: localhost    Database: test_nalanda
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Table structure for table `account_content`
--

DROP TABLE IF EXISTS `account_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_content` (
  `topic_id` varchar(32) NOT NULL,
  `topic_name` varchar(140) NOT NULL,
  `content_id` varchar(32) NOT NULL,
  `channel_id` varchar(32) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `sub_topics` longtext NOT NULL,
  `sub_topics_total` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_content`
--

LOCK TABLES `account_content` WRITE;
/*!40000 ALTER TABLE `account_content` DISABLE KEYS */;
INSERT INTO `account_content` VALUES ('','','','',23,'{\"topics\": [{\"counts\": 5, \"id\": \"5e3cea43f5e1411599132065b56f8934\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 23, \"children\": [{\"counts\": 1, \"id\": \"304551b0adb74ac8bc920de706e0c891\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 4, \"children\": [{\"counts\": 1, \"id\": \"2302e4a80b504b5a840b44f478ba2b8e\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 4, \"children\": [], \"contentId\": \"553598e782eb4252978e13dff045276e\", \"name\": \"2 digit Substraction\"}], \"contentId\": \"0236721c120340f79ed052e8bf884c21\", \"name\": \"Subtraction\"}, {\"counts\": 4, \"id\": \"4cf9731716474de499d21cab09654a53\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 19, \"children\": [{\"counts\": 2, \"id\": \"456850be1a374bb4be53a12fe536a13b\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 12, \"children\": [], \"contentId\": \"4693b99518dc47cdb5c9c0208e42fbe1\", \"name\": \"Addition 2 digit\"}, {\"counts\": 2, \"id\": \"a357a611790049fe9b9f8c0fd65ce553\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 7, \"children\": [], \"contentId\": \"1c5b58ea0aae4ec88fd0c3baabdf7029\", \"name\": \"Addition 3 digit\"}], \"contentId\": \"1f570cd04dd746e4bc570c952cc0a492\", \"name\": \"Addition\"}], \"contentId\": \"5e3cea43f5e1411599132065b56f8934\", \"name\": \"Mastered topics\"}]}',5),('2302e4a80b504b5a840b44f478ba2b8e','2 digit Substraction','553598e782eb4252978e13dff045276e','5e3cea43f5e1411599132065b56f8934',4,'{\"counts\": 1, \"id\": \"2302e4a80b504b5a840b44f478ba2b8e\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 4, \"children\": [], \"contentId\": \"553598e782eb4252978e13dff045276e\", \"name\": \"2 digit Substraction\"}',1),('304551b0adb74ac8bc920de706e0c891','Subtraction','0236721c120340f79ed052e8bf884c21','5e3cea43f5e1411599132065b56f8934',4,'{\"counts\": 1, \"id\": \"304551b0adb74ac8bc920de706e0c891\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 4, \"children\": [{\"counts\": 1, \"id\": \"2302e4a80b504b5a840b44f478ba2b8e\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 4, \"children\": [], \"contentId\": \"553598e782eb4252978e13dff045276e\", \"name\": \"2 digit Substraction\"}], \"contentId\": \"0236721c120340f79ed052e8bf884c21\", \"name\": \"Subtraction\"}',1),('456850be1a374bb4be53a12fe536a13b','Addition 2 digit','4693b99518dc47cdb5c9c0208e42fbe1','5e3cea43f5e1411599132065b56f8934',12,'{\"counts\": 2, \"id\": \"456850be1a374bb4be53a12fe536a13b\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 12, \"children\": [], \"contentId\": \"4693b99518dc47cdb5c9c0208e42fbe1\", \"name\": \"Addition 2 digit\"}',2),('4cf9731716474de499d21cab09654a53','Addition','1f570cd04dd746e4bc570c952cc0a492','5e3cea43f5e1411599132065b56f8934',19,'{\"counts\": 4, \"id\": \"4cf9731716474de499d21cab09654a53\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 19, \"children\": [{\"counts\": 2, \"id\": \"456850be1a374bb4be53a12fe536a13b\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 12, \"children\": [], \"contentId\": \"4693b99518dc47cdb5c9c0208e42fbe1\", \"name\": \"Addition 2 digit\"}, {\"counts\": 2, \"id\": \"a357a611790049fe9b9f8c0fd65ce553\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 7, \"children\": [], \"contentId\": \"1c5b58ea0aae4ec88fd0c3baabdf7029\", \"name\": \"Addition 3 digit\"}], \"contentId\": \"1f570cd04dd746e4bc570c952cc0a492\", \"name\": \"Addition\"}',4),('5e3cea43f5e1411599132065b56f8934','Mastered topics','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934',23,'{\"counts\": 5, \"id\": \"5e3cea43f5e1411599132065b56f8934\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 23, \"children\": [{\"counts\": 1, \"id\": \"304551b0adb74ac8bc920de706e0c891\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 4, \"children\": [{\"counts\": 1, \"id\": \"2302e4a80b504b5a840b44f478ba2b8e\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 4, \"children\": [], \"contentId\": \"553598e782eb4252978e13dff045276e\", \"name\": \"2 digit Substraction\"}], \"contentId\": \"0236721c120340f79ed052e8bf884c21\", \"name\": \"Subtraction\"}, {\"counts\": 4, \"id\": \"4cf9731716474de499d21cab09654a53\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 19, \"children\": [{\"counts\": 2, \"id\": \"456850be1a374bb4be53a12fe536a13b\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 12, \"children\": [], \"contentId\": \"4693b99518dc47cdb5c9c0208e42fbe1\", \"name\": \"Addition 2 digit\"}, {\"counts\": 2, \"id\": \"a357a611790049fe9b9f8c0fd65ce553\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 7, \"children\": [], \"contentId\": \"1c5b58ea0aae4ec88fd0c3baabdf7029\", \"name\": \"Addition 3 digit\"}], \"contentId\": \"1f570cd04dd746e4bc570c952cc0a492\", \"name\": \"Addition\"}], \"contentId\": \"5e3cea43f5e1411599132065b56f8934\", \"name\": \"Mastered topics\"}',5),('a357a611790049fe9b9f8c0fd65ce553','Addition 3 digit','1c5b58ea0aae4ec88fd0c3baabdf7029','5e3cea43f5e1411599132065b56f8934',7,'{\"counts\": 2, \"id\": \"a357a611790049fe9b9f8c0fd65ce553\", \"channelId\": \"5e3cea43f5e1411599132065b56f8934\", \"total\": 7, \"children\": [], \"contentId\": \"1c5b58ea0aae4ec88fd0c3baabdf7029\", \"name\": \"Addition 3 digit\"}',2);
/*!40000 ALTER TABLE `account_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_latestfetchdate`
--

DROP TABLE IF EXISTS `account_latestfetchdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_latestfetchdate` (
  `date_id` int(11) NOT NULL AUTO_INCREMENT,
  `latest_date` datetime(6) NOT NULL,
  PRIMARY KEY (`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_latestfetchdate`
--

LOCK TABLES `account_latestfetchdate` WRITE;
/*!40000 ALTER TABLE `account_latestfetchdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_latestfetchdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_masterylevelclass`
--

DROP TABLE IF EXISTS `account_masterylevelclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_masterylevelclass` (
  `id` varchar(40) NOT NULL,
  `content_id` varchar(32) NOT NULL,
  `channel_id` varchar(32) NOT NULL,
  `date` datetime(6) NOT NULL,
  `completed_questions` int(11) DEFAULT '0',
  `correct_questions` int(11) DEFAULT '0',
  `attempt_questions` int(11) DEFAULT '0',
  `mastered` int(11) DEFAULT '0',
  `class_id_id` bigint(20) NOT NULL,
  `attempt_exercise` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_masterylevel_class_id_id_43c6a64b_fk_account_u` (`class_id_id`),
  KEY `index2` (`class_id_id`,`date`),
  CONSTRAINT `account_masterylevel_class_id_id_43c6a64b_fk_account_u` FOREIGN KEY (`class_id_id`) REFERENCES `account_userinfoclass` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_masterylevelclass`
--

LOCK TABLES `account_masterylevelclass` WRITE;
/*!40000 ALTER TABLE `account_masterylevelclass` DISABLE KEYS */;
INSERT INTO `account_masterylevelclass` VALUES ('06261230-2ed6-4225-a73d-4339ca5b9623','de82734c2c6b4f1f93840b026c3ad3d6','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,8255034543823824876,0),('0c66b5b7-5a78-45cf-a48a-22f8b30a0a8c','3bb62ce084fd41789e1e13ce7cd18d72','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',8,8,8,2,8255034543823824876,0),('12f31c56-2904-4462-ad6f-3e29422c9154','1284fb50a5ab430eaa89c94dcbc16f3d','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',20,19,20,1,4442713939809300855,0),('233c85e4-2370-478f-bac3-22353dde1e48','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',8,8,8,2,8255034543823824876,0),('24e9fab2-f646-4e5a-af7b-a170737de0aa','304551b0adb74ac8bc920de706e0c891','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',8,7,8,1,4442713939809300855,0),('27e0c9a2-0b3d-4f16-894c-36c6b74d702a','456850be1a374bb4be53a12fe536a13b','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',14,13,15,2,8255034543823824876,0),('3b469e6a-d499-4dd3-aa65-3bff2b9fd931','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',14,13,15,2,8255034543823824876,0),('3dc2e716-34b2-4ce6-9d52-7351de493538','2302e4a80b504b5a840b44f478ba2b8e','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',8,7,8,1,4442713939809300855,0),('4a73c1ef-80e1-43bd-a01e-befb17326a2b','de82734c2c6b4f1f93840b026c3ad3d6','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',8,7,8,1,4442713939809300855,0),('53784e04-e2b6-4eb8-974a-3eb265f4376c','','','2018-02-15 00:00:00.000000',28,26,28,2,4442713939809300855,0),('5c4a7184-8123-4f8d-9f72-13a17642e878','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',8,8,8,2,8255034543823824876,0),('61fdbf88-e7e9-4b72-8aee-81d23f917b21','2fc92e9492084b9282dedefab529427c','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',4,4,4,1,8255034543823824876,0),('7b42846d-e4b9-484d-9d9d-cfbe1ed5da18','a357a611790049fe9b9f8c0fd65ce553','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',20,19,20,1,4442713939809300855,0),('8da546a5-38d1-44f5-a6e6-35060713a318','3bb62ce084fd41789e1e13ce7cd18d72','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',10,9,11,1,8255034543823824876,0),('8fded795-8918-4b4d-90f6-96fffe56d129','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',28,26,28,2,4442713939809300855,0),('aad61e26-1204-4d5c-90c1-6862f64e4276','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',14,13,15,2,8255034543823824876,0),('aba8c87f-f5aa-4b90-950b-39be41f98e17','2302e4a80b504b5a840b44f478ba2b8e','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,8255034543823824876,0),('ad1142e5-6dba-4826-a679-627d65c92165','','','2018-02-08 00:00:00.000000',4,4,4,1,8255034543823824876,0),('b3185f59-7d9b-4ad9-9e3c-a008318c1053','304551b0adb74ac8bc920de706e0c891','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,8255034543823824876,0),('bae20655-32e4-4708-a778-8f784d71347d','456850be1a374bb4be53a12fe536a13b','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',8,8,8,2,8255034543823824876,0),('d7b337b4-e751-4a8a-a5d6-a4426f835b33','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',20,19,20,1,4442713939809300855,0),('d8b139f7-bdb9-4e91-a97b-f18ea0e936af','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,8255034543823824876,0),('dc474f26-8b69-42a8-ab20-cea546134040','','','2018-01-30 00:00:00.000000',8,8,8,2,8255034543823824876,0),('e56494e2-c24f-485c-80c8-6dde57cd177f','','','2018-01-23 00:00:00.000000',14,13,15,2,8255034543823824876,0);
/*!40000 ALTER TABLE `account_masterylevelclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_masterylevelschool`
--

DROP TABLE IF EXISTS `account_masterylevelschool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_masterylevelschool` (
  `id` varchar(40) NOT NULL,
  `content_id` varchar(32) NOT NULL,
  `channel_id` varchar(32) NOT NULL,
  `date` datetime(6) NOT NULL,
  `completed_questions` int(11) DEFAULT '0',
  `correct_questions` int(11) DEFAULT '0',
  `attempt_questions` int(11) DEFAULT '0',
  `mastered` int(11) DEFAULT '0',
  `school_id_id` bigint(20) NOT NULL,
  `attempt_exercise` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_masterylevel_school_id_id_6c90c6c6_fk_account_u` (`school_id_id`),
  KEY `index3` (`school_id_id`,`date`),
  KEY `index1` (`school_id_id`,`date`),
  CONSTRAINT `account_masterylevel_school_id_id_6c90c6c6_fk_account_u` FOREIGN KEY (`school_id_id`) REFERENCES `account_userinfoschool` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_masterylevelschool`
--

LOCK TABLES `account_masterylevelschool` WRITE;
/*!40000 ALTER TABLE `account_masterylevelschool` DISABLE KEYS */;
INSERT INTO `account_masterylevelschool` VALUES ('0c7d3e56-f5a3-4a37-a4df-7cc8e8a618a0','3bb62ce084fd41789e1e13ce7cd18d72','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',10,9,11,1,6153480060106634541,0),('14cc5456-c8dd-40d6-8dc1-f20c4354d2e5','','','2018-01-30 00:00:00.000000',8,8,8,2,6153480060106634541,0),('1c781d4b-52cc-4d2b-8e60-07af800e49fd','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',14,13,15,2,6153480060106634541,0),('22b1ce5c-67b6-4c2a-bd2e-6bbe2b03d5ac','2302e4a80b504b5a840b44f478ba2b8e','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,6153480060106634541,0),('3a1d701d-2791-4721-9a7a-cac46a462747','de82734c2c6b4f1f93840b026c3ad3d6','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',8,7,8,1,6153480060106634541,0),('3b830192-b270-4dea-9717-6eef168e887e','','','2018-01-23 00:00:00.000000',14,13,15,2,6153480060106634541,0),('414d2236-9544-4535-9225-cff5c3f90e8e','','','2018-02-08 00:00:00.000000',4,4,4,1,6153480060106634541,0),('458c7689-11cb-4f60-86ed-8dc855ba9cd3','a357a611790049fe9b9f8c0fd65ce553','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',20,19,20,1,6153480060106634541,0),('4cc0fa2e-ccd6-4c73-af8e-d267429210f0','2fc92e9492084b9282dedefab529427c','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',4,4,4,1,6153480060106634541,0),('588edda1-f043-4502-80d7-6b2b891e96d3','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',20,19,20,1,6153480060106634541,0),('64bae811-0a77-4e8d-9d2e-7829640b5118','2302e4a80b504b5a840b44f478ba2b8e','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',8,7,8,1,6153480060106634541,0),('676d5a36-e231-4568-af31-e8aecc1bcd3c','456850be1a374bb4be53a12fe536a13b','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',8,8,8,2,6153480060106634541,0),('695d072e-6d90-4afc-8a78-1865fca30e76','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',8,8,8,2,6153480060106634541,0),('6c8a6b8e-a5bf-4d90-bc9e-3170e4501b0b','','','2018-02-15 00:00:00.000000',28,26,28,2,6153480060106634541,0),('71da596d-f528-4f62-9821-eb52c7532c4f','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',8,8,8,2,6153480060106634541,0),('a3bbfc05-1096-40c9-b530-ad78e08f00d8','304551b0adb74ac8bc920de706e0c891','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',8,7,8,1,6153480060106634541,0),('a9ad7e00-425c-42bf-9bf5-b2285514b86c','1284fb50a5ab430eaa89c94dcbc16f3d','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',20,19,20,1,6153480060106634541,0),('aecd730d-103b-4ced-9d24-d450bf036d4b','3bb62ce084fd41789e1e13ce7cd18d72','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',8,8,8,2,6153480060106634541,0),('b6c50997-6662-44be-8e7f-d6a9e84c7776','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',14,13,15,2,6153480060106634541,0),('b76dcbb5-9dde-4119-adaa-3057cfb9afc4','de82734c2c6b4f1f93840b026c3ad3d6','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,6153480060106634541,0),('cc9941d8-94f1-4e12-b68e-c66278c36ac4','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',28,26,28,2,6153480060106634541,0),('cef656fc-9080-4ff9-b4fb-4bc0dfa6461d','456850be1a374bb4be53a12fe536a13b','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',14,13,15,2,6153480060106634541,0),('e6cb0dd9-7dc9-4232-ae03-ac479ecfbca7','304551b0adb74ac8bc920de706e0c891','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,6153480060106634541,0),('f49f5d3e-423b-4726-a6de-1e432083efb7','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,6153480060106634541,0);
/*!40000 ALTER TABLE `account_masterylevelschool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_masterylevelstudent`
--

DROP TABLE IF EXISTS `account_masterylevelstudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_masterylevelstudent` (
  `id` varchar(40) NOT NULL,
  `content_id` varchar(32) NOT NULL,
  `channel_id` varchar(32) NOT NULL,
  `date` datetime(6) NOT NULL,
  `completed_questions` int(11) DEFAULT '0',
  `correct_questions` int(11) DEFAULT '0',
  `attempt_questions` int(11) DEFAULT '0',
  `mastered` int(11) DEFAULT '0',
  `student_id_id` bigint(20) NOT NULL,
  `attempt_exercise` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_masterylevel_student_id_id_2c4b5f23_fk_account_u` (`student_id_id`),
  CONSTRAINT `account_masterylevel_student_id_id_2c4b5f23_fk_account_u` FOREIGN KEY (`student_id_id`) REFERENCES `account_userinfostudent` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_masterylevelstudent`
--

LOCK TABLES `account_masterylevelstudent` WRITE;
/*!40000 ALTER TABLE `account_masterylevelstudent` DISABLE KEYS */;
INSERT INTO `account_masterylevelstudent` VALUES ('0658e1cf-e887-4d9b-b319-3ef0eba6fc3c','456850be1a374bb4be53a12fe536a13b','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',4,4,4,1,9065320658351469266,0),('1050c2c7-5a7a-43e0-9535-7193900f528c','de82734c2c6b4f1f93840b026c3ad3d6','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,1438424032786975274,0),('1340b2e5-dc25-43b7-89c3-00e479266f93','3bb62ce084fd41789e1e13ce7cd18d72','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',10,9,11,1,5145824466755249105,0),('1959ef99-3f56-44fc-b188-c2bcece27c15','3bb62ce084fd41789e1e13ce7cd18d72','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',4,4,4,1,1438424032786975274,0),('2e43afa5-b0fc-4cb5-80dd-c92b68a132db','','','2018-01-30 00:00:00.000000',4,4,4,1,9065320658351469266,0),('34059f16-d619-48a5-a286-f177259cebe7','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',4,4,4,1,9065320658351469266,0),('3904997a-39d1-490d-85e3-82dd3ac4372d','456850be1a374bb4be53a12fe536a13b','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',10,9,11,1,5145824466755249105,0),('3976fa27-9a36-457e-ad87-8635ea63c82c','','','2018-01-23 00:00:00.000000',4,4,4,1,1438424032786975274,0),('3f70bfad-249b-4365-a216-b462aaae9adb','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',10,9,11,1,5145824466755249105,0),('478996e8-e03e-486a-a434-dd01fbfb3b7f','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',4,4,4,1,1438424032786975274,0),('47fcc7fd-b6e9-4cff-ad01-b6ff666b0ed1','','','2018-02-15 00:00:00.000000',28,26,28,2,7606172226513702551,0),('4ffb3db3-ecb0-4f62-9325-ae874ce6837a','a357a611790049fe9b9f8c0fd65ce553','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',20,19,20,1,7606172226513702551,0),('57a405da-00dc-4c7c-9188-27befbb06b05','3bb62ce084fd41789e1e13ce7cd18d72','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',4,4,4,1,9065320658351469266,0),('7afd0d11-d76b-480f-b249-b75d4d967a84','2fc92e9492084b9282dedefab529427c','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',4,4,4,1,1438424032786975274,0),('92777b74-93f9-49c6-aac2-3391fbd65eb6','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',10,9,11,1,5145824466755249105,0),('985ee9c6-c743-4856-8f92-19135cc42fa3','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',28,26,28,2,7606172226513702551,0),('9aa947f9-233f-4470-96fe-2e38c98a6f11','304551b0adb74ac8bc920de706e0c891','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',8,7,8,1,7606172226513702551,0),('9b5bf02c-b45f-4bd7-94b4-7728a5958c87','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',4,4,4,1,1438424032786975274,0),('9ceaf0ce-d978-467f-b372-e4fc07410e03','456850be1a374bb4be53a12fe536a13b','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',4,4,4,1,1438424032786975274,0),('c18e7cff-2201-4df6-83af-0c3146d1feb6','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',4,4,4,1,1438424032786975274,0),('c76d840a-d45d-459b-982c-8b95d774c0fc','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-01-30 00:00:00.000000',4,4,4,1,9065320658351469266,0),('cd08bb70-cc3d-4e76-8280-c4e500947acf','','','2018-01-23 00:00:00.000000',10,9,11,1,5145824466755249105,0),('d3da9cc8-7958-418d-aa63-f5146d446431','','','2018-02-08 00:00:00.000000',4,4,4,1,1438424032786975274,0),('d656c119-ff60-43a5-a8b4-a275146e6e3a','1284fb50a5ab430eaa89c94dcbc16f3d','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',20,19,20,1,7606172226513702551,0),('d765b8d5-c9ae-48c6-bcd2-e52cc6cefd01','304551b0adb74ac8bc920de706e0c891','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,1438424032786975274,0),('d888d6a5-9ef0-486f-ac04-6fac5599caee','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',4,4,4,1,1438424032786975274,0),('db303600-14ec-4679-be82-6184da2fd38c','2302e4a80b504b5a840b44f478ba2b8e','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,1438424032786975274,0),('e28c515a-357a-4588-b404-44ca3aa50feb','2302e4a80b504b5a840b44f478ba2b8e','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',8,7,8,1,7606172226513702551,0),('e652698f-5c19-4a72-9810-236f4e1bea5b','de82734c2c6b4f1f93840b026c3ad3d6','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',8,7,8,1,7606172226513702551,0),('eae6f8b4-a609-4ac5-8385-88411357b14f','','','2018-01-30 00:00:00.000000',4,4,4,1,1438424032786975274,0),('ebe1ea13-107c-466b-8451-5692bacaeb07','5e3cea43f5e1411599132065b56f8934','5e3cea43f5e1411599132065b56f8934','2018-02-08 00:00:00.000000',4,4,4,1,1438424032786975274,0),('f506970f-f81a-4a5f-a53f-ba220fadb076','456850be1a374bb4be53a12fe536a13b','5e3cea43f5e1411599132065b56f8934','2018-01-23 00:00:00.000000',4,4,4,1,1438424032786975274,0),('f576243e-f645-4402-b6bf-2b29623a4ff5','4cf9731716474de499d21cab09654a53','5e3cea43f5e1411599132065b56f8934','2018-02-15 00:00:00.000000',20,19,20,1,7606172226513702551,0);
/*!40000 ALTER TABLE `account_masterylevelstudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_userinfoclass`
--

DROP TABLE IF EXISTS `account_userinfoclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_userinfoclass` (
  `class_id` bigint(20) NOT NULL,
  `class_name` varchar(60) NOT NULL,
  `parent` bigint(20) NOT NULL,
  `total_students` int(11) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_userinfoclass`
--

LOCK TABLES `account_userinfoclass` WRITE;
/*!40000 ALTER TABLE `account_userinfoclass` DISABLE KEYS */;
INSERT INTO `account_userinfoclass` VALUES (4442713939809300855,'Grade-4',6153480060106634541,1),(8255034543823824876,'Grade 3',6153480060106634541,3);
/*!40000 ALTER TABLE `account_userinfoclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_userinfoschool`
--

DROP TABLE IF EXISTS `account_userinfoschool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_userinfoschool` (
  `school_id` bigint(20) NOT NULL,
  `school_name` varchar(60) NOT NULL,
  `total_students` int(11) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_userinfoschool`
--

LOCK TABLES `account_userinfoschool` WRITE;
/*!40000 ALTER TABLE `account_userinfoschool` DISABLE KEYS */;
INSERT INTO `account_userinfoschool` VALUES (6153480060106634541,'SC-V2',4);
/*!40000 ALTER TABLE `account_userinfoschool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_userinfostudent`
--

DROP TABLE IF EXISTS `account_userinfostudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_userinfostudent` (
  `student_id` bigint(20) NOT NULL,
  `student_name` varchar(60) NOT NULL,
  `parent` bigint(20) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_userinfostudent`
--

LOCK TABLES `account_userinfostudent` WRITE;
/*!40000 ALTER TABLE `account_userinfostudent` DISABLE KEYS */;
INSERT INTO `account_userinfostudent` VALUES (1438424032786975274,'sam',8255034543823824876),(5145824466755249105,'sagar',8255034543823824876),(7606172226513702551,'kushal',4442713939809300855),(9065320658351469266,'raj',8255034543823824876);
/*!40000 ALTER TABLE `account_userinfostudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_userrolecollectionmapping`
--

DROP TABLE IF EXISTS `account_userrolecollectionmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_userrolecollectionmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id_id` bigint(20) DEFAULT NULL,
  `institute_id_id` bigint(20) DEFAULT NULL,
  `user_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_userrolecoll_class_id_id_741a9b71_fk_account_u` (`class_id_id`),
  KEY `account_userrolecoll_institute_id_id_73d063ae_fk_account_u` (`institute_id_id`),
  KEY `account_userrolecoll_user_id_id_655231a4_fk_auth_user` (`user_id_id`),
  CONSTRAINT `account_userrolecoll_class_id_id_741a9b71_fk_account_u` FOREIGN KEY (`class_id_id`) REFERENCES `account_userinfoclass` (`class_id`),
  CONSTRAINT `account_userrolecoll_institute_id_id_73d063ae_fk_account_u` FOREIGN KEY (`institute_id_id`) REFERENCES `account_userinfoschool` (`school_id`),
  CONSTRAINT `account_userrolecoll_user_id_id_655231a4_fk_auth_user` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_userrolecollectionmapping`
--

LOCK TABLES `account_userrolecollectionmapping` WRITE;
/*!40000 ALTER TABLE `account_userrolecollectionmapping` DISABLE KEYS */;
INSERT INTO `account_userrolecollectionmapping` VALUES (4,NULL,6153480060106634541,5);
/*!40000 ALTER TABLE `account_userrolecollectionmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Board Member'),(2,'School Leader'),(3,'Teacher');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info student',7,'add_userinfostudent'),(20,'Can change user info student',7,'change_userinfostudent'),(21,'Can delete user info student',7,'delete_userinfostudent'),(22,'Can add user role collection mapping',8,'add_userrolecollectionmapping'),(23,'Can change user role collection mapping',8,'change_userrolecollectionmapping'),(24,'Can delete user role collection mapping',8,'delete_userrolecollectionmapping'),(25,'Can add mastery level student',9,'add_masterylevelstudent'),(26,'Can change mastery level student',9,'change_masterylevelstudent'),(27,'Can delete mastery level student',9,'delete_masterylevelstudent'),(28,'Can add latest fetch date',10,'add_latestfetchdate'),(29,'Can change latest fetch date',10,'change_latestfetchdate'),(30,'Can delete latest fetch date',10,'delete_latestfetchdate'),(31,'Can add content',11,'add_content'),(32,'Can change content',11,'change_content'),(33,'Can delete content',11,'delete_content'),(34,'Can add user info school',12,'add_userinfoschool'),(35,'Can change user info school',12,'change_userinfoschool'),(36,'Can delete user info school',12,'delete_userinfoschool'),(37,'Can add user info class',13,'add_userinfoclass'),(38,'Can change user info class',13,'change_userinfoclass'),(39,'Can delete user info class',13,'delete_userinfoclass'),(40,'Can add mastery level school',14,'add_masterylevelschool'),(41,'Can change mastery level school',14,'change_masterylevelschool'),(42,'Can delete mastery level school',14,'delete_masterylevelschool'),(43,'Can add mastery level class',15,'add_masterylevelclass'),(44,'Can change mastery level class',15,'change_masterylevelclass'),(45,'Can delete mastery level class',15,'delete_masterylevelclass'),(46,'Can add access attempt',16,'add_accessattempt'),(47,'Can change access attempt',16,'change_accessattempt'),(48,'Can delete access attempt',16,'delete_accessattempt'),(49,'Can add access log',17,'add_accesslog'),(50,'Can change access log',17,'change_accesslog'),(51,'Can delete access log',17,'delete_accesslog'),(52,'Can add school',18,'add_school'),(53,'Can change school',18,'change_school'),(54,'Can delete school',18,'delete_school'),(55,'Can add class',19,'add_class'),(56,'Can change class',19,'change_class'),(57,'Can delete class',19,'delete_class'),(58,'Can add student',20,'add_student'),(59,'Can change student',20,'change_student'),(60,'Can delete student',20,'delete_student');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$DxYD1n9LfJVW$rFNs3EoriSvhnydTzB5boPMTIdGOyfZ0zoScXwPcNIg=','2018-03-12 06:18:53.623007',1,'yogesh','yogesh','','',0,1,'2018-02-27 06:06:04.846262'),(5,'pbkdf2_sha256$36000$43qO2afLTBxj$MVK73iogAl8TwL+0ItK2skU9/8PTymLFkfKxwjE4ADg=','2018-03-06 09:04:06.309201',0,'test','test','test','yogesh.mhaskule@gmail.com',0,1,'2018-02-27 10:48:12.973301');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (4,5,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `axes_accessattempt`
--

DROP TABLE IF EXISTS `axes_accessattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `axes_accessattempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `trusted` tinyint(1) NOT NULL,
  `http_accept` varchar(1025) NOT NULL,
  `path_info` varchar(255) NOT NULL,
  `attempt_time` datetime(6) NOT NULL,
  `get_data` longtext NOT NULL,
  `post_data` longtext NOT NULL,
  `failures_since_start` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `axes_accessattempt_ip_address_10922d9c` (`ip_address`),
  KEY `axes_accessattempt_trusted_0eddf52e` (`trusted`),
  KEY `axes_accessattempt_user_agent_ad89678b` (`user_agent`),
  KEY `axes_accessattempt_username_3f2d4ca0` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `axes_accessattempt`
--

LOCK TABLES `axes_accessattempt` WRITE;
/*!40000 ALTER TABLE `axes_accessattempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `axes_accessattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `axes_accesslog`
--

DROP TABLE IF EXISTS `axes_accesslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `axes_accesslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `trusted` tinyint(1) NOT NULL,
  `http_accept` varchar(1025) NOT NULL,
  `path_info` varchar(255) NOT NULL,
  `attempt_time` datetime(6) NOT NULL,
  `logout_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `axes_accesslog_ip_address_86b417e5` (`ip_address`),
  KEY `axes_accesslog_trusted_496c5681` (`trusted`),
  KEY `axes_accesslog_user_agent_0e659004` (`user_agent`),
  KEY `axes_accesslog_username_df93064b` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `axes_accesslog`
--

LOCK TABLES `axes_accesslog` WRITE;
/*!40000 ALTER TABLE `axes_accesslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `axes_accesslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'account','content'),(10,'account','latestfetchdate'),(15,'account','masterylevelclass'),(14,'account','masterylevelschool'),(9,'account','masterylevelstudent'),(13,'account','userinfoclass'),(12,'account','userinfoschool'),(7,'account','userinfostudent'),(8,'account','userrolecollectionmapping'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(16,'axes','accessattempt'),(17,'axes','accesslog'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(19,'usersession','class'),(18,'usersession','school'),(20,'usersession','student');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-09-25 10:23:29.722914'),(2,'auth','0001_initial','2017-09-25 10:23:32.773277'),(3,'account','0001_initial','2017-09-25 10:23:36.277314'),(4,'admin','0001_initial','2017-09-25 10:23:36.780190'),(5,'admin','0002_logentry_remove_auto_add','2017-09-25 10:23:37.082947'),(6,'contenttypes','0002_remove_content_type_name','2017-09-25 10:23:37.435681'),(7,'auth','0002_alter_permission_name_max_length','2017-09-25 10:23:37.606551'),(8,'auth','0003_alter_user_email_max_length','2017-09-25 10:23:37.807207'),(9,'auth','0004_alter_user_username_opts','2017-09-25 10:23:37.822433'),(10,'auth','0005_alter_user_last_login_null','2017-09-25 10:23:37.972422'),(11,'auth','0006_require_contenttypes_0002','2017-09-25 10:23:37.975640'),(12,'auth','0007_alter_validators_add_error_messages','2017-09-25 10:23:37.990858'),(13,'auth','0008_alter_user_username_max_length','2017-09-25 10:23:38.155144'),(14,'axes','0001_initial','2017-09-25 10:23:38.490732'),(15,'axes','0002_auto_20151217_2044','2017-09-25 10:23:40.450115'),(16,'axes','0003_auto_20160322_0929','2017-09-25 10:23:40.484568'),(17,'sessions','0001_initial','2017-09-25 10:23:40.818900'),(18,'account','0002_auto_20180220_1144','2018-03-06 09:12:27.388117'),(19,'usersession','0001_initial','2018-03-06 09:14:06.638792'),(20,'usersession','0002_auto_20180220_1240','2018-03-06 09:14:06.643038'),(21,'usersession','0003_auto_20180220_1242','2018-03-06 09:14:06.714135'),(22,'account','0003_auto_20180306_0911','2018-03-06 09:18:57.662791'),(23,'account','0004_auto_20180312_0527','2018-03-12 05:28:16.593819');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('atqsag5gzc6idkaq8zu4mvdjm98c9jhv','ZGFlN2ZkMzY2ZDI5YzdjNTFiODJhYTNlZGUwZDg0NjNkYTU4NDY0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNjgxNTJhZTNkNzM4OWNjODNjOWY5NWZiNDUyYTk0NjU0ZDFmM2Q2In0=','2018-03-26 06:18:53.664039');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersession_class`
--

DROP TABLE IF EXISTS `usersession_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersession_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `total_usage` bigint(20) NOT NULL,
  `class_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersession_class_class_id_id_21ac7cc0_fk_account_u` (`class_id_id`),
  KEY `index6` (`class_id_id`,`date`),
  CONSTRAINT `usersession_class_class_id_id_21ac7cc0_fk_account_u` FOREIGN KEY (`class_id_id`) REFERENCES `account_userinfoclass` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersession_class`
--

LOCK TABLES `usersession_class` WRITE;
/*!40000 ALTER TABLE `usersession_class` DISABLE KEYS */;
INSERT INTO `usersession_class` VALUES (1,'2018-01-23 00:00:00.000000',434,8255034543823824876),(2,'2018-01-30 00:00:00.000000',372,8255034543823824876),(3,'2018-02-06 00:00:00.000000',0,8255034543823824876),(4,'2018-02-08 00:00:00.000000',37,8255034543823824876),(5,'2018-02-15 00:00:00.000000',4716,4442713939809300855),(6,'2018-02-15 00:00:00.000000',38,8255034543823824876),(7,'2018-02-21 00:00:00.000000',25,4442713939809300855);
/*!40000 ALTER TABLE `usersession_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersession_school`
--

DROP TABLE IF EXISTS `usersession_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersession_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `total_usage` bigint(20) NOT NULL,
  `school_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersession_school_school_id_id_e3515999_fk_account_u` (`school_id_id`),
  KEY `index5` (`school_id_id`,`date`),
  CONSTRAINT `usersession_school_school_id_id_e3515999_fk_account_u` FOREIGN KEY (`school_id_id`) REFERENCES `account_userinfoschool` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersession_school`
--

LOCK TABLES `usersession_school` WRITE;
/*!40000 ALTER TABLE `usersession_school` DISABLE KEYS */;
INSERT INTO `usersession_school` VALUES (1,'2018-01-23 00:00:00.000000',434,6153480060106634541),(2,'2018-01-30 00:00:00.000000',372,6153480060106634541),(3,'2018-02-06 00:00:00.000000',0,6153480060106634541),(4,'2018-02-08 00:00:00.000000',37,6153480060106634541),(5,'2018-02-15 00:00:00.000000',4754,6153480060106634541),(6,'2018-02-21 00:00:00.000000',25,6153480060106634541);
/*!40000 ALTER TABLE `usersession_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersession_student`
--

DROP TABLE IF EXISTS `usersession_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersession_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `total_usage` bigint(20) NOT NULL,
  `student_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersession_student_student_id_id_0ec25e0e_fk_account_u` (`student_id_id`),
  KEY `index4` (`student_id_id`,`date`),
  CONSTRAINT `usersession_student_student_id_id_0ec25e0e_fk_account_u` FOREIGN KEY (`student_id_id`) REFERENCES `account_userinfostudent` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersession_student`
--

LOCK TABLES `usersession_student` WRITE;
/*!40000 ALTER TABLE `usersession_student` DISABLE KEYS */;
INSERT INTO `usersession_student` VALUES (1,'2018-01-30 00:00:00.000000',151,9065320658351469266),(2,'2018-02-06 00:00:00.000000',0,1438424032786975274),(3,'2018-01-30 00:00:00.000000',2,5145824466755249105),(4,'2018-01-23 00:00:00.000000',379,5145824466755249105),(5,'2018-01-23 00:00:00.000000',55,1438424032786975274),(6,'2018-01-30 00:00:00.000000',219,1438424032786975274),(7,'2018-02-08 00:00:00.000000',37,1438424032786975274),(8,'2018-02-06 00:00:00.000000',0,9065320658351469266),(9,'2018-02-06 00:00:00.000000',0,5145824466755249105),(10,'2018-02-15 00:00:00.000000',38,9065320658351469266),(11,'2018-02-15 00:00:00.000000',4716,7606172226513702551),(12,'2018-02-21 00:00:00.000000',25,7606172226513702551);
/*!40000 ALTER TABLE `usersession_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-12 12:09:11
