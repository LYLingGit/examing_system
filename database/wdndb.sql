/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 8.0.26 : Database - wdniotes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wdniotes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `wdniotes`;

/*Table structure for table `t_exam_paper` */

DROP TABLE IF EXISTS `t_exam_paper`;

CREATE TABLE `t_exam_paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `paper_type` int DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `question_count` int DEFAULT NULL,
  `suggest_time` int DEFAULT NULL,
  `limit_start_time` datetime DEFAULT NULL,
  `limit_end_time` datetime DEFAULT NULL,
  `frame_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `task_exam_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_exam_paper` */

insert  into `t_exam_paper`(`id`,`name`,`subject_id`,`paper_type`,`grade_level`,`score`,`question_count`,`suggest_time`,`limit_start_time`,`limit_end_time`,`frame_text_content_id`,`create_user`,`create_time`,`deleted`,`task_exam_id`) values (1,'Java程序设计练习卷',4,6,2,160,5,20,NULL,NULL,27,2,'2022-03-22 13:08:02','\0',1),(2,'操作系统基础',11,4,2,70,5,15,'2022-03-22 00:00:00','2022-04-30 00:00:00',34,2,'2022-03-22 13:29:42','\0',NULL),(3,'计算机网络练习卷',6,6,2,120,5,15,NULL,NULL,40,2,'2022-03-22 13:57:52','\0',2),(4,'Spring练习卷1',22,1,5,140,5,15,NULL,NULL,58,2,'2022-03-22 17:22:08','\0',NULL),(5,'Spring练习卷2',22,1,5,100,5,20,NULL,NULL,59,2,'2022-03-22 17:23:08','\0',NULL),(6,'Spring框架模拟卷',22,1,5,520,11,60,NULL,NULL,66,2,'2022-03-22 21:24:20','\0',NULL),(7,'计算机网络练习卷',6,1,2,40,3,5,NULL,NULL,67,2,'2022-03-22 21:34:00','\0',NULL),(8,'Java框架练习卷',22,4,5,160,6,5,'2022-03-15 00:00:00','2022-04-29 00:00:00',68,2,'2022-03-22 21:47:08','\0',NULL),(9,'SpringBoot测试',22,6,5,160,4,10,NULL,NULL,69,2,'2022-03-22 21:48:36','\0',4),(10,'Java框架',22,6,5,180,5,30,NULL,NULL,70,2,'2022-03-22 21:52:11','\0',3),(11,'Spring考试卷',22,4,5,540,12,60,'2022-03-22 00:00:00','2022-04-05 00:00:00',73,2,'2022-03-22 22:02:57','\0',NULL),(12,'Java练习',4,6,2,170,5,30,'2022-03-15 00:00:00','2022-04-22 00:00:00',77,1,'2022-03-23 15:23:07','\0',1);

/*Table structure for table `t_exam_paper_answer` */

DROP TABLE IF EXISTS `t_exam_paper_answer`;

CREATE TABLE `t_exam_paper_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_paper_id` int DEFAULT NULL,
  `paper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paper_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `system_score` int DEFAULT NULL,
  `user_score` int DEFAULT NULL,
  `paper_score` int DEFAULT NULL,
  `question_correct` int DEFAULT NULL,
  `question_count` int DEFAULT NULL,
  `do_time` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `task_exam_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_exam_paper_answer` */

insert  into `t_exam_paper_answer`(`id`,`exam_paper_id`,`paper_name`,`paper_type`,`subject_id`,`system_score`,`user_score`,`paper_score`,`question_correct`,`question_count`,`do_time`,`status`,`create_user`,`create_time`,`task_exam_id`) values (1,2,'操作系统基础',4,11,40,40,70,3,5,35,2,3,'2022-03-22 20:54:18',NULL),(2,1,'Java程序设计练习卷',6,4,0,30,160,0,5,52,2,3,'2022-03-22 20:58:01',1),(3,4,'Spring练习卷1',1,22,100,100,140,4,5,31,2,4,'2022-03-22 21:25:50',NULL),(4,6,'Spring框架模拟卷',1,22,0,80,520,0,11,36,2,4,'2022-03-22 22:31:40',NULL),(5,10,'Java框架',6,22,0,40,180,2,5,33,2,4,'2022-03-23 15:36:00',3);

/*Table structure for table `t_exam_paper_question_customer_answer` */

DROP TABLE IF EXISTS `t_exam_paper_question_customer_answer`;

CREATE TABLE `t_exam_paper_question_customer_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `exam_paper_id` int DEFAULT NULL,
  `exam_paper_answer_id` int DEFAULT NULL,
  `question_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `customer_score` int DEFAULT NULL,
  `question_score` int DEFAULT NULL,
  `question_text_content_id` int DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text_content_id` int DEFAULT NULL,
  `do_right` bit(1) DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_exam_paper_question_customer_answer` */

insert  into `t_exam_paper_question_customer_answer`(`id`,`question_id`,`exam_paper_id`,`exam_paper_answer_id`,`question_type`,`subject_id`,`customer_score`,`question_score`,`question_text_content_id`,`answer`,`text_content_id`,`do_right`,`create_user`,`create_time`,`item_order`) values (1,6,2,1,1,11,20,20,29,'D',NULL,'',3,'2022-03-22 20:54:18',1),(2,10,2,1,1,11,20,20,33,'A',NULL,'',3,'2022-03-22 20:54:18',2),(3,8,2,1,1,11,0,0,31,'C',NULL,'\0',3,'2022-03-22 20:54:18',3),(4,7,2,1,3,11,0,20,30,'B',NULL,'\0',3,'2022-03-21 20:54:18',4),(5,9,2,1,3,11,0,10,32,'B',NULL,'\0',3,'2022-03-20 20:54:18',5),(6,1,1,2,1,4,0,20,21,'C',NULL,'\0',3,'2022-03-20 20:58:01',1),(7,2,1,2,1,4,0,20,22,'B',NULL,'\0',3,'2022-03-19 20:58:01',2),(8,3,1,2,1,4,0,20,23,'A',NULL,'\0',3,'2022-03-19 20:58:01',3),(9,4,1,2,2,4,0,40,24,'A',NULL,'\0',3,'2022-03-18 20:58:01',4),(10,5,1,2,5,4,30,60,25,NULL,64,'\0',3,'2022-03-18 20:58:01',5),(11,24,4,3,1,22,20,20,49,'A',NULL,'',4,'2022-03-18 21:25:50',1),(12,26,4,3,1,22,20,20,51,'C',NULL,'',4,'2022-03-18 21:25:50',2),(13,23,4,3,1,22,20,20,48,'C',NULL,'',4,'2022-03-17 21:25:50',3),(14,30,4,3,2,22,40,40,55,'A,C',NULL,'',4,'2022-03-17 21:25:50',4),(15,29,4,3,2,22,0,40,54,'B',NULL,'\0',4,'2022-03-17 21:25:50',5),(16,22,6,4,1,22,0,20,47,NULL,NULL,'\0',4,'2022-03-22 22:31:40',1),(17,23,6,4,1,22,0,20,48,NULL,NULL,'\0',4,'2022-03-22 22:31:40',2),(18,24,6,4,1,22,0,20,49,NULL,NULL,'\0',4,'2022-03-22 22:31:40',3),(19,21,6,4,1,22,0,20,46,NULL,NULL,'\0',4,'2022-03-22 22:31:40',4),(20,26,6,4,1,22,0,20,51,NULL,NULL,'\0',4,'2022-03-22 22:31:40',5),(21,30,6,4,2,22,0,40,55,'',NULL,'\0',4,'2022-03-22 22:31:40',6),(22,27,6,4,2,22,0,40,52,'',NULL,'\0',4,'2022-03-22 22:31:40',7),(23,29,6,4,2,22,0,40,54,'',NULL,'\0',4,'2022-03-22 22:31:40',8),(24,35,6,4,5,22,40,100,63,NULL,74,'\0',4,'2022-03-22 22:31:40',9),(25,33,6,4,5,22,10,100,61,NULL,75,'\0',4,'2022-03-22 22:31:40',10),(26,34,6,4,5,22,30,100,62,NULL,76,'\0',4,'2022-03-22 22:31:40',11),(27,21,10,5,1,22,0,20,46,'A',NULL,'\0',4,'2022-03-23 15:36:00',1),(28,22,10,5,1,22,0,20,47,'A',NULL,'\0',4,'2022-03-23 15:36:00',2),(29,32,10,5,4,22,20,20,57,NULL,80,'',4,'2022-03-23 15:36:00',3),(30,31,10,5,4,22,20,20,56,NULL,81,'',4,'2022-03-23 15:36:00',4),(31,33,10,5,5,22,0,100,61,NULL,82,'\0',4,'2022-03-23 15:36:00',5);

/*Table structure for table `t_message` */

DROP TABLE IF EXISTS `t_message`;

CREATE TABLE `t_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `send_user_id` int DEFAULT NULL,
  `send_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `send_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receive_user_count` int DEFAULT NULL,
  `read_count` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_message` */

