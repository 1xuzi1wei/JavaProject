/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : db_library

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2018-06-19 11:59:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_bookcase`
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookcase`;
CREATE TABLE `tb_bookcase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookcase
-- ----------------------------
INSERT INTO `tb_bookcase` VALUES ('4', '四楼A区7行5列');
INSERT INTO `tb_bookcase` VALUES ('5', '二楼A区5行5列');
INSERT INTO `tb_bookcase` VALUES ('6', '三楼B区7行4列');

-- ----------------------------
-- Table structure for `tb_bookinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookinfo`;
CREATE TABLE `tb_bookinfo` (
  `barcode` varchar(30) DEFAULT NULL,
  `bookname` varchar(70) DEFAULT NULL,
  `typeid` int(10) unsigned DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `page` int(10) unsigned DEFAULT '0',
  `bookcase` int(10) unsigned DEFAULT NULL,
  `intime` date DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `del` tinyint(1) unsigned zerofill DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`),
  KEY `bookcaseid` (`bookcase`),
  KEY `isbn` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookinfo
-- ----------------------------
INSERT INTO `tb_bookinfo` VALUES ('30772410', '信息系统分析与设计', '1', '邝孔武、王晓敏', '302', '22.00', '268', '4', '2018-04-30', 'mr', '0', '1');
INSERT INTO `tb_bookinfo` VALUES ('CB2032883', '信息系统分析与设计实验教程', '1', '郝晓玲', '115', '39.00', '172', '4', '2018-04-30', 'mr', '0', '2');
INSERT INTO `tb_bookinfo` VALUES ('CB1691417', 'Java Web从入门到精通', '2', '明日科技', '302', '69.80', '547', '5', '2018-04-30', 'mr', '0', '3');
INSERT INTO `tb_bookinfo` VALUES ('CB1674900', 'Java Web典型模块与项目实战大全', '2', '明日科技、陈丹丹', '111', '79.00', '548', '5', '2018-04-30', 'mr', '1', '4');

-- ----------------------------
-- Table structure for `tb_booktype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_booktype`;
CREATE TABLE `tb_booktype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(30) DEFAULT NULL COMMENT '类型名称',
  `days` int(10) unsigned DEFAULT NULL COMMENT '可借天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_booktype
-- ----------------------------
INSERT INTO `tb_booktype` VALUES ('1', '信息系统开发', '15');
INSERT INTO `tb_booktype` VALUES ('2', '网络编程', '20');

-- ----------------------------
-- Table structure for `tb_borrow`
-- ----------------------------
DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `readerid` int(10) unsigned DEFAULT NULL COMMENT '读者编号',
  `bookid` int(10) unsigned DEFAULT NULL COMMENT '图书编号',
  `borrowTime` date DEFAULT NULL COMMENT '借书时间',
  `backtime` date DEFAULT NULL COMMENT '归还时间',
  `operator` varchar(30) DEFAULT NULL COMMENT '操作员',
  `ifback` tinyint(1) DEFAULT NULL COMMENT '是否归还',
  PRIMARY KEY (`id`),
  KEY `readerid` (`readerid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `bookid` FOREIGN KEY (`bookid`) REFERENCES `tb_bookinfo` (`id`),
  CONSTRAINT `readerid` FOREIGN KEY (`readerid`) REFERENCES `tb_reader` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_borrow
-- ----------------------------
INSERT INTO `tb_borrow` VALUES ('1', '1', '1', '2018-04-30', '2018-05-31', 'mr', '1');
INSERT INTO `tb_borrow` VALUES ('2', '1', '1', '2018-04-30', '2018-05-31', 'mr', '0');
INSERT INTO `tb_borrow` VALUES ('3', '2', '2', '2018-04-30', '2018-05-31', 'mr', '0');

-- ----------------------------
-- Table structure for `tb_giveback`
-- ----------------------------
DROP TABLE IF EXISTS `tb_giveback`;
CREATE TABLE `tb_giveback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `readerid` int(11) DEFAULT NULL COMMENT '读者编号',
  `bookid` int(11) DEFAULT NULL COMMENT '图书编号',
  `backTime` date DEFAULT NULL COMMENT '归还时间',
  `operator` varchar(30) DEFAULT NULL COMMENT '操作员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_giveback
-- ----------------------------
INSERT INTO `tb_giveback` VALUES ('1', '1', '1', '2018-04-30', 'mr');

-- ----------------------------
-- Table structure for `tb_library`
-- ----------------------------
DROP TABLE IF EXISTS `tb_library`;
CREATE TABLE `tb_library` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libraryname` varchar(50) DEFAULT NULL COMMENT '图书馆名称',
  `curator` varchar(10) DEFAULT NULL COMMENT '管理员',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `url` varchar(100) DEFAULT NULL COMMENT '网址',
  `createDate` date DEFAULT NULL COMMENT '创建日期',
  `introduce` text COMMENT '介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_library
