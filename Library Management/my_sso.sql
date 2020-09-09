/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 100130
 Source Host           : localhost:3306
 Source Schema         : my_sso

 Target Server Type    : MySQL
 Target Server Version : 100130
 File Encoding         : 65001

 Date: 04/01/2019 11:40:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sso_clients
-- ----------------------------
DROP TABLE IF EXISTS `sso_clients`;
CREATE TABLE `sso_clients`  (
  `client_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户唯一标识符',
  `client_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端名称',
  `client_key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '签名密钥',
  `client_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求地址',
  `client_state` tinyint(1) NOT NULL COMMENT '有效标识符',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sso_clients
-- ----------------------------
INSERT INTO `sso_clients` VALUES (1, '测试接入端1', '$2y$10$Bp33W84UKJ6VvFN6GG8WDud0TzQbVjI9UWUD1ePrUCtdRQc39E4Gm', 'http://Shoot_Idiot/index.php/Login/ssoLogin', 1);
INSERT INTO `sso_clients` VALUES (2, '测试接入端2', '$2y$10$IhlXC7oN.0N5A2pf7ddrEO5NHf7wNANQmcJ4nrKU2Qn6IyT9r/g/.', 'http://Shoot_Idiot/index.php/Login/ssoLogin', 1);
INSERT INTO `sso_clients` VALUES (3, '测试接入端3', '$2y$10$1B1iXJcMkSpcM/fXzEqd0uIswfZ0EB7v9ft/hIeGrmBDLBhl0Ufd2', 'http://Shoot_Idiot/index.php/Login/ssoLogin', 1);
INSERT INTO `sso_clients` VALUES (4, '测试接入端4', '$2y$10$ZuvAAFBvdAD8WFDFOnCIP.HRjx7vb20WWv.g5jeZG4WiadW5aKaay', 'http://Shoot_Idiot/index.php/Login/ssoLogin', 1);
INSERT INTO `sso_clients` VALUES (5, '测试接入端5', '$2y$10$WQMki72vtOw.OC1M5Ujx7eqJbv7QJRBd3WaK08Mbhu.zY272QTw5q', 'http://Shoot_Idiot/index.php/Login/ssoLogin', 0);
INSERT INTO `sso_clients` VALUES (6, '测试接入端6', '$2y$10$4cboH4K4.AmfYDMgkAafguCsT5zQtDYduuRSV29po5TWBf8CqZX86', 'http://Shoot_Idiot/index.php/Login/ssoLogin', 1);
INSERT INTO `sso_clients` VALUES (7, '测试接入端7', '$2y$10$X1a.vS7A8ldW3t7/2UPOYOwJiDhSPfFumoQnTHrUvFPO7HhJLb5xy', 'http://Shoot_Idiot/index.php/Login/ssoLogin', 1);
INSERT INTO `sso_clients` VALUES (8, '测试接入端8', '$2y$10$Jd0AUh3HMgS0/ijgneJYzenA3JQ3FMsQXElk1X.mGB6Y3yaep//NG', 'http://Shoot_Idiot/index.php/Login/ssoLogin', 1);

-- ----------------------------
-- Table structure for sso_request
-- ----------------------------
DROP TABLE IF EXISTS `sso_request`;
CREATE TABLE `sso_request`  (
  `flow_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求用户名',
  `request_client_id` int(10) NOT NULL COMMENT '被请求客户端唯一标识符',
  `request_time` int(10) NOT NULL COMMENT '请求时间',
  `signature` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求签名',
  `request_state` tinyint(1) NOT NULL COMMENT '回执状态',
  PRIMARY KEY (`flow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sso_request
-- ----------------------------
INSERT INTO `sso_request` VALUES (1, '测试接入端1', 0, 0, '$2y$10$Bp33W84UKJ6VvFN6GG8WDud0TzQbVjI9UWUD1ePrUCt', 1);
INSERT INTO `sso_request` VALUES (2, '测试接入端2', 0, 0, '$2y$10$CIGsqGy6skBzjRfy3UTEI.x4XgndqgAS0YMNitr58eM', 1);
INSERT INTO `sso_request` VALUES (3, '测试接入端3', 0, 0, '$2y$10$1B1iXJcMkSpcM/fXzEqd0uIswfZ0EB7v9ft/hIeGrmB', 1);
INSERT INTO `sso_request` VALUES (4, '测试接入端4', 0, 0, '$2y$10$Nev0IpCqYuwn5KJFLoQDNOfBxaABY/6H3l5SKWckgGK', 1);
INSERT INTO `sso_request` VALUES (5, '测试接入端6', 0, 0, '$2y$10$4cboH4K4.AmfYDMgkAafguCsT5zQtDYduuRSV29po5T', 1);
INSERT INTO `sso_request` VALUES (6, '测试接入端7', 0, 0, '$2y$10$X1a.vS7A8ldW3t7/2UPOYOwJiDhSPfFumoQnTHrUvFP', 1);
INSERT INTO `sso_request` VALUES (7, '测试接入端8', 0, 0, '$2y$10$Jd0AUh3HMgS0/ijgneJYzenA3JQ3FMsQXElk1X.mGB6', 1);

-- ----------------------------
-- Table structure for sso_users
-- ----------------------------
DROP TABLE IF EXISTS `sso_users`;
CREATE TABLE `sso_users`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户唯一标识符',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码特征值',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sso_users
-- ----------------------------
INSERT INTO `sso_users` VALUES (1, '赵云啊', '$2y$10$RlVwfQN2HA1Ztx7qN4oXIejUuf3ELbXB0AUDJ9LO0LjvMIlUZHDzC');
INSERT INTO `sso_users` VALUES (2, '爱德华', '$2y$10$bWeSS7Tvyb0T7.KzDlK5yOyFZbFWw8tmh1LVqcR7sjp3AISe/o8R6');

SET FOREIGN_KEY_CHECKS = 1;
