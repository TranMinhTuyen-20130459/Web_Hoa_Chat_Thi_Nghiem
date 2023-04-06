-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table hoa_chat_thi_nghiem.account_admins
CREATE TABLE IF NOT EXISTS `account_admins` (
  `username` varchar(50) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `id_role_admin` int(11) NOT NULL,
  `id_status_acc` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `time_change_pass` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`) USING BTREE,
  KEY `id_status_acc` (`id_status_acc`) USING BTREE,
  KEY `id_role_admin` (`id_role_admin`) USING BTREE,
  CONSTRAINT `account_admins_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_accs` (`id_status_acc`),
  CONSTRAINT `account_admins_ibfk_2` FOREIGN KEY (`id_role_admin`) REFERENCES `role_admins` (`id_role_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.account_admins: ~8 rows (approximately)
INSERT INTO `account_admins` (`username`, `full_name`, `id_role_admin`, `id_status_acc`, `password`, `time_created`, `time_change_pass`) VALUES
	('ac', ' ', 3, 1, '1', '2023-04-01 17:29:30', '2023-04-01 17:29:30'),
	('mysa', ' ', 1, 1, '1', '2023-03-28 16:08:59', '2023-03-28 16:08:59'),
	('nguyenphutai', 'Nguyễn Phú Tài', 2, 1, '123456', '2023-03-26 02:19:15', '2023-03-26 02:19:15'),
	('nguyentandat', 'Nguyễn Tấn Đạt', 2, 1, '123456', '2023-03-26 02:19:15', '2023-03-26 02:19:15'),
	('nguyenvanlenh', 'Lênh', 3, 1, '1', '2023-03-28 15:09:23', '2023-03-28 15:09:23'),
	('nguyenvan`', ' ', 1, 2, '1', '2023-04-01 17:34:53', '2023-04-01 17:34:53'),
	('tranminhtuyen', 'Trần Minh Tuyên', 3, 1, '123', '2023-03-26 02:19:15', '2023-03-26 02:27:17'),
	('vl@gmail.com', 'NLV', 1, 1, '1', '2023-03-28 15:42:35', '2023-03-28 15:42:35');

-- Dumping structure for table hoa_chat_thi_nghiem.account_customers
CREATE TABLE IF NOT EXISTS `account_customers` (
  `id_user_customer` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `id_status_acc` int(11) NOT NULL,
  `id_city` int(11) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `email_customer` varchar(50) DEFAULT NULL,
  `phone_customer` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `time_change_pass` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user_fb` varchar(255) DEFAULT NULL,
  `id_user_gg` varchar(255) DEFAULT NULL,
  `id_type_acc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user_customer`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `id_status_acc` (`id_status_acc`) USING BTREE,
  KEY `id_city` (`id_city`) USING BTREE,
  KEY `account_customer_ibfk_3` (`id_type_acc`) USING BTREE,
  CONSTRAINT `account_customers_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_accs` (`id_status_acc`),
  CONSTRAINT `account_customers_ibfk_3` FOREIGN KEY (`id_type_acc`) REFERENCES `type_accs` (`id_type_acc`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.account_customers: ~7 rows (approximately)
INSERT INTO `account_customers` (`id_user_customer`, `username`, `pass`, `id_status_acc`, `id_city`, `full_name`, `sex`, `email_customer`, `phone_customer`, `address`, `time_created`, `time_change_pass`, `id_user_fb`, `id_user_gg`, `id_type_acc`) VALUES
	(6, 'nguyenphutai840@gmail.com', '123', 1, 1, 'Nguyễn Phú Tài', 'Nam', 'nguyenphutai840@gmail.com', '0353677271', 'Di Linh, Lâm Đồng', '2023-03-26 02:18:56', '2023-03-26 02:18:56', NULL, NULL, NULL),
	(7, 'tranminhtuyen0908@gmail.com', '123', 1, 1, 'Trần Minh Tuyên', 'Nam', 'tranminhtuyen0908@gmail.com', '0353677272', 'Nam Định', '2023-03-26 02:18:56', '2023-03-26 02:18:56', NULL, NULL, 1),
	(8, 'nguyentandat@gmail.com', '123', 1, 1, 'Nguyễn Tấn Đạt', 'Nam', 'nguyentandat@gmail.com', '0353677273', 'Bến Tre', '2023-03-26 02:18:56', '2023-03-26 02:18:56', NULL, NULL, NULL),
	(16, 'GG103049362477209229229', '103049362477209229229@gg123', 1, 0, 'Tuyên Minh', NULL, 'anhemphattrien@gmail.com', NULL, NULL, '2023-03-26 02:56:39', '2023-03-26 02:56:39', NULL, '103049362477209229229', 3),
	(17, 'GG108327235615609948235', '108327235615609948235@gg123', 1, 0, 'Tuyên Trần Minh', NULL, 'tmt010101ccna@gmail.com', NULL, NULL, '2023-03-26 02:58:36', '2023-03-26 02:58:36', NULL, '108327235615609948235', 3),
	(18, 'FB487782076904211', '487782076904211@fb123', 1, 0, 'Trần Tuyên', NULL, 'tmt010101ccna@gmail.com', NULL, NULL, '2023-03-26 02:59:06', '2023-03-26 02:59:06', '487782076904211', NULL, 2),
	(21, 'vanlenh40@gmail.com', '1', 1, 0, 'Lênh Văn Nguyễn', 'Nam', NULL, NULL, NULL, '2023-03-28 15:11:04', '2023-03-28 15:11:04', NULL, NULL, 1);

-- Dumping structure for table hoa_chat_thi_nghiem.bills
CREATE TABLE IF NOT EXISTS `bills` (
  `id_bill` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_status_bill` int(11) NOT NULL,
  `id_city` int(11) DEFAULT NULL,
  `shop_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_ward_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_district_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_province_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requied_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_ward_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_district_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_province_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_ward_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_district_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_province_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_voucher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_price` decimal(10,2) DEFAULT NULL,
  `bill_price_before` decimal(10,2) DEFAULT NULL,
  `bill_price_after` decimal(10,2) DEFAULT NULL,
  `insurance_value` decimal(10,2) DEFAULT NULL,
  `time_order` datetime DEFAULT current_timestamp(),
  `email_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_bill`) USING BTREE,
  KEY `id_user` (`id_user`) USING BTREE,
  KEY `id_status_bill` (`id_status_bill`) USING BTREE,
  KEY `id_city` (`id_city`) USING BTREE,
  CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`id_status_bill`) REFERENCES `status_bills` (`id_status_bill`),
  CONSTRAINT `bills_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `account_customers` (`id_user_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.bills: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.bill_details
