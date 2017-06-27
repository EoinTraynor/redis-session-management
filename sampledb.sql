/*
SQLyog Community v12.4.1 (64 bit)
MySQL - 5.7.18 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posts` varchar(256) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `posts` */

insert  into `posts`(`id`,`posts`,`user_id`) values 
(1,'Post 1',1),
(4,'Post 4',2),
(5,'Post 5',11);

/*Table structure for table `tweets` */

DROP TABLE IF EXISTS `tweets`;

CREATE TABLE `tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tweets` */

insert  into `tweets`(`id`,`text`) values 
(1,'my first tweet'),
(2,'my second tweet');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  `oauth_provider` varchar(255) DEFAULT NULL,
  `oauth_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`password`,`first_name`,`last_name`,`is_admin`,`oauth_provider`,`oauth_id`) values 
(1,'eoin@test.test','$2a$10$zBWOLDRgWEo8KEpYx34v..DqY7bCXTNjzTASd7CICRABNy32YmTtq','Eoin','T',1,NULL,NULL),
(2,'Joe@test.test','$2a$10$zBWOLDRgWEo8KEpYx34v..DqY7bCXTNjzTASd7CICRABNy32YmTtq','Joe','Wall',0,NULL,NULL),
(6,'john@test.test','$2a$10$3ilevA4S2TsEasAUcvXFhuLqCDQ2LrAFUi5Rmn4qUn88Pn4YnEaTC','john','john',NULL,NULL,NULL),
(7,'jj@test.test','$2a$10$5e2F3EXL/n7iThxIDgfJne1FfBPlfYF/x92gD0sICqFAZlF3y7fKK','jj','jj',NULL,NULL,NULL),
(8,'mick@test.test','$2a$10$ZoJYzPcQ9QUBnN3cGMSX4epMz5oN0te5mb5l4ON/LePTszv9c797K','mick','mick',NULL,NULL,NULL),
(11,NULL,NULL,NULL,NULL,NULL,'github','8976930');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
