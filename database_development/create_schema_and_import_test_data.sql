CREATE DATABASE  IF NOT EXISTS `course_enrollment_system` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `course_enrollment_system`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: course_enrollment_system
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `admin_list`
--

DROP TABLE IF EXISTS `admin_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_list` (
  `adm_id` varchar(10) NOT NULL,
  `adm_name` varchar(10) NOT NULL,
  `adm_school` varchar(45) NOT NULL,
  PRIMARY KEY (`adm_id`),
  CONSTRAINT `fk_admin_list_user_login_info1` FOREIGN KEY (`adm_id`) REFERENCES `user_login_info` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_list`
--

LOCK TABLES `admin_list` WRITE;
/*!40000 ALTER TABLE `admin_list` DISABLE KEYS */;
INSERT INTO `admin_list` VALUES ('3001','adm_1','school1');
/*!40000 ALTER TABLE `admin_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_info`
--

DROP TABLE IF EXISTS `class_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_info` (
  `class_id` varchar(10) NOT NULL,
  `class_name` varchar(45) NOT NULL,
  `class_credit` int NOT NULL,
  `class_room` varchar(10) NOT NULL,
  `class_capacity` int NOT NULL,
  `class_start_week` int NOT NULL,
  `class_end_week` int NOT NULL,
  `class_target_grade` varchar(10) NOT NULL,
  `class_start_time` int NOT NULL,
  `class_end_time` int NOT NULL,
  `class_day` int NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_info`
--

LOCK TABLES `class_info` WRITE;
/*!40000 ALTER TABLE `class_info` DISABLE KEYS */;
INSERT INTO `class_info` VALUES ('01','class1',2,'A101',30,1,6,'2018',1,2,0),('02','class2',3,'B202',20,7,12,'2018',3,4,0),('03','class3',2,'C303',30,1,12,'2019',5,6,0);
/*!40000 ALTER TABLE `class_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll_record`
--

DROP TABLE IF EXISTS `enroll_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll_record` (
  `enr_rec_id` int NOT NULL,
  `stu_id` varchar(10) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  PRIMARY KEY (`enr_rec_id`),
  KEY `stu_id_idx` (`stu_id`),
  KEY `class_id_idx` (`class_id`),
  CONSTRAINT `class_id_enr_rec` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`),
  CONSTRAINT `stu_id_enr_rec` FOREIGN KEY (`stu_id`) REFERENCES `student_list` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll_record`
--

LOCK TABLES `enroll_record` WRITE;
/*!40000 ALTER TABLE `enroll_record` DISABLE KEYS */;
INSERT INTO `enroll_record` VALUES (1,'1001','01'),(2,'1001','02'),(3,'1002','02'),(4,'1003','03');
/*!40000 ALTER TABLE `enroll_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_list`
--

DROP TABLE IF EXISTS `student_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_list` (
  `stu_id` varchar(10) NOT NULL,
  `stu_name` varchar(10) NOT NULL,
  `stu_school` varchar(45) NOT NULL,
  `stu_grade` varchar(10) NOT NULL,
  `stu_mail` varchar(45) NOT NULL,
  PRIMARY KEY (`stu_id`),
  CONSTRAINT `fk_student_list_user_login_info1` FOREIGN KEY (`stu_id`) REFERENCES `user_login_info` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_list`
--

LOCK TABLES `student_list` WRITE;
/*!40000 ALTER TABLE `student_list` DISABLE KEYS */;
INSERT INTO `student_list` VALUES ('1001','stu1','school1','2018','stu1@example.com'),('1002','stu2','school2','2018','stu2@example.com'),('1003','stu3','school1','2019','stu3@example.com');
/*!40000 ALTER TABLE `student_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach_record`
--

DROP TABLE IF EXISTS `teach_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teach_record` (
  `tch_rec_id` int NOT NULL,
  `tchr_id` varchar(10) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  PRIMARY KEY (`tch_rec_id`),
  KEY `tchr_id_idx` (`tchr_id`),
  KEY `class_id_idx` (`class_id`),
  CONSTRAINT `class_id_tch_rec` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`),
  CONSTRAINT `tchr_id_tch_rec` FOREIGN KEY (`tchr_id`) REFERENCES `teacher_list` (`tchr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach_record`
--

LOCK TABLES `teach_record` WRITE;
/*!40000 ALTER TABLE `teach_record` DISABLE KEYS */;
INSERT INTO `teach_record` VALUES (1,'2001','01'),(2,'2001','02'),(3,'2002','03');
/*!40000 ALTER TABLE `teach_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_list`
--

DROP TABLE IF EXISTS `teacher_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_list` (
  `tchr_id` varchar(10) NOT NULL,
  `tchr_name` varchar(10) NOT NULL,
  `tchr_school` varchar(45) NOT NULL,
  `tchr_title` varchar(45) NOT NULL,
  `tchr_mail` varchar(45) NOT NULL,
  PRIMARY KEY (`tchr_id`),
  CONSTRAINT `fk_teacher_list_user_login_info1` FOREIGN KEY (`tchr_id`) REFERENCES `user_login_info` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_list`
--

LOCK TABLES `teacher_list` WRITE;
/*!40000 ALTER TABLE `teacher_list` DISABLE KEYS */;
INSERT INTO `teacher_list` VALUES ('2001','teacher1','school1','professor','tchr1@example.com'),('2002','teacher2','school3','associate professor','tch2@example.com');
/*!40000 ALTER TABLE `teacher_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_info`
--

DROP TABLE IF EXISTS `user_login_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_info` (
  `usr_id` varchar(10) NOT NULL,
  `usr_pwd` varchar(45) NOT NULL,
  `usr_type` int NOT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_info`
--

LOCK TABLES `user_login_info` WRITE;
/*!40000 ALTER TABLE `user_login_info` DISABLE KEYS */;
INSERT INTO `user_login_info` VALUES ('1001','1001',1),('1002','1002',1),('1003','1003',1),('2001','2001',2),('2002','2002',2),('3001','3001',3);
/*!40000 ALTER TABLE `user_login_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-01 20:21:54
