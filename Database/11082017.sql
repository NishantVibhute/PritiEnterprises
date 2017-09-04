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
  `inserted_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`company_gstin`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `clients_address` */

insert  into `clients_address`(`id`,`company_name`,`company_address`,`company_gstin`,`inserted_date_time`) values 
(1,'Nishant','nisahfdsjfn','GSDFT5556556','0000-00-00 00:00:00'),
(2,'dfs','sg','sdfg','0000-00-00 00:00:00'),
(5,'DDFs','adsfdsf','adsfdsaf','0000-00-00 00:00:00'),
(6,'SagarAndBros.','Kalyan','GSTIN123465','0000-00-00 00:00:00'),
(7,'','','','2017-08-02 14:37:58');

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reverse_charge` varchar(10) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `transport_mode` varchar(250) DEFAULT NULL,
  `vehicle_no` varchar(100) DEFAULT NULL,
  `date_of_supply` date DEFAULT NULL,
  `place_of_supply` varchar(100) DEFAULT NULL,
  `bill_to_party` int(11) DEFAULT NULL,
  `ship_to_party` int(11) DEFAULT NULL,
  `total_amount_before_tax` double DEFAULT NULL,
  `cgst_perc` double DEFAULT NULL,
  `cgst_amount` double DEFAULT NULL,
  `sgst_perc` double DEFAULT NULL,
  `sgst_amount` double DEFAULT NULL,
  `igst_perc` double DEFAULT NULL,
  `igst_amount` double DEFAULT NULL,
  `total_amount_after_tax` double DEFAULT NULL,
  `round_off` double DEFAULT NULL,
  `bill_amount` int(11) DEFAULT NULL,
  `bill_amount_in_words` varchar(800) DEFAULT NULL,
  `inserted_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isPaymentDone` int(11) DEFAULT '0',
  `payment_mode` varchar(100) DEFAULT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `bank_name` varchar(500) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `invoice` */

insert  into `invoice`(`id`,`date`,`reverse_charge`,`state`,`code`,`transport_mode`,`vehicle_no`,`date_of_supply`,`place_of_supply`,`bill_to_party`,`ship_to_party`,`total_amount_before_tax`,`cgst_perc`,`cgst_amount`,`sgst_perc`,`sgst_amount`,`igst_perc`,`igst_amount`,`total_amount_after_tax`,`round_off`,`bill_amount`,`bill_amount_in_words`,`inserted_datetime`,`isPaymentDone`,`payment_mode`,`cheque_no`,`bank_name`,`cheque_date`,`payment_amount`) values 
(1,'2017-07-28','no','MAHARASHTRA',27,'truck','MH47B4565','2017-07-29','',1,6,300,9,27,9,27,9,27,381,0,381,'Three Hundred and Eighty One rupees only','0000-00-00 00:00:00',1,'cash',NULL,NULL,'2017-08-02',8745);

/*Table structure for table `invoice_details` */

DROP TABLE IF EXISTS `invoice_details`;

CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `cgst_perc` double DEFAULT NULL,
  `cgst_amount` double DEFAULT NULL,
  `sgst_perc` double DEFAULT NULL,
  `sgst_amount` double DEFAULT NULL,
  `igst_perc` double DEFAULT NULL,
  `igst_amount` double DEFAULT NULL,
  `totalAmountAfterTax` double DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `inserted_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `invoice_details_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `invoice_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `invoice_details` */

insert  into `invoice_details`(`id`,`product_id`,`qty`,`amount`,`total_amount`,`cgst_perc`,`cgst_amount`,`sgst_perc`,`sgst_amount`,`igst_perc`,`igst_amount`,`totalAmountAfterTax`,`invoice_id`,`inserted_datetime`) values 
(1,1,4,10,40,9,3.6,9,3.6,18,7.2,54.4,1,'0000-00-00 00:00:00'),
(2,2,5,40,200,9,18,9,18,18,36,272,1,'0000-00-00 00:00:00'),
(3,3,6,10,60,9,5.4,9,5.4,18,10.8,81.6,1,'0000-00-00 00:00:00');

/*Table structure for table `main_products` */

DROP TABLE IF EXISTS `main_products`;

CREATE TABLE `main_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `inserted_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `main_products` */

insert  into `main_products`(`id`,`product_name`,`inserted_datetime`) values 
(1,'PopUp','0000-00-00 00:00:00'),
(2,'Tissue','0000-00-00 00:00:00'),
(3,'tISSUE','0000-00-00 00:00:00'),
(4,'p1','0000-00-00 00:00:00'),
(5,'P3','0000-00-00 00:00:00'),
(6,'Test','0000-00-00 00:00:00'),
(7,'Roll','0000-00-00 00:00:00');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(300) NOT NULL,
  `product_shotform` varchar(200) NOT NULL,
  `product_main_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `inserted_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_main_id` (`product_main_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_main_id`) REFERENCES `main_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`id`,`product_name`,`product_shotform`,`product_main_id`,`qty`,`inserted_datetime`) values 
(1,'Test1','Test1',6,-2,'0000-00-00 00:00:00'),
(2,'Test2','Test2',6,2,'0000-00-00 00:00:00'),
(3,'Test3','Test3',6,-5,'0000-00-00 00:00:00'),
(4,'R1','R1',7,10,'0000-00-00 00:00:00'),
(5,'R2','R2',7,0,'0000-00-00 00:00:00');

/*Table structure for table `purchase` */

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_date` varchar(300) DEFAULT NULL,
  `invoice_num` varchar(200) DEFAULT NULL,
  `totalamount` double DEFAULT NULL,
  `cgst_perc` double DEFAULT NULL,
  `cgst_amount` double DEFAULT NULL,
  `sgst_perc` double DEFAULT NULL,
  `sgst_amount` double DEFAULT NULL,
  `igst_perc` double DEFAULT NULL,
  `igst_amount` double DEFAULT NULL,
  `totalAmountAfterTax` double DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `inserted_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isPaymentDone` int(11) NOT NULL DEFAULT '0',
  `payment_mode` varchar(100) DEFAULT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `bank_name` varchar(500) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `purchase` */

insert  into `purchase`(`id`,`invoice_date`,`invoice_num`,`totalamount`,`cgst_perc`,`cgst_amount`,`sgst_perc`,`sgst_amount`,`igst_perc`,`igst_amount`,`totalAmountAfterTax`,`client_id`,`inserted_datetime`,`isPaymentDone`,`payment_mode`,`cheque_no`,`bank_name`,`cheque_date`,`payment_amount`) values 
(1,'2017-07-27','0',100,9,45,8,21,6,12,2121,1,'0000-00-00 00:00:00',0,NULL,NULL,NULL,NULL,NULL),
(2,'2017-07-27','0',100,9,45,8,21,6,12,2121,1,'0000-00-00 00:00:00',0,NULL,NULL,NULL,NULL,NULL),
(3,'2017-07-28','4',10000,9,1212,9,1454,18,545,8795456,6,'0000-00-00 00:00:00',1,'cash',NULL,NULL,'2017-08-02',784),
(4,'2017-07-28','8',10000,9,900,9,900,0,0,11800,6,'0000-00-00 00:00:00',1,'cheque','1255455','Mumbai','2017-08-08',1520),
(5,'2017-07-28','4',1000,9,90,9,90,18,180,1360,6,'0000-00-00 00:00:00',1,'cash',NULL,NULL,'2017-08-02',784),
(6,'2017-07-28','4',1000,9,90,9,90,18,180,1360,6,'0000-00-00 00:00:00',1,'cash',NULL,NULL,'2017-08-02',784),
(7,'2017-07-28','7',1000,9,90,9,90,18,180,1360,5,'0000-00-00 00:00:00',1,'cash','','','2017-08-04',1360);

/*Table structure for table `purchase_details` */

DROP TABLE IF EXISTS `purchase_details`;

CREATE TABLE `purchase_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `cgst_perc` double DEFAULT NULL,
  `cgst_amount` double DEFAULT NULL,
  `sgst_perc` double DEFAULT NULL,
  `sgst_amount` double DEFAULT NULL,
  `igst_perc` double DEFAULT NULL,
  `igst_amount` double DEFAULT NULL,
  `totalAmountAfterTax` double DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `inserted_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `purchase_details_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`),
  CONSTRAINT `purchase_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `purchase_details` */

insert  into `purchase_details`(`id`,`product_id`,`qty`,`amount`,`total_amount`,`cgst_perc`,`cgst_amount`,`sgst_perc`,`sgst_amount`,`igst_perc`,`igst_amount`,`totalAmountAfterTax`,`purchase_id`,`inserted_datetime`) values 
(1,3,1,10,10,9,0.9,9,0.9,18,1.8,13.6,6,'0000-00-00 00:00:00'),
(2,2,2,5,10,9,0.9,9,0.9,18,1.8,13.6,6,'0000-00-00 00:00:00'),
(3,2,5,5,25,9,2.25,9,2.25,18,4.5,34,7,'0000-00-00 00:00:00');

/*Table structure for table `state` */

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `id` int(11) DEFAULT NULL,
  `state_name` varchar(200) DEFAULT NULL,
  `state_tin` int(11) DEFAULT NULL,
  `state_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `state` */

