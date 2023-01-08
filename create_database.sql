/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : hoa_chat_thi_nghiem

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 08/01/2023 17:09:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_admin
-- ----------------------------
DROP TABLE IF EXISTS `account_admin`;
CREATE TABLE `account_admin`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_role_admin` int NOT NULL,
  `id_status_acc` int NOT NULL,
  `passwordAD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp,
  `time_change_pass` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`username`) USING BTREE,
  INDEX `id_status_acc`(`id_status_acc` ASC) USING BTREE,
  INDEX `id_role_admin`(`id_role_admin` ASC) USING BTREE,
  CONSTRAINT `account_admin_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_acc` (`id_status_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_admin_ibfk_2` FOREIGN KEY (`id_role_admin`) REFERENCES `role_admin` (`id_role_admin`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_admin
-- ----------------------------
INSERT INTO `account_admin` VALUES ('nguyenphutai', '', 2, 1, '20130390', '2023-01-06 14:18:32', '2023-01-06 14:18:32');
INSERT INTO `account_admin` VALUES ('nguyentandat', '', 2, 1, '123', '2023-01-06 14:18:32', '2023-01-06 14:18:32');
INSERT INTO `account_admin` VALUES ('tranminhtuyen', '', 1, 1, '20130459', '2023-01-06 14:18:32', '2023-01-06 14:18:32');

-- ----------------------------
-- Table structure for account_customer
-- ----------------------------
DROP TABLE IF EXISTS `account_customer`;
CREATE TABLE `account_customer`  (
  `id_user_customer` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_status_acc` int NOT NULL,
  `id_city` int NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email_customer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone_customer` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp,
  `time_change_pass` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_user_customer`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `id_status_acc`(`id_status_acc` ASC) USING BTREE,
  INDEX `id_city`(`id_city` ASC) USING BTREE,
  CONSTRAINT `account_customer_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_acc` (`id_status_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_customer_ibfk_2` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_customer
-- ----------------------------
INSERT INTO `account_customer` VALUES (1, 'nguyenphutai840@gmail.com', '123', 1, 1, 'Nguyễn Phú Tài', 'Nam', 'nguyenphutai840@gmail.com', '0353677271', 'Di Linh, Lâm Đồng', '2023-01-06 14:18:24', '2023-01-06 14:18:24');
INSERT INTO `account_customer` VALUES (2, 'tranminhtuyen0908@gmail.com', '123', 1, 1, 'Trần Minh Tuyên', 'Nam', 'tranminhtuyen0908@gmail.com', '0353677272', 'Nam Định', '2023-01-06 14:18:24', '2023-01-06 14:18:24');
INSERT INTO `account_customer` VALUES (3, '20130221@st.hcmuaf.edu.vn', '123', 1, 1, 'Nguyễn Tấn Đạt', 'Nam', '20130221@st.hcmuaf.edu.vn', '0353677273', 'Bến Tre', '2023-01-06 14:18:24', '2023-01-06 14:18:24');
INSERT INTO `account_customer` VALUES (5, 'coconvtt@gmail.com', '123', 1, 1, NULL, NULL, NULL, NULL, NULL, '2023-01-08 14:48:05', '2023-01-08 14:49:31');

-- ----------------------------
-- Table structure for bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `bill_detail`;
CREATE TABLE `bill_detail`  (
  `id_bill` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL,
  `listed_price` bigint NOT NULL,
  `current_price` bigint NOT NULL,
  PRIMARY KEY (`id_bill`, `id_product`) USING BTREE,
  INDEX `id_product`(`id_product` ASC) USING BTREE,
  CONSTRAINT `bill_detail_ibfk_1` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id_bill`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bill_detail_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bill_detail
-- ----------------------------
INSERT INTO `bill_detail` VALUES (1, 1, 1, 2339666, 4814474);
INSERT INTO `bill_detail` VALUES (2, 6, 2, 10083488, 3984944);
INSERT INTO `bill_detail` VALUES (3, 8, 1, 4622591, 10522865);
INSERT INTO `bill_detail` VALUES (4, 1, 1, 2339666, 100000);
INSERT INTO `bill_detail` VALUES (5, 17, 7, 839364, 9231212);
INSERT INTO `bill_detail` VALUES (6, 1, 3, 2339666, 100000);
INSERT INTO `bill_detail` VALUES (7, 17, 5, 839364, 9231212);
INSERT INTO `bill_detail` VALUES (8, 1, 996, 2339666, 100000);
INSERT INTO `bill_detail` VALUES (9, 4, 1, 3377499, 9506978);
INSERT INTO `bill_detail` VALUES (9, 17, 2, 839364, 9231212);
INSERT INTO `bill_detail` VALUES (10, 1, 3, 2339666, 100000);
INSERT INTO `bill_detail` VALUES (11, 6, 11, 10083488, 3984944);
INSERT INTO `bill_detail` VALUES (12, 15, 1, 9581370, 592616);
INSERT INTO `bill_detail` VALUES (12, 61, 1, 1871689, 6679102);
INSERT INTO `bill_detail` VALUES (13, 2, 1, 11262951, 334594);
INSERT INTO `bill_detail` VALUES (14, 2, 1, 11262951, 334594);
INSERT INTO `bill_detail` VALUES (15, 2, 1, 11262951, 334594);
INSERT INTO `bill_detail` VALUES (16, 3, 1, 969612, 1384159);

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills`  (
  `id_bill` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_status_bill` int NOT NULL,
  `id_city` int NOT NULL,
  `fullname_customer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_customer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_customer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_price` double NOT NULL,
  `total_price` double NOT NULL,
  `time_order` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_bill`) USING BTREE,
  INDEX `id_user`(`id_user` ASC) USING BTREE,
  INDEX `id_status_bill`(`id_status_bill` ASC) USING BTREE,
  INDEX `id_city`(`id_city` ASC) USING BTREE,
  CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`id_status_bill`) REFERENCES `status_bill` (`id_status_bill`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bills_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bills_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `account_customer` (`id_user_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bills
-- ----------------------------
INSERT INTO `bills` VALUES (1, 3, 1, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 4814474, 4830474, '2023-01-06 14:49:39');
INSERT INTO `bills` VALUES (2, 3, 2, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 7969888, 7985888, '2023-01-06 15:10:06');
INSERT INTO `bills` VALUES (3, 3, 3, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 10522865, 10538865, '2023-01-06 15:10:16');
INSERT INTO `bills` VALUES (4, 3, 3, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 100000, 116000, '2023-01-06 16:56:06');
INSERT INTO `bills` VALUES (5, 3, 3, 3, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 64618484, 64642484, '2023-01-06 17:07:49');
INSERT INTO `bills` VALUES (6, 3, 4, 2, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 300000, 330000, '2023-01-06 19:11:51');
INSERT INTO `bills` VALUES (7, 3, 4, 2, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 46156060, 46186060, '2023-01-06 19:13:36');
INSERT INTO `bills` VALUES (8, 3, 3, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 99600000, 99616000, '2023-01-06 19:33:16');
INSERT INTO `bills` VALUES (9, 3, 3, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 27969402, 27985402, '2023-01-07 09:35:55');
INSERT INTO `bills` VALUES (10, 3, 4, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 300000, 316000, '2023-01-07 09:36:24');
INSERT INTO `bills` VALUES (11, 3, 4, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 43834384, 43850384, '2023-01-07 13:19:49');
INSERT INTO `bills` VALUES (12, 3, 4, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 7271718, 7287718, '2023-01-08 15:49:45');
INSERT INTO `bills` VALUES (13, 3, 4, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 334594, 350594, '2023-01-08 15:50:09');
INSERT INTO `bills` VALUES (14, 3, 4, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 334594, 350594, '2023-01-08 15:52:42');
INSERT INTO `bills` VALUES (15, 3, 4, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 334594, 350594, '2023-01-08 16:43:00');
INSERT INTO `bills` VALUES (16, 3, 4, 1, 'Nguyễn Tấn Đạt', '0353677273', '20130221@st.hcmuaf.edu.vn', 'Bến Tre', 1384159, 1400159, '2023-01-08 16:48:30');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id_city` int NOT NULL AUTO_INCREMENT,
  `name_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport` bigint NOT NULL,
  PRIMARY KEY (`id_city`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, 'TP. Hồ Chí Minh', 16000);
INSERT INTO `city` VALUES (2, 'Hà Nội', 30000);
INSERT INTO `city` VALUES (3, 'Đà Nẵng', 24000);
INSERT INTO `city` VALUES (4, 'Cần Thơ', 12000);

-- ----------------------------
-- Table structure for comment_news
-- ----------------------------
DROP TABLE IF EXISTS `comment_news`;
CREATE TABLE `comment_news`  (
  `id_comment` int NOT NULL AUTO_INCREMENT,
  `id_news` int NOT NULL,
  `id_user_customer` int NOT NULL,
  `time_comment` timestamp NOT NULL DEFAULT current_timestamp,
  `content_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_comment`) USING BTREE,
  INDEX `id_news`(`id_news` ASC) USING BTREE,
  INDEX `id_user_customer`(`id_user_customer` ASC) USING BTREE,
  CONSTRAINT `comment_news_ibfk_1` FOREIGN KEY (`id_news`) REFERENCES `news` (`id_news`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_news_ibfk_2` FOREIGN KEY (`id_user_customer`) REFERENCES `account_customer` (`id_user_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment_news
-- ----------------------------

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id_contact` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `problem_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_problem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_insert` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_contact`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contact
-- ----------------------------

-- ----------------------------
-- Table structure for infor_web
-- ----------------------------
DROP TABLE IF EXISTS `infor_web`;
CREATE TABLE `infor_web`  (
  `id_infor` int NOT NULL AUTO_INCREMENT,
  `phone_web` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_web` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_web` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_infor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infor_web
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id_news` int NOT NULL AUTO_INCREMENT,
  `title_news` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_news` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url_img_news` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `quantity_comment` int NOT NULL,
  PRIMARY KEY (`id_news`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for price_product
-- ----------------------------
DROP TABLE IF EXISTS `price_product`;
CREATE TABLE `price_product`  (
  `id_product` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp,
  `listed_price` bigint NOT NULL,
  `current_price` bigint NOT NULL,
  `nameAdmin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`, `date`) USING BTREE,
  CONSTRAINT `price_product_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of price_product
-- ----------------------------
INSERT INTO `price_product` VALUES (1, '2023-01-06 12:27:34', 1200000, 100000, NULL);
INSERT INTO `price_product` VALUES (2, '2015-11-10 16:26:42', 11260000, 330000, NULL);
INSERT INTO `price_product` VALUES (3, '2012-01-11 22:40:22', 970000, 1380000, NULL);
INSERT INTO `price_product` VALUES (4, '2017-10-18 16:16:56', 3380000, 9510000, NULL);
INSERT INTO `price_product` VALUES (5, '2018-08-09 00:49:39', 3980000, 2700000, NULL);
INSERT INTO `price_product` VALUES (6, '2017-08-05 16:52:38', 10080000, 3980000, NULL);
INSERT INTO `price_product` VALUES (7, '2017-02-25 02:04:46', 1190000, 8090000, NULL);
INSERT INTO `price_product` VALUES (8, '2012-01-03 01:23:37', 4620000, 10520000, NULL);
INSERT INTO `price_product` VALUES (9, '2005-12-14 22:30:32', 2440000, 4910000, NULL);
INSERT INTO `price_product` VALUES (10, '2016-11-02 11:19:01', 8510000, 10510000, NULL);
INSERT INTO `price_product` VALUES (11, '2004-01-24 09:30:37', 1030000, 2920000, NULL);
INSERT INTO `price_product` VALUES (12, '2015-04-04 00:57:29', 7170000, 7260000, NULL);
INSERT INTO `price_product` VALUES (13, '2006-07-22 09:25:32', 1360000, 7170000, NULL);
INSERT INTO `price_product` VALUES (14, '2019-05-24 17:21:48', 3400000, 9300000, NULL);
INSERT INTO `price_product` VALUES (15, '2006-04-14 00:23:27', 9580000, 590000, NULL);
INSERT INTO `price_product` VALUES (16, '2018-05-10 04:26:03', 9930000, 590000, NULL);
INSERT INTO `price_product` VALUES (17, '2002-02-24 00:25:28', 840000, 9230000, NULL);
INSERT INTO `price_product` VALUES (18, '2022-10-12 02:46:18', 11070000, 8070000, NULL);
INSERT INTO `price_product` VALUES (19, '2016-02-08 10:04:27', 1890000, 4020000, NULL);
INSERT INTO `price_product` VALUES (20, '2007-02-14 06:19:02', 5600000, 3530000, NULL);
INSERT INTO `price_product` VALUES (21, '2021-09-23 09:24:42', 1680000, 4790000, NULL);
INSERT INTO `price_product` VALUES (22, '2001-07-25 04:03:50', 8660000, 9830000, NULL);
INSERT INTO `price_product` VALUES (23, '2012-01-22 17:08:15', 3580000, 1400000, NULL);
INSERT INTO `price_product` VALUES (24, '2000-01-11 08:17:01', 10920000, 10840000, NULL);
INSERT INTO `price_product` VALUES (25, '2017-09-17 07:00:00', 10580000, 2040000, NULL);
INSERT INTO `price_product` VALUES (26, '2006-12-07 00:10:47', 11750000, 400000, NULL);
INSERT INTO `price_product` VALUES (27, '2005-11-19 17:09:16', 8750000, 11650000, NULL);
INSERT INTO `price_product` VALUES (28, '2001-05-07 02:29:30', 250000, 1110000, NULL);
INSERT INTO `price_product` VALUES (29, '2021-07-28 00:08:44', 2710000, 2630000, NULL);
INSERT INTO `price_product` VALUES (30, '2001-08-25 20:06:23', 6730000, 1210000, NULL);
INSERT INTO `price_product` VALUES (31, '2018-02-24 14:35:38', 11740000, 8190000, NULL);
INSERT INTO `price_product` VALUES (32, '2008-07-27 07:34:07', 510000, 4200000, NULL);
INSERT INTO `price_product` VALUES (33, '2022-11-30 11:29:03', 5410000, 6330000, NULL);
INSERT INTO `price_product` VALUES (34, '2021-09-10 09:38:53', 710000, 8730000, NULL);
INSERT INTO `price_product` VALUES (35, '2007-05-08 17:09:54', 6830000, 3260000, NULL);
INSERT INTO `price_product` VALUES (36, '2017-02-06 02:18:40', 9200000, 6080000, NULL);
INSERT INTO `price_product` VALUES (37, '2011-10-20 07:25:49', 3240000, 10540000, NULL);
INSERT INTO `price_product` VALUES (38, '2010-07-08 16:59:35', 8520000, 7120000, NULL);
INSERT INTO `price_product` VALUES (39, '2006-05-12 13:47:53', 1350000, 9970000, NULL);
INSERT INTO `price_product` VALUES (40, '2011-03-20 00:44:23', 6900000, 5910000, NULL);
INSERT INTO `price_product` VALUES (41, '2021-03-05 02:14:12', 2640000, 1360000, NULL);
INSERT INTO `price_product` VALUES (42, '2019-02-10 15:52:43', 6560000, 11950000, NULL);
INSERT INTO `price_product` VALUES (43, '2016-02-24 02:53:39', 5010000, 1020000, NULL);
INSERT INTO `price_product` VALUES (44, '2018-12-02 05:26:18', 1980000, 8910000, NULL);
INSERT INTO `price_product` VALUES (45, '2000-12-18 19:15:36', 11420000, 10060000, NULL);
INSERT INTO `price_product` VALUES (46, '2020-12-24 16:18:57', 4660000, 9630000, NULL);
INSERT INTO `price_product` VALUES (47, '2017-02-05 10:05:12', 7340000, 4280000, NULL);
INSERT INTO `price_product` VALUES (48, '2014-12-07 20:44:11', 440000, 910000, NULL);
INSERT INTO `price_product` VALUES (49, '2002-09-27 02:17:39', 8440000, 7890000, NULL);
INSERT INTO `price_product` VALUES (50, '2002-02-09 14:16:53', 4790000, 6550000, NULL);
INSERT INTO `price_product` VALUES (51, '2015-08-19 04:55:37', 10780000, 1960000, NULL);
INSERT INTO `price_product` VALUES (52, '2001-11-30 00:50:36', 5540000, 5020000, NULL);
INSERT INTO `price_product` VALUES (53, '2015-05-21 23:59:41', 3400000, 4970000, NULL);
INSERT INTO `price_product` VALUES (54, '2004-12-14 15:18:21', 10840000, 7830000, NULL);
INSERT INTO `price_product` VALUES (55, '2004-09-22 03:33:09', 3600000, 690000, NULL);
INSERT INTO `price_product` VALUES (56, '2020-11-13 14:46:12', 4690000, 7850000, NULL);
INSERT INTO `price_product` VALUES (57, '2000-06-29 01:41:00', 3680000, 7740000, NULL);
INSERT INTO `price_product` VALUES (58, '2017-03-10 00:13:47', 5330000, 1640000, NULL);
INSERT INTO `price_product` VALUES (59, '2018-02-27 02:30:54', 840000, 1240000, NULL);
INSERT INTO `price_product` VALUES (60, '2015-11-05 15:02:09', 9420000, 11730000, NULL);
INSERT INTO `price_product` VALUES (61, '2022-02-01 07:29:05', 1870000, 6680000, NULL);
INSERT INTO `price_product` VALUES (62, '2002-03-07 03:00:02', 770000, 5830000, NULL);
INSERT INTO `price_product` VALUES (63, '2002-12-16 14:01:10', 5800000, 8830000, NULL);
INSERT INTO `price_product` VALUES (64, '2016-12-20 08:02:07', 9160000, 2370000, NULL);
INSERT INTO `price_product` VALUES (65, '2008-05-10 01:39:48', 5270000, 5290000, NULL);
INSERT INTO `price_product` VALUES (66, '2007-07-12 01:58:54', 6130000, 1370000, NULL);
INSERT INTO `price_product` VALUES (67, '2011-09-27 20:29:12', 7630000, 3550000, NULL);
INSERT INTO `price_product` VALUES (68, '2005-03-13 02:02:18', 8770000, 1060000, NULL);
INSERT INTO `price_product` VALUES (69, '2018-12-14 04:51:54', 11790000, 5390000, NULL);
INSERT INTO `price_product` VALUES (70, '2007-07-23 22:03:30', 2120000, 280000, NULL);
INSERT INTO `price_product` VALUES (71, '2018-03-05 09:50:00', 9220000, 280000, NULL);
INSERT INTO `price_product` VALUES (72, '2005-07-11 13:22:31', 6030000, 9260000, NULL);
INSERT INTO `price_product` VALUES (73, '2005-06-28 17:04:29', 900000, 5850000, NULL);
INSERT INTO `price_product` VALUES (74, '2016-08-05 10:16:24', 5510000, 10460000, NULL);
INSERT INTO `price_product` VALUES (75, '2006-11-20 14:48:58', 1250000, 1070000, NULL);
INSERT INTO `price_product` VALUES (76, '2018-10-06 03:52:21', 11990000, 11340000, NULL);
INSERT INTO `price_product` VALUES (77, '2015-10-07 18:06:16', 2210000, 9320000, NULL);
INSERT INTO `price_product` VALUES (78, '2015-11-02 20:51:13', 6590000, 10070000, NULL);
INSERT INTO `price_product` VALUES (79, '2010-04-07 01:08:05', 10490000, 10400000, NULL);
INSERT INTO `price_product` VALUES (80, '2016-07-06 23:31:25', 480000, 3070000, NULL);
INSERT INTO `price_product` VALUES (81, '2015-08-11 16:51:34', 2720000, 9790000, NULL);
INSERT INTO `price_product` VALUES (82, '2016-06-16 20:43:02', 7240000, 9780000, NULL);
INSERT INTO `price_product` VALUES (83, '2000-01-07 15:11:00', 11140000, 10520000, NULL);
INSERT INTO `price_product` VALUES (84, '2012-03-21 22:03:29', 840000, 2260000, NULL);
INSERT INTO `price_product` VALUES (85, '2016-04-03 17:39:13', 2230000, 7740000, NULL);
INSERT INTO `price_product` VALUES (86, '2000-02-25 18:18:56', 5300000, 4230000, NULL);
INSERT INTO `price_product` VALUES (87, '2019-03-15 14:00:04', 9260000, 11280000, NULL);
INSERT INTO `price_product` VALUES (88, '2014-11-25 06:49:14', 360000, 1060000, NULL);
INSERT INTO `price_product` VALUES (89, '2010-11-23 10:22:52', 1960000, 1900000, NULL);
INSERT INTO `price_product` VALUES (90, '2003-05-29 23:14:23', 6070000, 11450000, NULL);
INSERT INTO `price_product` VALUES (91, '2010-08-05 06:08:28', 4890000, 8040000, NULL);
INSERT INTO `price_product` VALUES (92, '2013-05-17 04:28:17', 9130000, 9370000, NULL);
INSERT INTO `price_product` VALUES (93, '2006-06-02 12:17:11', 2670000, 10360000, NULL);
INSERT INTO `price_product` VALUES (94, '2014-06-14 23:00:49', 7130000, 6590000, NULL);
INSERT INTO `price_product` VALUES (95, '2022-06-26 16:38:31', 3930000, 3880000, NULL);
INSERT INTO `price_product` VALUES (96, '2022-03-15 20:31:06', 5440000, 11770000, NULL);
INSERT INTO `price_product` VALUES (97, '2012-04-07 07:31:13', 4990000, 5960000, NULL);
INSERT INTO `price_product` VALUES (98, '2019-07-12 01:43:17', 9020000, 8910000, NULL);
INSERT INTO `price_product` VALUES (99, '2002-09-03 00:10:59', 1200000, 1300000, NULL);
INSERT INTO `price_product` VALUES (100, '2016-04-09 12:43:42', 11130000, 6720000, NULL);
INSERT INTO `price_product` VALUES (101, '2013-05-17 10:56:41', 5870000, 9510000, NULL);
INSERT INTO `price_product` VALUES (102, '2007-05-21 05:20:41', 9690000, 9390000, NULL);
INSERT INTO `price_product` VALUES (103, '2018-11-12 14:25:12', 7140000, 390000, NULL);
INSERT INTO `price_product` VALUES (104, '2016-11-07 02:41:27', 11530000, 11630000, NULL);
INSERT INTO `price_product` VALUES (105, '2004-05-04 22:19:53', 2260000, 10630000, NULL);
INSERT INTO `price_product` VALUES (106, '2020-07-26 13:31:25', 1900000, 3230000, NULL);
INSERT INTO `price_product` VALUES (107, '2006-01-10 15:44:33', 1170000, 8260000, NULL);
INSERT INTO `price_product` VALUES (108, '2008-11-28 08:46:13', 11080000, 11150000, NULL);
INSERT INTO `price_product` VALUES (109, '2004-02-08 00:55:46', 4110000, 7200000, NULL);
INSERT INTO `price_product` VALUES (110, '2009-10-21 08:19:26', 700000, 2900000, NULL);
INSERT INTO `price_product` VALUES (111, '2014-10-04 12:54:34', 9660000, 1230000, NULL);
INSERT INTO `price_product` VALUES (112, '2014-09-20 02:40:23', 6960000, 2080000, NULL);
INSERT INTO `price_product` VALUES (113, '2010-03-22 02:55:24', 11070000, 2930000, NULL);
INSERT INTO `price_product` VALUES (114, '2011-11-15 02:39:24', 1860000, 5350000, NULL);
INSERT INTO `price_product` VALUES (115, '2008-05-05 23:29:51', 1650000, 6280000, NULL);
INSERT INTO `price_product` VALUES (116, '2010-11-24 15:25:00', 8950000, 4390000, NULL);
INSERT INTO `price_product` VALUES (117, '2005-06-22 02:19:40', 1300000, 8660000, NULL);
INSERT INTO `price_product` VALUES (118, '2022-05-18 09:33:40', 4330000, 2350000, NULL);
INSERT INTO `price_product` VALUES (119, '2000-02-25 01:23:47', 110000, 8610000, NULL);
INSERT INTO `price_product` VALUES (120, '2000-09-21 19:05:48', 10220000, 8870000, NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `id_subtype` int NOT NULL,
  `id_status_product` int NOT NULL,
  `id_supplier` int NOT NULL,
  `name_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description_product` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `url_img_product` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `quantity_product` int NOT NULL,
  `date_inserted` timestamp NOT NULL DEFAULT current_timestamp,
  `nameAdmin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `views` int NULL DEFAULT 0,
  PRIMARY KEY (`id_product`) USING BTREE,
  INDEX `id_type_product`(`id_subtype` ASC) USING BTREE,
  INDEX `id_status_product`(`id_status_product` ASC) USING BTREE,
  INDEX `id_supplier`(`id_supplier` ASC) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_subtype`) REFERENCES `subtype_product` (`id_subtype`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_status_product`) REFERENCES `status_product` (`id_status_product`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 1, 1, 6, 'Axit Acetic - CH3COOH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_acetic.jpg', 4, '2023-01-06 14:28:49', NULL, 14);
INSERT INTO `products` VALUES (2, 1, 1, 4, 'Axit Carbonic - H2CO3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_carbonic.png', 997, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (3, 1, 1, 2, 'Axit Citric - C6H8O7', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_citric.jpg', 998, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (4, 1, 1, 4, 'Axit Clohydric - HCl', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_clohydric.jpg', 999, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (5, 1, 1, 5, 'Axit Fluoroantimonic - HF', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_hexafluoroantimonic.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (6, 1, 1, 6, 'Axit Hydrofluoric - CH3COOH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_hydrofluoric.jpg', 987, '2023-01-06 14:28:49', NULL, 4);
INSERT INTO `products` VALUES (7, 1, 1, 2, 'Axit Lactic - CH3CHCOOH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_lactic.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (8, 1, 1, 4, 'Axit Nitric - HNO3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_nitric.jpg', 999, '2023-01-06 14:28:49', NULL, 2);
INSERT INTO `products` VALUES (9, 1, 1, 2, 'Axit Perchloric - HClO4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_perchloric.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (10, 1, 1, 5, 'Axit Permanganic - HMnO4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_permanganic.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (11, 1, 1, 6, 'Axit Phosphoric - H3PO4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_phosphoric.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (12, 1, 1, 4, 'Axit Selenic - H2SeO4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_selenic.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (13, 1, 1, 1, 'Axit Sunfuric - H2SO4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_sunfuric.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (14, 1, 1, 5, 'Axit Sunfuro - H2SO3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_sunfuro.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (15, 2, 1, 1, 'Aluminium Hydroxide - Al(OH)3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/bazo/aluminum_hydroxide.jpg', 999, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (16, 2, 1, 4, 'Barium Hydroxide - Ba(OH)2', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/bazo/barium_hydroxide.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (17, 2, 1, 6, 'Calcium Hydroxide - Ca(OH)2', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/bazo/calcium_hydroxit.jpg', 993, '2023-01-06 14:28:49', NULL, 2);
INSERT INTO `products` VALUES (18, 2, 1, 2, 'Cesium Hydroxide - CsOH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/bazo/cesium_hydroxide.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (19, 2, 1, 1, 'Copper(II) Hydroxide - Cu(OH)2', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/bazo/copper2_hydroxide.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (20, 2, 1, 4, 'Magnesium Hydroxide - Mg(OH)2', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/bazo/magnesium_hydroxide.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (21, 2, 1, 6, 'Postassium Hydroxide - KOH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/bazo/potassium_hydroxide.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (22, 2, 1, 3, 'Sodium Hydroxide - NaOH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/bazo/sodium_hydroxide.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (23, 3, 1, 5, 'Barium Sunfate - BaSO4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/barium_sulfate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (24, 3, 1, 1, 'Calcium Carbonate - CaCO3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/calcium_carbonate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (25, 3, 1, 6, 'Copper(II) Sunfate - CuSO4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/copper2_sulfate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (26, 3, 1, 1, 'Iron(II) Sunfate - FeSO4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/iron2_sunfate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (27, 3, 1, 5, 'Kali Permanganat - KMnO4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/kali_penmanganate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (28, 3, 1, 1, 'Silver Nitrate - AgNO3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/silver_nitrate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (29, 3, 1, 2, 'Sodium Carbonate - Na2CO3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/sodium_carbonate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (30, 3, 1, 6, 'Sodium Hydrogen Carbonate - NaHCO3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/sodium_hydrogen_carbonate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (31, 3, 1, 6, 'Sodium Hypochlorite - NaOCl', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/sodium_hypochlorite.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (32, 3, 1, 5, 'Sodium Silicate Nonahydrate - H18Na2O12Si', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/sodium_silicate_nonahydrate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (33, 3, 1, 3, 'Trisodium Phosphate - Na3PO4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/muoi/trisodium_photphate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (34, 4, 1, 1, 'Copper Powder - Cu', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/copper_powder.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (35, 4, 1, 2, 'Copper Turnings - Cu', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/copper_turnings.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (36, 4, 1, 4, 'Aluminum Granules - Al', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/hat_nhom.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (37, 4, 1, 6, 'Iron Powder - Fe', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/iron_powder.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (38, 4, 1, 3, 'Lead Powder - Pb', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/lead_powder.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (39, 4, 1, 4, 'Nickel Powder - Ni', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/nickel_powder.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (40, 4, 1, 6, 'Phosphorus - P', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/phosphorus.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (41, 4, 1, 2, 'Postassium - K', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/postassium.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (42, 4, 1, 6, 'Silver - Ag', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/silver.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (43, 4, 1, 1, 'Sodium - Na', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/sodium.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (44, 4, 1, 3, 'Zinc Powder - Zn', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/kim_loai/zinc_powder.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (45, 5, 1, 5, 'Bromocresol Purple - C21H16Br2O5S', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/chi_thi/bromocresol_purple.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (46, 5, 1, 2, 'Bromocresol Blue - C19H10Br4O5S', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/chi_thi/bromophenol_blue.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (47, 5, 1, 5, 'Methyl Orange - C14H14N3NaO3S', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/chi_thi/methyl_orange.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (48, 5, 1, 1, 'Murexide - C8H8N6O6', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/chi_thi/murexide.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (49, 5, 1, 6, 'Phenolphtalein - C20H14O4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/chi_thi/phenolphtalein.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (50, 6, 1, 3, 'Cyclopentane - C5H10', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/dung_moi/cyclopentane.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (51, 6, 1, 5, 'Dichloromethane - CH2Cl2', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/dung_moi/dichloromethane.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (52, 6, 1, 3, 'Ethyl Acetate - C4H8O2', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/dung_moi/ethyl_acetate.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (53, 6, 1, 5, 'Hexane - C6H14', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/dung_moi/hexane.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (54, 6, 1, 4, 'Nước cất - H20', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/dung_moi/nuoc_cat.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (55, 6, 1, 1, 'Tetrahydrofuran - C4H8O', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/dung_moi/tetrahydrofuran.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (56, 6, 1, 1, 'Toluene - C7H8', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/dung_moi/toluene.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (57, 7, 1, 1, 'Barfoed - RCHO + Cu + H2O', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/thuoc_thu/barfoed.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (58, 7, 1, 5, 'Benedict - RCHO + Cu + OH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/thuoc_thu/benedict.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (59, 7, 1, 3, 'Biuret - (H2NCO)2NH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/thuoc_thu/biuret.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (60, 7, 1, 2, 'Bradford', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/thuoc_thu/bradford.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (61, 8, 1, 4, 'Acetone - (CH3)2CO', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/acetone.jpg', 999, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (62, 8, 1, 1, 'Benzen - C6H6', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/benzen.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (63, 8, 1, 4, 'Chloroform - CHCl3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/chloroform.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (64, 8, 1, 1, 'Ethanal - CH3CHO', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/ethanal.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (65, 8, 1, 3, 'Ethanol - C2H6O', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/ethanol.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (66, 8, 1, 2, 'Etilen - C2H4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/etilen.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (67, 8, 1, 3, 'Methanol - CH3OH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/methanol.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (68, 8, 1, 6, 'Pentane - C5H12', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/pentane.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (69, 8, 1, 1, 'Phenol - C6H5OH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/phenol.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (70, 8, 1, 6, 'Sucrose - C12H22O11', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/sucrose.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (71, 8, 1, 3, 'Xylene - (CH3)2C6H4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/hop_chat_huu_co/xylene.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (72, 9, 1, 5, 'Aluminium Oxit - Al2O3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/oxit/aluminium_oxit.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (73, 9, 1, 5, 'Bari Oxit - BaO', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/oxit/bari_oxit.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (74, 9, 1, 3, 'Calcium Oxit - CaO', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/oxit/calcium_oxit.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (75, 9, 1, 5, 'Copper(II) Oxit - CuO', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/oxit/copper2_oxit.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (76, 9, 1, 2, 'Ferric Oxit - Fe2O3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/oxit/ferric_oxit.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (77, 9, 1, 4, 'Iron2 Oxit - FeO', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/oxit/iron2_oxit.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (78, 9, 1, 5, 'Phosphorus Pentoxide - P4O10', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/oxit/phosphorus_pentoxide.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (79, 9, 1, 2, 'Sodium Oxit - Na2O', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/oxit/sodium_oxit.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (80, 9, 1, 4, 'Triiron Tetroxide - Fe3O4', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/oxit/triiron_tetroxide.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (81, 9, 1, 3, 'Zinc Oxit - ZnO', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/oxit/zinc_oxit.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (82, 10, 1, 1, 'Giá Đỡ Ống Nghiệm', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/gia_do_ong_nghiem.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (83, 10, 1, 6, 'Kệ Đựng Ống Nghiệm', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/gia_do_ong_nghiem_2.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (84, 10, 1, 5, 'Giá Đỡ Ống Nghiệm', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/gia_do_ong_nghiem_3.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (85, 10, 1, 1, 'Giá Đỡ Ống Nghiệm', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/gia_do_ong_nghiem_4.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (86, 10, 1, 2, 'Giá Ống Nghiệm', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/gia_do_ong_nghiem_5.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (87, 10, 1, 1, 'Giá Đỡ Hai Tầng', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/gia_do_ong_nghiem_6.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (88, 11, 1, 4, 'Kẹp Gỗ', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/kep_go.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (89, 11, 1, 3, 'Kẹp Gỗ', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/kep_go_2.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (90, 11, 1, 4, 'Kẹp Cán Sắt', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/kep_go_3.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (91, 11, 1, 4, 'Kẹp Gỗ', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/kep_go_4.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (92, 12, 1, 2, 'Bình Tam Giác', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/binh_tam_giac.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (93, 12, 1, 2, 'Cốc Thủy Tinh', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/coc_thuy_tinh.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (94, 12, 1, 2, 'Đũa Thủy Tinh', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/dua_thuy_tinh.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (95, 12, 1, 2, 'Ống Nghiệm', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/ong_nghiem.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (96, 12, 1, 2, 'Ống Nghiệm Có Nút Gỗ', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/ong_nghiem_2.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (97, 12, 1, 2, 'Ống Nghiệm Nút Nhựa', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/ong_nghiem_3.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (98, 12, 1, 2, 'Ống Nghiệm Nút Gỗ', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/ong_nghiem_4.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (99, 13, 1, 6, 'Ông Hút Nhỏ Giọt', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/ong_nho_giot.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (100, 13, 1, 6, 'Ông Hút Nhỏ Giọt', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/ong_nho_giot_2.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (101, 13, 1, 6, 'Ông Hút Nhỏ Giọt', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/ong_nho_giot_3.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (102, 13, 1, 6, 'Ông Hút Nhỏ Giọt', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/ong_nho_giot_4.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (103, 13, 1, 6, 'Ông Hút Nhỏ Giọt', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/ong_nho_giot_5.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (104, 14, 1, 5, 'Cân Điện Tử Extech SC600', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/can_dien_tu.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (105, 14, 1, 5, 'Cân Điện Tử Lutron GM6', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/can_dien_tu_2.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (106, 14, 1, 5, 'Cân Điện Tử Omron', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/can_dien_tu_3.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (107, 14, 1, 5, 'Cân Điện Tử Microlife', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/can_dien_tu_4.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (108, 15, 1, 6, 'Máy Khuấy Không Gia Nhiệt', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_khuay.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (109, 15, 1, 6, 'Máy Khuấy SHINKO TG-40', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_khuay_2.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (110, 15, 1, 6, 'Máy Khuấy Từ Hanna HI 324N', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_khuay_3.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (111, 15, 1, 6, 'Máy Khuấy Từ HI 200', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_khuay_4.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (112, 15, 1, 6, 'Máy Khuấy Đảo Chiều', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_khuay_5.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (113, 16, 1, 4, 'Máy Nghiền Mẫu IKA A-10', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_nghien.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (114, 16, 1, 4, 'Máy Nghiền Mẫu MF-10', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_nghien_2.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (115, 16, 1, 4, 'Máy Nghiền Mẫu Phân Tích', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_nghien_3.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (116, 16, 1, 4, 'Máy Nghiền Tube Mill', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_nghien_4.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (117, 17, 1, 1, 'Tủ Chân Không', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/tu_chan_khong.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (118, 17, 1, 1, 'Tủ Sấy', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/tu_chan_khong_2.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (119, 17, 1, 1, 'Tủ Hút Khí Độc', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/tu_hut_khi_doc.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (120, 17, 1, 1, 'Tủ Thao Tác PCR', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/tu_pcr.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);

-- ----------------------------
-- Table structure for review_product
-- ----------------------------
DROP TABLE IF EXISTS `review_product`;
CREATE TABLE `review_product`  (
  `id_review` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `stars` tinyint NULL DEFAULT 0,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_review`, `id_product`) USING BTREE,
  INDEX `fk_review_product`(`id_product` ASC) USING BTREE,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review_product
-- ----------------------------
INSERT INTO `review_product` VALUES (1, 1, 5, 'Tốt', 'abc', '123', 'abc@gmail.com');
INSERT INTO `review_product` VALUES (2, 1, 5, 'Rất tốt', 'Nguyễn Thị Hường', '0123456789', 'huong@email.com');
INSERT INTO `review_product` VALUES (3, 1, 3, 'OK', 'dsfdsf', '123', 'dad@email.com');

-- ----------------------------
-- Table structure for role_admin
-- ----------------------------
DROP TABLE IF EXISTS `role_admin`;
CREATE TABLE `role_admin`  (
  `id_role_admin` int NOT NULL,
  `name_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_role_admin`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_admin
-- ----------------------------
INSERT INTO `role_admin` VALUES (1, 'root');
INSERT INTO `role_admin` VALUES (2, 'member');

-- ----------------------------
-- Table structure for sold_product
-- ----------------------------
DROP TABLE IF EXISTS `sold_product`;
CREATE TABLE `sold_product`  (
  `id_product` int NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp,
  `quantity_sold` int NOT NULL,
  PRIMARY KEY (`id_product`, `datetime`) USING BTREE,
  CONSTRAINT `sold_product_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sold_product
-- ----------------------------

-- ----------------------------
-- Table structure for status_acc
-- ----------------------------
DROP TABLE IF EXISTS `status_acc`;
CREATE TABLE `status_acc`  (
  `id_status_acc` int NOT NULL,
  `name_status_acc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_acc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status_acc
-- ----------------------------
INSERT INTO `status_acc` VALUES (1, 'Bình thường');
INSERT INTO `status_acc` VALUES (2, 'Tạm khóa');
INSERT INTO `status_acc` VALUES (3, 'Khóa vĩnh viễn');

-- ----------------------------
-- Table structure for status_bill
-- ----------------------------
DROP TABLE IF EXISTS `status_bill`;
CREATE TABLE `status_bill`  (
  `id_status_bill` int NOT NULL,
  `name_status_bill` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_status_bill`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status_bill
-- ----------------------------
INSERT INTO `status_bill` VALUES (1, 'Đã giao');
INSERT INTO `status_bill` VALUES (2, 'Đang vận chuyển');
INSERT INTO `status_bill` VALUES (3, 'Đã hủy');
INSERT INTO `status_bill` VALUES (4, 'Chờ xử lý');

-- ----------------------------
-- Table structure for status_product
-- ----------------------------
DROP TABLE IF EXISTS `status_product`;
CREATE TABLE `status_product`  (
  `id_status_product` int NOT NULL,
  `name_status_product` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_status_product`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status_product
-- ----------------------------
INSERT INTO `status_product` VALUES (1, 'Mới');
INSERT INTO `status_product` VALUES (2, 'Hot');
INSERT INTO `status_product` VALUES (3, 'Cấm Bán');

-- ----------------------------
-- Table structure for subtype_product
-- ----------------------------
DROP TABLE IF EXISTS `subtype_product`;
CREATE TABLE `subtype_product`  (
  `id_subtype` int NOT NULL,
  `name_subtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_type_product` int NOT NULL,
  `sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_subtype`) USING BTREE,
  INDEX `id_type_product`(`id_type_product` ASC) USING BTREE,
  CONSTRAINT `subtype_product_ibfk_1` FOREIGN KEY (`id_type_product`) REFERENCES `type_product` (`id_type_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subtype_product
-- ----------------------------
INSERT INTO `subtype_product` VALUES (1, 'Axit', 1, NULL);
INSERT INTO `subtype_product` VALUES (2, 'Bazo', 1, NULL);
INSERT INTO `subtype_product` VALUES (3, 'Muối', 1, NULL);
INSERT INTO `subtype_product` VALUES (4, 'Kim Loại', 1, NULL);
INSERT INTO `subtype_product` VALUES (5, 'Chất Chỉ Thị', 1, NULL);
INSERT INTO `subtype_product` VALUES (6, 'Dung Môi', 1, NULL);
INSERT INTO `subtype_product` VALUES (7, 'Thuốc Thử', 1, NULL);
INSERT INTO `subtype_product` VALUES (8, 'Hợp Chất Hữu Cơ', 1, NULL);
INSERT INTO `subtype_product` VALUES (9, 'Oxit', 1, NULL);
INSERT INTO `subtype_product` VALUES (10, 'Giá Đỡ Ống Nghiệm', 2, NULL);
INSERT INTO `subtype_product` VALUES (11, 'Kẹp Gỗ', 2, NULL);
INSERT INTO `subtype_product` VALUES (12, 'Dụng Cụ Thủy Tinh', 2, NULL);
INSERT INTO `subtype_product` VALUES (13, 'Ống Hút Nhỏ Giọt', 2, NULL);
INSERT INTO `subtype_product` VALUES (14, 'Cân Điện Tử', 3, NULL);
INSERT INTO `subtype_product` VALUES (15, 'Máy Khuấy', 3, NULL);
INSERT INTO `subtype_product` VALUES (16, 'Máy Nghiền Mẫu', 3, NULL);
INSERT INTO `subtype_product` VALUES (17, 'Các Loại Tủ', 3, NULL);

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `name_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_supplier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of suppliers
-- ----------------------------
INSERT INTO `suppliers` VALUES (1, 'Merck - Đức');
INSERT INTO `suppliers` VALUES (2, 'Acros Organics - Mỹ');
INSERT INTO `suppliers` VALUES (3, 'Fisher - Mỹ');
INSERT INTO `suppliers` VALUES (4, 'BOSF - Trung Quốc');
INSERT INTO `suppliers` VALUES (5, 'Duchefa - Hà Lan');
INSERT INTO `suppliers` VALUES (6, 'Wako - Nhật Bản');

-- ----------------------------
-- Table structure for type_product
-- ----------------------------
DROP TABLE IF EXISTS `type_product`;
CREATE TABLE `type_product`  (
  `id_type_product` int NOT NULL AUTO_INCREMENT,
  `name_type_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_type_product`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type_product
-- ----------------------------
INSERT INTO `type_product` VALUES (1, 'Hóa Chất');
INSERT INTO `type_product` VALUES (2, 'Dụng Cụ');
INSERT INTO `type_product` VALUES (3, 'Thiết Bị');

-- ----------------------------
-- Triggers structure for table bill_detail
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger_sold`;
delimiter ;;
CREATE TRIGGER `trigger_sold` AFTER INSERT ON `bill_detail` FOR EACH ROW BEGIN
	UPDATE `sold_product` SET quantity_sold = (SELECT SUM(quantity) FROM bill_detail WHERE id_product = NEW.id_product) WHERE id_product = NEW.id_product;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table price_product
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_product`;
delimiter ;;
CREATE TRIGGER `delete_product` AFTER DELETE ON `price_product` FOR EACH ROW BEGIN
	DELETE FROM `sold_product` WHERE `id_product` = OLD.id_product;
	DELETE FROM `products` WHERE `id_product` = OLD.id_product;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table review_product
-- ----------------------------
DROP TRIGGER IF EXISTS `limit_stars`;
delimiter ;;
CREATE TRIGGER `limit_stars` BEFORE INSERT ON `review_product` FOR EACH ROW BEGIN
	IF NEW.stars > 5 OR NEW.stars < 1 THEN SIGNAL SQLSTATE '45001' SET message_text = 'stars must be in 1 - 5';
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table review_product
-- ----------------------------
DROP TRIGGER IF EXISTS `limit_stars_update`;
delimiter ;;
CREATE TRIGGER `limit_stars_update` BEFORE UPDATE ON `review_product` FOR EACH ROW BEGIN
	IF NEW.stars > 5 OR NEW.stars < 1 THEN SIGNAL SQLSTATE '45001' SET message_text = 'stars must be in 1 - 5';
	END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
