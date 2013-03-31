CREATE DATABASE  IF NOT EXISTS `smsdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `smsdb`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: smsdb
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `app_dependency`
--

DROP TABLE IF EXISTS `app_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_dependency` (
  `App_Id` int(11) NOT NULL,
  `Dependency_App_Id` int(11) NOT NULL,
  PRIMARY KEY (`App_Id`,`Dependency_App_Id`),
  KEY `fk_Applications_has_Applications_Applications2_idx` (`Dependency_App_Id`),
  KEY `fk_Applications_has_Applications_Applications1_idx` (`App_Id`),
  CONSTRAINT `fk_Applications_has_Applications_Applications1` FOREIGN KEY (`App_Id`) REFERENCES `applications` (`App_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Applications_has_Applications_Applications2` FOREIGN KEY (`Dependency_App_Id`) REFERENCES `applications` (`App_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_dependency`
--

LOCK TABLES `app_dependency` WRITE;
/*!40000 ALTER TABLE `app_dependency` DISABLE KEYS */;
INSERT INTO `app_dependency` VALUES (4,1),(7,1),(9,1),(14,1),(4,2),(12,2),(14,2),(13,4),(14,4),(4,5),(13,5),(4,6),(12,6),(14,6),(12,7),(14,13);
/*!40000 ALTER TABLE `app_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_resources`
--

DROP TABLE IF EXISTS `app_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_resources` (
  `App_Resource_Id` int(11) NOT NULL AUTO_INCREMENT,
  `App_Id` int(11) NOT NULL,
  `Resource_Id` int(11) NOT NULL,
  `Server_Id` int(11) DEFAULT NULL,
  `Resource_Value` varchar(250) NOT NULL,
  `Resource_Comments` varchar(100) NOT NULL,
  `Created_Dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(15) NOT NULL,
  PRIMARY KEY (`App_Resource_Id`),
  KEY `fk_Applications_has_Resources_Resources1_idx` (`Resource_Id`),
  KEY `fk_Applications_has_Resources_Applications_idx` (`App_Id`),
  KEY `fk_App_Resources_Server1_idx` (`Server_Id`),
  CONSTRAINT `fk_Applications_has_Resources_Applications` FOREIGN KEY (`App_Id`) REFERENCES `applications` (`App_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Applications_has_Resources_Resources1` FOREIGN KEY (`Resource_Id`) REFERENCES `resources` (`Resource_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_App_Resources_Server1` FOREIGN KEY (`Server_Id`) REFERENCES `server` (`Server_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_resources`
--

LOCK TABLES `app_resources` WRITE;
/*!40000 ALTER TABLE `app_resources` DISABLE KEYS */;
INSERT INTO `app_resources` VALUES (1,12,1,1,'testDomain','test domain','2012-10-29 16:13:41','nags'),(2,12,3,4,'devlnx2','test app server','2012-10-29 16:13:41','nags'),(3,12,4,4,'test db schema','test db schema','2012-10-29 16:13:41','nags'),(4,13,1,1,'testDomain','test domain','2012-10-29 16:14:46','nags'),(5,14,1,1,'testDomain','dev domain server','2012-10-31 15:26:38','nags'),(6,14,9,1,'http://jalapati4u.wordpress.com','rvisit dev url','2012-10-31 15:26:38','nags'),(7,14,4,9,'alarm-dev','alarm dev schema','2012-10-31 15:26:38','nags');
/*!40000 ALTER TABLE `app_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_techs`
--

DROP TABLE IF EXISTS `app_techs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_techs` (
  `Tech_Id` int(11) NOT NULL,
  `App_Id` int(11) NOT NULL,
  PRIMARY KEY (`Tech_Id`,`App_Id`),
  KEY `fk_Technologies_has_Applications_Applications1_idx` (`App_Id`),
  KEY `fk_Technologies_has_Applications_Technologies1_idx` (`Tech_Id`),
  CONSTRAINT `fk_Technologies_has_Applications_Applications1` FOREIGN KEY (`App_Id`) REFERENCES `applications` (`App_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Technologies_has_Applications_Technologies1` FOREIGN KEY (`Tech_Id`) REFERENCES `technologies` (`Tech_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_techs`
--

LOCK TABLES `app_techs` WRITE;
/*!40000 ALTER TABLE `app_techs` DISABLE KEYS */;
INSERT INTO `app_techs` VALUES (9,4),(9,5),(9,6),(2,7),(9,7),(1,8),(9,8),(2,9),(9,9),(1,12),(3,12),(4,12),(5,12),(7,12),(8,12),(9,12),(10,12),(1,13),(3,13),(4,13),(5,13),(7,13),(8,13),(9,13),(10,13),(2,14),(3,14),(4,14),(8,14),(9,14),(12,14),(14,14);
/*!40000 ALTER TABLE `app_techs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `App_Id` int(11) NOT NULL AUTO_INCREMENT,
  `App_Name` varchar(45) NOT NULL,
  `App_Version` varchar(5) NOT NULL,
  `App_Status` int(11) NOT NULL DEFAULT '1' COMMENT 'App_Status:1(Active), 0(Deactive)',
  `App_Contacts` varchar(100) NOT NULL,
  `Created_Dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(15) NOT NULL,
  PRIMARY KEY (`App_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'Doc Delivery Sys','2.0',1,'nagv@nagscompany.com','2012-09-26 15:45:39','nags'),(2,'Oracle BPM Upgrade','6.3',1,'nagv@nagscompany.com','2012-09-26 15:46:41','nags'),(4,'Call Center Portal','1.0',1,'nagv@nagscompany.com','2012-09-26 15:49:39','nags'),(5,'Elections 2012','1.0',1,'nagv@nagscompany.com','2012-09-26 15:49:39','nags'),(6,'Customers Connect','1.0',1,'nagv@nagscompany.com','2012-09-26 15:49:39','nags'),(7,'Money Manager','1.0',1,'nagv@nagscompany.com','2012-10-01 19:41:50','nags'),(8,'reVISIT','1.0',1,'nagv@nagscompany.com','2012-10-01 19:41:50','nags'),(9,'Quick Alarm','2.0',1,'nagv@nagscompany.com','2012-10-01 19:41:50','nags'),(12,'Test App1','1.0',1,'nagv@nagscompany.com','2012-10-29 16:13:40','nags'),(13,'Test App2','2.0',1,'nagv@nagscompany.com','2012-10-29 16:14:46','nags'),(14,'Global CC Platform','1.0',1,'nagv@nagscompany.com','2012-10-31 15:26:37','nags');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environment`
--

DROP TABLE IF EXISTS `environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `environment` (
  `Env_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Env_Type` varchar(45) NOT NULL COMMENT 'Prod, UAT, Dev, Vendor QA, QA, Staging...etc',
  `Env_Comments` varchar(100) DEFAULT NULL,
  `Env_Status` int(11) NOT NULL DEFAULT '1',
  `Created_Dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(15) NOT NULL,
  PRIMARY KEY (`Env_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environment`
--

LOCK TABLES `environment` WRITE;
/*!40000 ALTER TABLE `environment` DISABLE KEYS */;
INSERT INTO `environment` VALUES (1,'Development','Development',1,'2012-10-24 01:57:21','njalapati'),(2,'QA','Quality',1,'2012-10-24 01:57:25','njalapati'),(3,'Production','Production',1,'2012-10-24 01:57:25','njalapati');
/*!40000 ALTER TABLE `environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_components`
--

DROP TABLE IF EXISTS `release_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `release_components` (
  `Component_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Release_Id` int(11) NOT NULL,
  `Component_Desc` varchar(100) NOT NULL,
  `Supporting_Docs_URL` varchar(800) DEFAULT NULL,
  `Artifact_URL` varchar(800) NOT NULL,
  `Created_Dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Component_Id`),
  KEY `fk_Release_Components_Releases1_idx` (`Release_Id`),
  CONSTRAINT `fk_Release_Components_Releases1` FOREIGN KEY (`Release_Id`) REFERENCES `releases` (`Release_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_components`
--

LOCK TABLES `release_components` WRITE;
/*!40000 ALTER TABLE `release_components` DISABLE KEYS */;
INSERT INTO `release_components` VALUES (6,2,'PRPC ','http://jalapati4u.wordpress.com/','http://jalapati4u.wordpress.com/','2012-10-26 17:12:56'),(7,3,'PRPC','http://jalapati4u.wordpress.com/','http://jalapati4u.wordpress.com/','2012-10-26 17:15:44'),(8,4,'PRPC','http://jalapati4u.wordpress.com/','http://jalapati4u.wordpress.com/','2012-10-26 17:17:26');
/*!40000 ALTER TABLE `release_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releases` (
  `Release_Id` int(11) NOT NULL AUTO_INCREMENT,
  `App_Id` int(11) NOT NULL,
  `Release_Name` varchar(45) NOT NULL,
  `Release_Date` datetime NOT NULL,
  `Release_Status` varchar(10) NOT NULL COMMENT 'Release_Status: Deployed, Rollback',
  `Release_Promoted` int(11) NOT NULL DEFAULT '0' COMMENT 'Release_Promoted: 0 (No), 1(Yes)',
  `Release_Type` varchar(45) NOT NULL COMMENT 'Release_Type: Normal, Emergency',
  `Created_Dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(15) NOT NULL,
  `Release_Comments` varchar(100) NOT NULL,
  `Release_Notes_URL` varchar(800) NOT NULL,
  PRIMARY KEY (`Release_Id`),
  KEY `fk_Releases_Applications1_idx` (`App_Id`),
  CONSTRAINT `fk_Releases_Applications1` FOREIGN KEY (`App_Id`) REFERENCES `applications` (`App_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
INSERT INTO `releases` VALUES (2,7,'Iteration 3.3','2012-10-22 00:00:00','Deployed',0,'Normal','2012-10-26 17:12:56','nags','Iteration 3.3 release','http://jalapati4u.wordpress.com/'),(3,7,'Release 3.2','2012-09-21 00:00:00','Deployed',0,'Normal','2012-10-26 17:15:44','nags','Iteration 3.3 release','http://jalapati4u.wordpress.com/'),(4,7,'Release 3.1','2012-09-07 00:00:00','Deployed',0,'Normal','2012-10-26 17:17:26','nags','Iteration 3.1','http://jalapati4u.wordpress.com/');
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `Resource_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Resource_Name` varchar(45) NOT NULL COMMENT 'Meta data of various resource types. Dev environment db schema, dev server, qa server...etc',
  `Resource_Type` int(11) NOT NULL DEFAULT '1' COMMENT '1=Requires Server, 0=No Server',
  `Created_Dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(15) NOT NULL,
  PRIMARY KEY (`Resource_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'App Server Domain',0,'2012-09-28 19:06:53','nags'),(2,'Managed Server',1,'2012-09-28 19:06:53','nags'),(3,'Application Server',1,'2012-09-28 19:06:53','nags'),(4,'DB Schema',1,'2012-09-28 19:06:53','nags'),(5,'DB Server',1,'2012-09-28 19:06:53','nags'),(6,'CTI Server',1,'2012-09-28 19:06:53','nags'),(7,'Load balancer',1,'2012-09-28 19:06:53','nags'),(8,'Oracle Service Bus',1,'2012-09-28 19:06:53','nags'),(9,'Dev App URL',0,'2012-10-26 03:02:03','nags'),(10,'QA App URL',0,'2012-10-26 03:02:03','nags'),(11,'Prod App URL',0,'2012-10-26 03:02:03','nags');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `Server_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Env_Id` int(11) NOT NULL,
  `Server_Name` varchar(45) NOT NULL,
  `Server_Comments` varchar(100) DEFAULT NULL,
  `Server_Status` int(11) NOT NULL DEFAULT '1',
  `Created_Dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(15) NOT NULL,
  PRIMARY KEY (`Server_Id`),
  KEY `fk_Server_Environment1_idx` (`Env_Id`),
  CONSTRAINT `fk_Server_Environment1` FOREIGN KEY (`Env_Id`) REFERENCES `environment` (`Env_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,1,'devlnx1','dev',1,'2012-10-24 02:06:11','nags'),(2,2,'qalnx','qa',1,'2012-10-24 02:06:55','nags'),(3,1,'devwin7','dev',1,'2012-10-24 02:06:55','nags'),(4,1,'devbpmsol','dev',1,'2012-10-24 02:06:55','nags'),(5,2,'qabpmsol1','qa bpm',1,'2012-10-24 02:06:55','nags'),(6,2,'qabpmsol2','qa bpm',1,'2012-10-24 02:06:55','nags'),(7,3,'prdlnx2','prod bpm l side',1,'2012-10-24 02:06:56','nags'),(8,3,'prdlnx1','prod bpm c side',1,'2012-10-24 02:06:56','nags'),(9,1,'devssol','dev solaris',1,'2012-10-24 02:06:56','nags'),(10,2,'qassol3','solaris qa',1,'2012-10-24 02:06:56','nags'),(11,2,'qassol2','solaris qa',1,'2012-10-24 02:06:56','nags'),(12,3,'prdssol1','solaris prod',1,'2012-10-24 02:06:56','nags'),(13,3,'prdssol2','solaris prod',1,'2012-10-24 02:06:56','nags');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technologies`
--

DROP TABLE IF EXISTS `technologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technologies` (
  `Tech_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tech_Name` varchar(45) NOT NULL,
  `Tech_Desc` varchar(100) NOT NULL,
  `Tech_Version` varchar(10) NOT NULL,
  `Created_Dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(15) NOT NULL,
  PRIMARY KEY (`Tech_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technologies`
--

LOCK TABLES `technologies` WRITE;
/*!40000 ALTER TABLE `technologies` DISABLE KEYS */;
INSERT INTO `technologies` VALUES (1,'Pega PRC','Pega Rules Process Commander','6.1','2012-10-01 18:54:04','nags'),(2,'Android','Google Android','4.0','2012-10-01 19:01:51','nags'),(3,'iOS','Apple iOS','6.1','2012-10-01 19:01:51','nags'),(4,'Apache Axis','Apache Web services API','2.0','2012-10-01 19:01:51','nags'),(5,'JSF','Java Server Faces','2.0','2012-10-01 19:01:51','nags'),(6,'Weblogic Portal','Weblogic Portal','10.1','2012-10-01 19:01:51','nags'),(7,'EJB','Enterprise Java Beans','3.0','2012-10-01 19:01:51','nags'),(8,'Ajax','Asynchronous Java Script','1.0','2012-10-01 19:01:51','nags'),(9,'IE','Internet Explorer','8.0','2012-10-01 19:01:51','nags'),(10,'IE','Internet Explorer','9.0','2012-10-01 19:01:51','nags'),(11,'Windows','Microsoft Windows','7.0','2012-10-31 14:19:22','nags'),(12,'Linux','Red Hat Linux','6.0','2012-10-31 14:19:22','nags'),(13,'Solaris','Sun Solaris','10.0','2012-10-31 14:19:57','nags'),(14,'Windows','Microsoft Windows','XP','2012-10-31 14:19:57','nags');
/*!40000 ALTER TABLE `technologies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` varchar(10) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  `user_role` int(11) NOT NULL DEFAULT '2' COMMENT '1=admin, 2=user',
  `user_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nags','fFLUCcjC5s8VZF26LtilyIKW89A=',1,1),('test','qUqP5cyxm6YcTAhz05Hph5gvu9M=',2,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-30 21:40:26