CREATE TABLE IF NOT EXISTS `bill_details` (
  `id_bill` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `listed_price` bigint(20) NOT NULL,
  `current_price` bigint(20) NOT NULL,
  PRIMARY KEY (`id_bill`,`id_product`) USING BTREE,
  KEY `id_product` (`id_product`) USING BTREE,
  CONSTRAINT `bill_details_ibfk_1` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id_bill`),
  CONSTRAINT `bill_details_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.bill_details: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `name_city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport` bigint(20) NOT NULL,
  PRIMARY KEY (`id_city`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.cities: ~3 rows (approximately)
INSERT INTO `cities` (`id_city`, `name_city`, `transport`) VALUES
	(1, 'Hồ Chí Minh', 10000),
	(2, 'Hà Nội', 30000),
	(3, 'Đà Nẵng', 20000);

-- Dumping structure for table hoa_chat_thi_nghiem.comment_news
CREATE TABLE IF NOT EXISTS `comment_news` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_news` int(11) NOT NULL,
  `id_user_customer` int(11) NOT NULL,
  `time_comment` timestamp NOT NULL DEFAULT current_timestamp(),
  `content_comment` text NOT NULL,
  PRIMARY KEY (`id_comment`) USING BTREE,
  KEY `id_news` (`id_news`) USING BTREE,
  KEY `id_user_customer` (`id_user_customer`) USING BTREE,
  CONSTRAINT `comment_news_ibfk_1` FOREIGN KEY (`id_news`) REFERENCES `news` (`id_news`),
  CONSTRAINT `comment_news_ibfk_2` FOREIGN KEY (`id_user_customer`) REFERENCES `account_customers` (`id_user_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.comment_news: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_contact` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_contact` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `problem_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_problem` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_insert` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_contact`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.contacts: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.images
CREATE TABLE IF NOT EXISTS `images` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `id_status_image` int(11) DEFAULT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  `date_inserted` datetime DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_image`) USING BTREE,
  KEY `fk_status_img` (`id_status_image`) USING BTREE,
  CONSTRAINT `fk_status_img` FOREIGN KEY (`id_status_image`) REFERENCES `status_images` (`id_status_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.images: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.infor_webs
CREATE TABLE IF NOT EXISTS `infor_webs` (
  `id_infor` int(11) NOT NULL AUTO_INCREMENT,
  `phone_web` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_web` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_web` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_infor`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.infor_webs: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.level_logs
CREATE TABLE IF NOT EXISTS `level_logs` (
  `id_level` int(11) NOT NULL,
  `name_level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_level`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.level_logs: ~4 rows (approximately)
INSERT INTO `level_logs` (`id_level`, `name_level`) VALUES
	(1, 'INFOR'),
	(2, 'ALERT'),
	(3, 'WARNING'),
	(4, 'DANGER');

-- Dumping structure for table hoa_chat_thi_nghiem.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id_log` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT '-1',
  `src` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `web_browser` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_log`) USING BTREE,
  KEY `id_level` (`id_level`) USING BTREE,
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level_logs` (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.logs: ~12 rows (approximately)
INSERT INTO `logs` (`id_log`, `id_level`, `user_id`, `src`, `content`, `ip_address`, `web_browser`, `create_at`, `status`) VALUES
	(3, 3, '103049362477209229229', '', 'tạo tài khoản bằng Gg', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:56:39', ''),
	(4, 2, '103049362477209229229', '', 'đăng nhập hệ thống bằng tài khoản Gg', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:56:39', ''),
	(5, 2, '103049362477209229229', '', 'đăng nhập hệ thống bằng tài khoản Gg', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:57:48', ''),
	(6, 3, '108327235615609948235', '', 'tạo tài khoản bằng Gg', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:58:36', ''),
	(7, 2, '108327235615609948235', '', 'đăng nhập hệ thống bằng tài khoản Gg', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:58:36', ''),
	(8, 3, '487782076904211', '', 'tạo tài khoản bằng Fb', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:59:06', ''),
	(9, 2, '487782076904211', '', 'đăng nhập hệ thống bằng tài khoản Fb', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:59:06', ''),
	(10, 2, '487782076904211', '', 'đăng nhập hệ thống bằng tài khoản Fb', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.54', '2023-03-26 09:59:59', ''),
	(11, 1, '21', 'Lênh Văn Nguyễn', 'Searched with content: Ronaldo', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '2023-03-28 23:16:36', 'Active'),
	(12, 1, NULL, 'Unknown', 'Searched with content: Hello', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '2023-04-01 23:34:41', 'Active'),
	(13, 4, '0', '', 'Thêm tài khoản admin ac', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '2023-04-02 00:29:31', 'Thành công'),
	(14, 3, '0', '', 'Thêm tài khoản admin mysa đã tồn tại', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '2023-04-02 00:32:44', 'Thành công'),
	(15, 3, '0', 'Lênh', 'Thêm tài khoản admin mysa đã tồn tại', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '2023-04-02 00:33:18', 'Thành công'),
	(16, 3, '0', 'Lênh', 'Thêm tài khoản admin nguyenvan`', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '2023-04-02 00:34:53', 'Thành công');

-- Dumping structure for table hoa_chat_thi_nghiem.news
CREATE TABLE IF NOT EXISTS `news` (
  `id_news` int(11) NOT NULL AUTO_INCREMENT,
  `title_news` text NOT NULL,
  `content_news` text NOT NULL,
  `url_img_news` text DEFAULT NULL,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantity_comment` int(11) NOT NULL,
  PRIMARY KEY (`id_news`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.news: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.price_products
CREATE TABLE IF NOT EXISTS `price_products` (
  `id_product` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `listed_price` bigint(20) NOT NULL,
  `current_price` bigint(20) NOT NULL,
  `nameAdmin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_product`,`date`) USING BTREE,
  CONSTRAINT `price_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.price_products: ~3 rows (approximately)
INSERT INTO `price_products` (`id_product`, `date`, `listed_price`, `current_price`, `nameAdmin`) VALUES
	(11, '2023-03-31 08:29:08', 111, 111, 'nguyenvanlenh'),
	(12, '2023-04-01 14:38:38', 12000, 122222, 'nguyenvanlenh'),
	(13, '2023-04-01 14:42:05', 11111, 11111, 'nguyenvanlenh');

-- Dumping structure for table hoa_chat_thi_nghiem.products
CREATE TABLE IF NOT EXISTS `products` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `id_subtype` int(11) NOT NULL,
  `id_status_product` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `description_product` text DEFAULT NULL,
  `url_img_product` text DEFAULT NULL,
  `quantity_product` int(11) NOT NULL,
  `date_inserted` timestamp NOT NULL DEFAULT current_timestamp(),
  `nameAdmin` varchar(50) DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  PRIMARY KEY (`id_product`) USING BTREE,
  KEY `id_type_product` (`id_subtype`) USING BTREE,
  KEY `id_status_product` (`id_status_product`) USING BTREE,
  KEY `id_supplier` (`id_supplier`) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_subtype`) REFERENCES `subtype_products` (`id_subtype`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_status_product`) REFERENCES `status_products` (`id_status_product`),
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.products: ~3 rows (approximately)
INSERT INTO `products` (`id_product`, `id_subtype`, `id_status_product`, `id_supplier`, `name_product`, `description_product`, `url_img_product`, `quantity_product`, `date_inserted`, `nameAdmin`, `views`) VALUES
	(11, 1, 1, 3, 'Hello 1', 'adasdfasdfgasdfgasdfgh', '/CKFinderJava/DATA/img_HoaChat/nuoc-thai.jpg', 1, '2023-03-31 08:29:08', 'nguyenvanlenh', 20),
	(12, 1, 1, 1, 'Hello 2', 'hello my friends . nice to meet you', '/CKFinderJava/DATA/img_HoaChat/logoNLU.png', 14, '2023-04-01 14:38:38', 'nguyenvanlenh', 11),
	(13, 3, 2, 5, 'Hello 11', 'asdffghs dhsfjjk  ey4yawers   ttw sfs', '/images/DATA/img_HoaChat/nuoc-thai%20(Large).jpg', 0, '2023-04-01 14:42:05', 'nguyenvanlenh', 7);

-- Dumping structure for table hoa_chat_thi_nghiem.product_images
CREATE TABLE IF NOT EXISTS `product_images` (
  `id_product` int(11) NOT NULL,
  `id_image` int(11) NOT NULL,
  `date_inserted` datetime DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_product`,`id_image`) USING BTREE,
  KEY `fk_product_image2` (`id_image`) USING BTREE,
  CONSTRAINT `fk_product_image1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`),
  CONSTRAINT `fk_product_image2` FOREIGN KEY (`id_image`) REFERENCES `images` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.product_images: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.review_products
CREATE TABLE IF NOT EXISTS `review_products` (
  `id_review` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `stars` tinyint(4) DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_review`,`id_product`) USING BTREE,
  KEY `fk_review_product` (`id_product`) USING BTREE,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.review_products: ~0 rows (approximately)
INSERT INTO `review_products` (`id_review`, `id_product`, `stars`, `content`, `fullname`, `phone`, `email`) VALUES
	(1, 11, 3, 'dfdsfs', 'sfsdfsdf', '24325523532', NULL),
	(2, 11, 2, 'sâsasas', 'Lenh Nguyen', '0978038570', 'vanlenh40@gmail.com'),
	(3, 11, 3, '\\ádadd', 'Lenh Nguyen', '0978038570', 'vanlenh40@gmail.com'),
	(4, 11, 5, 'perfect', 'Lenh Nguyen', '0978038570', 'vanlenh40@gmail.com'),
	(5, 13, 2, 'ag', 'Lenh Nguyen', '0978038570', 'vanlenh40@gmail.com');

-- Dumping structure for table hoa_chat_thi_nghiem.role_admins
CREATE TABLE IF NOT EXISTS `role_admins` (
  `id_role_admin` int(11) NOT NULL,
  `name_role` varchar(50) NOT NULL,
  PRIMARY KEY (`id_role_admin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.role_admins: ~3 rows (approximately)
INSERT INTO `role_admins` (`id_role_admin`, `name_role`) VALUES
	(1, 'root'),
	(2, 'member'),
	(3, 'super-root');

-- Dumping structure for table hoa_chat_thi_nghiem.sold_products
CREATE TABLE IF NOT EXISTS `sold_products` (
  `id_product` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantity_sold` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`datetime`) USING BTREE,
  CONSTRAINT `sold_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.sold_products: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.status_accs
CREATE TABLE IF NOT EXISTS `status_accs` (
  `id_status_acc` int(11) NOT NULL,
  `name_status_acc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_status_acc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.status_accs: ~3 rows (approximately)
INSERT INTO `status_accs` (`id_status_acc`, `name_status_acc`) VALUES
	(1, 'Bình thường'),
	(2, 'Tạm khóa'),
	(3, 'Khóa vĩnh viễn');

-- Dumping structure for table hoa_chat_thi_nghiem.status_bills
CREATE TABLE IF NOT EXISTS `status_bills` (
  `id_status_bill` int(11) NOT NULL,
  `name_status_bill` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_status_bill`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.status_bills: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.status_images
CREATE TABLE IF NOT EXISTS `status_images` (
  `id_status_image` int(11) NOT NULL AUTO_INCREMENT,
  `name_status_image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_status_image`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.status_images: ~0 rows (approximately)

-- Dumping structure for table hoa_chat_thi_nghiem.status_products
CREATE TABLE IF NOT EXISTS `status_products` (
  `id_status_product` int(11) NOT NULL,
  `name_status_product` varchar(50) NOT NULL,
  PRIMARY KEY (`id_status_product`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.status_products: ~4 rows (approximately)
INSERT INTO `status_products` (`id_status_product`, `name_status_product`) VALUES
	(1, 'Mới'),
	(2, 'Hot'),
	(3, 'Cấm bán');

-- Dumping structure for table hoa_chat_thi_nghiem.subtype_products
CREATE TABLE IF NOT EXISTS `subtype_products` (
  `id_subtype` int(11) NOT NULL,
  `name_subtype` varchar(255) CHARACTER SET utf8 NOT NULL,
  `id_type_product` int(11) NOT NULL,
  `sign` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_subtype`) USING BTREE,
  KEY `id_type_product` (`id_type_product`) USING BTREE,
  CONSTRAINT `subtype_products_ibfk_1` FOREIGN KEY (`id_type_product`) REFERENCES `type_products` (`id_type_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.subtype_products: ~18 rows (approximately)
INSERT INTO `subtype_products` (`id_subtype`, `name_subtype`, `id_type_product`, `sign`) VALUES
	(1, 'Acid', 1, NULL),
	(2, 'Bazo', 1, NULL),
	(3, 'Muối', 1, NULL),
	(4, 'Kim Loại', 1, NULL),
	(5, 'Chất Chỉ Thị', 1, NULL),
	(6, 'Dung Môi', 1, NULL),
	(7, 'Thuốc Thử', 1, NULL),
	(8, 'Hợp Chất Hữu Cơ', 1, NULL),
	(9, 'Oxit', 1, NULL),
	(10, 'Giá Đỡ Ống Nghiệm', 2, NULL),
	(11, 'Kẹp Gỗ', 2, NULL),
	(12, 'Dụng Cụ Thủy Tinh', 2, NULL),
	(13, 'Ống Hút Nhỏ Giọt', 2, NULL),
	(14, 'Cân Điện Tử', 3, NULL),
	(15, 'Máy Khuấy', 3, NULL),
	(16, 'Máy Nghiền Mẫu', 3, NULL),
	(17, 'Các Loại Tủ', 3, NULL);

-- Dumping structure for table hoa_chat_thi_nghiem.suppliers
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `name_supplier` varchar(255) NOT NULL,
  PRIMARY KEY (`id_supplier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.suppliers: ~7 rows (approximately)
INSERT INTO `suppliers` (`id_supplier`, `name_supplier`) VALUES
	(1, 'Merck - Đức'),
	(2, 'Acros Organics - Mỹ'),
	(3, 'Fisher - Mỹ'),
	(4, 'BOSF - Trung Quốc'),
	(5, 'Duchefa - Hà Lan'),
	(6, 'Wako - Nhật Bản');

-- Dumping structure for table hoa_chat_thi_nghiem.type_accs
CREATE TABLE IF NOT EXISTS `type_accs` (
  `id_type_acc` int(11) NOT NULL AUTO_INCREMENT,
  `name_type_acc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_type_acc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.type_accs: ~3 rows (approximately)
INSERT INTO `type_accs` (`id_type_acc`, `name_type_acc`) VALUES
	(1, 'Bình thường'),
	(2, 'Facebook'),
	(3, 'Google');

-- Dumping structure for table hoa_chat_thi_nghiem.type_products
CREATE TABLE IF NOT EXISTS `type_products` (
  `id_type_product` int(11) NOT NULL AUTO_INCREMENT,
  `name_type_product` varchar(255) NOT NULL,
  PRIMARY KEY (`id_type_product`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.type_products: ~3 rows (approximately)
INSERT INTO `type_products` (`id_type_product`, `name_type_product`) VALUES
	(1, 'Hóa Chất'),
	(2, 'Dụng Cụ'),
	(3, 'Thiết Bị');

-- Dumping structure for table hoa_chat_thi_nghiem.vouchers
CREATE TABLE IF NOT EXISTS `vouchers` (
  `id_voucher` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_voucher`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hoa_chat_thi_nghiem.vouchers: ~0 rows (approximately)

-- Dumping structure for trigger hoa_chat_thi_nghiem.delete_product
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_product` AFTER DELETE ON `price_products` FOR EACH ROW BEGIN
	DELETE FROM `sold_products` WHERE `id_product` = OLD.id_product;
	DELETE FROM `products` WHERE `id_product` = OLD.id_product;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger hoa_chat_thi_nghiem.limit_stars
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `limit_stars` BEFORE INSERT ON `review_products` FOR EACH ROW BEGIN
	IF NEW.stars > 5 OR NEW.stars < 1 THEN SIGNAL SQLSTATE '45001' SET message_text = 'stars must be in 1 - 5';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger hoa_chat_thi_nghiem.limit_stars_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `limit_stars_update` BEFORE UPDATE ON `review_products` FOR EACH ROW BEGIN
	IF NEW.stars > 5 OR NEW.stars < 1 THEN SIGNAL SQLSTATE '45001' SET message_text = 'stars must be in 1 - 5';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger hoa_chat_thi_nghiem.trigger_sold
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_sold` AFTER INSERT ON `bill_details` FOR EACH ROW BEGIN
	UPDATE `sold_products` SET quantity_sold = (SELECT SUM(quantity) FROM bill_details WHERE id_product = NEW.id_product) WHERE id_product = NEW.id_product;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
