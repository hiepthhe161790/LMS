CREATE DATABASE SWP391_BL5_V4;
USE SWP391_BL5_V4;

CREATE TABLE role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50),
    password VARCHAR(50),
    role_id INT,
    create_date DATETIME,
    fullname NVARCHAR(40) NOT NULL,
    phone VARCHAR(10),
    avatar BLOB,
    status BIT,
    gender BIT,
    is_verified BIT,
    verification_code NVARCHAR(150),
    CONSTRAINT FK_user_role FOREIGN KEY (role_id) REFERENCES role(role_id)
);


CREATE TABLE subject (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name NVARCHAR(50) NULL
);

CREATE TABLE class(
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    name NCHAR(150) NULL,
    title NCHAR(150) NULL,
    original_price DECIMAL(10, 2) NULL,
    sale_price DECIMAL(10, 2) NULL,
    brief_infor NCHAR(150) NULL,
    cate_id INT NULL,
    sale_id INT NULL,
    image NVARCHAR(250) NULL,
    course_date DATE NULL,
    user_id INT NULL,
    lessons INT NULL,
    status BIT NULL,
    CONSTRAINT FK_Course_Categories FOREIGN KEY (cate_id) REFERENCES subject(id),
    CONSTRAINT FK_Course_User FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE lesson (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    lesson_name NVARCHAR(100) NOT NULL,
    class_id INT NOT NULL,
    CONSTRAINT FK_lesson_class FOREIGN KEY (class_id) REFERENCES class(course_id)
);

CREATE TABLE lesson_video (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    video_name NVARCHAR(100) NOT NULL,
    file_video LONGBLOB, -- Adjust data type as needed for storing video content
    lesson_id INT NOT NULL,
    CONSTRAINT FK_lesson_video_lesson FOREIGN KEY (lesson_id) REFERENCES lesson(lesson_id)
);

CREATE TABLE assignment (
    quiz_id INT AUTO_INCREMENT PRIMARY KEY,
    lesson_id INT NOT NULL,
    quiz_name NVARCHAR(255) NOT NULL,
    timestamp DATETIME NOT NULL,
    CONSTRAINT FK_quiz_lesson FOREIGN KEY (lesson_id) REFERENCES lesson(lesson_id)
);

-- CREATE TABLE categoryBlog (
--     categoryBlog_id INT AUTO_INCREMENT PRIMARY KEY,
--     categoryBlog_name NCHAR(150) NULL
-- );

CREATE TABLE blog (
    blog_id INT AUTO_INCREMENT PRIMARY KEY,
    title NCHAR(255) NULL,
    author INT NULL,
    image NVARCHAR(250) NULL,
    brief_infor NVARCHAR(500) NULL,
    createDate DATE NULL,
    blog_content NVARCHAR(500) NULL,
    cate_id INT NULL,
    status BIT NULL,
    thumbnail NVARCHAR(100) NULL,
    flag NVARCHAR(100) NULL,
    dateModified DATE NULL,
    numberOfAccess INT NULL,
     CONSTRAINT FK_Blog_User FOREIGN KEY (author) REFERENCES user(user_id)
);

CREATE TABLE registration (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    price_package_id INT NOT NULL,
    user_id INT NOT NULL,
    created DATETIME NOT NULL,
    regis_status NVARCHAR(50) NULL
);


CREATE TABLE comment (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    blog_id INT NOT NULL, 
    user_id INT NOT NULL,
    commen_time DATETIME NOT NULL,
    CONSTRAINT FK_comment_user FOREIGN KEY (user_id) REFERENCES user(user_id),
    CONSTRAINT FK_comment_blogs FOREIGN KEY (blog_id) REFERENCES blog(blog_id)
);

CREATE TABLE ContactType (
    ContactTypeID INT AUTO_INCREMENT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Description TEXT
);


CREATE TABLE Contact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY, -- Tính năng tự tăng
    Name NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    Address NVARCHAR(500),
    Message TEXT,
    ContactTypeID INT,
    FOREIGN KEY (ContactTypeID) REFERENCES ContactType(ContactTypeID)
);

create table setting_type(
	id int auto_increment primary key,
    name nvarchar(255) null
);

CREATE TABLE setting(
	setting_id INT AUTO_INCREMENT PRIMARY KEY,
    setting_name NCHAR(255) NULL,
    status BIT,
    `order` INT,
    description text NOT NULL,
    mapped_values text,
    setting_type_id int,
    FOREIGN KEY (setting_type_id) REFERENCES setting_type(id)
);

