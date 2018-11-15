-- MySQL dump 10.13  Distrib 5.7.12, for osx10.11 (x86_64)
--
-- Host: localhost    Database: nalanda_latest_db
-- ------------------------------------------------------
-- Server version	5.7.12
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
use test;

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
  `sub_topics_total` int(11) DEFAULT 0 NOT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_content`
--

LOCK TABLES `account_content` WRITE;
/*!40000 ALTER TABLE `account_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nalanda_latestfetchdate`
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
-- Dumping data for table `nalanda_latestfetchdate`
--

LOCK TABLES `account_latestfetchdate` WRITE;
/*!40000 ALTER TABLE `account_latestfetchdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_latestfetchdate` ENABLE KEYS */;
UNLOCK TABLES;

-- --
-- -- Table structure for table `account_latestfetchdate`
-- --

-- DROP TABLE IF EXISTS `account_latestfetchdate`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
-- CREATE TABLE `account_latestfetchdate` (
--   `date_id` int(11) NOT NULL AUTO_INCREMENT,
--   `latest_date` datetime(6) NOT NULL,
--   PRIMARY KEY (`date_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `account_latestfetchdate`
-- --

-- LOCK TABLES `account_latestfetchdate` WRITE;
-- /*!40000 ALTER TABLE `account_latestfetchdate` DISABLE KEYS */;
-- /*!40000 ALTER TABLE `account_latestfetchdate` ENABLE KEYS */;
-- UNLOCK TABLES;

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
  `completed_questions` int(11) DEFAULT 0,
  `correct_questions` int(11) DEFAULT 0,
  `attempt_questions` int(11) DEFAULT 0,
  `mastered` int(11) DEFAULT 0,
  `attempt_exercise` int(11) DEFAULT 0,
  `class_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_masterylevel_class_id_id_43c6a64b_fk_account_u` (`class_id_id`),
  CONSTRAINT `account_masterylevel_class_id_id_43c6a64b_fk_account_u` FOREIGN KEY (`class_id_id`) REFERENCES `account_userinfoclass` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index index2 on account_masterylevelclass(class_id_id,date);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_masterylevelclass`
--

LOCK TABLES `account_masterylevelclass` WRITE;
/*!40000 ALTER TABLE `account_masterylevelclass` DISABLE KEYS */;
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
  `completed_questions` int(11) DEFAULT 0,
  `correct_questions` int(11) DEFAULT 0,
  `attempt_questions` int(11) DEFAULT 0,
  `mastered` int(11) DEFAULT 0,
  `attempt_exercise` int(11) DEFAULT 0,
  -- `students_completed` int(11) DEFAULT 0,
  `school_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_masterylevel_school_id_id_6c90c6c6_fk_account_u` (`school_id_id`),
  CONSTRAINT `account_masterylevel_school_id_id_6c90c6c6_fk_account_u` FOREIGN KEY (`school_id_id`) REFERENCES `account_userinfoschool` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index index3 on account_masterylevelschool(school_id_id,date);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_masterylevelschool`
--

LOCK TABLES `account_masterylevelschool` WRITE;
/*!40000 ALTER TABLE `account_masterylevelschool` DISABLE KEYS */;
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
  `completed_questions` int(11) DEFAULT 0,
  `correct_questions` int(11) DEFAULT 0,
  `attempt_questions` int(11) DEFAULT 0,
  -- `completed` tinyint(1) DEFAULT 0,
  `mastered` int(11) DEFAULT 0,
  `attempt_exercise` int(11) DEFAULT 0,
  `student_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_masterylevel_student_id_id_2c4b5f23_fk_account_u` (`student_id_id`),
  CONSTRAINT `account_masterylevel_student_id_id_2c4b5f23_fk_account_u` FOREIGN KEY (`student_id_id`) REFERENCES `account_userinfostudent` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index index1 on account_masterylevelschool(school_id_id,date);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_masterylevelstudent`
--

LOCK TABLES `account_masterylevelstudent` WRITE;
/*!40000 ALTER TABLE `account_masterylevelstudent` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_userrolecollectionmapping`
--

