/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : 127.0.0.1:3306
 Source Schema         : test_1

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 26/03/2023 10:15:20
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
  PRIMARY KEY (`username`) USING BTREE,
  INDEX `id_status_acc`(`id_status_acc` ASC) USING BTREE,
  INDEX `id_role_admin`(`id_role_admin` ASC) USING BTREE,
  CONSTRAINT `account_admins_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_acc` (`id_status_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_admins_ibfk_2` FOREIGN KEY (`id_role_admin`) REFERENCES `role_admin` (`id_role_admin`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_admins
-- ----------------------------
INSERT INTO `account_admins` VALUES ('nguyenphutai', 'Nguyễn Phú Tài', 2, 1, '123456', '2023-03-26 09:19:15', '2023-03-26 09:19:15');
INSERT INTO `account_admins` VALUES ('nguyentandat', 'Nguyễn Tấn Đạt', 2, 1, '123456', '2023-03-26 09:19:15', '2023-03-26 09:19:15');
INSERT INTO `account_admins` VALUES ('tranminhtuyen', 'Trần Minh Tuyên', 3, 1, '123', '2023-03-26 09:19:15', '2023-03-26 09:27:17');

-- ----------------------------
-- Table structure for account_customers
-- ----------------------------
DROP TABLE IF EXISTS `account_customers`;
CREATE TABLE `account_customers`  (
  `id_user_customer` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
  PRIMARY KEY (`id_user_customer`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `id_status_acc`(`id_status_acc` ASC) USING BTREE,
  INDEX `id_city`(`id_city` ASC) USING BTREE,
  INDEX `account_customer_ibfk_3`(`id_type_acc` ASC) USING BTREE,
  CONSTRAINT `account_customers_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_acc` (`id_status_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_customers_ibfk_3` FOREIGN KEY (`id_type_acc`) REFERENCES `type_accs` (`id_type_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_customers
-- ----------------------------
INSERT INTO `account_customers` VALUES (6, 'nguyenphutai840@gmail.com', '123', 1, 1, 'Nguyễn Phú Tài', 'Nam', 'nguyenphutai840@gmail.com', '0353677271', 'Di Linh, Lâm Đồng', '2023-03-26 09:18:56', '2023-03-26 09:18:56', NULL, NULL, NULL);
INSERT INTO `account_customers` VALUES (7, 'tranminhtuyen0908@gmail.com', '123', 1, 1, 'Trần Minh Tuyên', 'Nam', 'tranminhtuyen0908@gmail.com', '0353677272', 'Nam Định', '2023-03-26 09:18:56', '2023-03-26 09:18:56', NULL, NULL, NULL);
INSERT INTO `account_customers` VALUES (8, 'nguyentandat@gmail.com', '123', 1, 1, 'Nguyễn Tấn Đạt', 'Nam', 'nguyentandat@gmail.com', '0353677273', 'Bến Tre', '2023-03-26 09:18:56', '2023-03-26 09:18:56', NULL, NULL, NULL);
INSERT INTO `account_customers` VALUES (16, 'GG103049362477209229229', '103049362477209229229@gg123', 1, 0, 'Tuyên Minh', NULL, 'anhemphattrien@gmail.com', NULL, NULL, '2023-03-26 09:56:39', '2023-03-26 09:56:39', NULL, '103049362477209229229', 3);
INSERT INTO `account_customers` VALUES (17, 'GG108327235615609948235', '108327235615609948235@gg123', 1, 0, 'Tuyên Trần Minh', NULL, 'tmt010101ccna@gmail.com', NULL, NULL, '2023-03-26 09:58:36', '2023-03-26 09:58:36', NULL, '108327235615609948235', 3);
INSERT INTO `account_customers` VALUES (18, 'FB487782076904211', '487782076904211@fb123', 1, 0, 'Trần Tuyên', NULL, 'tmt010101ccna@gmail.com', NULL, NULL, '2023-03-26 09:59:06', '2023-03-26 09:59:06', '487782076904211', NULL, 2);

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

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills`  (
  `id_bill` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_status_bill` int NOT NULL,
  `id_city` int NULL DEFAULT NULL,
  `shop_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_ward_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_district_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  PRIMARY KEY (`id_bill`) USING BTREE,
  INDEX `id_user`(`id_user` ASC) USING BTREE,
  INDEX `id_status_bill`(`id_status_bill` ASC) USING BTREE,
  INDEX `id_city`(`id_city` ASC) USING BTREE,
  CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`id_status_bill`) REFERENCES `status_bill` (`id_status_bill`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bills_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `account_customers` (`id_user_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bills
-- ----------------------------

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id_city` int NOT NULL AUTO_INCREMENT,
  `name_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport` bigint NOT NULL,
  PRIMARY KEY (`id_city`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, 'Hồ Chí Minh', 10000);
INSERT INTO `city` VALUES (2, 'Hà Nội', 30000);
INSERT INTO `city` VALUES (3, 'Đà Nẵng', 20000);

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
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id_image` int NOT NULL AUTO_INCREMENT,
  `id_status_image` int NULL DEFAULT NULL,
  `url_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_inserted` datetime NULL DEFAULT current_timestamp,
  `date_updated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_image`) USING BTREE,
  INDEX `fk_status_img`(`id_status_image` ASC) USING BTREE,
  CONSTRAINT `fk_status_img` FOREIGN KEY (`id_status_image`) REFERENCES `status_images` (`id_status_image`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images
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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (3, 3, '103049362477209229229', '', 'tạo tài khoản bằng Gg', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:56:39', '');
INSERT INTO `logs` VALUES (4, 2, '103049362477209229229', '', 'đăng nhập hệ thống bằng tài khoản Gg', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:56:39', '');
INSERT INTO `logs` VALUES (5, 2, '103049362477209229229', '', 'đăng nhập hệ thống bằng tài khoản Gg', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:57:48', '');
INSERT INTO `logs` VALUES (6, 3, '108327235615609948235', '', 'tạo tài khoản bằng Gg', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:58:36', '');
INSERT INTO `logs` VALUES (7, 2, '108327235615609948235', '', 'đăng nhập hệ thống bằng tài khoản Gg', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:58:36', '');
INSERT INTO `logs` VALUES (8, 3, '487782076904211', '', 'tạo tài khoản bằng Fb', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:59:06', '');
INSERT INTO `logs` VALUES (9, 2, '487782076904211', '', 'đăng nhập hệ thống bằng tài khoản Fb', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:59:06', '');
INSERT INTO `logs` VALUES (10, 2, '487782076904211', '', 'đăng nhập hệ thống bằng tài khoản Fb', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:59:59', '');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review_product
-- ----------------------------

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
INSERT INTO `role_admin` VALUES (3, 'super-root');

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

-- ----------------------------
-- Table structure for status_images
-- ----------------------------
DROP TABLE IF EXISTS `status_images`;
CREATE TABLE `status_images`  (
  `id_status_image` int NOT NULL AUTO_INCREMENT,
  `name_status_image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_image`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status_images
-- ----------------------------

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
INSERT INTO `status_product` VALUES (0, '-- Chọn trạng thái --');
INSERT INTO `status_product` VALUES (1, 'Mới');
INSERT INTO `status_product` VALUES (2, 'Hot');
INSERT INTO `status_product` VALUES (3, 'Cấm bán');

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
INSERT INTO `subtype_product` VALUES (0, '-- Chọn loại sản phẩm --', 1, NULL);
INSERT INTO `subtype_product` VALUES (1, 'Acid', 1, NULL);
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
INSERT INTO `suppliers` VALUES (7, '-- Chọn nhà cung cấp --');

-- ----------------------------
-- Table structure for type_accs
-- ----------------------------
DROP TABLE IF EXISTS `type_accs`;
CREATE TABLE `type_accs`  (
  `id_type_acc` int NOT NULL AUTO_INCREMENT,
  `name_type_acc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_acc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_accs
-- ----------------------------
INSERT INTO `type_accs` VALUES (1, 'Bình thường');
INSERT INTO `type_accs` VALUES (2, 'Facebook');
INSERT INTO `type_accs` VALUES (3, 'Google');

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
-- Table structure for voucher
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher`  (
  `id_voucher` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `start_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_voucher`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voucher
-- ----------------------------

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
