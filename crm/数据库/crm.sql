/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 04/07/2020 19:29:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_dict
-- ----------------------------
DROP TABLE IF EXISTS `base_dict`;
CREATE TABLE `base_dict`  (
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据字典项目代码(可为空)',
  `dict_sort` int(10) NULL DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_dict
-- ----------------------------
INSERT INTO `base_dict` VALUES ('1', '001', '客户行业', '教育培训 ', NULL, 1, '1', NULL);
INSERT INTO `base_dict` VALUES ('10', '003', '公司性质', '民企', NULL, 3, '1', NULL);
INSERT INTO `base_dict` VALUES ('12', '004', '年营业额', '1-10万', NULL, 1, '1', NULL);
INSERT INTO `base_dict` VALUES ('13', '004', '年营业额', '10-20万', NULL, 2, '1', NULL);
INSERT INTO `base_dict` VALUES ('14', '004', '年营业额', '20-50万', NULL, 3, '1', NULL);
INSERT INTO `base_dict` VALUES ('15', '004', '年营业额', '50-100万', NULL, 4, '1', NULL);
INSERT INTO `base_dict` VALUES ('16', '004', '年营业额', '100-500万', NULL, 5, '1', NULL);
INSERT INTO `base_dict` VALUES ('17', '004', '年营业额', '500-1000万', NULL, 6, '1', NULL);
INSERT INTO `base_dict` VALUES ('18', '005', '客户状态', '基础客户', NULL, 1, '1', NULL);
INSERT INTO `base_dict` VALUES ('19', '005', '客户状态', '潜在客户', NULL, 2, '1', NULL);
INSERT INTO `base_dict` VALUES ('2', '001', '客户行业', '电子商务', NULL, 2, '1', NULL);
INSERT INTO `base_dict` VALUES ('20', '005', '客户状态', '成功客户', NULL, 3, '1', NULL);
INSERT INTO `base_dict` VALUES ('21', '005', '客户状态', '无效客户', NULL, 4, '1', NULL);
INSERT INTO `base_dict` VALUES ('22', '006', '客户级别', '普通客户', NULL, 1, '1', NULL);
INSERT INTO `base_dict` VALUES ('23', '006', '客户级别', 'VIP客户', NULL, 2, '1', NULL);
INSERT INTO `base_dict` VALUES ('24', '007', '商机状态', '意向客户', NULL, 1, '1', NULL);
INSERT INTO `base_dict` VALUES ('25', '007', '商机状态', '初步沟通', NULL, 2, '1', NULL);
INSERT INTO `base_dict` VALUES ('26', '007', '商机状态', '深度沟通', NULL, 3, '1', NULL);
INSERT INTO `base_dict` VALUES ('27', '007', '商机状态', '签订合同', NULL, 4, '1', NULL);
INSERT INTO `base_dict` VALUES ('3', '001', '客户行业', '对外贸易', NULL, 3, '1', NULL);
INSERT INTO `base_dict` VALUES ('30', '008', '商机类型', '新业务', NULL, 1, '1', NULL);
INSERT INTO `base_dict` VALUES ('31', '008', '商机类型', '现有业务', NULL, 2, '1', NULL);
INSERT INTO `base_dict` VALUES ('32', '009', '商机来源', '电话营销', NULL, 1, '1', NULL);
INSERT INTO `base_dict` VALUES ('33', '009', '商机来源', '网络营销', NULL, 2, '1', NULL);
INSERT INTO `base_dict` VALUES ('34', '009', '商机来源', '推广活动', NULL, 3, '1', NULL);
INSERT INTO `base_dict` VALUES ('4', '001', '客户行业', '酒店旅游', NULL, 4, '1', NULL);
INSERT INTO `base_dict` VALUES ('5', '001', '客户行业', '房地产', NULL, 5, '1', NULL);
INSERT INTO `base_dict` VALUES ('6', '002', '客户信息来源', '电话营销', NULL, 1, '1', NULL);
INSERT INTO `base_dict` VALUES ('7', '002', '客户信息来源', '网络营销', NULL, 2, '1', NULL);
INSERT INTO `base_dict` VALUES ('8', '003', '公司性质', '合资', NULL, 1, '1', NULL);
INSERT INTO `base_dict` VALUES ('9', '003', '公司性质', '国企', NULL, 2, '1', NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cust_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '客户编号(主键)',
  `cust_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户名称(公司名称)',
  `cust_user_id` bigint(32) NULL DEFAULT NULL COMMENT '负责人id',
  `cust_create_id` bigint(32) NULL DEFAULT NULL COMMENT '创建人id',
  `cust_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户信息来源',
  `cust_industry` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户所属行业',
  `cust_level` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户级别',
  `cust_linkman` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `cust_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `cust_mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话',
  `cust_zipcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cust_id`) USING BTREE,
  INDEX `FK_cst_customer_source`(`cust_source`) USING BTREE,
  INDEX `FK_cst_customer_industry`(`cust_industry`) USING BTREE,
  INDEX `FK_cst_customer_level`(`cust_level`) USING BTREE,
  INDEX `FK_cst_customer_user_id`(`cust_user_id`) USING BTREE,
  INDEX `FK_cst_customer_create_id`(`cust_create_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 177 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (14, '张三', NULL, NULL, '6', '2', '22', '李四', '0108888887', '13888888888', '123456', '北京三里桥', '2016-04-08 16:32:01');
INSERT INTO `customer` VALUES (15, '李四', NULL, NULL, '6', '2', '22', '马化腾', '0108888887', '13888888888', '123456', '北京三里桥', '2016-04-08 16:32:01');
INSERT INTO `customer` VALUES (16, '张飞', NULL, NULL, '6', '2', '22', '马化腾', '0108888887', '13888888888', '123456', '北京三里桥', '2016-04-08 16:32:01');
INSERT INTO `customer` VALUES (17, '曹操', NULL, NULL, '6', '2', '22', '马化腾', '0108888887', '13888888888', '123456', '北京三里桥', '2016-04-08 16:32:02');
INSERT INTO `customer` VALUES (22, '关羽', NULL, NULL, '6', '2', '22', '马化腾', '0108888887', '13888888888', '123456', '北京三里桥', '2016-04-08 16:32:03');
INSERT INTO `customer` VALUES (24, '诸葛', NULL, NULL, '6', '2', '22', '马化腾', '0108888887', '13888888888', '123456', '北京三里桥', '2016-04-08 16:32:03');
INSERT INTO `customer` VALUES (25, '司马懿', NULL, NULL, '6', '2', '22', '马化腾', '0108888887', '13888888888', '123456', '北京三里桥', '2016-04-08 16:32:03');
INSERT INTO `customer` VALUES (26, '赵云', NULL, NULL, '6', '2', '22', '马化腾', '0108888887', '13888888888', '123456', '北京三里桥', '2016-04-08 16:32:03');
INSERT INTO `customer` VALUES (28, '周瑜', NULL, NULL, '6', '2', '22', '马化腾', '0108888887', '13888888888', '123456', '北京三里桥', '2016-04-08 16:32:04');
INSERT INTO `customer` VALUES (29, '令狐冲', NULL, NULL, '7', '1', '23', '任盈盈', '0108888886', '13888888886', '6123456', '北京三里桥6', '2016-04-08 16:32:04');
INSERT INTO `customer` VALUES (164, '刘正', NULL, NULL, '6', '2', '22', '565', '56', '5656', '5656', '565', NULL);
INSERT INTO `customer` VALUES (173, '4545', NULL, NULL, '6', '2', '22', '45', '45', '454', '454', '4545', NULL);
INSERT INTO `customer` VALUES (174, '张三', NULL, NULL, '7', '3', '23', '565', '56', '56', '', '', NULL);
INSERT INTO `customer` VALUES (175, '李四', NULL, NULL, '7', '1', '22', 'tgfrs', 'dsf', 'sdf', 'sdf', 'sdf', NULL);
INSERT INTO `customer` VALUES (176, '张si', NULL, NULL, '6', '2', '23', '李四', '56', '56', '', '', NULL);

-- ----------------------------
-- Table structure for customer_track
-- ----------------------------
DROP TABLE IF EXISTS `customer_track`;
CREATE TABLE `customer_track`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拜访客户名称',
  `customer_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拜访客户行业类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_track
-- ----------------------------
INSERT INTO `customer_track` VALUES (1, '易贸国际', '外贸');
INSERT INTO `customer_track` VALUES (2, '三星', '国际电子公司');
INSERT INTO `customer_track` VALUES (3, '宜陶集团', '军火商');
INSERT INTO `customer_track` VALUES (4, '九阳豆浆', '生产商');
INSERT INTO `customer_track` VALUES (5, '李维斯', '衣物品牌');
INSERT INTO `customer_track` VALUES (6, '谷歌', '网络公司');
INSERT INTO `customer_track` VALUES (7, 'IBM', '国际商业机器公司');
INSERT INTO `customer_track` VALUES (8, '联想集团', '电脑公司');
INSERT INTO `customer_track` VALUES (9, '甲骨文', '软件公司');
INSERT INTO `customer_track` VALUES (10, '网易', '网络公司');
INSERT INTO `customer_track` VALUES (11, '索尼', '科技公司');
INSERT INTO `customer_track` VALUES (16, '索尼', '网络公司');
INSERT INTO `customer_track` VALUES (17, '45', '科技公司');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (5, 'm0003', '123');
INSERT INTO `sys_user` VALUES (6, 'm0001', '123');
INSERT INTO `sys_user` VALUES (7, 'm0001', '123');
INSERT INTO `sys_user` VALUES (8, 'm0001', '123');
INSERT INTO `sys_user` VALUES (9, '47', '47');

SET FOREIGN_KEY_CHECKS = 1;