insert  into `state`(`id`,`state_name`,`state_tin`,`state_code`) values 
(1,'AndamanandNicobarIslands',35,'AN\r'),
(2,'AndhraPradesh',28,'AP\r'),
(3,'AndhraPradesh(New)',37,'AD\r'),
(4,'ArunachalPradesh',12,'AR\r'),
(5,'Assam',18,'AS\r'),
(6,'Bihar',10,'BH\r'),
(7,'Chandigarh',4,'CH\r'),
(8,'Chattisgarh',22,'CT\r'),
(9,'DadraandNagarHaveli',26,'DN\r'),
(10,'DamanandDiu',25,'DD\r'),
(11,'Delhi',7,'DL\r'),
(12,'Goa',30,'GA\r'),
(13,'Gujarat',24,'GJ\r'),
(14,'Haryana',6,'HR\r'),
(15,'HimachalPradesh',2,'HP\r'),
(16,'JammuandKashmir',1,'JK\r'),
(17,'Jharkhand',20,'JH\r'),
(18,'Karnataka',29,'KA\r'),
(19,'Kerala',32,'KL\r'),
(20,'LakshadweepIslands',31,'LD\r'),
(21,'MadhyaPradesh',23,'MP\r'),
(22,'Maharashtra',27,'MH\r'),
(23,'Manipur',14,'MN\r'),
(24,'Meghalaya',17,'ME\r'),
(25,'Mizoram',15,'MI\r'),
(26,'Nagaland',13,'NL\r'),
(27,'Odisha',21,'OR\r'),
(28,'Pondicherry',34,'PY\r'),
(29,'Punjab',3,'PB\r'),
(30,'Rajasthan',8,'RJ\r'),
(31,'Sikkim',11,'SK\r'),
(32,'TamilNadu',33,'TN\r'),
(33,'Telangana',36,'TS\r'),
(34,'Tripura',16,'TR\r'),
(35,'UttarPradesh',9,'UP\r'),
(36,'Uttarakhand',5,'UT\r'),
(37,'WestBengal',19,'WB\r');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `inserted_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`user_name`,`password`,`inserted_datetime`) values 
(1,'PritiEnterprises','root','0000-00-00 00:00:00');

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

/* Procedure structure for procedure `addProduct` */

/*!50003 DROP PROCEDURE IF EXISTS  `addProduct` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addProduct`(product_id_in int,qty_in int)
BEGIN
		
DECLARE totalQty INT;
		
		SELECT (qty+qty_in) into totalQty FROM `products` WHERE `id`=product_id_in;
		
		
update `products`
set qty= totalQty
WHERE `id`=product_id_in;		
		
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

/* Procedure structure for procedure `deleteProduct` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteProduct` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteProduct`(product_id_in INT,qty_in INT)
BEGIN
		
DECLARE totalQty INT;
		
		SELECT (qty-qty_in) INTO totalQty FROM `products` WHERE `id`=product_id_in;
		
		
UPDATE `products`
SET qty= totalQty
WHERE `id`=product_id_in;		
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getAllProducts` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAllProducts` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllProducts`()
BEGIN
		SELECT `id`,`product_name`,`product_shotform`,`product_main_id`
		FROM `products`;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getAllSubProducts` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAllSubProducts` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllSubProducts`()
BEGIN
		SELECT `id`,`product_name`,`product_shotform`,`product_main_id`
		FROM `sub_products`;
		
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

/* Procedure structure for procedure `getInvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `getInvoice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getInvoice`(id_in int)
BEGIN
		select `id`,
		`date`,
		`reverse_charge`,
		`state`,
		`code`,
		`transport_mode`,
		`vehicle_no`,
		`date_of_supply`,
		`place_of_supply`,`bill_to_party`,`ship_to_party`,
		`total_amount_before_tax`,
		`cgst_perc`,`cgst_amount`,
		`sgst_perc`,`sgst_amount`,
		`igst_perc`,`igst_amount`,
		`total_amount_after_tax`,
		`round_off`,
		`bill_amount`,
		`bill_amount_in_words`
		from `invoice`
		where `id` = id_in;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getInvoiceDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `getInvoiceDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getInvoiceDetails`(id_in int)
BEGIN
		select p.`product_name`,
		i.`qty`,
		i.`amount`,
		i.`total_amount`,
		i.`cgst_perc`,
		i.`cgst_amount`,
		i.`sgst_perc`,
		i.`sgst_amount`,
		i.`igst_perc`,
		i.`igst_amount`,
		i.`totalAmountAfterTax`
		
		from `invoice_details` i join `products` p 
		on p.id=i.`product_id`
		where i.`invoice_id` = id_in;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getInvoiceList` */