insert  into `t_message`(`id`,`title`,`content`,`create_time`,`send_user_id`,`send_user_name`,`send_real_name`,`receive_user_count`,`read_count`) values (1,'Java练习','Java练习卷已发布，请同学们尽快完成！','2022-03-22 13:11:23',2,'admin','管理员',2,1),(2,'Spring练习卷','最新Spring练习卷已发布，请同学们尽快完成！','2022-03-22 22:16:51',2,'admin','管理员',2,1),(3,'Java练习卷已发布','Java练习卷已发布，请同学们尽快完成！','2022-03-23 15:27:56',1,'admin','李依玲',2,2);

/*Table structure for table `t_message_user` */

DROP TABLE IF EXISTS `t_message_user`;

CREATE TABLE `t_message_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` int DEFAULT NULL,
  `receive_user_id` int DEFAULT NULL,
  `receive_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receive_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `readed` bit(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_message_user` */

insert  into `t_message_user`(`id`,`message_id`,`receive_user_id`,`receive_user_name`,`receive_real_name`,`readed`,`create_time`,`read_time`) values (1,1,3,'mengda','季猛达','','2022-03-22 13:11:23','2022-03-23 15:32:37'),(2,1,6,'zero','戴广艳','\0','2022-03-22 13:11:23',NULL),(3,2,4,'weicheng','谢伟成','','2022-03-22 22:16:51','2022-03-23 15:35:10'),(4,2,5,'雾草','吴超','\0','2022-03-22 22:16:51',NULL),(5,3,3,'mengda','季猛达','','2022-03-23 15:27:56','2022-03-23 15:32:35'),(6,3,4,'weicheng','谢伟成','','2022-03-23 15:27:56','2022-03-23 15:35:08');

/*Table structure for table `t_question` */

DROP TABLE IF EXISTS `t_question`;

CREATE TABLE `t_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_type` int DEFAULT NULL COMMENT '题目类型 1-单选 2-多选 3-判断 4-填空 5-简答',
  `subject_id` int DEFAULT NULL COMMENT '学科',
  `score` int DEFAULT NULL COMMENT '分数(*10存储)',
  `grade_level` int DEFAULT NULL COMMENT '年级',
  `difficult` int DEFAULT NULL COMMENT '难度',
  `correct` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '正确答案',
  `info_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_question` */

insert  into `t_question`(`id`,`question_type`,`subject_id`,`score`,`grade_level`,`difficult`,`correct`,`info_text_content_id`,`create_user`,`status`,`create_time`,`deleted`) values (1,1,4,20,2,2,'A',21,2,1,'2022-03-22 12:14:35','\0'),(2,1,4,20,2,1,'D',22,2,1,'2022-03-22 12:19:12','\0'),(3,1,4,20,2,3,'B',23,2,1,'2022-03-22 12:22:35','\0'),(4,2,4,40,2,4,'B,C',24,2,1,'2022-03-22 12:25:29','\0'),(5,5,4,60,2,2,'面向对象有三大特征，封装，继承，多态：<p class=\"ueditor-p\">1.封装：对外只暴露最小完整可用接口，隐藏内部实现细节；</p><p class=\"ueditor-p\">2.继承：可以让子类被视作一个父类；</p><p class=\"ueditor-p\">3.多态：多态指的是一个对象可以体现出多种形态。</p>',25,2,1,'2022-03-22 12:28:11','\0'),(6,1,11,20,2,2,'D',29,2,1,'2022-03-22 13:19:11','\0'),(7,3,11,20,2,1,'A',30,2,1,'2022-03-22 13:20:30','\0'),(8,1,11,0,2,2,'A',31,2,1,'2022-03-22 13:22:16','\0'),(9,3,11,10,2,2,'A',32,2,1,'2022-03-22 13:24:01','\0'),(10,1,11,20,2,3,'A',33,2,1,'2022-03-22 13:26:02','\0'),(11,1,6,20,2,2,'C',35,2,1,'2022-03-22 13:48:18','\0'),(12,1,6,20,2,1,'B',36,2,1,'2022-03-22 13:50:07','\0'),(13,3,6,0,2,1,'B',37,2,1,'2022-03-22 13:51:43','\0'),(14,2,6,40,2,1,'B,C',38,2,1,'2022-03-22 13:54:06','\0'),(15,2,6,40,2,2,'B,C',39,2,1,'2022-03-22 13:56:09','\0'),(16,4,4,30,2,1,'',41,2,1,'2022-03-22 15:03:13','\0'),(17,5,4,50,2,3,'Java是一个近乎纯洁的面向对象编程语言，但是为了编程的方便还是引入了基本数据类型，但是为了能够将这些基本数据类型当成对象操作，Java为每一个基本数据类型都引入了对应的包装类型（wrapper class），int的包装类就是Integer，从Java 5开始引入了自动装箱/拆箱机制，使得二者可以相互转换。',42,2,1,'2022-03-22 15:04:28','\0'),(18,4,4,40,2,3,'',43,2,1,'2022-03-22 15:08:23','\0'),(19,3,4,20,2,2,'B',44,2,1,'2022-03-22 15:09:47','\0'),(20,5,4,50,2,4,'Java平台提供了两种类型的字符串：String和StringBuffer/StringBuilder，它们可以储存和操作字符串。其中String是只读字符串，也就意味着String引用的字符串内容是不能被改变的。而StringBuffer/StringBuilder类表示的字符串对象可以直接进行修改。StringBuilder是Java 5中引入的，它和StringBuffer的方法完全相同，区别在于它是在单线程环境下使用的，因为它的所有方面都没有被synchronized修饰，因此它的效率也比StringBuffer要高。',45,2,1,'2022-03-22 15:11:08','\0'),(21,1,22,20,5,4,'B',46,2,1,'2022-03-22 15:15:03','\0'),(22,1,22,20,5,2,'D',47,2,1,'2022-03-22 15:20:50','\0'),(23,1,22,20,5,3,'C',48,2,1,'2022-03-22 15:24:31','\0'),(24,1,22,20,5,2,'A',49,2,1,'2022-03-22 15:28:30','\0'),(25,2,22,20,5,4,'A,B,C,D',50,2,1,'2022-03-22 15:31:05','\0'),(26,1,22,20,5,3,'C',51,2,1,'2022-03-22 15:36:56','\0'),(27,2,22,40,5,3,'A,D',52,2,1,'2022-03-22 15:47:13','\0'),(28,4,22,20,5,4,'',53,2,1,'2022-03-22 16:57:55','\0'),(29,2,22,40,5,3,'C,D',54,2,1,'2022-03-22 16:59:40','\0'),(30,2,22,40,5,3,'A,C',55,2,1,'2022-03-22 17:01:57','\0'),(31,4,22,20,5,2,'',56,2,1,'2022-03-22 17:07:03','\0'),(32,4,22,20,5,3,'',57,2,1,'2022-03-22 17:18:47','\0'),(33,5,22,100,5,4,'1、Spring Boot 的核心配置文件是 application 和 bootstrap 配置文件。<p class=\"ueditor-p\">2、application主要用于 Spring Boot 项目的自动化配置。</p><p class=\"ueditor-p\">3、bootstrap配置文件有以下几个应用场景:</p><p class=\"ueditor-p\">（1）使用SpringCloudConfig配置中心时，这时需要在 bootstrap 配置文件中添加连接到配置中心的配置属性来加载外部配置中心的配置信息；</p><p class=\"ueditor-p\">（2）一些固定的不能被覆盖的属性；</p><p class=\"ueditor-p\">（3）一些加密/解密的场景。</p>',61,8,1,'2022-03-22 20:46:04','\0'),(34,5,22,100,5,5,'启动类上面的注解是@SpringBootApplication，它也是 Spring Boot 的核心注解，主要组合包含了以下 3 个注解：<p class=\"ueditor-p\">@SpringBootConfiguration：组合了 @Configuration 注解，实现配置文件的功能。</p><p class=\"ueditor-p\">@EnableAutoConfiguration：打开自动配置的功能，也可以关闭某个自动配置的选项，如关闭数据源自动配置功能： @SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })。</p><p class=\"ueditor-p\">@ComponentScan：Spring组件扫描。</p>',62,8,1,'2022-03-22 20:48:20','\0'),(35,5,22,100,5,3,'1）打包用命令或者放到容器中运行<p class=\"ueditor-p\">2）用 Maven/ Gradle 插件运行</p><p class=\"ueditor-p\">3）直接执行 main 方法运行</p>',63,8,1,'2022-03-22 20:52:15','\0'),(36,4,4,40,2,3,'',78,1,1,'2022-03-23 15:24:39','\0'),(37,1,4,20,2,2,'C',79,1,1,'2022-03-23 15:25:35','\0');

/*Table structure for table `t_subject` */

DROP TABLE IF EXISTS `t_subject`;

CREATE TABLE `t_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_subject` */

