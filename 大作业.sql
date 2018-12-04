/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.47 : Database - register
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`register` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `register`;

/*Table structure for table `student1set` */

DROP TABLE IF EXISTS `student1set`;

CREATE TABLE `student1set` (
  `teamid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  PRIMARY KEY (`teamid`,`studentid`),
  KEY `FK8C44772C3234FA0` (`studentid`),
  KEY `FK8C44772CB2C4D826` (`teamid`),
  CONSTRAINT `FK8C44772C3234FA0` FOREIGN KEY (`studentid`) REFERENCES `t_student` (`studentid`),
  CONSTRAINT `FK8C44772CB2C4D826` FOREIGN KEY (`teamid`) REFERENCES `t_team` (`teamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `student1set` */

insert  into `student1set`(`teamid`,`studentid`) values (1,1),(7,1),(1,2);

/*Table structure for table `studentset` */

DROP TABLE IF EXISTS `studentset`;

CREATE TABLE `studentset` (
  `itemid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  PRIMARY KEY (`itemid`,`studentid`),
  KEY `FKC27654273234FA0` (`studentid`),
  KEY `FKC2765427A0CFF412` (`itemid`),
  CONSTRAINT `FKC27654273234FA0` FOREIGN KEY (`studentid`) REFERENCES `t_student` (`studentid`),
  CONSTRAINT `FKC2765427A0CFF412` FOREIGN KEY (`itemid`) REFERENCES `t_item` (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `studentset` */

insert  into `studentset`(`itemid`,`studentid`) values (2,1),(5,1),(2,2),(5,2),(2,3),(5,3),(7,3),(2,4),(6,5);

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_admin` */

insert  into `t_admin`(`aid`,`name`,`password`) values (1,'zhangyan','123456');

/*Table structure for table `t_item` */

DROP TABLE IF EXISTS `t_item`;

CREATE TABLE `t_item` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `itemInfo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `iort` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_item` */

insert  into `t_item`(`iid`,`name`,`itemInfo`,`iort`) values (2,'Java','就是这么6','individual'),(3,'ddd','ddd','team'),(4,'d888','ttt','team'),(5,'222','2222','individual'),(6,'8888','5555','individual'),(7,'没有没有','这个项目非常好','individual');

/*Table structure for table `t_notice` */

DROP TABLE IF EXISTS `t_notice`;

CREATE TABLE `t_notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_notice` */

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `validateCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_student` */

insert  into `t_student`(`studentid`,`name`,`number`,`password`,`department`,`email`,`status`,`validateCode`,`registerTime`) values (1,'zhangyan','123456','123456','信息学院','123@126.com',1,'123','2017-05-06 17:31:58'),(2,'li','2014','123','粮食学院','1519512@qq.com',1,'996e2eda1346fac9b906c9e108299dd8','2017-05-15 19:08:21'),(3,'123','666','666','外语学院','123@163.com',1,'F:\\apache-tomcat-7.0.77\\webapps\\regist\\','2017-05-18 17:40:50'),(4,'123123','123123','123123','信息学院','151615',1,'123123123','2017-05-18 17:46:17'),(5,'test','1231312','123123','材料学院','561561@qq.com',1,'123123123123','2017-05-19 19:35:01'),(6,'1231231','12313','123456','信息学院','1519512@qq.com',0,'996e2eda1346fac9b906c9e108299dd8','2017-06-06 13:48:45'),(7,'1213','12313','123123','信息学院','156156',0,'3b48968b38dd72483388750cc511afe2','2017-06-06 15:47:42'),(8,'66666666666','66666666','666666666666','信息学院','151922@qq.com',0,'996e2eda1346fac9b906c9e108299dd8','2017-06-06 15:49:09'),(9,'33','333','333','信息学院','1519516322@qq.com',1,'996e2eda1346fac9b906c9e108299dd8','2017-06-09 10:21:04');

/*Table structure for table `t_team` */

DROP TABLE IF EXISTS `t_team`;

CREATE TABLE `t_team` (
  `teamid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `teacher` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  PRIMARY KEY (`teamid`),
  KEY `FKCB632348A0CFF412` (`itemid`),
  CONSTRAINT `FKCB632348A0CFF412` FOREIGN KEY (`itemid`) REFERENCES `t_item` (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_team` */

insert  into `t_team`(`teamid`,`name`,`password`,`teacher`,`itemid`) values (1,'云音乐','123','张岩',3),(2,'小狐狸','456','张岩',4),(3,'zhangyan','123456','123',4),(6,'zhang','123456','123132',4),(7,'C语言','123','汪汪汪',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