-- ----------------------------
INSERT INTO `tb_library` VALUES ('1', '电子科技大学图书馆', 'mr', '123', '成都市高新区（西区）西源大道2006号', 'mr@sohu.com', 'http://www.uestc.edu.cn/', '2015-01-01', '图书馆内含丰富的藏书。');

-- ----------------------------
-- Table structure for `tb_manager`
-- ----------------------------
DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '管理员姓名',
  `pwd` varchar(10) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_manager
-- ----------------------------
INSERT INTO `tb_manager` VALUES ('1', 'mr', 'mrsoft');
INSERT INTO `tb_manager` VALUES ('2', 'wgh', '111');
INSERT INTO `tb_manager` VALUES ('3', 'admin', '1234');

-- ----------------------------
-- Table structure for `tb_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `tb_parameter`;
CREATE TABLE `tb_parameter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cost` int(10) unsigned DEFAULT NULL COMMENT '办书证',
  `validity` int(10) unsigned DEFAULT NULL COMMENT '有效期限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_parameter
-- ----------------------------
INSERT INTO `tb_parameter` VALUES ('1', '15', '30');

-- ----------------------------
-- Table structure for `tb_publishing`
-- ----------------------------
DROP TABLE IF EXISTS `tb_publishing`;
CREATE TABLE `tb_publishing` (
  `ISBN` varchar(20) NOT NULL COMMENT 'ISBN号',
  `pubname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_publishing
-- ----------------------------
INSERT INTO `tb_publishing` VALUES ('111', '电子工业出版社');
INSERT INTO `tb_publishing` VALUES ('115', '上海财经大学出版社');
INSERT INTO `tb_publishing` VALUES ('302', '清华大学出版社');

-- ----------------------------
-- Table structure for `tb_purview`
-- ----------------------------
DROP TABLE IF EXISTS `tb_purview`;
CREATE TABLE `tb_purview` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sysset` tinyint(1) unsigned zerofill NOT NULL COMMENT '系统设置',
  `readerset` tinyint(1) unsigned zerofill NOT NULL COMMENT '读者管理',
  `bookset` tinyint(1) unsigned zerofill NOT NULL COMMENT '图书管理',
  `borrowback` tinyint(1) unsigned zerofill NOT NULL COMMENT '图书借还',
  `sysquery` tinyint(1) unsigned zerofill NOT NULL COMMENT '系统查询',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_purview
-- ----------------------------
INSERT INTO `tb_purview` VALUES ('1', '1', '1', '1', '1', '1');
INSERT INTO `tb_purview` VALUES ('2', '0', '1', '1', '1', '1');
INSERT INTO `tb_purview` VALUES ('3', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for `tb_reader`
-- ----------------------------
DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `barcode` varchar(30) DEFAULT NULL COMMENT '条形码',
  `vocation` varchar(50) DEFAULT NULL COMMENT '职业',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `paperType` varchar(10) DEFAULT NULL COMMENT '有效证件',
  `paperNO` varchar(20) DEFAULT NULL COMMENT '证件号码',
  `tel` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `createDate` date DEFAULT NULL COMMENT '录入日期',
  `operator` varchar(30) DEFAULT NULL COMMENT '操作员',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `readertypeid` int(10) unsigned DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`),
  KEY `typeid` (`readertypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reader
-- ----------------------------
INSERT INTO `tb_reader` VALUES ('1', '张三', '男', '2015080302011', '学生', '1996-03-09', '身份证', '220104201007100001', '18428321132', 'zhangsan@163.com', '2018-04-30', 'mr', '无', '1');
INSERT INTO `tb_reader` VALUES ('2', '小红', '女', '2015080302027', '学生', '1996-03-17', '学生证', '20010228', '18079315592', 'xiaohong@qq.com', '2018-04-30', 'mr', '无', '1');
INSERT INTO `tb_reader` VALUES ('3', '李四', '男', '2034554', '老师', '1978-07-21', '职工证', '20150430', '13079521120', 'lisi@sohu.com', '2018-04-30', 'mr', '无', '2');

-- ----------------------------
-- Table structure for `tb_readertype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_readertype`;
CREATE TABLE `tb_readertype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) DEFAULT NULL COMMENT '读者姓名',
  `number` int(4) DEFAULT NULL COMMENT '可借数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_readertype
-- ----------------------------
INSERT INTO `tb_readertype` VALUES ('1', '学生', '30');
INSERT INTO `tb_readertype` VALUES ('2', '老师', '30');