/*!50003 DROP PROCEDURE IF EXISTS  `getInvoiceList` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getInvoiceList`()
BEGIN
				select p.id,p.date,bill_amount,cs.`company_name`
		from `invoice` p join `clients_address` cs 
		on p.bill_to_party = cs.id
		
		order by p.Date desc;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getPendingInvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `getPendingInvoice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getPendingInvoice`()
BEGIN
				select p.id,p.date,bill_amount,cs.`company_name`
		from `invoice` p join `clients_address` cs 
		on p.bill_to_party = cs.id
		where isPaymentDone=0
		order by p.Date desc;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getPendingPurchase` */

/*!50003 DROP PROCEDURE IF EXISTS  `getPendingPurchase` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getPendingPurchase`()
BEGIN
		select invoice_num,invoice_date,`totalAmountAfterTax`,cs.`company_name`
		from purchase p join `clients_address` cs 
		on p.client_id = cs.id
		where isPaymentDone=0
		order by invoice_Date desc;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `insertInvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertInvoice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInvoice`(
	invoice_date_in DATE,
	reverse_charge_in varchar(10),
	state_in varchar(100),
	code_in int,
	transport_mode_in varchar(250),
	vehicle_no_in varchar(100),
	date_of_supply_in date,
	place_of_supply_in varchar(100),
	bill_to_party_in int,
	ship_to_party_in int,
	total_amount_before_tax_in double,
	cgst_perc_in double,
	cgst_amount_in double,
	sgst_perc_in DOUBLE,
	sgst_amount_in DOUBLE,
	igst_perc_in DOUBLE,
	igst_amount_in DOUBLE,
	total_amount_after_tax_in double,
	rounnd_off_in double,
	bill_amount_in int, 
	bill_amount_in_words_in varchar(800))
BEGIN
		INSERT INTO `invoice`(
			`date`,
			`reverse_charge`,
			`state`,
			`code`,
			`transport_mode`,
			`vehicle_no`,
			`date_of_supply`,
			`place_of_supply`,
			`bill_to_party`,
			`ship_to_party`,
			`total_amount_before_tax`,
			`cgst_perc`,
			`cgst_amount`,
			`sgst_perc`,
			`sgst_amount`,
			`igst_perc`,
			`igst_amount`,
			`total_amount_after_tax`,
			`round_off`,
			`bill_amount`,
			`bill_amount_in_words`)
		VALUES (invoice_date_in ,reverse_charge_in ,state_in , code_in ,
transport_mode_in ,vehicle_no_in ,date_of_supply_in ,place_of_supply_in,bill_to_party_in ,ship_to_party_in ,total_amount_before_tax_in ,
cgst_perc_in ,cgst_amount_in ,sgst_perc_in ,sgst_amount_in ,igst_perc_in ,igst_amount_in ,total_amount_after_tax_in ,
rounnd_off_in ,bill_amount_in , bill_amount_in_words_in );
		
		SELECT LAST_INSERT_ID();
	END */$$
DELIMITER ;

/* Procedure structure for procedure `insertInvoiceDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertInvoiceDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInvoiceDetails`(product_id_in INT,qty DOUBLE,amount_in DOUBLE,total_amount_in DOUBLE,
		cgst_perc_in DOUBLE ,cgst_amt_in DOUBLE,sgst_perc_in DOUBLE,sgst_amt_in DOUBLE,igst_perc_in DOUBLE,igst_amt_in DOUBLE,
		total_amount_after_tax_in DOUBLE,invoice_id_in INT)
BEGIN
		INSERT INTO `invoice_details`(`product_id`,`qty`,`amount`,`total_amount`,`cgst_perc`,
		`cgst_amount`,`sgst_perc`,`sgst_amount`,`igst_perc`,`igst_amount`,`totalAmountAfterTax`,`invoice_id`)
		VALUES(product_id_in ,qty ,amount_in,total_amount_in ,
		cgst_perc_in  ,cgst_amt_in ,sgst_perc_in ,sgst_amt_in ,igst_perc_in ,igst_amt_in ,
		total_amount_after_tax_in ,invoice_id_in );
		
		SELECT LAST_INSERT_ID();
	END */$$