insert  into `t_subject`(`id`,`name`,`level`,`level_name`,`item_order`,`deleted`) values (1,'程序设计',1,'大一',1,'\0'),(2,'高等数学',1,'大一',2,'\0'),(3,'军事理论',1,'大一',NULL,'\0'),(4,'程序设计',2,'大二',NULL,'\0'),(5,'数据结构',2,'大二',NULL,'\0'),(6,'计算机网络',2,'大二',NULL,'\0'),(7,'大学英语',1,'大一',NULL,'\0'),(8,'大学英语',2,'大二',NULL,'\0'),(9,'数据库设计',2,'大二',NULL,'\0'),(10,'数值分析',2,'大二',NULL,'\0'),(11,'操作系统',2,'大二',NULL,'\0'),(12,'计算机组成原理',3,'大三',NULL,'\0'),(13,'大数据基础',3,'大三',NULL,'\0'),(14,'人工智能',3,'大三',NULL,'\0'),(15,'论文写作',4,'大四',NULL,'\0'),(16,'文献阅读',4,'大四',NULL,'\0'),(17,'项目实训',5,'研一',NULL,'\0'),(18,'研究生英语',5,'研一',NULL,'\0'),(19,'中国特色社会主义',5,'研一',NULL,'\0'),(20,'人工智能',5,'研一',NULL,'\0'),(21,'机器学习',5,'研一',NULL,'\0'),(22,'程序设计',5,'研一',NULL,'\0');

/*Table structure for table `t_task_exam` */

DROP TABLE IF EXISTS `t_task_exam`;

CREATE TABLE `t_task_exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `frame_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `create_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_task_exam` */

insert  into `t_task_exam`(`id`,`title`,`grade_level`,`frame_text_content_id`,`create_user`,`create_time`,`deleted`,`create_user_name`) values (1,'Java练习',2,28,2,'2022-03-22 13:09:12','\0','admin'),(2,'计算机网络练习',2,60,2,'2022-03-22 17:42:19','\0','admin'),(3,'Java框架题目练习',5,71,2,'2022-03-22 21:53:15','\0','admin'),(4,'Spring练习',5,72,2,'2022-03-22 21:53:42','\0','admin');

/*Table structure for table `t_task_exam_customer_answer` */

DROP TABLE IF EXISTS `t_task_exam_customer_answer`;