LOCK TABLES `account_userrolecollectionmapping` WRITE;
/*!40000 ALTER TABLE `account_userrolecollectionmapping` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info student',7,'add_userinfostudent'),(20,'Can change user info student',7,'change_userinfostudent'),(21,'Can delete user info student',7,'delete_userinfostudent'),(22,'Can add user role collection mapping',8,'add_userrolecollectionmapping'),(23,'Can change user role collection mapping',8,'change_userrolecollectionmapping'),(24,'Can delete user role collection mapping',8,'delete_userrolecollectionmapping'),(25,'Can add mastery level student',9,'add_masterylevelstudent'),(26,'Can change mastery level student',9,'change_masterylevelstudent'),(27,'Can delete mastery level student',9,'delete_masterylevelstudent'),(28,'Can add latest fetch date',10,'add_latestfetchdate'),(29,'Can change latest fetch date',10,'change_latestfetchdate'),(30,'Can delete latest fetch date',10,'delete_latestfetchdate'),(31,'Can add content',11,'add_content'),(32,'Can change content',11,'change_content'),(33,'Can delete content',11,'delete_content'),(34,'Can add user info school',12,'add_userinfoschool'),(35,'Can change user info school',12,'change_userinfoschool'),(36,'Can delete user info school',12,'delete_userinfoschool'),(37,'Can add user info class',13,'add_userinfoclass'),(38,'Can change user info class',13,'change_userinfoclass'),(39,'Can delete user info class',13,'delete_userinfoclass'),(40,'Can add mastery level school',14,'add_masterylevelschool'),(41,'Can change mastery level school',14,'change_masterylevelschool'),(42,'Can delete mastery level school',14,'delete_masterylevelschool'),(43,'Can add mastery level class',15,'add_masterylevelclass'),(44,'Can change mastery level class',15,'change_masterylevelclass'),(45,'Can delete mastery level class',15,'delete_masterylevelclass'),(46,'Can add access attempt',16,'add_accessattempt'),(47,'Can change access attempt',16,'change_accessattempt'),(48,'Can delete access attempt',16,'delete_accessattempt'),(49,'Can add access log',17,'add_accesslog'),(50,'Can change access log',17,'change_accesslog'),(51,'Can delete access log',17,'delete_accesslog');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'account','content'),(10,'account','latestfetchdate'),(15,'account','masterylevelclass'),(14,'account','masterylevelschool'),(9,'account','masterylevelstudent'),(13,'account','userinfoclass'),(12,'account','userinfoschool'),(7,'account','userinfostudent'),(8,'account','userrolecollectionmapping'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(16,'axes','accessattempt'),(17,'axes','accesslog'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-09-25 10:23:29.722914'),(2,'auth','0001_initial','2017-09-25 10:23:32.773277'),(3,'account','0001_initial','2017-09-25 10:23:36.277314'),(4,'admin','0001_initial','2017-09-25 10:23:36.780190'),(5,'admin','0002_logentry_remove_auto_add','2017-09-25 10:23:37.082947'),(6,'contenttypes','0002_remove_content_type_name','2017-09-25 10:23:37.435681'),(7,'auth','0002_alter_permission_name_max_length','2017-09-25 10:23:37.606551'),(8,'auth','0003_alter_user_email_max_length','2017-09-25 10:23:37.807207'),(9,'auth','0004_alter_user_username_opts','2017-09-25 10:23:37.822433'),(10,'auth','0005_alter_user_last_login_null','2017-09-25 10:23:37.972422'),(11,'auth','0006_require_contenttypes_0002','2017-09-25 10:23:37.975640'),(12,'auth','0007_alter_validators_add_error_messages','2017-09-25 10:23:37.990858'),(13,'auth','0008_alter_user_username_max_length','2017-09-25 10:23:38.155144'),(14,'axes','0001_initial','2017-09-25 10:23:38.490732'),(15,'axes','0002_auto_20151217_2044','2017-09-25 10:23:40.450115'),(16,'axes','0003_auto_20160322_0929','2017-09-25 10:23:40.484568'),(17,'sessions','0001_initial','2017-09-25 10:23:40.818900');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

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
  CONSTRAINT `usersession_class_class_id_id_21ac7cc0_fk_account_u` FOREIGN KEY (`class_id_id`) REFERENCES `account_userinfoclass` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index index6 on usersession_class(class_id_id,date);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersession_class`
--

LOCK TABLES `usersession_class` WRITE;
/*!40000 ALTER TABLE `usersession_class` DISABLE KEYS */;
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
  CONSTRAINT `usersession_school_school_id_id_e3515999_fk_account_u` FOREIGN KEY (`school_id_id`) REFERENCES `account_userinfoschool` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index index5 on usersession_school(school_id_id,date);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersession_school`
--

LOCK TABLES `usersession_school` WRITE;
/*!40000 ALTER TABLE `usersession_school` DISABLE KEYS */;
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
  CONSTRAINT `usersession_student_student_id_id_0ec25e0e_fk_account_u` FOREIGN KEY (`student_id_id`) REFERENCES `account_userinfostudent` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index index4 on usersession_student(student_id_id,date);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersession_student`
--

LOCK TABLES `usersession_student` WRITE;
/*!40000 ALTER TABLE `usersession_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersession_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `exam_creation`
--

DROP TABLE IF EXISTS `exam_creation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_creation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(60) NOT NULL,
  `exam_count` int(11) NOT NULL,
  `active_exam_count` int(11) NOT NULL,
  `complete_exam_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_creation`
--

LOCK TABLES `exam_creation` WRITE;
/*!40000 ALTER TABLE `exam_creation` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_creation` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `exam_exam`
--

DROP TABLE IF EXISTS `exam_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_exam` (
  `id` varchar(40) NOT NULL,
  `exam_id` varchar(60) NOT NULL,
  `exam_title` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `channel_id` varchar(32) NOT NULL,
  `question_count` int(11) NOT NULL,
  `student_id` varchar(60) NOT NULL,
  `correct_questions` int(11) NOT NULL,
  `class_id` varchar(60) NOT NULL,
  `question_sources` longtext  NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_exam`
--

LOCK TABLES `exam_exam` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `lesson_lesson`
-- 
DROP TABLE IF EXISTS `lesson_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_lesson` (
  `id` varchar(40) NOT NULL,
  `lesson_id` char(32) NOT NULL,
  `lesson_name` varchar(60) NOT NULL,
  `class_id` char(32) NOT NULL,
  `lesson_content` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_lesson`
--

LOCK TABLES `lesson_lesson` WRITE;
/*!40000 ALTER TABLE `lesson_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_lesson` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25 15:54:55

