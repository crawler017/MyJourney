/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 100130
 Source Host           : localhost:3306
 Source Schema         : mysql

 Target Server Type    : MySQL
 Target Server Version : 100130
 File Encoding         : 65001

 Date: 04/01/2019 11:40:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for allusers
-- ----------------------------
DROP TABLE IF EXISTS `allusers`;
CREATE TABLE `allusers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `pwd` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `cx` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '普通管理员',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of allusers
-- ----------------------------
INSERT INTO `allusers` VALUES (2, 'hsg', 'hsg', '超级管理员', '2017-04-06 10:51:02');
INSERT INTO `allusers` VALUES (6, 'bbb', 'bbb', '普通管理员', '2017-04-06 10:51:02');
INSERT INTO `allusers` VALUES (7, 'aa', 'aa', '普通管理员', '2017-04-06 10:51:02');
INSERT INTO `allusers` VALUES (8, 'gw', 'gw', '普通管理员', '2017-04-06 03:31:52');
INSERT INTO `allusers` VALUES (9, 'cc', 'cc', '普通管理员', '2017-04-06 08:28:20');
INSERT INTO `allusers` VALUES (10, 'dd', 'dd', '普通管理员', '2017-04-06 08:35:48');
INSERT INTO `allusers` VALUES (11, 'cdde', 'cdde', '普通管理员', '2017-04-06 02:36:10');
INSERT INTO `allusers` VALUES (12, 'fwgwgw', 'fwgwgw', '普通管理员', '2017-04-06 11:37:04');

-- ----------------------------
-- Table structure for back
-- ----------------------------
DROP TABLE IF EXISTS `back`;
CREATE TABLE `back`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isbn` int(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(20) NOT NULL,
  `date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of back
-- ----------------------------
INSERT INTO `back` VALUES (1, '世界简史', 2147483647, '梁红', 43, '2018-12-03 23:42:18');
INSERT INTO `back` VALUES (2, '经济学原理', 2147483647, '梁敏', 35, '2018-12-05 00:00:00');
INSERT INTO `back` VALUES (3, '古希腊神话', 2147483647, '郑云河', 87, '2018-12-21 00:00:00');
INSERT INTO `back` VALUES (4, '大学英语', 2147483647, '林晓橙', 77, '2018-12-19 00:00:00');
INSERT INTO `back` VALUES (5, '古希腊神话', 23432423, '陈丽', 90, '2018-12-05 00:00:00');
INSERT INTO `back` VALUES (6, '经济学原理', 2147483647, '林晓橙', 24, '2016-09-14 00:00:00');

-- ----------------------------
-- Table structure for blacklist
-- ----------------------------
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `num` int(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blacklist
-- ----------------------------
INSERT INTO `blacklist` VALUES (1, 89, '王安');
INSERT INTO `blacklist` VALUES (4, 76, '李班');
INSERT INTO `blacklist` VALUES (7, 21, '李权');
INSERT INTO `blacklist` VALUES (11, 67, '赵薪庵');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(50) NOT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_copies` int(11) NOT NULL,
  `book_pub` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publisher_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isbn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `copyright_year` int(11) NOT NULL,
  `date_receive` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_added` datetime(0) NOT NULL,
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '三体', 5, '刘慈欣', 1, '', ' 重庆出版社', '9787536692930', 2008, '', '2015-09-21 14:22:23', '新书');
INSERT INTO `book` VALUES (2, '浪潮之巅', 1, '吴军', 2, '', '电子工业出版社', '9787121139512', 2011, '', '2015-09-21 14:46:18', '新书');
INSERT INTO `book` VALUES (3, '黑客与画家', 1, 'Paul Graham ', 2, '', '人民邮电出版社', '9787115249494', 2011, '', '2015-09-21 14:49:29', '旧书');
INSERT INTO `book` VALUES (4, 'JavaScript高级程序设计（第3版）', 2, 'Nicholas C. Zakas', 1, '', '人民邮电出版社', '9787115275790', 2012, '', '2015-09-21 14:50:58', '旧书');
INSERT INTO `book` VALUES (5, 'HTTP权威指南', 4, 'David Gourley / Brian Totty ', 1, '', '人民邮电出版社', '9787115281487', 2012, '', '2015-09-21 14:52:40', '旧书');
INSERT INTO `book` VALUES (6, 'JavaScript DOM编程艺术 （第2版）', 4, ' [英]Jeremy Keith / [加] Jeffrey Sambells ', 1, '', '人民邮电出版社', '9787115249999', 2011, '', '2015-09-21 14:54:09', '旧书');
INSERT INTO `book` VALUES (7, '鸟哥的Linux私房菜 基础学习篇（第三版）', 10, ' 鸟哥 ', 1, '', ' 人民邮电出版社', '9787115226266', 2010, '', '2015-09-21 14:56:36', '旧书');
INSERT INTO `book` VALUES (8, '史蒂夫·乔布斯传', 1, ' [美] 沃尔特·艾萨克森 ', 1, '', '中信出版社', '9787508630069', 2011, '', '2015-09-21 14:58:48', '旧书');
INSERT INTO `book` VALUES (9, '写给大家看的设计书（第3版）', 9, '[美] Robin Williams', 1, '', '人民邮电出版社', '9787115188120', 2009, '', '2015-09-21 15:00:28', '旧书');
INSERT INTO `book` VALUES (10, 'Web全栈工程师的自我修养', 4, '余果 ', 1, '', '人民邮电出版社', '9787115399021', 2015, '', '2015-09-21 15:02:17', '新书');
INSERT INTO `book` VALUES (11, 'JavaScript语言精粹', 4, 'Douglas Crockford ', 1, '', ' 电子工业出版社', '9787121084379', 2009, '', '2015-09-21 15:03:27', '旧书');
INSERT INTO `book` VALUES (12, 'JavaScript权威指南(第6版)', 4, ' David Flanagan', 1, '', '机械工业出版社华章公司', '9787111376613', 2012, '', '2015-09-21 15:05:35', '旧书');
INSERT INTO `book` VALUES (13, '从0到1', 1, '彼得·蒂尔 / 布莱克·马斯特斯 ', 1, '', '中信出版股份有限公司', '9787508649719', 2015, '', '2015-09-23 13:02:12', '新书');
INSERT INTO `book` VALUES (14, '创业维艰', 8, '本·霍洛维茨 Ben Horowitz', 1, '', '中信出版社', '9787508646640', 2015, '', '2015-09-23 13:03:41', '新书');
INSERT INTO `book` VALUES (15, 'In The Plex', 1, 'Steven Levy', 1, '', 'Simon & Schuster', '9781416596585', 2011, '', '2015-09-23 13:06:51', '旧书');
INSERT INTO `book` VALUES (16, '失控', 1, '[美] 凯文·凯利', 1, '', '新星出版社', '9787513300711', 2010, '', '2015-09-23 13:08:44', '新书');
INSERT INTO `book` VALUES (17, '乌合之众：大众心理研究', 11, '(法)古斯塔夫.勒庞', 1, '', '中央编译出版社', '9787801093660', 1998, '', '2015-09-23 13:11:26', '旧书');
INSERT INTO `book` VALUES (18, '技术元素', 1, '[美] 凯文·凯利', 1, '', '电子工业出版社', '9787121167331', 2012, '', '2015-09-23 13:12:49', '新书');
INSERT INTO `book` VALUES (19, '文字设计的原理', 9, '(日)伊达千代 / (日)内藤孝彦', 2, '', '中信出版社', '9787508629919', 2011, '', '2015-09-23 14:42:28', '新书');
INSERT INTO `book` VALUES (20, '精通CSS', 2, ' [英] Andy Budd / [英] Simon Collison / [英] Cameron ', 1, '', '人民邮电出版社', '9787115226730', 2010, '', '2015-09-24 21:15:33', '新书');
INSERT INTO `book` VALUES (26, '疯狂Ajax讲义', 2, '李刚', 2, '', '电子工业出版社', '9787121084409', 2009, '', '2015-09-25 03:00:53', 'Archive');
INSERT INTO `book` VALUES (27, '用AngularJS开发下一代Web应用', 2, '格林 (Green.B.)', 1, '', '电子工业出版社', '9787121215742', 2013, '', '2015-09-25 03:07:54', '新书');
INSERT INTO `book` VALUES (28, '设计中的设计 | 全本', 9, '[日] 原研哉', 1, '', '广西师范大学出版社', '9787563394180', 2010, '', '2015-09-27 17:37:13', '新书');
INSERT INTO `book` VALUES (29, '经济学原理', 0, '曼昆', 4, '', '北京大学出版社', '9876545434378', 2013, '', '2014-08-25 00:00:00', '');
INSERT INTO `book` VALUES (30, '汇编语言', 0, '王爽', 1, '', '清华大学出版社', '5784758923733', 2014, '', '2015-06-24 00:00:00', '');
INSERT INTO `book` VALUES (31, '经济学原理', 0, '曼昆', 4, '', '北京大学出版社', '58765454343', 2018, '', '2015-06-24 00:00:00', '');
INSERT INTO `book` VALUES (33, '最年轻的科学', 0, '托马斯', 1, '', '浙江文艺出版社', '565653454534', 2013, '', '2018-11-29 00:00:00', '');
INSERT INTO `book` VALUES (39, '简爱', 0, '夏洛蒂·勃朗特', 10, '', '世界图书出版公司', '9787506261579', 2015, '', '2016-07-06 00:00:00', '');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isbn` int(25) NOT NULL,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(5) NOT NULL,
  `date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (1, '算法导论', 868979868, '林宥嘉', 83, '2018-12-03 09:05:10');
INSERT INTO `borrow` VALUES (2, '算法图解', 2147483647, '林宥嘉', 83, '2018-12-03 09:06:17');
INSERT INTO `borrow` VALUES (3, '大学英语', 787656455, '林晓橙', 77, '2018-12-21 00:00:00');
INSERT INTO `borrow` VALUES (4, '局外人', 2147483647, '王安', 22, '2018-12-21 00:00:00');
INSERT INTO `borrow` VALUES (6, '经济学原理', 2147483647, '王安', 24, '2018-12-05 00:00:00');

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ci_sessions_timestamp`(`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------
INSERT INTO `ci_sessions` VALUES ('ac509517ce49a3dc01134f89325dcc9a690f39ed', '::1', 1544276550, 0x5F5F63695F6C6173745F726567656E65726174657C693A313534343237363338333B);

-- ----------------------------
-- Table structure for column_stats
-- ----------------------------
DROP TABLE IF EXISTS `column_stats`;
CREATE TABLE `column_stats`  (
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `column_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `min_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `max_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nulls_ratio` decimal(12, 4) NULL DEFAULT NULL,
  `avg_length` decimal(12, 4) NULL DEFAULT NULL,
  `avg_frequency` decimal(12, 4) NULL DEFAULT NULL,
  `hist_size` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `hist_type` enum('SINGLE_PREC_HB','DOUBLE_PREC_HB') CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `histogram` varbinary(255) NULL DEFAULT NULL,
  PRIMARY KEY (`db_name`, `table_name`, `column_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Statistics on Columns' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for columns_priv
-- ----------------------------
DROP TABLE IF EXISTS `columns_priv`;
CREATE TABLE `columns_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`, `Column_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Column privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of columns_priv
-- ----------------------------
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Host', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'User', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Select_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Insert_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Update_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Delete_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Create_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Drop_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Reload_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Shutdown_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Process_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'File_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Grant_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'References_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Index_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Alter_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Show_db_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Super_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Create_tmp_table_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Lock_tables_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Execute_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Repl_slave_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'user', 'Repl_client_priv', '2012-06-18 17:26:21', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'tables_priv', 'Host', '2012-06-18 17:27:17', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'tables_priv', 'Db', '2012-06-18 17:27:17', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'tables_priv', 'User', '2012-06-18 17:27:17', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'tables_priv', 'Table_name', '2012-06-18 17:27:17', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'tables_priv', 'Table_priv', '2012-06-18 17:27:17', 'Select');
INSERT INTO `columns_priv` VALUES ('localhost', 'mysql', 'pma', 'tables_priv', 'Column_priv', '2012-06-18 17:27:17', 'Select');

-- ----------------------------
-- Table structure for db
-- ----------------------------
DROP TABLE IF EXISTS `db`;
CREATE TABLE `db`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`, `Db`, `User`) USING BTREE,
  INDEX `User`(`User`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Database privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of db
-- ----------------------------
INSERT INTO `db` VALUES ('%', 'test', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y');
INSERT INTO `db` VALUES ('%', 'test\\_%', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y');
INSERT INTO `db` VALUES ('localhost', 'phpmyadmin', 'pma', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N');

-- ----------------------------
-- Table structure for dx
-- ----------------------------
DROP TABLE IF EXISTS `dx`;
CREATE TABLE `dx`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `leibie` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `addtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dx
-- ----------------------------
INSERT INTO `dx` VALUES (1, '系统简介', '<p>\r\n	sdgsdgsdgsd此处文字您自己修改11333\r\n</p>', '2017-04-06 07:46:56');
INSERT INTO `dx` VALUES (2, '系统公告', '<p>\r\n	欢迎大家登陆我站，我站主要是为广大朋友精心制作的一个系统，希望大家能够在我站获得一个好心情，谢谢！\r\n</p>\r\n<p>\r\n	自强不息，海纳百川，努力学习！2214\r\n</p>', '2017-04-06 07:46:56');
INSERT INTO `dx` VALUES (3, '中心介绍', '<p>\r\n	中心介绍 &nbsp;介绍内容请您自己在后台设置即可\r\n</p>\r\n<p>\r\n	<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可</span>\r\n</p>\r\n<p>\r\n	<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可</span>\r\n</p>\r\n<p>\r\n	<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可</span></span>\r\n</p>\r\n<p>\r\n	<span><span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可</span></span></span></span></span>\r\n</p>\r\n<p>\r\n	<span><span><span><span><span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可</span></span></span></span></span>\r\n</p>', '2017-04-06 07:46:56');
INSERT INTO `dx` VALUES (4, '教学团队', '<table border=\"0\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p class=\"STYLE23\">\r\n					<strong>课程负责人 </strong>\r\n				</p>\r\n			</td>\r\n			<td>\r\n				&nbsp;\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<span class=\"STYLE47\">袁智敏</span>\r\n			</td>\r\n			<td>\r\n				<span class=\"STYLE50\">副教授</span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<img src=\"http://www.hunche0577.com/shiziduiwu/04.jpg\" width=\"200\" height=\"140\" />\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				男，汉族，（1954---），研究生学历，副教授。1982年7月毕业于杭州大学外语系，获文学士学位。2000-2001年浙江大学英语语言文学研究生班结业。2003-2005 年浙江大学高等教育研究生班结业。现为浙江旅游职业学院 学院首批学科带头人，“旅游英语”专业指导委员会副主任。主要从事应用语言学和特殊用途英语研究与英语导游、出境游领队、饭店英语教学工作。学术兼职有浙江省外文学会理事，浙江省大学生科技竞赛高职高专英语口语竞赛委员会成员，浙江省导游、出境游领队资深考评员。已发表学术论文数十篇；主编《领队英语》、《旅游英语》、《星级饭店英语》等专业教材5本；主持省级课题3项、院级课题3项。具有丰富的旅游教学与实践经验，为省内外行业知名“双师型”教师。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				&nbsp;\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<span class=\"STYLE23\">主讲老师</span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<span class=\"STYLE47\">王纯</span>\r\n			</td>\r\n			<td>\r\n				<span class=\"STYLE52\">副译审</span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<img src=\"http://www.hunche0577.com/shiziduiwu/02.jpg\" width=\"200\" height=\"142\" />\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				男，汉族（1955年―），本科学历，副译审。现为浙江职业学院外语系教师，1982年2月毕业于杭州大学外语系，获文学士学位，任浙江省海外旅游公司英语部经理。1995年评为副译审；1996年获得国家级高级英语导游员资格。自1988年起先后被浙江省及杭州市旅游局聘任为国家级导游（英语、法语、普通话）资格培训师及考评员；浙江省旅游局出国领队资格培训师及考评员；浙江省中级导游员资格考评委员会委员；浙江省专业技术人员中级职称评审委员会委员。在外事活动中多次担任省市主要领导及省旅游局领导的英语口译。2004年调入浙江旅游职业学院担任专业英语课程老师。2007年被评为学院优秀教师，获2007年奖教基金。现任浙江旅游职业学院“导游专业”及“旅游英语”专业指导委员会委员。曾多次担任省市导游大赛评委，为省内外行业知名“双师型”教师。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<span class=\"STYLE38\"></span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<span class=\"STYLE47\">王 君</span>\r\n			</td>\r\n			<td>\r\n				<span class=\"STYLE52\">副教授</span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<span class=\"STYLE38\"><img src=\"http://www.hunche0577.com/shiziduiwu/worker01.jpg\" width=\"200\" height=\"150\" /></span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				女，（1964---）硕士，教授 。1986年毕业于西安外国语大学英语专业，获文学学士学位。2006年10月获浙江大学硕士学位。学院第二批学科带头人，“旅游英语”专业指导委员会委员。主要讲授旅游英语和饭店英语等课程，主编《景区景点实用英语》、高职高专《大学英语》等12部专业教材，主持省旅游局和省教育厅课题2项,主持、参与院级课题3项。已发表《中国审美情趣与旅游》、《旅游英语专业人才培养模式和课程结构的理论与实践研究》等论文20余篇。多次担任各项英语比赛的策划与评委，被浙江省旅游局聘任为出国领队资格考评员，并邀为省内多家知名旅行社和饭店进行专业英语培训。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<span class=\"STYLE38\"></span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<span class=\"STYLE47\">余益辉</span>\r\n			</td>\r\n			<td>\r\n				<span class=\"STYLE52\">讲师</span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<img src=\"http://www.hunche0577.com/shiziduiwu/worker02.jpg\" width=\"200\" height=\"135\" />\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				男，（1965――），讲师，中级导游。本科学历。1984年-1988年就读于北京外国语学院英语系，获文学士学位。1988年-2003年在浙江省中国国际旅行社英语中心从事涉外旅游接待与销售工作，多次受到领导、同事和英美旅游者的好评，为浙江省知名英语导游。2003年7月调入浙江旅游职业学院外语系任教。主要从事旅游英语，出境领队英语教学，擅长导游实践教学。 著有论文《浙江省佛教文化旅游市场研究》等数篇，参编教材2本。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				&nbsp;\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2017-04-06 07:46:56');
INSERT INTO `dx` VALUES (5, '联系我们', '&nbsp; &nbsp;欢迎来到xxxxx有限公司<br />\r\n<br />\r\n在您对于我们公司产品购买过程中有任何问题可以通过如下方式和我们进行沟通协商：<br />\r\n<br />\r\n1. 电子邮箱： xxxxx@gmail.com<br />\r\n<br />\r\n2. QQ号码： &nbsp;xxxxxx<br />\r\n<br />\r\n3. 电 &nbsp; &nbsp; 话： &nbsp;020-xxxxx （产品售前咨询、报价）<br />\r\n<br />\r\n020-xxxxxxxxx-815<br />\r\n<br />\r\n4. 传 &nbsp; &nbsp; &nbsp;真： 020-xxxxxx-805<br />\r\n<div>\r\n	<br />\r\n</div>', '2017-04-06 06:20:22');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(141) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime(0) NULL DEFAULT NULL,
  `interval_value` int(11) NULL DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `modified` timestamp(0) NOT NULL,
  `last_executed` datetime(0) NULL DEFAULT NULL,
  `starts` datetime(0) NULL DEFAULT NULL,
  `ends` datetime(0) NULL DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','IGNORE_BAD_TABLE_OPTIONS','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) UNSIGNED NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `body_utf8` longblob NULL,
  PRIMARY KEY (`db`, `name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Events' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for func
-- ----------------------------
DROP TABLE IF EXISTS `func`;
CREATE TABLE `func`  (
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT 0,
  `dl` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'User defined functions' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for general_log
-- ----------------------------
DROP TABLE IF EXISTS `general_log`;
CREATE TABLE `general_log`  (
  `event_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `user_host` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thread_id` bigint(21) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `command_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `argument` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = CSV CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'General log' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for host
-- ----------------------------
DROP TABLE IF EXISTS `host`;
CREATE TABLE `host`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`, `Db`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Host privileges;  Merged with database privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for index_stats
-- ----------------------------
DROP TABLE IF EXISTS `index_stats`;
CREATE TABLE `index_stats`  (
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `prefix_arity` int(11) UNSIGNED NOT NULL,
  `avg_frequency` decimal(12, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`db_name`, `table_name`, `index_name`, `prefix_arity`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Statistics on Indexes' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jieyuejilu
-- ----------------------------
DROP TABLE IF EXISTS `jieyuejilu`;
CREATE TABLE `jieyuejilu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tushudaima` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `tushumingcheng` varchar(300) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `tushufenlei` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `tushuzuozhe` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `kucun` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `jieyongshuliang` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `yujietianshu` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `shifouguihuan` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `guihuanshijian` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `beizhu` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `jieyueren` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `issh` varchar(2) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jieyuejilu
-- ----------------------------
INSERT INTO `jieyuejilu` VALUES (6, '003', 'grofgb', '科教类', 'trer', '22', '2', '23', '是', '2013-01-10 13:41:26', 'feew', '555', '2017-04-06 10:51:02', '是');
INSERT INTO `jieyuejilu` VALUES (7, '006', 'gregrehre', '计算机类', 'fwegwe', '44', '5', '7', '是', '2013-01-10 14:11:02', 'gewrgre', 'ggg', '2017-04-06 10:51:02', '是');
INSERT INTO `jieyuejilu` VALUES (8, 'hrth', 'rehrejre', '计算机类', 'hrthtr', '1', '1', '5', '是', '2013-02-05 14:12:38', '1', '555', '2017-04-06 10:51:02', '是');
INSERT INTO `jieyuejilu` VALUES (9, '007', 'ehrehre', '文艺类', 'wegewg', '44', '3', '8', '是', '2013-03-26 14:45:48', 'ffwe', '666', '2017-04-06 10:51:02', '是');
INSERT INTO `jieyuejilu` VALUES (10, '6488', 'D图书', '计算机类', 'ewgewg', '78', '1', '5', '是', '2015-04-27 19:30:33', 'wefewfewgw', '666', '2017-04-06 10:51:02', '是');
INSERT INTO `jieyuejilu` VALUES (11, '7658', 'erhrher', '计算机类', 'fewgew', '33', '2', '6', '是', '2015-05-26 15:33:53', 'fewegw', '6574', '2017-04-06 03:33:19', '是');
INSERT INTO `jieyuejilu` VALUES (12, '6488', 'D图书', '计算机类', 'ewgewg', '78', '5', '5', '是', '2016-03-26 20:27:25', 'hihu', '555', '2017-04-06 08:26:46', '是');
INSERT INTO `jieyuejilu` VALUES (13, '009', 'ggergre', '计算机类', 'htrhtr', '444', '2', '6', '是', '2016-03-26 20:30:50', 'fewgwe', 'fwfw', '2017-04-06 08:30:12', '是');
INSERT INTO `jieyuejilu` VALUES (14, '010', 'gerfd', '计算机类', 'grtrw', '33', '1', '5', '是', '2016-03-26 20:38:00', 'gwegwe', 'bgbg', '2017-04-06 08:37:25', '是');
INSERT INTO `jieyuejilu` VALUES (15, '6454', 'hrerege', '计算机类', 'htrhtr', '444', '3', '5', '是', '2016-05-06 02:38:48', 'wegwegw', 'ww', '2017-04-06 02:38:04', '是');
INSERT INTO `jieyuejilu` VALUES (16, '6454', 'hrerege', '计算机类', 'htrhtr', '444', '2', '8', '是', '2017-04-06 11:36:51', 'gwgew', 'gggg', '2017-04-06 11:36:15', '是');

-- ----------------------------
-- Table structure for liuyanban
-- ----------------------------
DROP TABLE IF EXISTS `liuyanban`;
CREATE TABLE `liuyanban`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `zhaopian` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `xingming` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `liuyan` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `huifu` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of liuyanban
-- ----------------------------
INSERT INTO `liuyanban` VALUES (1, '555', 'uploadfile/13392103902z4y.jpg', '何升高', 'ddd', '2017-04-06 01:26:57', NULL);
INSERT INTO `liuyanban` VALUES (2, 'gggg', 'uploadfile/1491449735fhb7.jpg', 'gggg', 'fewfwe', '2017-04-06 11:36:05', 'fewfwe');

-- ----------------------------
-- Table structure for ndb_binlog_index
-- ----------------------------
DROP TABLE IF EXISTS `ndb_binlog_index`;
CREATE TABLE `ndb_binlog_index`  (
  `Position` bigint(20) UNSIGNED NOT NULL,
  `File` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `epoch` bigint(20) UNSIGNED NOT NULL,
  `inserts` int(10) UNSIGNED NOT NULL,
  `updates` int(10) UNSIGNED NOT NULL,
  `deletes` int(10) UNSIGNED NOT NULL,
  `schemaops` int(10) UNSIGNED NOT NULL,
  `orig_server_id` int(10) UNSIGNED NOT NULL,
  `orig_epoch` bigint(20) UNSIGNED NOT NULL,
  `gci` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`epoch`, `orig_server_id`, `orig_epoch`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pinglun
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `wenzhangID` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `pinglunneirong` varchar(1000) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `pinglunren` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `addtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `biao` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `pingfen` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES (1, '9', 'fwefweg', '555', '2017-04-06 01:07:59', '', 3);
INSERT INTO `pinglun` VALUES (2, '9', 'htrhrt', '555', '2017-04-06 01:09:10', 'tushuxinxi', 1);
INSERT INTO `pinglun` VALUES (3, '9', 'htrjr', '555', '2017-04-06 01:26:24', 'tushuxinxi', 2);
INSERT INTO `pinglun` VALUES (4, '10', 'fewfwe', 'gggg', '2017-04-06 11:36:00', 'tushuxinxi', 4);

-- ----------------------------
-- Table structure for plugin
-- ----------------------------
DROP TABLE IF EXISTS `plugin`;
CREATE TABLE `plugin`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'MySQL plugins' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for proc
-- ----------------------------
DROP TABLE IF EXISTS `proc`;
CREATE TABLE `proc`  (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `specific_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `language` enum('SQL') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(141) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `modified` timestamp(0) NOT NULL,
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','IGNORE_BAD_TABLE_OPTIONS','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `body_utf8` longblob NULL,
  PRIMARY KEY (`db`, `name`, `type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Stored Procedures' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for procs_priv
-- ----------------------------
DROP TABLE IF EXISTS `procs_priv`;
CREATE TABLE `procs_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Grantor` char(141) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`Host`, `Db`, `User`, `Routine_name`, `Routine_type`) USING BTREE,
  INDEX `Grantor`(`Grantor`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Procedure privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for proxies_priv
-- ----------------------------
DROP TABLE IF EXISTS `proxies_priv`;
CREATE TABLE `proxies_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT 0,
  `Grantor` char(141) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`Host`, `User`, `Proxied_host`, `Proxied_user`) USING BTREE,
  INDEX `Grantor`(`Grantor`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'User proxy privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of proxies_priv
-- ----------------------------
INSERT INTO `proxies_priv` VALUES ('localhost', 'root', '', '', 1, '', '2013-04-05 21:35:08');

-- ----------------------------
-- Table structure for roles_mapping
-- ----------------------------
DROP TABLE IF EXISTS `roles_mapping`;
CREATE TABLE `roles_mapping`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Role` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Admin_option` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  UNIQUE INDEX `Host`(`Host`, `User`, `Role`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Granted roles' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for servers
-- ----------------------------
DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers`  (
  `Server_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Host` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Username` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Password` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT 0,
  `Socket` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Wrapper` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Owner` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'MySQL Foreign Servers table' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(11) NOT NULL,
  `site_title` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `timezone` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `recaptcha` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `theme` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'Dnato System Login', 'Asia/Makassar', 'no', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cosmo/bootstrap.min.css');

-- ----------------------------
-- Table structure for shangpinleibie
-- ----------------------------
DROP TABLE IF EXISTS `shangpinleibie`;
CREATE TABLE `shangpinleibie`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leibie` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shangpinleibie
-- ----------------------------
INSERT INTO `shangpinleibie` VALUES (13, '科教类', '2017-04-06 10:51:02');
INSERT INTO `shangpinleibie` VALUES (14, '文艺类', '2017-04-06 10:51:02');
INSERT INTO `shangpinleibie` VALUES (15, '计算机类', '2017-04-06 10:51:02');
INSERT INTO `shangpinleibie` VALUES (16, '漫画类', '2017-04-06 10:51:02');

-- ----------------------------
-- Table structure for slow_log
-- ----------------------------
DROP TABLE IF EXISTS `slow_log`;
CREATE TABLE `slow_log`  (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `sql_text` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thread_id` bigint(21) UNSIGNED NOT NULL,
  `rows_affected` int(11) NOT NULL
) ENGINE = CSV CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Slow log' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for table_stats
-- ----------------------------
DROP TABLE IF EXISTS `table_stats`;
CREATE TABLE `table_stats`  (
  `db_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cardinality` bigint(21) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`db_name`, `table_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Statistics on Tables' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tables_priv
-- ----------------------------
DROP TABLE IF EXISTS `tables_priv`;
CREATE TABLE `tables_priv`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(141) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`) USING BTREE,
  INDEX `Grantor`(`Grantor`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Table privileges' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for time_zone
-- ----------------------------
DROP TABLE IF EXISTS `time_zone`;
CREATE TABLE `time_zone`  (
  `Time_zone_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zones' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for time_zone_leap_second
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_leap_second`;
CREATE TABLE `time_zone_leap_second`  (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Leap seconds information for time zones' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for time_zone_name
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_name`;
CREATE TABLE `time_zone_name`  (
  `Name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zone names' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for time_zone_transition
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_transition`;
CREATE TABLE `time_zone_transition`  (
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Time_zone_id`, `Transition_time`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zone transitions' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for time_zone_transition_type
-- ----------------------------
DROP TABLE IF EXISTS `time_zone_transition_type`;
CREATE TABLE `time_zone_transition_type`  (
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  `Transition_type_id` int(10) UNSIGNED NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT 0,
  `Is_DST` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Abbreviation` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`, `Transition_type_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time zone transition types' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens`  (
  `id` int(11) NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_id` int(10) NOT NULL,
  `created` date NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tushuxinxi
-- ----------------------------
DROP TABLE IF EXISTS `tushuxinxi`;
CREATE TABLE `tushuxinxi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tushudaima` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `tushumingcheng` varchar(300) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `tushufenlei` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `tushuzuozhe` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `chubanshe` varchar(300) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `chubanriqi` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `yeshu` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `jiage` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `tupian` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `heshinianlingduan` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `dianjilv` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `beizhu` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tushuxinxi
-- ----------------------------
INSERT INTO `tushuxinxi` VALUES (2, '001', 'gewgewhw', '计算机类', 'wgewgw', 'gewhw', '2015-05-09', '33', '42', 'uploadfile/14589951578oy7.gif', '1-7', '1', 'fewgew', '2017-04-06 03:28:40');
INSERT INTO `tushuxinxi` VALUES (3, '002', 'ggogre', '漫画类', 'hreher', 'hrehre', '2015-05-09', '44', '44', 'uploadfile/1458995148vcuy.jpg', '8-16', '33', 'fgewgegw', '2017-04-06 03:28:40');
INSERT INTO `tushuxinxi` VALUES (4, '003', 'grofgb', '科教类', 'trer', 'hrehre', '2015-05-09', '522', '23', 'uploadfile/14589951384i18.jpg', '1-7', '22', 'wegw', '2017-04-06 03:28:40');
INSERT INTO `tushuxinxi` VALUES (5, '004', 'ooicjvds', '计算机类', 'gthr', 'jtrjtrjtr', '2015-05-09', '225', '5', 'uploadfile/14589951269ajc.jpg', '1-7', '22', 'fewgwe', '2017-04-06 03:28:40');
INSERT INTO `tushuxinxi` VALUES (6, 'hrth', 'rehrejre', '计算机类', 'hrthtr', 'hrtjtr', '2015-05-09', '433', '33', 'uploadfile/1458995115v8vg.jpg', '17-40', '1', 'gewgwe', '2017-04-06 03:28:40');
INSERT INTO `tushuxinxi` VALUES (7, '006', 'gregrehre', '计算机类', 'fwegwe', 'gwegew', '2015-05-09', '44', '33', 'uploadfile/14589951061iiz.jpg', '17-40', '44', 'fwegwegw', '2017-04-06 03:28:40');
INSERT INTO `tushuxinxi` VALUES (8, '007', 'ehrehre', '文艺类', 'wegewg', 'whewhew', '2015-05-09', '44', '33', 'uploadfile/14589950952m9k.jpg', '17-40', '44', 'fgewgew', '2017-04-06 03:28:40');
INSERT INTO `tushuxinxi` VALUES (9, '6488', 'D图书', '计算机类', 'ewgewg', 'gewhhwehw', '2015-04-20', '80', '33', 'uploadfile/14589950876quh.jpg', '17-40', '78', 'drtdtrdr', '2017-04-06 03:28:40');
INSERT INTO `tushuxinxi` VALUES (10, '009', 'ggergre', '计算机类', 'htrhtr', 'fwweg', '2016-03-21', '55', '2', 'uploadfile/14589953655ifc.gif', '8-16', '444', 'gewhwe', '2017-04-06 08:29:30');
INSERT INTO `tushuxinxi` VALUES (11, '010', 'gerfd', '计算机类', 'grtrw', '43erger', '2016-03-28', '54', '33', 'uploadfile/1458995810cfjv.jpg', '17-40', '33', 'ewgew', '2017-04-06 08:36:55');
INSERT INTO `tushuxinxi` VALUES (12, '6454', 'hrerege', '计算机类', 'htrhtr', '43erger', '2016-05-02', '15', '3580', 'uploadfile/1462473443i3k7.jpg', '8-16', '444', 'gewhew', '2017-04-06 02:37:28');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `Host` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_updates` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_connections` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_user_connections` int(11) NOT NULL DEFAULT 0,
  `plugin` char(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `authentication_string` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password_expired` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `is_role` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `default_role` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `max_statement_time` decimal(12, 6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`Host`, `User`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Users and global privileges' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('localhost', 'root', '*81F5E21E35407D884A6CD4A731AEBFB6AF209E1B', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', 0, 0, 0, 0, '', '', 'N', 'N', '', 0.000000);
INSERT INTO `user` VALUES ('127.0.0.1', 'root', '*81F5E21E35407D884A6CD4A731AEBFB6AF209E1B', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', 0, 0, 0, 0, '', '', 'N', 'N', '', 0.000000);
INSERT INTO `user` VALUES ('::1', 'root', '*81F5E21E35407D884A6CD4A731AEBFB6AF209E1B', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', 0, 0, 0, 0, '', '', 'N', 'N', '', 0.000000);
INSERT INTO `user` VALUES ('localhost', '', '', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', '', '', '', '', 0, 0, 0, 0, '', '', 'N', 'N', '', 0.000000);
INSERT INTO `user` VALUES ('localhost', 'pma', '', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', '', '', '', '', 0, 0, 0, 0, '', '', 'N', 'N', '', 0.000000);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isdelete` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '赵云', '123', 0);
INSERT INTO `user_info` VALUES (2, 'root', 'root', 0);
INSERT INTO `user_info` VALUES (3, '123', '321', 0);

-- ----------------------------
-- Table structure for xinwentongzhi
-- ----------------------------
DROP TABLE IF EXISTS `xinwentongzhi`;
CREATE TABLE `xinwentongzhi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `leibie` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `neirong` text CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL,
  `tianjiaren` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `addtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `shouyetupian` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dianjilv` int(11) NULL DEFAULT 1,
  `zhaiyao` varchar(800) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 221 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xinwentongzhi
-- ----------------------------
INSERT INTO `xinwentongzhi` VALUES (207, '4款休闲卫衣混搭 实用搭配穿不腻', '站内新闻', '<STRONG>&nbsp;卫衣无疑是时尚圈中生命力最强的元素之一。它简单而个性鲜明，无论T台还是街头，卫衣装似乎从未被抛离出流行的步履之外。当你面对芸芸衣饰而手足无措时，一条简单的卫衣总是及时将你搭救。</STRONG>\r\n<P align=right><A href=\"http://women.sohu.com/20110223/n279464952_1.shtml\"><STRONG><FONT color=#004276>下一页：卫衣+leggings</FONT></STRONG></A></P>\r\n<TABLE cellSpacing=0 cellPadding=0 align=center border=0>\r\n<TBODY>\r\n<TR>\r\n<TD align=middle>\r\n<TABLE cellSpacing=0 cellPadding=0 border=0>\r\n<TBODY>\r\n<TR>\r\n<TD><A href=\"http://women.sohu.com/20110223/n279464952_1.shtml\" target=_blank><FONT color=#004276><IMG alt=\"\" src=\"http://photocdn.sohu.com/20110222/Img279465364.jpg\" align=middle></FONT></A></TD></TR></TBODY></TABLE></TD></TR>\r\n<TR>\r\n<TD style=\"FONT-SIZE: 12px\" align=middle scw_ig=\"yes\"><FONT color=#004276></FONT></TD></TR></TBODY></TABLE>\r\n<P><STRONG>&nbsp;&nbsp;&nbsp; 小编点评：</STRONG>2月早晚温差还是有点大，卫衣单穿还是会感觉微凉，混搭羽绒马甲，既温暖又可爱。牛仔铅笔裤搭配及踝靴，大方又利落。</P>\r\n<P>&nbsp;</P>\r\n<TABLE cellSpacing=0 cellPadding=0 align=center border=0>\r\n<TBODY>\r\n<TR>\r\n<TD align=middle>\r\n<TABLE cellSpacing=0 cellPadding=0 border=0>\r\n<TBODY>\r\n<TR>\r\n<TD><A href=\"http://women.sohu.com/20110223/n279464952_1.shtml\" target=_blank><IMG alt=\"\" src=\"http://photocdn.sohu.com/20110222/Img279465365.jpg\" align=middle></A></TD></TR></TBODY></TABLE></TD></TR>\r\n<TR>\r\n<TD style=\"FONT-SIZE: 12px\" align=middle scw_ig=\"yes\"></TD></TR></TBODY></TABLE>\r\n<P><STRONG>&nbsp;&nbsp;&nbsp; 小编点评：</STRONG>铅笔裤搭配系带高跟短靴是绝佳的组合，可以拉长腿部的线条，让你变高挑美女。黑灰色卫衣外搭配翻领短外套，扁包与整体搭配形成高度统一，一副标准潮人装扮！ <BR>\r\n<TABLE cellSpacing=0 cellPadding=0 align=center border=0>\r\n<TBODY>\r\n<TR>\r\n<TD align=middle>\r\n<TABLE cellSpacing=0 cellPadding=0 border=0>\r\n<TBODY>\r\n<TR>\r\n<TD><A href=\"http://women.sohu.com/20110222/n279464952.shtml\" target=_blank><IMG alt=\"\" src=\"http://photocdn.sohu.com/20110222/Img279465366.jpg\" align=middle></A></TD></TR></TBODY></TABLE></TD></TR>\r\n<TR>\r\n<TD style=\"FONT-SIZE: 12px\" align=middle scw_ig=\"yes\"></TD></TR></TBODY></TABLE></P>\r\n<P><STRONG>&nbsp;&nbsp;&nbsp; 小编点评：</STRONG>明黄色的卫衣搭配牛仔裤动感活力十足。素色针织长围巾很百搭，衣橱里少了它，会错过很多精彩哦。</P>\r\n<P>&nbsp;</P>\r\n<P>\r\n<TABLE cellSpacing=0 cellPadding=0 align=center border=0>\r\n<TBODY>\r\n<TR>\r\n<TD align=middle>\r\n<TABLE cellSpacing=0 cellPadding=0 border=0>\r\n<TBODY>\r\n<TR>\r\n<TD><A href=\"http://women.sohu.com/20110222/n279464952.shtml\" target=_blank><IMG alt=\"\" src=\"http://photocdn.sohu.com/20110222/Img279465367.jpg\" align=middle></A></TD></TR></TBODY></TABLE></TD></TR>\r\n<TR>\r\n<TD style=\"FONT-SIZE: 12px\" align=middle scw_ig=\"yes\"></TD></TR></TBODY></TABLE></P>\r\n<P><STRONG>&nbsp;&nbsp;&nbsp; 小编点评：</STRONG>在冬日里要可爱又充满活力？首选字母帽衫+leggings和雪地靴的搭配。毛领外套外套起到调适作用，不让卫衣夺去你的女人味。</P>', 'hsg', '2017-04-06 06:35:58', 'uploadfile/1340069838pb96.jpg', 1, NULL);
INSERT INTO `xinwentongzhi` VALUES (208, '大棚“穿衣”保暖（图）', '站内新闻', '<P align=center><IMG src=\"http://pic2.66wz.com/0/10/36/68/10366894_889890.jpg\" border=0> </P>\r\n<P></P><!--advertisement code begin--><!--advertisement code end-->\r\n<P>&nbsp;&nbsp;&nbsp; 1月20日消息：近日，冷空气不断影响我县，农民们积极做好农作物和畜牧保暖防冻工作，减少低温气候带来的影响。图为灵溪镇渎浦办事处的农民在加固西红柿种养大棚。（李士明/摄） <!--function: content() parse end  0ms cost! --></P>', 'hsg', '2017-04-06 06:35:58', 'uploadfile/13400699440gw0.jpg', 2, NULL);
INSERT INTO `xinwentongzhi` VALUES (209, '从卡尔丹顿看中国品牌服装国际化', '站内新闻', '&nbsp;&nbsp;&nbsp; 日前，国内知名高端服装品牌卡尔丹顿被部分媒体报道为所谓假洋品牌，这个稳居高端服装品牌行列已达10余年的卡尔丹顿在受到各方质疑的同时，也相对影射出了中国服装行业的国际化硬伤。\r\n<P>　<STRONG>　“洋商标”或“民族商标”</STRONG></P>\r\n<P>　　记者了解到，卡尔丹顿的品牌拥有者为一名中国香港商人，该品牌旗下服饰主要针对追求内在、奢华品质的成功人士，近十年在市场上备受中国成熟男士青睐。然而，卡尔丹顿虽为在中国、意大利注册品牌，但其服装主要生产地及主销地均在国内，而因此受到有些媒体的质疑。</P>\r\n<P>　　“实际上，服装届像卡尔丹顿这种非外国人拥有的境外品牌是普遍现象，例如美国著名的婚纱品牌“VERA WANG”实则中国人创立的，甚至我们熟悉的CATELO鳄鱼，BOSINI堡狮龙，JEAN WEST真维斯，JORDANO佐丹奴等境外品牌，其品牌拥有者皆为中国人士。”</P>\r\n<P>　　据悉，中国已成为一个“世界工厂“，在现有的全球化大背景下，包括耐克、阿迪达斯、德国大众等等国际知名品牌，各行业各品牌多数产品均产自国内。因此，一个品牌高低是取决于品牌的设计风格、使用人群、产品品质、服务质量及企业的运营模式等方面，而不是由其品牌持有人是否为中国人以及外销数量多少所决定，也正是这种正确品牌发展理念的缺失导致中国与欧洲时装差距甚大的关键因素。</P>\r\n<P>　　另外，销售区域在哪里，只是一个观察方面。国际化品牌经营，还要看他整个的生产经营活动中，有多少环节涉及国际化。类似卡尔丹顿这样的高端品牌，其面料来源、设计团队、生产合作工厂，早已经不局限于国内，而是直接从意大利甚至全球采购。在经济全球化的背景下，无论是国外名牌还是中国名牌，都是用全球资源整合的角度来悉心经营品牌，以此来满足顾客日益提升的消费需求。</P>', 'hsg', '2017-04-06 06:35:58', 'uploadfile/1340069970gp0a.jpg', 1, NULL);
INSERT INTO `xinwentongzhi` VALUES (210, '提升面料设计师的幸福指数', '站内新闻', '　2011中国国际面料设计大赛启动仪式上，“面料设计师的幸福指数”话题成为专家和学者共同探讨的话题。\r\n<P>　　<STRONG>面料设计师的幸福指数</STRONG></P>\r\n<P><STRONG>　　不乐观</STRONG></P>\r\n<P>　　两年前，国内一知名的服装设计师前来柯桥考察，发出感叹：丰富的面料是我们服装设计师幸福指数的保证。然而，同是时尚产业的创意工作，人们却不难发现，相比服装设计界，面料设计师的幸福指数却远没有服装设计师来得乐观：他们总是深居简出，只是为他人做嫁衣，极少有机会走上风光的舞台。</P>\r\n<P>　　正因如此，造成了面料设计行业一个不容忽视的现象：设计不能与面料制造规模相匹配，“设计是一种生产力”更多地只停留于宣传。</P>\r\n<P>　　“面料设计师的幸福指数一定程度上衡量着纺织产业发展能力，”国家纺织工业协会副会长孙瑞哲说：“什么时候面料设计师的幸福指数提升了，我们设计产业就发展了。”</P>\r\n<P>　　<STRONG>保护不足</STRONG></P>\r\n<P><STRONG>　　是创意产业之欠缺</STRONG></P>\r\n<P>　　与制造业相比，设计产业相对落后，这一方面缘于对知识产权保护的不足，另一方面，则是对面料创意能力的忽视。</P>\r\n<P>　　“知识产权保护不够，造成企业对创意投入不足。”在孙瑞哲看来，一个地方知识产权保护得越好，创新和创意的能力就越强。</P>\r\n<P>　　同时，由于企业家本身的观念，大部分面料企业满足于制造或简单的拷贝，更多地视设计人才为人力成本，而不是人才资本。是成本还是资本，这只是一个观念，然而企业家这个观念的改变，却能改变一个行业发展的环境。</P>\r\n<P>　　纺织工业协会会长杜钰洲说，面料设计是纺织产业升级的第一生产力。近几年来，柯桥诸多纺织品贸易公司也深刻领悟了这一观点。他们通过加强面料设计，树立自己设计品牌，使自己从行业中脱颖而出。然而，从点到面上的扩展，却还有一个漫长的过程。</P>', 'hsg', '2017-04-06 06:35:58', 'uploadfile/1340070002x47w.jpg', 1, NULL);
INSERT INTO `xinwentongzhi` VALUES (211, '森马服饰今天上市', '站内新闻', '&nbsp;&nbsp;&nbsp;&nbsp;3月10日晚，浙江森马服饰股份有限公司在深圳举行上市庆祝酒会，庆祝森马服饰（交易代码002563）今天（3月11日）在深交所敲钟上市。 \r\n<P>　　森马服饰此次发行数量为7000万股，其中网上发行5600万股，发行价每股67元。据介绍，3月2日公开发行，森马新股申购网上冻结资金1498.15亿元，网下冻结资金69.41亿元，合计冻结资金1567.56亿元，网上中签率为2.50%。今天上市后，若按发行价67元计算，公司市值高达448.9亿元，将成为我市市值最大的上市公司。</P>\r\n<P>　　据悉，本次募集资金，将用于购买63家店铺和信息化建设，其中51家合作加盟店将借助加盟商的力量来充分整合资源，加强对渠道的控制力和对品牌的影响力，提高公司品牌在两大细分市场的份额。</P>\r\n<P>　　森马服饰前身为温州森马童装，成立于2002年2月5日，于2007年7月2日整体变更设立为股份有限公司。其从事于休闲服饰和儿童服饰的经营，主营业务包括服饰设计与开发、外包生产、服饰营销和分销，拥有森马休闲服饰和巴拉巴拉儿童服饰两大知名品牌。近年来，公司发展势头强劲，截至去年6月30日，森马品牌的加盟店铺达到3433家，直营店铺达到123家；巴拉巴拉品牌的加盟店铺达到2136家，直营店铺达到117家。</P>\r\n<P>　　森马服饰股份有限公司常务副总裁刘丹静表示，森马的直营比例（10%不到）与同行其他上市公司相比算是比较低的（有的甚至高达40%），而且公司的生产是外包的，供应商有405家（其中，森马248家，巴拉巴拉157家），有今天这样的发展速度，不得不归功于品牌与代理商、供应商之间长期、共赢的合作模式。</P>\r\n<P>　　3月10日晚，在森马上市庆祝酒会现场，温州市人民政府与深圳证券交易举行了“企业上市培育工作合作备忘录”签约仪式。</P>\r\n<P>　　森马服饰是我市第八家上市企业。浙江证监局局长王宝桐说，温州市上市企业数量与温州市的经济地发展速度是不匹配的，未来五年到八年时间发展到30-50家上市公司，才是与温州经济发展相匹配的。市委副书记、市长赵一德表示，以森马服饰的上市为标志，今后温州企业上市将进入一个崭新的发展阶段。相信在不久的将来，上市企业中将会形成强有力的“温州板块”。（记者 朱庆荣）</P>\r\n<META name=ContentEnd><!--ZJEG_RSS.content.end--><!--<$[信息内容]>end-->', 'hsg', '2017-04-06 06:35:58', 'uploadfile/1340070029dc64.jpg', 1, NULL);
INSERT INTO `xinwentongzhi` VALUES (212, '南通家纺的“快乐老家”', '站内新闻', '　今年两会依旧关注“民生”。家纺是劳动密集型产业，家纺人的民生问题解决得怎样？幸福指数多高？生产基地和专业市场可见一斑。据初步统计，南通大约有20万家纺产业大军，近千个家纺商标，两大专业市场里有数千个经营户，叫得响的品牌企业有数十个。行走在海门、通州两大家纺城中，招聘广告随处可见，路人行色匆匆，车辆川流不息，一路繁荣的景象。与店铺里的营业员、掌柜的聊一聊，他们诉说：“生意马马虎虎，但是招工难、原材料涨价……”满足和淡定背后有些无奈和迷茫。这繁荣与无奈的反差中，我们不禁要问：谁是南通家纺的“快乐老家”？\r\n<P align=left><STRONG>　　风调雨顺好扎根</STRONG></P>\r\n<P>　　南通人一般比较谦逊，回答这个问题大多都说：“你自己看嘛，要我说打工的比招工的快乐，我们这里连缝纫工都是香饽饽，人才更是抢手。”</P>\r\n<P>　　来自武汉的装饰设计师张建喜无疑是个幸福的人。他在电话中与朋友聊：“别到处跑了，南通这里挺好的。”学设计的他大学毕业后实习过许多工作，一旦踏入了家纺行业，便在南通落地生根。娶妻、生子，还参股了勤+缘装饰设计公司，与董事长于春荣齐心协力为南通家纺市场的企业、经营户做展厅的装饰装修，勤+缘装饰设计的品牌在市场得到迅速推广。张建喜深有感触地说：“这里气候宜人、治安好、人不复杂；大城市节奏快，压力大，幸福指数低。”</P>\r\n<P>　　南通是座位于长江入海口北岸的中小型城市，直至21世纪初苏通大桥通车，才将此小城与外界，特别是上海、苏南紧密联系起来。虽然近年来经济发展快速，外来人口涌入，但是，本土民风淳朴依旧。南通纺织、家纺产业的发展，既蕴含着男耕女织的农耕文化的浸润，又融入先贤张謇立志“实业救国”的崇高理想，取得了“纺织之乡”现当代纺织业的巨大成就。</P>\r\n<P>　　地理位置和人文环境造就了南通的江海文化。新世纪，南通人提炼出“包容会通，敢为人先”的南通精神，促使地域文化实现从“江”到“海”的拓展，其中，南通家纺人便是一群勇敢的实践者。一大批“富一代”掌门人在南通丰厚的纺织产业基础上寻求发展，在改革开放、市场经济蓬勃发展的机遇里，勤劳勇敢，锐意进取，善于学习，成为南通家纺产业发展的引领者和推动着。他们在开拓市场方面，内外销并举，内销有品牌，外销有商帮，本地人富裕起来；在招商引资方面，浙江、福建、广东、山东、辽宁等民资、民企纷纷入城并形成了浙江家纺商会和东北家纺商会，外地人在这里成功“掘金”。本刊79期中报道的《“粤欣雅”在南通家纺城幸福创业》的企业、经营户有很多很多。同时，通州、海门家纺商会与外地商人在竞争中合作、在合作中竞争，稳中求进的苏商与快速灵活的浙商互相促进，成为通州川姜和海门三星从“名镇”到“新城”升级的有生力量。</P>', 'hsg', '2017-04-06 06:35:58', '', 1, NULL);
INSERT INTO `xinwentongzhi` VALUES (213, '浅谈“薄衣御寒”的冬季养生之道', '站内新闻', '冬季养生保健，“薄衣御寒”也是不错的养生保健之道。下面，小编为大家介绍冬季薄衣御寒的具体注意事项，关注养生保健的你千万不要错过。\r\n<P>　　●过度保暖反而会降低身体的免疫力，让人长期处于“温室花朵”的状态，变得脆弱而易病。</P><!--advertisement code begin--><!--advertisement code end-->\r\n<P>　　●“薄衣御寒”也属于养生之道，体质热者、小儿可适当挨冻，但要注意耐寒的同时别受风寒。</P>\r\n<P>　　日子一天天流逝，眼见已悄悄跨过农历“大雪”，朝着“冬至”一步步迈进。</P>\r\n<P>　　防寒保暖??这是西医尤其是心血管科、急诊科、儿科、呼吸科医生们每年冬季必要跟病患们反复念叨的四字箴言。然而也有专家提出，对于体质偏热者，或是没有心血管问题在身的老年人，以及青少年儿童，冬天循序渐进地适当“冻一冻”反而有助于增强免疫力。</P>\r\n<P>　　寒冷并不可怕，对环境的适应是人类的本能。挨冻和保暖并非完全的医学歧义，而是针对不同体质、年龄、身体条件的人群，提出的具体个性化要求，‘冻’并非人人能接受，相应的，‘暖’也不见得对每个人都有好处。过度保暖反而会降低身体的免疫力，让人长期处于‘温室花朵’的状态，变得脆弱而易病。“薄衣御寒”也属于养生之道，但如何在锻炼耐寒的同时别受风寒，确实是门技术活。</P><STRONG>　　小儿</STRONG> <STRONG>　　少穿一件好过多穿一件</STRONG> \r\n<P>　　别说冬天，就是春秋季节，也经常可以看到很多父母喜欢将孩子紧紧‘捂住’，似乎永远都比大人多穿一件或多盖一层，生怕孩子一不小心受凉感冒。</P>\r\n<P>　　日本儿童从很小就开始尝试身着短裤或者超短裙度过秋冬天了，虽然我们不提倡寒冷气候下露出膝关节，但这种观念还是可以借鉴的??婴幼儿脱离母体后，需要逐渐适应外界寒暖的变化，自己调节体温，如果从襁褓中就开始过度保暖不抗冻，日后会更加娇弱，罹患感冒的几率更大。</P>\r\n<P>　　青少年儿童正处于生长发育的高峰期，身体新陈代谢的速度远比成人快，所以体表热能挥发很大，这也是为什么孩子稍一活动就满身大汗的原因。如果衣服穿得过多，出汗不断而又未及时更衣的话，体液过度消耗，寒风一吹冷却下来，反而可能生病。</P>\r\n<P>　　所以对于青少年儿童来说，家长大可不必过于小心呵护，让其衣着轻便一点更好，即使偶尔感冒也不要太过紧张，毕竟广州的冬天并不算寒冷，如果他的机体从小就适应了一定的冷空气刺激，对于其日后习惯性抵御严寒大有裨益。而且这样能逐步提高孩子皮肤和鼻黏膜的耐寒力，对未来强身健体也有好处。</P>\r\n<P>　　不过，儿童的头部、胸部等部位如果“捂”多了容易心烦、内热，但孩子的腹部却一定要注意保暖，这是因为很多儿童存在脾胃较虚现象，当冷空气直接刺激腹部时，可能引起腹痛，从而损伤脾胃功能，使脾胃不能正常稳定运转。所以，“肚暖”依然是孩子冬天保健的重要一环。</P><STRONG>　　老人</STRONG> <STRONG>　　晨练或冬泳别太猛</STRONG> \r\n<P>　　虽然冬泳的确能强身健体，但还没有过此类经验的老人千万别轻易尝试，以免身体适应不了突然的冷刺激而生病。</P>\r\n<P>　　“防寒保暖”并非适用于所有老年人，对于没有心血管疾病如高血压、动脉粥样硬化的老年人而言，同样可以尝试抗寒锻炼。冬泳在我国南北方都有一定的群众基础，经常可以看到年过七旬的老者腊月里依然赤膊畅游。</P>\r\n<P>　　但每年送医的冬泳爱好者也不在少数，这类较为极端的抗寒锻炼，对于游泳技术一般，或是平时都习惯了用热水洗脸洗澡、从未尝试过冷水浴的人来说，实在不宜轻易尝试。专家介绍，耐寒锻炼必须循序渐进，不应随意挑战自己没有把握的极限强度。</P>\r\n<P>　　冬季晨练也要讲究个人条件，夏天每天爬山的人，不见得适合冬天上山。如果曾发生过面瘫或心血管疾病，以及有哮喘、咳嗽在身的老者，最好不要在清晨较寒冷时进行户外锻炼，而且山上温度较低，越发增加患病风险。</P>\r\n<P>　　如想“驯服”低温气候，身体健康的老人可从凉水洗脸、洗手做起，长此以往可增强抵抗力，减少感冒次数。而在“驯服”冷的过程中，老人会自然地增加耗氧量、提高基础代谢率，高水平的产热功能甚至可持续几个月之久，这对于延年益寿都有好处。</P><STRONG>　　体质偏热者</STRONG> <STRONG>　　较气虚阳虚者更适合耐寒训练</STRONG> \r\n<P>　　从中医角度分析，体质偏热的人群，较体质寒凉、气虚阳虚者，显然更适合进行耐寒训练。寒冷对前者是可利用的，对后者却是一种威胁。</P>\r\n<P>　　体质偏热者，受到同等程度的寒冷刺激时不会感到不适，反而会觉得很自在；而对于体质寒凉者来说，一旦稍受冷刺激，就可能产生腹泻、腹痛等诸多消化道反应。</P>\r\n<P>　　但凡本身就属于气虚阳虚的人群，不要违背自身客观条件而苛求耐寒训练，而对于体质偏热者，可以充分通过适当的穿薄衣、用凉水洗脸或擦身、多到冷空气环境锻炼等方式，在冬天进一步增强心肌功能和机体自控能力，人体血管弹性也会由此增强，血液流量增多，从而改善冠状动脉的供血，同时还可借此改善神经系统和内分泌系统的调节功能。</P>', 'hsg', '2017-04-06 06:35:58', '', 3, NULL);
INSERT INTO `xinwentongzhi` VALUES (214, '冷空气开始影响温州 春天提前到来冬衣慢点脱去', '站内新闻', '&nbsp;&nbsp;&nbsp; 据市气象台昨天上午发布的消息，目前北方有一股冷空气正在东移南下，预计于昨天夜里起开始影响我市。气温将逐渐下降，日平均过程降温幅度可达7℃?9℃，沿海海面有7?9级偏北大风。\r\n<P>　　另外，从23日开始至27日，市区已连续5天日平均气温维持在10℃以上，已进入气象意义上的春天，较往年明显偏早。往年，我市“入春”时间一般在2月底至3月初。气象专家提醒，我市虽已入春，但乍暖还寒，受这次冷空气南下影响，我市各地气温又会呈直线下降趋势，日平均气温可能会被打回至10℃以下。春天里天气多变，市民要根据天气变化，及时增减衣服，适当“捂一捂”，以防感冒。</P><!--advertisement code begin--><!--none--><!--advertisement code end-->\r\n<P>　　据了解，今年2月下旬平均气温为12.2℃，较常年明显偏高3.1℃，旬雨量较常年明显偏少，雨日偏少。市气象部门预计，我市3月上旬平均气温接近常年，雨量雨日偏少，本旬初和本旬后期各有一次冷空气影响过程。具体预测如下：</P>\r\n<P>　　3月1日，小雨止转阴到多云；2日，多云；3日，多云到阴局部有时有小雨；4日，多云；5日，暖区天气，湿度大，多云到阴局部有时有小雨；6日，受冷暖空气交汇影响，阴有雨； 7日，雨止转阴到多云；8?10日，多云。</P>', 'hsg', '2017-04-06 06:35:58', '', 2, NULL);
INSERT INTO `xinwentongzhi` VALUES (215, '国际知名设计师7月云集深圳“把脉”潮流', '站内新闻', '　 中国服装行业、深圳服装自主品牌将与国际时尚设计大师、国外服装行业、国外服装企业将开展对话，探讨深圳时尚创意如何发展。记者了解到，2011年7月服交会期间，由罗湖区政府、深圳服装行业协会、深圳报业集团主办，“深圳国际时尚设计高端论坛”，将在深圳会展中心隆重举行。多位国际知名设计师将和政府、协会、企业嘉宾一道出席论坛，围绕设计这一新的经济发展新动力，展开一次洲际间的交流活动，这也将是迄今为止深圳服交会最高规格的设计师交流活动。 \r\n<P>　　经过20多年的快速发展，深圳以服装业为主的时尚产业依托得天独厚的区位优势，逐步形成了十分明显的集聚优势，位居全国大中城市前列，引领着国内时尚的潮流，并日益从优势传统产业向高附加值、高文化含量的时尚创意产业转变。2008年12月8日，随着深圳被联合国教科文组织全球创意城市网络认定为“设计之都”，作为设计之都重要一支的深圳服装设计提出了全新的发展机遇与挑战。2011年，打造深圳“时尚创意之都”的目标，也已列入深圳政府“十二五”规划之中。如何应对新形势给深圳时装界和设计师带来的机遇和挑战？以及如何进一步促进深圳服装自主原创品牌的繁荣和设计水平的提高……都是深圳服装设计丞待解决的问题。 </P>\r\n<P>　　另一方面，中国经济经过30多年快速发展，中国时尚产业正面临着前所未有的机遇和挑战。面对强势的世界品牌潮水般涌入，中国时尚产业亟待突破设计和品牌发展的瓶颈，发展成熟的品牌经济，形成具有中国特色的时尚产业集群，在国际时尚领域奠定自己的地位。迈入十二五规划之后，中国服装将要以怎样的品牌姿态屹立于世界时尚之林，中国服装设计的方向和支点在哪里？面对危机时代新的规则，“国际时尚设计高端论坛”将关注新价值观下中国服装品牌的构建，结合新形势下服装产业面临的机遇和挑战，从设计管理、新消费趋势、渠道创新、资本抉择、创意跨界、组织变革、数字化生活、科技生产力、生态美学、引爆趋势等等多个角度深刻剖析我国服装品牌发展的未来方向和支撑力量。 </P>\r\n<P>　　本次论坛力求成为中国服装行业、深圳服装自主品牌与国际时尚设计大师、国外服装行业、国外服装企业对话、交流的重要平台，更是让国际认识深圳服装设计力量的展示平台，并逐步树立时尚应用和创新典范，促进时尚设计产业在国内以及亚洲地区，乃至国际市场的快速成长和发展，扩大时尚设计在各领域的影响力。同时，创意产业的思维逻辑和发展模式来改变自身的发展是深圳构建“时尚创意之都”急待解决的首要问题，深圳要有一批设计原创、文化价值含量高的品牌聚集，更要获得国际上掌握一流信息的专家指导，深圳需要形成独有的设计师群体。本论坛致力于打造高端的进行国际创意设计交流的平台，通过这个平台将汇聚各界设计精英，为深圳构筑“时尚创意之都”出谋划策。 </P>', 'hsg', '2017-04-06 06:35:58', '', 2, NULL);
INSERT INTO `xinwentongzhi` VALUES (216, '宜山针织内衣企业更新缝纫设备：节能减排 提质提效', '站内新闻', '<p>\r\n	苍南新闻网8月30日消息：今年，宜山镇针织内衣企业针对招工不足的现状，纷纷通过购进高效节能的缝纫机等新设备，来提高生产效率和生产质量，有效解决了企业用工不足和耗电量大这两大难题，这一举措成为宜山针织内衣行业一条节能减排的新路子。\r\n</p>\r\n<p>\r\n	日前，记者走进位于宜山镇环城南路的一家制衣厂，看到数十位工人正在包缝、加条、压针。记者注意到，在生产车间的缝纫机旁边，都安装了一个调频电脑显示器。当挡车女工不使用机器时，系统就停止工作，没有了待机的损耗，当挡车女工缝制布料的瞬间，指示灯马上亮起来，并随时检测缝制布料的厚薄，将信息实时传递给嵌入式软件，通过软件调节电机的输出转速和输出功率，使缝纫机工作始终处在最合理、最节能状态。该企业负责人方女士告诉笔者，他们厂里每年都要投入七八万元资金，用于更新、添置新款缝纫机，这不仅使产品质量大大提高了，做出来针织内衣针眼密，产品质量好，而且工人劳动强度也明显降低，工人不用带剪刀剪线头，现在无论包缝机、压针机、加条机等，比如说以前一天做一千件，现在要多增加二三百件很轻松，深受工人们的喜欢。\r\n</p>\r\n<!--advertisement code begin--><!--advertisement code end-->\r\n<p>\r\n	针织内衣行业是宜山镇的三大经济支柱行业之一。以前，宜山针织内衣企业采用的传统缝纫设备，其生产效率仅为40～50%，而且成品质量不精。随着市场竞争的加剧和生产成本增加，大量生产低价针织内衣企业难以生存，许多企业老板纷纷进行缝制设备的更新换代来带动企业发展，高效节能的缝制设备倍受企业喜爱，使得宜山缝制设备市场呈现出热销局面。据宜山一家缝纫机经销店黄师傅介绍，现在大部分都电脑自动化，高效节能缝纫机比传统的机子可以提高30%以上的效率。省工又省力，一年节省下来的工资费用，相当于买一台电脑缝纫机的成本。\r\n</p>\r\n<p>\r\n	通过缝纫机的更新换代发展，针织内衣行业的生产能力不断得到提高，产品质量也得到了市场的认可，高效节能缝纫机的使用降低了耗电量，也成为宜山针织内衣行业一条节能减排的新路子。（通讯员 爱选 成雷）\r\n</p>', 'hsg', '2017-04-06 06:35:59', '', 22, '今年，宜山镇针织内衣企业针对招工不足的现状，纷纷通过购进高效节能的缝纫机等新设备，来提高生产效率和生产质量，有效解决了企业用工不足和耗电量大这两大难题');
INSERT INTO `xinwentongzhi` VALUES (217, '世界服装巨头H&M一季度净利下降30%', '站内新闻', '　&nbsp; 北京时间3月31日下午消息，世界第三大时装零售商、瑞典服装零售巨头Hennes&amp;Mauritz AB公司周四公布了2011年第一季度的财报。数据显示，该公司本季度的净利润比去年同期下降了30%至26.2亿瑞典克朗（合4.15亿美元），在去年同期该公司的净利润为37.4亿瑞典克朗。\r\n<p>\r\n	Hennes&amp;Mauritz AB公司本季度盈利下滑主要是更高的成本及瑞典克朗的强势所致。数据显示，该公司本季度的销售额(不含增值税)从去年同期的248.5亿瑞典克朗下降至245亿瑞典克朗，降幅1.4%。FactSet调查的分析师此前预期该公司本季度的净利润为27.3亿瑞典克朗，预期本季度的销售额为249.2亿瑞典克朗。该公司表示，棉花价格大幅度上涨、剩余产能减少、运输成本更高以及美元带来了不利影响，这些因素导致其在今年第一季度的毛利率从去年同期的61.9%下降至57.8%。按本国货币计算，该公司2月的销售额比去年同期增长了9%，而从3月1日至3月29日的销售额仅比去年同期增长3%。该公司表示，其计划在今年第二季度新开97家店面同时关闭8家店面，预计中国、英国及美国是该公司2011年最大的扩张市场。\r\n</p>', 'hsg', '2017-04-06 06:35:59', '', 9, '　  北京时间3月31日下午消息，世界第三大时装零售商、瑞典服装零售巨头Hennes&Mauritz AB公司周四公布了2011年第一季度的财报。');
INSERT INTO `xinwentongzhi` VALUES (218, '黑色衣装持续走俏 早春搭出新花样', '站内新闻', '<strong> 在白色抢占T台的同时，黑色衣装在街头的出镜率依然不减。我们来看看好莱坞大咖们所偏爱的黑色，在早春时节如何被她们演绎出另一番风情。</strong> \r\n<p align=\"right\">\r\n	<strong><a href=\"http://women.sohu.com/20110223/n279460223_1.shtml\"><span>下一页：黑色针织衫内搭</span></a></strong>\r\n</p>\r\n<table cellspacing=\"0\" cellpadding=\"0\" align=\"center\" border=\"0\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"middle\">\r\n				<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"ke-zeroborder\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<a href=\"http://women.sohu.com/20110223/n279460223_1.shtml\" target=\"_blank\"><span><img alt=\"\" src=\"http://photocdn.sohu.com/20110222/Img279460916.jpg\" align=\"middle\" /></span></a>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"font-size:12px;\" align=\"middle\">\r\n				<span></span>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<strong> 小编点评：</strong>底部镶满铆钉的Alexander Wang包包是去年爆款，在欧美明星手中辗转出镜在这里，Kate Bosworth的白色款搭配她这一身黑色外套，搭配紧身牛仔裤，优雅中带着点儿帅气劲儿。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<table cellspacing=\"0\" cellpadding=\"0\" align=\"center\" border=\"0\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"middle\">\r\n				<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"ke-zeroborder\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								<a href=\"http://women.sohu.com/20110223/n279460223_1.shtml\" target=\"_blank\"><img alt=\"\" src=\"http://photocdn.sohu.com/20110222/Img279460917.jpg\" align=\"middle\" /></a>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"font-size:12px;\" align=\"middle\">\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<strong> 小编点评：</strong>整身黑色是显瘦的不二法宝！及膝长度风衣用做连衣裙的“裸穿”又是最风情万种的方式，腰带的随意系扎，系出了几分柔情，还将纤细腰身显现出来。 <br />\r\n	<table cellspacing=\"0\" cellpadding=\"0\" align=\"center\" border=\"0\" class=\"ke-zeroborder\">\r\n		<tbody>\r\n			<tr>\r\n				<td align=\"middle\">\r\n					<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"ke-zeroborder\">\r\n						<tbody>\r\n							<tr>\r\n								<td>\r\n									<a href=\"http://women.sohu.com/20110222/n279460223.shtml\" target=\"_blank\"><img alt=\"\" src=\"http://photocdn.sohu.com/20110222/Img279460918.jpg\" align=\"middle\" /></a>\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"font-size:12px;\" align=\"middle\">\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</p>\r\n<p>\r\n	<strong> 小编点评：</strong>Jessica Alba最近爱上这款黑色金属角装饰的手袋，这款包包简约百搭，大小也正好实用，抢眼的装饰效果显得与众不同，是出街的不二法宝。黑色的针织衫内搭，搭配墨绿色针织开衫，上班出街不沉闷哦~\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<table cellspacing=\"0\" cellpadding=\"0\" align=\"center\" border=\"0\" class=\"ke-zeroborder\">\r\n		<tbody>\r\n			<tr>\r\n				<td align=\"middle\">\r\n					<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"ke-zeroborder\">\r\n						<tbody>\r\n							<tr>\r\n								<td>\r\n									<a href=\"http://women.sohu.com/20110222/n279460223.shtml\" target=\"_blank\"><img alt=\"\" src=\"http://photocdn.sohu.com/20110222/Img279460919.jpg\" align=\"middle\" /></a>\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"font-size:12px;\" align=\"middle\">\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</p>\r\n<p>\r\n	<strong> 小编点评：</strong>Kate Moss与Sadie Frost漫步街头。Kate女王斜挎一款Chanel经典菱格纹包包，在着装上她选择用黑色抓绒外套与Skinny牛仔裤的搭配，脚上穿的是一双质地硬朗的高筒靴。\r\n</p>', 'hsg', '2017-04-06 06:35:59', '', 43, '在白色抢占T台的同时，黑色衣装在街头的出镜率依然不减。我们来看看好莱坞大咖们所偏爱的黑色，在早春时节如何被她们演绎出另一番风情。');
INSERT INTO `xinwentongzhi` VALUES (220, 'wegewgwe', '站内新闻', 'whwhwhew', 'hsg', '2017-04-06 11:18:57', '', 1, 'hwehewh');

-- ----------------------------
-- Table structure for yonghuzhuce
-- ----------------------------
DROP TABLE IF EXISTS `yonghuzhuce`;
CREATE TABLE `yonghuzhuce`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `mima` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `xingming` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `xingbie` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `diqu` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `zhaopian` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `issh` varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of yonghuzhuce
-- ----------------------------
INSERT INTO `yonghuzhuce` VALUES (26, '555', '555', '何升高', '男', '浙江', 'gsgs@163.com', 'uploadfile/13392103902z4y.jpg', '2017-04-06 03:28:40', '是');
INSERT INTO `yonghuzhuce` VALUES (27, 'leejie', 'leejie', '李龙', '女', '湖北', 'fege@126.com', 'uploadfile/1458995034uk9q.jpg', '2017-04-06 03:28:40', '是');
INSERT INTO `yonghuzhuce` VALUES (28, 'mygod', 'mygod', '陈德才', '男', '河南', 'gshf@yahoo.com', 'uploadfile/1339211824lezl.gif', '2017-04-06 03:28:40', '是');
INSERT INTO `yonghuzhuce` VALUES (29, 'xwxxmx', 'xwxxmx', '吴江', '女', '北京', 'jrjtr@163.com', 'uploadfile/1339211786gts3.jpg', '2017-04-06 03:28:40', '是');
INSERT INTO `yonghuzhuce` VALUES (34, 'fwfw', 'fwfw', 'fwfw', '男', '浙江', 'wgww@163.com', 'uploadfile/1458995326cc47.jpg', '2017-04-06 08:28:48', '否');
INSERT INTO `yonghuzhuce` VALUES (35, 'bgbg', 'bgbg', 'bgbg', '男', '浙江', 'wgww@163.com', 'uploadfile/1458995773ttqz.jpg', '2017-04-06 08:36:14', '否');
INSERT INTO `yonghuzhuce` VALUES (36, 'ww', 'ww', 'ww', '男', '浙江', 'wgww@163.com', 'uploadfile/1462473405amvl.jpg', '2017-04-06 02:36:47', '否');
INSERT INTO `yonghuzhuce` VALUES (37, 'gggg', 'gggg', 'gggg', '男', '浙江', 'ss@163.com', 'uploadfile/1491449735fhb7.jpg', '2017-04-06 11:35:36', '否');

-- ----------------------------
-- Table structure for youqinglianjie
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `wangzhi` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `addtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `logo` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES (16, '百度', 'http://www.baidu.com', '2017-04-06 07:46:56', 'uploadfile/baidu.gif');
INSERT INTO `youqinglianjie` VALUES (17, '谷歌', 'http://www.google.cn', '2017-04-06 07:46:56', 'uploadfile/google.png');
INSERT INTO `youqinglianjie` VALUES (18, '新浪', 'http://www.sina.com', '2017-04-06 07:46:56', 'uploadfile/sina.gif');
INSERT INTO `youqinglianjie` VALUES (19, 'QQ', 'http://www.qq.com', '2017-04-06 07:46:56', 'uploadfile/qq.jpg');
INSERT INTO `youqinglianjie` VALUES (20, '网易', 'http://www.163.com', '2017-04-06 07:46:56', 'uploadfile/163.png');

SET FOREIGN_KEY_CHECKS = 1;
