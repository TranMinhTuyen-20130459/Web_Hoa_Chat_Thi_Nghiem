/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : test_hoa_chat_thi_nghiem

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 20/06/2023 14:17:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_admins
-- ----------------------------
DROP TABLE IF EXISTS `account_admins`;
CREATE TABLE `account_admins`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_role_admin` int NOT NULL,
  `id_status_acc` int NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp,
  `time_change_pass` timestamp NOT NULL DEFAULT current_timestamp,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url_image_admin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE,
  INDEX `id_status_acc`(`id_status_acc` ASC) USING BTREE,
  INDEX `id_role_admin`(`id_role_admin` ASC) USING BTREE,
  CONSTRAINT `account_admins_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_accs` (`id_status_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_admins_ibfk_2` FOREIGN KEY (`id_role_admin`) REFERENCES `role_admins` (`id_role_admin`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_admins
-- ----------------------------
INSERT INTO `account_admins` VALUES ('tranminhtuyen', ' ', 2, 1, '123456789', '2023-05-09 21:57:51', '2023-05-09 21:57:51', NULL, NULL);
INSERT INTO `account_admins` VALUES ('tuyen_tai_lenh', '', 3, 1, '2k2k2', '2023-05-07 10:06:51', '2023-05-07 10:06:51', NULL, NULL);

-- ----------------------------
-- Table structure for account_customers
-- ----------------------------
DROP TABLE IF EXISTS `account_customers`;
CREATE TABLE `account_customers`  (
  `id_user_customer` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_status_acc` int NOT NULL,
  `id_city` int NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email_customer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone_customer` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp,
  `time_change_pass` timestamp NOT NULL DEFAULT current_timestamp,
  `id_user_fb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_user_gg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_type_acc` int NULL DEFAULT NULL,
  `failed_count` decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_user_customer`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `id_status_acc`(`id_status_acc` ASC) USING BTREE,
  INDEX `id_city`(`id_city` ASC) USING BTREE,
  INDEX `account_customer_ibfk_3`(`id_type_acc` ASC) USING BTREE,
  CONSTRAINT `account_customers_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_accs` (`id_status_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_customers_ibfk_3` FOREIGN KEY (`id_type_acc`) REFERENCES `type_accs` (`id_type_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_customers
-- ----------------------------
INSERT INTO `account_customers` VALUES (50, 'FB487782076904211', '487782076904211@fb123', 1, 0, 'Trần Tuyên', NULL, 'tmt010101ccna@gmail.com', NULL, NULL, '2023-06-20 11:42:37', '2023-06-20 11:42:37', '487782076904211', NULL, 2, NULL);

-- ----------------------------
-- Table structure for bill_details
-- ----------------------------
DROP TABLE IF EXISTS `bill_details`;
CREATE TABLE `bill_details`  (
  `id_bill` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL,
  `listed_price` bigint NOT NULL,
  `current_price` bigint NOT NULL,
  PRIMARY KEY (`id_bill`, `id_product`) USING BTREE,
  INDEX `id_product`(`id_product` ASC) USING BTREE,
  CONSTRAINT `bill_details_ibfk_1` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id_bill`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bill_details_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bill_details
-- ----------------------------
INSERT INTO `bill_details` VALUES (503, 1, 1, 1200000, 100000);
INSERT INTO `bill_details` VALUES (503, 113, 1, 11070000, 2930000);

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills`  (
  `id_bill` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_status_bill` int NOT NULL,
  `id_city` int NULL DEFAULT NULL,
  `shop_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `from_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `from_ward_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `from_district_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `from_province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `requied_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `return_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `return_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `return_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `return_ward_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `return_district_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `return_province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `to_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_ward_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_district_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code_voucher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ship_price` decimal(10, 2) NULL DEFAULT NULL,
  `bill_price_before` decimal(10, 2) NULL DEFAULT NULL,
  `bill_price_after` decimal(10, 2) NULL DEFAULT NULL,
  `insurance_value` decimal(10, 2) NULL DEFAULT NULL,
  `time_order` datetime NULL DEFAULT current_timestamp,
  `email_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `from_province_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `from_district_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `from_ward_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `to_province_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `to_district_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `to_ward_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `height` decimal(10, 0) NULL DEFAULT 100,
  `length` decimal(10, 0) NULL DEFAULT 100,
  `width` decimal(10, 0) NULL DEFAULT 100,
  `weight` decimal(10, 0) NULL DEFAULT 100,
  `fee` decimal(10, 0) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `lead_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_logistic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_bill`) USING BTREE,
  INDEX `id_user`(`id_user` ASC) USING BTREE,
  INDEX `id_status_bill`(`id_status_bill` ASC) USING BTREE,
  INDEX `id_city`(`id_city` ASC) USING BTREE,
  CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`id_status_bill`) REFERENCES `status_bills` (`id_status_bill`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 504 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bills
-- ----------------------------
INSERT INTO `bills` VALUES (503, 50, 2, NULL, '1', '1', '1', '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Trần Minh Tuyên', '0379342981', 'Đại học Nông Lâm', 'Xã Hòa Ninh', 'Huyện Di Linh', 'Lâm Đồng', NULL, NULL, 912000.00, 3030000.00, 3942000.00, NULL, '2023-06-20 11:43:28', 'trantuyen.developer.981@gmail.com', '0', '0', '0', '209', '3160', '420411', 100, 100, 100, 100, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`  (
  `id_city` int NOT NULL AUTO_INCREMENT,
  `name_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport` bigint NOT NULL,
  PRIMARY KEY (`id_city`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES (1, 'Hồ Chí Minh', 10000);
INSERT INTO `cities` VALUES (2, 'Hà Nội', 30000);
INSERT INTO `cities` VALUES (3, 'Đà Nẵng', 20000);

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
  CONSTRAINT `comment_news_ibfk_2` FOREIGN KEY (`id_user_customer`) REFERENCES `account_customers` (`id_user_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment_news
-- ----------------------------

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
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
-- Records of contacts
-- ----------------------------

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id_image` int NOT NULL AUTO_INCREMENT,
  `id_status_image` int NULL DEFAULT NULL,
  `url_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_inserted` datetime NULL DEFAULT current_timestamp,
  `date_updated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_image`) USING BTREE,
  INDEX `fk_status_img`(`id_status_image` ASC) USING BTREE,
  CONSTRAINT `fk_status_img` FOREIGN KEY (`id_status_image`) REFERENCES `status_images` (`id_status_image`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (1, 1, '/images/products/hoa_chat/axit/axit_acetic.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (2, 1, '/images/products/hoa_chat/axit/axit_carbonic.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (3, 1, '/images/products/hoa_chat/axit/axit_citric.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (4, 1, '/images/products/hoa_chat/axit/axit_clohydric.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (5, 1, '/images/products/hoa_chat/axit/axit_hexafluoroantimonic.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (6, 1, '/images/products/hoa_chat/axit/axit_hydrofluoric.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (7, 1, '/images/products/hoa_chat/axit/axit_lactic.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (8, 1, '/images/products/hoa_chat/axit/axit_nitric.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (9, 1, '/images/products/hoa_chat/axit/axit_perchloric.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (10, 1, '/images/products/hoa_chat/axit/axit_permanganic.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (11, 1, '/images/products/hoa_chat/axit/axit_phosphoric.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (12, 1, '/images/products/hoa_chat/axit/axit_selenic.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (13, 1, '/images/products/hoa_chat/axit/axit_sunfuric.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (14, 1, '/images/products/hoa_chat/axit/axit_sunfuro.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (15, 1, '/images/products/hoa_chat/bazo/aluminum_hydroxide.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (16, 1, '/images/products/hoa_chat/bazo/barium_hydroxide.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (17, 1, '/images/products/hoa_chat/bazo/calcium_hydroxit.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (18, 1, '/images/products/hoa_chat/bazo/cesium_hydroxide.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (19, 1, '/images/products/hoa_chat/bazo/copper2_hydroxide.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (20, 1, '/images/products/hoa_chat/bazo/magnesium_hydroxide.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (21, 1, '/images/products/hoa_chat/bazo/potassium_hydroxide.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (22, 1, '/images/products/hoa_chat/bazo/sodium_hydroxide.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (23, 1, '/images/products/hoa_chat/muoi/barium_sulfate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (24, 1, '/images/products/hoa_chat/muoi/calcium_carbonate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (25, 1, '/images/products/hoa_chat/muoi/copper2_sulfate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (26, 1, '/images/products/hoa_chat/muoi/iron2_sunfate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (27, 1, '/images/products/hoa_chat/muoi/kali_penmanganate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (28, 1, '/images/products/hoa_chat/muoi/silver_nitrate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (29, 1, '/images/products/hoa_chat/muoi/sodium_carbonate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (30, 1, '/images/products/hoa_chat/muoi/sodium_hydrogen_carbonate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (31, 1, '/images/products/hoa_chat/muoi/sodium_hypochlorite.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (32, 1, '/images/products/hoa_chat/muoi/sodium_silicate_nonahydrate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (33, 1, '/images/products/hoa_chat/muoi/trisodium_photphate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (34, 1, '/images/products/hoa_chat/kim_loai/copper_powder.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (35, 1, '/images/products/hoa_chat/kim_loai/copper_turnings.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (36, 1, '/images/products/hoa_chat/kim_loai/hat_nhom.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (37, 1, '/images/products/hoa_chat/kim_loai/iron_powder.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (38, 1, '/images/products/hoa_chat/kim_loai/lead_powder.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (39, 1, '/images/products/hoa_chat/kim_loai/nickel_powder.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (40, 1, '/images/products/hoa_chat/kim_loai/phosphorus.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (41, 1, '/images/products/hoa_chat/kim_loai/postassium.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (42, 1, '/images/products/hoa_chat/kim_loai/silver.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (43, 1, '/images/products/hoa_chat/kim_loai/sodium.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (44, 1, '/images/products/hoa_chat/kim_loai/zinc_powder.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (45, 1, '/images/products/hoa_chat/chi_thi/bromocresol_purple.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (46, 1, '/images/products/hoa_chat/chi_thi/bromophenol_blue.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (47, 1, '/images/products/hoa_chat/chi_thi/methyl_orange.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (48, 1, '/images/products/hoa_chat/chi_thi/murexide.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (49, 1, '/images/products/hoa_chat/chi_thi/phenolphtalein.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (50, 1, '/images/products/hoa_chat/dung_moi/cyclopentane.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (51, 1, '/images/products/hoa_chat/dung_moi/dichloromethane.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (52, 1, '/images/products/hoa_chat/dung_moi/ethyl_acetate.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (53, 1, '/images/products/hoa_chat/dung_moi/hexane.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (54, 1, '/images/products/hoa_chat/dung_moi/nuoc_cat.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (55, 1, '/images/products/hoa_chat/dung_moi/tetrahydrofuran.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (56, 1, '/images/products/hoa_chat/dung_moi/toluene.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (57, 1, '/images/products/hoa_chat/thuoc_thu/barfoed.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (58, 1, '/images/products/hoa_chat/thuoc_thu/benedict.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (59, 1, '/images/products/hoa_chat/thuoc_thu/biuret.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (60, 1, '/images/products/hoa_chat/thuoc_thu/bradford.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (61, 1, '/images/products/hoa_chat/hop_chat_huu_co/acetone.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (62, 1, '/images/products/hoa_chat/hop_chat_huu_co/benzen.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (63, 1, '/images/products/hoa_chat/hop_chat_huu_co/chloroform.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (64, 1, '/images/products/hoa_chat/hop_chat_huu_co/ethanal.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (65, 1, '/images/products/hoa_chat/hop_chat_huu_co/ethanol.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (66, 1, '/images/products/hoa_chat/hop_chat_huu_co/etilen.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (67, 1, '/images/products/hoa_chat/hop_chat_huu_co/methanol.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (68, 1, '/images/products/hoa_chat/hop_chat_huu_co/pentane.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (69, 1, '/images/products/hoa_chat/hop_chat_huu_co/phenol.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (70, 1, '/images/products/hoa_chat/hop_chat_huu_co/sucrose.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (71, 1, '/images/products/hoa_chat/hop_chat_huu_co/xylene.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (72, 1, '/images/products/hoa_chat/oxit/aluminium_oxit.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (73, 1, '/images/products/hoa_chat/oxit/bari_oxit.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (74, 1, '/images/products/hoa_chat/oxit/calcium_oxit.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (75, 1, '/images/products/hoa_chat/oxit/copper2_oxit.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (76, 1, '/images/products/hoa_chat/oxit/ferric_oxit.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (77, 1, '/images/products/hoa_chat/oxit/iron2_oxit.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (78, 1, '/images/products/hoa_chat/oxit/phosphorus_pentoxide.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (79, 1, '/images/products/hoa_chat/oxit/sodium_oxit.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (80, 1, '/images/products/hoa_chat/oxit/triiron_tetroxide.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (81, 1, '/images/products/hoa_chat/oxit/zinc_oxit.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (82, 1, '/images/products/dung_cu/gia_do_ong_nghiem.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (83, 1, '/images/products/dung_cu/gia_do_ong_nghiem_2.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (84, 1, '/images/products/dung_cu/gia_do_ong_nghiem_3.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (85, 1, '/images/products/dung_cu/gia_do_ong_nghiem_4.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (86, 1, '/images/products/dung_cu/gia_do_ong_nghiem_5.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (87, 1, '/images/products/dung_cu/gia_do_ong_nghiem_6.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (88, 1, '/images/products/dung_cu/kep_go.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (89, 1, '/images/products/dung_cu/kep_go_2.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (90, 1, '/images/products/dung_cu/kep_go_3.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (91, 1, '/images/products/dung_cu/kep_go_4.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (92, 1, '/images/products/dung_cu/binh_tam_giac.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (93, 1, '/images/products/dung_cu/coc_thuy_tinh.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (94, 1, '/images/products/dung_cu/dua_thuy_tinh.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (95, 1, '/images/products/dung_cu/ong_nghiem.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (96, 1, '/images/products/dung_cu/ong_nghiem_2.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (97, 1, '/images/products/dung_cu/ong_nghiem_3.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (98, 1, '/images/products/dung_cu/ong_nghiem_4.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (99, 1, '/images/products/dung_cu/ong_nho_giot.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (100, 1, '/images/products/dung_cu/ong_nho_giot_2.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (101, 1, '/images/products/dung_cu/ong_nho_giot_3.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (102, 1, '/images/products/dung_cu/ong_nho_giot_4.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (103, 1, '/images/products/dung_cu/ong_nho_giot_5.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (104, 1, '/images/products/thiet_bi/can_dien_tu.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (105, 1, '/images/products/thiet_bi/can_dien_tu_2.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (106, 1, '/images/products/thiet_bi/can_dien_tu_3.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (107, 1, '/images/products/thiet_bi/can_dien_tu_4.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (108, 1, '/images/products/thiet_bi/may_khuay.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (109, 1, '/images/products/thiet_bi/may_khuay_2.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (110, 1, '/images/products/thiet_bi/may_khuay_3.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (111, 1, '/images/products/thiet_bi/may_khuay_4.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (112, 1, '/images/products/thiet_bi/may_khuay_5.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (113, 1, '/images/products/thiet_bi/may_nghien.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (114, 1, '/images/products/thiet_bi/may_nghien_2.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (115, 1, '/images/products/thiet_bi/may_nghien_3.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (116, 1, '/images/products/thiet_bi/may_nghien_4.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (117, 1, '/images/products/thiet_bi/tu_chan_khong.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (118, 1, '/images/products/thiet_bi/tu_chan_khong_2.jpg', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (119, 1, '/images/products/thiet_bi/tu_hut_khi_doc.png', '2023-06-20 11:03:46', NULL);
INSERT INTO `images` VALUES (120, 1, '/images/products/thiet_bi/tu_pcr.jpg', '2023-06-20 11:03:46', NULL);

-- ----------------------------
-- Table structure for infor_webs
-- ----------------------------
DROP TABLE IF EXISTS `infor_webs`;
CREATE TABLE `infor_webs`  (
  `id_infor` int NOT NULL AUTO_INCREMENT,
  `phone_web` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_web` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_web` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_infor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infor_webs
-- ----------------------------

-- ----------------------------
-- Table structure for level_logs
-- ----------------------------
DROP TABLE IF EXISTS `level_logs`;
CREATE TABLE `level_logs`  (
  `id_level` int NOT NULL,
  `name_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of level_logs
-- ----------------------------
INSERT INTO `level_logs` VALUES (1, 'INFOR');
INSERT INTO `level_logs` VALUES (2, 'ALERT');
INSERT INTO `level_logs` VALUES (3, 'WARNING');
INSERT INTO `level_logs` VALUES (4, 'DANGER');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id_log` bigint NOT NULL AUTO_INCREMENT,
  `id_level` int NULL DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '-1',
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `web_browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT current_timestamp,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_log`) USING BTREE,
  INDEX `id_level`(`id_level` ASC) USING BTREE,
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level_logs` (`id_level`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 766 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (760, 1, 'tuyen_tai_lenh', '', 'Thêm sản phảm', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.51', '2023-06-20 10:18:16', '');
INSERT INTO `logs` VALUES (761, 1, NULL, 'Unknown', 'Searched with content: Test ', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.51', '2023-06-20 10:19:38', 'Active');
INSERT INTO `logs` VALUES (762, 3, '50', '', 'Tạo tài khoản bằng thông tin tài khoản Fb', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.51', '2023-06-20 11:42:37', '');
INSERT INTO `logs` VALUES (763, 2, '50', '', 'đăng nhập hệ thống bằng tài khoản Fb', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.51', '2023-06-20 11:42:37', '');
INSERT INTO `logs` VALUES (764, 2, '50', 'Table bills and bill_details', 'Insert bill to table bills and bill_details', '', '', '2023-06-20 11:43:28', '');
INSERT INTO `logs` VALUES (765, 3, NULL, 'tuyen_tai_lenh', 'Cập nhật trạng thái đơn hàng về \'ĐANG GIAO HÀNG\'', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.51', '2023-06-20 11:44:49', 'Thành công');

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
-- Table structure for price_products
-- ----------------------------
DROP TABLE IF EXISTS `price_products`;
CREATE TABLE `price_products`  (
  `id_product` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp,
  `listed_price` bigint NOT NULL,
  `current_price` bigint NOT NULL,
  `nameAdmin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`, `date`) USING BTREE,
  CONSTRAINT `price_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of price_products
-- ----------------------------
INSERT INTO `price_products` VALUES (1, '2023-01-06 12:27:34', 1200000, 100000, NULL);
INSERT INTO `price_products` VALUES (2, '2015-11-10 16:26:42', 11260000, 330000, NULL);
INSERT INTO `price_products` VALUES (3, '2012-01-11 22:40:22', 970000, 1380000, NULL);
INSERT INTO `price_products` VALUES (4, '2017-10-18 16:16:56', 3380000, 9510000, NULL);
INSERT INTO `price_products` VALUES (5, '2018-08-09 00:49:39', 3980000, 2700000, NULL);
INSERT INTO `price_products` VALUES (6, '2017-08-05 16:52:38', 10080000, 3980000, NULL);
INSERT INTO `price_products` VALUES (7, '2017-02-25 02:04:46', 1190000, 8090000, NULL);
INSERT INTO `price_products` VALUES (8, '2012-01-03 01:23:37', 4620000, 10520000, NULL);
INSERT INTO `price_products` VALUES (9, '2005-12-14 22:30:32', 2440000, 4910000, NULL);
INSERT INTO `price_products` VALUES (10, '2016-11-02 11:19:01', 8510000, 10510000, NULL);
INSERT INTO `price_products` VALUES (11, '2004-01-24 09:30:37', 1030000, 2920000, NULL);
INSERT INTO `price_products` VALUES (12, '2015-04-04 00:57:29', 7170000, 7260000, NULL);
INSERT INTO `price_products` VALUES (13, '2006-07-22 09:25:32', 1360000, 7170000, NULL);
INSERT INTO `price_products` VALUES (14, '2019-05-24 17:21:48', 3400000, 9300000, NULL);
INSERT INTO `price_products` VALUES (15, '2006-04-14 00:23:27', 9580000, 590000, NULL);
INSERT INTO `price_products` VALUES (16, '2018-05-10 04:26:03', 9930000, 590000, NULL);
INSERT INTO `price_products` VALUES (17, '2002-02-24 00:25:28', 840000, 9230000, NULL);
INSERT INTO `price_products` VALUES (18, '2022-10-12 02:46:18', 11070000, 8070000, NULL);
INSERT INTO `price_products` VALUES (19, '2016-02-08 10:04:27', 1890000, 4020000, NULL);
INSERT INTO `price_products` VALUES (20, '2007-02-14 06:19:02', 5600000, 3530000, NULL);
INSERT INTO `price_products` VALUES (21, '2021-09-23 09:24:42', 1680000, 4790000, NULL);
INSERT INTO `price_products` VALUES (22, '2001-07-25 04:03:50', 8660000, 9830000, NULL);
INSERT INTO `price_products` VALUES (23, '2012-01-22 17:08:15', 3580000, 1400000, NULL);
INSERT INTO `price_products` VALUES (24, '2000-01-11 08:17:01', 10920000, 10840000, NULL);
INSERT INTO `price_products` VALUES (25, '2017-09-17 07:00:00', 10580000, 2040000, NULL);
INSERT INTO `price_products` VALUES (26, '2006-12-07 00:10:47', 11750000, 400000, NULL);
INSERT INTO `price_products` VALUES (27, '2005-11-19 17:09:16', 8750000, 11650000, NULL);
INSERT INTO `price_products` VALUES (28, '2001-05-07 02:29:30', 250000, 1110000, NULL);
INSERT INTO `price_products` VALUES (29, '2021-07-28 00:08:44', 2710000, 2630000, NULL);
INSERT INTO `price_products` VALUES (30, '2001-08-25 20:06:23', 6730000, 1210000, NULL);
INSERT INTO `price_products` VALUES (31, '2018-02-24 14:35:38', 11740000, 8190000, NULL);
INSERT INTO `price_products` VALUES (32, '2008-07-27 07:34:07', 510000, 4200000, NULL);
INSERT INTO `price_products` VALUES (33, '2022-11-30 11:29:03', 5410000, 6330000, NULL);
INSERT INTO `price_products` VALUES (34, '2021-09-10 09:38:53', 710000, 8730000, NULL);
INSERT INTO `price_products` VALUES (35, '2007-05-08 17:09:54', 6830000, 3260000, NULL);
INSERT INTO `price_products` VALUES (36, '2017-02-06 02:18:40', 9200000, 6080000, NULL);
INSERT INTO `price_products` VALUES (37, '2011-10-20 07:25:49', 3240000, 10540000, NULL);
INSERT INTO `price_products` VALUES (38, '2010-07-08 16:59:35', 8520000, 7120000, NULL);
INSERT INTO `price_products` VALUES (39, '2006-05-12 13:47:53', 1350000, 9970000, NULL);
INSERT INTO `price_products` VALUES (40, '2011-03-20 00:44:23', 6900000, 5910000, NULL);
INSERT INTO `price_products` VALUES (41, '2021-03-05 02:14:12', 2640000, 1360000, NULL);
INSERT INTO `price_products` VALUES (42, '2019-02-10 15:52:43', 6560000, 11950000, NULL);
INSERT INTO `price_products` VALUES (43, '2016-02-24 02:53:39', 5010000, 1020000, NULL);
INSERT INTO `price_products` VALUES (44, '2018-12-02 05:26:18', 1980000, 8910000, NULL);
INSERT INTO `price_products` VALUES (45, '2000-12-18 19:15:36', 11420000, 10060000, NULL);
INSERT INTO `price_products` VALUES (46, '2020-12-24 16:18:57', 4660000, 9630000, NULL);
INSERT INTO `price_products` VALUES (47, '2017-02-05 10:05:12', 7340000, 4280000, NULL);
INSERT INTO `price_products` VALUES (48, '2014-12-07 20:44:11', 440000, 910000, NULL);
INSERT INTO `price_products` VALUES (49, '2002-09-27 02:17:39', 8440000, 7890000, NULL);
INSERT INTO `price_products` VALUES (50, '2002-02-09 14:16:53', 4790000, 6550000, NULL);
INSERT INTO `price_products` VALUES (51, '2015-08-19 04:55:37', 10780000, 1960000, NULL);
INSERT INTO `price_products` VALUES (52, '2001-11-30 00:50:36', 5540000, 5020000, NULL);
INSERT INTO `price_products` VALUES (53, '2015-05-21 23:59:41', 3400000, 4970000, NULL);
INSERT INTO `price_products` VALUES (54, '2004-12-14 15:18:21', 10840000, 7830000, NULL);
INSERT INTO `price_products` VALUES (55, '2004-09-22 03:33:09', 3600000, 690000, NULL);
INSERT INTO `price_products` VALUES (56, '2020-11-13 14:46:12', 4690000, 7850000, NULL);
INSERT INTO `price_products` VALUES (57, '2000-06-29 01:41:00', 3680000, 7740000, NULL);
INSERT INTO `price_products` VALUES (58, '2017-03-10 00:13:47', 5330000, 1640000, NULL);
INSERT INTO `price_products` VALUES (59, '2018-02-27 02:30:54', 840000, 1240000, NULL);
INSERT INTO `price_products` VALUES (60, '2015-11-05 15:02:09', 9420000, 11730000, NULL);
INSERT INTO `price_products` VALUES (61, '2022-02-01 07:29:05', 1870000, 6680000, NULL);
INSERT INTO `price_products` VALUES (62, '2002-03-07 03:00:02', 770000, 5830000, NULL);
INSERT INTO `price_products` VALUES (63, '2002-12-16 14:01:10', 5800000, 8830000, NULL);
INSERT INTO `price_products` VALUES (64, '2016-12-20 08:02:07', 9160000, 2370000, NULL);
INSERT INTO `price_products` VALUES (65, '2008-05-10 01:39:48', 5270000, 5290000, NULL);
INSERT INTO `price_products` VALUES (66, '2007-07-12 01:58:54', 6130000, 1370000, NULL);
INSERT INTO `price_products` VALUES (67, '2011-09-27 20:29:12', 7630000, 3550000, NULL);
INSERT INTO `price_products` VALUES (68, '2005-03-13 02:02:18', 8770000, 1060000, NULL);
INSERT INTO `price_products` VALUES (69, '2018-12-14 04:51:54', 11790000, 5390000, NULL);
INSERT INTO `price_products` VALUES (70, '2007-07-23 22:03:30', 2120000, 280000, NULL);
INSERT INTO `price_products` VALUES (71, '2018-03-05 09:50:00', 9220000, 280000, NULL);
INSERT INTO `price_products` VALUES (72, '2005-07-11 13:22:31', 6030000, 9260000, NULL);
INSERT INTO `price_products` VALUES (73, '2005-06-28 17:04:29', 900000, 5850000, NULL);
INSERT INTO `price_products` VALUES (74, '2016-08-05 10:16:24', 5510000, 10460000, NULL);
INSERT INTO `price_products` VALUES (75, '2006-11-20 14:48:58', 1250000, 1070000, NULL);
INSERT INTO `price_products` VALUES (76, '2018-10-06 03:52:21', 11990000, 11340000, NULL);
INSERT INTO `price_products` VALUES (77, '2015-10-07 18:06:16', 2210000, 9320000, NULL);
INSERT INTO `price_products` VALUES (78, '2015-11-02 20:51:13', 6590000, 10070000, NULL);
INSERT INTO `price_products` VALUES (79, '2010-04-07 01:08:05', 10490000, 10400000, NULL);
INSERT INTO `price_products` VALUES (80, '2016-07-06 23:31:25', 480000, 3070000, NULL);
INSERT INTO `price_products` VALUES (81, '2015-08-11 16:51:34', 2720000, 9790000, NULL);
INSERT INTO `price_products` VALUES (82, '2016-06-16 20:43:02', 7240000, 9780000, NULL);
INSERT INTO `price_products` VALUES (83, '2000-01-07 15:11:00', 11140000, 10520000, NULL);
INSERT INTO `price_products` VALUES (84, '2012-03-21 22:03:29', 840000, 2260000, NULL);
INSERT INTO `price_products` VALUES (85, '2016-04-03 17:39:13', 2230000, 7740000, NULL);
INSERT INTO `price_products` VALUES (86, '2000-02-25 18:18:56', 5300000, 4230000, NULL);
INSERT INTO `price_products` VALUES (87, '2019-03-15 14:00:04', 9260000, 11280000, NULL);
INSERT INTO `price_products` VALUES (88, '2014-11-25 06:49:14', 360000, 1060000, NULL);
INSERT INTO `price_products` VALUES (89, '2010-11-23 10:22:52', 1960000, 1900000, NULL);
INSERT INTO `price_products` VALUES (90, '2003-05-29 23:14:23', 6070000, 11450000, NULL);
INSERT INTO `price_products` VALUES (91, '2010-08-05 06:08:28', 4890000, 8040000, NULL);
INSERT INTO `price_products` VALUES (92, '2013-05-17 04:28:17', 9130000, 9370000, NULL);
INSERT INTO `price_products` VALUES (93, '2006-06-02 12:17:11', 2670000, 10360000, NULL);
INSERT INTO `price_products` VALUES (94, '2014-06-14 23:00:49', 7130000, 6590000, NULL);
INSERT INTO `price_products` VALUES (95, '2022-06-26 16:38:31', 3930000, 3880000, NULL);
INSERT INTO `price_products` VALUES (96, '2022-03-15 20:31:06', 5440000, 11770000, NULL);
INSERT INTO `price_products` VALUES (97, '2012-04-07 07:31:13', 4990000, 5960000, NULL);
INSERT INTO `price_products` VALUES (98, '2019-07-12 01:43:17', 9020000, 8910000, NULL);
INSERT INTO `price_products` VALUES (99, '2002-09-03 00:10:59', 1200000, 1300000, NULL);
INSERT INTO `price_products` VALUES (100, '2016-04-09 12:43:42', 11130000, 6720000, NULL);
INSERT INTO `price_products` VALUES (101, '2013-05-17 10:56:41', 5870000, 9510000, NULL);
INSERT INTO `price_products` VALUES (102, '2007-05-21 05:20:41', 9690000, 9390000, NULL);
INSERT INTO `price_products` VALUES (103, '2018-11-12 14:25:12', 7140000, 390000, NULL);
INSERT INTO `price_products` VALUES (104, '2016-11-07 02:41:27', 11530000, 11630000, NULL);
INSERT INTO `price_products` VALUES (105, '2004-05-04 22:19:53', 2260000, 10630000, NULL);
INSERT INTO `price_products` VALUES (106, '2020-07-26 13:31:25', 1900000, 3230000, NULL);
INSERT INTO `price_products` VALUES (107, '2006-01-10 15:44:33', 1170000, 8260000, NULL);
INSERT INTO `price_products` VALUES (108, '2008-11-28 08:46:13', 11080000, 11150000, NULL);
INSERT INTO `price_products` VALUES (109, '2004-02-08 00:55:46', 4110000, 7200000, NULL);
INSERT INTO `price_products` VALUES (110, '2009-10-21 08:19:26', 700000, 2900000, NULL);
INSERT INTO `price_products` VALUES (111, '2014-10-04 12:54:34', 9660000, 1230000, NULL);
INSERT INTO `price_products` VALUES (112, '2014-09-20 02:40:23', 6960000, 2080000, NULL);
INSERT INTO `price_products` VALUES (113, '2010-03-22 02:55:24', 11070000, 2930000, NULL);
INSERT INTO `price_products` VALUES (114, '2011-11-15 02:39:24', 1860000, 5350000, NULL);
INSERT INTO `price_products` VALUES (115, '2008-05-05 23:29:51', 1650000, 6280000, NULL);
INSERT INTO `price_products` VALUES (116, '2010-11-24 15:25:00', 8950000, 4390000, NULL);
INSERT INTO `price_products` VALUES (117, '2005-06-22 02:19:40', 1300000, 8660000, NULL);
INSERT INTO `price_products` VALUES (118, '2022-05-18 09:33:40', 4330000, 2350000, NULL);
INSERT INTO `price_products` VALUES (119, '2000-02-25 01:23:47', 110000, 8610000, NULL);
INSERT INTO `price_products` VALUES (120, '2000-09-21 19:05:48', 10220000, 8870000, NULL);

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id_product` int NOT NULL,
  `id_image` int NOT NULL,
  `date_inserted` datetime NULL DEFAULT current_timestamp,
  `date_updated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`, `id_image`) USING BTREE,
  INDEX `fk_product_image2`(`id_image` ASC) USING BTREE,
  CONSTRAINT `fk_product_image1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_image2` FOREIGN KEY (`id_image`) REFERENCES `images` (`id_image`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (1, 1, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (1, 5, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (1, 6, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (1, 11, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (1, 14, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (2, 2, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (2, 5, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (2, 6, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (2, 7, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (2, 13, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (3, 1, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (3, 3, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (3, 10, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (3, 11, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (3, 14, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (4, 3, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (4, 4, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (4, 8, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (4, 9, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (4, 13, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (5, 2, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (5, 4, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (5, 5, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (5, 9, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (5, 14, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (6, 2, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (6, 3, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (6, 5, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (6, 6, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (6, 12, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (7, 1, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (7, 4, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (7, 6, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (7, 7, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (7, 11, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (8, 6, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (8, 8, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (8, 9, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (8, 12, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (8, 13, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (9, 2, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (9, 3, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (9, 7, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (9, 9, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (9, 11, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (10, 2, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (10, 3, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (10, 5, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (10, 10, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (10, 14, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (11, 2, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (11, 6, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (11, 8, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (11, 11, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (11, 12, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (12, 1, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (12, 3, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (12, 4, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (12, 8, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (12, 12, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (13, 1, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (13, 2, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (13, 4, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (13, 7, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (13, 13, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (14, 5, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (14, 7, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (14, 11, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (14, 12, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (14, 14, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (15, 15, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (15, 17, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (15, 18, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (15, 20, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (15, 21, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (16, 16, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (16, 19, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (16, 20, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (16, 21, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (16, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (17, 16, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (17, 17, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (17, 18, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (17, 19, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (17, 20, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (18, 15, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (18, 18, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (18, 19, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (18, 20, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (18, 21, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (19, 15, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (19, 17, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (19, 19, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (19, 21, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (19, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (20, 15, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (20, 16, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (20, 20, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (20, 21, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (20, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (21, 17, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (21, 18, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (21, 20, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (21, 21, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (21, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (22, 15, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (22, 18, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (22, 19, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (22, 21, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (22, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (23, 23, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (23, 28, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (23, 29, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (23, 30, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (23, 33, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (24, 23, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (24, 24, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (24, 25, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (24, 30, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (24, 31, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (25, 23, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (25, 24, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (25, 25, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (25, 30, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (25, 31, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (26, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (26, 26, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (26, 28, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (26, 29, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (26, 30, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (27, 26, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (27, 27, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (27, 28, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (27, 30, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (27, 32, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (28, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (28, 23, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (28, 24, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (28, 28, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (28, 32, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (29, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (29, 23, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (29, 24, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (29, 29, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (29, 32, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (30, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (30, 26, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (30, 28, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (30, 30, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (30, 32, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (31, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (31, 23, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (31, 24, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (31, 29, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (31, 31, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (32, 24, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (32, 28, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (32, 30, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (32, 32, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (32, 33, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (33, 22, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (33, 25, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (33, 27, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (33, 32, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (33, 33, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (34, 34, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (34, 35, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (34, 37, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (34, 41, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (34, 44, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (35, 35, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (35, 36, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (35, 39, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (35, 42, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (35, 43, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (36, 35, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (36, 36, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (36, 38, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (36, 40, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (36, 44, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (37, 34, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (37, 35, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (37, 37, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (37, 38, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (37, 43, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (38, 34, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (38, 37, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (38, 38, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (38, 39, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (38, 43, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (39, 34, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (39, 35, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (39, 39, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (39, 41, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (39, 43, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (40, 34, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (40, 39, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (40, 40, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (40, 41, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (40, 43, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (41, 35, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (41, 36, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (41, 41, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (41, 42, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (41, 43, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (42, 35, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (42, 36, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (42, 39, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (42, 41, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (42, 42, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (43, 36, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (43, 40, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (43, 42, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (43, 43, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (43, 44, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (44, 34, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (44, 38, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (44, 42, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (44, 43, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (44, 44, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (45, 45, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (45, 46, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (45, 47, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (45, 48, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (45, 49, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (46, 45, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (46, 46, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (46, 47, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (46, 48, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (46, 49, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (47, 45, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (47, 46, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (47, 47, '2023-06-20 11:38:36', NULL);
INSERT INTO `product_images` VALUES (47, 48, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (47, 49, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (48, 45, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (48, 46, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (48, 47, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (48, 48, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (48, 49, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (49, 45, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (49, 46, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (49, 47, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (49, 48, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (49, 49, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (50, 50, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (50, 51, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (50, 53, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (50, 54, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (50, 56, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (51, 50, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (51, 51, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (51, 52, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (51, 55, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (51, 56, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (52, 50, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (52, 51, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (52, 52, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (52, 53, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (52, 55, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (53, 50, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (53, 52, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (53, 53, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (53, 55, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (53, 56, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (54, 50, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (54, 51, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (54, 52, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (54, 54, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (54, 55, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (55, 51, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (55, 53, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (55, 54, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (55, 55, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (55, 56, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (56, 50, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (56, 52, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (56, 53, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (56, 55, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (56, 56, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (57, 57, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (57, 58, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (57, 59, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (57, 60, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (58, 57, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (58, 58, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (58, 59, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (58, 60, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (59, 57, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (59, 58, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (59, 59, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (59, 60, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (60, 57, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (60, 58, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (60, 59, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (60, 60, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (61, 61, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (61, 64, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (61, 65, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (61, 67, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (61, 71, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (62, 61, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (62, 62, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (62, 63, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (62, 65, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (62, 66, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (63, 61, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (63, 63, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (63, 66, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (63, 70, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (63, 71, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (64, 62, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (64, 63, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (64, 64, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (64, 69, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (64, 70, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (65, 64, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (65, 65, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (65, 66, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (65, 70, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (65, 71, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (66, 61, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (66, 64, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (66, 65, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (66, 66, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (66, 67, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (67, 61, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (67, 62, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (67, 63, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (67, 67, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (67, 69, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (68, 61, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (68, 62, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (68, 63, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (68, 64, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (68, 68, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (69, 62, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (69, 63, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (69, 69, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (69, 70, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (69, 71, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (70, 63, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (70, 65, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (70, 66, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (70, 69, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (70, 70, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (71, 62, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (71, 64, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (71, 65, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (71, 67, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (71, 71, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (72, 72, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (72, 73, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (72, 76, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (72, 78, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (72, 81, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (73, 73, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (73, 74, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (73, 76, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (73, 77, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (73, 80, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (74, 74, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (74, 76, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (74, 77, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (74, 79, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (74, 81, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (75, 72, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (75, 73, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (75, 75, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (75, 76, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (75, 80, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (76, 72, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (76, 76, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (76, 78, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (76, 79, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (76, 80, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (77, 76, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (77, 77, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (77, 78, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (77, 79, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (77, 80, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (78, 73, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (78, 74, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (78, 76, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (78, 78, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (78, 81, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (79, 76, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (79, 78, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (79, 79, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (79, 80, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (79, 81, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (80, 76, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (80, 77, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (80, 79, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (80, 80, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (80, 81, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (81, 73, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (81, 74, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (81, 78, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (81, 80, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (81, 81, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (82, 82, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (82, 83, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (82, 90, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (82, 92, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (82, 95, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (83, 83, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (83, 90, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (83, 92, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (83, 93, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (83, 99, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (84, 82, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (84, 84, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (84, 90, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (84, 91, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (84, 95, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (85, 83, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (85, 84, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (85, 85, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (85, 94, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (85, 100, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (86, 86, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (86, 87, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (86, 88, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (86, 92, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (86, 101, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (87, 87, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (87, 88, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (87, 96, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (87, 98, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (87, 99, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (88, 88, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (88, 89, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (88, 90, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (88, 99, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (88, 102, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (89, 89, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (89, 96, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (89, 98, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (89, 100, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (89, 102, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (90, 85, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (90, 90, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (90, 91, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (90, 95, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (90, 99, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (91, 88, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (91, 89, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (91, 91, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (91, 95, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (91, 97, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (92, 87, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (92, 92, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (92, 96, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (92, 98, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (92, 101, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (93, 83, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (93, 93, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (93, 96, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (93, 98, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (93, 100, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (94, 82, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (94, 94, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (94, 101, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (94, 102, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (94, 103, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (95, 88, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (95, 91, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (95, 94, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (95, 95, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (95, 97, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (96, 83, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (96, 85, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (96, 88, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (96, 92, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (96, 96, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (97, 83, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (97, 90, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (97, 97, '2023-06-20 11:38:37', NULL);
INSERT INTO `product_images` VALUES (97, 98, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (97, 100, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (98, 91, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (98, 93, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (98, 98, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (98, 99, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (98, 103, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (99, 90, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (99, 91, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (99, 96, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (99, 99, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (99, 101, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (100, 84, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (100, 87, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (100, 91, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (100, 96, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (100, 100, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (101, 87, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (101, 90, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (101, 91, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (101, 96, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (101, 101, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (102, 84, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (102, 87, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (102, 98, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (102, 101, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (102, 102, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (103, 85, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (103, 86, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (103, 89, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (103, 101, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (103, 103, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (104, 104, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (104, 109, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (104, 111, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (104, 114, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (104, 115, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (105, 105, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (105, 108, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (105, 110, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (105, 118, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (105, 119, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (106, 104, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (106, 106, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (106, 107, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (106, 113, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (106, 118, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (107, 105, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (107, 107, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (107, 109, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (107, 112, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (107, 114, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (108, 105, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (108, 106, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (108, 108, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (108, 113, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (108, 119, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (109, 104, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (109, 105, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (109, 106, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (109, 109, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (109, 111, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (110, 107, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (110, 110, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (110, 112, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (110, 114, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (110, 115, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (111, 105, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (111, 111, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (111, 112, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (111, 117, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (111, 120, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (112, 112, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (112, 114, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (112, 115, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (112, 117, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (112, 118, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (113, 104, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (113, 106, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (113, 113, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (113, 115, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (113, 118, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (114, 104, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (114, 107, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (114, 112, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (114, 114, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (114, 117, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (115, 106, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (115, 108, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (115, 113, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (115, 115, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (115, 119, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (116, 108, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (116, 111, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (116, 114, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (116, 116, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (116, 118, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (117, 109, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (117, 110, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (117, 115, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (117, 117, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (117, 120, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (118, 104, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (118, 107, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (118, 110, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (118, 113, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (118, 118, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (119, 104, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (119, 105, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (119, 108, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (119, 118, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (119, 119, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (120, 111, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (120, 115, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (120, 117, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (120, 118, '2023-06-20 11:38:38', NULL);
INSERT INTO `product_images` VALUES (120, 120, '2023-06-20 11:38:38', NULL);

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
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_subtype`) REFERENCES `subtype_products` (`id_subtype`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_status_product`) REFERENCES `status_products` (`id_status_product`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 1, 1, 6, 'Axit Acetic - CH3COOH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_acetic.jpg', 4, '2023-01-06 14:28:49', NULL, 20);
INSERT INTO `products` VALUES (2, 1, 1, 4, 'Axit Carbonic - H2CO3', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_carbonic.png', 997, '2023-01-06 14:28:49', NULL, 3);
INSERT INTO `products` VALUES (3, 1, 1, 2, 'Axit Citric - C6H8O7', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_citric.jpg', 998, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (4, 1, 1, 4, 'Axit Clohydric - HCl', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_clohydric.jpg', 999, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (5, 1, 1, 5, 'Axit Fluoroantimonic - HF', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_hexafluoroantimonic.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (6, 1, 1, 6, 'Axit Hydrofluoric - CH3COOH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/axit/axit_hydrofluoric.jpg', 979, '2023-01-06 14:28:49', NULL, 5);
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
INSERT INTO `products` VALUES (17, 2, 1, 6, 'Calcium Hydroxide - Ca(OH)2', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/bazo/calcium_hydroxit.jpg', 993, '2023-01-06 14:28:49', NULL, 3);
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
INSERT INTO `products` VALUES (58, 7, 1, 5, 'Benedict - RCHO + Cu + OH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/thuoc_thu/benedict.jpg', 1000, '2023-01-06 14:28:49', NULL, 1);
INSERT INTO `products` VALUES (59, 7, 1, 3, 'Biuret - (H2NCO)2NH', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/hoa_chat/thuoc_thu/biuret.jpg', 1000, '2023-01-06 14:28:49', NULL, 1);
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
INSERT INTO `products` VALUES (92, 12, 1, 2, 'Bình Tam Giác', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/dung_cu/binh_tam_giac.jpg', 999, '2023-01-06 14:28:49', NULL, 2);
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
INSERT INTO `products` VALUES (104, 14, 1, 5, 'Cân Điện Tử Extech SC600', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/can_dien_tu.png', 999, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (105, 14, 1, 5, 'Cân Điện Tử Lutron GM6', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/can_dien_tu_2.jpg', 999, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (106, 14, 1, 5, 'Cân Điện Tử Omron', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/can_dien_tu_3.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (107, 14, 1, 5, 'Cân Điện Tử Microlife', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/can_dien_tu_4.jpg', 999, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (108, 15, 1, 6, 'Máy Khuấy Không Gia Nhiệt', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_khuay.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (109, 15, 1, 6, 'Máy Khuấy SHINKO TG-40', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_khuay_2.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (110, 15, 1, 6, 'Máy Khuấy Từ Hanna HI 324N', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_khuay_3.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (111, 15, 1, 6, 'Máy Khuấy Từ HI 200', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_khuay_4.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (112, 15, 1, 6, 'Máy Khuấy Đảo Chiều', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_khuay_5.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (113, 16, 1, 4, 'Máy Nghiền Mẫu IKA A-10', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_nghien.png', 1000, '2023-01-06 14:28:49', NULL, 1);
INSERT INTO `products` VALUES (114, 16, 1, 4, 'Máy Nghiền Mẫu MF-10', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_nghien_2.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (115, 16, 1, 4, 'Máy Nghiền Mẫu Phân Tích', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_nghien_3.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (116, 16, 1, 4, 'Máy Nghiền Tube Mill', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/may_nghien_4.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (117, 17, 1, 1, 'Tủ Chân Không', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/tu_chan_khong.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (118, 17, 1, 1, 'Tủ Sấy', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/tu_chan_khong_2.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (119, 17, 1, 1, 'Tủ Hút Khí Độc', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/tu_hut_khi_doc.png', 1000, '2023-01-06 14:28:49', NULL, 0);
INSERT INTO `products` VALUES (120, 17, 1, 1, 'Tủ Thao Tác PCR', 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. \r\nAxit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, \r\nkhông mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, \r\nkhi tan trong nước H2SO4 tỏa rất nhiều nhiệt.', '/images/products/thiet_bi/tu_pcr.jpg', 1000, '2023-01-06 14:28:49', NULL, 0);

-- ----------------------------
-- Table structure for review_products
-- ----------------------------
DROP TABLE IF EXISTS `review_products`;
CREATE TABLE `review_products`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review_products
-- ----------------------------

-- ----------------------------
-- Table structure for role_admins
-- ----------------------------
DROP TABLE IF EXISTS `role_admins`;
CREATE TABLE `role_admins`  (
  `id_role_admin` int NOT NULL,
  `name_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_role_admin`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_admins
-- ----------------------------
INSERT INTO `role_admins` VALUES (1, 'member');
INSERT INTO `role_admins` VALUES (2, 'root');
INSERT INTO `role_admins` VALUES (3, 'super-root');

-- ----------------------------
-- Table structure for sold_products
-- ----------------------------
DROP TABLE IF EXISTS `sold_products`;
CREATE TABLE `sold_products`  (
  `id_product` int NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp,
  `quantity_sold` int NOT NULL,
  PRIMARY KEY (`id_product`, `datetime`) USING BTREE,
  CONSTRAINT `sold_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sold_products
-- ----------------------------

-- ----------------------------
-- Table structure for status_accs
-- ----------------------------
DROP TABLE IF EXISTS `status_accs`;
CREATE TABLE `status_accs`  (
  `id_status_acc` int NOT NULL,
  `name_status_acc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_acc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status_accs
-- ----------------------------
INSERT INTO `status_accs` VALUES (1, 'Bình thường');
INSERT INTO `status_accs` VALUES (2, 'Tạm khóa');
INSERT INTO `status_accs` VALUES (3, 'Khóa vĩnh viễn');

-- ----------------------------
-- Table structure for status_bills
-- ----------------------------
DROP TABLE IF EXISTS `status_bills`;
CREATE TABLE `status_bills`  (
  `id_status_bill` int NOT NULL,
  `name_status_bill` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_status_bill`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status_bills
-- ----------------------------
INSERT INTO `status_bills` VALUES (1, 'Chờ xác nhận');
INSERT INTO `status_bills` VALUES (2, 'Đang giao hàng');
INSERT INTO `status_bills` VALUES (3, 'Đã giao');
INSERT INTO `status_bills` VALUES (4, 'Hủy đơn hàng');

-- ----------------------------
-- Table structure for status_images
-- ----------------------------
DROP TABLE IF EXISTS `status_images`;
CREATE TABLE `status_images`  (
  `id_status_image` int NOT NULL AUTO_INCREMENT,
  `name_status_image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_image`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status_images
-- ----------------------------
INSERT INTO `status_images` VALUES (1, 'Hiển thị');
INSERT INTO `status_images` VALUES (2, 'Ẩn');

-- ----------------------------
-- Table structure for status_products
-- ----------------------------
DROP TABLE IF EXISTS `status_products`;
CREATE TABLE `status_products`  (
  `id_status_product` int NOT NULL,
  `name_status_product` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_status_product`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status_products
-- ----------------------------
INSERT INTO `status_products` VALUES (1, 'Mới');
INSERT INTO `status_products` VALUES (2, 'Hot');
INSERT INTO `status_products` VALUES (3, 'Cấm bán');

-- ----------------------------
-- Table structure for subtype_products
-- ----------------------------
DROP TABLE IF EXISTS `subtype_products`;
CREATE TABLE `subtype_products`  (
  `id_subtype` int NOT NULL,
  `name_subtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_type_product` int NOT NULL,
  `sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_subtype`) USING BTREE,
  INDEX `id_type_product`(`id_type_product` ASC) USING BTREE,
  CONSTRAINT `subtype_products_ibfk_1` FOREIGN KEY (`id_type_product`) REFERENCES `type_products` (`id_type_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subtype_products
-- ----------------------------
INSERT INTO `subtype_products` VALUES (1, 'Acid', 1, NULL);
INSERT INTO `subtype_products` VALUES (2, 'Bazo', 1, NULL);
INSERT INTO `subtype_products` VALUES (3, 'Muối', 1, NULL);
INSERT INTO `subtype_products` VALUES (4, 'Kim Loại', 1, NULL);
INSERT INTO `subtype_products` VALUES (5, 'Chất Chỉ Thị', 1, NULL);
INSERT INTO `subtype_products` VALUES (6, 'Dung Môi', 1, NULL);
INSERT INTO `subtype_products` VALUES (7, 'Thuốc Thử', 1, NULL);
INSERT INTO `subtype_products` VALUES (8, 'Hợp Chất Hữu Cơ', 1, NULL);
INSERT INTO `subtype_products` VALUES (9, 'Oxit', 1, NULL);
INSERT INTO `subtype_products` VALUES (10, 'Giá Đỡ Ống Nghiệm', 2, NULL);
INSERT INTO `subtype_products` VALUES (11, 'Kẹp Gỗ', 2, NULL);
INSERT INTO `subtype_products` VALUES (12, 'Dụng Cụ Thủy Tinh', 2, NULL);
INSERT INTO `subtype_products` VALUES (13, 'Ống Hút Nhỏ Giọt', 2, NULL);
INSERT INTO `subtype_products` VALUES (14, 'Cân Điện Tử', 3, NULL);
INSERT INTO `subtype_products` VALUES (15, 'Máy Khuấy', 3, NULL);
INSERT INTO `subtype_products` VALUES (16, 'Máy Nghiền Mẫu', 3, NULL);
INSERT INTO `subtype_products` VALUES (17, 'Các Loại Tủ', 3, NULL);

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `name_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_supplier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
-- Table structure for type_accs
-- ----------------------------
DROP TABLE IF EXISTS `type_accs`;
CREATE TABLE `type_accs`  (
  `id_type_acc` int NOT NULL AUTO_INCREMENT,
  `name_type_acc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_acc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type_accs
-- ----------------------------
INSERT INTO `type_accs` VALUES (1, 'Bình thường');
INSERT INTO `type_accs` VALUES (2, 'Facebook');
INSERT INTO `type_accs` VALUES (3, 'Google');

-- ----------------------------
-- Table structure for type_products
-- ----------------------------
DROP TABLE IF EXISTS `type_products`;
CREATE TABLE `type_products`  (
  `id_type_product` int NOT NULL AUTO_INCREMENT,
  `name_type_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_type_product`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type_products
-- ----------------------------
INSERT INTO `type_products` VALUES (1, 'Hóa Chất');
INSERT INTO `type_products` VALUES (2, 'Dụng Cụ');
INSERT INTO `type_products` VALUES (3, 'Thiết Bị');

-- ----------------------------
-- Table structure for vouchers
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers`  (
  `id_voucher` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `start_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_voucher`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vouchers
-- ----------------------------

-- ----------------------------
-- Triggers structure for table bill_details
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger_sold`;
delimiter ;;
CREATE TRIGGER `trigger_sold` AFTER INSERT ON `bill_details` FOR EACH ROW BEGIN
	UPDATE `sold_products` SET quantity_sold = (SELECT SUM(quantity) FROM bill_details WHERE id_product = NEW.id_product) WHERE id_product = NEW.id_product;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table price_products
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_product`;
delimiter ;;
CREATE TRIGGER `delete_product` AFTER DELETE ON `price_products` FOR EACH ROW BEGIN
	DELETE FROM `sold_products` WHERE `id_product` = OLD.id_product;
	DELETE FROM `products` WHERE `id_product` = OLD.id_product;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table review_products
-- ----------------------------
DROP TRIGGER IF EXISTS `limit_stars`;
delimiter ;;
CREATE TRIGGER `limit_stars` BEFORE INSERT ON `review_products` FOR EACH ROW BEGIN
	IF NEW.stars > 5 OR NEW.stars < 1 THEN SIGNAL SQLSTATE '45001' SET message_text = 'stars must be in 1 - 5';
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table review_products
-- ----------------------------
DROP TRIGGER IF EXISTS `limit_stars_update`;
delimiter ;;
CREATE TRIGGER `limit_stars_update` BEFORE UPDATE ON `review_products` FOR EACH ROW BEGIN
	IF NEW.stars > 5 OR NEW.stars < 1 THEN SIGNAL SQLSTATE '45001' SET message_text = 'stars must be in 1 - 5';
	END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
