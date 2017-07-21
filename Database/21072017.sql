/*
SQLyog Community v12.3.2 (64 bit)
MySQL - 5.5.33 : Database - pritienterprises
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `clients_address` */

DROP TABLE IF EXISTS `clients_address`;

CREATE TABLE `clients_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(500) DEFAULT NULL,
  `company_address` varchar(500) DEFAULT NULL,
  `company_gstin` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`company_gstin`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `clients_address` */

insert  into `clients_address`(`id`,`company_name`,`company_address`,`company_gstin`) values 
(1,'Nishant','nisahfdsjfn','GSDFT5556556'),
(2,'dfs','sg','sdfg'),
(5,'DDFs','adsfdsf','adsfdsaf');

/*Table structure for table `main_products` */

DROP TABLE IF EXISTS `main_products`;

CREATE TABLE `main_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `main_products` */

insert  into `main_products`(`id`,`product_name`) values 
(1,'PopUp'),
(2,'Tissue');

/*Table structure for table `sub_products` */

DROP TABLE IF EXISTS `sub_products`;

CREATE TABLE `sub_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(300) DEFAULT NULL,
  `product_shotform` varchar(200) DEFAULT NULL,
  `productcateforyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productcateforyid` (`productcateforyid`),
  CONSTRAINT `sub_products_ibfk_1` FOREIGN KEY (`productcateforyid`) REFERENCES `main_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `sub_products` */

insert  into `sub_products`(`id`,`product_name`,`product_shotform`,`productcateforyid`) values 
(1,'20X20','PU2020100',1),
(2,'40X40','TS',2),
(3,'60*20','PU6020110',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`user_name`,`password`) values 
(1,'PritiEnterprises','root');

/* Procedure structure for procedure `addCompanyAddress` */

/*!50003 DROP PROCEDURE IF EXISTS  `addCompanyAddress` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addCompanyAddress`(comp_name VARCHAR(500), comp_add VARCHAR(500),comp_gstin varchar(200))
BEGIN
		insert into clients_address(company_name,company_address,company_gstin) 
		values(comp_name,comp_add,comp_gstin);
		
		select LAST_INSERT_ID();
	END */$$
DELIMITER ;

/* Procedure structure for procedure `checkLogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `checkLogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `checkLogin`(username_in varchar(500), password_in varchar(200))
BEGIN

		select count(id) from users
		where `user_name`=username_in and `password`=password_in;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `getCompanyDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `getCompanyDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getCompanyDetails`(id_in int)
BEGIN
		SELECT `id`,`company_name`,`company_address`,`company_gstin`
		FROM `clients_address`
		where id=id_in;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getCompanyList` */

/*!50003 DROP PROCEDURE IF EXISTS  `getCompanyList` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getCompanyList`()
BEGIN
		select `id`,`company_name`,`company_address`,`company_gstin`
		from `clients_address`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getproducts` */

/*!50003 DROP PROCEDURE IF EXISTS  `getproducts` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getproducts`()
BEGIN
		SELECT mp.product_name,sp.product_name,sp.product_shotform FROM main_products mp join sub_products sp
		on sp.productcateforyid = mp.id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `updateCompanyDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateCompanyDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCompanyDetails`(id_in int,comp_name VARCHAR(500), comp_add VARCHAR(500),comp_gstin varchar(200))
BEGIN
		update `clients_address`
		set `company_name`= comp_name,
		`company_address`=comp_add,
		`company_gstin`=comp_gstin
		where id=id_in;
		
		select ROW_COUNT() ;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
