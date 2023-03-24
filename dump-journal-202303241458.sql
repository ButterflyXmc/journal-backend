-- MariaDB dump 10.19  Distrib 10.10.2-MariaDB, for osx10.17 (arm64)
--
-- Host: 34.135.79.56    Database: journal
-- ------------------------------------------------------
-- Server version	10.11.1-MariaDB-1:10.11.1+maria~deb11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_us` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us`
--

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_entries`
--

DROP TABLE IF EXISTS `journal_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grateful1` text DEFAULT NULL,
  `grateful2` text DEFAULT NULL,
  `grateful3` text DEFAULT NULL,
  `great1` text DEFAULT NULL,
  `great2` text DEFAULT NULL,
  `affirm1` text DEFAULT NULL,
  `affirm2` text DEFAULT NULL,
  `highlights1` text DEFAULT NULL,
  `highlights2` text DEFAULT NULL,
  `learn1` text DEFAULT NULL,
  `learn2` text DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `journal_entries_FK_user_id` (`user_id`),
  CONSTRAINT `journal_entries_FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_entries`
--

LOCK TABLES `journal_entries` WRITE;
/*!40000 ALTER TABLE `journal_entries` DISABLE KEYS */;
INSERT INTO `journal_entries` VALUES
(72,'hohohohoo','hi','hi','hi','hi','h','i','i','hih','i','hi','2023-03-23',153),
(74,'','','','','','','','','','','','2023-03-24',153),
(75,'','','','','','','','','','','','2023-03-24',153);
/*!40000 ALTER TABLE `journal_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_UN_username` (`username`),
  UNIQUE KEY `user_UN_email` (`email`),
  CONSTRAINT `user_CHECK_email_format` CHECK (`email` regexp '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(147,'eric','eric','eric','eric@gmail.com','$2b$12$wH1injXLLhQ0N1l5pxdwQ.S/IBydlviDVgeuHDeEKtvvc.v07Klvi','2023-03-21'),
(153,'mahi','mahi','mahi','mahi@gmail.com','$2b$12$Vdp4ChFHT.77sOo0/4qXM.J7YVlJEB3LYaKkTfsxTcKwbw2KW7CDu','2023-03-23');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(250) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login_UN` (`token`),
  KEY `user_login_FK_user_id` (`user_id`),
  CONSTRAINT `user_login_FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
INSERT INTO `user_session` VALUES
(326,'mahi59b7b6488c8f449fac85742479f29233',153),
(327,'mahi3eba3e9ab23f4fe796b58c534f8f37a2',153),
(330,'mahid1ecb4116db841e7b9ad504630b0d77b',153),
(331,'mahi566fd24b389047daad192ae47c122a56',153),
(339,'mahi6f709d62667f463d88ad535732d33f8e',153),
(343,'mahi4754750d5ffb4639a4e77bc5190b5c5a',153),
(344,'mahi0bc5bb7ee8704d749aade42d47bdcda9',153),
(349,'mahif5522f45595246a4b054a928f126385b',153),
(350,'mahi3439b758b602470083403d8020efbb39',153);
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'journal'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calander_view` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `calander_view`(
    IN token_input CHAR(250)
)
BEGIN
    SELECT 
        je.id, 
        je.grateful1, 
        je.grateful2, 
        je.grateful3, 
        je.great1, 
        je.great2, 
        je.affirm1, 
        je.affirm2, 
        je.highlights1, 
        je.highlights2, 
        je.learn1, 
        je.learn2, 
        DATE_FORMAT(je.created_at, '%Y-%m-%d') AS created_at
    FROM user u
    JOIN user_session us ON u.id = us.user_id
    JOIN journal_entries je ON u.id = je.user_id
    WHERE us.token = token_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contact_us` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `contact_us`(name_input varchar(100), 
																		email_input varchar(100), 
																		message_input text,
																		rating_input int )
BEGIN
	IF rating_input IS NULL THEN
		INSERT INTO contact_us (name, email, message) VALUES (name_input, email_input, message_input);
	ELSE
		INSERT INTO contact_us (name, email, message, rating) VALUES (name_input, email_input, message_input, rating_input);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_entries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `delete_entries`(
    entry_id_input INT,
    token_input CHAR(250)
)
BEGIN
    DECLARE user_id_input INT;

    -- Get the user ID based on the token
    SELECT user_id INTO user_id_input FROM user_session WHERE token = token_input;

    -- Delete the journal entry
    DELETE FROM journal_entries  WHERE id = entry_id_input AND user_id = user_id_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_entry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `delete_entry`(
    entry_id_input INT,
    token_input CHAR(250)
)
BEGIN
    DECLARE user_id_input INT;

    -- Get the user ID based on the token
    SELECT user_id INTO user_id_input FROM user_session WHERE token = token_input;

    -- Delete the journal entry
    DELETE FROM journal_entry WHERE id = entry_id_input AND user_id = user_id_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `delete_user`( token_input char(250))
BEGIN
    DECLARE user_id_input INT;
    
    -- Get the user ID based on the token
    SELECT user_id INTO user_id_input FROM user_session WHERE token = token_input;
    
    -- Delete the user record
    DELETE FROM user WHERE id = user_id_input;
    
    -- Delete the user session record
    DELETE FROM user_session WHERE token = token_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_user_entries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `edit_user_entries`(
     token_input CHAR(250),
     entry_id INT UNSIGNED,
     grateful1_input VARCHAR(255),
     grateful2_input VARCHAR(255),
     grateful3_input VARCHAR(255),
     great1_input VARCHAR(255),
     great2_input VARCHAR(255),
     affirm1_input VARCHAR(255),
     affirm2_input VARCHAR(255),
     highlights1_input VARCHAR(255),
     highlights2_input VARCHAR(255),
     learn1_input VARCHAR(255),
     learn2_input VARCHAR(255)
)
BEGIN
    DECLARE user_id_input INT;
    
    -- Get the user ID based on the token
    SELECT user_id INTO user_id_input FROM user_session WHERE token = token_input;
   
    -- Update the journal entry with the non-null input values
    UPDATE journal_entries SET
        grateful1 = IFNULL(grateful1_input, grateful1),
        grateful2 = IFNULL(grateful2_input, grateful2),
        grateful3 = IFNULL(grateful3_input, grateful3),
        great1 = IFNULL(great1_input, great1),
        great2 = IFNULL(great2_input, great2),
        affirm1 = IFNULL(affirm1_input, affirm1),
        affirm2 = IFNULL(affirm2_input, affirm2),
        highlights1 = IFNULL(highlights1_input, highlights1),
        highlights2 = IFNULL(highlights2_input, highlights2),
        learn1 = IFNULL(learn1_input, learn1),
        learn2 = IFNULL(learn2_input, learn2)
    WHERE id = entry_id AND user_id = user_id_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_pass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `get_pass`(username_input varchar(100))
    MODIFIES SQL DATA
BEGIN
	SELECT id,password FROM user WHERE username = username_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_pm_entries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `get_pm_entries`( token_input CHAR(250))
BEGIN
    SELECT je.id, je.highlights1, je.highlights2, je.learn1, je.learn2,je.created_at
    FROM user u
    JOIN user_session us ON u.id = us.user_id
    JOIN journal_entries je ON u.id = je.user_id
    WHERE us.token = token_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_entries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `get_user_entries`( token_input CHAR(250))
BEGIN
    SELECT je.id, je.grateful1, je.grateful2, je.grateful3, je.great1, je.great2, je.affirm1, je.affirm2, je.highlights1, je.highlights2, je.learn1, je.learn2, je.created_at
    FROM user u
    JOIN user_session us ON u.id = us.user_id
    JOIN journal_entries je ON u.id = je.user_id
    WHERE us.token = token_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `get_user_info`(token_input varchar(250))
    MODIFIES SQL DATA
BEGIN
	SELECT  first_name, last_name, username, email, created_at FROM user u JOIN user_session us ON u.id = us.user_id  WHERE token = token_input;
	
	SELECT token_input FROM user_session us WHERE token = token_input;
    
    SELECT token_input AS token;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_journal_entry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `insert_journal_entry`( user_session_token VARCHAR(255),
                                        grateful1 TEXT,
                                        grateful2 TEXT,
                                        grateful3 TEXT,
                                        great1 TEXT,
                                        great2 TEXT,
                                       	great3 TEXT,
                                        affirm1 TEXT,
                                        affirm2 TEXT,
                                        pm_highlights1 TEXT,
                                        pm_highlights2 TEXT,
                                        pm_highlights3 TEXT,
                                        learn1 TEXT,
                                        learn2 TEXT)
BEGIN
	
  	DECLARE user_id INT;
  
	  	SELECT user_id INTO user_id
	    FROM user_session
	    WHERE token = user_session_token;

  INSERT INTO journal_entry (user_id, grateful1, grateful2, grateful3, great1, great2, great3, affirm1, affirm2, pm_highlights1, pm_highlights2, pm_highlights3, learn1, learn2)
    VALUES (user_id, grateful1, grateful2, grateful3, great1, great2, great3, affirm1, affirm2, pm_highlights1, pm_highlights2, pm_highlights3, learn1, learn2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `journal_entry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `journal_entry`()