DELIMITER ;

/* Procedure structure for procedure `insertMainProduct` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertMainProduct` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertMainProduct`(productName varchar(500))
BEGIN
		insert into `main_products`(`product_name`)
		values(productName);
		
		select LAST_INSERT_ID();
	END */$$
DELIMITER ;

/* Procedure structure for procedure `insertPurchase` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertPurchase` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPurchase`(invoice_date_in date,invoice_num_in int,
		total_amount_in double,cgst_perc_in double ,cgst_amt_in double,sgst_perc_in DOUBLE,sgst_amt_in double,igst_perc_in double,igst_amt_in DOUBLE,
		total_amount_after_tax_in double,client_id_in int)
BEGIN
		INSERT INTO `purchase`(`invoice_date`,`invoice_num`,`totalamount`,`cgst_perc`,`cgst_amount`,`sgst_perc`,`sgst_amount`,`igst_perc`,`igst_amount`,`totalAmountAfterTax`,`client_id`)
		VALUES(invoice_date_in,invoice_num_in,total_amount_in,cgst_perc_in ,cgst_amt_in ,sgst_perc_in ,sgst_amt_in ,igst_perc_in ,igst_amt_in ,total_amount_after_tax_in,client_id_in);
		
		select LAST_INsert_id();
	END */$$
DELIMITER ;

/* Procedure structure for procedure `insertPurchaseDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertPurchaseDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPurchaseDetails`(product_id_in int,qty double,amount_in double,total_amount_in DOUBLE,
		cgst_perc_in DOUBLE ,cgst_amt_in DOUBLE,sgst_perc_in DOUBLE,sgst_amt_in DOUBLE,igst_perc_in DOUBLE,igst_amt_in DOUBLE,
		total_amount_after_tax_in DOUBLE,purchase_id_in INT)
BEGIN
		INSERT INTO `purchase_details`(`product_id`,`qty`,`amount`,`total_amount`,`cgst_perc`,`cgst_amount`,`sgst_perc`,`sgst_amount`,`igst_perc`,`igst_amount`,`totalAmountAfterTax`,`purchase_id`)
		VALUES(product_id_in ,qty ,amount_in,total_amount_in ,
		cgst_perc_in  ,cgst_amt_in ,sgst_perc_in ,sgst_amt_in ,igst_perc_in ,igst_amt_in ,
		total_amount_after_tax_in ,purchase_id_in );
		
		SELECT LAST_INSERT_ID();
	END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSubProduct` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSubProduct` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSubProduct`(subProductName varchar(500),subProductCode varchar(500),mainProductId int)
BEGIN
		insert into `products`(`product_name`,`product_shotform`,`product_main_id`)
		values(subProductName,subProductCode,mainProductId);
		
		
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

/* Procedure structure for procedure `updatePaymentInvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatePaymentInvoice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePaymentInvoice`(id_in INT,date_in DATE,pay_date_in DATE, pay_mode_in VARCHAR(10),
		chq_no_in VARCHAR(200),bank_name_in VARCHAR(500),pay_amount_in DOUBLE)
BEGIN
		UPDATE `invoice`
		SET `isPaymentDone`=1,
		`payment_mode`=pay_mode_in,
		`cheque_no`=chq_no_in,
		`bank_name`=bank_name_in,
		`cheque_date`=pay_date_in,
		`payment_amount`=pay_amount_in
		WHERE `id`=id_in AND `date` = date_in;
		
		SELECT ROW_COUNT() ;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `updatePaymentPurchase` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatePaymentPurchase` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePaymentPurchase`(invoice_num_in int,invoice_date_in date,pay_date_in date, pay_mode_in varchar(10),
		chq_no_in varchar(200),bank_name_in varchar(500),pay_amount_in double)
BEGIN
		update `purchase`
		set `isPaymentDone`=1,
		`payment_mode`=pay_mode_in,
		`cheque_no`=chq_no_in,
		`bank_name`=bank_name_in,
		`cheque_date`=pay_date_in,
		`payment_amount`=pay_amount_in
		where `invoice_num`=invoice_num_in and `invoice_date` = invoice_date_in;
		
		select ROW_COUNT() ;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