CREATE TABLE `t_task_exam_customer_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_exam_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `text_content_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_task_exam_customer_answer` */

insert  into `t_task_exam_customer_answer`(`id`,`task_exam_id`,`create_user`,`create_time`,`text_content_id`) values (1,1,2,'2022-03-22 20:58:01',65),(2,3,4,'2022-03-23 15:36:00',83);

/*Table structure for table `t_text_content` */

DROP TABLE IF EXISTS `t_text_content`;

CREATE TABLE `t_text_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_text_content` */

insert  into `t_text_content`(`id`,`content`,`create_time`) values (11,'{\"titleContent\":\"非聚合函数\",\"analyze\":\"SELECT选择\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"COUNT\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<p>AVG</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"SELECT\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"SUM\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}','2022-03-07 17:29:23'),(12,'{\"titleContent\":\"哪些是聚合函数\",\"analyze\":\"SELECT、UPDATE不是聚合函数\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<p>SUM</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"SELECT\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<p>UPDATE</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"COUNT\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}','2022-03-07 17:51:03'),(13,'{\"titleContent\":\"SELECT用于选择\",\"analyze\":\"正确\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}','2022-03-07 17:53:30'),(14,'{\"titleContent\":\"用于统计记录的函数为<span class=\\\"gapfilling-span f5d03b91-e743-458e-b9db-f1f5a6b89626\\\">1</span>，用于求和的函数为<span class=\\\"gapfilling-span 1fa3e019-948e-400d-b161-fc3f720f2931\\\">2</span>\",\"analyze\":\"如答案\",\"questionItemObjects\":[{\"prefix\":\"1\",\"content\":\"COUNT\",\"score\":20,\"itemUuid\":\"f5d03b91-e743-458e-b9db-f1f5a6b89626\"},{\"prefix\":\"2\",\"content\":\"SUM\",\"score\":20,\"itemUuid\":\"1fa3e019-948e-400d-b161-fc3f720f2931\"}],\"correct\":\"\"}','2022-03-07 17:56:38'),(15,'{\"titleContent\":\"聚合函数COUNT的作用\",\"analyze\":\"如答案\",\"questionItemObjects\":[],\"correct\":\"统计记录数\"}','2022-03-07 18:01:15'),(16,'[{\"name\":\"一、客观题\",\"questionItems\":[{\"id\":5,\"itemOrder\":1},{\"id\":6,\"itemOrder\":2},{\"id\":7,\"itemOrder\":3}]},{\"name\":\"二、主观题\",\"questionItems\":[{\"id\":8,\"itemOrder\":4},{\"id\":9,\"itemOrder\":5}]}]','2022-03-07 18:08:51'),(17,'[\"abc\",\"ABC\"]','2022-03-08 09:19:41'),(18,'qqqqq','2022-03-08 09:19:41'),(19,'[]','2022-03-08 11:11:10'),(20,NULL,'2022-03-08 11:11:10'),(21,'{\"titleContent\":\"<p>以下关于Object类的说法正确的是（）</p>\",\"analyze\":\"Object 是基类 Java中的所有的类都直接或间接的继承；所以A对<p class=\\\"ueditor-p\\\">从一个class派生的必然是另一个class。Object是一个class，如果interface继承自Object，那么interface必然是一个class，所以B错</p><p class=\\\"ueditor-p\\\">利用equals()方法进行比较时 会调用== 可以看equals()方法的源码，可以这样说， == 比equal更加强大，所以C错</p><p class=\\\"ueditor-p\\\">toString()方法是Object类中 即使不重写也能使用 所以D错</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"Java中所有的类都直接或间接继承自Object，无论是否明确的指明，无论其是否是抽象类。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"Java中的接口(interface)也继承了Object类\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"利用“==”比较两个对象时，Java调用继承自Object的equals方法，判断是否相等。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"如果类的定义中没有重新定义toString()方法，则该类创建的对象无法使用toStrig()方法。\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}','2022-03-22 12:14:35'),(22,'{\"titleContent\":\"<p class=\\\"ueditor-p\\\">关于抽象类和接口叙述正确的是？ ( )</p>\",\"analyze\":\"<p class=\\\"ueditor-p\\\">1、抽象类和方法都不能被实例化</p><p class=\\\"ueditor-p\\\">2、抽象类可以实现接口</p><p class=\\\"ueditor-p\\\">3、抽象类方法默认访问权限都是default</p><p class=\\\"ueditor-p\\\">4、接口就是访问的，默认访问权限都是public</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"抽象类和接口都能实例化的\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"抽象类不能实现接口\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"抽象类方法的访问权限默认都是public\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"接口方法的访问权限默认都是public\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}','2022-03-22 12:19:12'),(23,'{\"titleContent\":\"下列java程序的输出结果为____。<br/><p class=\\\"ueditor-p\\\">public class Example{</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; String str=new String(&quot;hello&quot;);</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; char[]ch={&#39;a&#39;,&#39;b&#39;};</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; public static void main(String args[]){</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; &nbsp; &nbsp; Example ex=new Example();</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; &nbsp; &nbsp; ex.change(ex.str,ex.ch);</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; &nbsp; &nbsp; System.out.print(ex.str+&quot; and &quot;);</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; &nbsp; &nbsp; System.out.print(ex.ch);</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; }</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; public void change(String str,char ch[]){</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; &nbsp; &nbsp; str=&quot;test ok&quot;;</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; &nbsp; &nbsp; ch[0]=&#39;c&#39;;</p><p class=\\\"ueditor-p\\\">&nbsp; &nbsp; }</p><p class=\\\"ueditor-p\\\">}</p>\",\"analyze\":\"<p class=\\\"ueditor-p\\\">String类是final类型的，不能继承和修改这个类。str=“tesk ok”，其实是隐含的让Java生成一个新的String对象，那么就与原来的“Hello”没有任何关系，当函数结束，str作用结束，所以输出的还是“Hello”。 char ch[] 是传递引用，修改了原内容。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"hello and ab\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"hello and cb\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"hello and a\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<p>test ok and ab</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"test ok and cb\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"F\",\"content\":\"test ok and c\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}','2022-03-22 12:22:35'),(24,'{\"titleContent\":\"<p>下列关于JAVA多线程的叙述正确的是（）</p>\",\"analyze\":\"A，start是开启线程，run是线程的执行体，run是线程执行的入口。<p class=\\\"ueditor-p\\\">B，CyclicBarrier和CountDownLatch都可以让一组线程等待其他线程。前者是让一组线程相互等待到某一个状态再执行。后者是一个线程等待其他线程结束再执行。</p><p class=\\\"ueditor-p\\\">C，Callable中的call比Runnable中的run厉害就厉害在有返回值和可以抛出异常。同时这个返回值和线程池一起用的时候可以返回一个异步对象Future。</p><p class=\\\"ueditor-p\\\">D，start是把线程从new变成了runnable</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"调用start()方法和run()都可以启动一个线程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"Callable类的call()方法可以返回值和抛出异常\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"CyclicBarrier和CountDownLatch都可以让一组线程等待其他线程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"新建的线程调用start()方法就能立即进行运行状态\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}','2022-03-22 12:25:29'),(25,'{\"titleContent\":\"<p>面向对象有哪些特征？</p>\",\"analyze\":\"见答案\",\"questionItemObjects\":[],\"correct\":\"面向对象有三大特征，封装，继承，多态：<p class=\\\"ueditor-p\\\">1.封装：对外只暴露最小完整可用接口，隐藏内部实现细节；</p><p class=\\\"ueditor-p\\\">2.继承：可以让子类被视作一个父类；</p><p class=\\\"ueditor-p\\\">3.多态：多态指的是一个对象可以体现出多种形态。</p>\"}','2022-03-22 12:28:11'),(26,'[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":2,\"itemOrder\":1},{\"id\":4,\"itemOrder\":2},{\"id\":3,\"itemOrder\":3}]},{\"name\":\"二、多选题\",\"questionItems\":[{\"id\":4,\"itemOrder\":4}]},{\"name\":\"三、简答题\",\"questionItems\":[{\"id\":5,\"itemOrder\":5}]}]','2022-03-22 12:32:08'),(27,'[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":1,\"itemOrder\":1},{\"id\":2,\"itemOrder\":2},{\"id\":3,\"itemOrder\":3}]},{\"name\":\"二、多选题\",\"questionItems\":[{\"id\":4,\"itemOrder\":4}]},{\"name\":\"三、简答题\",\"questionItems\":[{\"id\":5,\"itemOrder\":5}]}]','2022-03-22 13:08:02'),(28,'[{\"examPaperId\":1,\"examPaperName\":\"Java程序设计练习卷\",\"itemOrder\":null},{\"examPaperId\":12,\"examPaperName\":\"Java练习\",\"itemOrder\":null}]','2022-03-22 13:09:12'),(29,'{\"titleContent\":\"一个进程被唤醒意味着（）\",\"analyze\":\"D，被唤醒说明是睡眠状态，也就是阻塞状态，被唤醒之后到就绪状态。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"该进程一定马上占有\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"它的优先权变得最大\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"其PCB移至等待队列队首\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"进程变为就绪状态\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}','2022-03-22 13:19:11'),(30,'{\"titleContent\":\"<p class=\\\"ueditor-p\\\">系统中进程的数目越多，CPU的利用率就越高。</p>\",\"analyze\":\"<p class=\\\"ueditor-p\\\">进程数超过一定程度，就有由于大量进程间切换而耗费过多的cpu资源，所以利用率反而下降</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}','2022-03-22 13:20:30'),(31,'{\"titleContent\":\"系统调用的目的是（）。\",\"analyze\":\"A 请求系统服务。操作系统编制了许多不同功能的子程序，供用户程序执行中调用。这些由操作系统提供的子程序称为系统功能调用，简称系统调用。系统调用是操作系统为用户程序提供的一种服务界面，或者说，是操作系统保证程序设计语言能正常工作的一种支持。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"请求系统服务\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"终止系统服务\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"申请系统资源\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"释放系统资源\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}','2022-03-22 13:22:16'),(32,'{\"titleContent\":\"<p class=\\\"ueditor-p\\\">采用动态重定位技术的系统，目标程序可以不经任何改动，而装入物理内存，这种说法正确吗？</p>\",\"analyze\":\"动态重定位：即在程序运行过程中要访问数据时再进行逻辑地址与物理地址的变换（即在逐条指令执行时完成地址映射）。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}','2022-03-22 13:24:01'),(33,'{\"titleContent\":\"如果I/O 设备与存储设备间的数据交换不经过CPU 来完成，则这种数据交换方式是（）。\",\"analyze\":\"DMA(Direct Memory Access，直接内存存取) 是所有现代电脑的重要特色，它允许不同速度的硬件装置来沟通，而不需要依赖于 CPU 的大量中断负载。否则，CPU 需要从来源把每一片段的资料复制到暂存器，然后把它们再次写回到新的地方。在这个时间中，CPU 对于其他的工作来说就无法使用。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"DMA\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"中断方式\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"无条件\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"程序查询方式\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}','2022-03-22 13:26:02'),(34,'[{\"name\":\"一、选择题\",\"questionItems\":[{\"id\":6,\"itemOrder\":1},{\"id\":10,\"itemOrder\":2},{\"id\":8,\"itemOrder\":3}]},{\"name\":\"二、判断题\",\"questionItems\":[{\"id\":7,\"itemOrder\":4},{\"id\":9,\"itemOrder\":5}]}]','2022-03-22 13:29:42'),(35,'{\"titleContent\":\"在下面的IP地址中属于C类地址的是（&nbsp; ）\",\"analyze\":\"<p class=\\\"ueditor-p\\\">A类地址1.0.0.1-126.255.255.254</p><p class=\\\"ueditor-p\\\">B类地址128.1.0.1-191.255.255.254</p><p class=\\\"ueditor-p\\\">C类地址192.0.1.1-223.255.255.254</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<p class=\\\"ueditor-p\\\">126.0.1.0</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"191.3.3.3\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"192.234.111.123\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"128.34.45.56\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}','2022-03-22 13:48:18'),(36,'{\"titleContent\":\"TCP/IP网络中，提供端到端的通信的是(&nbsp; &nbsp;)。\",\"analyze\":\"<p class=\\\"ueditor-p\\\">TCP/IP协议栈分为4层（分类1）：1. 链路层 2. IP层 3. 传输层（TCP/ UDP） 4. 应用层</p><p class=\\\"ueditor-p\\\">OSI参考模型（分类2：本题）：1. 物理层 2. 数据链路层 3. 网络层 4. 传输层 5. 会话层 6. 表示层 7. 应用层</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"应用层\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"传输层\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"网络层\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"网络接口层\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}','2022-03-22 13:50:07'),(37,'{\"titleContent\":\"<p class=\\\"ueditor-p\\\">并发的、面向连接的服务器可以有 n 个不同的进程 (&nbsp; )</p>\",\"analyze\":\"<p class=\\\"ueditor-p\\\">面向连接，意味着运行于两台主机里面的两个进程之间存在一条链接，所以是一对一的。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}','2022-03-22 13:51:43'),(38,'{\"titleContent\":\"属于网络层协议的有？\",\"analyze\":\"IP协议自然属于网络层；<p class=\\\"ueditor-p\\\">ICMp协议是用于在主机和路由器之间传递控制消息，很明显也是属于网络层</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"TCP\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"IP\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"ICMP\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"X.25\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B,C\"}','2022-03-22 13:54:06'),(39,'{\"titleContent\":\"公司办公室的一台计算机通过IP可以访问外网，无法使用域名访问外部web服务器,造成这种情况可能的原因是（ ）\",\"analyze\":\"IP地址与路由器网关地址必须在同一网段，DNS则不需要，DNS服务器地址一般由运营商指定；所以C错<p class=\\\"ueditor-p\\\">如果网关设置错误，不能访问外网。题目中是可以通过IP地址访问外网的；所以D错</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"该计算机的DNS缓存有错\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"没有指定正确的DNS服务器\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"该计算机与DNS服务器IP地址在不同的网段\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"网关设置出错\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}','2022-03-22 13:56:09'),(40,'[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":11,\"itemOrder\":1},{\"id\":12,\"itemOrder\":2}]},{\"name\":\"二、多选题\",\"questionItems\":[{\"id\":14,\"itemOrder\":3},{\"id\":15,\"itemOrder\":4}]},{\"name\":\"三、判断题\",\"questionItems\":[{\"id\":13,\"itemOrder\":5}]}]','2022-03-22 13:57:52'),(41,'{\"titleContent\":\"<p>面向对象的三大特征：<span class=\\\"gapfilling-span 499bed93-cae1-4848-95f8-1067467e8b32\\\">1</span>、<span class=\\\"gapfilling-span 3c0031ff-db91-4b02-ae43-99e1e08e2396\\\">2</span>、<span class=\\\"gapfilling-span 058d899c-ea2f-4bd2-94db-97669b8e9190\\\">3</span></p>\",\"analyze\":\"继承、封装、多态是面向对象的三大特征。\",\"questionItemObjects\":[{\"prefix\":\"1\",\"content\":\"<p>继承</p>\",\"score\":10,\"itemUuid\":\"499bed93-cae1-4848-95f8-1067467e8b32\"},{\"prefix\":\"2\",\"content\":\"封装\",\"score\":10,\"itemUuid\":\"3c0031ff-db91-4b02-ae43-99e1e08e2396\"},{\"prefix\":\"3\",\"content\":\"<p>多态</p>\",\"score\":10,\"itemUuid\":\"058d899c-ea2f-4bd2-94db-97669b8e9190\"}],\"correct\":\"\"}','2022-03-22 15:03:13'),(42,'{\"titleContent\":\"<p>int和Integer有什么区别？</p>\",\"analyze\":\"见答案\",\"questionItemObjects\":[],\"correct\":\"Java是一个近乎纯洁的面向对象编程语言，但是为了编程的方便还是引入了基本数据类型，但是为了能够将这些基本数据类型当成对象操作，Java为每一个基本数据类型都引入了对应的包装类型（wrapper class），int的包装类就是Integer，从Java 5开始引入了自动装箱/拆箱机制，使得二者可以相互转换。\"}','2022-03-22 15:04:28'),(43,'{\"titleContent\":\"Math.round(11.5) 等于<span class=\\\"gapfilling-span 05100382-52b4-444b-97d3-b94e3b477c95\\\">1</span>，Math.round(-11.5)等于<span class=\\\"gapfilling-span a3768fb6-5bb4-448d-b567-198bd19e4b0f\\\">2</span>。\",\"analyze\":\"<p>Math.round(11.5)的返回值是12，Math.round(-11.5)的返回值是-11。四舍五入的原理是在参数上加0.5然后进行下取整。</p>\",\"questionItemObjects\":[{\"prefix\":\"1\",\"content\":\"12\",\"score\":20,\"itemUuid\":\"05100382-52b4-444b-97d3-b94e3b477c95\"},{\"prefix\":\"2\",\"content\":\"-11\",\"score\":20,\"itemUuid\":\"a3768fb6-5bb4-448d-b567-198bd19e4b0f\"}],\"correct\":\"\"}','2022-03-22 15:08:23'),(44,'{\"titleContent\":\"构造器是否可被重写？\",\"analyze\":\"构造器不能被继承，因此不能被重写，但可以被重载。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}','2022-03-22 15:09:47'),(45,'{\"titleContent\":\"String和StringBuilder、StringBuffer的区别？\",\"analyze\":\"见答案\",\"questionItemObjects\":[],\"correct\":\"Java平台提供了两种类型的字符串：String和StringBuffer/StringBuilder，它们可以储存和操作字符串。其中String是只读字符串，也就意味着String引用的字符串内容是不能被改变的。而StringBuffer/StringBuilder类表示的字符串对象可以直接进行修改。StringBuilder是Java 5中引入的，它和StringBuffer的方法完全相同，区别在于它是在单线程环境下使用的，因为它的所有方面都没有被synchronized修饰，因此它的效率也比StringBuffer要高。\"}','2022-03-22 15:11:08'),(46,'{\"titleContent\":\"下列关于Spring中Bean作用域的说法错误的是()\",\"analyze\":\"bean的作用域由@scope注解来修改，该注解有五个不同的取值，分别是：singleton、prototype、request、session、global-session。<p class=\\\"ueditor-p\\\">1、singleton，在每一个Spring容器中，一个Bean定义只有一个对象实例（默认为singleton）</p><p class=\\\"ueditor-p\\\">2、prototype，允许Bean的定义可以被实例化任意次（每次调用都创建一个一个实例）</p><p class=\\\"ueditor-p\\\">3、request，在一次HTTP请求中，每个Bean定义对应一个实例。该作用域仅在基于Web的Spring上下文（例如SpringMVC）中才有效</p><p class=\\\"ueditor-p\\\">4、session，在一个HTTP Session中，每个Bean定义对应一个实例。该作用域仅在基于Web的Spring上下文（例如SpringMVC）中才有效</p><p class=\\\"ueditor-p\\\">5、global-session，在一个全局HTTP Session中，每个Bean定义对应一个实例。该作用域仅在基于Web的Spring上下文（例如SpringMVC）中才有效</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"Bean的作用域可以通过@Scope注解来修改，该注解有五个不同的取值。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"对定义为session的Bean，每次HTTP请求都会创建一个新的Bean。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"每次通过Spring容器获取prototype定义的Bean时，容器都将创建一个新的Bean实例。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"作用域为globalSession的Bean来讲，在一个全局的HTTP Session中，容器会返回该Bean的同一个实例\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}','2022-03-22 15:15:03'),(47,'{\"titleContent\":\"下列关于Spring MVC获取参数的说法中，错误的是（）\",\"analyze\":\"<p class=\\\"ueditor-p\\\">A、B、C三个选项的说法均是正确的。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"@DateTimeFormat注解用于获取格式化的日期参数。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"@NumberFormat注解用于获取格式化的数字参数。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"@RequestBody注解用于从请求体中获取参数。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"其他说法都不对\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}','2022-03-22 15:20:50'),(48,'{\"titleContent\":\"下列选项中，哪个不是Spring MVC拦截器的方法（）\",\"analyze\":\"Spring MVC拦截器包含三个方法：preHandle()、postHandle()、afterCompletion()。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"preHandle()\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"postHandle()\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"afterHandle()\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"afterCompletion()\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}','2022-03-22 15:24:31'),(49,'{\"titleContent\":\"<p class=\\\"ueditor-p\\\">关于Spring IoC，以下说法正确的是（）</p>\",\"analyze\":\"IoC是控制反转的意思，是一种面向对象编程的设计思想。在不采用这种思想的情况下，我们需要自己维护对象与对象之间的依赖关系，很容易造成对象之间的耦合度过高，在一个大型的项目中这十分的不利于代码的维护。IoC则可以解决这种问题，它可以帮我们维护对象与对象之间的依赖关系，并且降低对象之间的耦合度。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"IoC是控制反转的意思，这是一种面向对象的编程思想。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"IoC是控制反转的意思，这是一种面向切面编程的思想。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"Spring采用依赖注入的方式，实现了IoC思想。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"Spring采用依赖查找的方式，实现了IoC思想。\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}','2022-03-22 15:28:30'),(50,'{\"titleContent\":\"<p class=\\\"ueditor-p\\\">下列关于@EnableAutoConfiguration注解说法正确的是（）</p>\",\"analyze\":\"<p class=\\\"ueditor-p\\\">@EnableAutoConfiguration由@SpringBootApplication引入，它的主要功能是启动Spring应用程序上下文时进行自动配置，它会尝试猜测并配置项目可能需要的Bean。从源代码得知@Import是@EnableAutoConfiguration注解的组成部分，也是自动配置功能的核心实现者。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"该注解由组合注解@SpringBootApplication引入。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"该注解作用是开启Spring Boot自动配置。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"@EnableAutoConfiguration的关键功能是通过@Import注解导入的ImportSelector来完成的。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"该注解会扫描各个jar包下的spring.factories文件，并加载文件中注册的AutoConfiguration类等。\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}','2022-03-22 15:31:05'),(51,'{\"titleContent\":\"关于Spring MVC开发，下列说法错误的是（）\",\"analyze\":\"Model 对象可以被自动实例化。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"在控制器的方法中，我们可以直接使用Request、Response对象处理请求与响应。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"ModelAndView对象，既可以存储模型数据，又可以存储模板路径。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"Model对象只能存放模型数据，它和ModelAndView一样，需要主动实例化。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"Spring MVC的核心组件是DispatcherServlet，它负责分发所有的请求。\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}','2022-03-22 15:36:56'),(52,'{\"titleContent\":\"关于Spring注解，下列说法正确的是（）\",\"analyze\":\"@Autowired是Spring提供的注解，@Resource是JDK提供的注解。它们的区别是，@Autowired只能按类型注入，@Resource默认按名称注入，也支持按类型注入。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"@Autowired是Spring提供的注解。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"@Autowired是JDK提供的注解。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"@Resource是Spring提供的注解。\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"@Resource是JDK提供的注解。\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}','2022-03-22 15:47:13'),(53,'{\"titleContent\":\"Spring在TransactionDefinition接口中规定了7种类型的事务传播行为，其中<span class=\\\"gapfilling-span 1efa4cf4-d25a-4549-a064-18c78d7ae1a0\\\">1</span>表示：如果当前没有事务，则新建一个事务；如果已存在一个事务，则加入到这个事务中。\",\"analyze\":\"PROPAGATION_SUPPORTS--支持当前事务，如果当前没有事务，就以非事务方式执行。<p class=\\\"ueditor-p\\\">PROPAGATION_MANDATORY--支持当前事务，如果当前没有事务，就抛出异常。</p><p class=\\\"ueditor-p\\\">PROPAGATION_REQUIRES_NEW--新建事务，如果当前存在事务，把当前事务挂起。</p><p class=\\\"ueditor-p\\\">PROPAGATION_NOT_SUPPORTED--以非事务方式执行操作，如果当前存在事务，就把当前事务挂起。</p><p class=\\\"ueditor-p\\\">PROPAGATION_NEVER--以非事务方式执行，如果当前存在事务，则抛出异常。</p><p class=\\\"ueditor-p\\\">PROPAGATION_NESTED -- 若当前存在事务，则采用嵌套事务执行此方法，否则就创建新事务来执行此方法。</p>\",\"questionItemObjects\":[{\"prefix\":\"1\",\"content\":\"REQUIRED\",\"score\":20,\"itemUuid\":\"1efa4cf4-d25a-4549-a064-18c78d7ae1a0\"}],\"correct\":\"\"}','2022-03-22 16:57:55'),(54,'{\"titleContent\":\"在Spring MVC中，若要实现上传功能，则需要使用的核心组件是（）\",\"analyze\":\"<span style=\\\"color: #333333; font-family: system, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Segoe UI&quot;, &quot;Microsoft YaHei&quot;, &quot;wenquanyi micro hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Hiragino Sans GB W3&quot;, Roboto, Oxygen, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, Arial, sans-serif; font-size: 14px; background-color: #FFFFFF;\\\">在Spring&nbsp;MVC中实现上传功能，主要依赖MultipartHttpServletRequest从读取请求中的文件，然后对读取到的MultipartFile类型进行处理。</span>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"HttpServletRequest\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"HttpServletResponse\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"MultipartHttpServletRequest\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"MultipartFile\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}','2022-03-22 16:59:40'),(55,'{\"titleContent\":\"下列选项中，属于Spring容器的类有（）\",\"analyze\":\"Spring提供了众多容器类，最常用的有BeanFactory和ApplicationContext。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"BeanFactory\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"FactoryBean\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"ApplicationContext\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"ContextApplication\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}','2022-03-22 17:01:57'),(56,'{\"titleContent\":\"<p>下列Spring MVC注解中，可以映射多种HTTP请求类型的是<span class=\\\"gapfilling-span ffb601af-f38a-4d7f-b634-657e21dc982f\\\">1</span>。</p>\",\"analyze\":\"@RequestMapping注解可以映射多种HTTP请求类型，具体的类型通过method配置项指定。为了简化method配置项，Spring 4.3版本新增了几个注解，这些注解可以看成是@RequestMapping注解的快捷方式，相当于固定了method配置项的值，这些注解包括：@GetMapping、@PostMapping、@PatchMapping、@PutMapping、@DeleteMapping。\",\"questionItemObjects\":[{\"prefix\":\"1\",\"content\":\"<p class=\\\"ueditor-p\\\">@RequestMapping</p>\",\"score\":20,\"itemUuid\":\"ffb601af-f38a-4d7f-b634-657e21dc982f\"}],\"correct\":\"\"}','2022-03-22 17:07:03'),(57,'{\"titleContent\":\"可以通过@Transactional的<span class=\\\"gapfilling-span 164a6459-b41c-4a93-92ed-2add39836d04\\\">1</span>属性，指定事务的传播行为。\",\"analyze\":\"<p class=\\\"ueditor-p\\\">Transactiono使用propagation指定传播行为</p>\",\"questionItemObjects\":[{\"prefix\":\"1\",\"content\":\"propagation\",\"score\":20,\"itemUuid\":\"164a6459-b41c-4a93-92ed-2add39836d04\"}],\"correct\":\"\"}','2022-03-22 17:18:47'),(58,'[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":24,\"itemOrder\":1},{\"id\":26,\"itemOrder\":2},{\"id\":23,\"itemOrder\":3}]},{\"name\":\"二、多选题\",\"questionItems\":[{\"id\":30,\"itemOrder\":4},{\"id\":29,\"itemOrder\":5}]}]','2022-03-22 17:22:08'),(59,'[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":23,\"itemOrder\":1},{\"id\":21,\"itemOrder\":2},{\"id\":22,\"itemOrder\":3}]},{\"name\":\"二、填空题\",\"questionItems\":[{\"id\":32,\"itemOrder\":4},{\"id\":31,\"itemOrder\":5}]}]','2022-03-22 17:23:08'),(60,'[{\"examPaperId\":3,\"examPaperName\":\"计算机网络练习卷\",\"itemOrder\":null}]','2022-03-22 17:42:19'),(61,'{\"titleContent\":\"<p class=\\\"ueditor-p\\\">Spring Boot 的核心配置文件有哪几个？它们的区别是什么？</p>\",\"analyze\":\"<p>见答案</p>\",\"questionItemObjects\":[],\"correct\":\"1、Spring Boot 的核心配置文件是 application 和 bootstrap 配置文件。<p class=\\\"ueditor-p\\\">2、application主要用于 Spring Boot 项目的自动化配置。</p><p class=\\\"ueditor-p\\\">3、bootstrap配置文件有以下几个应用场景:</p><p class=\\\"ueditor-p\\\">（1）使用SpringCloudConfig配置中心时，这时需要在 bootstrap 配置文件中添加连接到配置中心的配置属性来加载外部配置中心的配置信息；</p><p class=\\\"ueditor-p\\\">（2）一些固定的不能被覆盖的属性；</p><p class=\\\"ueditor-p\\\">（3）一些加密/解密的场景。</p>\"}','2022-03-22 20:46:04'),(62,'{\"titleContent\":\"SpringBoot的核心注解是哪个？它主要由哪几个注解组成的？\",\"analyze\":\"见答案\",\"questionItemObjects\":[],\"correct\":\"启动类上面的注解是@SpringBootApplication，它也是 Spring Boot 的核心注解，主要组合包含了以下 3 个注解：<p class=\\\"ueditor-p\\\">@SpringBootConfiguration：组合了 @Configuration 注解，实现配置文件的功能。</p><p class=\\\"ueditor-p\\\">@EnableAutoConfiguration：打开自动配置的功能，也可以关闭某个自动配置的选项，如关闭数据源自动配置功能： @SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })。</p><p class=\\\"ueditor-p\\\">@ComponentScan：Spring组件扫描。</p>\"}','2022-03-22 20:48:20'),(63,'{\"titleContent\":\"运行SpringBoot有哪几种方式？\",\"analyze\":\"见答案\",\"questionItemObjects\":[],\"correct\":\"1）打包用命令或者放到容器中运行<p class=\\\"ueditor-p\\\">2）用 Maven/ Gradle 插件运行</p><p class=\\\"ueditor-p\\\">3）直接执行 main 方法运行</p>\"}','2022-03-22 20:52:15'),(64,'继承、封装和多态','2022-03-22 20:58:01'),(65,'[{\"examPaperId\":1,\"examPaperAnswerId\":2,\"status\":2}]','2022-03-22 20:58:01'),(66,'[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":22,\"itemOrder\":1},{\"id\":23,\"itemOrder\":2},{\"id\":24,\"itemOrder\":3},{\"id\":21,\"itemOrder\":4},{\"id\":26,\"itemOrder\":5}]},{\"name\":\"二、多选题\",\"questionItems\":[{\"id\":30,\"itemOrder\":6},{\"id\":27,\"itemOrder\":7},{\"id\":29,\"itemOrder\":8}]},{\"name\":\"四、简答题\",\"questionItems\":[{\"id\":35,\"itemOrder\":9},{\"id\":33,\"itemOrder\":10},{\"id\":34,\"itemOrder\":11}]}]','2022-03-22 21:24:20'),(67,'[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":11,\"itemOrder\":1},{\"id\":12,\"itemOrder\":2}]},{\"name\":\"二、判断题\",\"questionItems\":[{\"id\":13,\"itemOrder\":3}]}]','2022-03-22 21:34:00'),(68,'[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":24,\"itemOrder\":1},{\"id\":23,\"itemOrder\":2},{\"id\":22,\"itemOrder\":3},{\"id\":21,\"itemOrder\":4}]},{\"name\":\"二、多选题\",\"questionItems\":[{\"id\":29,\"itemOrder\":5},{\"id\":27,\"itemOrder\":6}]}]','2022-03-22 21:47:08'),(69,'[{\"name\":\"一、客观题\",\"questionItems\":[{\"id\":24,\"itemOrder\":1},{\"id\":23,\"itemOrder\":2}]},{\"name\":\"二、主观题\",\"questionItems\":[{\"id\":31,\"itemOrder\":3},{\"id\":35,\"itemOrder\":4}]}]','2022-03-22 21:48:36'),(70,'[{\"name\":\"一、选择题\",\"questionItems\":[{\"id\":21,\"itemOrder\":1},{\"id\":22,\"itemOrder\":2}]},{\"name\":\"二、填空题\",\"questionItems\":[{\"id\":32,\"itemOrder\":3},{\"id\":31,\"itemOrder\":4}]},{\"name\":\"三、简答题\",\"questionItems\":[{\"id\":33,\"itemOrder\":5}]}]','2022-03-22 21:52:11'),(71,'[{\"examPaperId\":10,\"examPaperName\":\"Java框架\",\"itemOrder\":null}]','2022-03-22 21:53:15'),(72,'[{\"examPaperId\":9,\"examPaperName\":\"SpringBoot测试\",\"itemOrder\":null}]','2022-03-22 21:53:42'),(73,'[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":26,\"itemOrder\":1},{\"id\":23,\"itemOrder\":2},{\"id\":24,\"itemOrder\":3},{\"id\":22,\"itemOrder\":4}]},{\"name\":\"二、多选题\",\"questionItems\":[{\"id\":27,\"itemOrder\":5},{\"id\":29,\"itemOrder\":6},{\"id\":30,\"itemOrder\":7}]},{\"name\":\"三、填空题\",\"questionItems\":[{\"id\":32,\"itemOrder\":8},{\"id\":31,\"itemOrder\":9}]},{\"name\":\"四、简答题\",\"questionItems\":[{\"id\":35,\"itemOrder\":10},{\"id\":34,\"itemOrder\":11},{\"id\":33,\"itemOrder\":12}]}]','2022-03-22 22:02:57'),(74,NULL,'2022-03-22 22:31:40'),(75,NULL,'2022-03-22 22:31:40'),(76,'','2022-03-22 22:31:40'),(77,'[{\"name\":\"一、选择题\",\"questionItems\":[{\"id\":1,\"itemOrder\":1},{\"id\":2,\"itemOrder\":2}]},{\"name\":\"二、填空题\",\"questionItems\":[{\"id\":16,\"itemOrder\":3}]},{\"name\":\"三、简答题\",\"questionItems\":[{\"id\":20,\"itemOrder\":4},{\"id\":17,\"itemOrder\":5}]}]','2022-03-23 15:23:07'),(78,'{\"titleContent\":\"有变量：<p class=\\\"ueditor-p\\\">int i = 0;</p><p class=\\\"ueditor-p\\\">int a = i++;</p><p class=\\\"ueditor-p\\\">int b = ++a;&nbsp;</p><p class=\\\"ueditor-p\\\">int c = a+b;&nbsp;</p><p class=\\\"ueditor-p\\\">int d = (a == 1)?b:c;&nbsp;</p><p class=\\\"ueditor-p\\\">最终结果为：a=<span class=\\\"gapfilling-span 60b9f22f-09cb-4957-b92d-d6066bcdda36\\\">1</span>，d=<span class=\\\"gapfilling-span f0de8e36-7b0d-4d90-92cf-a540546f072b\\\">2</span></p>\",\"analyze\":\"int i = 0; //i=0<p class=\\\"ueditor-p\\\">int a = i++; //a=i,a=0,i++,i=1</p><p class=\\\"ueditor-p\\\">int b = ++a; //a++,a=1,b=a,b=1</p><p class=\\\"ueditor-p\\\">int c = a+b;//c=2</p><p class=\\\"ueditor-p\\\">&nbsp;int d = (a == 1)?b:c;//a==1,d=b,d=1&nbsp;</p><p class=\\\"ueditor-p\\\">综上a==1, d==1</p>\",\"questionItemObjects\":[{\"prefix\":\"1\",\"content\":\"1\",\"score\":20,\"itemUuid\":\"60b9f22f-09cb-4957-b92d-d6066bcdda36\"},{\"prefix\":\"2\",\"content\":\"1\",\"score\":20,\"itemUuid\":\"f0de8e36-7b0d-4d90-92cf-a540546f072b\"}],\"correct\":\"\"}','2022-03-23 15:24:39'),(79,'{\"titleContent\":\"从以下哪一个选项中可以获得Servlet的初始化参数?\",\"analyze\":\"通过ServletConfig接口的getInitParameter(java.lang.String name)方法\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"Servlet\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"ServletContext\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"ServletConfig\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"GenericServlet\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}','2022-03-23 15:25:35'),(80,'[\"Propagtation\"]','2022-03-23 15:36:00'),(81,'[\"RequestMapping\"]','2022-03-23 15:36:00'),(82,'1个','2022-03-23 15:36:00'),(83,'[{\"examPaperId\":10,\"examPaperAnswerId\":5,\"status\":2}]','2022-03-23 15:36:00');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `birth_day` datetime DEFAULT NULL,
  `user_level` int DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `last_active_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`user_uuid`,`user_name`,`password`,`real_name`,`age`,`sex`,`birth_day`,`user_level`,`phone`,`role`,`status`,`image_path`,`create_time`,`modify_time`,`last_active_time`,`deleted`,`wx_open_id`) values (1,'627c1a27-ba93-4db9-8fb9-a8020c10a24b','admin','Aubmw6ZbJTPx/aXAVdUgXn6qQQwEjrW+Z8REfodiq5RA4VRRBZj6kOdVvKTDGG/8TBXValRVrjXj4nXscFxIMuACZk7BBRlsXd08y+FWSy5h8EOSvp535ah5jISMFnmZ4qB/HzBpsg+fCyBzClgDS5VzCNWTBExF4hdq1OchLxc=','李依玲',23,2,'1999-02-04 00:00:00',NULL,'13013770833',3,1,NULL,'2022-03-22 12:47:01',NULL,'2022-03-22 12:47:01','\0',NULL),(3,'6a9bd986-09db-488b-8ca6-a2e5c139f2c4','mengda','O2yOoT1eUJas5y6etDAsARJtt84ZiDLfsHr54zJE3kuZDB7V9OROMGEiiCFBVdR0nXlYrGS55K+M8K4vL9jy/eQwDL1Mb305hgB/nwJhTzQuAV3LkRbXqDKvAOhgbY17Xm38cgkgvUBrstRvpyHOipqh5KlblIUa1qwe2M7RBqc=','季猛达',20,1,'2001-05-15 00:00:00',2,'13083928493',1,1,'http://xzs.file.mindskip.net/FmsKiW1OpM5r8xHsIF-cz86pHPs9','2022-03-22 12:45:18','2022-03-22 20:22:18','2022-03-22 12:45:18','\0',NULL),(4,'e820ae97-9368-4645-9575-28291425bcc9','weicheng','frS4IoAeW1cWI3WJoanaDPezVQP3qyIlrcjTzBr+TFyGnnS+G2l1ePk6+TZOecQRoXnmAsHw1AZQmKI/JdFeMH1UBBuPIyv68BOEbBbrXZb6cDc9Gr3CRDoNovbsC5Mrn3cjH9pHmoIC6fkzn4L70vkxlaA8tQswFw2hzwIIxC4=','谢伟成',23,1,'1998-11-20 00:00:00',5,'17728123943',1,1,'http://xzs.file.mindskip.net/Ftn_J2hHSsZH7GF1Pe5hVb29Vgf7','2022-03-22 13:00:36','2022-03-23 15:34:58','2022-03-22 13:00:36','\0',NULL),(5,'9a3f5819-c041-4bfc-870c-0b5e1fbcdc77','雾草','jHTSKiM6hwrf2dD8WlGQhOw9XKePCIF6K4/8Lb+kXuTPAOhGnze0lb0zMiEpuW8Kqd/A3gtwXsW5CQFI2ZKxAuQEdmRQdkRf7RTMZqg4VcP5RQ3S5DmR5RvazRYmmZi+H2hAfpGMcEh9xQL3CYLarkuW0V55uWh2NNwAkZLh4Ks=','吴超',23,1,NULL,3,'13829428492',1,2,NULL,'2022-03-22 13:03:59','2022-03-23 15:20:42','2022-03-22 13:03:59','\0',NULL),(6,'87fa4cdd-d820-4811-96c8-0d143ea23bc7','zero','g/kTnIVtm6UDG+/ZJXNiRmYiCtkT2sk8G+c4W4TbE/AeIqOHIWPtfre+QW6aLcH9sHlPxbOBwzil40GK2SL7FMKiUkbmAqSfbg9YhpIoUzYPGPtUkNaiMQlGdARI3ya+GMd9LhTxF0LDZWy/XRK6GCMsJdGVgpOII7Dyx7zln+Y=','戴广艳',NULL,2,NULL,2,'13923958293',1,1,NULL,'2022-03-22 13:05:14','2022-03-22 22:10:19','2022-03-22 13:05:14','\0',NULL),(7,'4bb8e991-5243-481e-8126-fa097d097be8','Packy','j0fp2Ck9gJfdF5JfagF9Plglvp0Nk2OySlsPolpW5aLThtmSHlZVtA2zlWnGCMkmv9bDWnIlmfjzlVuiksNHx7yZo0WFWG10pPZyp0IrLiLbRrl5WqyR1vsgbFQinEpL0Sb1BRVz4bamSEkD38Ye/23mhJ/JLtqOVMLl+BTu6cg=','陈峥',NULL,1,NULL,1,'18249357382',1,1,NULL,'2022-03-22 14:30:30','2022-03-22 22:10:13','2022-03-22 14:30:30','',NULL),(8,'f0db5d78-43b7-4759-8c19-76df01bc6684','ZhangF','NzjpUMRBJWy6FSm27bY0L8H9trBVbOLYS17TgrVf4XMwLELqJPi5bcc4YpRWfPnTwoq+E+kseC/yEK3yshV265bPlN403U+Qg4MnmD1P9SyvfpUnZXjcNWf14vZ0g4aLcJ0qwJksrNQf3yEmotOFcgrXxFp0918TkO3twNhK+bk=','张峰',31,1,NULL,NULL,'13829475821',3,1,NULL,'2022-03-22 17:40:55',NULL,'2022-03-22 17:40:55','\0',NULL),(9,'252a662c-27c2-4a6d-81a1-fc3a7e2d6216','zhangsan','UZKpmxTs24D1dKDf+LjnPLNUaXQt+x2lah64p4IULd6KN0UebY0NRJ19jCF8i/cfwByLwO+nnnWliKecIduqIKiZTuhZP1yWdlPSnECI9JTTALO6Skxr75Y1/m/7yWE+U3R3mKikcounEo7O2fmbtRY7zOcrQgbt24X+ZXUgE0A=','张三',23,1,'1999-03-03 00:00:00',2,'13028492043',1,1,NULL,'2022-03-23 15:21:24',NULL,'2022-03-23 15:21:24','\0',NULL),(10,'75d6dc61-cf16-4a26-b457-c6f0d50ff207','xixi','ip+6jSPNCAWI2aKQ7AzEE/0wy0xg1Ir9YGYZIDsKEl8RodTwIUiOG7f6hpAlAXHGXYdmRUvoaE9jV7WnzNlQTon+uYVy1Ic7+bTMu1ydHsWvnDYwS+Vq6ZODZlTmkUPH0LjnvN3I7oGVq/5UwyexgZZNH49JLVLOLSb6hOlJCXw=',NULL,NULL,NULL,NULL,2,NULL,1,1,NULL,'2022-03-23 15:30:00',NULL,'2022-03-23 15:30:00','\0',NULL),(11,'a3980388-0d2b-4c0d-98a8-4217bddc0891','zheng','krg7O38MnjJc7fbx/6XAZiUtepQQ5mlWiFSvQtRp599RPu8XnzQvb2WLVE2BPtwKyTRoznNC6ADdYvjcP/jaRekeSuAcq5cOspRNEjuvtWCOuPht3s5qs21zfIWGDsn3sbIlTrsTnGPOoWFrFEwO/xi9LMP0ZGcrlprB6Q5g1Ks=',NULL,NULL,NULL,NULL,1,NULL,1,1,NULL,'2022-03-23 15:31:54',NULL,'2022-03-23 15:31:54','\0',NULL),(12,'1e1aae09-a77d-43ef-a21b-e46206df3b3b','zhengzheng','FL97SGxqQ30E4he/B8lznWVIR2kJ9TuZoqUmoObbDT7qQacLf7TeLANVOg03f4Fn4faGfPBchUHAbSj90kkrs+DnZGfBwnVqJSG4gCn4+1D10Y6KWtCLOm/M14YIj9wn9XqMCtNWJ4iYgkS4Bl/HPB2ydTJ6EWqL37Fx/MWLamI=',NULL,NULL,NULL,NULL,1,NULL,1,1,NULL,'2022-03-23 15:34:30',NULL,'2022-03-23 15:34:30','\0',NULL);

