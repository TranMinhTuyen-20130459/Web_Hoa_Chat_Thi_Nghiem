/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : 127.0.0.1:3306
 Source Schema         : hoa_chat_thi_nghiem_pro

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 03/03/2023 19:41:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_admins
-- ----------------------------
DROP TABLE IF EXISTS `account_admins`;
CREATE TABLE `account_admins`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_status_acc` int NOT NULL DEFAULT 1,
  `id_role_admin` int NOT NULL DEFAULT 1,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time_created` datetime NULL DEFAULT current_timestamp,
  `time_change_pass` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE,
  INDEX `fk_status_accs`(`id_status_acc` ASC) USING BTREE,
  INDEX `fk_role_admins`(`id_role_admin` ASC) USING BTREE,
  CONSTRAINT `fk_role_admins` FOREIGN KEY (`id_role_admin`) REFERENCES `role_admins` (`id_role_admin`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_status_accs` FOREIGN KEY (`id_status_acc`) REFERENCES `status_accs` (`id_status_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_admins
-- ----------------------------
INSERT INTO `account_admins` VALUES ('nguyenphutai', 1, 1, '123456', '2023-03-02 19:07:46', NULL);
INSERT INTO `account_admins` VALUES ('nguyenvanlenh', 1, 1, '123456', '2023-03-02 19:07:54', NULL);
INSERT INTO `account_admins` VALUES ('tranminhtuyen', 1, 1, '123456', '2023-03-02 19:07:24', NULL);

-- ----------------------------
-- Table structure for account_customers
-- ----------------------------
DROP TABLE IF EXISTS `account_customers`;
CREATE TABLE `account_customers`  (
  `id_user_customer` bigint NOT NULL AUTO_INCREMENT,
  `id_status_acc` int NOT NULL DEFAULT 0,
  `id_city` int NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_created` datetime NULL DEFAULT current_timestamp,
  `time_change_pass` datetime NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `emai_customer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone_customer` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_type_acc` int NOT NULL,
  PRIMARY KEY (`id_user_customer`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `id_status_acc`(`id_status_acc` ASC) USING BTREE,
  INDEX `id_city`(`id_city` ASC) USING BTREE,
  INDEX `id_type_acc`(`id_type_acc` ASC) USING BTREE,
  CONSTRAINT `account_customers_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_accs` (`id_status_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_customers_ibfk_2` FOREIGN KEY (`id_city`) REFERENCES `cities` (`id_city`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_customers_ibfk_3` FOREIGN KEY (`id_type_acc`) REFERENCES `type_accs` (`id_type_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_customers
-- ----------------------------
INSERT INTO `account_customers` VALUES (7, 0, 0, 'tuyen@gmail.com', '123456', '2023-03-02 19:11:24', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `account_customers` VALUES (9, 0, 0, 'tai@gmail.com', '123456', '2023-03-02 19:12:24', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `account_customers` VALUES (10, 0, 0, 'lenh@gmail.com', '1234656', '2023-03-02 19:13:32', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `account_customers` VALUES (12, 0, 0, 'kun@gmail.com', '123456', '2023-03-02 19:14:06', NULL, NULL, NULL, NULL, NULL, NULL, 3);

-- ----------------------------
-- Table structure for bill_details
-- ----------------------------
DROP TABLE IF EXISTS `bill_details`;
CREATE TABLE `bill_details`  (
  `id_bill` bigint NOT NULL,
  `id_product` bigint NOT NULL,
  `quantity` int NULL DEFAULT NULL,
  `listed_price` bigint NULL DEFAULT 0,
  `current_price` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id_bill`, `id_product`) USING BTREE,
  INDEX `id_product`(`id_product` ASC) USING BTREE,
  CONSTRAINT `bill_details_ibfk_1` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id_bill`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bill_details_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill_details
-- ----------------------------

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills`  (
  `id_bill` bigint NOT NULL AUTO_INCREMENT,
  `id_user_customer` bigint NULL DEFAULT NULL,
  `id_status_bill` int NULL DEFAULT NULL,
  `shop_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `from_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `from_ward_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `from_district_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `from_province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `required_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `return_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `return_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `return_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `return_ward_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `return_district_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `return_province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `to_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `to_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `to_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `to_ward_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `to_district_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `to_province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code_voucher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ship_price` bigint NULL DEFAULT NULL,
  `bill_price_before` bigint NULL DEFAULT NULL,
  `bill_price_after` bigint NULL DEFAULT NULL,
  `insurance_value` bigint NULL DEFAULT NULL,
  `email_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time_order` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_bill`) USING BTREE,
  INDEX `id_user_customer`(`id_user_customer` ASC) USING BTREE,
  INDEX `id_status_bill`(`id_status_bill` ASC) USING BTREE,
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`id_user_customer`) REFERENCES `account_customers` (`id_user_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`id_status_bill`) REFERENCES `status_bills` (`id_status_bill`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bills
-- ----------------------------
INSERT INTO `bills` VALUES (3, 7, 2, NULL, 'tuyen', '0927042108', 'Đại học Nông Lâm', 'Linh Trung', 'Thủ Đức', 'TP.Hồ Chí Minh', 'KHONGDUOCXEMHANG', NULL, NULL, NULL, NULL, NULL, NULL, 'tinh', '0123456', '256 Lê Văn Quới', 'Bình Hưng Hòa A', 'Bình Tân', 'Hồ Chí Minh', 'giao hàng sau 5h chiều', 'ABCDEF', 12000, 30000, 42000, 500000, NULL, '2023-03-02 19:20:17');

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`  (
  `id_city` int NOT NULL,
  `name_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_city`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES (0, NULL);
INSERT INTO `cities` VALUES (1, 'TP Hồ Chí Minh');
INSERT INTO `cities` VALUES (2, 'Hà Nội');
INSERT INTO `cities` VALUES (3, 'Đà Nẵng');

-- ----------------------------
-- Table structure for comment_news
-- ----------------------------
DROP TABLE IF EXISTS `comment_news`;
CREATE TABLE `comment_news`  (
  `id_comment` int NOT NULL AUTO_INCREMENT,
  `id_news` bigint NULL DEFAULT NULL,
  `id_user_customer` bigint NULL DEFAULT NULL,
  `time_comment` datetime NULL DEFAULT current_timestamp,
  `content_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_comment`) USING BTREE,
  INDEX `id_user_customer`(`id_user_customer` ASC) USING BTREE,
  INDEX `id_news`(`id_news` ASC) USING BTREE,
  CONSTRAINT `comment_news_ibfk_2` FOREIGN KEY (`id_user_customer`) REFERENCES `account_customers` (`id_user_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_news_ibfk_3` FOREIGN KEY (`id_news`) REFERENCES `news` (`id_news`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_news
-- ----------------------------
INSERT INTO `comment_news` VALUES (1, 1, NULL, '2023-03-03 17:48:18', 'hay ');

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id_contact` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone_contact` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `problem_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content_problem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `date_inserted` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_contact`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES (1, 'Trần Minh Tuyên ', '0927042108', 'tranminhtuyen0908@gmail.com', 'lỗi đăng nhập', 'không thể đăng nhập bằng tài khoản Facebook', '2023-03-02 19:21:43');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id_image` bigint NOT NULL AUTO_INCREMENT,
  `id_status_image` int NULL DEFAULT NULL,
  `url_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_inserted` datetime NULL DEFAULT current_timestamp,
  `date_updated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_image`) USING BTREE,
  INDEX `id_status_image`(`id_status_image` ASC) USING BTREE,
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`id_status_image`) REFERENCES `status_images` (`id_status_image`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (1, 1, '/it-nlu/tuyen_kun', '2023-03-02 19:23:14', NULL);
INSERT INTO `images` VALUES (2, 2, '/it-nlu/tranminhtuyen', '2023-03-02 19:23:40', NULL);

-- ----------------------------
-- Table structure for import_products
-- ----------------------------
DROP TABLE IF EXISTS `import_products`;
CREATE TABLE `import_products`  (
  `id_product` bigint NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp,
  `id_supplier` int NULL DEFAULT NULL,
  `quantity_import` int NOT NULL DEFAULT 0,
  `price_import` bigint NULL DEFAULT 0,
  `name_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`, `date_time`) USING BTREE,
  INDEX `id_supplier`(`id_supplier` ASC) USING BTREE,
  CONSTRAINT `import_products_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `import_products_ibfk_3` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of import_products
-- ----------------------------

-- ----------------------------
-- Table structure for infor_webs
-- ----------------------------
DROP TABLE IF EXISTS `infor_webs`;
CREATE TABLE `infor_webs`  (
  `id_infor` int NOT NULL AUTO_INCREMENT,
  `phone_web` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_web` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address_web` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_infor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infor_webs
-- ----------------------------
INSERT INTO `infor_webs` VALUES (1, '0927042108', 'hoachatthinghiemnlu@gmail.com', 'Cư xá A , P. Linh Trung , Thủ Đức , TP.Hồ Chí Minh');

-- ----------------------------
-- Table structure for level_logs
-- ----------------------------
DROP TABLE IF EXISTS `level_logs`;
CREATE TABLE `level_logs`  (
  `id_level` int NOT NULL,
  `name_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of level_logs
-- ----------------------------
INSERT INTO `level_logs` VALUES (1, 'ALERT');
INSERT INTO `level_logs` VALUES (2, 'INFOR');
INSERT INTO `level_logs` VALUES (3, 'WARNING');
INSERT INTO `level_logs` VALUES (4, 'DANGER');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id_log` bigint NOT NULL AUTO_INCREMENT,
  `id_level` int NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT -1,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `web_browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT current_timestamp,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_log`) USING BTREE,
  INDEX `id_level`(`id_level` ASC) USING BTREE,
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level_logs` (`id_level`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (1, 1, -1, 'import_products', 'thêm sản phẩm có id=\"1\"', '127.0.0.1', NULL, '2023-03-03 17:46:50', NULL);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id_news` bigint NOT NULL AUTO_INCREMENT,
  `title_news` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content_news` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `url_img_news` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_posted` datetime NULL DEFAULT current_timestamp,
  `quantity_comment` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_news`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, 'Hóa chất', 'hóa chất thí nghiệm hàng đầu VN', NULL, '2023-03-03 17:47:46', NULL);

-- ----------------------------
-- Table structure for price_products
-- ----------------------------
DROP TABLE IF EXISTS `price_products`;
CREATE TABLE `price_products`  (
  `id_product` bigint NOT NULL,
  `date_inserted` datetime NOT NULL DEFAULT current_timestamp,
  `listed_price` bigint NOT NULL DEFAULT 0,
  `current_price` bigint NOT NULL DEFAULT 0,
  `date_updated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`, `date_inserted`) USING BTREE,
  CONSTRAINT `price_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of price_products
-- ----------------------------
INSERT INTO `price_products` VALUES (1, '2023-03-03 17:50:16', 200000, 500000, NULL);
INSERT INTO `price_products` VALUES (1, '2023-03-03 17:50:44', 400000, 600000, NULL);

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id_product` bigint NOT NULL,
  `id_image` bigint NOT NULL,
  `date_inserted` datetime NULL DEFAULT current_timestamp,
  `date_updated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`, `id_image`) USING BTREE,
  INDEX `id_image`(`id_image` ASC) USING BTREE,
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_images_ibfk_2` FOREIGN KEY (`id_image`) REFERENCES `images` (`id_image`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (1, 1, '2023-03-03 17:51:07', NULL);
INSERT INTO `product_images` VALUES (1, 2, '2023-03-03 17:51:16', NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id_product` bigint NOT NULL AUTO_INCREMENT,
  `id_subtype_product` int NULL DEFAULT NULL,
  `id_status_product` int NULL DEFAULT NULL,
  `name_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description_product` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `warning_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` double NULL DEFAULT 0.5,
  `length` double NULL DEFAULT 0.5,
  `width` double NULL DEFAULT 0.5,
  `height` double NULL DEFAULT 0.5,
  `date_inserted` datetime NULL DEFAULT current_timestamp,
  `date_updated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`) USING BTREE,
  INDEX `id_subtype_product`(`id_subtype_product` ASC) USING BTREE,
  INDEX `id_status_product`(`id_status_product` ASC) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_subtype_product`) REFERENCES `subtype_products` (`id_subtype`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_status_product`) REFERENCES `status_products` (`id_status_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 1, 2, 'Axit ', 'đây là Axit', 'đây là sản phẩm nguy hiểm , tránh xa tầm tay trẻ em', 'Việt Nam', 0.5, 0.5, 0.5, 0.5, '2023-03-03 17:49:47', NULL);

-- ----------------------------
-- Table structure for review_products
-- ----------------------------
DROP TABLE IF EXISTS `review_products`;
CREATE TABLE `review_products`  (
  `id_review` int NOT NULL AUTO_INCREMENT,
  `id_product` bigint NOT NULL,
  `stars` tinyint NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_inserted` datetime NULL DEFAULT current_timestamp,
  `date_updated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_review`, `id_product`) USING BTREE,
  INDEX `id_product`(`id_product` ASC) USING BTREE,
  CONSTRAINT `review_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review_products
-- ----------------------------
INSERT INTO `review_products` VALUES (2, 1, 5, 'sản phẩm tốt', NULL, NULL, NULL, '2023-03-03 17:51:48', NULL);

-- ----------------------------
-- Table structure for role_admins
-- ----------------------------
DROP TABLE IF EXISTS `role_admins`;
CREATE TABLE `role_admins`  (
  `id_role_admin` int NOT NULL,
  `name_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_role_admin`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_admins
-- ----------------------------
INSERT INTO `role_admins` VALUES (1, 'root');
INSERT INTO `role_admins` VALUES (2, 'super-root');

-- ----------------------------
-- Table structure for sold_products
-- ----------------------------
DROP TABLE IF EXISTS `sold_products`;
CREATE TABLE `sold_products`  (
  `id_product` bigint NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp,
  `quantity_sold` int NOT NULL DEFAULT 0,
  `name_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`, `date_time`) USING BTREE,
  CONSTRAINT `sold_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sold_products
-- ----------------------------
INSERT INTO `sold_products` VALUES (1, '2023-03-03 17:52:12', 100, NULL);
INSERT INTO `sold_products` VALUES (1, '2023-03-03 17:52:28', 300, NULL);

-- ----------------------------
-- Table structure for status_accs
-- ----------------------------
DROP TABLE IF EXISTS `status_accs`;
CREATE TABLE `status_accs`  (
  `id_status_acc` int NOT NULL,
  `name_status_acc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_acc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status_accs
-- ----------------------------
INSERT INTO `status_accs` VALUES (0, 'Chờ kích hoạt');
INSERT INTO `status_accs` VALUES (1, 'Bình thường');
INSERT INTO `status_accs` VALUES (2, 'Tạm khóa');
INSERT INTO `status_accs` VALUES (3, 'Khóa vĩnh viễn');

-- ----------------------------
-- Table structure for status_bills
-- ----------------------------
DROP TABLE IF EXISTS `status_bills`;
CREATE TABLE `status_bills`  (
  `id_status_bill` int NOT NULL,
  `name_status_bill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_bill`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status_bills
-- ----------------------------
INSERT INTO `status_bills` VALUES (1, 'Đang chờ xác nhận ');
INSERT INTO `status_bills` VALUES (2, 'Đang chờ vận chuyển');
INSERT INTO `status_bills` VALUES (3, 'Đang vận chuyển');
INSERT INTO `status_bills` VALUES (4, 'Đã vận chuyển ');
INSERT INTO `status_bills` VALUES (5, 'Hủy');

-- ----------------------------
-- Table structure for status_images
-- ----------------------------
DROP TABLE IF EXISTS `status_images`;
CREATE TABLE `status_images`  (
  `id_status_image` int NOT NULL,
  `name_status_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_image`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status_images
-- ----------------------------
INSERT INTO `status_images` VALUES (1, 'có bản quyền');
INSERT INTO `status_images` VALUES (2, 'không có bản quyền');

-- ----------------------------
-- Table structure for status_products
-- ----------------------------
DROP TABLE IF EXISTS `status_products`;
CREATE TABLE `status_products`  (
  `id_status_product` int NOT NULL,
  `name_status_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_product`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status_products
-- ----------------------------
INSERT INTO `status_products` VALUES (1, 'Còn hàng');
INSERT INTO `status_products` VALUES (2, 'Hết hàng');
INSERT INTO `status_products` VALUES (3, 'Cấm bán');

-- ----------------------------
-- Table structure for subtype_products
-- ----------------------------
DROP TABLE IF EXISTS `subtype_products`;
CREATE TABLE `subtype_products`  (
  `id_subtype` int NOT NULL,
  `id_type_product` int NULL DEFAULT NULL,
  `name_subtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_subtype`) USING BTREE,
  INDEX `id_type_product`(`id_type_product` ASC) USING BTREE,
  CONSTRAINT `subtype_products_ibfk_1` FOREIGN KEY (`id_type_product`) REFERENCES `type_products` (`id_type_product`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subtype_products
-- ----------------------------
INSERT INTO `subtype_products` VALUES (1, 1, 'Axit', NULL);
INSERT INTO `subtype_products` VALUES (2, 1, 'Bazo', NULL);
INSERT INTO `subtype_products` VALUES (3, 1, 'Muối', NULL);
INSERT INTO `subtype_products` VALUES (4, 1, 'Kim loại', NULL);
INSERT INTO `subtype_products` VALUES (5, 1, 'Chất chỉ thị ', NULL);
INSERT INTO `subtype_products` VALUES (6, 1, 'Dung môi', NULL);
INSERT INTO `subtype_products` VALUES (7, 1, 'Thuốc thử', NULL);
INSERT INTO `subtype_products` VALUES (8, 1, 'Hợp chất hưu cơ ', NULL);
INSERT INTO `subtype_products` VALUES (9, 1, 'Oxit', NULL);
INSERT INTO `subtype_products` VALUES (10, 2, 'Giá đỡ ống nghiệm', NULL);
INSERT INTO `subtype_products` VALUES (11, 2, 'Kẹp gỗ', NULL);
INSERT INTO `subtype_products` VALUES (12, 2, 'Dụng cụ thủy tinh', NULL);
INSERT INTO `subtype_products` VALUES (13, 2, 'Ống hút nhỏ giọt', NULL);
INSERT INTO `subtype_products` VALUES (14, 3, 'Cân điện tử', NULL);
INSERT INTO `subtype_products` VALUES (15, 3, 'Máy khuấy', NULL);
INSERT INTO `subtype_products` VALUES (16, 3, 'Máy nghiền mẫu', NULL);
INSERT INTO `subtype_products` VALUES (17, 3, 'Các loại tủ', NULL);

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `id_supplier` int NOT NULL,
  `name_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_supplier`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `id_type_acc` int NOT NULL,
  `name_type_acc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_acc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `id_type_product` int NOT NULL,
  `name_type_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_product`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `id_voucher` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discount` double NULL DEFAULT NULL,
  `start_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_voucher`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vouchers
-- ----------------------------
INSERT INTO `vouchers` VALUES (1, 'ABC123', 0.3, NULL, NULL, '2023-03-03 17:54:51');
INSERT INTO `vouchers` VALUES (2, '456DEF', 0.5, NULL, NULL, '2023-03-03 17:55:07');

SET FOREIGN_KEY_CHECKS = 1;
