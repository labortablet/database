CREATE DATABASE  IF NOT EXISTS `tabletprojectdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tabletprojectdb`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: tabletprojectdb
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `calender`
--

DROP TABLE IF EXISTS `calender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calender` (
  `calender_id` int(11) NOT NULL,
  `calender_tsak_title` varchar(45) DEFAULT NULL,
  `calender_date` date DEFAULT NULL,
  `calender_start_time` time DEFAULT NULL,
  `calender_finish_time` time DEFAULT NULL,
  `calender_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`calender_id`),
  KEY `fk_calender_accounts1_idx` (`calender_user_id`),
  CONSTRAINT `fk_calender_user` FOREIGN KEY (`calender_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='this table shows each user calender, with tasks name and date_teime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calender`
--

LOCK TABLES `calender` WRITE;
/*!40000 ALTER TABLE `calender` DISABLE KEYS */;
INSERT INTO `calender` VALUES (1,'DB managment','2014-06-10','12:30:00','13:30:00',4),(2,'Project discussion','2014-06-10','12:30:00','13:30:00',1);
/*!40000 ALTER TABLE `calender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_results`
--

DROP TABLE IF EXISTS `exp_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_results` (
  `res_id` int(11) NOT NULL,
  `res_title` varchar(45) NOT NULL,
  `res_description` varchar(500) DEFAULT NULL,
  `res_date` date NOT NULL,
  `res_images` varchar(500) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `expr_id` int(11) NOT NULL,
  PRIMARY KEY (`res_id`),
  KEY `fk_expr_res_expr_idx` (`expr_id`),
  KEY `fk_expr_usr_user_idx` (`user_id`),
  CONSTRAINT `fk_expr_res_expr` FOREIGN KEY (`expr_id`) REFERENCES `experiments` (`expr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_expr_usr_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='this table to save the result of each experiments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_results`
--

LOCK TABLES `exp_results` WRITE;
/*!40000 ALTER TABLE `exp_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiments`
--

DROP TABLE IF EXISTS `experiments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiments` (
  `expr_id` int(11) NOT NULL AUTO_INCREMENT,
  `expr_name` varchar(45) NOT NULL,
  `expr_describtion` varchar(450) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `expr_date` date NOT NULL COMMENT 'date of experiment creation',
  PRIMARY KEY (`expr_id`),
  KEY `fk_expr_proj_idx` (`project_id`),
  CONSTRAINT `fk_expr_proj` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='this table contains the experiments for each project';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiments`
--

LOCK TABLES `experiments` WRITE;
/*!40000 ALTER TABLE `experiments` DISABLE KEYS */;
INSERT INTO `experiments` VALUES (1,'DB_Admin','create administrate DB',1,'2014-06-01'),(2,'Web Entwicklung','create design web and interfaces',1,'2014-06-01'),(3,'Web App','programming controling web',1,'2014-06-01'),(4,'Würfel','Würfel ',2,'2014-05-01'),(5,'Beutel','Beutel',2,'2014-05-15'),(6,'Speiß','Speiß',3,'2014-04-12'),(7,'Salat','Salat vorbereitung',3,'2014-04-20'),(8,'Der Gerät','Gerät Leistung',4,'2014-05-13');
/*!40000 ALTER TABLE `experiments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(45) DEFAULT NULL,
  `group_description` varchar(45) DEFAULT NULL,
  `group_create_date` date DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Lablet_Software','Group for develoing Labletsoftware','2014-06-01'),(2,'PhysikAdkin','Physik labs adminstration groups','2014-05-01'),(3,'A-Track','Labor Project in Physik','2014-03-01'),(4,'C-Track','Labor. Project in Physik','2014-04-01');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logtable`
--

DROP TABLE IF EXISTS `logtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logtable` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_title` varchar(45) NOT NULL,
  `log_desc` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `experiment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `_idx` (`group_id`),
  KEY `fk_testtable_accounts_idx` (`user_id`),
  CONSTRAINT `fk_testtable_accounts` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='her the log info. will be stored';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logtable`
--

LOCK TABLES `logtable` WRITE;
/*!40000 ALTER TABLE `logtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `logtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_group`
--

DROP TABLE IF EXISTS `project_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_group` (
  `pg_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`pg_id`),
  KEY `fk_pg_gropu_idx` (`group_id`),
  KEY `projekt_id` (`project_id`),
  CONSTRAINT `fk_{1E8719E7-852F-43CC-96CE-2335874C5CD8}` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pg_gropu` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='m:n   relation between group and projects';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_group`
--

LOCK TABLES `project_group` WRITE;
/*!40000 ALTER TABLE `project_group` DISABLE KEYS */;
INSERT INTO `project_group` VALUES (1,1,1),(2,2,2),(3,4,3),(4,4,4),(5,3,2);
/*!40000 ALTER TABLE `project_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `project_group_view`
--

DROP TABLE IF EXISTS `project_group_view`;
/*!50001 DROP VIEW IF EXISTS `project_group_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `project_group_view` (
  `group_id` tinyint NOT NULL,
  `group_name` tinyint NOT NULL,
  `project_id` tinyint NOT NULL,
  `project_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(45) NOT NULL,
  `project_description` varchar(500) DEFAULT NULL,
  `project_create_date` date NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the table will contain the detail of each projects  that can be used in the application';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'LabTablet Project','project of using tablet and web for result save','2014-06-01'),(2,'Wiener Kongress','Working project at physic dept.','2014-04-01'),(3,'Doener Tier','Working project at physic dept.','2014-02-01'),(4,'Burger Tier','Working project at physic dept.','2014-01-03');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'user identification number',
  `user_lastname` varchar(45) NOT NULL COMMENT 'the family name of the user',
  `user_firstname` varchar(45) NOT NULL COMMENT 'user first name',
  `user_profil_image` varchar(45) NOT NULL COMMENT 'user avater or profile image',
  `user_create_date` date NOT NULL COMMENT 'the date of user creation in the project',
  `password` varchar(300) NOT NULL,
  `user_type` int(11) DEFAULT NULL COMMENT 'type of user, if is normal member , or group manager , or admin',
  `user_email` varchar(45) NOT NULL COMMENT 'the email of the user, wich represent also the user login name',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Germeroth ','Joerg','path here','2014-06-01','joerg1',1,'jerog@uni-siegen.de'),(2,'Schmitz','Benedikt','path ','2014-06-01','benni1',1,'benni@uni-siegen.de'),(3,'Utsch','Gerrit','labla','2014-06-01','gerrit1',2,'gerrit@uni-siegen.de'),(4,'Almakhawi','Waled','here','2014-06-01','waled1',1,'waled@uni-siegen.de'),(5,'Izol','Mustafa','here','2014-06-01','mustafa1',2,'mustafa@uni-siege.de'),(6,' Lauber','Frederik ','img','2014-06-01','frederik1',2,'fredi@uni-siegen.de'),(7,'Becker','Jens ','img','2014-06-01','jens1',2,'jens@uni-siegen,de'),(8,'Wellesey','Arthur','img','2014-05-01','arthur1',1,'arth@uni-siegen.de'),(9,'Silverira','Joaquim ','img','2014-05-01','joe1',2,'joe@@uni-siegen.de'),(10,'Löwenhielm','Carl ','img','2014-05-01','carl1',2,'carl@uni-siegen.de'),(11,'Holstein ','Pedro ','img','2014-04-05','pedro',1,'pedro@unisiegen.de'),(12,'Stewart ','Robert ','img','2014-04-05','robert1',2,'robert@uni-siegen.de'),(13,'Nepomuk ','Klemens ','img','2014-04-05','klemens1',2,'klem@unisiegen.de'),(14,'Stewart ','Charles ','img','2014-02-01','charl1',1,'charl@uni-siegen.de'),(15,'Joeseph','Emmerich','img','2014-02-01','emmer1',2,'emmer@uni-siegen.de');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `usr_grp_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`usr_grp_id`),
  KEY `fk_acgrp_acount_idx` (`user_id`),
  KEY `fk_accgrp_group_idx` (`group_id`),
  CONSTRAINT `fk_usr_grp_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usr_grp_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='table to show realtion between user and group m:n, user can be meber in many groups, group has many users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,1,2),(9,2,2),(10,8,3),(11,9,3),(12,10,3),(13,11,4),(14,12,4),(15,13,4),(16,14,4),(17,15,4),(18,1,3),(19,2,4);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `user_group_view`
--

DROP TABLE IF EXISTS `user_group_view`;
/*!50001 DROP VIEW IF EXISTS `user_group_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user_group_view` (
  `user_id` tinyint NOT NULL,
  `user_firstname` tinyint NOT NULL,
  `user_lastname` tinyint NOT NULL,
  `group_id` tinyint NOT NULL,
  `group_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_project_view`
--

DROP TABLE IF EXISTS `user_project_view`;
/*!50001 DROP VIEW IF EXISTS `user_project_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user_project_view` (
  `user_id` tinyint NOT NULL,
  `user_firstname` tinyint NOT NULL,
  `user_lastname` tinyint NOT NULL,
  `project_id` tinyint NOT NULL,
  `project_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `project_group_view`
--

/*!50001 DROP TABLE IF EXISTS `project_group_view`*/;
/*!50001 DROP VIEW IF EXISTS `project_group_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_group_view` AS select `gr`.`group_id` AS `group_id`,`gr`.`group_name` AS `group_name`,`pr`.`project_id` AS `project_id`,`pr`.`project_name` AS `project_name` from ((`projects` `pr` join `groups` `gr`) join `project_group` `pg`) where ((`pr`.`project_id` = `pg`.`project_id`) and (`gr`.`group_id` = `pg`.`group_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_group_view`
--

/*!50001 DROP TABLE IF EXISTS `user_group_view`*/;
/*!50001 DROP VIEW IF EXISTS `user_group_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_group_view` AS select `usr`.`user_id` AS `user_id`,`usr`.`user_firstname` AS `user_firstname`,`usr`.`user_lastname` AS `user_lastname`,`gr`.`group_id` AS `group_id`,`gr`.`group_name` AS `group_name` from ((`user` `usr` join `groups` `gr`) join `user_group` `ug`) where ((`usr`.`user_id` = `ug`.`user_id`) and (`gr`.`group_id` = `ug`.`group_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_project_view`
--

/*!50001 DROP TABLE IF EXISTS `user_project_view`*/;
/*!50001 DROP VIEW IF EXISTS `user_project_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_project_view` AS select `usr`.`user_id` AS `user_id`,`usr`.`user_firstname` AS `user_firstname`,`usr`.`user_lastname` AS `user_lastname`,`pgv`.`project_id` AS `project_id`,`pgv`.`project_name` AS `project_name` from (`user_group_view` `usr` join `project_group_view` `pgv`) where (`usr`.`group_id` = `pgv`.`group_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-09 22:50:43