/*Table structure for table `t_user_event_log` */

DROP TABLE IF EXISTS `t_user_event_log`;

CREATE TABLE `t_user_event_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_user_event_log` */

insert  into `t_user_event_log`(`id`,`user_id`,`user_name`,`real_name`,`content`,`create_time`) values (1,1,'admin','管理员','admin 登出了王东南互联网考试系统','2022-03-01 12:48:50'),(2,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-01 12:49:19'),(3,1,'admin','管理员','admin 登出了王东南互联网考试系统','2022-03-01 13:14:05'),(4,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-02 13:16:13'),(5,1,'admin','管理员','admin 登出了王东南互联网考试系统','2022-03-02 13:59:13'),(6,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-03 13:59:19'),(7,1,'admin','管理员','admin 登出了王东南互联网考试系统','2022-03-03 13:59:26'),(8,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-04 13:59:45'),(9,7,'Packy',NULL,'欢迎 Packy 注册来到王东南互联网考试系统','2022-03-05 14:30:30'),(10,7,'Packy',NULL,'Packy 登录了王东南互联网考试系统','2022-03-05 14:30:38'),(11,7,'Packy',NULL,'Packy 登出了王东南互联网考试系统','2022-03-05 14:30:43'),(12,3,'mengda','季猛达','mengda 登录了王东南互联网考试系统','2022-03-06 14:30:51'),(13,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-06 14:54:03'),(14,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-06 16:55:34'),(15,3,'mengda','季猛达','mengda 登录了王东南互联网考试系统','2022-03-06 17:44:34'),(16,3,'mengda','季猛达','mengda 登录了王东南互联网考试系统','2022-03-07 19:30:25'),(17,3,'mengda','季猛达','mengda 更新了个人资料','2022-03-08 20:22:05'),(18,3,'mengda','季猛达','mengda 更新了个人资料','2022-03-08 20:22:18'),(19,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-09 20:25:05'),(20,3,'mengda','季猛达','mengda 登录了王东南互联网考试系统','2022-03-10 20:29:18'),(21,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-10 20:38:56'),(22,1,'admin','管理员','admin 登出了王东南互联网考试系统','2022-03-10 20:39:30'),(23,8,'ZhangF','张峰','ZhangF 登录了王东南互联网考试系统','2022-03-10 20:39:36'),(24,3,'mengda','季猛达','mengda 登录了王东南互联网考试系统','2022-03-10 20:53:40'),(25,3,'mengda','季猛达','mengda 提交试卷：操作系统基础 得分：4 耗时：35 秒','2022-03-11 20:54:18'),(26,3,'mengda','季猛达','mengda 提交试卷：Java程序设计练习卷 得分：0 耗时：52 秒','2022-03-11 20:58:01'),(27,3,'mengda','季猛达','mengda 批改试卷：Java程序设计练习卷 得分：3','2022-03-11 20:58:19'),(28,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-12 21:22:17'),(29,1,'admin','管理员','admin 登出了王东南互联网考试系统','2022-03-12 21:24:36'),(30,6,'zero','戴广艳','zero 登录了王东南互联网考试系统','2022-03-13 21:24:45'),(31,6,'zero','戴广艳','zero 登出了王东南互联网考试系统','2022-03-15 21:25:00'),(32,4,'weicheng','谢伟成','weicheng 登录了王东南互联网考试系统','2022-03-15 21:25:09'),(33,4,'weicheng','谢伟成','weicheng 提交试卷：Spring练习卷1 得分：10 耗时：31 秒','2022-03-15 21:25:50'),(34,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-16 21:26:36'),(35,3,'mengda','季猛达','mengda 登录了王东南互联网考试系统','2022-03-17 21:34:13'),(36,3,'mengda','季猛达','mengda 登出了王东南互联网考试系统','2022-03-17 21:37:09'),(37,4,'weicheng','谢伟成','weicheng 登录了王东南互联网考试系统','2022-03-17 21:37:18'),(38,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-18 21:45:58'),(39,6,'zero','戴广艳','zero 登录了王东南互联网考试系统','2022-03-18 21:48:54'),(40,6,'zero','戴广艳','zero 登出了王东南互联网考试系统','2022-03-18 21:49:12'),(41,4,'weicheng','谢伟成','weicheng 登录了王东南互联网考试系统','2022-03-18 21:49:22'),(42,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-18 21:50:09'),(43,4,'weicheng','谢伟成','weicheng 登录了王东南互联网考试系统','2022-03-19 21:52:30'),(44,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-19 21:52:38'),(45,4,'weicheng','谢伟成','weicheng 登录了王东南互联网考试系统','2022-03-19 21:54:02'),(46,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-20 22:00:52'),(47,4,'weicheng','谢伟成','weicheng 登录了王东南互联网考试系统','2022-03-20 22:03:08'),(48,1,'admin','管理员','admin 登录了王东南互联网考试系统','2022-03-21 22:06:30'),(49,1,'admin','管理员','admin 登出了王东南互联网考试系统','2022-03-21 22:25:17'),(50,3,'mengda','季猛达','mengda 登录了王东南互联网考试系统','2022-03-21 22:29:01'),(51,3,'mengda','季猛达','mengda 登出了王东南互联网考试系统','2022-03-22 22:30:32'),(52,4,'weicheng','谢伟成','weicheng 登录了王东南互联网考试系统','2022-03-22 22:30:43'),(53,4,'weicheng','谢伟成','weicheng 提交试卷：Spring框架模拟卷 得分：0 耗时：36 秒','2022-03-22 22:31:40'),(54,4,'weicheng','谢伟成','weicheng 批改试卷：Spring框架模拟卷 得分：8','2022-03-22 22:33:17'),(55,1,'admin','李依玲','admin 登录了王东南互联网考试系统','2022-03-23 15:12:30'),(56,1,'admin','李依玲','admin 登出了王东南互联网考试系统','2022-03-23 15:18:08'),(57,1,'admin','李依玲','admin 登录了王东南互联网考试系统','2022-03-23 15:19:58'),(58,10,'xixi',NULL,'欢迎 xixi 注册来到王东南互联网考试系统','2022-03-23 15:30:00'),(59,3,'mengda','季猛达','mengda 登录了王东南互联网考试系统','2022-03-23 15:30:16'),(60,3,'mengda','季猛达','mengda 登出了王东南互联网考试系统','2022-03-23 15:30:22'),(61,11,'zheng',NULL,'欢迎 zheng 注册来到王东南互联网考试系统','2022-03-23 15:31:54'),(62,3,'mengda','季猛达','mengda 登录了王东南互联网考试系统','2022-03-23 15:32:00'),(63,3,'mengda','季猛达','mengda 登出了王东南互联网考试系统','2022-03-23 15:34:03'),(64,4,'weicheng','谢伟成','weicheng 登录了王东南互联网考试系统','2022-03-23 15:34:09'),(65,12,'zhengzheng',NULL,'欢迎 zhengzheng 注册来到王东南互联网考试系统','2022-03-23 15:34:30'),(66,4,'weicheng','谢伟成','weicheng 登录了王东南互联网考试系统','2022-03-23 15:34:36'),(67,4,'weicheng','谢伟成','weicheng 更新了个人资料','2022-03-23 15:34:58'),(68,4,'weicheng','谢伟成','weicheng 提交试卷：Java框架 得分：0 耗时：33 秒','2022-03-23 15:36:00'),(69,4,'weicheng','谢伟成','weicheng 批改试卷：Java框架 得分：4','2022-03-23 15:36:30');

/*Table structure for table `t_user_token` */

DROP TABLE IF EXISTS `t_user_token`;

CREATE TABLE `t_user_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

/*Data for the table `t_user_token` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;