BEGIN
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `login`(username_input char(100), password_input char(100))
    MODIFIES SQL DATA
BEGIN
	DECLARE user_id INT UNSIGNED;

	SELECT id INTO user_id FROM user WHERE username  = username_input AND password = password_input;

	IF user_id IS NOT NULL THEN
	
	INSERT INTO user_session (token, user_id) VALUES(CONCAT(username_input,UUID()), user_id);
	
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_entry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `new_entry`(
  token VARCHAR(255),
  grateful1  text,
  grateful2 text,
  grateful3 text,
  great1 text,
  great2 text,
  affirm1 text,
  affirm2 text,
  highlights1 TEXT,
  highlights2 TEXT,
  learn1 TEXT,
  learn2 TEXT)
BEGIN
  DECLARE user_id INT;


  SELECT u.id INTO user_id
  FROM user u
  JOIN user_session us ON u.id = us.user_id
  WHERE us.token = token;


  INSERT INTO journal_entries (user_id,                     
                              grateful1,
                              grateful2,
                              grateful3,
                              great1,
                              great2,
                              affirm1,
                              affirm2,
                              highlights1,
							  highlights2,
							  learn1,
							  learn2)
                              VALUES (user_id,
                                      grateful1,
                                      grateful2,
                                      grateful3,
                                      great1,
                                      great2,
                                      affirm1,
                                      affirm2,
                                      highlights1,
									  highlights2,
									  learn1,
									  learn2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pm_entry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `pm_entry`(
  token VARCHAR(255),
  highlights1 TEXT,
  highlights2 TEXT,
  learn1 TEXT,
  learn2 TEXT)
BEGIN
  DECLARE user_id INT;


  SELECT u.id INTO user_id
  FROM user u
  JOIN user_session us ON u.id = us.user_id
  WHERE us.token = token;


  INSERT INTO journal_entries (user_id,                     
                              		  highlights1,
									  highlights2,
									  learn1,
									  learn2)
                              VALUES (user_id,
                                      highlights1,
									  highlights2,
									  learn1,
									  learn2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `signup`(first_name_input char(100), last_name_input char(100), username_input char(100), email_input char(100), password_input char(100))
    MODIFIES SQL DATA
BEGIN
	
	DECLARE token_output char(50); 
	DECLARE token_input char(50);

	SET token_input = CONCAT(username_input, UUID()) ;

	INSERT INTO `user` (first_name, last_name, username, email, password) VALUES (first_name_input, last_name_input, username_input, email_input, password_input);
	INSERT INTO user_session  (token, user_id) VALUES (token_input, LAST_INSERT_ID());
	
	SET token_output = token_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `token` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `token`(token_input varchar(250), user_id_input int unsigned)
    MODIFIES SQL DATA
BEGIN
	INSERT INTO user_session  (token, user_id) VALUES (token_input, user_id_input);
	SELECT token_input FROM user_session us WHERE token = token_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `update_user_info`(
    IN token_input VARCHAR(250),
    IN first_name_input VARCHAR(50),
    IN last_name_input VARCHAR(50),
    IN username_input VARCHAR(50),
    IN email_input VARCHAR(50)
)
BEGIN
    DECLARE email_val VARCHAR(50);
    
    SELECT email INTO email_val FROM user WHERE id IN (SELECT user_id FROM user_session WHERE token = token_input);
    
    UPDATE user SET 
    -- The IF function in SQL takes three arguments: a condition, 
    -- a value to return if the condition is true, and a value to return if the condition is false.
    -- This means that if first_name_input is not an empty string, 
    -- the user's first_name field will be updated to the new value. 
    -- Otherwise, the user's first_name field will not be updated and will remain the same as it was before.
		        first_name = IF(first_name_input !="", first_name_input,first_name), 
		        last_name = IF(last_name_input !="", last_name_input, last_name), 
		        username = IF(username_input !="", username_input, username), 
     -- checks if the email_input is not an empty string '', and if it's not, 
     -- it assigns the value of email_input to the email field 
        		email = IF(email_input != '', email_input, email)
    --  if the user's Id is associated with the provided token_input. Otherwise, it keeps the original email value.
    			WHERE id IN (SELECT user_id FROM user_session WHERE token = token_input);
    
   -- It sets the value of email to email_val where the current value of email is an empty string ''.
   				 UPDATE user SET email = email_val WHERE email = '' AND id IN (SELECT user_id FROM user_session WHERE token = token_input);
    
    			CALL get_user_info(token_input);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `user_login`(token_input varchar(250), user_id_input int unsigned)
    MODIFIES SQL DATA
BEGIN
	INSERT INTO user_session (token, user_id) VALUES (token_input, user_id_input);

	SELECT token_input FROM user_session us WHERE token = token_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_logout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `user_logout`(token_input char(250))
BEGIN
	DELETE FROM user_session WHERE token = token_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_signup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`innotech`@`%` PROCEDURE `user_signup`(first_name_input char(100), last_name_input char(100), username_input char(100), email_input char(100), password_input char(100))
    MODIFIES SQL DATA
BEGIN
		INSERT INTO `user` (first_name, last_name, username, email, password) VALUES (first_name_input, last_name_input, username_input, email_input, password_input);
	 SELECT  LAST_INSERT_ID() ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-24 14:58:49
