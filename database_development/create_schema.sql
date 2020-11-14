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
  `adm_mail` varchar(45) NOT NULL,
  `adm_avatar` blob,
  PRIMARY KEY (`adm_id`),
  CONSTRAINT `fk_admin_list_user_login_info1` FOREIGN KEY (`adm_id`) REFERENCES `user_login_info` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `class_current_enroll_count` int NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enroll_record`
--

DROP TABLE IF EXISTS `enroll_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll_record` (
  `enr_rec_id` int NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(10) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  PRIMARY KEY (`enr_rec_id`),
  KEY `stu_id_idx` (`stu_id`),
  KEY `class_id_idx` (`class_id`),
  CONSTRAINT `class_id_enr_rec` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu_id_enr_rec` FOREIGN KEY (`stu_id`) REFERENCES `student_list` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grade_list`
--

DROP TABLE IF EXISTS `grade_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_list` (
  `grade_list_id` int NOT NULL AUTO_INCREMENT,
  `class_id` varchar(10) NOT NULL,
  `class_target_grade` int NOT NULL,
  PRIMARY KEY (`grade_list_id`),
  KEY `grade_list_ibfk_1` (`class_id`),
  CONSTRAINT `grade_list_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_list`
--

DROP TABLE IF EXISTS `school_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_list` (
  `school_list_id` int NOT NULL AUTO_INCREMENT,
  `class_id` varchar(10) NOT NULL,
  `class_target_school` varchar(45) NOT NULL,
  PRIMARY KEY (`school_list_id`),
  KEY `school_list_ibfk_1` (`class_id`),
  CONSTRAINT `school_list_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `stu_avatar` blob,
  PRIMARY KEY (`stu_id`),
  CONSTRAINT `fk_student_list_user_login_info1` FOREIGN KEY (`stu_id`) REFERENCES `user_login_info` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teach_record`
--

DROP TABLE IF EXISTS `teach_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teach_record` (
  `tch_rec_id` int NOT NULL AUTO_INCREMENT,
  `tchr_id` varchar(10) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  PRIMARY KEY (`tch_rec_id`),
  KEY `tchr_id_idx` (`tchr_id`),
  KEY `class_id_idx` (`class_id`),
  CONSTRAINT `class_id_tch_rec` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tchr_id_tch_rec` FOREIGN KEY (`tchr_id`) REFERENCES `teacher_list` (`tchr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `tchr_avatar` blob,
  PRIMARY KEY (`tchr_id`),
  CONSTRAINT `fk_teacher_list_user_login_info1` FOREIGN KEY (`tchr_id`) REFERENCES `user_login_info` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_record`
--

DROP TABLE IF EXISTS `time_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_record` (
  `time_rec_id` int NOT NULL AUTO_INCREMENT,
  `class_id` varchar(10) NOT NULL,
  `class_time` int NOT NULL,
  PRIMARY KEY (`time_rec_id`),
  KEY `class_id_time_rec_idx` (`class_id`),
  CONSTRAINT `class_id_time_rec` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-14 18:05:29
