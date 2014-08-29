/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2014-08-29 18:43:47
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `usertable`
-- ----------------------------
DROP TABLE IF EXISTS `usertable`;
CREATE TABLE `usertable` (
  `userid` varchar(8) NOT NULL,
  `username` varchar(10) DEFAULT NULL,
  `userpass` varchar(8) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `degree` varchar(10) DEFAULT NULL,
  `local` varchar(4) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertable
-- ----------------------------
INSERT INTO `usertable` VALUES ('001', 'hujinguang', '123', '1', '1988-01-27', '本科', '南京', 'hu.tristan@qq.com', '南京市软件大道', '惺惺惜惺惺');
INSERT INTO `usertable` VALUES ('002', 'zvv', '123', '0', '1991-02-21', '本科', '南京', 'sweety@162.com', '南京市正方中路888号', null);
INSERT INTO `usertable` VALUES ('003', 'xiehan', '123', '0', '1986-02-03', '硕士', '南京', 'xiehan@qq.com', '南京市珠江路', null);
INSERT INTO `usertable` VALUES ('004', 'wmm', '123', '0', '1986-03-12', '本科', '南京', 'wmm@qq.com', '南京市奥体中心', null);
