/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.25 : Database - me
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`me` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `me`;

/*Table structure for table `audit` */

DROP TABLE IF EXISTS `audit`;

CREATE TABLE `audit` (
  `auditId` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核Id',
  `auditName` varchar(50) NOT NULL COMMENT '审核名称',
  PRIMARY KEY (`auditId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `audit` */

insert  into `audit`(`auditId`,`auditName`) values (1,'已审核'),(2,'未审核');

/*Table structure for table `bills` */

DROP TABLE IF EXISTS `bills`;

CREATE TABLE `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `number` varchar(50) DEFAULT NULL COMMENT '单据号',
  `typeId` int(11) DEFAULT NULL COMMENT '单据类型 进货i退货',
  `danTime` varchar(50) DEFAULT NULL COMMENT '开单日期',
  `StoreId` int(11) DEFAULT NULL COMMENT '仓库外键表',
  `YingF` double DEFAULT NULL COMMENT '应付金额',
  `ShiF` double DEFAULT NULL COMMENT '实付金额',
  `ManagerId` int(11) DEFAULT NULL COMMENT '经办人',
  `czy` int(11) DEFAULT NULL COMMENT '操作员',
  `auditId` int(11) DEFAULT NULL COMMENT '审核Id  1审核  2未审核',
  `remake` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

/*Data for the table `bills` */

insert  into `bills`(`id`,`number`,`typeId`,`danTime`,`StoreId`,`YingF`,`ShiF`,`ManagerId`,`czy`,`auditId`,`remake`) values (164,'DJ518202006242028',1,'2020-6-24',27,49,49,0,0,1,''),(165,'DJ380202006242028',1,'2020-6-24',2,4750,4750,0,0,1,''),(166,'DJ608202006270850',1,'2020-6-27',1,120,120,0,0,1,''),(167,'DJ502202009252223',1,'2020-9-25',1,270,270,0,0,1,''),(168,'DJ178202009252225',1,'2020-9-25',3,30574,30574,0,0,1,''),(169,'DJ125202009252229',1,'2020-9-25',3,21816,21816,0,0,2,'');

/*Table structure for table `billstype` */

DROP TABLE IF EXISTS `billstype`;

CREATE TABLE `billstype` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型Id',
  `typeName` varchar(50) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `billstype` */

insert  into `billstype`(`typeId`,`typeName`) values (1,'进货'),(2,'退货');

/*Table structure for table `buyer` */

DROP TABLE IF EXISTS `buyer`;

CREATE TABLE `buyer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识Id',
  `buId` varchar(50) DEFAULT NULL COMMENT '编号',
  `buName` varchar(50) NOT NULL COMMENT '商品名称',
  `danWei` varchar(50) NOT NULL COMMENT '单位',
  `price` float NOT NULL COMMENT '进价',
  `nums` int(11) NOT NULL COMMENT '数量',
  `Money` float NOT NULL COMMENT '总金额',
  `supplierId` int(11) NOT NULL COMMENT '供货商Id',
  `yileld` varchar(50) NOT NULL COMMENT '生产日期',
  `pledge` varchar(50) NOT NULL COMMENT '保质期',
  `expiration` varchar(50) NOT NULL COMMENT '到期日期',
  `typeId` int(11) NOT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `buyer` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CName` varchar(50) NOT NULL COMMENT '名称',
  `phone` varchar(50) NOT NULL COMMENT '联系方式',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `jifen` int(11) DEFAULT NULL COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`id`,`CName`,`phone`,`address`,`jifen`) values (1,'王铮','13283105002','1222',66),(2,'李磊','15555555555','123456',5),(3,'李飞飞','13283105002','6666',39),(4,'李娜','13228354444','sss',34),(5,'小王','13283105002','123456',36);

/*Table structure for table `details` */

DROP TABLE IF EXISTS `details`;

CREATE TABLE `details` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `number` varchar(50) NOT NULL COMMENT '单据号',
  `buId` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `buName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `danWei` varchar(50) DEFAULT NULL COMMENT '单位',
  `price` float DEFAULT NULL COMMENT '进价',
  `nums` int(11) DEFAULT NULL COMMENT '数量',
  `Money` float DEFAULT NULL COMMENT '总金额',
  `supplierId` int(11) DEFAULT NULL COMMENT '供货商Id',
  `yileld` varchar(50) DEFAULT NULL COMMENT '生产日期',
  `pledge` varchar(50) DEFAULT NULL COMMENT '保质期',
  `expiration` varchar(50) DEFAULT NULL COMMENT '到期日期',
  `typeId` int(11) DEFAULT NULL COMMENT '类型Id',
  `storeId` int(11) DEFAULT NULL COMMENT '仓库Id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

/*Data for the table `details` */

insert  into `details`(`Id`,`number`,`buId`,`buName`,`danWei`,`price`,`nums`,`Money`,`supplierId`,`yileld`,`pledge`,`expiration`,`typeId`,`storeId`) values (168,'DJ518202006242028','1110','白菜','7',7,7,49,26,'2014-06-06','7','2020-06-30',9,1),(169,'DJ380202006242028','1111','电脑外星人','8',500,5,2500,26,'2020-06-29','8','2020-06-11',5,1),(170,'DJ380202006242028','1112','华硕电脑','7',15,150,2250,3,'2018-06-22','7','2020-06-26',5,1),(171,'DJ608202006270850','1113','橘子','8',8,15,120,26,'2020-06-02','8','2020-07-03',2,1),(172,'DJ502202009252223','1114','橘子','5',6,45,270,28,'2020-09-29','8','2020-09-24',2,1),(173,'DJ178202009252225','1115','5棵树','5',55,555,30525,28,'2020-09-30','4','2020-09-30',4,1),(174,'DJ178202009252225','1116','白菜','8',7,7,49,26,'2020-10-07','8','2020-09-24',2,1),(175,'DJ125202009252229','1117','小白酒','5',4,5454,21816,26,'2020-09-29','5','2020-10-03',5,1);

/*Table structure for table `gshop` */

DROP TABLE IF EXISTS `gshop`;

CREATE TABLE `gshop` (
  `gShopId` int(50) DEFAULT NULL COMMENT '商品编号',
  `gShopName` varchar(50) NOT NULL COMMENT '商品名称',
  `danWei` varchar(50) NOT NULL COMMENT '单位',
  `Price` float NOT NULL COMMENT '单价',
  `supplierId` int(11) NOT NULL COMMENT '供货商id外键',
  `typeId` int(11) NOT NULL COMMENT '商品类型Id',
  `yileld` varchar(50) NOT NULL COMMENT '生产日期',
  `pledge` varchar(50) NOT NULL COMMENT '保质期',
  `expiration` varchar(50) NOT NULL COMMENT '到期日期',
  `remake` varchar(100) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gshop` */

insert  into `gshop`(`gShopId`,`gShopName`,`danWei`,`Price`,`supplierId`,`typeId`,`yileld`,`pledge`,`expiration`,`remake`) values (1001,'方便面米','箱',50,1,3,'2018-11-00','14个月','2020-01-00','55555'),(1002,'干锅','箱',60,1,3,'2018-12-00','13个月','2020-01-00','55555'),(1004,'奶茶','箱',90,1,3,'2018-11-00','14个月','2020-01-00','55555'),(1005,'瓜子','箱',150,1,3,'2018-11-00','14个月','2020-01-00','55555'),(1006,'雪碧','箱',250,2,2,'2018-11-00','14个月','2020-01-00','66666'),(1007,'可乐','箱',250,2,2,'2018-11-00','14个月','2020-01-00','66666'),(1008,'芬达','箱',250,2,2,'2018-11-00','14个月','2020-01-00','66666'),(1009,'和其正','箱',250,2,2,'2018-11-00','14个月','2020-01-00','66666'),(1010,'果粒橙','箱',250,2,2,'2018-11-00','14个月','2020-01-00','66666'),(1011,'扫帚','个',20,3,5,'2018-11-00','14个月','2020-01-00','88888'),(1012,'拖把','个',50,3,5,'2018-11-00','14个月','2020-01-00','88888'),(1013,'垃圾桶','个',25,3,5,'2018-11-00','14个月','2020-01-00','88888'),(1014,'抹布','个',10,3,5,'2018-11-00','14个月','2020-01-00','88888'),(1015,'手套','双',15,3,5,'2018-11-00','14个月','2020-01-00','88888'),(1016,'玉玺香烟','包',22,2,1,'2018-11-00','14个月','2020-01-00','88888'),(1017,'二锅头','瓶',15,2,1,'2018-11-00','14个月','2020-01-00','88888'),(1018,'黄鹤楼香烟','包',25,2,1,'2018-11-00','14个月','2020-01-00','88888'),(1019,'龙江家园','瓶',25,2,1,'2018-11-00','14个月','2020-01-00','88888'),(1020,'牛兰春','瓶',15,2,1,'2018-11-00','14个月','2020-01-00','88888'),(1021,'草莓','盘',20,1,4,'2018-11-00','2个月','2019-01-00','88888'),(1022,'榴莲','盘',20,1,4,'2018-11-00','2个月','2019-01-00','88888'),(1023,'水蜜桃','盘',25,1,4,'2018-11-00','2个月','2019-01-00','88888'),(1024,'苹果','盘',30,1,4,'2018-11-00','2个月','2019-01-00','88888'),(1025,'香蕉','盘',15,1,4,'2018-11-00','2个月','2019-01-00','88888'),(1026,'拉丝面包','个',5,1,3,'2019-01-10','1','2019-01-10',NULL),(1027,'牛华','瓶',50,1,1,'2019-01-10','24个月','2020-01-22',NULL),(1028,'无敌','个',50,1,4,'2019-01-10','1','2019-01-10',NULL),(1029,'','8',8,1,1,'0008-01-01','8','0008-01-01',NULL),(1030,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1031,'','6',6,1,1,'2020-06-24','6','2020-07-01',NULL),(1032,'','8',8,1,1,'0008-01-01','8','0008-01-01',NULL),(1033,'','8',8,2,1,'0008-01-01','8','0008-01-01',NULL),(1034,'8','6',6,2,1,'0006-01-01','6','0006-01-01',NULL),(1035,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1036,'7','7',7,1,1,'2014-08-08','1','2015-08-08',NULL),(1037,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1038,'','9',9,1,1,'0009-01-01','9','0009-01-01',NULL),(1039,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1040,'','8',8,1,1,'0008-01-01','8','0008-01-01',NULL),(1041,'','7878',7878,1,1,'1978-01-01','78','1978-01-01',NULL),(1042,'','789',9,1,1,'0009-01-01','9','0009-01-01',NULL),(1043,'','7',7,1,1,'2014-09-09','8','2016-09-09',NULL),(1044,'','4',4,1,1,'2015-09-09','5','2014-09-09',NULL),(1045,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1046,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1047,'','666',66,1,1,'2066-01-01','66','2066-01-01',NULL),(1048,'','77',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1049,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1050,'','7',7,1,1,'0007-01-01','7','1977-01-01',NULL),(1051,'','78',78,1,1,'1978-01-01','78','1978-01-01',NULL),(1052,'','8',8,2,1,'0008-01-01','8','0008-01-01',NULL),(1053,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1054,'','8',8,1,1,'0008-01-01','8','0008-01-01',NULL),(1055,'','9',9,2,3,'0009-01-01','9','0009-01-01',NULL),(1056,'','88',8,1,1,'2020-06-14','8','2020-06-27',NULL),(1057,'','8',55,2,5,'2020-06-16','8','2020-06-19',NULL),(1058,'','88',8,2,3,'2020-06-16','7','2020-06-16',NULL),(1059,'','8',50,1,1,'0008-01-01','8','0008-01-01',NULL),(1060,'','7',7,21,5,'2020-06-10','7','2020-06-11',NULL),(1061,'','7',8,21,4,'2020-06-01','8','2020-06-17',NULL),(1062,'','7',7,2,3,'2020-06-08','8年','2020-06-25',NULL),(1063,'','6',6,1,1,'0006-01-01','6','0006-01-01',NULL),(1064,'','6',6,1,1,'0006-01-01','6','0006-01-01',NULL),(1065,'','6',6,1,1,'0006-01-01','6','0006-01-01',NULL),(1066,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1067,'','8',8,1,10,'2020-06-03','8','2020-06-09',NULL),(1068,'','1',2,1,1,'2012-01-01','12','2012-01-01',NULL),(1069,'','4',4,1,0,'0004-01-01','4','0004-01-01',NULL),(1070,'','6',6,1,2,'0006-01-01','6','0006-01-01',NULL),(1071,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1072,'','7',7,1,2,'0007-01-01','7','0007-01-01',NULL),(1073,'','7',7,1,3,'0008-01-01','8','0008-01-01',NULL),(1074,'','7',7,1,0,'0007-01-01','7','0007-01-01',NULL),(1075,'','8',8,1,0,'0008-01-01','8','0008-01-01',NULL),(1076,'7','7',7,2,1,'0007-01-01','7','0007-01-01',NULL),(1077,'7','8',8,1,0,'0008-01-01','8','1988-01-01',NULL),(1078,'','8',8,1,3,'0008-01-01','8','0008-01-01',NULL),(1079,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1080,'','8',8,1,3,'0008-01-01','8','0008-01-01',NULL),(1081,'','8',8,2,1,'0008-01-01','8','0008-01-01',NULL),(1082,'','7',7,2,2,'0007-01-01','7','0007-01-01',NULL),(1083,'','78',7,3,4,'0007-01-01','7','0007-01-01',NULL),(1084,'','7',7,1,0,'0007-01-01','7','0007-01-01',NULL),(1085,'','4',4,1,1,'0004-01-01','4','0004-01-01',NULL),(1086,'','4',44,1,2,'0004-01-01','4','0004-01-01',NULL),(1087,'','7',7,1,1,'0007-01-01','7','0007-01-01',NULL),(1088,'','1',21,22,109,'2020-06-18','8','2020-06-24',NULL),(1089,'','7',7,22,4,'2020-06-01','2','2020-06-24',NULL),(1090,'','4',500,22,109,'2020-06-18','8年','2020-07-02',NULL),(1091,'','8',8,2,3,'2020-06-03','7','2020-06-16',NULL),(1092,'','15',300,1,2,'0007-01-01','7','0007-01-01',NULL),(1093,'','5',5,23,112,'2020-06-17','8','2020-06-27',NULL),(1094,'','8',500,23,112,'2020-06-30','7','2020-06-27',NULL),(1095,'','8',8,2,4,'2020-06-23','8','2020-06-25',NULL),(1096,'','8',8,2,2,'0008-01-01','8','0008-01-01',NULL),(1097,'','8',8,3,5,'0008-01-01','8','0008-01-01',NULL),(1098,'','4',4,1,5,'0005-01-01','5','0005-01-01',NULL),(1099,'','7',70,23,0,'0005-01-01','5','0005-01-01',NULL),(1100,'','7',200,23,5,'0004-01-01','4','0004-01-01',NULL),(1101,'','4',555,23,5,'2018-09-09','4','2019-09-09',NULL),(1102,'','45',100,23,5,'2020-07-01','7','2020-06-26',NULL),(1103,'','10',100,23,4,'2020-07-23','4','2020-06-11',NULL),(1104,'','8',8,3,2,'0008-01-01','8','0008-01-01',NULL),(1105,'','4',4,23,3,'0007-01-01','7','0007-01-01',NULL),(1106,'','6',6,23,2,'0004-01-01','4','0004-01-01',NULL),(1107,'','8',10,26,9,'2020-05-03','8','2020-06-27',NULL),(1108,'','8',50,26,9,'2020-05-17','8','2020-07-15',NULL),(1109,'','8',14,3,2,'2020-05-27','7','2020-07-31',NULL),(1110,'','7',7,26,9,'2014-06-06','7','2020-06-30',NULL),(1111,'','8',500,26,5,'2020-06-29','8','2020-06-11',NULL),(1112,'','7',15,3,5,'2018-06-22','7','2020-06-26',NULL),(1113,'','8',8,26,2,'2020-06-02','8','2020-07-03',NULL),(1114,'','5',6,28,2,'2020-09-29','8','2020-09-24',NULL),(1115,'','5',55,28,4,'2020-09-30','4','2020-09-30',NULL),(1116,'','8',7,26,2,'2020-10-07','8','2020-09-24',NULL),(1117,'','5',4,26,5,'2020-09-29','5','2020-10-03',NULL);

/*Table structure for table `kct` */

DROP TABLE IF EXISTS `kct`;

CREATE TABLE `kct` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `KCId` int(11) NOT NULL COMMENT '商品编号',
  `sName` varchar(50) NOT NULL COMMENT '商品名称',
  `danWei` varchar(50) NOT NULL COMMENT '单位',
  `nums` int(11) NOT NULL COMMENT '库存数量',
  `jprice` float NOT NULL COMMENT '售价',
  `sprice` float NOT NULL COMMENT '进价',
  `supplierId` int(11) NOT NULL COMMENT '供货商Id',
  `storeId` int(11) NOT NULL COMMENT '分店Id',
  `typeId` int(11) NOT NULL COMMENT '商品类型Id',
  `yileld` varchar(50) NOT NULL COMMENT '生产日期',
  `pledge` varchar(50) NOT NULL COMMENT '保质期',
  `expiration` varchar(50) NOT NULL COMMENT '到期时间',
  `queState` int(11) NOT NULL COMMENT '缺货状态',
  `zuiD` int(11) NOT NULL COMMENT '最低库存数',
  `jifen` int(11) NOT NULL COMMENT '兑换积分',
  `remake` varchar(50) DEFAULT NULL COMMENT '备注',
  `guoqi` varchar(50) DEFAULT NULL COMMENT '过期状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

/*Data for the table `kct` */

insert  into `kct`(`Id`,`KCId`,`sName`,`danWei`,`nums`,`jprice`,`sprice`,`supplierId`,`storeId`,`typeId`,`yileld`,`pledge`,`expiration`,`queState`,`zuiD`,`jifen`,`remake`,`guoqi`) values (1,1027,'雪糕','瓶',85,65,50,1,1,1,'2020-9-05','24个月','2020-06-10',0,200,50,NULL,NULL),(2,1001,'方便面','箱',90,65,50,1,1,3,'2022-07-05','14个月','2020-06-24',0,200,50,NULL,NULL),(3,1002,'火腿肠','箱',210,78,60,1,1,3,'2020-07-05','13个月','2020-07-23',0,200,60,NULL,NULL),(4,1016,'玉玺香烟','包',114,28,22,2,1,1,'2020-07-05','14个月','2020-07-22',0,200,22,NULL,NULL),(5,1042,'烧鸡','789',84,11,9,1,1,1,'2022-07-05','9','2020-02-10',0,200,9,NULL,NULL),(6,1056,'裤衩子','88',187,10,8,1,1,1,'2020-07-05','8','2021-06-10',0,200,8,NULL,NULL),(7,1057,'袜子','8',102,71,55,2,1,2,'2022-07-05','8','2021-06-10',0,200,55,NULL,NULL),(8,1058,'猪肉','88',97,10,8,2,1,3,'2022-07-05','7','2021-06-10',0,200,8,NULL,NULL),(9,1059,'充电宝','8',105,65,50,1,1,1,'2020-07-05','8','2021-06-10',0,200,50,NULL,NULL),(10,1062,'馒头片','7',70,9,7,2,1,3,'2022-07-05','8年','2021-06-10',0,200,7,NULL,NULL),(11,1067,'双截棍','8',80,10,8,1,1,1,'2020-06-03','8','2021-06-10',0,200,8,NULL,NULL),(12,1068,'花生','1',15,2,2,1,1,1,'2020-07-05','12','2021-06-10',0,200,2,NULL,NULL),(102,1110,'白菜','7',70,9,7,26,1,9,'2014-06-06','7','2020-06-30',0,200,7,NULL,NULL),(103,1111,'电脑外星人','8',50,650,500,26,3,5,'2020-06-29','8','2020-06-11',0,200,500,NULL,NULL),(104,1112,'华硕电脑','7',89,19,15,3,2,5,'2018-06-22','7','2020-06-26',0,200,15,NULL,NULL),(105,1113,'橘子','8',15,10.4,8,26,1,2,'2020-06-02','8','2020-07-03',0,200,8,NULL,NULL),(106,1114,'橘子','5',45,7.8,6,28,1,2,'2020-09-29','8','2020-09-24',0,200,6,NULL,NULL),(107,1115,'5棵树','5',555,71.5,55,28,1,4,'2020-09-30','4','2020-09-30',0,200,55,NULL,NULL),(108,1116,'白菜','8',7,9.1,7,26,1,2,'2020-10-07','8','2020-09-24',0,200,7,NULL,NULL);

/*Table structure for table `khshop` */

DROP TABLE IF EXISTS `khshop`;

CREATE TABLE `khshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `buId` int(11) NOT NULL COMMENT '商品编号',
  `buName` varchar(50) NOT NULL COMMENT '商品名称',
  `danWei` varchar(50) NOT NULL COMMENT '单位',
  `num` int(11) NOT NULL COMMENT '数量',
  `price` double NOT NULL COMMENT '价钱',
  `money` double DEFAULT NULL COMMENT '总金额',
  `dh` int(11) NOT NULL COMMENT '是否为兑换',
  `zjifen` int(11) DEFAULT NULL COMMENT '总积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `khshop` */

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `ManagerId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `Mname` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT '22b57715cc6f7d7d68b95fee85857d9d' COMMENT '密码',
  `photo` varchar(50) DEFAULT ']static/images/QQ图片20200527182305.jpg' COMMENT '头像',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系方 式',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `roleId` int(11) DEFAULT NULL COMMENT '职位',
  `salt` varchar(255) DEFAULT '111111',
  PRIMARY KEY (`ManagerId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `manager` */

insert  into `manager`(`ManagerId`,`Mname`,`password`,`photo`,`phone`,`address`,`state`,`roleId`,`salt`) values (1,'admin1','22b57715cc6f7d7d68b95fee85857d9d','static/images/QQ图片20200527182257.jpg','15531073159','邯郸翱翔',1,1,'111111'),(2,'admin2','22b57715cc6f7d7d68b95fee85857d9d','static/images/QQ图片20200527182305.jpg','18765823695 ','邯郸翱翔1',1,2,'111111'),(3,'admin3','22b57715cc6f7d7d68b95fee85857d9d','static/images/QQ图片20200527182305.jpg','18765823695 ','邯郸翱翔',1,3,'111111'),(4,'admin4','22b57715cc6f7d7d68b95fee85857d9d','static/images/QQ图片20200527182305.jpg','18765823695 ','邯郸翱翔',1,4,'111111'),(5,'admin5','22b57715cc6f7d7d68b95fee85857d9d','static/images/QQ图片20200527182305.jpg','18765823695 ','邯郸翱翔',1,5,'111111'),(7,'666','22b57715cc6f7d7d68b95fee85857d9d','static/images/QQ图片20200527182305.jpg','13283105002','666',0,1,'111111');

/*Table structure for table `manager_role` */

DROP TABLE IF EXISTS `manager_role`;

CREATE TABLE `manager_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ManagerId` int(11) NOT NULL COMMENT '管理员id外键',
  `roleId` int(11) NOT NULL COMMENT '职位id外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `manager_role` */

insert  into `manager_role`(`id`,`ManagerId`,`roleId`) values (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,1);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `permissionId` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pName` varchar(50) NOT NULL COMMENT '权限名称',
  `type` varchar(50) NOT NULL COMMENT '权限类型',
  `url` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `parentid` int(11) DEFAULT NULL COMMENT '二级权限',
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`permissionId`,`pName`,`type`,`url`,`parentid`) values (1,'进货管理','menu',NULL,0),(2,'销售管理','menu',NULL,0),(3,'库存管理','menu',NULL,0),(4,'统计图','menu',NULL,0),(5,'用户管理','menu',NULL,0),(6,'权限管理','menu',NULL,0),(7,'客户管理','menu',NULL,0),(8,'进货','permission','Purchase/purchase.jsp',1),(9,'供应商管理','menu',NULL,0),(10,'仓库管理','menu',NULL,0),(12,'进货(入库)','permission','Purchase/shenHe.jsp',1),(13,'商品销售','permission','Market/market.jsp',2),(16,'库存不足预警','permission','Market/XSBJ.jsp',3),(17,'会员销售查询','permission','Market/XSDanJu.jsp',2),(19,'库存量','permission','KuCun/KuCun.jsp',3),(20,'入库审核信息','permission','KuCun/RKShenHe.jsp',7777),(21,'库存盘点','permission','KuCun/CKShenHe.jsp',3),(22,'库存报警','permission','KuCun/KCBJ.jsp',3),(24,'库存数量统计','permission','TongJi/ta.jsp',4),(25,'销售TOP商品','permission','TongJi/tb.jsp',4),(27,'用户信息','permission','Manager/ManagerInfo.jsp',5),(28,'权限分配','permission','Manager/Role.jsp',6),(33,'客户','permission','Manager/customerInfo.jsp',7),(35,'供货商设置','permission','supplier.jsp',9),(37,'仓库设置','permission','Store.jsp',10),(38,'年月总销售统计','permission','TongJi/cc.jsp',4),(39,'销售额TOP统计','permission','TongJi/tt.jsp',4),(40,'普通销售查询','permission','Market/huiyuan.jsp',2),(41,'分类管理','menu',NULL,0),(42,'分类列表','permission','Manager/fenlei.jsp',41),(43,'商品过期预警','permission','Market/riqi.jsp',2),(44,'商品预警','permission','Market/riqi2.jsp',2),(45,'仓库盘库','permission','KuCun/panku.jsp',10);

/*Table structure for table `rbills` */

DROP TABLE IF EXISTS `rbills`;

CREATE TABLE `rbills` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `number` varchar(50) NOT NULL COMMENT '单据号',
  `typeId` int(11) NOT NULL COMMENT '单据类型',
  `danTime` varchar(50) NOT NULL COMMENT '开单日期',
  `StoreId` int(11) NOT NULL COMMENT '仓库外键表',
  `YingF` double NOT NULL COMMENT '应付金额',
  `ShiF` double NOT NULL COMMENT '实付金额',
  `ManagerId` int(11) NOT NULL COMMENT '经办人',
  `czy` int(11) NOT NULL COMMENT '操作员',
  `stateId` int(11) NOT NULL COMMENT '入库状态 0未审核 1入库',
  `remake` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

/*Data for the table `rbills` */

insert  into `rbills`(`id`,`number`,`typeId`,`danTime`,`StoreId`,`YingF`,`ShiF`,`ManagerId`,`czy`,`stateId`,`remake`) values (158,'DJ812202006201834',1,'2020-6-20',3,64,64,0,0,1,''),(159,'DJ609202006222200',1,'2020-6-22',3,64,64,0,0,1,''),(160,'DJ549202006222209',1,'2020-6-22',1,55500,55500,0,0,1,''),(161,'DJ817202006222207',1,'2020-6-22',3,200,200,0,0,1,''),(162,'DJ966202006222213',1,'2020-6-22',1,100,100,0,0,1,''),(163,'DJ210202006222212',1,'2020-6-22',1,64,64,0,0,1,''),(164,'DJ136202006222210',1,'2020-6-22',1,3000,3000,0,0,1,''),(165,'DJ518202006242028',1,'2020-6-24',27,49,49,0,0,1,''),(166,'DJ380202006242028',1,'2020-6-24',2,4750,4750,0,0,1,''),(167,'DJ608202006270850',1,'2020-6-27',1,120,120,0,0,1,''),(168,'DJ502202009252223',1,'2020-9-25',1,270,270,0,0,1,''),(169,'DJ178202009252225',1,'2020-9-25',3,30574,30574,0,0,1,'');

/*Table structure for table `rdetails` */

DROP TABLE IF EXISTS `rdetails`;

CREATE TABLE `rdetails` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `number` varchar(50) NOT NULL COMMENT '单据号',
  `buId` varchar(50) NOT NULL COMMENT '商品编号',
  `buName` varchar(50) NOT NULL COMMENT '商品名称',
  `danWei` varchar(50) NOT NULL COMMENT '单位',
  `price` double NOT NULL COMMENT '进价',
  `ynums` int(11) NOT NULL COMMENT '应到数量',
  `snums` int(11) NOT NULL COMMENT '实到数量',
  `money` double NOT NULL COMMENT '总金额',
  `supplierId` int(11) NOT NULL COMMENT '供货商Id',
  `yileld` varchar(50) NOT NULL COMMENT '生产日期',
  `pledge` varchar(50) NOT NULL COMMENT '保质期',
  `expiration` varchar(50) NOT NULL COMMENT '到期时间',
  `typeId` int(11) NOT NULL COMMENT '商品类型Id',
  `storeId` int(11) NOT NULL COMMENT '仓库Id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

/*Data for the table `rdetails` */

insert  into `rdetails`(`Id`,`number`,`buId`,`buName`,`danWei`,`price`,`ynums`,`snums`,`money`,`supplierId`,`yileld`,`pledge`,`expiration`,`typeId`,`storeId`) values (154,'DJ812202006201834','1096','8','8',8,8,8,64,2,'0008-01-01','8','0008-01-01',2,1),(155,'DJ609202006222200','1097','垃圾袋','8',8,8,8,64,3,'0008-01-01','8','0008-01-01',5,1),(156,'DJ549202006222209','1101','小狗','4',555,100,100,55500,23,'2018-09-09','4','2019-09-09',5,1),(157,'DJ817202006222207','1098','垃圾桶','4',4,50,50,200,1,'0005-01-01','5','0005-01-01',5,1),(158,'DJ817202006222207','1100','垃圾箱','7',200,150,150,30000,23,'0004-01-01','4','0004-01-01',5,1),(159,'DJ966202006222213','1105','裤子','4',4,10,10,40,23,'0007-01-01','7','0007-01-01',3,1),(160,'DJ966202006222213','1106','牛仔裤','6',6,10,10,60,23,'0004-01-01','4','0004-01-01',2,1),(161,'DJ210202006222212','1104','裙子','8',8,8,8,64,3,'0008-01-01','8','0008-01-01',2,1),(162,'DJ136202006222210','1102','充气娃娃','45',100,10,10,1000,23,'2020-07-01','7','2020-06-26',5,1),(163,'DJ136202006222210','1103','玩具狗','10',100,10,10,1000,23,'2020-07-23','4','2020-06-11',4,1),(164,'DJ518202006242028','1110','白菜','7',7,7,7,49,26,'2014-06-06','7','2020-06-30',9,1),(165,'DJ380202006242028','1111','电脑外星人','8',500,5,5,2500,26,'2020-06-29','8','2020-06-11',5,1),(166,'DJ380202006242028','1112','华硕电脑','7',15,150,150,2250,3,'2018-06-22','7','2020-06-26',5,1),(167,'DJ608202006270850','1113','橘子','8',8,15,15,120,26,'2020-06-02','8','2020-07-03',2,1),(168,'DJ502202009252223','1114','橘子','5',6,45,45,270,28,'2020-09-29','8','2020-09-24',2,1),(169,'DJ178202009252225','1115','5棵树','5',55,555,555,30525,28,'2020-09-30','4','2020-09-30',4,1),(170,'DJ178202009252225','1116','白菜','8',7,7,7,49,26,'2020-10-07','8','2020-09-24',2,1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `roleName` varchar(50) NOT NULL COMMENT '职位名称',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleId`,`roleName`) values (1,'超级管理员'),(2,'经理'),(3,'采购工作者'),(4,'销售服务人员'),(5,'库存管理员'),(6,'宣传');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `RoleId` int(11) NOT NULL COMMENT '职位id外键',
  `permissionId` int(11) NOT NULL COMMENT '权限id外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1220 DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`id`,`RoleId`,`permissionId`) values (735,15,7),(736,15,33),(737,15,9),(738,15,35),(739,15,10),(740,15,37),(748,16,4),(749,16,24),(750,16,25),(751,16,38),(752,16,39),(753,16,5),(754,16,27),(755,16,6),(756,16,28),(770,4,2),(771,4,13),(772,4,16),(773,4,17),(774,4,4),(777,4,7),(778,4,33),(796,2,1),(797,2,8),(798,2,12),(799,2,2),(800,2,13),(801,2,16),(802,2,17),(803,2,40),(804,2,4),(805,2,24),(806,2,25),(807,2,6),(808,2,28),(811,18,1),(812,18,8),(813,18,12),(814,18,2),(815,18,13),(816,18,16),(817,18,17),(818,18,40),(819,18,3),(820,18,19),(821,18,21),(822,18,22),(823,18,4),(824,18,24),(825,18,25),(826,18,38),(827,18,39),(828,18,7),(829,18,33),(835,39,2),(836,39,13),(837,39,16),(838,39,17),(839,39,40),(840,39,3),(841,39,19),(842,39,21),(843,39,22),(844,39,4),(845,39,24),(846,39,25),(847,39,38),(848,39,39),(849,3,1),(850,3,8),(851,3,12),(852,3,9),(853,3,35),(854,3,10),(855,3,37),(856,3,41),(857,3,42),(858,4,40),(859,4,38),(860,4,39),(874,41,4),(875,41,24),(876,41,25),(877,41,38),(878,41,39),(879,5,2),(880,5,17),(881,5,40),(882,5,3),(883,5,19),(884,5,21),(885,5,22),(886,5,4),(887,5,24),(888,5,25),(889,5,9),(890,5,35),(891,5,10),(892,5,37),(893,5,16),(894,4,43),(897,4,44),(898,4,25),(900,5,45),(901,6,9),(902,6,35),(903,6,10),(904,6,37),(905,6,45),(1188,1,1),(1189,1,8),(1190,1,12),(1191,1,2),(1192,1,13),(1193,1,17),(1194,1,40),(1195,1,43),(1196,1,44),(1197,1,3),(1198,1,16),(1199,1,19),(1200,1,21),(1201,1,22),(1202,1,4),(1203,1,24),(1204,1,25),(1205,1,38),(1206,1,39),(1207,1,5),(1208,1,27),(1209,1,6),(1210,1,28),(1211,1,7),(1212,1,33),(1213,1,9),(1214,1,35),(1215,1,10),(1216,1,37),(1217,1,45),(1218,1,41),(1219,1,42);

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `buId` int(11) NOT NULL COMMENT '商品编号',
  `buName` varchar(50) NOT NULL COMMENT '商品名称',
  `danWei` varchar(50) NOT NULL COMMENT '单位',
  `num` int(11) NOT NULL COMMENT '数量',
  `price` double NOT NULL COMMENT '售价',
  `typeId` int(11) NOT NULL COMMENT '食品类型',
  `yileld` varchar(50) NOT NULL COMMENT '生产日期',
  `pledge` varchar(50) NOT NULL COMMENT '保质期',
  `expiration` varchar(50) NOT NULL COMMENT '到期时间',
  `jifen` int(11) NOT NULL COMMENT '积分',
  `dh` int(11) NOT NULL COMMENT '兑换',
  `touxiang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `sales` */

insert  into `sales`(`id`,`buId`,`buName`,`danWei`,`num`,`price`,`typeId`,`yileld`,`pledge`,`expiration`,`jifen`,`dh`,`touxiang`) values (1,111,'辣条','箱',75,65,3,'2018-11-00','14个月','2020-01-00',50,0,'static/images/QQ截图20200610230622.jpg'),(2,112,'老干马','箱',42,60,3,'2018-12-00','13个月','2020-01-00',50,0,'static/img/老干妈.jpg'),(3,113,'筷子','瓶',98,65,5,'2019-01-10','24个月','2020-01-22',50,0,'static/img/筷子.jpg'),(4,114,'可乐','箱',200,80,2,'2018-11-00','14个月','2020-01-00',50,0,'static/img/可乐.jpg'),(5,115,'孟婆汤','箱',70,90,3,'2018-11-00','14个月','2020-01-00',50,0,'static/img/汤.jpg'),(6,116,'冰棍','箱',80,150,3,'2018-11-00','14个月','2020-01-00',50,0,'static/img/冰棍.jpg'),(7,118,'鸡蛋','箱',55,250,3,'2018-11-00','14个月','2020-01-00',50,0,'static/img/鸡蛋.jpg'),(8,117,'大米饭','箱',78,250,2,'2018-11-00','14个月','2020-01-00',50,0,'static/img/米饭.jpg'),(9,1009,'可乐','箱',80,250,2,'2018-11-00','14个月','2020-01-00',50,0,'static/img/可乐.jpg'),(10,1010,'雪碧','箱',60,250,2,'2018-11-00','14个月','2020-01-00',50,0,NULL),(11,1011,'枕头','箱',60,250,2,'2018-11-00','14个月','2020-01-00',50,0,NULL),(12,1012,'拖鞋','个',70,50,5,'2018-11-00','14个月','2020-01-00',50,0,NULL),(13,1013,'充气娃娃','个',79,25,5,'2018-11-00','14个月','2020-01-00',50,0,NULL);

/*Table structure for table `shoptype` */

DROP TABLE IF EXISTS `shoptype`;

CREATE TABLE `shoptype` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型Id',
  `typeName` varchar(50) DEFAULT NULL COMMENT '类型名称',
  `dengji` varchar(50) DEFAULT NULL COMMENT '三级分类',
  `shangji` varchar(50) DEFAULT NULL COMMENT '上级id',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `shoptype` */

insert  into `shoptype`(`typeId`,`typeName`,`dengji`,`shangji`) values (1,'烟酒类','1',NULL),(2,'饮料汽水类','1',NULL),(3,'食用商品类','1',NULL),(4,'水果类','1',NULL),(5,'家庭用品类','1',NULL),(6,'蔬菜','1',NULL);

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `storeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `storeName` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `Phone` varchar(50) DEFAULT NULL COMMENT '联系方式',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `remake` varchar(50) DEFAULT NULL COMMENT '备注',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `store` */

insert  into `store`(`storeId`,`storeName`,`Phone`,`address`,`remake`,`state`) values (1,'翱翔分仓1','2222233333','河北邯郸永年县','哈哈21',0),(2,'翱翔分仓2','8888888','河北邯郸大名县','55',0),(3,'翱翔分仓3','123456','ddd','7777',0),(27,'翱翔分仓4','13228354444','8','8',0);

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `supplierId` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `supName` varchar(50) NOT NULL COMMENT '供货商名称',
  `phone` varchar(50) NOT NULL COMMENT '联系方式',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `stateId` int(11) DEFAULT NULL COMMENT '状态',
  `typeId` int(11) NOT NULL COMMENT '外键',
  PRIMARY KEY (`supplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

insert  into `supplier`(`supplierId`,`supName`,`phone`,`address`,`stateId`,`typeId`) values (1,'供货商1','15531073154','河北省邯郸市邯钢路1',0,1),(2,'供货商2','15531073155','河北省邯郸市学员北路鹏泰大厦',0,2),(3,'供货商3','15531073155','河北省邯郸市火车站',0,3),(26,'供应商4','13228354444','66',0,2),(27,'66','66','66',0,0),(28,'555','13283105002','555',0,1);

/*Table structure for table `supptype` */

DROP TABLE IF EXISTS `supptype`;

CREATE TABLE `supptype` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `typeName` varchar(50) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `supptype` */

insert  into `supptype`(`typeId`,`typeName`) values (1,'饮料供货商'),(2,'面包供货商'),(3,'火腿供货商');

/*Table structure for table `xsbills` */

DROP TABLE IF EXISTS `xsbills`;

CREATE TABLE `xsbills` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `khId` varchar(50) DEFAULT NULL COMMENT '客户Id',
  `Number` varchar(50) DEFAULT NULL COMMENT '单据号',
  `bType` int(11) DEFAULT NULL COMMENT '单据类型',
  `xsTime` varchar(50) DEFAULT NULL COMMENT '销售时间',
  `money` double DEFAULT NULL COMMENT '付款金额',
  `jifen` int(11) DEFAULT NULL COMMENT '销售积分',
  `managerId` int(11) DEFAULT NULL COMMENT '操作员',
  `idd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

/*Data for the table `xsbills` */

insert  into `xsbills`(`id`,`khId`,`Number`,`bType`,`xsTime`,`money`,`jifen`,`managerId`,`idd`) values (220,'2','XS602202006252103',5,'2020-6-25',4995,0,4,'垃圾'),(221,'小白','XS441202006252108',5,'2020-6-25',28,0,4,'11'),(222,'4','XS954202006262052',5,'2020-6-26',678,0,4,'刘赛非太丑'),(223,'5','XS698202006270852',2,'2020-6-27',715,0,4,'sss'),(224,'2','XS733202006270854',5,'2020-6-27',650,0,4,'太垃圾'),(225,'2','XS283202009252231',5,'2020-9-25',80.6,0,4,'785'),(226,'2','XS204202009252254',3,'2020-9-25',81,0,4,NULL);

/*Table structure for table `xsbj` */

DROP TABLE IF EXISTS `xsbj`;

CREATE TABLE `xsbj` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `buId` int(11) NOT NULL COMMENT '商品编号',
  `buName` varchar(50) NOT NULL COMMENT '商品名称',
  `danWei` varchar(50) NOT NULL COMMENT '单位',
  `price` double NOT NULL COMMENT '单价',
  `typeId` int(11) NOT NULL COMMENT '商品类型',
  `yileId` varchar(50) DEFAULT NULL COMMENT '生产日期',
  `pledge` varchar(50) DEFAULT NULL COMMENT '保质期',
  `expiration` varchar(50) DEFAULT NULL COMMENT '到期日期',
  `jifen` int(11) DEFAULT NULL COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xsbj` */

/*Table structure for table `xsdetails` */

DROP TABLE IF EXISTS `xsdetails`;

CREATE TABLE `xsdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `number` varchar(50) DEFAULT NULL COMMENT '单据号',
  `buId` int(11) DEFAULT NULL COMMENT '商品编号',
  `shopName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `danWei` varchar(50) DEFAULT NULL COMMENT '单位',
  `price` double DEFAULT NULL COMMENT '价格',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `money` double DEFAULT NULL COMMENT '总金额',
  `dh` int(11) DEFAULT NULL COMMENT '是否为兑换',
  `zjifen` int(11) DEFAULT NULL COMMENT '总积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

/*Data for the table `xsdetails` */

insert  into `xsdetails`(`id`,`number`,`buId`,`shopName`,`danWei`,`price`,`num`,`money`,`dh`,`zjifen`) values (129,'XS602202006252103',1027,'雪糕','瓶',65,10,650,0,0),(130,'XS602202006252103',1001,'方便面','箱',65,15,975,0,0),(131,'XS602202006252103',1002,'火腿肠','箱',78,40,3120,0,0),(132,'XS602202006252103',1042,'烧鸡','789',11,10,110,0,0),(133,'XS602202006252103',1058,'猪肉','88',10,14,140,0,0),(134,'XS441202006252108',1016,'玉玺香烟','包',28,1,28,0,0),(135,'XS954202006262052',1016,'玉玺香烟','包',28,1,28,0,0),(136,'XS954202006262052',1027,'雪糕','瓶',65,10,650,0,0),(137,'XS698202006270852',1027,'雪糕','瓶',65,10,65,0,0),(138,'XS698202006270852',1001,'方便面','箱',65,10,650,0,0),(139,'XS733202006270854',1027,'雪糕','瓶',65,10,650,0,0),(140,'XS733202006270854',1001,'方便面','箱',65,10,650,0,0),(141,'XS283202009252231',1116,'白菜','8',9.1,1,9.1,0,0),(142,'XS283202009252231',1115,'5棵树','5',71.5,1,71.5,0,0),(143,'XS204202009252254',1057,'袜子','8',71,1,71,0,0),(144,'XS204202009252254',1058,'猪肉','88',10,1,10,0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