-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: swp391_bl5_v4
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `quiz_id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` int NOT NULL,
  `quiz_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`quiz_id`),
  KEY `FK_quiz_lesson` (`lesson_id`),
  CONSTRAINT `FK_quiz_lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `title` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `author` int DEFAULT NULL,
  `image` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `brief_infor` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `blog_content` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `thumbnail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `flag` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `dateModified` date DEFAULT NULL,
  `numberOfAccess` int DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `FK_Blog_User` (`author`),
  CONSTRAINT `FK_Blog_User` FOREIGN KEY (`author`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `name` char(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `title` char(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `original_price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `brief_infor` char(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  `image` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `course_date` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `lessons` int DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `FK_Course_Categories` (`cate_id`),
  KEY `FK_Course_User` (`user_id`),
  CONSTRAINT `FK_Course_Categories` FOREIGN KEY (`cate_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FK_Course_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `blog_id` int NOT NULL,
  `user_id` int NOT NULL,
  `commen_time` datetime NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_comment_user` (`user_id`),
  KEY `FK_comment_blogs` (`blog_id`),
  CONSTRAINT `FK_comment_blogs` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`),
  CONSTRAINT `FK_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `ContactID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Address` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Message` text,
  `ContactTypeID` int DEFAULT NULL,
  PRIMARY KEY (`ContactID`),
  KEY `ContactTypeID` (`ContactTypeID`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`ContactTypeID`) REFERENCES `contacttype` (`ContactTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Thanh Phong','thanhphongyd2@gmail.com','0392268674','Yen Hung, Yen Dinh, Thanh Hoa','',1),(2,'Đỗ Việt Yến','yendo271@gmail.com','0123456789','','Need support creat acccount',2),(3,'Đỗ Việt Yến','yendo271@gmail.com','0123456789','','Need support creat acccount',2),(4,'Đỗ Việt Yến','yendo271@gmail.com','0123456789','','Need support creat acccount',2),(5,'Đỗ Việt Yến','yendo271@gmail.com','0123456789','','Need support creat acccount',2),(6,'Đỗ Việt Yến','yendo271@gmail.com','0123456789','','Need support creat acccount',2),(7,'Đỗ Việt Yến','yendo271@gmail.com','0123456789','','Need support creat acccount',2);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacttype`
--

DROP TABLE IF EXISTS `contacttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacttype` (
  `ContactTypeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Description` text,
  PRIMARY KEY (`ContactTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacttype`
--

LOCK TABLES `contacttype` WRITE;
/*!40000 ALTER TABLE `contacttype` DISABLE KEYS */;
INSERT INTO `contacttype` VALUES (1,'Technical Help',NULL),(2,'Account Information',NULL),(3,'Course Content',NULL),(4,'Q&A and Interaction',NULL),(5,'User Experience',NULL);
/*!40000 ALTER TABLE `contacttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL AUTO_INCREMENT,
  `lesson_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `class_id` int NOT NULL,
  PRIMARY KEY (`lesson_id`),
  KEY `FK_lesson_class` (`class_id`),
  CONSTRAINT `FK_lesson_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_video`
--

DROP TABLE IF EXISTS `lesson_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_video` (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `video_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `file_video` longblob,
  `lesson_id` int NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `FK_lesson_video_lesson` (`lesson_id`),
  CONSTRAINT `FK_lesson_video_lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_video`
--

LOCK TABLES `lesson_video` WRITE;
/*!40000 ALTER TABLE `lesson_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `registration_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `price_package_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime NOT NULL,
  `regis_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Teacher'),(3,'Learner');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `setting_name` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `description` text NOT NULL,
  `mapped_values` text,
  `setting_type_id` int DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `setting_type_id` (`setting_type_id`),
  CONSTRAINT `setting_ibfk_1` FOREIGN KEY (`setting_type_id`) REFERENCES `setting_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'Admin',_binary '',1,'none','none',1);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_type`
--

DROP TABLE IF EXISTS `setting_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_type`
--

LOCK TABLES `setting_type` WRITE;
/*!40000 ALTER TABLE `setting_type` DISABLE KEYS */;
INSERT INTO `setting_type` VALUES (1,'Role Name'),(2,'Contact Type'),(3,'Category Subject');
/*!40000 ALTER TABLE `setting_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `fullname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `avatar` blob,
  `status` bit(1) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `is_verified` bit(1) DEFAULT NULL,
  `verification_code` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_user_role` (`role_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@gmail.com','admin',1,NULL,'Le Tung Anh','0966968757',NULL,_binary '',_binary '',_binary '','123456'),(2,'Letunganh1304@gmail.com','123456',3,NULL,'Nahhh','0123456789',NULL,_binary '',_binary '',_binary '','123456'),(3,'letunganhd5@gmail.com','123456',2,NULL,'Tung Nahhh','9876543210',NULL,_binary '',_binary '',_binary '','123456'),(4,'letunganhd6@gmail.com','123456',3,NULL,'Tung Nahhh1','9876543210',NULL,_binary '',_binary '',_binary '','123456'),(5,'letunganhd7@gmail.com','123456',3,NULL,'Tung Nahhh2','9876543210',NULL,_binary '\0',_binary '',_binary '','123456'),(6,'letunganhd8@gmail.com','123456',3,NULL,'Tung Nahhh3','9876543211',NULL,_binary '',_binary '',_binary '\0','123456'),(7,'admin111@gmail.com','admin11111',1,NULL,'Le Tung Anh testSaddd','0966968757',NULL,_binary '',_binary '\0',_binary '',NULL),(8,'admin1234@gmail.com','admin111',2,NULL,'Le Tung Anh testSaddd111','1234567888',NULL,_binary '',_binary '\0',_binary '',NULL),(9,'admin@gmail.com','admin',2,NULL,'Le Tung Anh testSaddd345','0966968757',NULL,_binary '',_binary '\0',_binary '',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'swp391_bl5_v4'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-11  6:45:12
