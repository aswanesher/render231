/*
Navicat MySQL Data Transfer

Source Server         : lokal
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : render231

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-14 14:27:20
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `kb_bahan`
-- ----------------------------
DROP TABLE IF EXISTS `kb_bahan`;
CREATE TABLE `kb_bahan` (
  `id_bahan` int(5) NOT NULL AUTO_INCREMENT,
  `jenis_bahan` varchar(50) CHARACTER SET latin1 NOT NULL,
  `harga` varchar(25) CHARACTER SET latin1 NOT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bahan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kb_bahan
-- ----------------------------
INSERT INTO `kb_bahan` VALUES ('1', 'Flexi Front Lite 280', '25000', '30');
INSERT INTO `kb_bahan` VALUES ('3', 'Flexi Front Lite 290', '26000', '20');
INSERT INTO `kb_bahan` VALUES ('4', 'Flexi Front Lite 300', '27000', '10');
INSERT INTO `kb_bahan` VALUES ('5', 'One Way', '85000', '40');
INSERT INTO `kb_bahan` VALUES ('6', 'Stiker', '85000', '5');
INSERT INTO `kb_bahan` VALUES ('7', 'Cutting Vinil', '65000', '8');
INSERT INTO `kb_bahan` VALUES ('8', 'Flexi Front Lite 350', '60000', '10');

-- ----------------------------
-- Table structure for `kb_belanja_reseller`
-- ----------------------------
DROP TABLE IF EXISTS `kb_belanja_reseller`;
CREATE TABLE `kb_belanja_reseller` (
  `no_faktur` varchar(25) NOT NULL DEFAULT '',
  `id_reseller` bigint(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `total_belanja` int(11) DEFAULT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`no_faktur`),
  KEY `id_reseller` (`id_reseller`),
  CONSTRAINT `kb_belanja_reseller_ibfk_1` FOREIGN KEY (`id_reseller`) REFERENCES `kb_users_backup` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_belanja_reseller
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_belanja_reseller_detail`
-- ----------------------------
DROP TABLE IF EXISTS `kb_belanja_reseller_detail`;
CREATE TABLE `kb_belanja_reseller_detail` (
  `no_faktur` varchar(25) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `id_detail_produk` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  KEY `no_faktur` (`no_faktur`),
  CONSTRAINT `kb_belanja_reseller_detail_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `kb_belanja_reseller` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_belanja_reseller_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_comments`
-- ----------------------------
DROP TABLE IF EXISTS `kb_comments`;
CREATE TABLE `kb_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `user_id` (`user_id`),
  CONSTRAINT `kb_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `kb_users_backup` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_diskon_reseller`
-- ----------------------------
DROP TABLE IF EXISTS `kb_diskon_reseller`;
CREATE TABLE `kb_diskon_reseller` (
  `id_label` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `type_reseller` int(11) DEFAULT NULL,
  `id_diskon` int(11) NOT NULL AUTO_INCREMENT,
  `min_beli` int(11) DEFAULT NULL,
  `max_beli` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_diskon`),
  KEY `id_label` (`id_label`),
  CONSTRAINT `kb_diskon_reseller_ibfk_1` FOREIGN KEY (`id_label`) REFERENCES `kb_label_produk` (`id_label`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_diskon_reseller
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_isi_ulang_saldo`
-- ----------------------------
DROP TABLE IF EXISTS `kb_isi_ulang_saldo`;
CREATE TABLE `kb_isi_ulang_saldo` (
  `no_tf` int(30) NOT NULL DEFAULT '0',
  `tgl_tf` datetime DEFAULT NULL,
  `id_reseller` bigint(11) DEFAULT NULL,
  `id_admin` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`no_tf`),
  KEY `id_reseller` (`id_reseller`),
  CONSTRAINT `kb_isi_ulang_saldo_ibfk_1` FOREIGN KEY (`id_reseller`) REFERENCES `kb_users_backup` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_isi_ulang_saldo
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_jasa_ekspedisi`
-- ----------------------------
DROP TABLE IF EXISTS `kb_jasa_ekspedisi`;
CREATE TABLE `kb_jasa_ekspedisi` (
  `id_ekspedisi` int(11) NOT NULL AUTO_INCREMENT,
  `nm_ekspedisi` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `modified_at` date DEFAULT NULL,
  PRIMARY KEY (`id_ekspedisi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_jasa_ekspedisi
-- ----------------------------
INSERT INTO `kb_jasa_ekspedisi` VALUES ('1', 'jne', '1', '2016-07-25', '2016-10-29');
INSERT INTO `kb_jasa_ekspedisi` VALUES ('2', 'tiki', '1', '2016-07-25', null);
INSERT INTO `kb_jasa_ekspedisi` VALUES ('3', 'pos', '1', '2016-07-25', null);
INSERT INTO `kb_jasa_ekspedisi` VALUES ('5', 'jnt', '1', '2016-07-25', null);
INSERT INTO `kb_jasa_ekspedisi` VALUES ('6', 'WAHANA', '63', '2016-09-16', null);

-- ----------------------------
-- Table structure for `kb_label_produk`
-- ----------------------------
DROP TABLE IF EXISTS `kb_label_produk`;
CREATE TABLE `kb_label_produk` (
  `id_label` int(11) NOT NULL AUTO_INCREMENT,
  `nama_label` varchar(40) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id_label`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_label_produk
-- ----------------------------
INSERT INTO `kb_label_produk` VALUES ('1', 'Green', null);

-- ----------------------------
-- Table structure for `kb_links`
-- ----------------------------
DROP TABLE IF EXISTS `kb_links`;
CREATE TABLE `kb_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_links
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_media`
-- ----------------------------
DROP TABLE IF EXISTS `kb_media`;
CREATE TABLE `kb_media` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(99) NOT NULL,
  `jenis` varchar(99) NOT NULL,
  `keterangan` varchar(99) NOT NULL,
  `gambar` varchar(99) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `kategori` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `author` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_image`),
  KEY `author` (`author`),
  KEY `kategori` (`kategori`),
  CONSTRAINT `kb_media_ibfk_1` FOREIGN KEY (`author`) REFERENCES `kb_users_backup` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kb_media_ibfk_2` FOREIGN KEY (`kategori`) REFERENCES `kb_media_type` (`id_media_cat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_media
-- ----------------------------
INSERT INTO `kb_media` VALUES ('1', 'Slider 1', 'Slider', '#', '/render231/uploads/images/HEADER-63949585.jpg', '/render231/uploads/.thumbs/images/HEADER-63949585.jpg', '1', '', '1', '2016-06-23 11:27:23', '2016-11-14 02:21:28');
INSERT INTO `kb_media` VALUES ('2', 'JNE', 'pengiriman', 'JNE', '/savanacms/uploads/images/JNE-logo-gambar-coreldraw-cdr.jpg', '/savanacms/uploads/.thumbs/images/JNE-logo-gambar-coreldraw-cdr.jpg', '3', '#', '1', '2016-06-23 11:39:31', '2016-06-30 09:52:12');
INSERT INTO `kb_media` VALUES ('3', 'Tiki', 'Tiki', 'Tiki', '/savanacms/uploads/images/tiki-logo.jpg', '/savanacms/uploads/.thumbs/images/tiki-logo.jpg', '3', '#', '1', '2016-06-23 11:40:06', '2016-06-30 09:54:50');
INSERT INTO `kb_media` VALUES ('4', 'JnT', 'pengiriman', 'JnT', '/savanacms/uploads/images/Logo-JT-Express-140x130.jpg', '/savanacms/uploads/.thumbs/images/Logo-JT-Express-140x130.jpg', '3', '#', '1', '2016-06-23 11:44:34', '2016-06-30 09:55:16');
INSERT INTO `kb_media` VALUES ('5', 'Pos', 'pengiriman', 'Pos', '/savanacms/uploads/images/pos.png', '/savanacms/uploads/.thumbs/images/pos.png', '3', '#', '1', '2016-06-23 11:44:54', '2016-06-23 11:44:54');
INSERT INTO `kb_media` VALUES ('6', 'BCA', 'bank', 'BCA', '/savanacms/uploads/images/logobca-highres-bluliner-master-2011.jpg', '/savanacms/uploads/.thumbs/images/logobca-highres-bluliner-master-2011.jpg', '2', '#', '1', '2016-06-23 11:45:31', '2016-06-30 09:57:04');
INSERT INTO `kb_media` VALUES ('7', 'Mandiri', 'bank', 'Mandiri', '/savanacms/uploads/images/Lowongan-Kerja-Terbaru-Bank-Mandiri.jpg', '/savanacms/uploads/.thumbs/images/Lowongan-Kerja-Terbaru-Bank-Mandiri.jpg', '2', '#', '1', '2016-06-23 11:45:50', '2016-06-30 09:57:55');
INSERT INTO `kb_media` VALUES ('8', 'BRI', 'bank', 'BRI', '/savanacms/uploads/images/Logo%20BRI.jpg', '/savanacms/uploads/.thumbs/images/Logo%20BRI.jpg', '2', '#', '1', '2016-06-23 11:46:06', '2016-06-30 09:59:50');
INSERT INTO `kb_media` VALUES ('10', 'Slider 2', 'Slider 2', 'Slider 2', '/render231/uploads/images/HEADER-35772705.jpg', '/render231/uploads/.thumbs/images/HEADER-35772705.jpg', '1', '', '1', '2016-11-14 02:21:52', '2016-11-14 02:21:52');

-- ----------------------------
-- Table structure for `kb_media_type`
-- ----------------------------
DROP TABLE IF EXISTS `kb_media_type`;
CREATE TABLE `kb_media_type` (
  `id_media_cat` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(160) DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_media_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_media_type
-- ----------------------------
INSERT INTO `kb_media_type` VALUES ('1', 'Slider', '1', '2016-05-16 02:24:32', '2016-10-17 05:18:01');
INSERT INTO `kb_media_type` VALUES ('2', 'Bank', '1', '2016-05-31 10:41:50', '2016-05-31 10:41:50');
INSERT INTO `kb_media_type` VALUES ('3', 'Pengiriman', '1', '2016-05-31 02:59:17', '2016-05-31 02:59:25');

-- ----------------------------
-- Table structure for `kb_menu`
-- ----------------------------
DROP TABLE IF EXISTS `kb_menu`;
CREATE TABLE `kb_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_type` enum('module','page','post','url') NOT NULL DEFAULT 'url',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `idmodule` int(11) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dyn_group_id` int(11) NOT NULL DEFAULT '0',
  `position` enum('backend','frontend') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_parent` tinyint(1) NOT NULL DEFAULT '0',
  `show_menu` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dyn_group_id - normal` (`dyn_group_id`),
  KEY `module` (`idmodule`),
  CONSTRAINT `kb_menu_ibfk_1` FOREIGN KEY (`dyn_group_id`) REFERENCES `kb_menu_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_menu
-- ----------------------------
INSERT INTO `kb_menu` VALUES ('1', 'Dashboard', 'url', '0', '0', 'backend_panel/dashboard', '', '1', 'backend', null, '0', '1', '1', 'fa fa-caret-right');
INSERT INTO `kb_menu` VALUES ('3', 'Pengaturan', 'url', '0', '0', '#', '', '1', 'backend', null, '0', '1', '1', 'fa fa-caret-right');
INSERT INTO `kb_menu` VALUES ('4', 'Akun', 'module', '0', '1', 'user', '', '1', 'backend', null, '3', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('5', 'Grup akun', 'module', '0', '2', 'user_grup', '', '1', 'backend', null, '3', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('6', 'Menu', 'module', '0', '3', 'menu', '', '1', 'backend', null, '3', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('7', 'Grup menu', 'module', '0', '4', 'menu_grup', '', '1', 'backend', null, '3', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('10', 'Produk', 'module', '0', '5', 'produk', '', '1', 'backend', null, '38', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('13', 'Hak akses', 'module', '0', '6', 'permission', '', '1', 'backend', null, '3', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('14', 'Artikel', 'module', '0', '7', 'post', '', '1', 'backend', null, '20', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('19', 'Kategori Artikel', 'module', '0', '14', 'post_category', '', '1', 'backend', null, '20', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('20', 'Konten', 'module', '0', '0', '#', '', '1', 'backend', null, '0', '1', '1', 'fa fa-caret-right');
INSERT INTO `kb_menu` VALUES ('21', 'Halaman', 'module', '0', '15', 'halaman', '', '1', 'backend', null, '20', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('22', 'Website', 'module', '0', '16', 'setting', '', '1', 'backend', null, '3', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('23', 'Testimonial', 'module', '0', '12', 'testimonial', '', '1', 'backend', null, '20', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('27', 'Media', 'module', '0', '20', 'media', '', '1', 'backend', null, '20', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('34', 'Kategori media', 'module', '0', '21', 'media_kat', '', '1', 'backend', null, '20', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('36', 'Pengaturan Widget', 'module', '0', '23', 'widgets', '', '1', 'backend', null, '3', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('38', 'Katalog Produk', 'module', '0', '0', '#', '', '1', 'backend', null, '0', '1', '1', 'fa fa-caret-right');
INSERT INTO `kb_menu` VALUES ('45', 'Profil', 'url', '0', '0', 'profile', '', '1', 'backend', null, '0', '0', '0', null);
INSERT INTO `kb_menu` VALUES ('60', 'Template', 'module', '0', '26', 'templatemanager', '', '1', 'backend', null, '3', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('62', 'Beranda', 'module', '0', '0', ' ', '', '1', 'frontend', null, '0', '1', '1', 'fa fa-caret-right');
INSERT INTO `kb_menu` VALUES ('68', 'Produk', 'page', '0', '0', 'p/produk', 'produk', '1', 'frontend', null, '0', '1', '1', 'fa fa-caret-right');
INSERT INTO `kb_menu` VALUES ('72', 'Sales', 'module', '0', '0', '#', '', '1', 'backend', null, '0', '1', '1', 'fa fa-caret-right');
INSERT INTO `kb_menu` VALUES ('73', 'Target Sales', 'module', '0', '11', 'salestarget', '', '1', 'backend', null, '72', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('74', 'Report Sales', 'module', '0', '8', 'reportsales', '', '1', 'backend', null, '72', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('75', 'Analisa Sales', 'module', '0', '0', 'salestarget/mpenjualan', '', '1', 'backend', null, '72', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('76', 'Resi Pengiriman', 'module', '0', '0', '#', '', '1', 'backend', null, '0', '1', '1', 'fa fa-caret-right');
INSERT INTO `kb_menu` VALUES ('77', 'Ekspedisi', 'module', '0', '27', 'ekspedisi', '', '1', 'backend', null, '76', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('78', 'Rekap Pengiriman', 'module', '0', '28', 'laporan_resi', '', '1', 'backend', null, '76', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('79', 'Biaya Pengiriman', 'module', '0', '29', 'biaya_resi', '', '1', 'backend', null, '76', '0', '1', '');
INSERT INTO `kb_menu` VALUES ('81', 'Kontak Kami', 'page', '0', '0', 'p/kontak', 'kontak', '1', 'frontend', null, '0', '1', '1', 'fa fa-caret-right');
INSERT INTO `kb_menu` VALUES ('82', 'Registrasi', 'page', '0', '0', 'p/register', 'register', '1', 'frontend', null, '0', '1', '1', 'fa fa-caret-right');
INSERT INTO `kb_menu` VALUES ('83', 'Bahan Produk', 'module', '0', '31', 'bahan', '', '1', 'backend', null, '38', '0', '1', null);

-- ----------------------------
-- Table structure for `kb_menu_group`
-- ----------------------------
DROP TABLE IF EXISTS `kb_menu_group`;
CREATE TABLE `kb_menu_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(160) DEFAULT NULL,
  `abbrev` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_menu_group
-- ----------------------------
INSERT INTO `kb_menu_group` VALUES ('1', 'Sidebar Menu', 'sidebar-menu');
INSERT INTO `kb_menu_group` VALUES ('2', 'Top Menu', 'top-menu');
INSERT INTO `kb_menu_group` VALUES ('4', 'Main Menu', 'main-menu');

-- ----------------------------
-- Table structure for `kb_merk_dagang`
-- ----------------------------
DROP TABLE IF EXISTS `kb_merk_dagang`;
CREATE TABLE `kb_merk_dagang` (
  `id_merk` int(11) NOT NULL AUTO_INCREMENT,
  `merk` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `modified_at` date DEFAULT NULL,
  PRIMARY KEY (`id_merk`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_merk_dagang
-- ----------------------------
INSERT INTO `kb_merk_dagang` VALUES ('3', 'Dhikr', '1', '2016-07-30', '2016-10-29');
INSERT INTO `kb_merk_dagang` VALUES ('4', 'Ammar Kids', '1', '2016-07-30', null);
INSERT INTO `kb_merk_dagang` VALUES ('5', 'Zaora Hijab', '1', '2016-07-30', null);
INSERT INTO `kb_merk_dagang` VALUES ('6', 'Afra Kids', '1', '2016-07-30', null);
INSERT INTO `kb_merk_dagang` VALUES ('7', 'Lain-lain', '1', '2016-07-30', null);

-- ----------------------------
-- Table structure for `kb_model`
-- ----------------------------
DROP TABLE IF EXISTS `kb_model`;
CREATE TABLE `kb_model` (
  `id_model` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET latin1 NOT NULL,
  `gambar` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kb_model
-- ----------------------------
INSERT INTO `kb_model` VALUES ('5', 'Model 1', 'MODEL-22561646.jpg');
INSERT INTO `kb_model` VALUES ('6', 'Model 2', 'MODEL-58178711.jpg');
INSERT INTO `kb_model` VALUES ('7', 'Model 3', 'MODEL-91653442.jpg');

-- ----------------------------
-- Table structure for `kb_modules`
-- ----------------------------
DROP TABLE IF EXISTS `kb_modules`;
CREATE TABLE `kb_modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) DEFAULT NULL,
  `module_title` varchar(100) DEFAULT NULL,
  `module_note` varchar(255) DEFAULT NULL,
  `module_author` bigint(11) DEFAULT NULL,
  `module_created` datetime DEFAULT NULL,
  `module_desc` text,
  `module_tbl` varchar(100) DEFAULT NULL,
  `module_type` enum('core','addon','master') DEFAULT 'master',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_modules
-- ----------------------------
INSERT INTO `kb_modules` VALUES ('1', 'user', 'akun', 'Pengaturan akun', '1', '2016-03-20 08:22:29', null, 'kb_users', 'core');
INSERT INTO `kb_modules` VALUES ('2', 'user_grup', 'grup akun', 'Pengaturan grup akun', '1', '2016-03-20 08:23:03', null, 'kb_user_type', 'core');
INSERT INTO `kb_modules` VALUES ('3', 'menu', 'menu', 'Pengaturan menu', '1', '2016-03-20 08:23:39', null, 'kb_menu', 'core');
INSERT INTO `kb_modules` VALUES ('4', 'menu_grup', 'grup menu', 'Pengaturan grup_menu', '1', '2016-03-20 08:24:11', null, 'kb_menu_groups', 'core');
INSERT INTO `kb_modules` VALUES ('5', 'produk', 'Produk', 'Manajemen Produk', '1', null, 'Manajemen Produk', 'kb_products', 'master');
INSERT INTO `kb_modules` VALUES ('6', 'permission', 'Permission', 'Modul Hak Akses', '1', null, 'Modul Hak Akses', 'kb_permission', 'core');
INSERT INTO `kb_modules` VALUES ('7', 'post', 'Post', 'Post', '1', null, 'Post', 'kb_posts', 'core');
INSERT INTO `kb_modules` VALUES ('8', 'reportsales', 'Report Sales', 'Modul Report Sales', '1', null, null, 'kb_target_sales', 'master');
INSERT INTO `kb_modules` VALUES ('9', 'reseller_controller', 'Reseller', 'Modul reseller', '1', null, null, 'kb_reseller_type', 'master');
INSERT INTO `kb_modules` VALUES ('10', 'reseller_diskon', 'Diskon Reseller', 'Modul diskon reseller', '1', null, null, 'kb_diskon_reseller', 'master');
INSERT INTO `kb_modules` VALUES ('11', 'salestarget', 'Target Sales', 'Modul Target sales', '1', null, null, 'kb_target_sales', 'master');
INSERT INTO `kb_modules` VALUES ('12', 'testimonial', 'Modul testimonial', 'Modul testimonial', '1', null, null, 'kb_testimonial', 'master');
INSERT INTO `kb_modules` VALUES ('13', 'updatesaldo', 'Update Saldo', 'Modul update saldo', '1', null, null, 'kb_saldo_updated', 'master');
INSERT INTO `kb_modules` VALUES ('14', 'post_category', 'Modul Post Kategori', 'Modul kategori postingan', '1', null, 'Modul kategori postingan', 'kb_post_category', 'core');
INSERT INTO `kb_modules` VALUES ('15', 'halaman', 'Halaman', 'Modul halaman', '1', '2016-04-12 20:08:19', 'Modul halaman admin', 'kb_posts', 'core');
INSERT INTO `kb_modules` VALUES ('16', 'setting', 'Pengaturan Website', 'Modul pengaturan website', null, null, 'Modul pengaturan website', 'kb_option', 'core');
INSERT INTO `kb_modules` VALUES ('17', 'label_produk', 'Label produk', 'Modul label produk', '1', null, null, 'kb_label_produk', 'master');
INSERT INTO `kb_modules` VALUES ('18', 'inputsaldo', 'Input saldo', 'modul input saldo', '1', null, null, 'kb_isi_ulang_saldo', 'master');
INSERT INTO `kb_modules` VALUES ('19', 'konfirmasipesanan', 'Konfirmasi pesanan', 'Modul konfirmasi pesanan', '1', null, null, 'kb_belanja_reseller', 'master');
INSERT INTO `kb_modules` VALUES ('20', 'media', 'Media', 'Modul Media', null, null, 'Modul Media', 'kb_media', 'addon');
INSERT INTO `kb_modules` VALUES ('21', 'media_kat', 'Kategori Media', 'Modul Kategori Media', '1', null, null, 'kb_media_type', 'master');
INSERT INTO `kb_modules` VALUES ('23', 'widgets', 'Widget', 'Modul Widget', null, null, 'Modul Widget', 'kb_widgets', 'master');
INSERT INTO `kb_modules` VALUES ('24', 'produkkategori', 'Kategori Produk', 'Moduk Kategori Produk', '1', null, 'Modul Kategori Produk', 'kb_products_category', 'master');
INSERT INTO `kb_modules` VALUES ('25', 'profile', 'Modul Profil', 'Modul Profil', '1', null, null, 'kb_user_detail', 'master');
INSERT INTO `kb_modules` VALUES ('26', 'templatemanager', 'Pengelola Template', 'Modul pengelola template', '1', null, null, 'kb_option', 'core');
INSERT INTO `kb_modules` VALUES ('27', 'ekspedisi', 'Jasa Ekspedisi', 'Modul Jasa Ekspedisi', null, null, 'Modul Jasa Ekspedisi', 'kb_jasa_ekspedisi', 'addon');
INSERT INTO `kb_modules` VALUES ('28', 'laporan_resi', 'Laporan Resi', 'Modul Laporan Resi Pengiriman', null, null, 'Modul Laporan Resi Pengiriman', 'kb_no_resi', 'addon');
INSERT INTO `kb_modules` VALUES ('29', 'biaya_resi', 'Laporan Biaya Resi', 'Modul Laporan Biaya Resi Pengiriman', null, null, 'Modul Laporan Biaya Resi Pengiriman', 'kb_no_resi', 'addon');
INSERT INTO `kb_modules` VALUES ('30', 'merk_dagang', 'Merk Produk', 'Modul Merk Produk', null, null, 'Modul Merk Produk', 'kb_merk_dagang', 'addon');
INSERT INTO `kb_modules` VALUES ('31', 'bahan', 'Module Bahan', 'Modul Bahan Produk', null, null, 'Modul Bahan Produk', 'kb_bahan', 'addon');

-- ----------------------------
-- Table structure for `kb_no_resi`
-- ----------------------------
DROP TABLE IF EXISTS `kb_no_resi`;
CREATE TABLE `kb_no_resi` (
  `id_resi` int(255) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `jasa_ekspedisi` int(11) DEFAULT NULL,
  `no_resi` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `alamat` text,
  `ukuran` varchar(255) NOT NULL,
  `biaya_ongkir` varchar(255) NOT NULL DEFAULT '0',
  `jumlah_transfer` varchar(255) NOT NULL DEFAULT '0',
  `selisih` varchar(255) NOT NULL DEFAULT '0',
  `kategori_produk` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `modified_at` date DEFAULT NULL,
  PRIMARY KEY (`id_resi`)
) ENGINE=InnoDB AUTO_INCREMENT=3430 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_no_resi
-- ----------------------------
INSERT INTO `kb_no_resi` VALUES ('1', 'MERYADI PRIYASTI RAHMA', '5', '888005533686', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('2', 'PURWANTO', '5', '888005533689', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('3', ' FANI ANISA  ', '5', '888005533690', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('4', 'MALA ', '5', '888055533680', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('5', 'SRI MULYANI ', '5', '888005533688', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('6', 'DESSI WILIANTI ', '5', '888005533587', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('7', 'WIWI SUSANTI', '5', ' 888005533588', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('8', 'REMA HASHIAH ', '5', '888005533578', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('9', 'DEWI PRISILIA ', '5', '888005533579', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('10', 'EEN MULIANI ', '5', '88005533580', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('11', 'SOLIKIN AO ', '5', '888005533581', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('12', 'RATU UMMU', '5', '888005478211', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('13', 'SRI HORMAITA AMRI', '5', '888005478212', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('14', 'IBU IYUS ZAINAL', '5', '888005478213', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('15', 'HARYATI ARY', '5', '888005533643', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('16', 'ENDANG SUSILOWATI ', '5', '888005533575', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('17', 'FATHIATUL F', '5', '888005529570', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('18', 'FIKA DWI P', '5', '888005478214', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('19', 'DYNA RIZQYANA', '5', ' 888005533679', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('20', 'NUR SAYANTO', '5', '888005533638', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('21', ' YANTI SEINA ', '5', '888005533693', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('22', 'RINA H', '5', '888005478215', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('23', 'NOLLA', '5', '888005478216', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('24', 'ERIKA YUSTIK', '5', '888005529550', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('25', ' CANTIKA MAY  YOSINTA ', '5', '888005533586', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('26', 'RAMIDA AMELIA', '5', '888005478217', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('27', 'RITA N BUSTAN', '5', '888005529565', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('28', 'AI SUSILAWATI', '5', ' 888005533585', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('29', 'ANITA MAYASARI', '5', '888005478218', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('30', 'MALA', '5', '888005529559', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('31', 'NITA ZUBAIDAH ', '5', '888005533584', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('32', 'TITIN PUSPITOWATI', '5', '888005529568', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('33', 'ZIYA DATUS SA\'ADAH', '5', '888005529576', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('34', 'MASANIH', '5', '888005533639', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('35', ' IKA F', '5', ' 888005533583', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('36', 'EZA MARZA SARI', '5', '888005529575', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('37', 'ASMIL ', '5', '888005533582', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('38', 'SOLIKIN AO ', '5', '888005533594', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('39', 'ANIK BUDI UTAMI', '5', '888005529574', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('40', 'BU DINA/PA BUYUNG ', '5', '888005533593', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('41', 'SWANDANI SAYUNINGSIH', '5', '888005529573', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('42', 'ANITA/YURNI HERAPUTRA ', '5', '888005533592', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('43', 'SRIBUDI RAHAYU', '5', '888005529572', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('44', 'SITI POPON', '5', '888005529571', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('45', 'SITI ZULAIHA (MAMA RIRIN) ', '5', '888005533591', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('46', 'BP NANANG', '5', '888005529569', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('47', 'MARYUTI ', '5', '888005533590', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('48', 'URI KARNAYA', '5', '888005533641', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('49', 'SITI AMINA HUJUHRIYAH', '5', ' 888005533589', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('50', 'FITRI', '5', '888005533644', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('51', 'MEIDA ', '5', '888005533600', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('52', 'ZAHWA', '5', '888005529577', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('53', 'NENENG HARYANI/FITRI ', '5', '888005533599', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('54', 'SUSINTA', '5', '888005533637', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('55', 'ANISA NOOR HAYATI ', '5', '88005533598', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('56', 'MERYADI PRIYASTI', '5', '888005529584', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('57', 'LEONORA', '5', '888005533642', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('58', 'NURHAYATI', '5', ' 888005533597', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('59', 'RAMA YANTI', '5', '888005533636', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('60', 'SUSTI ', '5', '888005533595', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('61', 'DIAN HERDIAN C', '5', '888005533625', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('62', 'INDAH ', '5', '888005533596', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('63', 'IDA HAMIDAH', '5', '888005533624', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('64', 'SEFTI MIRNAWATI ', '5', '888005533562', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('65', 'RUSTAMADJI', '5', '888005478219', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('66', 'DIAN AJASTYARANI', '5', '88800553365', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('67', 'ITUT WIDYASTUTI ', '5', '888005533560', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('68', 'JIHAN MARIA ULFA', '5', '888005533640', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('69', 'JEMI KAMELIA', '5', '888005478220', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('70', 'LUFIAH', '5', '888005533645', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('71', ' JUHAERIYAH UDAM ', '5', '888005533559', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('72', 'TIYAS RACHMAWATI', '5', '888005478221', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('73', 'ARIS KUSWANTO ', '5', '888005533683', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('74', 'DEWI YULIZA', '5', '888005533646', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('75', 'ESA MARZASARI', '5', '888005478222', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('76', 'SHERLY', '5', ' 888005533684', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('77', 'SITI MUGNIAH', '5', '888005529582', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('78', 'ZAHRO', '5', '888005478223', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('79', ' LIA DAHLIA ', '5', '888005533685', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('80', 'NUNING NOVIA', '5', '888005529581', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('81', 'MAMAH FAKRI', '5', '888005529579', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('82', 'MARDIAH ', '5', '888005533694', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('83', 'ITUT WIFYASTUTI', '5', '888005478224', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('84', 'NURHASANAH', '5', '888005529580', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('85', 'LILIS/SITI KOMARIAH', '5', '888005533541', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('86', 'AYUS SINTIA WAHYUNI', '5', '888005478225', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('87', 'NENENG JUHRIAH', '5', '888005529551', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('88', ' FAIZATUL KHAMIDAH ', '5', '888005533540', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('89', 'SYAIFUL ISNAINI', '5', '88800533623', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('90', ' SRI WAHYUNI', '5', '888005478226', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('91', 'SEPTI SURYANTINA', '5', '888005529552', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('92', ' LEONORA ', '5', '888005533542', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('93', 'SOFIA', '5', '888005529553', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('94', 'ENELPI SISTI', '3', '14814160779', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('95', 'SITI NENENG HASANAH ', '5', '888005533543', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('96', 'YETTI', '5', '888005529556', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('97', 'ANA MARIANA ', '5', '889005533545', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('98', 'ANIS WIDAYATI', '1', 'BDOC104870820616', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('99', 'LILIS CIPLIN  ', '5', '888005533544', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('100', 'DR. YENI', '1', 'BDOC104870740616', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('101', 'YAYAH SOFIAH', '5', '888005529558', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('102', 'ANY RAYN', '5', '888005529562', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('103', 'MIMIN ', '5', '888005533549', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('104', 'TITIN PUSPITOWATI', '1', 'BDOC104870711216', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('105', 'JIHAN MOTOR', '5', '888005529566', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('106', 'ELA (A\'OZON) ', '5', '888005533546', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('107', 'DEWI YUNITA', '1', 'BDOC104870701416', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('108', 'KHOIRIYANTI', '5', '888005529557', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('109', 'LINAWATI', '1', 'BDOC104870691016', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('110', 'M. EDI JUNAEDI ', '5', '888005533548 ', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('111', 'IBU LILIS INDRAWATI', '5', '888005529561', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('112', 'BP. NANANG ', '5', '888005533551', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('113', 'VIRDINI LEFAWARSIH', '1', 'BDOC104870680216', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('114', 'ANI H, H YAKUB ', '5', '888005533556', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('115', 'VIVI OKTAVIANI', '5', '888005529563', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('116', 'PUDJI ARTININGSIH', '1', 'BDOC104871710916', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('117', 'NOVYA EKAWATI', '5', '888005529564', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('118', 'ENI ANGGRAENI ', '5', '888005533547', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('119', 'RINA MARIANA', '1', 'BDOC104871699716', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('120', 'OCTAVINA ', '5', '888005533626', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('121', 'RIZKIA', '5', '888005529554', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('122', 'ADE IRMA KUSMARA', '1', 'BDOC104871701116', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('123', 'HERTIK SUHERTIK', '1', 'BDOC104871689916', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('124', 'SRI MULYANI ', '5', '888005533553', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('125', 'DR. ANIK YURINDA', '5', '888005529555', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('126', 'DEASY S', '5', '888005529560', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('127', 'WARUNG NUSANTARA', '1', 'BDOC104871630916', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('128', 'HIKMAWARI SKM ', '5', '888005533577', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('129', 'ITUT WIDIYASTUTI', '5', '888005529583', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('130', 'YUNI AMBARWATI ', '5', '888005533687', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('131', 'TRI NOVIKASARI', '1', 'BDOC104871660316', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('132', 'RUUSTAMADJI', '5', '888005529578', 'TERKIRIM', null, '2016-05-03', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('133', 'NURMA ZAYA CHURIHIN ', '5', '888005533550', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('134', 'RISNA HAKIM', '1', 'BDOC104871650516', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('135', 'BUNDA HANA', '1', 'BDOC104871640716', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('136', 'LEONORA ', '5', '888005533552', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('137', ' FITRI MAISARAH', '1', 'BDOC104871670116', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('138', 'ETNO YUNITA S ', '5', '888005533555', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('139', 'BPK. H. IMRON ROSADI', '1', 'BDOC104871611316', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('140', 'LISTIAWATI ', '5', '888005533554', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('141', 'INDRI MASNIAH', '1', 'BDOC104871590116', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('142', 'MIONA SETIANA ', '5', '888005533574', 'TERKIRIM', null, '2016-05-02', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('143', 'BIN ABDILLAH', '1', 'BDOC104871560716', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('144', 'PALUPI', '1', 'BDOC104871541116', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('145', 'DEWI EVALIANTI', '1', 'BDOC104871531316', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('146', 'ROSIDAH', '1', 'BDOC104871501916', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('147', 'DINDA AULIA', '1', 'BDOC104871490516', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('148', 'ELIYAWATI', '1', 'BDOC104871431716', 'TERKIRIM', null, '2016-05-01', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('149', 'EVA YUSMANTY ', '1', 'BDOC104874997616', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('150', 'MIEDA ', '3', '14814161772', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('151', 'AMBARWATI ', '3', '14814161785', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('152', 'DESI NATARIANTI', '5', '888005545747', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('153', 'SETYANING RAHAYU', '5', '888005545746', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('154', 'NOVITA HARAHAP', '3', '14814161798', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('155', 'MAMA ALDINO', '5', '888005545745', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('156', 'RINAWATI TOKO DHINI ', '3', '14814161805', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('157', 'TERA SUHAIRIAH', '5', '888005545744', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('158', 'DEWA ', '5', '888005529695', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('159', 'DWI PUTRI MIFTAHUS SA\'ADAH', '5', '888005545743', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('160', 'KURNIA SARI ', '5', '888005545755', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('161', ' TOKO YULI PALOM ', '5', '888005529644', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('162', 'BU ABDUH', '5', '888005545754', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('163', 'YUNIARSIH ', '5', '888005529646', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('164', 'ANGRAINI', '5', '888005545753', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('165', 'SRI BUDI RAHAYU ', '5', '888005529645', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('166', 'WAHYUNI SAID', '1', 'BDOC104880471016', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('167', ' SELLY ', '5', '888005529701', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('168', 'TRI NUR', '1', 'BDOC104880451416', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('169', ' IBU DINA SUSANTI ', '5', '888005529700', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('170', 'DYNA RIZQYANA', '5', '888005545752', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('171', 'NIA ASDIANA', '1', 'BDOC104880441616', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('172', ' DEWI SITTAH ', '5', '888005529437', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('173', 'SITI ULWIYAH MUNASIFAH', '5', '888005545751', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('174', 'NURHAKIM', '1', 'BDOC1048800431816', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('175', ' ERNI ', '5', '888005529438', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('176', 'ERNI IRAWATI', '5', '888005545750', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('177', 'BUNDA KAMILA', '1', 'BDOC104880422016', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('178', 'NIKO PLAMELA ', '5', '888005529435', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('179', 'DEWI YUNITA', '5', '888005545749', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('180', 'PRILIA LESTARI', '5', '888005533727', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('181', 'NENENG HARYANI/FITRI', '5', '888005545748', 'TERKIRIM', null, '2016-05-07', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('182', 'NENI HARIYANTI ', '5', '888005529436', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('183', 'NUR ROHATI', '5', '888005533728', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('184', 'TRI RIA SUSANTI', '5', '888005529434', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('185', 'RATNA JUWITA', '5', '888005533729', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('186', 'NAMIT NAMUNG ', '5', '888005529433', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('187', 'UMY LIA', '5', '888005533730', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('188', 'DEVI SILVA ', '5', '888005529432', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('189', 'LILIS/SITI KOMARIAH', '5', '888005533731', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('190', 'AI SUSILAWATI ', '5', '888005529682', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('191', 'TITI SUTRISNI', '5', '888005533732', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('192', 'MAMA ALDINO ', '5', '888005529567', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('193', 'TOKO YULI PALOM', '5', '888005533733', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('194', 'DYRA RIZQYANA', '5', '888005533734', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('195', 'SITI MALIHATUN', '5', '888005533726', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('196', 'RIANDA RIVIYUSNITA', '5', '888005533725', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('197', 'RETNO YUNITA SARI', '5', '888005545729', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('198', 'MASANIH ', '5', '888005545730', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('199', 'NOVI HANDAYANI', '5', '888005545731', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('200', 'ELOK RIDANING ', '5', '888005545732', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('201', 'IWAN STIKER', '1', 'BDOV806370702816', 'TERKIRIM', null, '2016-05-09', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('202', 'NITA ZUBAEDAH ', '5', '888005545733', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('203', 'HASMIATI', '3', '14814162866', 'TERKIRIM', null, '2016-05-09', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('204', 'LIA AHSANUN ISWATI ', '5', ' 888005545734', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('205', 'AGUS SINTA WAHYUNI ', '5', ' 888005545736', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('206', ' ANI H YAKUP ', '5', '888005529676', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('207', 'SRI BUDI RAHAYU ', '5', ' 888005545737l', 'TERKIRIM', null, '2016-05-05', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('208', 'NURHASANAH ', '5', '888005529680', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('209', 'ERNA KURNIAWATY ', '5', '888005529694', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('210', ' M. EDI JUNAEDI ', '5', '888005529692', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('211', 'BU DINA/PAK BUYUNG ', '5', '888005529679', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('212', 'YUNIARSIH ', '5', '888005529698', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('213', 'NURHASANAH ', '5', '888005529696', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('214', 'ARKHANA ZAKY ', '5', '888005529693', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('215', 'DEWI YULIZA ', '5', '888005529699', 'TERKIRIM', null, '2016-05-04', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('216', 'DWI PUTRI M. S', '5', '888005547409', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('217', 'YIYI KHOTIMAH', '5', '888005547402', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('218', 'SITTI HARDIANTY', '5', '888005547393', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('219', 'RISKA YULIANTI', '5', '888005547400', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('220', 'M EDI JUNAEDI', '5', '888005547399', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('221', 'DEWI YUNITA', '5', '888005547398', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('222', 'DWI FINI', '5', '888005547397', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('223', 'FEBRINA / NINA', '5', '888005547396', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('224', 'DEWA', '5', '888005547395', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('225', 'NITA RIYANDINI', '5', '888005547401', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('226', 'MAYA SORAYA', '5', '888005547408', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('227', 'SRI BUDI RAHAYU', '5', '888005547407', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('228', 'YUYUN TRI WAHYUNI', '5', '888005547406', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('229', 'YULIANA AHYAR', '5', '888005547405', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('230', 'RATNA SARI', '5', '888005547404', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('231', 'MAMAH FAKHRIE', '5', '888005547403', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('232', 'IIS WILI WILDAN ', '5', '888005547414', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('233', 'SEPTI SETYANINGRUM', '5', '888005547413', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('234', 'FATMI ', '3', '14814164200', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('235', 'BAPAK ROANTA', '5', '888005547412', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('236', 'AMBARWATI ', '3', '14814164213', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('237', 'SITI AMINATUZUHRIYAH', '5', '888005547411', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('238', 'ROSMINI YUSUF ', '3', '14814164226', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('239', 'WAWAN MACHINING', '5', '888005547418', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('240', 'NUR CHAFLATUL NGAENI', '5', '888005547417', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('241', 'ERNOVIA ', '3', '14814164239', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('242', 'DEWI YUNITA ', '1', 'BDOC104885768516', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('243', 'LEONORA', '5', '888005547416', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('244', 'WIDYA FAHLEVI', '5', '888005553161', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('245', 'MHIA HJ LIA ', '1', 'BDOC104885748916', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('246', 'FARIDA WIDAYATI', '5', '888005547454', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('247', 'MASAENAH', '5', '888005547453', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('248', 'EEN MULIANI', '5', '888005547410', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('249', 'LIA DAHLIA', '5', '888005547447', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('250', 'HERMI SISMAWATI ', '5', ' 888005553197', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('251', 'WIDA', '5', '888005547448', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('252', 'SAFRIDA ', '5', ' 888005553198', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('253', 'IBU DINA SUSANTI', '5', '888005547450', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('254', 'TUTI ISMAYANTI ', '5', ' 888005553191', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('255', 'IRMA NURMALA', '5', '888005547437', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('256', 'RAFIUDDIN ', '5', ' 888005553192', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('257', 'DEWI MAILANINGSIH', '5', '888005547451', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('258', 'YUNI CHANDRA ', '5', ' 888005553193', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('259', 'IBU YUNITA ', '5', ' 888005553194', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('260', 'RIZAL INOOR', '1', 'BDOV806359499916', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('261', 'KHOMSATUN ', '5', ' 888005553187', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('262', 'ANGGIA MURNI', '1', 'BDOV806359341316', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('263', 'SEPTI SURYANITA ', '5', ' 888005553188', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('264', 'TATIK M / BP. JIYONO', '1', 'BDOV806359530716', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('265', 'ANI H, H,YAKUP ', '5', ' 888005553189', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('266', 'HASNAENI SYUKUR', '1', 'BDOV806359620516', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('267', 'YULI IRAWATI ', '5', ' 888005553190', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('268', 'TUTI ISMAYANTI', '1', 'BDOV806359640116', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('269', 'CIPTA NUR FADILAH ', '5', ' 888005553217', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('270', 'HERTIK SUHERTIKA', '1', 'BDOV806359380516', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('271', 'FANY ANISA ', '5', ' 888005553218', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('272', 'NOVI MULYAWATI', '1', 'BDOV806359411516', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('273', 'AZIES BAUW ', '5', ' 888005553219', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('274', 'EVA LESTARI LARASATI', '1', 'BDOV806359470316', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('275', ' ULFA MARIANA ', '5', ' 888005553220', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('276', 'HIKMAH NURMAYANTI', '1', 'BDOV806359599516', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('277', 'KIKI AMALIA ', '5', '  888005553213', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('278', 'RETNO SETIANINGSIH', '1', 'BDOV806359550316', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('279', 'ERNA KURNIAWATY ', '5', ' 888005553214', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('280', 'GALIH ARDHIKANSIH', '1', 'BDOV806336372016', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('281', ' YENNI', '5', ' 888005553215', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('282', 'DWI KARSIWI PENI', '1', 'BDOV806336352416', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('283', 'TERA SUHAIRIAH ', '5', ' 888005553216', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('284', 'DWI ASTUTI', '1', 'BDOV806336481416', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('285', 'WORO ', '5', ' 888005553211', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('286', 'NURHASANAH', '1', 'BDOV806336461816', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('287', 'FATMI', '1', 'BDOV806336432416', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('288', 'RINA', '5', '888005553212', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('289', 'RATNA IRMAYANTI', '1', 'BDOV806336323016', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('290', 'TEMIE', '1', 'BDOV806336303416', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('291', 'NURHASANAH ', '5', ' 888005553207', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('292', 'YUNIARSIH ', '5', ' 888005553208', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('293', 'RIYANTO / RIKA', '1', 'BDOV806336292016', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('294', 'RENDRA SAPUTRA ', '5', ' 888005553209', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('295', 'EKA APRILIA SULISTIANI', '1', 'BDOV806336282216', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('296', 'LINA', '1', 'BDOV806336272416', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('297', 'EKA APRILIA ', '5', ' 888005553210', ' 888005553210', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('298', 'WIWIT', '1', 'BDOV806336182616', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('299', 'ARMILA / NURAINA ', '5', ' 888005545572', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('300', 'HIKMAWATI SKM ', '5', ' 888005545570', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('301', 'FERA PRAMAYANTI', '1', 'BDOV806336153216', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('302', 'ADE / SUMARTINAH ', '1', 'BDOV6335612316', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('303', ' NURHAKIM ', '5', ' 888005545578', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('304', 'INDRI MASNIAH', '1', 'BDOC104888917816', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('305', 'TATIK M / BP JIYONO', '1', 'BDOC104888896616', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('306', 'ISFANDIARY DIAH ', '5', ' 888005553196', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('307', 'IMA TANIA ', '5', ' 888005553202', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('308', 'DEWI YUNITA', '1', 'BDOV806330364016', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('309', 'ANGGIA MURNI', '1', 'BDOV806330354216', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('310', 'ANGGIA MURNI ', '1', 'BDOV806393570916', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('311', 'WULAN ', '5', ' 888005553195', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('312', 'EVA INDRAWANA', '1', 'BDOV806330334616', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('313', 'LIQNA SUNDARI ', '3', '14814165310', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('314', 'ANNISA FITRIANI ', '5', ' 888005553201', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('315', 'YOSIANI MISKIAH', '1', 'BDOV806330373816', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('316', 'LISTIAWATI ', '5', ' 888005553200', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('317', 'NOVITA MERIYANTI ', '3', '14814165323', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('318', 'MITA EKA JAYA', '1', 'BDOV806330315016', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('319', 'SUSI NOFIARNI', '1', 'BDOV806330293816', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('320', 'UMI ANGGUN ', '5', ' 888005553199', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('321', 'IDA/DANI ABDULHADI', '1', 'BDOV806330274216', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('322', 'BUDI SRIYONO', '1', 'BDOV806330264416', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('323', 'DIAN HERDIANA ', '5', '888005553206', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('324', 'NOVI', '1', 'BDOV806330244816', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('325', 'MIANA SETIANA ', '5', ' 888005545571', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('326', 'YEMMY/SUGIARTO ', '3', '14814165336', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('327', 'IBU DIANA', '1', 'BDOV806330225216', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('328', ' SUHERNA ', '5', ' 888005553205', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('329', 'BPK ASEP BENGKEL', '1', 'BDOV806330205616', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('330', 'KRISMAWATI ', '5', ' 888005553204', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('331', 'ARIYANI', '1', 'BDOV806330184416', 'TERKIRIM', null, '2016-05-11', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('332', 'ARI NURLIYANSYAH ', '3', '14814165349', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('333', 'NAMIRA ', '3', '14814165352', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('334', 'RAMA YANTI ', '5', '888005569327', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('335', ' TRI LESTARI ', '5', '888005569328', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('336', 'SUCI LASMARIANA', '5', ' 888005569329', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('337', 'TINI M AKMAL ', '5', '888005569330', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('338', ' EVI ', '5', '888005569331', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('339', 'AUGUSTINE NURHASANAH ', '5', '888005569332', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('340', 'GESTRI', '1', 'BDO8B00731981116', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('341', 'BUNDA HANA', '1', 'BDO8B00733591916', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('342', 'LIA AHSANUN ', '5', '888005569333', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('343', 'SITI MALIHATUN', '5', '888004448019', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('344', 'AULIA', '5', '888004424089', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('345', 'NUNUK NURYANI ', '5', '888005569334', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('346', 'ERLINA ', '5', ' 888004424090', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('347', 'SRI WAHYUNI', '5', ' 888005569335', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('348', 'SURYATI', '5', '888004448013', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('349', 'DWI KUSRIYANTO', '5', ' 888005569336', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('350', 'DESI IRDIANA ', '5', ' 888004424088', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('351', 'SANIS PRAMITAWATI', '5', '888004448015', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('352', 'IRMA NURMALA ', '5', '888005569337', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('353', ' LAILATUL ', '5', ' 888004424087', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('354', 'NINA HERLINA', '5', '888004448023', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('355', 'INA PUSPITASARI ', '5', '888005569338', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('356', 'DEWI SANTI/IKA ', '5', ' 888004424094', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('357', 'YUNI CHANDRA', '5', '888004448025', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('358', 'ATTA ', '5', '888005569339', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('359', ' SRI MULIYASIH ', '5', ' 888004424093', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('360', 'NUR HAKIM ', '5', '888004448026', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('361', ' IBU IMAROH ', '5', '888005569340', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('362', 'YUNIARSIH', '5', '888004448020', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('363', 'MUFLIHATUSSYADIAH LILIH ', '5', ' 888004424091', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('364', ' TITIN NURHANENDAH  ', '5', '888005569341', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('365', 'DYAN FATKHUL', '5', '888004448024', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('366', 'SELLA ', '5', ' 888004424092', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('367', 'DINI WULANSARI ', '5', '888004424097', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('368', 'ERNI', '5', '888004448021', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('369', 'OKTA / DEDEH ', '5', ' 888004424096', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('370', 'UMI ANGGUN', '5', '888004448022', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('371', 'AGUSTINA MELINDA ', '5', ' 888004424095', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('372', 'AGUSTINA MELINDA ', '5', ' 888004424095', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('373', 'DEWI PRISILIA', '5', ' 888004424102', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('374', 'NURGALISA', '1', 'BDO8B00732015816', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('375', ' DINA PUSPANINGSIH ', '5', ' 888004424101', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('376', ' WULAN FITRIANI ', '5', ' 8880044240100', 'TERKIRIM', null, '2016-05-10', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('377', 'RISNA HAKIM (INA)', '1', 'BDO8B00731990916', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('378', 'SITI RUSIT ', '5', '888005569342', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('380', 'MERYADI PRIYASTI R ', '5', '888005569343', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('381', 'LUSI YULIA HARTINI ', '5', '888005569344', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('382', 'GESTRI', '1', 'BDO8B00731981116', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('383', 'ADELINA DESTI ', '5', '888005569345', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('384', 'AAN DENTJIK', '1', 'BDOC104894180616', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('385', ' HAYANI  ', '5', '888005545776', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('386', 'DWI KRSIWI PENI', '1', 'BDOV806410135416', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('387', 'INDRAWATI', '1', 'BDOV806410145216', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('388', 'AAN DENTJIK ', '1', 'BDOC104894180616', 'TERKIRIM', null, '2016-05-12', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('389', 'RUSMAWATI', '3', '14814166277', 'TERKIRIM', null, '2016-05-16', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('390', 'HJ. IRIANTI ', '5', '888005569391', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('391', 'DINA PUSPANINGSIH', '5', ' 888004424101', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('392', 'ROSIDAH ', '5', '888005569393', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('393', 'WULAN FITRIANI ', '5', ' 8880044240100', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('394', ' IMMA MILLAH ', '5', '888005569392', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('395', ' IRMA SUSILAWATI', '5', ' 888005569394', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('396', 'SITI DWI ARINI (WIWI)', '1', 'BDOC104900632216', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('397', 'IBU SRI MULYA ', '5', '888004424104', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('398', 'WULAN ', '5', '888005569395', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('399', 'RIKA RINATA', '1', 'BDOC104900642016', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('400', 'LISTIAWATI ', '5', ' 888004424099', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('401', 'RANI SUMIATI ', '5', '888005569396', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('402', ' M HENDRI EVRIANSYAH ', '5', ' 8880044240103', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('403', 'WAHYUNI SAID', '1', 'BDOC104900622416', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('404', 'ARFAH HUSNA ', '5', '888005569399', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('405', 'MELYETTI', '1', 'BDOC104900602816', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('406', 'RINA NUROHMASARI ', '5', ' 8880044240098', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('407', 'THURMUDI/YANA', '1', 'BDOC104900612616', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('408', 'PRILIA LESTARI ', '5', ' 8880044240083', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('409', 'HUZAIMA ANAND/A RISQI ', '5', '888005569400', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('410', 'HERTIK SUHERTIKA', '1', 'BDOC104900591416', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('411', 'YANTI SEINA ', '1', ' BDOC104896598216', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('412', 'PUDJI ARTININGSIH', '5', ' 888005569401', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('413', 'SUYITNO ', '1', ' BDOC104896588416', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('414', 'ZAHROTUL AINIYAH', '1', 'BDOC104900581616', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('415', 'ASWATI ', '5', '888005569402', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('416', 'KHOIRUNNISA ', '5', ' BDOC10489678616', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('417', 'HJ YANNI ', '5', '888005569403', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('418', 'SURYA TIRTA DILAGA ', '1', ' BDOC104896568816', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('419', 'EKA DESI SUUSANTI ', '5', '888005569404', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('420', 'AYUP PUTTA ', '1', ' BDOC104896559016', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('421', 'RUSTIKA HANDY', '5', '888004424626', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('422', 'DIAN RIANI ', '5', '888004424608', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('423', 'TRI YANTO', '5', '888004424627', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('424', 'INDRA SURYANI ', '3', ' 14814165881', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('425', 'SALON IIS', '5', '888004424628', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('426', 'MAMA DIFA', '5', ' 888004424607', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('427', 'VIVI', '5', '888004424629', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('428', 'AMMY ', '3', ' 14814165878', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('429', 'SRI BUDI RAHAYU ', '5', '888004424606', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('430', 'ERNOVIA ', '3', ' 14814165852', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('431', 'IIS JARO MAMAT', '5', '888004424630', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('432', ' RERET ', '5', '888004424603', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('433', 'SOLIKIN', '5', '888004424631', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('434', 'DEWI WAHYUNI', '3', ' 14814165865', 'TERKIRIM', null, '2016-05-14', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('435', 'RISA NURMALASARI ', '5', '888004424602', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('436', 'MELVI', '5', '888004424632', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('437', 'LEONORA', '5', '888004424624', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('438', 'ADE EVIYANTI ', '5', '888004424590', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('439', 'NURHASANAH', '5', ' 888004448005', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('440', 'ORIANA', '5', '888004424625', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('441', 'SRI WAHYUNI ', '5', '888004424592', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('442', 'MUCHLISON ', '5', ' 888004448004', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('443', 'PIPIT ', '5', '888004424609', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('444', 'DIAH WORO UNTARI', '5', '888004424653', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('445', ' JAMILA RUBIYANTI ', '5', ' 888004448006', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('446', 'TOKO YULI PALOM', '5', '888004424654', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('447', 'SITI JULAEHA ', '5', ' 888004448007', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('448', 'SITI ULWIYAH ', '5', '888004424610', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('449', 'ATTAR ', '5', ' 888004448001', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('450', 'DEWI YUNITA', '5', '888004424633', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('451', 'ENGGA KURNIAWAN ', '5', ' 888004448451', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('452', 'PUTRI DWI ', '5', '888004424611', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('453', 'INDAH', '5', '888004424647', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('454', 'EKA H GAFFAR ', '5', ' 888004448009', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('455', 'SRI REJEKI', '5', '888004424634', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('456', 'NURBAETI ', '5', '888004424612', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('457', 'HIKMAWATI, SKM ', '5', ' 888004448002', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('458', 'HAOLA PUSPITASARI', '5', '888004424659', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('459', ' DIAN HERDIANA ', '5', ' 888004448008', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('460', 'ANA NURFIATI ', '5', '888004424613', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('461', 'RETNO YUNI MALIANA', '5', '888004424656', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('462', 'ARI WINDIARTI', '5', ' 888004448003', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('463', 'FITRA YELLI ', '5', '888004424614', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('464', 'MARDIAH', '5', '888004424655', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('465', 'ARI NURLANSYAH ', '3', ' 14913797523', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('466', 'DYFA MASFUFAH ', '5', '888004424615', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('467', 'ATIK WAHYUNINGSIH', '5', '888004424658', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('468', 'FATMI ', '3', ' 14813797536', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('469', 'JIHAN MARIA ULFAH', '5', ' 888004424616', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('470', 'TOKO YULI PALOM ', '5', '888004424617', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('471', 'TOKO KAMIL', '5', '888004424660', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('472', 'IBU LEHA ', '1', ' BDO8B00745163316', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('473', 'NURHASANAH ', '5', '888004424618', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('474', 'DWI KARSIWI PENI', '1', 'BDO8B00745173116', 'TERKIRIM', null, '2016-05-19', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('475', 'PRILIA LESTARI', '5', '888004424657', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('476', 'TUTI UMAMAH', '5', ' 888004424619', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('477', 'NOVITA EVA SANTI', '5', '888004424650', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('478', ' YULIS ', '5', '888004424620', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('479', 'NENENG SRIWATI', '5', '888004424651', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('480', 'TUTIK SRI LESTARI ', '5', '888004424622', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('481', 'NURPIKA', '5', '888004424652', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('482', 'LIA', '5', ' 888004424621', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('483', 'MUFAROKHATUN ', '5', '888004424604', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('484', 'WAWAN MACHINING', '5', '888004424640', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('485', 'M. WINDARTO ', '5', '888004424605', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('486', 'ERLINA EVITA SARI', '5', '888004424642', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('487', 'SRI BUDI RAHAYU', '5', '888004424643', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('488', 'NIKO PLAMELA', '5', '888004424644', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('489', 'ELLY/DANNY ', '5', '888005569405', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('490', 'DWI ARYANI', '5', '888004424645', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('491', 'FARKHATUN', '5', '888004424646', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('492', ' ERNA DEA ', '5', '888005569407', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('493', ' IBU DIANA', '5', ' 888005569408', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('494', 'BIDAN MARLINA ', '5', '888005569410', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('495', 'RIKHMA FIRTANI', '5', '888004424649', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('496', 'ANITA JUNI RETNOWATI ', '5', '888005569411', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('497', 'RENI HARIYANI ', '5', '888005569412', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('498', 'NITA', '5', '888004424648', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('499', 'FATHUL HIDAYAT ', '1', 'BDO8B00747521916', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('500', 'SOLIKIN AO ', '5', '888005569413', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('501', 'YOSHI LESTARI', '5', '888004424641', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('502', 'SUSI NOFIARNI', '1', 'BDO8B00747531716', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('503', 'NURHASANAH ', '5', '888005569414', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('504', 'UMMY SABINA VAVI ', '1', ' BDO8B00747541516', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('505', 'DEWI PRISILLIA', '5', '888004424639', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('506', 'SELLY ', '5', '888005569415', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('507', 'ISFANDIARY DIAH', '5', '888004424637', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('508', 'IMA HANANY', '5', ' 888005569416', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('509', 'SALIM ', '1', ' BDOB800747551316', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('510', 'LIN SILFA MILLAH', '5', '888004424638', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('511', 'DILLIANTI', '5', ' 888005569417', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('512', 'I\'AH JUMI\'AH ', '5', ' 888004469564', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('513', 'ASRI MURNIATI', '5', '888004424636', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('514', 'MISNA FAJAR SARI ', '5', '888005569406', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('515', ' NURAISAYAH ', '5', ' 888004469563', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('516', 'MAMAH IZA ', '5', '888005569398', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('517', 'FITRIA S', '5', '888004424635', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('518', 'DEWI SITTAH ', '5', ' 888004469561', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('519', 'FITRIA S', '5', '888004424635', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('520', 'ENELPI SISTI ', '3', '14814167163', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('521', 'DR YENI', '1', 'BDO8B00742552816', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('522', 'M HENDRI EVRIANSYAH ', '5', ' 888004469560', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('523', 'NOVITA M ', '3', '14814167069', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('524', 'NIA ASDIANA', '3', '14814167387', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('525', 'NOVI RAHMIYATI', '3', ' 14814167072', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('526', 'HARYATI DACHLAN', '3', '14814167390', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('527', 'HJ. ERNI MUCHTARDIANI', '5', '888004469559', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('528', 'SUSILA R ', '3', '14814167085', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('529', ' LIA DAHLIA ', '5', ' 888004472092', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('530', ' TRISKA SANJAYATI ', '3', '14814167176', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('531', ' LENI MARLINA ', '5', ' 888004472097', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('532', 'LEKA ELMIA', '3', '14814167407', 'TERKIRIM', null, '2016-05-18', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('533', 'NORHASANAH ', '3', '14814167189', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-27', '2016-07-27');
INSERT INTO `kb_no_resi` VALUES ('534', 'LIA AHSANUN ', '5', ' 888004472093', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('535', 'FATHIYATUL FADIYAH ', '5', ' 888004472098', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('536', 'TOKO KAMIL ', '5', '888004472094', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('537', 'SRI NURYATI ', '5', '888004472099', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('538', 'CITRA PANGESTUTI', '5', '888004472095', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('539', 'YUNI CHANDRA', '5', ' 888004472100', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('540', 'HARIS AYUBA ', '5', ' 888004472096', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('541', ' IMA HANANNY ', '5', ' 888004472101', 'TERKIRIM', null, '2016-05-20', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('542', 'IRA', '5', '888004472176', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('543', 'LIA DAHLIA', '5', '888004472177', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('544', 'EDI SUSANTO', '5', '888004472178', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('545', 'DEWI YUNITA', '5', '888004472179', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('546', 'DINI WULANSARI', '5', '888004472181', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('547', 'RINA (RUKO SUKAPAJA)', '5', '888004472182', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('548', 'OKVIANTI', '5', '888004472183', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('549', 'ZAHRATUL ', '5', '888004472184', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('550', 'JIHAN MARIA ULFA', '5', '888004472185', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('551', 'RISKA YULIANTI', '5', '888004472186', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('552', 'VIVIN RAMADIAN', '5', '888004472187', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('553', 'AJENG', '1', 'BDOV806441154116', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('554', 'ANGGIA MURNI ', '1', ' BDOV806436879616', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('555', 'SELVIANI', '3', '14814168471', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('556', 'YANNI ANGGRAINI', '3', '14814168484', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('557', 'ROSWINARTI', '3', '14814168497', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('558', 'DINI RAHMANITA', '3', '14814168504', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('559', 'FIAH NUR HUDA', '3', '14814168517', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('560', 'YEMMY DAN SUGIARTO', '3', '14814168520', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('561', 'NAMIRA', '3', '14814168533', 'TERKIRIM', null, '2016-05-23', '', '', '0', '0', '0', '0', '65', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('562', ' LISTIAWATI ', '1', '888004472151', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('563', ' NURHASANAH ', '5', ' 888004472148', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('564', 'IDA ', '5', '888004472147', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('565', 'HASNI RAUDAH ', '5', '  888004472146', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('566', 'BPK TAWIL MARIA ULFA ', '5', ' 888004472144', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('567', 'EKO NURCAHYONO ', '5', ' 888004472150', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('568', 'DYNA RIZQYANA ', '5', ' 888004472153', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('569', 'EMA PURNAMAWATI ', '5', ' 888004472155', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('570', 'TRIE LASTRI', '5', '888004472154', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('571', 'RIRIN ASHIANTO', '5', '888004472156', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('572', 'SUSILOWATI ', '5', ' 888004472157', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('573', 'MAYA PUSPITA', '5', '888004472158', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('574', 'SRI JUNIARSIH', '5', '888004472145', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('575', 'SHANTY NUROHMAN', '5', '888004472152', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('576', 'M ROFIK/BPK LAMPU', '5', '888004472164', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('577', 'KIKI AMALIA ', '5', ' 888004472149', 'TERKIRIM', null, '2016-05-21', '', '', '0', '0', '0', '0', '63', '2016-07-27', null);
INSERT INTO `kb_no_resi` VALUES ('578', 'RIRIN ANGGRAENI ', '5', '888004472207', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('579', 'TITIM FATIMAH', '5', ' 888004472213', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('580', 'DWI RAHAYU ', '5', '888004449785', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('581', 'ELI TRI ASTUTI ', '5', '888004449786', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('582', 'DWI RAHAYU ', '5', ' 888004449785', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('583', 'SELLY', '5', ' 888004472217', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('584', 'ELI TRI ASTUTI ', '5', ' 888004449786', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('585', 'NADYA SARI ', '5', '888004449787', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('586', 'SELLY ', '3', ' 888004472217', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('587', 'EUIS SABANAH ', '5', '888004449788', 'TERKIRIM', null, '2016-05-17', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('588', 'NADYA SARI ', '5', ' 888004449787', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('589', 'ALAM ', '5', '888004472215', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('590', 'EUIS SABANAH ', '5', ' 888004449788', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('591', 'ALAM ', '5', ' 888004472215', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('592', 'NURHASANAH ', '5', '888004449789', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('594', 'ZULFA ', '5', '888004449790', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('596', 'LHALA ', '5', '888004472218', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('598', 'DESSY  ', '5', '888004449791', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('599', 'NINING KURNIASIH ', '5', '888004449792', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('600', 'TOKO YULI PALOM', '5', ' 888004427216', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('601', 'YUNI CHANDRA  ', '5', '888004472214', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('602', 'IDA HAMIDAH ', '5', '888004472208 ', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('603', 'HEMA KURNIA ', '5', '888004472212', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('604', ' IRMA NURMALA ', '5', '888004472211', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('605', 'DEWI SITTAH ', '5', '888004472210', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('606', ' MERYADI PRIYASTI ', '5', '888004472209', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('607', 'MIZDA MULYANI ', '5', '888004449796', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('608', 'BUNDA EVIN (VIVI) ', '5', '888004421561', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('609', ' NENI GIAN ', '3', '14814169747', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('610', 'DEWI YULIZA ', '5', '888004449797', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('611', 'SULISTIANINGSIH ', '5', '888004449794', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('612', 'IBU INDHA NOOR ', '1', 'BDOEL00082096016', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('613', 'KHAIRATUN HISAN ', '3', ' 14814169763', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('614', 'SITI MALIHATUN ', '5', '888004449795', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('615', 'ASEP SAEPUDIN ', '3', ' 888004421557', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('616', 'NOVITA M ', '3', '14814169458', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('617', 'LOLLA DESTRIA ', '5', ' 888004421553', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('618', 'BUNDA HANA ', '1', 'BDOEL00079572516', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('619', ' INDRA S  ', '3', '14814169461', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('620', 'HIKMAWATI', '5', ' 888004421559', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '64', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('621', 'FARIDA ', '3', '14814169474', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('622', 'MAYA SARI ', '5', ' 888004421555', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('623', 'NUR LAILATUS SAMSIYAH ', '5', ' 888004421549', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('624', 'NADIA YUSUF ', '5', ' 888004421556', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('625', 'NOVITA EVA SANTI ', '5', '888004421570', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('626', 'NI\'MATUL HUDA ', '5', '  888004421548', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('627', 'HAOLA PUSPITA SARI ', '5', ' 888004421547', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('628', 'PRILIA LESTARI ', '5', ' 888004421551', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('629', ' LIA DAHLIA ', '5', ' 888004421560', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('630', ' LILIK ISMAWATI ', '5', ' 888004421558', 'TERKIRIM', null, '2016-05-25', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('631', 'RISNA HAKIM ', '1', ' BDOEL00084524816', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('632', 'NURUL ISTIQOMAH ', '1', ' BDOEL00084534616', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('633', 'MM. RAIHAN ', '1', ' BDOEL00084493816', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('634', 'AI SUSILAWATI ', '5', ' 888004421568', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('635', 'UMI KHASANAH ', '5', ' 888004421567', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('636', 'IRIANTI ', '5', ' 888004466470', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('637', 'KURNIA PURNAMASARI ', '5', ' 888004421574', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('638', 'ROSMINI YUSUF ', '5', ' 888004421566', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('639', 'TRIE LASTRI ', '5', ' 888004421573', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('640', 'ASMA FARIDA ', '5', ' 888004421572', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('641', 'SITI kHOLISOH ', '5', ' 888004421571', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('642', 'ERNY ', '5', ' 888004421576', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('643', 'YUYUK ANDRIANI  ', '5', ' 888004466477', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('644', 'DEWA ', '5', ' 888004421580', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('645', 'ST NELI ', '5', ' 888004466482', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('646', 'BU DINI ', '5', ' 888004421579', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('647', 'CAHYATI ', '5', '  888004466484', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('648', 'NINING KURNIASIH ', '5', ' 888004466472', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('649', 'INDAH RULLY ', '5', ' 888004421578', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('650', 'IBU HARYATI ', '5', ' 888004466473', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('651', 'MALA ', '5', ' 888004466471', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('652', 'ANDI YUSTAM  ', '5', ' 888004421584', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('653', 'LIA DAHLIA ', '5', ' 888004466468', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('654', 'KARINA ', '5', ' 888004421582', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('655', 'VIVI ', '5', ' 888004466479', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('656', 'SRI BUDI RAHAYU ', '5', ' 888004466478', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('657', 'DEWI YUNITA ', '5', ' 888004421583', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('658', 'IDA HAMIDAH ', '5', ' 888004466480', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('659', 'AGUS TURASYONO ', '5', ' 888004421585', 'TERKIRIM', null, '2016-05-26', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('660', 'SITI NURAINI ', '5', ' 888004428501', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('661', 'RISKA YULIANTI ', '5', ' 888004428502', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('662', 'MERYADI PRIYASTI RAHMA ', '5', ' 888004428506', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('663', 'NOVITA HERLIANI ', '5', ' 888004428505', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('664', 'DWI NURCAHYANTI ', '5', ' 888004428504', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('665', 'DEWI YULIZA ', '5', ' 888004428510', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('666', 'SITI MALIHATUN ', '5', ' 888004428509', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('667', 'TARI ', '5', ' 888004428508', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('668', 'MAMA AZKA ', '5', ' 888004428507', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('669', 'MAMA ESA  ', '5', ' 888004428514', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('670', 'ANTIN PRABOWO ', '5', ' 888004428513', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('671', 'KAYLA ', '5', ' 888004428517', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('672', 'NURAISYAH ', '5', ' 888004428515', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('673', 'RISKA OKTAVIA ', '5', ' 888004466438', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('674', 'ANUGRAH CIPTA ', '5', ' 888004466440', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('675', 'DIAN', '5', ' 888004466442', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('676', 'UMI NAFIZAH SHABRA ', '5', ' 888004466443', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('677', 'NI\'MATUL BADRIYAH ', '5', ' 888004466444', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('678', 'ERNI ', '5', ' 888004466445', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('679', 'IRMA NURMALA ', '5', ' 888004466446', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('680', 'YATI SUMIATI ', '5', ' 888004466447', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('681', 'MAMA IZA ', '5', ' 888004466448', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('682', 'MUCHLISOH ', '5', ' 888004466439', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('683', 'RETHA HESSIE ', '5', ' 888004428512', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('684', 'DEWA ', '5', ' 888004428511', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('685', 'RINI TRIANAWATI ', '5', ' 888004428518', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('686', ' LEONORA ', '5', ' 888004466437', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('687', 'DWI HERNI SURYATI ', '5', ' 888004428503', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('688', ' RINAWATI TOKO DHINI ', '3', ' 14813610452', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('689', 'LINAWATI ', '1', ' BDOEL00082076416', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('690', 'IRAWATI JAMILAH', '5', '888004449842', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('691', 'SARINAH ', '1', ' BDOEL00082086216', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('692', 'EVA DAMAYANTI', '5', '888004449841', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('693', 'ANGGIA MURNI ', '1', 'BDO8B00752671816', 'TERKIRIM', null, '2016-05-27', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('694', 'JIHAN MARIA ULFA', '5', '888004449845', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('695', 'YANTI/MAMA SABRINA', '5', '888004449846', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('696', 'NURHASANAH', '5', '888004449844', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('697', 'I\'AH JUMI\'AH', '5', '888004449843', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('698', 'YUNIARSIH ', '5', ' 888004429992', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('699', 'YUNIARSIH', '5', '888004449850', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('700', ' IKA APRILIA ', '5', '888004429987', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('701', 'EDI KURNIAWAN', '5', '888004449849', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('702', 'MALA ', '5', '888004429976', 'TERKIRIM', null, '2016-05-24', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('703', ' ELY SUKMA LUBIS ', '5', ' 888004429206', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('704', 'WIDYANINGSIH', '5', '888004449848', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('705', 'LINA AGUSTANI ', '3', ' 888004429205', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('706', 'MAYA LISTIANA ', '5', ' 888004429207', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('707', 'M HENDRI EVRIANSYAH', '5', '888004449847', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('708', 'TOKO YULI PALOM', '5', ' 888004429995', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('709', ' IIS ROCHMALIA ', '5', ' 888004429208', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('710', 'SOFIYANI', '5', ' 888004429979', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('711', 'SITI MALIHATUN', '5', '888004449851', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('712', 'TRI WIDIYATI ', '5', ' 888004429209', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('713', 'MUAMMAR KHADAFI ', '5', '888004429981', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('714', 'NIA KUNIATI ', '3', ' 888004429214', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('715', ' IDA HAMIDAH', '5', ' 888004429980', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('716', 'SULISTIANINGSIH ', '5', '888004429994', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('717', 'HENDRI WIBOWO ', '5', '888004429993', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('718', 'TUK FENY / MAMAH DAFFA ', '5', '888004429972', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('719', 'GESLA ALDILLA', '5', '888004449852', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('720', 'IBU RADHIN ', '5', '888004429973', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('721', 'HJ. LILIS  ', '5', '888004429974', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('722', 'IDA HAMIDAH', '5', '888004449853', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('723', 'NENG RIA ', '5', '888004429963', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('724', 'HALIMATUSSA DIYAH', '5', '888004449854', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('725', 'LIA DAHLIA ', '5', ' 888004429215', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('726', 'SUGIARTI ', '5', '888004429970', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('727', 'EKA KUSUMA ', '5', '888004429965', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('728', 'BIDAN OOM ', '5', ' 888004429216', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('729', 'MAIYASTUTI ', '5', '888004429966', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('730', 'SULISTIANINGSIH', '5', ' 888004429217', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('731', 'MAYA SARI ', '5', '888004429999', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('732', ' IMROATUL HASANAH ', '5', ' 888004429210', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('733', ' SANTI PONIX ', '5', '888004430000', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('734', 'ROMLAH DARWIS ', '5', '888004429998', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('735', ' BAPAK DASIRUN', '5', ' 888004429968', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('736', 'ARA MAULANA ', '5', '888004429978', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('737', 'ADELINA DESTI ', '5', '888004429975', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('738', 'LINA AGUSTIANI ', '5', '888004429982', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('739', 'ELMY ', '5', '888004429977', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('740', 'EVA DAMAYANTI ', '5', '888004429971', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('741', 'TRIE LESTARI', '5', ' 888004429996', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('742', 'LIN SILFA MILLAH', '5', ' 888004429969', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('743', 'M. ALI / ETY KURNIASIH ', '5', '888004429967', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('744', 'DINI WULANSARI', '5', ' 888004429964', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('745', 'RINA ARIANINGSIH', '5', ' 888004429997', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('746', 'NADIA', '5', ' 888004429991', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('747', 'YUNIARSIH', '5', ' 888OO4429992', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('748', 'DYNA RIZQYANA', '5', '888004449856', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('749', ' IMROATUL HASANAH ', '5', ' 888004429210', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('750', 'SUPRATMAN', '3', ' 14813611468', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('751', 'HJ. ANDIPAH', '5', '888004449857', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('752', ' JENY ', '5', ' 888004429211', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('753', 'LILIK SRI RAHAYU', '5', '888004449858', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('754', 'SEPTI SELYANINGRUM', '5', '888004449863', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('755', 'YAYAT ROHAYATI ', '5', ' 888004429212', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('756', 'RASDIYANA ', '2', '030034440371', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('757', 'DIAH BUNDA F3', '5', '888004449865', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('758', ' JIHAN MARIA ULFA  ', '5', ' 888004429213', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('759', 'MELLY KUSUMA ', '1', 'BDOV806481104316', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('760', 'H. KODIM & HJ MUENAH', '5', '888004449798', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('761', 'YEMMY / SUGIARTO ', '1', 'BDOV806481073316', 'TERKIRIM', null, '2016-05-31', '', '', '0', '0', '0', '0', '64', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('762', 'INAYAH', '5', '888004449799', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('763', 'ASMA NIDA ', '5', ' 888004429223', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('764', 'SELLY', '5', '888004449800', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('765', 'LISTIAWATI ', '5', ' 88800442924', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('766', 'EKA APRILIA', '5', '888004449801', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('767', 'IBU RATNA ', '5', '  888004429225', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('768', 'SUGIARTI', '5', '888004449840', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('769', 'ENDAH ERNAWATI ', '5', ' 888004429219', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('770', 'LILI NURBAETY', '5', '888004449860', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('771', 'BUDI HERMANTI ', '5', ' 888004429220', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('772', 'LIA DAHLIA', '5', '888004449859', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('773', 'DEWA', '5', '888004449861', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('774', ' INDIA A ', '5', ' 888004429221 ', 'TERKIRIM', null, '2016-05-30', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('775', 'PUTRI AULIA', '5', '888004449868', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('776', 'YENI SYABRINA', '5', '888004449869', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('777', 'YUSMILA ', '5', '888004449870', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('778', 'TOKO YULI PALOM', '5', '888004449871', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('779', 'EKA', '3', '14813610725', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('780', 'IBU RISKA OKTAVIA', '5', '888004449855', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('781', 'IIS UTAMI', '5', '888004449866', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('782', 'DHANUARTI', '5', '888004449867', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('783', 'IDA AFRIANI', '5', '888004449864', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('784', 'ERNI', '5', '888004449862', 'TERKIRIM', null, '2016-05-28', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('785', 'MAMA ESA', '5', '888004404953', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('786', 'ROSA RIKA ', '5', '888004404954', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('787', 'LILI NURBAETY', '5', '888004404955', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('788', 'OKTI ANIS SAFIATI', '5', '888004404956', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('789', 'DYNA RIZQYANA', '5', '888004404961', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('790', 'ARFAH HUSNA ', '5', '888004404987', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('791', 'NIZMAWATY AMRA', '5', '888004404960', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('792', 'RISKA YULIANTI', '5', '888004404959', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('793', 'IBU IMAROH', '5', '888004404958', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('794', 'DESSY', '5', '888004404944', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('795', 'MAMA AZKA', '5', '888004404951', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('796', 'VERA', '5', '888004404948', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('797', 'YAYUK ANDRIANI', '5', '888004404957', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('798', 'SRI NURYATI', '5', '888004404952', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('799', 'INAYAH', '5', '888004404950', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('800', 'DINI WULANSARI', '5', '888004404949', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('801', 'ELNI PURWANINGSIH', '5', '888004404947', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('802', 'LINA LESTARI', '5', '888004404945', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('803', 'TINA RODIAH', '5', '888004404946', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('804', 'DEWI KRIS', '5', '888004404943', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('805', 'HERTIK SUHERTIKA', '5', '888004404942', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('806', 'SITI MALIHATUN', '5', '888006159625', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('807', 'M. HENDRI', '5', '888006159626', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('808', 'M. ABDUL ROZAL', '5', '888006159650', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('809', 'ROSDIANA', '5', '888006159624', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('810', 'WULAN SRI WAHYUNI', '5', '888006159621', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('811', 'ELIS / AMRON', '5', '888004404941', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('812', 'KOKOM KOMARIAH', '5', '888006159622', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('813', 'DEVI EMALIA', '5', '888004404982', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('814', 'MIANA SETIANA', '5', '888006159623', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('815', 'RATNA SAFITRI', '3', '14813611877', 'TERKIRIM', null, '2016-06-01', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('816', 'IMAM SUMANTRI', '5', '888006159646', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('817', 'RANI', '5', '888006159645', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('818', 'ANITA MAYASARI', '5', '888006159647', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('819', 'KAYLA', '5', '888006159649', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('820', 'ARI WIJANARKO', '5', '888006159648', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('821', 'RIA SUMANTRI', '5', '888006159627', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('822', 'LIS DAHLIA', '5', '888006159630', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('823', 'ERNIE HAMDAH', '5', '888006159634', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('824', 'DEWA', '5', '888006159633', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('825', 'AGUS SINTIA', '5', '888006159632', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('826', 'IBU ELA SUSANTI', '5', '888006159631', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('827', 'WA JUJU / NISWA', '5', '888006159629', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('828', 'RITA MUTIARASARI', '5', '888006159628', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('829', 'SUCI FITRI INDRI HERLIANA', '5', '888006159635', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('830', 'HATIJAH', '5', '888006159637', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('831', 'FITRI WAHYUNI', '5', '888006159636', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('832', 'DINIASTI', '5', '888006159638', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('833', 'SITI ZULAIKAH', '5', '888006159641', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('834', 'RIA HARYATI', '5', '888006159640', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('835', 'HIKMAWATI, SKM', '5', '888006159639', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('836', 'YULIANA ', '5', '888006159642', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('837', 'SITI ANISA ', '5', '888006159644', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('838', 'ARA MAULANA / DITA', '5', '888006159643', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('839', 'AZIZAH', '1', 'BDOBO00164175416', 'TERKIRIM', null, '2016-06-02', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('840', 'RISNA', '1', 'BDOC104938688216', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('841', 'DWI KARSIWI', '1', 'BDOC104938678416', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('842', 'SRI MULYA HARTINI', '5', '888006159950', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('843', 'URI KARNAYA', '5', '888006159949', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('844', 'NOLA TILAR', '5', '888006159952', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('845', 'NI\'MATUL HUDA', '5', '888006159942', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('846', 'YUNITA SAFITRI', '5', '888006159940', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('847', 'M CHUDHORY', '5', '888006159948', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('848', 'ZAENUR FARIDAH', '5', '888006159947', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('849', 'NIRMA', '5', '888006159938', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('850', 'SUTIHAT (HENI KURNIA SARI)', '5', '888006159939', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('851', 'DEWI YUNITA', '5', '888006159935', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('852', 'NINING KURNIASIH', '5', '888006159937', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('853', 'MAMA ZAHRA', '5', '888006159934', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('854', 'TAUFIQ HIDAYAT', '5', '888006159933', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('855', 'LISTIAWATI', '5', '888006159932', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('856', 'ARI TRIASTUTI', '5', '888006159931', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('857', 'IRMA NURMALA', '5', '888006159930', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('858', 'NENENG HAERANI', '5', '888006159955', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('859', 'DANUARTI', '5', '888006159946', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('860', 'EKSI UTAMI ', '5', '888006159945', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('861', 'INAYAH', '5', '888006159941', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('862', 'SUNENGSIH', '5', '888006159943', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('863', 'POERNOMO', '5', '888006159944', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('864', 'RUSMAWATI', '3', '14813612416', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('865', 'EVI FATMAWATI', '3', '14813612429', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('866', 'SULISTIANINGSIH', '5', '888006118664', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('867', 'LINA AGUSTIANI', '5', '888006118663', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('868', 'DEWI YULIANI', '5', '888006118665', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('869', 'DESI LAILY', '5', '888006118667', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('870', 'JIHAN MARIA ULFA', '5', '888006159976', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('871', 'TOKO YULI PALOM', '5', '888006159977', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('872', 'FITRIA NATASARI', '5', '888006159979', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('873', 'RISTIKA ARUM', '5', '888006159980', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('874', 'AI SUSILAWATI', '5', '888006118660', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('875', 'RAZKHA LUTSI', '5', '888006118661', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('876', 'BUNDA HATIM ', '5', '888006118662', 'TERKIRIM', null, '2016-06-03', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('877', 'ROBI ', '5', '888006118651', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('878', 'GIAN BABY SHOP', '5', '888006118666', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('879', 'UTIK (BAGIAN KEUANGAN)', '5', '888006118648', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('880', 'RIDHA RIZAL', '5', '888006118652', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('881', 'DEWI LESTARI', '5', '888006118650', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('882', 'LUTHFI (HANACOM)', '5', '888006118649', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('883', 'NAVIZA RIZKY', '5', '888006118654', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('884', 'TUK FENY / MAMAH DAFA', '5', '888006118655', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('885', 'KUSMIHARDI', '5', '888006118657', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('886', 'HIKMAWATI. SKM', '5', '888006118656', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('887', 'SELLY', '5', '888006118659', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('888', 'DINA MIRANA WARDANI', '5', '888006118658', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('889', 'NURHASANAH', '1', 'BDO30038214', 'TERKIRIM', null, '2016-06-04', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('890', 'DEWI KURNIASIH', '5', '888006118637', 'TERKIRIM', null, '2016-06-06', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('891', 'UKA SULKI', '5', '888006118636', 'TERKIRIM', null, '2016-06-06', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('892', 'TARI', '5', '888006118635', 'TERKIRIM', null, '2016-06-06', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('893', 'TOKO YULI PALOM', '5', '888006118634', 'TERKIRIM', null, '2016-06-06', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('894', 'MINTIARTY', '5', '888006118632', 'TERKIRIM', null, '2016-06-06', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('895', 'BPK. KAROJI', '5', '888006118638', 'TERKIRIM', null, '2016-06-06', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('896', 'NIA ASDIANA', '5', '888006118631', 'TERKIRIM', null, '2016-06-06', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('897', 'YUSRIANA FAUZI', '5', '888006118633', 'TERKIRIM', null, '2016-06-06', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('898', 'LINAWATI', '1', 'BDOV806515959916', 'TERKIRIM', null, '2016-06-07', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('899', 'NAMIRA', '3', '14813612854', 'TERKIRIM', null, '2016-06-07', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('900', 'DEWI WAHYUNI', '3', '14813612867', 'TERKIRIM', null, '2016-06-07', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('901', 'RUSMAWATI', '3', '14813612870', 'TERKIRIM', null, '2016-06-07', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('902', 'MS. RISA HARIANI', '5', '888006143070', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('903', 'ERNOVIA', '3', '14813614149', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('904', 'NOVITA HARAHAP', '3', '14813614152', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('905', 'NOVITA M', '3', '14813614136', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('906', 'IMA LAILATUL S', '3', '14813614123', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('907', 'KAMALUDIN', '3', '14813614110', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('908', 'BIDAN SIDARNA', '3', '14813614107', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('909', 'RAHAYU FEBRINA TIRTASARI', '3', '14813614090', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('910', 'NURUL ISTIQOMAH', '1', 'BDOV806538003216', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('911', 'TEMIE', '1', 'BDOV806537998116', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('912', 'OKTI ANIS SAFIATI', '1', 'BDOV806537988316', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('913', 'MAHARANI EKA SARI', '5', '888006143040', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('914', 'SANTI PONIK', '5', '888006143039', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('915', 'MARIYATUN', '5', '888006143038', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('916', 'LILIS FATIMAH', '5', '888006143037', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('917', 'ETIK WIHARYATI', '5', '888006143036', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('918', 'MERZA ABUSRIAGA ', '5', '  888006143472', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('919', 'NURUL HIDAYAH ', '5', ' 888006143473', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('920', 'GERAI BUNDA ', '5', ' 888006143474', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('921', 'IBU INDAH ', '5', ' 888006143427', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('922', ' IBU CUT MUSTABSIROH ', '5', ' 888006143428', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('923', 'ARFAH HUSNA ', '5', ' 888006143240', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('924', 'NURHASANAH  ', '5', ' 888006143241', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('925', ' TOKO YULI PALOM ', '5', ' 888006143242', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('926', 'RINA HERAWATI ', '5', ' 888006143243', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('927', ' ABDUL JALIL  ', '5', ' 888006143244', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('928', 'RIKA ARYANTI ', '5', ' 888006143245', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('929', ' IIS WILI WILDAN ', '5', ' 888006143275', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('930', 'ISNAWATI ', '5', ' 888006143246', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('931', 'DEDI HENDADI ', '5', ' 888006143249', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('932', 'ANA ', '5', ' 888006143248', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('933', 'AI SUSILAWATI ', '5', ' 888006143251', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('934', 'NURHAKIM ', '5', ' 888006143247', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('935', 'SITI SHOLIKAH ', '5', ' 888006143252', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('936', 'MUAMAR ', '5', ' 888006143276', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('937', 'LISA ', '5', ' 888006143254', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('938', 'SRI MARIYATI  ', '5', ' 888006143255', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('939', 'HJ. ERNI MUCHCARDIANI ', '5', ' 888006143256', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('940', 'HAKIMAH/FULAIH ', '5', ' 888006143260', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('941', 'SUCIA FITRI INDRI HERLINA ', '5', ' 888006143250', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('942', 'NUR RACHMAWATI ', '5', ' 888006143274', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('943', 'JUMIATI', '5', ' 888006143273', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('944', 'IBU IMAROH ', '5', ' 888006143271', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('945', 'SRI WAHYUNI ', '5', ' 888006143272', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('946', 'YUNIARSIH ', '5', ' 888006143257', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('947', 'AAP HAERANI ', '5', ' 888006143258', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('948', 'ITA ROSITA ', '5', ' 888006143259', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('949', 'IBU DIANA', '1', ' BDOB00782134016', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('950', 'DADANG  ', '1', 'BDOB00197124916', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', '2016-07-28');
INSERT INTO `kb_no_resi` VALUES ('951', 'DADANG ', '1', ' BDOB00197124916', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('952', 'SARI ', '3', ' 14813613873', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('953', 'YAYAT ROOHAYATI ', '3', ' 14813614587', 'TERKIRIM', null, '2016-06-09', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('954', 'LINA ', '5', '888006151970', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('955', 'SELLY', '5', '888006151965', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('956', 'MERYADI PRIYASTI', '5', '888006151961', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('957', 'BAPAK ASEP ANDRIANA ', '5', ' 888006163696', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('958', 'TOKO YULI PALOM', '5', '888006151969', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('959', 'MAMA BAGAS ', '5', ' 888006163695', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('960', 'SURYATI ', '5', ' 888006163694', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('961', 'LINA AGUSTIANI', '5', '888006151968', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('962', 'WAHYU KURNIANTORO', '5', '888006151955', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('963', 'IFA KURNIAWATI ', '5', ' 888006163705', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('964', 'IRMA NURMALA', '5', '888006151956', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('965', 'SHINTA SITI KHADIJAH ', '5', ' 888006163707', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('966', 'RULIYANTI', '5', '888006151957', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('967', 'YUNIARSIH', '5', '888006151959', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('968', 'BAPAK PAIDI HIDAYAT', '5', '888006151960', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('969', 'SITI ANISA', '5', '888006151954', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('970', 'RATIH', '5', '888006151944', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('971', 'DIENA RUFAIDA', '5', '888006151943', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('972', 'MUTHOHAROH', '5', '888006151942', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('973', 'RISMAWATI', '5', '888006151940', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('974', 'FADHILA', '5', '888006151951', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('975', 'DWI ARYANI', '5', '888006151964', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('976', 'EKA APRILIA SULISTIANI', '5', '888006151963', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('977', 'SITI ZULAIHA', '5', '888006151962', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('978', 'MARIYATUN', '5', '888006151946', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('979', 'NUR IZZAH', '5', '888006151941', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('980', 'RESTY AZIZAH', '5', '888006151958', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('981', 'HJ. FATHIYATUL FADLIYAH', '5', '888006151708', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('982', 'ANGGIE NUJANNAH', '1', 'BDO806554162416', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('983', 'MIEDA', '1', 'BDO8B00784580816', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('984', 'ANITA SARI', '1', 'BDO8B007845561216', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('985', 'YEMMY/ SUGIARTO', '1', 'BDO8B00784541616', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('986', 'HERTIK SUHERTIKA', '1', 'BDO8B00787689516', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('987', 'MA\'ARUF DAUD', '1', 'BDO8B00787700716', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('988', 'YOPIH', '1', 'BDO8B00787720316', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('989', 'IBU ENDAH NOOR', '1', 'BDO8B00787710516', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('990', 'DWI KARSIWI PENI', '1', 'BDO8B00787699316', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('991', 'NURHAKIM', '3', '14813615382', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('992', 'YULIA M SALIM', '3', '14813615288', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('993', 'AINUN NIKMAH', '3', '14813615275', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('994', 'ERNOVIA', '3', '14813615626', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('995', 'INDRAWATI', '3', '14813615639', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('996', 'YANNI ANGGRIANI', '3', '14813615642', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('997', 'RUSTIKA HANDY HAKIM', '5', '888006143055', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('998', 'AZIZAM', '5', '888006143057', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('999', 'RINI MURDOATI', '5', '888006143073', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1000', 'RENITA', '5', '888006143061', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1001', 'DEWI SANIAHl', '5', '888006143034', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1002', 'KUSTYA', '5', '888006143035', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1003', 'RUSMI ANDARWATI', '5', '888006143053', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1004', 'RINI TRIANA WATI', '5', '888006143054', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1005', 'SELLY', '5', '888006143084', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1006', 'ELIS SHOLIKAH', '5', '888006143190', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1007', 'TOKO YULI PALOM', '5', '888006143074', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1008', 'IRMAIRAL', '5', '888006143052', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1009', 'DIDIK KRISDIANTO', '5', '888006143051', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1010', 'NENG RIA NOVITA', '5', '888006143050', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1011', 'DINI WULANASARI', '5', '888006143049', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1012', 'LUSI YULIA HARTINI', '5', '888006143048', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1013', 'JIHAN MARIA ULFAH', '5', '888006143046', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1014', 'YAYASAN ALFAIZAN', '5', '888006143189', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1015', 'YOPIH YUJANAH', '5', '888006143185', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1016', 'SITI MALIHATUN', '5', '888006143066', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1017', 'AHMED ZULFIKAH', '5', '888006143060', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1018', 'INAYAH', '5', '888006143059', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1019', 'RUSTIANINGSIH', '5', '888006143047', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1020', 'EKA', '5', '888006143056', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1021', 'DEASY MAHARDINI', '5', '888006143058', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1022', 'CAHYATI', '5', '888006143045', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1023', 'DEWI YUNITA', '5', '888006143044', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1024', 'SANTI', '5', '888006143043', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1025', 'NY HEPI HASASI', '5', '888006143042', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1026', 'IRMA NURMALA', '5', '888006143041', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1027', 'IBU RADHIN', '5', '888006143075', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1028', 'ISTIQOMAH AZZAHRA', '5', '888006143063', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1029', 'TINA RODIAH', '5', '888006143064', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1030', 'IDA HAMIDAH', '5', '888006143065', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1031', 'LIA AHSANUN', '5', '888006143062', 'TERKIRIM', null, '2016-06-08', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1032', 'DEVI ARISANDI ', '5', ' 888006163706', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1033', 'RIA HARYATININGSIH ', '5', ' 888006163710', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1034', ' IBU DINA SUSANTI (BUNDA AZZAM) ', '5', ' 88006163714', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1035', 'YUNI CHANDRA ', '5', ' 888006163713', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1036', 'HERNA SUCI ', '5', ' 888006163712', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1037', 'HENI KOMALASARI ', '5', ' 888006163709', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1038', 'SITI FAZRIAH ', '5', '  888006163704', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1039', 'MEITA DEWI ', '5', ' 888006163711', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1040', 'SETIANY MARETA DARWATI ', '5', '  888006163700', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1041', 'BETY M ', '5', ' 888006163701', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1042', ' IMAM MUSTAMAL ', '5', ' 888006143235', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1043', 'LUS LUSIANA ', '5', ' 888006143238', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1044', 'IBU IMAROH ', '5', ' 888006163699', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1045', 'BPK DASIRUN ', '5', ' 888006143239', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1046', 'DEWI BUNDA KEMBAR ', '5', ' 888006143231', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1047', 'LIA DAHLIA ', '5', ' 888006143236', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1048', 'WAWAN NOVRIANTO ', '5', ' 888006143237', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1049', 'WATI FAUZI MARHAWI ', '5', '  888006143234', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1050', 'ANIYATI WIJAYA ', '5', ' 888006143233', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1051', 'TOKO YULI PALOM ', '5', ' 888006163697', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1052', 'ANI MAMA FAQIH ', '5', ' 888006143232', 'TERKIRIM', null, '2016-06-10', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1053', ' NOVITA MERIYANTI ', '3', ' 14814342046', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1054', 'NI MATUL BADRIYAH ', '3', ' 14814342059', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1055', 'TATIK/BOWO ', '1', ' BDOBO00210915216', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1056', 'DADANG ', '1', ' BDOBO00210874416', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1057', 'BPK BENDRI ', '1', ' BDOBO00210934816', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1058', 'LIA LESTARI ', '1', ' BDOBO00210964216', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1059', 'SUSAN FEBRIANTINA ', '1', ' 888006163734', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1060', 'BP BUKHORI ', '5', ' 888006163733', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1061', 'KIKI AMELIA ', '5', ' 888006151728', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1062', 'SANI FURNITURE ', '5', ' 888006163735', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1063', 'DEWA ', '5', ' 888006163736', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1064', 'VERA HS ( TOKO SALIRA) ', '5', ' 888006163737', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1065', 'ROSI ', '5', ' 888006163732', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1066', 'SUSILA RAHMAWATI ', '5', ' 888006163731', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1067', 'UMI ENDAH WARNANINGSIH ', '5', ' 888006151953', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1068', 'NURHASANAH', '5', ' 888006163740', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1069', ' RITA LESTARI  ', '5', ' 888006163739', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1070', 'MIA NANDA NAZMI ', '5', ' 888006163738', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1071', 'NURUL FEBRIANA ', '5', ' 888006151733', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1072', 'ANI ERIANI ', '5', '  888006151725', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1073', ' IPAH ', '3', ' 888006151753', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1074', 'TOKO KAMIL ', '5', ' 888006163729', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1075', ' LIA DAHLIA  ', '5', ' 888006163728', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1076', 'LISTIAWATI ', '5', ' 888006163727', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1077', 'IDA HAMIDAH ', '5', ' 888006163726', 'TERKIRIM', null, '2016-06-12', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1078', 'NENENG HAERANI ', '3', ' 888006151719', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1079', 'MALA ', '5', ' 888006163730', 'TERKIRIM', null, '2016-06-13', '', '', '0', '0', '0', '0', '63', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1080', 'GERAI BUNDA ', '5', '888006161539', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1081', 'WIWI ', '5', '888006161558', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1082', 'ANITA YULIANINGSIH', '5', '888006161559', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1083', 'SU\'UDIYAH HASANAH', '5', '888006161560', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1084', 'NURHASANAH', '5', '888006161541', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1085', 'ALYRA SHOP', '5', '888006161512', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1086', 'HERTI FATMAWATI', '5', '888006161513', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1087', 'TRI YULI SAMALA', '5', '888006161514', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1088', 'IRMA NURMALA', '5', '888006161515', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1089', 'ERRYN YUDHA', '5', '888006161516', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1090', 'ANI FITRIYANI', '5', '888006161517', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1091', 'RANTI SUHERTI', '5', '888006161537', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1092', 'TOKO YULI PALOM', '5', '888006163723', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1093', 'NINING ', '5', '888006163724', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1094', 'ANA ', '5', '888006163722', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1095', 'MINUK WIJAYANTI', '5', '888006151966', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1096', 'SRI MULYA HARTINI', '5', '888006161552', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1097', 'ELIS SHOLIKHAH', '5', '888006161551', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1098', 'NUNUNG ASYAR', '5', '888006161554', 'TERKIRIM', null, '2016-06-11', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1099', 'RINI WIDIASTUTIK', '5', '888006151967', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1100', 'IKA YULIANTI', '5', '888006161555', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1101', 'GIAN BABY SHOP', '5', '8880061631557', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1102', 'UMI WILDA', '5', '888006161540', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1103', 'MUFAROKHATUN', '5', '888006151742', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1104', 'UCI', '5', '888006161535', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1105', 'SITI ROIKATUN', '5', '888006161533', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1106', 'SURATI', '5', '888006161532', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1107', 'SYAFIEQAH EL NABILAH', '5', '888006161531', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1108', 'RISA NURMALA SARI', '5', '888006161511', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1109', 'AMINAH', '5', '888006161549', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1110', 'MUCHAMAD NUR CHOLIS', '5', '888006161534', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1111', 'BIDAN EKA MARTINI', '1', 'BDO8B00794053216', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1112', 'RINA MARIYANA', '1', 'BDO8B00794033616', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1113', 'FARDA ARWANI', '1', 'BDO8B00794014016', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1114', 'SRI SURYA NINGSIH', '5', '888006711755', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1115', 'LIA (MAMA ABI)', '1', 'BDO8B00794063016', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1116', 'ARI NURLYANSYAH', '3', '14813616421', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1117', 'NOVITA MERIYANTI', '3', '14813616434', 'TERKIRIM', null, '2016-06-14', '', '', '0', '0', '0', '0', '65', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1118', 'SANISAHURI', '5', '888006711780', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1119', 'YEMMY SUGIARTO', '5', '888006711777', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1120', 'KHOIRUNNISAK', '5', '888006711776', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1121', 'LINA', '5', '888006711775', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1122', 'ENDANG P HAYANI', '5', '888006711774', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1123', 'YANIE/ ARIF SETIAWAN', '5', '888006711764', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1124', 'SELLY', '5', '888006711763', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1125', 'BPK. DASIRUN', '5', '888006711772', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1126', 'NURUL HUDA', '5', '888006711771', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1127', 'DWI SETIYO RAHADI', '5', '888006711770', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1128', 'SITI NUROMSIAH', '5', '888006711742', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1129', 'LEONORA', '5', '888006711781', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1130', 'POPPY LATIFAH', '5', '888006711753', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1131', 'DYNA RYZQIANA', '5', '88800671175', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1132', 'ESTIANI ANDANINGRUM', '5', '888006711757', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1133', 'ANIS SETYOWATI', '5', '888006711758', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1134', 'NUR RACHMAWATI', '5', '888006711759', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1135', 'AHMAD ROZALI & AISYA', '5', '888006711760', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1136', 'BADAMI KHANSADELAIS', '5', '888006711761', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1137', 'NOLA TIAR', '5', '888006711762', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1138', 'RYMA A ISKANDAR', '5', '888006711769', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1139', 'RENITA', '5', '888006711767', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1140', 'ANGGRAENI PUSPA DEWI', '5', '888006711768', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1141', 'JIHAN MARIA ULFAH', '5', '888006711773', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1142', 'YUNIARSIH', '5', '888006711778', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1143', 'DYAH KALYSTA', '5', '888006711782', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1144', 'RIZKI DWI PERMANA', '5', '888006711754', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1145', 'AIDA HANDAYANI', '5', '888006711734', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1146', 'DESSY SUSAN  DASUHA', '5', '888006711733', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1147', 'NING YAQIN', '5', '888006711735', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1148', 'MM RAIHAN', '5', '888006711736', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1149', 'LIA SITI F', '5', '888006711779', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1150', 'NURAENI YUSUF/SUNNY', '5', '888006711765', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1151', 'IRMA SUSILAWATI', '5', '888006711766', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1152', 'ANGGIA MURNI', '1', 'BDOV806586301616', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1153', 'EKA KURNIA SARI ', '3', '14813616765', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1154', 'RUSMAWATI', '3', '14813616778', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1155', 'RAHMAT RIJALUN', '3', '14813616781', 'TERKIRIM', null, '2016-06-15', '', '', '0', '0', '0', '0', '62', '2016-07-28', null);
INSERT INTO `kb_no_resi` VALUES ('1156', 'SRI SURYA NINGSIH ', '5', '888006711755', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1157', 'SANISAHURI ', '5', '888006711780', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1158', 'YEMMY SUGIARTO', '5', ' 888006711777', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1159', 'KHOIRUNNISAK ', '5', '888006711776', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1160', ' LINA ', '5', '888006711775', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1161', ' ENDANG P HAYANI ', '5', '888006711774', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1162', 'YANIE/ ARIF SETIAWAN ', '5', '888006711764', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1163', 'SHANTY AVIV ', '1', ' BDOC104975498916', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1164', 'SELLY ', '5', '888006711763', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1165', 'AZIZAH ', '1', ' BDOC104975489116', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1166', 'BPK. DASIRUN ', '5', '888006711772', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1167', 'HERTIK SUHERTIKA  ', '1', ' BDOC104975688316', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1169', 'ERNA WIYANI ', '1', ' BDOC104975678516', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1173', 'SISKA MUHAMAD ', '1', 'BDOC104975539716', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1175', 'BPK HENDRI ', '1', ' BDOC104975529916', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1176', 'RISSELLI MERUTAMI  ', '5', ' 888006744240', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1178', 'METY AFRIANTI ', '5', ' 888006744146', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1179', 'ELDORISLEN ', '5', ' 888006744130', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1181', 'BOBY HARTANTO ', '5', ' 888006744128', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1183', 'MALA ', '5', ' 888006744132', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1185', 'DIAN OPERATOR ', '5', ' 888006744133', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1187', 'CINDY ', '5', ' 888006744134', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1189', 'ITUT WIDYASTUTI ', '5', ' 888006744125', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1191', ' SARI HERMAWATI', '5', ' 888006744124', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1192', 'MERYADI PRIYASTI RAHMA ', '5', ' 888006744119', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1194', 'DEWI ', '5', ' 888006744122', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1196', 'TESSY IMELDA ', '5', ' 888006744121', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1198', 'BUDI RIYANTI ', '5', ' 888006744123', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1200', 'AJUK HARYANTO ', '5', ' 888006744131', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1202', 'LYDIA AGUSTINA ', '5', ' 888006744127', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1203', 'ROSNAH MPD ', '5', ' 888006744129', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1205', 'MUMUN ', '5', ' 888006744136', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1207', 'SITI MALIHATUN  ', '5', ' 888006744241', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1209', 'BPK AMRULLAH MA ', '5', '888006744151', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1210', 'DIAH BUNDA F3 ', '5', ' 888006744239', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1211', 'KISWANDI (ANIFAH AYU) ', '5', '888006711921', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1212', 'RISKA YULIANTI ', '5', '888006711922', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1213', 'ERNI NURYENI ', '5', ' 888006744236', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1214', 'MUSTIKA INDAH YUNI ', '5', ' 888006744235', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1215', 'ERNY ', '5', ' 888006744238', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1216', 'WASNIATI ', '5', '888006744234', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1217', 'MAYA SARI ', '5', ' 888006744137', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1218', 'KURSIA/MM ALDO ', '5', ' 888006744138', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1219', 'MUFAROKHATUN ', '5', ' 888006744166', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1220', 'NENENG HAERANI ', '5', ' 888006744167', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1221', 'HENIPAH ', '5', '888006711896', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1222', 'SUCI RISTIANTI ', '5', ' 888006744168', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1223', 'OLIF  ', '1', 'BDOC104969378716', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1224', 'FADHILA  ', '5', ' 888006744237', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1225', 'INDRAWATI ', '3', '14813617284', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1226', 'DEWI KARTIKA SARI ', '5', '888006711881', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1227', 'INGGIT PRASETYO ', '1', 'BDOC104969368916', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1228', ' RINA WATI TOKO DHINI ', '3', '14813617255', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1229', 'SUWARTI DAHLIA ', '3', '14813617268', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1230', 'NAMIRA  ', '3', '14813617271', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1231', ' BERLY KURNIAWAN ', '5', '888006771892', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1232', ' IBU IMAROH ', '5', '888006771897', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1233', 'SUDIATI RAHAYU ', '5', '888006771895', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1234', 'KISWANDI (ANIFAH AYU) ', '5', '888006771921', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1235', 'RISKA YULIANTI ', '5', '888006771922', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1236', 'NITA ELMAWATI ', '5', '888006771886', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1237', 'NURUL HIDAYAH BATU BARA  ', '5', '888006771887', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1238', 'NASYARATI ', '5', '888006771926', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1239', 'IDA AFRIANI', '5', '888006744543', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1240', 'UCI', '5', '888006744623', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1241', 'RAHMA YUNITA', '5', '888006744541', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1242', 'TOKO YULI PALOM', '5', '888006744619', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1243', 'NITHA DWI AGUSTIN', '5', '888006744664', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1244', 'NUR ELFIS ', '5', '888006771925', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1245', 'LIA DAHLIA ', '5', '888006771924', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1246', 'ANA ', '5', ' 888006771923', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1247', 'AAN SRI MULYATI', '5', '888006744655', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1248', 'AFNIDA ', '5', '888006771746', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1249', 'ELIN NURMIA ', '5', '888006771910', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1250', 'DEVI SILVIA', '5', '888006744632', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1251', 'DIAN PAHLUPI ', '5', '888006771911', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1252', 'NI\'MATUL HUDA', '5', '888006744653', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1253', 'SUSAN FEBRIANA ', '5', '888006771912', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1254', 'AI SUSILAWATI', '5', '888006744651', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1255', 'ARON PRIHARDI ', '5', '888006771913', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1256', 'YULIA SULIS TRIANINGSIH', '5', '888006744630', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1257', 'DWI PUTRI MIFHATUS SA\'ADAH ', '5', '888006711915', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1258', 'NOVIANTY/DAYAT', '5', '888006744656', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1259', 'ERY SOFIAN  ', '5', '888006711916', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1260', 'NOVI HAERUDIN', '5', '888006744662', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1261', 'DIAN MELAYU ', '5', '888006711917', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1262', 'TOKO ALFA MUSLIM GALLERY', '5', '888006744552', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1263', 'IDA NURASIDA  ', '5', '888006711908', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1264', 'DITA ENGGE', '5', '888006744539', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1265', 'NINING KURNIASIH', '5', '888006744540', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1266', 'YUNIAR FARIDA  ', '5', '888006711906', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1267', 'ROSPITASARI (UPIET)', '5', '888006744628', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1268', 'TOKO ABDI TANI ', '5', '888006711905', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1269', 'HIKMAWATI , SKM ', '5', '888006711903', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1270', 'IKE YUHANA WAHYU', '5', '888006744537', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1271', 'EVA DAMAYANTI ', '5', '888006711902', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1272', 'PIPIT ', '5', '888006744556', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1273', 'ERRY HENDRAWAN ', '5', '888006711901', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1274', 'SISKA ', '5', '888006711899', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1275', 'INTAN SUHARYANI', '5', ' 888006711898', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1276', 'SRI BUDI RAHAYU ', '5', '888006711914', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1277', ' RANI SUMIATI ', '5', '888006711918', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1278', 'KAMSAH  ', '5', '888006711919', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1279', 'LULUK INDAH  ', '5', '888006711920', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1280', 'TOKO YULI PALOM  ', '5', '888006711894', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1281', 'SRI FITRI', '5', '888006744554', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1282', 'YUNI CHANDRA ', '5', '888006711891', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1283', 'ENI RATNA', '5', '888006744551', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1284', ' IRMA NURMALA ', '5', ' 888006711893', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1285', 'TOKO KAMIL', '5', '888006744555', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1286', 'DIAN ESA SARI ', '5', '888006711900', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1287', 'MRS. IRA  ', '5', '888006161705', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1288', ' INDAH ', '5', ' 888006744150', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1289', 'IRMA NURMALA', '5', '888006744549', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1290', 'SRI BUDI RAHAYU ', '5', ' 888006744232', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1291', 'IKA LAILI RAHMAWATI ', '1', 'BDOC104971769516', 'TERKIRIM', null, '2016-06-16', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1292', 'SANTI ', '5', ' 888006744135', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1293', 'IBU INDAH', '5', '888006744671', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1294', 'ARIYANI ', '5', ' 888006744148', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1295', 'SITI KOMALAWATI', '5', '888006744620', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1296', 'HERNA SUCI ', '5', ' 888006744145', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1297', 'MAMAH ANGGUN', '5', '888006744553', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1298', 'RASDIYANA  ', '5', '888006744859', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1299', 'RINA AFITSARI ', '5', ' 888006744169', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1300', 'ROHILAH ', '5', '888006744860', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1301', 'HAERIYAH/RIA', '5', '888006744545', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1302', 'IBU ASIH ', '5', ' 888006744139', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1303', 'MERY NISA ', '5', '888006744648', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1304', 'KIKI', '5', '888006744547', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1305', 'SURYATI ', '5', ' 888006744140', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1306', 'ERNA WIYANI  ', '5', '888006674751', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1307', ' ILAH NURFARODA ', '5', ' 888006744142', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1308', 'IBU INDAH  ', '5', '888006674750', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1309', 'SITI IMAS MASIROH ', '5', ' 888006744242', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1310', ' EVI ', '5', '888006744883', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1311', 'PURWANTO', '5', ' 888006744884', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1312', 'NOVI HANDAYANI', '5', '888006744141', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1313', 'NIMAS WULIANI ', '5', '888006744881', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1314', 'DEVI SILVIA ', '5', '888006744880', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1315', 'BAPAK KISTO ', '5', '888006744878', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1316', 'RITA LESTARI', '5', '888006744550', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1317', 'DINA PUSPANINGSIH ', '5', '888006744876', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1318', 'MAYA', '5', ' 888006744144', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1319', 'SITI JULAEHA', '5', '888006744544', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1320', 'WATI FAUZI MAWHAWI ', '5', '888006744621', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1321', 'CHURIN IN NABILA ', '5', ' 888006744149', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1322', 'FITROTUL', '5', ' 888006744854', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1323', 'YENI AULYANTI', '5', '888006744538', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1324', 'SAMSIA ', '5', ' 888006744147', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1325', 'RITA ', '5', '888006744647', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1326', 'RESTU AZIZAH', '5', '888006744542', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1327', 'LOLA DESTRIA ', '5', ' 888006744143', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1328', 'SRI MURNI SUJARWATI ', '5', '888006744558', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1329', 'SITI HASNA ULFIAH', '5', '888006744633', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1330', 'RINI KARTIKASARI ', '5', '888006744852', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1331', ' IDA AFRI RAHMAWATI ', '3', ' 14813618612', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1332', 'TARI (MAMA FAIZ)', '5', '888006744557', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1333', 'ENNY ', '5', '888006744888', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1334', 'DIAN SARI ', '3', ' 14813618625', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1335', ' ARFAH HUSNA  ', '5', '888006744885', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1336', 'DEWI INDRI K ', '3', ' 14813618638', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1337', 'AINUN NIKAH ', '3', ' 14813618641', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1338', 'LIA DAHLIA ', '5', ' 888006744855', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1339', 'ANGGRAENI PUSPA DEWI ', '5', '888006744863', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1340', 'NINING NINGRUM ', '5', '888006744548', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1341', 'TOKO YULI PALOM ', '5', ' 888006744652', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1342', 'INA MUTHMAINAH (BP H. DEDI MUDJEDI)', '5', '888006744546', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1343', 'IKA LAILI RAHMAWATI ', '5', ' 888006674722', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1344', 'SETTY  ', '5', '888006744649', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1345', 'YAYAN INDRAYANI', '5', '888006744645', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1346', 'LISA SARITA PURWATI ', '5', '888006744627', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1347', 'IDA HAMIDA ', '5', ' 888006674947', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1348', 'BERLY ', '5', '888006744631', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1349', 'SITI NUROMSIH ', '5', ' 888006674963', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1350', 'SITI MELIANI', '5', '888006744629', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1351', 'RANTI SUHERTI ', '5', '888006744624', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1352', 'SANTI HARIYANTO ', '5', ' 888006680237', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1353', 'IRMA RAHMAWATI', '5', '888006744626', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1354', 'SITI ROIKATUN ', '5', ' 888006680205', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1355', 'LISTIAWATI', '5', '888006744625', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1356', 'RINA WATI ', '5', ' 888006680215', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1357', 'IBU DINI MEILANIW', '5', '888006744614', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1358', 'SITI ZUHRIYAH  ', '5', '888006744891', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1359', 'NINA  ', '5', '888006744882', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1360', 'DINI WULANSARI ', '5', '888006744879', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1361', 'YANI/ARIF SETIAWAN', '5', '888006744617', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1362', 'UMI ROMAYATI ', '5', '888006744875', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1363', 'BUDI HERMANTO', '5', '888006744615', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1364', 'KURNIA PRIYANTI ', '5', '888006744886', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1365', 'HERMAWATI', '5', '888006744618', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1366', ' DIAH SABTUTI ', '5', '888006744887', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1367', 'NY ZONA', '5', '888006744568', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1368', 'IMAM ASHARI ', '5', '888006744889', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1369', 'DEWI', '5', '888006680198', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1370', 'HABIBAH', '5', '888006744612', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1371', 'MUHAMMAD SHOLIHIN ', '5', '888006744644', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1372', 'KHOIRUNISAK ', '5', ' 888006674954', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1373', 'IDHA KURNIAWATI ', '5', '888006744646', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1374', 'SUMILAH  ', '5', '888006744658 1KG', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1375', 'YUNIARSIH ', '5', ' 888006680098', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1376', 'ELIN NURMIA  ', '5', '888006744659', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1377', 'EVA SUSANTI ', '5', ' 888006674958', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1378', ' IDA HAMIDAH ', '5', ' 888006744890', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1379', 'ITA ROSTATI ', '5', ' 888006744894', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1380', 'M ABDUL ROZAK ', '5', ' 888006674749', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1381', 'RITIN ESTINA ', '5', ' 888006674959', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1382', 'ASMAWATI S MUSA ', '1', 'BDOV806609091316', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1383', ' JUNARA ', '5', ' 888006674957', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1384', 'DIAN HEYANI ', '1', 'BDOV806609112516', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1385', 'ETIKA SORAYA ', '5', ' 888006674961', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1386', 'NOVITA M ', '3', '14813619748', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1387', 'ANISA FAJARANI', '5', '888006744611', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1388', 'ELI SUNIAH ', '5', ' 888006674956', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1389', 'INDRAWATI ', '3', '14813619751', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1390', 'SOFIA ', '5', ' 888006674949', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1391', 'LAILA NURHASANAH', '5', '888006744636', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1392', 'THURMUDI/YANAKAWI ', '5', ' 888006674948', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1393', 'ANIS SETYOWATI', '5', '888006744641', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1394', 'BPK H IMRON ', '5', ' 888006674951', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1395', 'IRMA BUNDA ZAHRA', '5', '888006744639', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1396', 'ERMA KURMILAWATI ', '5', ' 888006674953', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1397', 'NURHASANAH', '5', '888006744613', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1398', 'GIAN BABYSHOP', '5', '888006744637', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1399', ' BUNDA LUSI ', '5', ' 888006674945', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1400', 'EVI SITI SOFIAH', '5', '888006744667', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1401', 'ZUHRATUL WARDIANI ', '5', ' 888006674943', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1402', 'RATNA MUSTIKA SARI', '5', '888006744634', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1403', 'RILA PRABEKTI ', '5', ' 888006674942', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1404', 'RAHAYU CANDRAA', '5', '888006744635', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1405', 'PRADA HISBULLOH ALI ', '5', ' 888006674946', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1406', ' IBU KARSIYONO ', '5', ' 888006674944', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1407', 'INDRI HASTUTI/JOKO WINARNO', '5', '888006744657', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1408', 'NURAISYAH ', '5', ' 888006680214', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1409', 'FRIASWARI', '5', '888006744654', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1410', 'FRIASWARI', '5', '888006744654', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1411', 'DR FARADILLA ATAMIMI ', '5', ' 888006680203', 'TERKIRIM', null, '2016-06-18', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1412', 'UNE ', '5', ' 888006680204', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1413', 'DYAH', '5', '888006744616', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1414', 'DIAN ISTIARTI ', '5', ' 888006680206', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1415', 'BAITUL KHUMAEZIAH', '5', '888006744643', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1416', 'HJ FAHIYATUL ', '5', ' 888006680207', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1417', 'URI KARNAYA ', '3', '14813619764', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1418', 'SUNARTI/BASE CAMP GSDI', '5', '888006744622', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1419', 'DIAN NAHRYAH ', '5', '  888006680201', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1420', 'BIDAN EKA MARTINI ', '1', 'BDOC104980689616', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1421', 'ROSMINI YUSUF ', '5', ' 888006680196', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1422', 'RENY RETNO WULANDARY', '5', '888006744660', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1423', 'SRIYANTI ', '5', ' 888006680195', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1424', 'HERLINDA', '5', '888006744642', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1425', 'TASNING HENI', '5', ' 888006680193', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1426', 'TATIK KARYA RAHAYU ', '5', ' 888006680194', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1427', 'GESTY PUSPITA SARI', '5', '888006744650', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1428', 'WULAN CHANDRA', '5', '888006744638', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1429', 'FITRI WAHYUNI ', '5', ' 888006680192', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1430', 'RIRIN ANDRIANI', '5', '888006744559', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1431', 'SRI HANDAYANI ', '5', ' 888006680190', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1432', 'WINDI (DR SAHARJO)', '5', '888006744560', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1433', 'YULIANA ', '5', ' 888006680239', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1434', 'IDA ISBANDIAH', '1', 'BDOC104978210416', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1435', 'DEWI YUNITA ', '5', ' 888006680213', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1436', 'EKO OKTOVIANTO', '1', 'BDOC104978179616', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1437', 'BRIGADIR NANIK SRI HANDAYANI', '1', 'BDOC104978200616', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1438', 'NUR AMIROHM (IRA)', '1', 'BDOC104978189416', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1439', 'HUSNA RIANI', '3', '14814343747', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1440', 'EKA', '3', '14814343750', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1441', 'SUWARTI DAVILA', '3', '14814343763', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1442', 'NOVITA HARAHAP', '3', '14814343776', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1443', 'ROSDIANA', '3', '14814343789', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1444', 'MALIKATIL BULGIS ', '5', ' 8880066802422', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1445', 'EKA APRILIA SULISTIANI', '5', '888006680423', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1446', 'CEFTI LIA PERMAASARI', '5', '888006680425', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1447', 'NUNING NOVIA', '5', '888006680427', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1448', 'ENDAH RESYANTI', '5', '888006680401', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1449', 'SURYANI SYUKUR', '5', '888006680400', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1450', 'YULI NURHAYAI', '5', '888006680403', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1451', 'LIA DAHLIA', '5', '888006680404', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1452', 'YULIA', '5', '888006680405', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1453', 'EKA NURYANI', '5', '888006680361', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1454', 'NURZANAH DAMANIK', '5', '888006680424', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1455', 'TOKO YULI PALOM', '5', '888006680411', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1456', 'RIRIN EKO PRAMONO', '5', '888006680410', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1457', 'SUSI NOFIARNI', '5', '888006680408', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1458', 'RINA WATI', '5', '888006680409', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1459', 'NAMI NAMUNG', '5', '888006680399', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1460', 'SITI AMINAH', '5', '888006680395', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1461', 'HETTY KUSMIATI', '5', '888006744853', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1462', 'NUNUNG/BP SAELAN', '5', '888006744899', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1463', 'HARTATY HAMDAN', '5', '888006680394', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1464', 'YULIANTI', '5', '888006680197', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1465', 'DIAS SURYANA ARIF', '5', '888006680396', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1466', ' REFA (UMI AQILA) ', '5', '  888006680236', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1467', 'DEWA', '5', '888006680398', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1468', 'ASNAWI/ZAINAB', '5', '888006680397', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1469', 'MAYA SARI', '5', '888006680381', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1470', 'MURNI CELL / YETTY', '5', '888006680380', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1471', 'NURLY/DITA', '5', '888006744873', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1472', 'EKA KURNIA HANORO', '5', '14814180748', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1473', 'ERIYANTI RASYID', '5', '14814180751', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1474', 'INDRAWATI', '5', '14814180764', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1475', 'TRI SUMIAI', '5', '888006680426', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1476', 'RESTU AZIZAH', '5', '888006680366', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1477', 'NENK IFA/BPK IYAN', '5', '888006680428', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1478', 'INTAN SUHARYANTI', '5', '888006680402', 'TERKIRIM', null, '2016-06-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1479', 'SRI MULYA HARTINI ', '5', '888006680202', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1480', 'ERNIE HAMDAH ', '5', ' 888006680200', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1481', 'ANA ', '5', ' 888006744874', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1482', 'YENI AULYANTI ', '5', ' 888006680199', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1483', 'FENI TIRANI ', '5', ' 888006680191', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1484', 'NERLEN', '5', ' 888006674952', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1485', 'ELIS SOLIKAH ', '5', '  888006674950', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1486', 'FEBRII ', '5', ' 888006674955', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1487', 'INDHA NOOR K ', '1', '  BDOC104984002416', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1488', 'BRIPKA MK SEKEDANG ', '3', ' 14814180248', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1489', 'SANI WINSANI ', '5', ' 888006674962', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1490', 'RISMA ', '5', ' 888006680108', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1491', 'RINAWATI ', '5', ' 888006744893', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1492', 'TRI YUSTINI ', '5', ' 888006674965', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1493', 'LILIS FATIMAH ', '5', ' 888006680100', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1494', 'DIAN HERYANI  ', '1', ' BDOC104987359316', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1495', 'HERTIK SUHERTIKA/KANTIN HEGA ', '1', 'BDOC104987339716', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1496', 'LINAH YULIANAH ', '5', ' 888006680239', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1497', 'YULI ', '5', ' 888006186145', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1498', 'YEMMI / SUGIARTO  ', '5', ' 888006186136', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1499', 'EKA APRILIA SULISTIANI', '5', '888006680423', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1500', ' IDA HAMIDAH ', '5', ' 888006186126', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1501', 'TITIS NURULIYAH ', '5', ' 888006186125', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1502', 'AISAH JUMRIANA ', '5', ' 888006186135', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1503', 'MIRA YUNIATI ', '5', ' 888006186137', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1504', 'WORO ', '5', ' 888006186138', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1505', 'ANA MARIANA ', '5', ' 888006186142', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1506', 'RAHAYU CHANDRA ', '5', ' 888006186140', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1507', 'INA MUTHMAINAH ', '5', ' 888006186143', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1508', 'DIAN CAHYARINI', '5', ' 888006186141', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1509', 'CEFTI LIA PERMAASARI', '5', '888006680425', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1510', 'ULIN NI\'MAH ', '5', ' 888006186123', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1511', 'NUNING NOVIA', '5', '888006680427', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1512', 'MAMAH IZZA ( TOKO IZZA) ', '5', '  888006186413', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1513', 'ENDAH RESYANTI', '5', '888006680401', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1514', 'IBU INDAH ', '5', ' 888006186414', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1515', 'IBU INDAH ', '5', ' 888006186414', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1516', 'BU DINA / PAK BUYUNG ', '5', '  888006186415', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1517', 'NITHA DWI AGUSTIN ', '5', ' 888006186416', 'TERKIRIM', null, '2016-06-22', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1518', 'MOH MOHAIMIN ', '5', ' 888006186417', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1519', 'WARNI / KAIMUDIN S.PD ', '5', ' 888006186418', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1520', 'PUJI MARDIANTI ', '5', '  888006186421', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1521', 'DIAH BUNDA ', '5', ' 888006186147', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1522', 'NIRMA ', '5', ' 888006186150', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1523', ' IKA YASIN ', '5', ' 888006186148', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1524', 'NUR HASANAH ', '5', '888006186133', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1525', 'HARYANI ', '5', '888006186149', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1526', 'LEONORA ', '5', ' 888006186151', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1527', 'SARI DWI ANAWATI ', '5', '888006186172', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1528', 'DIAN RIANI ', '5', '888006186411', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1529', 'YATARI ( WIDODO ) ', '5', '888006186412', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1530', 'SURYANI SYUKUR', '5', '888006680400', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1531', 'NURIDA ', '5', ' 888006680429', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1532', 'CHICA ', '5', ' 888006680407', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1533', 'MAIGAWATI ', '5', ' 888006186139', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1534', 'NINING ', '5', ' 888006186146', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1535', 'RIMA YUNITA / SUPRIADI ', '5', '888006186144', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1536', 'RISNA HAKIM ', '1', ' DO8B00824651816', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1537', 'YULI NURHAYAI', '5', '888006680403', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1538', 'ANGGIA MURNI ', '5', ' BDO8B00824632216', 'TERKIRIM', null, '2016-06-24', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1539', 'LIA DAHLIA', '5', '888006680404', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1540', 'YULIA', '5', '888006680405', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1541', ' EKA NURYANI', '5', '888006680361', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1542', 'NURZANAH DAMANIK', '5', '888006680424', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1543', 'TOKO YULI PALOM', '5', '888006680411', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1544', 'RIRIN EKO PRAMONO', '5', '888006680410', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1545', 'NONA ALABA', '3', '14814181436', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1546', 'SUSI NOFIARNI', '5', '888006680408', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1547', 'BAIQ DESI LUTHFIANA', '1', 'BDO8B00828053016', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1548', 'RINA WATI', '5', '888006680409', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1549', 'NAMI NAMUNG', '5', '888006680399', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1550', 'MUHLI', '1', 'BDOC8B00828082416', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1551', 'SITI AMINAH', '5', '888006680395', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1552', 'IBU UCIT', '5', '888006765590', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1553', 'HETTY KUSMIATI', '5', '888006744853', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1554', 'NUNUNG/BP SAELAN', '5', '888006744899', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1555', 'IRMA NURMALA', '5', '888006765578', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1556', 'HARTATY HAMDAN', '5', '888006680394', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1557', 'DIAS SURYANA ARIF', '5', '888006680396', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1558', 'BUNDA AUFA', '5', '888006765584', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1559', 'DEWA', '5', '888006680398', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1560', 'EKA', '5', '888006765588', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1561', 'ASNAWI/ZAINAB', '5', '888006680397', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1562', 'ASIH', '5', '888006765571', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1563', 'MAYA SARI', '5', '888006680381', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1564', 'MURNI CELL / YETTY', '5', '888006680380', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1565', 'TUTY NURFADILLAH', '5', '888006765583', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1566', 'NURLY/DITA', '5', '888006744873', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1567', 'NU\'MATUL B', '5', '888006765579', 'TERKIRIM', null, '2016-06-21', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1568', 'EKA KURNIA HANORO', '3', '14814180748', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1569', 'ANGRAINI', '5', '888006765586', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1570', 'ERIYANTI RASYID', '3', '14814180751', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1571', 'YENNY SABRINA', '5', '888006765934', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1572', 'INDRAWATI', '3', '14814180764', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1573', 'MISNA FAJAR SARI', '5', '888006765617', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1574', 'TRI SUMIAI', '5', '888006680426', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1575', 'RESTU AZIZAH', '5', '888006680366', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1576', 'LISA SARITA', '5', '888006765580', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1577', 'NENK IFA/BPK IYAN', '5', '888006680428', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1578', 'TOSSAMIHARJA', '5', '888006765594', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1579', 'ASIAH ', '5', '888006712619', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1580', 'INTAN SUHARYANTI', '5', '888006680402', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1581', 'JUHARO SIREGAR ', '5', '888006712620', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1582', 'MINING', '5', '888006765595', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1583', ' LYDIA AGUSTINA ', '5', '888006712649', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1584', 'MOM ALIN', '5', '888006765591', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1585', 'IKA YASIN ', '5', '888006712623', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1586', 'ISMAIL YULIANTI', '5', '888006765593', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1587', 'URIP S', '5', '888006765575', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1588', 'TOKO YULI PALOM', '5', '888006765582', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1589', 'NOVITA ', '5', '888006712650', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1590', 'SUSILA RAHMAWATI (UCI)', '5', '888006764641', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1591', 'NURHAKIM ', '5', ' 888006186131', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1592', 'LINA', '5', '888006765596', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1593', 'ZULFA ', '5', ' 888006712137', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1594', 'IMAS ST.M ', '5', '888006712657', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1595', 'NURHASANAH', '5', '888006764640', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1596', 'SYAKIRA DAUS ', '5', ' 888006712138', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1597', 'DWI IDA LESTARI ', '5', '888006712642', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1598', 'IAND TONGKO', '5', '888006765585', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1599', 'YEMMY SUGIARTO', '5', '888006764639', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1600', 'ATIK WAHYUNINGSIH ', '5', ' 888006712139', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1601', ' HIKMAWATI SKM ', '5', '888006712661', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1602', 'FITRI DELVITA Y BUN', '5', '888006764556', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1603', 'DEWI KUNINGAR ', '5', ' 888006712140', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1604', 'CIPTA NUR FADHILLAH ', '5', '888006712630', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1605', 'AFIFAH', '5', '888006764566', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1606', 'LEYLIE SANJAYA ', '5', ' 888006712141', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1607', ' NUR RACHMAWATI (INUNG) ', '5', '888006712648', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1608', 'RITA MUTIARA SARI  ', '5', ' 888006712142', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1609', 'MUMUN', '5', '888006765587', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1610', ' ENDAH ROSYANTI', '5', ' 888006712651', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1611', 'YOSHI LESTARI ', '5', ' 888006712143', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1612', 'ESA MULYAWATI', '5', '888006765570', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1613', 'EVA ZALHA', '5', '888006764564', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1614', 'NINA S ', '5', '888006712662', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1615', 'MAYA ', '5', ' 888006712144', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1616', 'ETIKA SORAYA', '5', '888006765572', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1617', 'IBU IMAS', '5', '888006764563', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1618', 'NUNING NOVIA ', '5', ' 888006712145', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1619', 'ITA ROSTATI', '5', ' 888006712644', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1620', 'FERDIANA', '5', '888006765569', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1621', 'MBK ANIS/AJIES  PHONE CELL', '5', '888006764562', 'TERKIRIM', null, '2016-06-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1622', 'INKE NOVITA ', '5', ' 888006712146', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1623', 'HASNIDAR ', '5', '888006712660', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1624', 'NIA KURNIASIH', '5', '888006765610', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1625', ' WIDYA ', '5', ' 888006712147', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1626', 'SOLIKIN HO', '5', '888006764561', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1627', 'ST NELI (MAMA DIFA) ', '5', '888006712659', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1628', 'PRAS/DWI PRASETYO', '5', '888006765616', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1629', 'NENI RISTIANA ', '5', ' 888006712148', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1630', 'SRI TASMININGSIH', '5', '888006764767', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1631', 'MAHARANI ', '5', '888006712639', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1632', 'MUGIARTO', '5', '888006765612', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1633', 'IRES', '5', '888006764768', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1634', 'NIA SABIL', '5', '888006764769', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1635', 'BUNDA TASYA', '5', '888006712149', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1636', 'IRA OLIVIA', '5', '888006765611', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1637', 'UMMY SABINA VAVI ', '5', '888006712655', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1638', 'DAVI ROVALDI', '5', '888006764770', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1639', 'WALID IKHWANDRI ', '5', ' 888006712150', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1640', 'SITI SHOLIKAH', '5', '888006765615', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1641', 'TOKO YULI PALOM ', '5', '888006712657', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1642', 'PRAMOTO', '5', '888006764759', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1643', 'YULI KRIS / EVARISTI ', '5', ' 888006712151', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1644', 'MUFAROKHATUN', '5', '888006765618', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1645', 'RESTU AZIZAH', '5', '888006764760', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1646', 'YANNI ', '5', '888006712621', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1647', 'MAMA RASYA', '5', '888006765577', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1648', 'MARTINI', '5', '888006764761', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1649', 'ULIN NI\'MAH ', '5', '888006712616', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1650', 'NASRAYATI', '5', '888006765573', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1651', 'TUK FENY/MAMA DAFFA', '5', '888006764762', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1652', ' MALA ', '5', '888006712647', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1653', 'HIKMAWATI SKM ', '5', '888006765574', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1654', 'WATI FAUZI ', '5', '888006764825', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1655', 'TOKO KAMIL', '5', '888006765581', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1656', 'INA MUTHMAIMANAH', '5', '888006712561', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1657', 'ITOH ', '5', '888006712152', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1658', 'EKA RAHMAWATI ', '5', '888006764909', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1659', 'SITI MAS\'ADAH ', '5', ' 888006712153', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1660', 'CAHYATI ', '5', '888006712553', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1661', 'NENENG HAERAI ', '5', ' 888006712154', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1662', 'MUCHAMAD NUR CHOLIS', '5', ' 888006712420', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1663', 'DINA', '5', '888006765597', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1664', 'ROSSITA ', '5', ' 888006712155', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1665', 'NAJYA ', '5', '888006764974', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1666', 'SEPTINA NINGSIH ', '5', '888006712632', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1667', 'RETA FITRY ', '5', '888006764975', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1668', 'MINTY ', '5', ' 888006712156', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1669', 'ENDANG', '5', '888006765589', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1670', 'NOVI HANDAYANI ', '5', '888006712609', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1671', 'ROHILAH ', '5', ' 888006712158', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1672', 'YULI', '5', '888006765592', 'TERKIRIM', null, '2016-06-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1673', 'GEDE ADI SUBRATA ', '5', '888006765576', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1674', 'MALA ', '5', '888006764749', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1675', 'SRI SURYA NINGSIH ', '5', ' 888006712157', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1676', 'DIAH DESIYANTI ', '5', '888006712654', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1677', 'LLA SOFIA', '5', '888006764763', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1678', 'TOKO YULI PALOM ', '5', ' 888006186134', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1679', 'LIA AHSANUN ', '5', '888006712575', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1680', 'NURHASANAH ', '5', ' 888006186132', 'TERKIRIM', null, '2016-06-27', '', '', '0', '0', '0', '0', '63', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1681', 'MAUREEN YOSIANE ', '5', '888006712586', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1682', 'SISKA MUHAMMAD ', '5', '888006764750', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1683', 'ARIF SETIYONO', '5', '888006764764', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1684', 'IBU TIA', '5', ' 888006712419', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1685', 'GIYANTO HARTINI ', '5', '888006712592', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1686', 'SITI IMAS MASITOH', '5', '888006764765', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1687', 'IRDA HALIDA/MAMA FAID', '5', ' 888006712589', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1688', 'TEGUH ARIFIANO', '5', '888006764766', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1689', 'RATNA NINGSIH / HADI ', '5', '888006712569', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1690', 'RIASTUTI KUSMARDANI', '5', '888006764751', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1691', 'SRI BUDI RAHAYU ', '5', '888006712579', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1692', 'SRI BUDI RAHAYYU ', '5', '888006764755', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1693', 'SANTI ', '5', '888006764754', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1694', 'YOSHI LESTARI ', '5', '888006712582', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1695', 'SRI MURNI SUJARWATI ', '5', '888006712574', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1696', 'RIRIN EKO PRAMONO ', '5', '888006712554', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1697', 'NENI RISTIANA ', '5', '888006186195', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1698', 'DIAH SARTONO ', '5', '888006764753', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1699', ' DEWI NURAINI ', '5', '888006712597', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1700', 'SALAM MANURUNY ', '5', '888006764827', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1701', 'NI\'MATUL BADRIYAH ', '5', '888006764826', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1702', 'LILIS JUWITASARI ', '5', '888006712596', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1703', 'SAMSIA ', '5', '888006764967', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1704', 'RIKA NURHANIFAH ', '5', '888006712598', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1705', 'ARFAH HUSNA ', '5', '888006764758', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1706', 'GAPUR (TOKO HALIFA)', '5', '888006764757', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1707', 'YUNIARSIH', '5', ' 888006712570', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1708', 'YUNIAR ', '5', '888006764648', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1709', 'IKA NURILAH JAMIL ', '5', '888006712614', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1710', 'ERNA EKAWATI', '5', '888006764952', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1711', 'MIANA SETIANA', '5', ' 888006712617', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1712', 'HENDRIK SUSANTO ', '5', '888006764951', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1713', 'SYPA NURUL WULAN ', '5', '888006712611', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1714', 'NITA FARIDA ', '5', '888006764950', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1715', 'NOVA ', '5', '888006764949', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1716', 'IRMA NURMALA ', '5', '888006764990', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1717', 'BAPA KHRIS DAVID PELAPORY ', '5', '888006712825', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1718', 'IIS ISRIYAHWATI ', '5', '888006764747', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1719', 'RISTRA J YUNIASARI ', '5', '888006712824', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1720', 'IKEN FEBRI ', '5', '888006764565', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1721', 'VY SHAVIRA ', '5', '888006712581', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1722', 'CATUR NUGRAHENI ', '5', '888006764800', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1723', 'ASTRI FAVZIAH ', '5', '888006712615', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1724', 'TETI RAHMAWATI ', '5', '888006764799', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1725', 'BUTIK ADLYN RSUD PANGKEP  ', '3', '15027979030', 'TERKIRIM', null, '2016-06-28', '', '', '0', '0', '0', '0', '64', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1726', 'EKOWATI ', '5', '888006764798', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1727', 'LILIK ISMAWATI ', '5', '888006764781', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1728', 'LINDA APRIYANTI ', '5', '888006764746', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1729', 'NASHAKHUDIN AZMI ', '5', '888006764647', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1730', 'MUFHA ROKHATUN ', '5', '888006764650', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1731', 'ISMUDIAR ', '5', '888006764644', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1732', 'LISTIAWATI ', '5', '888006764646', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1733', 'SIDIK EKO PRAYITNO ', '5', '888006764651', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1734', 'NURHASANAH ', '5', '888006764654', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1735', 'TOKO YULI PALOM ', '5', '888006764655', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1736', 'RISKA YULIYANTI ', '5', '888006764656', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1737', 'DEDE TRI HARTATI ', '5', '888006764652', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1738', ' JIHAN MARIA ULFA ', '5', '888006764658', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1739', 'TOKO KAMIL ', '5', '888006764649', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1740', 'LIA DAHLIA ', '5', '888006764653', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1741', 'DEWA ', '5', '888006764657', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1742', 'NITA LESTARI', '5', '888006764780', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1743', 'LIA OL\'SHOP ', '5', '888006764779', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1744', 'CEFTI LIA PERMAASARI', '5', '888006764778', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1745', 'ARSIANI', '5', '888006764775', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1746', 'SUCI MARYANAH ', '5', '888006764559', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1747', 'ASNAWI ', '5', '888006764558', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1748', 'YULI ', '5', '888006764560', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1749', 'DWI AITA RIYANI ', '5', '888006764642', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1750', 'SANTI PONIX ', '5', '888006764945', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1751', 'CECEP ZAM-ZAM ', '5', '888006764776', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1752', 'EKSI UTAMI ', '5', '888006764748', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1753', 'ANA ', '5', '888006764771', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1754', 'YUNIARSIH ', '5', '888006764968', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1755', 'WIDYA ', '5', '888006764777', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1756', 'NOVI HANDAYANI', '5', '888006764643', 'TERKIRIM', null, '2016-06-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1757', 'YULIKRIS EVA RISTY', '3', '15027979478', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1758', 'AYU AFRILIA', '5', '888007310316', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1759', 'NURBAYA', '5', '888007310317', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1760', 'MUH SABIR', '5', '888007310319', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1761', 'SEPTI IRAWATI', '5', '888007310320', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1762', 'DEVI SILVIA', '5', '888007310060', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1763', 'CECEP ZAMZAM', '5', '888007310061', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1764', 'ASFIDAH', '5', '888007310059', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1765', 'IFLAKHUL', '5', '888007310058', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1766', 'LISTIAWATI', '5', '888007310318', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1767', 'BUTIK ADLYN', '5', '888007310326', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1768', 'MISNA FAJAR', '5', '888007310322', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1769', 'NEVI DUROTUNNAFISAH', '5', '888007651404', 'TERKIRIM', null, '2016-07-18', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1770', 'NELVY ', '5', '888007310323', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1771', 'LENA SRINAWATI', '5', '888007310054', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1772', 'MIZDA MULYANI ', '5', '888007651325', 'TERKIRIM', null, '2016-07-18', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1773', 'ERNOVIA', '5', '888007310325', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1774', 'KUSTIYAH YUNIARTI ', '5', '888007651323', 'TERKIRIM', null, '2016-07-18', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1775', 'TINI M AKMAL', '5', '888007310315', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1776', 'MALSI NARANIS', '5', '888007651322', 'TERKIRIM', null, '2016-07-18', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1777', 'IRMA NURMALA', '5', '888007310288', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1778', 'NURJANAH', '5', '888007651321', 'TERKIRIM', null, '2016-07-18', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1779', 'DEWA ', '5', '888007310289', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1780', 'ARIFAH YENNI', '5', '888007651320', 'TERKIRIM', null, '2016-07-18', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1781', 'BUNDA BG SYAAMIL', '5', '888007310290', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1782', 'YAYAH QOMARIAH ', '5', '888007651319', 'TERKIRIM', null, '2016-07-18', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1783', 'IBU DINA', '5', '888007310277', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1784', 'ISNURDIHWATI', '5', '888007310291', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1785', 'ANISA FAJARANI', '5', '888007310287', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1786', 'TANTY DYAH ANNA ', '5', '888007651689', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1787', 'TOKO YULI PALOM ', '5', '888007651694', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1788', 'RIRIN TRIA RISRI', '5', '888007310278', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1789', 'SYAFRINDA', '5', '888007651695', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1790', 'TITIE', '5', '888007310292', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1791', 'MAMA ANGGUN ', '5', '888007310363', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1792', 'JIHAN MARIA ULFA ', '5', '888007651693', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1793', 'MIMI KHARIS', '5', '888007310314', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1794', 'SRI BUDI RAHAYU ', '5', '888007651690', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1795', 'OKTIN SUSANTI', '5', '888007310133', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1796', 'WASNIATI', '5', '888007310056', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1797', 'NAMIRA', '3', '888007310053', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1798', 'NOVA', '5', '888007651691', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1799', 'EKA APRILIA SULISTIANI', '5', '888007310313', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1800', 'MERYADI  PRIYASTI RAHMA', '5', '888007651684', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1801', 'NITI SUHAENI', '5', '888007310062', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1802', 'ALDILA SATRIA NEGARA ', '5', '888007651681', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1803', 'NAMIT NAMUNG', '5', '888007310057', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1804', 'BPK. DASIRUN', '5', '888007651679', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1805', 'ZAKIYATUL MILLAH', '5', '888007310063', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1806', 'TINI M AKMAL ', '5', '888007651680', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1807', 'AYU AFRILIA ', '5', '888007305514', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1808', 'FITRI RAMDHANI ', '5', '888007305516', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1809', 'SISKA', '5', '888007651692', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1810', 'ITA ROSITA ', '5', '888007651683', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1811', 'WIWI / ANDI ', '5', '888007305515', 'TERKIRIM', null, '2016-07-01', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1812', 'TOKO YULI PALOM ', '5', '888007651720', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1813', 'BPK. ASEP BENGKEL ', '5', '888007651718', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1814', 'YULIANTI ', '5', '888007651719', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1815', 'ERNOVIA', '5', '888007651947', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1816', 'MAYAWATI ', '5', '888007651723', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1817', 'HENDRA GUNAWAN ', '5', '888007651721', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1818', 'DIAN PAHLUPI ', '5', '888007651722', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1819', 'MAMA RAFKA', '5', '888007651710', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1820', 'SITI IMAS MASITOH ', '5', '888007651953', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1821', 'TRI PRIHARTINI', '5', '888007651711', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1822', 'IMELDHA SUHAIMI ', '5', '888007651954', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1823', 'NENG RIA', '5', '888007651712', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1824', 'YULIA PURNAMA SARI', '3', '14987938623', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1825', 'FATIMAH MIMIN ', '5', '888007651716', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1826', 'LISTIAWATI', '5', '888007651713', 'TERKIRIM', null, '2016-07-20', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1827', 'IDRAWATI', '3', '14987938636', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1828', 'EKA DESI SUSANTI ', '5', '888007651717', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1829', 'YULIKRIS/ EVA RISTY', '3', '14987938847', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1830', 'ASPIANA', '3', '14987938850', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1831', 'MASITOH', '3', '14987938863', 'TERKIRIM', null, '2016-07-21', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1832', 'ITA ROSITA ', '1', 'BDOD505677250816', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1833', 'ARI NURLYANSYAH', '3', '14226873098', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1834', 'IMA TANIA', '5', '888007651977', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1835', 'TOSSAMIHARJA', '5', '888007651978', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1836', 'IDA SYAFRIDA HARAHAP', '5', '888007651979', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1837', 'DESY LAILY', '5', '888007651980', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1838', 'FITRI LESTARI', '5', '888007651981', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1839', 'NANIK NURHAYATI', '5', '888007651982', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1840', 'DINI WULANSARI', '5', '888007651983', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1841', 'JIHAN MARIA ULFAH', '5', '888007651996', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1842', 'LISTIAWATI', '5', '888007651995', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1843', 'RATNA/NIZAM', '5', '888007651994', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1844', 'MEILINA NOVARI', '5', '888007651984', 'TERKIRIM', null, '2016-07-22', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1845', 'INDRA SURYANI', '3', '142268773147', 'TERKIRIM', null, '2016-07-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1846', 'ERNOVIA', '3', '14226873134', 'TERKIRIM', null, '2016-07-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1847', 'LENA SRINAWATI', '5', '888007705840', 'TERKIRIM', null, '2016-07-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1848', 'INDRA SURYANI', '3', '142268773147', 'TERKIRIM', null, '2016-07-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1849', 'TOKO YULI PALOMA', '5', '888007705847', 'TERKIRIM', null, '2016-07-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1850', 'DWI KARSIWI PENI', '1', 'BDON801455015416', 'TERKIRIM', null, '2016-07-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1851', 'YATI', '5', '888007705846', 'TERKIRIM', null, '2016-07-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1852', 'RIKA IJAL', '5', '888007705583', 'TERKIRIM', null, '2016-07-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1853', 'TIARA', '5', '888007705584', 'TERKIRIM', null, '2016-07-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1854', 'JIHAN MARIA ULFA', '5', '888007705844', 'TERKIRIM', null, '2016-07-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1855', 'DWI SUKARYONO', '5', '888007705475', 'TERKIRIM', null, '2016-07-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1856', 'NANIK DWININGSIH ', '5', '888007705845', 'TERKIRIM', null, '2016-07-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1857', 'ARIFAH', '5', '888007705474', 'TERKIRIM', null, '2016-07-23', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1858', 'INDRAWATI', '3', '14987938636', 'TERKIRIM', null, '2016-07-26', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1859', 'KESY SANUSI', '5', '888007705838', 'TERKIRIM', null, '2016-07-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1860', 'YULIA PURNAMA SARI', '3', '14987938623', 'TERKIRIM', null, '2016-07-26', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1861', 'NINING IDA ', '5', '888007705841', 'TERKIRIM', null, '2016-07-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1862', 'MULYANI', '5', '888007705842', 'TERKIRIM', null, '2016-07-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1863', 'FITRIAH', '1', 'BDON801456204516', 'TERKIRIM', null, '2016-07-25', '', '', '0', '0', '0', '0', '65', '2016-07-29', '2016-07-29');
INSERT INTO `kb_no_resi` VALUES ('1864', 'TOKO SARANA HIJAB', '5', '888007634029', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1865', 'MAMA ANGGUN', '5', '888006712552', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1866', 'DESMIATI', '5', '888007634031', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1867', 'EKA PATMAWATI ', '1', 'BDON801461094816', 'TERKIRIM', null, '2016-07-28', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1868', 'ELA SHOFA', '5', '888007705837', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1869', 'SRI ADINI EKA STARTI/SAPTONI', '5', '888007634030', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1870', 'GIANT BABYSHOP', '5', '888007705836', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1871', 'NARIDA ISNAENI', '5', '888007705834', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1872', 'INAYATUL MUAMAROH', '5', '888007705835', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1873', 'ARIANA RACHMAWATI', '5', '888006186130', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1874', 'ANI H. H YAKUP/ IKHYA CELL', '5', '888007634028', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1875', 'HERA', '5', '888007634027', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1876', 'AHMAD ROZALI ', '1', 'BDON801461085016', 'TERKIRIM', null, '2016-07-28', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1877', 'IBU LIAH', '5', '888007634026', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1878', 'WINARNI', '1', 'BDON801461075216', 'TERKIRIM', null, '2016-07-28', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1879', 'TOKO  YULI PALOM', '5', '888007634025', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1880', 'NURUL ISTIQOMAH ', '1', 'BDON801461055616', 'TERKIRIM', null, '2016-07-28', '', '', '0', '0', '0', '0', '65', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1881', 'RINAWATI', '5', '888007634024', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1882', 'ERINA HASMERA', '3', '15180220734', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1883', 'ANISA SUSANTI', '3', '15180220747', 'TERKIRIM', null, '2016-07-27', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1884', 'MALA ', '5', '888007634702', 'TERKIRIM', null, '2016-07-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1885', 'ERNI ', '5', '888007634701', 'TERKIRIM', null, '2016-07-29', '', '', '0', '0', '0', '0', '66', '2016-07-29', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1886', 'ANTIN PRABOWO ', '5', '888007634700', 'TERKIRIM', null, '2016-07-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1887', 'YULIANTI ', '5', '888007634699', 'TERKIRIM', null, '2016-07-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1888', 'AIDA HANDAYANI ', '3', '888007634698', 'TERKIRIM', null, '2016-07-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1889', 'DESY LUTFIANTI', '5', '888007634697', 'TERKIRIM', null, '2016-07-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1890', 'YENI AULYANTI ', '5', '888007634720', 'TERKIRIM', null, '2016-07-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1891', 'RATNA WULANDARI ', '5', '888007634696', 'TERKIRIM', null, '2016-07-29', '', '', '0', '0', '0', '0', '62', '2016-07-29', null);
INSERT INTO `kb_no_resi` VALUES ('1892', 'AINUL USROTI ', '5', '888007593033', null, null, '2016-07-30', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1893', 'TATAT RYALITA ', '5', '888007593046', null, null, '2016-07-30', '0', '3KG', '27000', '27000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1894', 'SITI ROIKATUN ', '5', '888007593034', null, null, '2016-07-29', '0', '1KG', '42000', '42000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1895', 'WHIRY ', '5', '888007593062', null, null, '2016-07-29', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1896', 'JULIA ULFAH ', '5', '888007593061', null, null, '2016-07-29', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1897', 'BUNDA KAMELIA', '5', '888007593044', null, null, '2016-07-29', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1898', 'EDI KURNIAWAN ', '5', '888007593035', null, null, '2016-07-29', '0', '3KG', '54000', '54000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1899', 'TOKO YULI PALOM ', '5', '888007593036', null, null, '2016-07-29', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1900', 'UNI FITRI', '5', '888007593039', null, null, '2016-07-29', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1901', 'LULU ', '5', '888007593038', null, null, '2016-07-29', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1902', 'LOLLA DESTRIA ', '5', '888007593037', null, null, '2016-07-29', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1903', 'MAMA RAFKA', '5', '888007593043', null, null, '2016-07-29', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1904', 'SITY MUSTAQIMAH ', '5', '888007593045', null, null, '2016-07-29', '0', '2KG', '44000', '44000', '0', '3', '66', '2016-07-30', '2016-07-30');
INSERT INTO `kb_no_resi` VALUES ('1905', 'SRI RAHAYU ', '5', '888007593118', null, null, '2016-07-30', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1906', 'ALAM ', '5', '888007593263', null, null, '2016-07-30', '0', '1KG', '26000', '26000', '0', '3', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1907', 'MEILINA AOFARI ', '5', '888007593117', null, null, '2016-07-30', '0', '9KG', '387000', '387000', '0', '3', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1908', 'IBU ADE ', '5', '888007593126', null, null, '2016-07-30', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1909', 'NENG RIA ', '5', '888007593125', null, null, '2016-07-30', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1910', 'ENIE AMOENG ', '5', '888007593124', null, null, '2016-07-30', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1911', 'FENY (MAMAH DAFA)', '5', '888007593123', null, null, '2016-07-30', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1912', 'NURUL BADRIYAH ', '5', '888007593262', null, null, '2016-07-30', '0', '1KG', '10000', '11000', '1000', '5', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1913', 'ASEP SAEFUL ', '5', '888007593119', null, null, '2016-07-30', '0', '1KG', '9000', '9000', '0', '5', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1914', 'RENA CITRA ', '5', '888007593120', null, null, '2016-07-30', '0', '1KG', '9000', '9000', '0', '5', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1915', 'IMAS FATONAH ', '5', '888007593121', null, null, '2016-07-30', '0', '1KG', '9000', '9000', '0', '5', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1916', 'SITI MAIMUNAH ', '5', '888007593122', null, null, '2016-07-30', '0', '1KG', '16000', '16000', '0', '5', '66', '2016-08-01', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1918', 'KESY SANUSI ', '5', '888007593269', null, null, '2016-08-01', '0', '3KG', '141000', '141000', '0', '3', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1919', 'PAK TAROMPO ', '5', ' 888007593270 ', null, null, '2016-08-01', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1920', 'DESY LUTFIANTY', '5', ' 888007593271 ', null, null, '2016-08-01', '0', '1KG', '10000', '11000', '1000', '3', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1921', 'ITUT WIDYASTUTI ', '5', ' 888007593272', null, null, '2016-08-01', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1922', 'DIAN SARI ', '5', ' 888007593273', null, null, '2016-08-01', '0', '1KG', '33000', '', '-33000', '3', '63', '2016-08-02', null);
INSERT INTO `kb_no_resi` VALUES ('1923', 'SETTY ', '5', ' 888007593274', null, null, '2016-08-01', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1924', 'BIDAN NURHAYATI ', '5', ' 888007593276', null, null, '2016-08-01', '0', '1KG', '18000', '13000', '-5000', '3', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1925', 'IBU INDAH ', '5', ' 888007593277', null, null, '2016-08-01', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1926', 'TOKO YULI PALOM ', '5', ' 888007593278', null, null, '2016-08-01', '0', '1KG', '11000', '', '-11000', '3', '63', '2016-08-02', null);
INSERT INTO `kb_no_resi` VALUES ('1927', 'HERU ', '5', ' 888007593279', null, null, '2016-08-01', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1928', 'NENI WIERYAND ', '5', ' 888007593280', null, null, '2016-08-01', '0', '1KG', '20000', '33000', '13000', '3', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1929', 'EPI SOPIAH ', '5', ' 888007593264', null, null, '2016-08-01', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1930', 'KASIH  ', '5', '888007593268', null, null, '2016-08-01', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1931', 'DEBBY ANGGRAENI ', '5', ' 888007593266', null, null, '2016-08-01', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1933', 'FARIDA NURAINI ', '5', ' 888007593265', null, null, '2016-08-01', '0', '1KG', '36000', '36000', '0', '5', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1934', 'TATIK EKO WATI ', '5', ' 888007593267', null, null, '2016-08-01', '0', '1KG', '20000', '20000', '0', '5', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1935', 'AYU NOVITASARI ', '5', ' 888007593275', null, null, '2016-08-01', '0', '1KG', '25000', '25000', '0', '5', '66', '2016-08-02', '2016-08-02');
INSERT INTO `kb_no_resi` VALUES ('1936', 'WINARNI ', '1', 'BDOL902279969716', null, null, '2016-08-01', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1937', 'FITRI WULAN UTAMI', '1', 'BDOL902279959916', null, null, '2016-08-01', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1938', 'NIA/AENA MURAHIM', '5', '888007593852', null, null, '2016-08-02', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1939', 'RINAWATI ', '5', '888007593850', null, null, '2016-08-02', '0', '4KG', '184000', '230000', '46000', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1940', 'AAS', '5', '888007593839', null, null, '2016-08-02', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1941', 'VERA TRIANA', '5', '888007593847', null, null, '2016-08-02', '0', '1KG', '35000', '35000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1942', 'LILIS FATIMAH', '5', '888007593848', null, null, '2016-08-02', '0', '1', '7000', '11000', '4000', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1943', 'ERNOVIA', '5', '888007593849', null, null, '2016-08-02', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1944', 'VERYUDA EKA PRAMESWARI', '5', '888007593853', null, null, '2016-08-02', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1945', 'IIK', '5', '888007593854', null, null, '2016-08-02', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1946', 'IRNA NURMALA', '5', '888007593855', null, null, '2016-08-02', '0', '1KG', '11000', '', '-11000', '3', '62', '2016-08-04', null);
INSERT INTO `kb_no_resi` VALUES ('1947', 'RANI IRAWATI', '5', '888007593857', null, null, '2016-08-02', '0', '1KG', '18000', '13000', '-5000', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1948', 'DIAN ANGGRAENI', '5', '888007593843', null, null, '2016-08-02', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1949', 'SITI MUSTAQIMAH', '5', '888007593844', null, null, '2016-08-02', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1950', 'RINA', '5', '888007593845', null, null, '2016-08-02', '0', '1KG', '22000', '18000', '-4000', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1951', 'SRI WAHYUNI', '5', '888007593842', null, null, '2016-08-02', '0', '1KG', '29000', '29000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1952', 'M ABDUL ROZAK', '5', '888007593841', null, null, '2016-08-02', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1953', 'ALAM ', '5', '888007593840', null, null, '2016-08-02', '0', '1KG', '26000', '26000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1954', 'KESY SANUSI R', '5', '888007593851', null, null, '2016-08-02', '0', '2KG', '94000', '94000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1955', 'IMA LAILATUL S', '3', '14226873332', null, null, '2016-08-02', '0', '515gr', '26000', '25000', '-1000', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1956', 'ARI NURLYANSYAH', '3', '14226873345', null, null, '2016-08-02', '0', '470gr', '28000', '34000', '6000', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1957', 'SUSILAWATI ', '5', '888007593863', '0', null, '2016-08-02', '0', '2KG', '22000', '022000', '0', '5', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1958', 'AMILIA ', '5', '888007593669', null, null, '2016-08-02', '0', '1KG', '22000', '22000', '0', '5', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1959', 'HERDA FEBDIANITA ', '5', '888007593861', null, null, '2016-08-02', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1960', 'ARIF RAHMAN ', '5', '888007593860', null, null, '2016-08-02', '0', '1KG', '10000', '10000', '0', '5', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1961', 'SITI RAHAYU ', '5', '888007593859', null, null, '2016-08-02', '0', '1KG', '59000', '45000', '-14000', '5', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1962', 'YOSI APRILIANI ', '5', '888007593858', null, null, '2016-08-02', '0', '1KG', '7000', '7000', '0', '5', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1963', 'MILATINA HANIFAH ', '5', '888007593856', null, null, '2016-08-02', '0', '1KG', '7000', '7000', '0', '5', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1964', 'LITA', '5', '888007593862', null, null, '2016-08-02', '0', '1KG', '7000', '7000', '0', '5', '66', '2016-08-04', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1965', 'EVIN VINAYATI', '5', '888007593668', null, null, '2016-08-02', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1966', 'WIWIK', '5', '888007593670', null, null, '2016-08-02', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1967', 'MANY', '5', '888007541270', null, null, '2016-08-03', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1968', 'AINUL USROTI', '5', '888007541269', null, null, '2016-08-03', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1969', 'LENA SRINAWATI', '5', '888007541268', null, null, '2016-08-03', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1970', 'PRAKA AHRIZAL', '5', '888007541267', null, null, '2016-08-03', '0', '1KG', '10000', '', '-10000', '3', '62', '2016-08-04', null);
INSERT INTO `kb_no_resi` VALUES ('1971', 'DWI SETYANINGSIH', '5', '888007541265', null, null, '2016-08-03', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1972', 'DEWA', '5', '888007541264', null, null, '2016-08-03', '0', '2KG', '20000', '20000', '0', '3', '66', '2016-08-04', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('1973', 'NURYANTO', '5', '888007541263', null, null, '2016-08-03', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1974', 'DINE ', '5', '888007541262', null, null, '2016-08-03', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1975', 'MERYADI PRIYASTI', '5', '888007541261', null, null, '2016-08-03', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1976', 'JIHAN MARIA ULFA ', '5', '888007541260', null, null, '2016-08-03', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-04', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1977', 'JUHARO SIREGAR', '5', '888007541259', null, null, '2016-08-03', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-04', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1978', 'EKOWATI', '5', '888007541258', null, null, '2016-08-03', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-04', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1979', 'SEPTI SETYANINGSIH', '5', '888007541271', null, null, '2016-08-03', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1980', 'LEONORA', '5', '888007541266', null, null, '2016-08-03', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1981', 'DESI KURNIATI ', '5', '888007541272', null, null, '2016-08-03', '0', '1KG', '33000', '33000.', '0', '3', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1982', 'ARI MULYANI ', '5', '888007541274', null, null, '2016-08-03', '0', '1KG', '10000', '0', '-10000', '5', '62', '2016-08-04', null);
INSERT INTO `kb_no_resi` VALUES ('1983', 'YUDIHARJO', '5', '888007541273', null, null, '2016-08-03', '0', '1KG', '17000', '0', '-17000', '5', '62', '2016-08-04', null);
INSERT INTO `kb_no_resi` VALUES ('1984', 'NORA', '5', '888007541275', '0', null, '2016-08-03', '0', '1KG', '25000', '25000', '0', '5', '66', '2016-08-04', '2016-08-04');
INSERT INTO `kb_no_resi` VALUES ('1985', 'EKA PATMAWATI', '1', 'BDOL902285263516', null, null, '2016-08-04', '0', '1KG', '37000', '37000', '0', '3', '66', '2016-08-04', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1986', 'ROSSA YOME NAJWA', '1', 'BDOL902285253716', null, null, '2016-08-04', '0', '1KG', '28000', '27000', '-1000', '3', '66', '2016-08-04', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1987', 'FATMA RAHMAWATI', '3', '14226873361', null, null, '2016-08-04', '0', '1350gr', '37100', '48000', '10900', '5', '66', '2016-08-04', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('1988', 'HIKMAWATI. SKM', '5', ' 8880007541618', null, null, '2016-08-04', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1989', 'YOGA ADHI PAMUNGKAS ', '5', ' 8880007541612', null, null, '2016-08-04', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1990', 'IIS ', '5', '8880007541613', null, null, '2016-08-04', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1991', 'DEWI YULIZA  ', '5', '8880007541614', null, null, '2016-08-04', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1992', 'ROYANTI BONAN', '5', '8880007541615', null, null, '2016-08-04', '0', '1KG', '11000', '12000', '1000', '3', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1993', 'IBU SARI / MAMA ALYSA ', '5', '8880007541616', null, null, '2016-08-04', '0', '1KG', '10000', '11000', '1000', '3', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1994', 'RUSDIANA AMALIA', '5', '8880007541617', null, null, '2016-08-04', '0', '1KG', '43000', '43000', '0', '3', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1995', 'LIYA AGUSTINI', '5', '8880007541619', null, null, '2016-08-04', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1996', 'NOVALIA ABD.RAHMAN', '5', '8880007541620', null, null, '2016-08-04', '0', '1KG', '48000', '48000', '0', '5', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1997', 'ETIK ', '5', ' 8880007541621', null, null, '2016-08-04', '0', '1KG', '22000', '22000', '0', '5', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1998', 'RENNI MARTADIRATNA', '5', '8880007541622', null, null, '2016-08-04', '0', '1KG', '10000', '10000', '0', '5', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('1999', 'ENDAH EKA KUSUMANINGTYAS', '5', '8880007541632', null, null, '2016-08-04', '0', '1KG', '10000', '11000', '1000', '5', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('2000', 'FARKHATUN', '5', '8880007541624', null, null, '2016-08-04', '0', '1KG', '12000', '12000', '0', '5', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('2001', 'ANITA WOTAVIA', '5', '8880007541626', null, null, '2016-08-04', '0', '1KG', '16000', '16000', '0', '5', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('2002', 'TAN PANI', '5', '8880007541625', null, null, '2016-08-04', '0', '2KG', '22000', '22000', '0', '5', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('2003', 'RINAWATI / TOKO DHINI', '5', '8880007541627', null, null, '2016-08-04', '0', '4KG', '184000', '230000', '46000', '5', '66', '2016-08-05', '2016-08-05');
INSERT INTO `kb_no_resi` VALUES ('2004', 'TARI ', '5', '888007541764', null, null, '2016-08-05', '0', '1KG', '53000', '53000', '0', '3', '66', '2016-08-06', '2016-08-06');
INSERT INTO `kb_no_resi` VALUES ('2005', 'LISTIAWATI', '5', '888007541765', null, null, '2016-08-05', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-06', '2016-08-06');
INSERT INTO `kb_no_resi` VALUES ('2006', 'NOPIANTI', '5', '888007541766', null, null, '2016-08-05', '0', '1KG', '10000', '', '-10000', '3', '62', '2016-08-06', null);
INSERT INTO `kb_no_resi` VALUES ('2007', 'IBU KHOLIFAH ', '0', '888007541767', null, null, '2016-08-05', '0', '1KG', '22000', '22000', '0', '0', '66', '2016-08-06', '2016-08-06');
INSERT INTO `kb_no_resi` VALUES ('2008', 'FITRI WAHYUNI', '5', '888007541768', null, null, '2016-08-05', '0', '2KG', '26000', '52000', '26000', '3', '66', '2016-08-06', '2016-08-06');
INSERT INTO `kb_no_resi` VALUES ('2009', 'YUNITA', '5', '888007541769', null, null, '2016-08-05', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-06', '2016-08-06');
INSERT INTO `kb_no_resi` VALUES ('2010', 'RISA NURMALASARI', '5', '888007541770', null, null, '2016-08-05', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-06', '2016-08-06');
INSERT INTO `kb_no_resi` VALUES ('2011', 'MELDHA SUHAIMI', '5', '888007541773', null, null, '2016-08-05', '0', '1KG', '53000', '35500', '-17500', '3', '66', '2016-08-06', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2012', 'ERNOVIA ', '3', '14782236615', '0', null, '2016-08-06', '0', '992GR', '19000', '39000', '20000', '5', '66', '2016-08-06', '2016-08-06');
INSERT INTO `kb_no_resi` VALUES ('2013', 'MARIANA AFIFAH SHOP', '3', '14782236628', null, null, '2016-08-06', '0', '9000GR', '220000', '230000', '10000', '3', '66', '2016-08-06', '2016-08-06');
INSERT INTO `kb_no_resi` VALUES ('2014', 'DWI KARSIWI PENI', '1', 'BDOL902290315416', '0', null, '2016-08-06', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-06', '2016-08-06');
INSERT INTO `kb_no_resi` VALUES ('2015', 'NURAINI/M UHAMMAD FAJAR', '1', 'BDOL902290305616', null, null, '2016-08-06', '0', '1KG', '63000', '51000', '-12000', '3', '66', '2016-08-06', '2016-08-06');
INSERT INTO `kb_no_resi` VALUES ('2016', 'RENNI MARTADIRATNA ', '5', '888007541781', null, null, '2016-08-05', '0', '3KG', '30000', '33000', '3000', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2017', 'DINI WULANSARI', '5', '888007541780', null, null, '2016-08-05', '0', '1KG', '9000', '9000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2018', 'BUNDA NURMA ', '5', '888007541779', null, null, '2016-08-05', '0', '1KG', '19000', '19000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2019', 'ENO', '5', '888007541771', null, null, '2016-08-05', '0', '1KG', '10000', '10000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2020', 'KASIH', '5', '888007541778', null, null, '2016-08-05', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2021', 'ARNI', '3', '888007541777', null, null, '2016-08-05', '0', '1KG', '42000', '42000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2022', 'RUSWANDI ', '5', '888007541776', null, null, '2016-08-05', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2023', 'MALSI NARANIS ', '5', '888007541775', null, null, '2016-08-05', '0', '1KG', '12000', '11000', '-1000', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2024', 'WIWIN WINARTI ', '5', '888007541772', null, null, '2016-08-05', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2025', 'URIP SUMARTINAH ', '5', '888007546071', null, null, '2016-08-06', '0', '5KG', '80000', '80000', '0', '3', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2026', 'BUDHY MULYATI ', '5', '888007546066', null, null, '2016-08-06', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2027', 'TOKO YULI PALOM ', '5', '888007546065', null, null, '2016-08-06', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2028', 'ITA ROSTATI ', '5', '888007546052', null, null, '2016-08-06', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2029', 'JIHAN MARIA ULFA ', '5', '888007546049', null, null, '2016-08-06', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2030', 'MEILINA AOFARI', '5', '888007546054', null, null, '2016-08-06', '0', '2KG', '86000', '', '-86000', '3', '62', '2016-08-08', null);
INSERT INTO `kb_no_resi` VALUES ('2031', 'NURHASANAH ', '5', '888007546051', null, null, '2016-08-06', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2032', 'TEGUH BUDI .R', '5', '888007546056', null, null, '2016-08-06', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2033', 'JAJAT SUDRAJAT ', '5', '888007546058', null, null, '2016-08-06', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2034', 'HERVIANNA INDIRA ', '5', '888007546061', null, null, '2016-08-06', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2036', 'WINA ', '5', '888007546070', null, null, '2016-08-06', '0', '1KG', '9000', '9000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2037', 'DEVI IMALIA', '5', '888007546069', '0', null, '2016-08-06', '0', '5KG', '45000', '54000', '9000', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2038', 'DEWI YARTIKA ', '5', '888007546068', null, null, '2016-08-06', '0', '1KG', '22000', '', '-22000', '5', '62', '2016-08-08', null);
INSERT INTO `kb_no_resi` VALUES ('2039', 'NUR HIDAYAH ', '5', '888007546072', null, null, '2016-08-06', '0', '1KG', '47000', '47000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2040', 'IBU IVONE ', '5', '888007546080', null, null, '2016-08-06', '0', '1KG', '32000', '32000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2041', 'DESRI HELIZAR', '5', '888007546067', null, null, '2016-08-06', '0', '1KG', '16000', '16000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2042', 'NORA ', '5', '888007546048', null, null, '2016-08-06', '0', '1KG', '25000', '25000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2043', 'PIA REFIANI ', '5', '888007546050', null, null, '2016-08-06', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2044', 'SILVIANA ', '5', '888007546055', null, null, '2016-08-06', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2045', 'NOOR ANITA', '5', '888007546057', null, null, '2016-08-06', '0', '1KG', '30000', '30000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2046', 'TRI UTAMI', '5', '888007546059', null, null, '2016-08-06', '0', '1KG', '33000', '33000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2047', 'ANNE SANDRA', '5', '888007546060', null, null, '2016-08-06', '0', '1KG', '9000', '11000', '2000', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2048', 'DWI ASWATI', '5', '888007546062', null, null, '2016-08-06', '0', '1KG', '28000', '28000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2049', 'DWI YUDHA ', '5', '888007546064', null, null, '2016-08-06', '0', '1KG', '29000', '29000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2050', 'BU UUS ', '5', '888007546063', null, null, '2016-08-06', '0', '6KG', '108000', '108000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2051', 'SOLIKIN AO', '5', '888007546053', null, null, '2016-08-06', '0', '1KG', '18000', '18000', '0', '5', '66', '2016-08-08', '2016-08-08');
INSERT INTO `kb_no_resi` VALUES ('2052', 'HERMIATI', '5', '888007546570', null, null, '2016-08-08', '0', '3KG', '165000', '110000', '-55000', '3', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2053', 'TOKO YULI PALOM', '5', '888007546571', null, null, '2016-08-08', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2054', 'RISA NURMALASARI', '5', '888007546584', null, null, '2016-08-08', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2055', 'LIA AHSANUN', '5', '888007546585', null, null, '2016-08-08', '0', '2KG', '32000', '16000', '-16000', '3', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2056', 'WAHYU', '5', '888007546586', null, null, '2016-08-08', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2057', 'ABDUL GOFAR', '5', '888007546569', null, null, '2016-08-08', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2058', 'SEPTI ROSDIANA', '5', '888007546568', null, null, '2016-08-08', '0', '1KG', '7000', '', '', '3', '63', '2016-08-09', null);
INSERT INTO `kb_no_resi` VALUES ('2059', 'TOSSA MIHARJA', '5', '888007546567', null, null, '2016-08-08', '0', '1KG', '10000', '11000', '1000', '3', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2060', 'BUNDA KAMELIA ', '5', '888007546566', null, null, '2016-08-08', '0', '1KG', '10000', '', '', '3', '63', '2016-08-09', null);
INSERT INTO `kb_no_resi` VALUES ('2061', 'BAPAK DIDIN / IIK', '5', '  888007546565', null, null, '2016-08-08', '0', '1KG', '33000', '', '', '3', '63', '2016-08-09', null);
INSERT INTO `kb_no_resi` VALUES ('2062', 'JUNIARTI', '5', '  888007546564', null, null, '2016-08-08', '0', '1KG', '10000', '', '', '3', '63', '2016-08-09', null);
INSERT INTO `kb_no_resi` VALUES ('2063', 'NUTRIAS RAHAYU ', '5', '888007546563', null, null, '2016-08-08', '0', '1KG', '33000', '', '', '3', '63', '2016-08-09', null);
INSERT INTO `kb_no_resi` VALUES ('2064', 'SUTINI  ', '3', '15182405686', null, null, '2016-08-08', '0', '375gr', '92550', '114500', '21950', '3', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2065', 'ELA SETIAWATI  ', '3', '15182405673', null, null, '2016-08-08', '0', '405gr', '23050', '25000', '1950', '3', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2066', 'SASKIA OKTAVIANI', '3', '14782236780', null, null, '2016-08-08', '0', '467gr', '22.440', '', '', '5', '63', '2016-08-09', null);
INSERT INTO `kb_no_resi` VALUES ('2067', 'AJENG DWI ANJANI', '3', '15182405719', null, null, '2016-08-08', '0', '9740 gr', '142445', '135845', '-6600', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2068', 'DEWI SARTIKA  ', '5', '888007546576', null, null, '2016-08-08', '0', '2KG', '72000', '36000', '-36000', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2069', 'LIYA AGUSTINI', '5', '888007546581', null, null, '2016-08-08', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2070', 'MUSDALIFAH (BAG. AKUTANSI)', '5', ' 888007546582', null, null, '2016-08-08', '0', '1KG', '26000', '26000', '0', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2071', 'WIDI / MAMA RIFA  ', '5', '888007546580', null, null, '2016-08-08', '0', '1KG', '10000', '10000', '0', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2072', 'MIANA SEPTIANA', '5', '888007546579', null, null, '2016-08-08', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2073', 'YUSI ASRI INSANI', '5', '888007546578', null, null, '2016-08-08', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2074', 'SUSI YAYU WULANDARI  ', '5', '888007546577', null, null, '2016-08-08', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2075', 'WIWIN / EDWARD SIANTURI  ', '5', '888007546575', null, null, '2016-08-08', '0', '1KG', '16000', '18000', '2000', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2076', 'VENNY YUDISTIRA  ', '5', '888007546574', null, null, '2016-08-08', '0', '1KG', '33000', '25000', '-8000', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2077', 'WINDY WAHYUNI  ', '5', '888007546573', null, null, '2016-08-08', '0', '1KG', '25000', '25000', '0', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2078', 'AI ULFAH  ', '5', '888007546572', null, null, '2016-08-08', '0', '1KG', '7000', '7000', '0', '5', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2079', 'SIFA', '5', '888007546583', null, null, '2016-08-08', '0', '1KG', '7000', '', '', '5', '63', '2016-08-09', null);
INSERT INTO `kb_no_resi` VALUES ('2080', 'INDRA SURYAN', '3', '14782237163', null, null, '2016-08-09', '0', '1.117gr', '52350', '34000', '-18350', '3', '66', '2016-08-09', '2016-08-09');
INSERT INTO `kb_no_resi` VALUES ('2081', 'ATIK HASNA', '5', '888007546880', null, null, '2016-08-09', '0', '1KG', '43000', '', '', '3', '63', '2016-08-10', null);
INSERT INTO `kb_no_resi` VALUES ('2082', 'WANTIE', '5', '888007546878', null, null, '2016-08-09', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2083', 'ATI', '5', '888007546873', null, null, '2016-08-09', '0', '1KG', '7000', '9000', '2000', '3', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2084', 'ROSMINI', '5', '888007546874', null, null, '2016-08-09', '0', '2KG', '126000', '126000', '0', '3', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2086', 'SRI BUDI RAHAYU', '3', '888007546881', null, null, '2016-08-09', '0', '1KG', '19000', '38000', '19000', '3', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2088', 'ROSNAH  ', '5', '888007546879', null, null, '2016-08-09', '0', '2KG', '106000', '106000', '0', '3', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2089', 'LISTIAWATI', '5', '888007546875', null, null, '2016-08-09', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2090', 'MM. RAIHAN', '5', '888007546876', null, null, '2016-08-09', '0', '1KG', '14000', '14000', '0', '3', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2091', 'DEWI ( BUNDA KEMBAR )', '5', '888007546871', null, null, '2016-08-09', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2092', 'DEWI YULIZA', '5', '888007546872', null, null, '2016-08-09', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2093', 'WURNAYATI  ', '3', '888007546869', null, null, '2016-08-09', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2094', 'RENA CITRA ', '5', '888007546882', null, null, '2016-08-09', '0', '1KG', '9000', '9000', '0', '5', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2095', 'RITA MAULINA  ', '5', '888007546885', null, null, '2016-08-09', '0', '1KG', '20000', '20000', '0', '5', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2096', 'DIANA TRI RAHAYU  ', '5', '888007546884', null, null, '2016-08-09', '0', '1KG', '7000', '7000', '0', '5', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2097', 'USI ( NANANG ) ', '5', '888007546886', null, null, '2016-08-09', '0', '1KG', '16000', '16000', '0', '5', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2099', 'DIYA KRITIYANI  ', '5', '888007546887', null, null, '2016-08-09', '0', '1KG', '7000', '7000', '0', '5', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2101', 'IMAS MASRUROH  ', '5', '888007546888', null, null, '2016-08-09', '0', '1KG', '9000', '9000', '0', '5', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2102', 'NADIA  ', '5', '888007546870', null, null, '2016-08-09', '0', '1KG', '10000', '10000', '0', '5', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2103', 'NIA KURNIASIH  ', '5', '888007546883', null, null, '2016-08-09', '0', '1KG', '9000', '9000', '0', '5', '66', '2016-08-10', '2016-08-10');
INSERT INTO `kb_no_resi` VALUES ('2104', 'MEILINA NOFARA  ', '5', '888007546877', '0', null, '2016-08-09', '0', '1KG', '43000', '43000', '0', '5', '63', '2016-08-10', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2105', 'MBA INDAH RENO ', '1', 'BDOL902297920716', null, null, '2016-08-10', '0', '1KG', '36000', '36000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2106', 'JIHAN MARIA ULFA  ', '5', '888007531315', null, null, '2016-08-10', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2108', 'NURKHOLIS ', '5', '888007531317', null, null, '2016-08-10', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2109', 'SITI ZULAIHA  ', '5', '888007531316', null, null, '2016-08-10', '0', '1KG', '10000', '11000', '1000', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2110', 'ANGELIKA  ', '5', '888007531319', null, null, '2016-08-10', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2111', 'ARI GUNAWAN', '5', '888007531313', null, null, '2016-08-10', '0', '1KG', '46000', '46000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2112', 'JULIA ULFA ZUFRI  ', '5', '888007531314', null, null, '2016-08-10', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2113', 'SEPTI SURYANTINA', '5', '888007531311', null, null, '2016-08-10', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2114', 'WORO  ', '5', '888007531310', null, null, '2016-08-10', '0', '1KG', '10000', '11000', '1000', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2115', 'DEWA ', '5', '888007531312', null, null, '2016-08-10', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2116', 'YENI AULYANTI  ', '5', '888007531324', null, null, '2016-08-10', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2117', 'KESY SANUSI  ', '5', '888007531320', null, null, '2016-08-10', '0', '4KG', '188000', '235000', '47000', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2118', 'DEWI BUNDA KEMBAR  ', '5', '888007531322', null, null, '2016-08-10', '0', '5KG', '55000', '', '', '3', '63', '2016-08-11', null);
INSERT INTO `kb_no_resi` VALUES ('2119', 'GIAN BABY SHOP', '5', '888007531323', null, null, '2016-08-10', '0', '2KG', '56000', '52000', '-4000', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2120', 'SRI WAHYUNI', '5', '888007531318', null, null, '2016-08-10', '0', '1KG', '29000', '29000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2121', 'LISTIAWATI', '5', '888007531321', null, null, '2016-08-10', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2122', 'SRI WIDYASTUTI  ', '5', '888007531327', null, null, '2016-08-10', '0', '1KG', '28000', '28000', '0', '5', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2123', 'YULIYANTI  ', '5', '888007531328', null, null, '2016-08-10', '0', '1KG', '7000', '7000', '0', '5', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2124', 'WURNAYATI  ', '5', '888007531329', null, null, '2016-08-10', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2125', 'NUR TUT WAHYUNI  ', '5', '888007531330', null, null, '2016-08-10', '0', '1KG', '42000', '', '', '5', '63', '2016-08-11', null);
INSERT INTO `kb_no_resi` VALUES ('2126', 'SERI MURNI  ', '5', '888007531325', null, null, '2016-08-10', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2127', 'TYA SAMSURI  ', '5', '888007531326', null, null, '2016-08-10', '0', '1KG', '47000', '41000', '-6000', '5', '66', '2016-08-11', '2016-08-11');
INSERT INTO `kb_no_resi` VALUES ('2128', 'SRI BUDI RAHAYU', '5', ' 888007531718', null, null, '2016-08-11', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2129', 'EVA', '5', '888007531714', null, null, '2016-08-11', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2130', 'NIA / AENA MUHARIM', '5', '888007531712', null, null, '2016-08-11', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2131', 'SURTI RAHAYU', '5', '888007531713', null, null, '2016-08-11', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2132', 'SUSI ASHSHERA', '5', '888007531725', null, null, '2016-08-11', '0', '8KG', '80000', '80000', '0', '3', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2133', 'VERAWATI NENTO', '5', '888007531558', null, null, '2016-08-11', '0', '5KG', '240000', '240000', '0', '3', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2134', 'YOPIH', '5', '888007531711', null, null, '2016-08-11', '0', '2KG', '32000', '56000', '24000', '3', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2135', 'MAEMUNAH', '5', '888007531720', null, null, '2016-08-11', '0', '1KG', '11000', '11000', '0', '5', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2136', 'ROSPITASARI', '5', '888007531716', null, null, '2016-08-11', '0', '1KG', '9000', '9000', '0', '5', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2137', 'WINDA', '5', '888007531719', null, null, '2016-08-11', '0', '1KG', '7000', '7000', '0', '5', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2138', 'DEWI LESTARI', '5', '888007531721', null, null, '2016-08-11', '0', '1KG', '10000', '10000', '0', '5', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2139', 'ATIA  ', '5', '888007531717', null, null, '2016-08-11', '0', '1KG', '10000', '10000', '0', '5', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2140', 'WINA  ', '5', '888007531715', null, null, '2016-08-11', '0', '1KG', '9000', '9000', '0', '5', '66', '2016-08-12', '2016-08-12');
INSERT INTO `kb_no_resi` VALUES ('2141', 'MIRNA ', '5', '888007531674', null, null, '2016-08-12', '0', '1KG', '20000', '', '', '3', '63', '2016-08-13', null);
INSERT INTO `kb_no_resi` VALUES ('2142', 'LIA DAHLIA ', '5', '888007531688', null, null, '2016-08-12', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2143', 'NURKHOLIS IDRIS ', '5', '888007531686', null, null, '2016-08-12', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2144', 'ANIS ', '5', '888007531685', null, null, '2016-08-12', '0', '1KG', '16000', '13000', '-3000', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2145', 'IBU AUM ', '5', '888007531684', null, null, '2016-08-12', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2146', 'ERI ANISA PUTRI ', '5', '888007531687', null, null, '2016-08-12', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2147', 'ROSSA ROME NAJWA ', '5', '888007531683', null, null, '2016-08-12', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2148', 'YENI AULYANTI ', '5', ' 888007531682', null, null, '2016-08-12', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2149', 'MAHARANI EKA YARI ', '5', '888007531680', null, null, '2016-08-12', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2150', 'BUNDA HANA ', '3', '888007531679', null, null, '2016-08-12', '0', '1KG', '16000', '14000', '-2000', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2151', 'ROSWINARTI', '3', '15182407682', null, null, '2016-08-13', '0', '270gr', '20000', '24000', '4000', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2152', 'URI KARNAYA  ', '5', '15182407695', null, null, '2016-08-13', '0', '1195gr', '33700', '23000', '-10700', '3', '66', '2016-08-13', '2016-08-13');
INSERT INTO `kb_no_resi` VALUES ('2153', 'NINGSIH  ', '5', '888008666441', null, null, '2016-08-13', '0', '1KG', '11000', '22000', '11000', '3', '66', '2016-08-15', '2016-08-15');
INSERT INTO `kb_no_resi` VALUES ('2154', 'MUFLIHA  ', '5', '888008666440', null, null, '2016-08-13', '0', '1KG', '28000', '23000', '-5000', '3', '66', '2016-08-15', '2016-08-15');
INSERT INTO `kb_no_resi` VALUES ('2155', 'YENI YULIANI  ', '5', '888008666443', null, null, '2016-08-13', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-15', '2016-08-15');
INSERT INTO `kb_no_resi` VALUES ('2156', 'BPK. SUYANTO  ', '5', '888008666445', null, null, '2016-08-13', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-15', '2016-08-15');
INSERT INTO `kb_no_resi` VALUES ('2157', 'RIDHA RIZAL  ', '5', '888008666446', null, null, '2016-08-13', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-15', '2016-08-15');
INSERT INTO `kb_no_resi` VALUES ('2158', 'TOKO KAMIL  ', '5', '888008666439', null, null, '2016-08-13', '0', '3KG', '54000', '51000', '-3000', '3', '66', '2016-08-15', '2016-08-15');
INSERT INTO `kb_no_resi` VALUES ('2159', 'URIP SUMARTINAH  ', '5', '888008666444', null, null, '2016-08-13', '0', '2KG', '36000', '32000', '-4000', '3', '66', '2016-08-15', '2016-08-15');
INSERT INTO `kb_no_resi` VALUES ('2160', 'AMILIA', '5', '  888008666442', null, null, '2016-08-13', '0', '1KG', '22000', '22000', '0', '5', '66', '2016-08-15', '2016-08-15');
INSERT INTO `kb_no_resi` VALUES ('2161', 'TRI UTAMI ', '1', 'BDOL902308254016', null, null, '2016-08-15', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2162', 'SITI AMINAH', '1', ' BDOL902308244216', null, null, '2016-08-15', '0', '1KG', '35000', '35000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2163', 'ZAINUL TOYYIB ', '1', 'BDOL902308234416', null, null, '2016-08-15', '0', '1KG', '41000', '41000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2164', 'YUNITA ', '1', ' BDOL902308224616', '0', null, '2016-08-15', '0', '1KG', '24000', '24000', '0', '3', '63', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2165', ' ANGGIA MURNI ', '1', 'BDOL902308214816', null, null, '2016-08-15', '0', '4KG', '172000', '190000', '18000', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2166', 'MIRNA YUNIARTI ', '3', '15182408169', null, null, '2016-08-15', '0', '250GR', '23500', '36000', '12500', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2167', 'JIHAN MARIA ULFA ', '5', '888008666658', null, null, '2016-08-15', '0', '2KG', '44000', '44000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2168', 'DINI WULANSARI ', '5', '888008666659', null, null, '2016-08-15', '0', '2KG', '18000', '27000', '9000', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2170', 'ANDE YULIANTI ', '5', '888008666661', null, null, '2016-08-15', '0', '2KG', '36000', '36000', '0', '3', '66', '2016-08-16', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2171', 'MEILINA NOFASARI ', '5', '888008666448', null, null, '2016-08-15', '0', '2KG', '86000', '86000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2172', 'YULIANA PUSPITA AROEM ', '5', '888008666467', null, null, '2016-08-15', '0', '2KG', '44000', '', '', '3', '63', '2016-08-16', null);
INSERT INTO `kb_no_resi` VALUES ('2173', 'RINAWATI', '5', '888008666651', null, null, '2016-08-15', '0', '2KG', '92000', '138000', '46000', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2174', 'CUCU KUSNAWATI ', '5', '888008666652', null, null, '2016-08-15', '0', '3KG', '27000', '36000', '9000', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2175', 'LOLA DESTRIA', '5', ' 888008666450', null, null, '2016-08-15', '0', '3KG', '57000', '', '', '3', '63', '2016-08-16', null);
INSERT INTO `kb_no_resi` VALUES ('2176', 'YUSI YUGIARTI ', '5', '888008666461', null, null, '2016-08-15', '0', '1KG', '18000', '17000', '-1000', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2177', 'MISKIYAH', '5', '888008666460', null, null, '2016-08-15', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2178', 'INTANZ ', '5', '888008666459', null, null, '2016-08-15', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2179', 'DIAH EKA WATI ', '5', '888008666457', null, null, '2016-08-15', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2180', 'TEGUH IMAM MU ', '5', '888008666458', null, null, '2016-08-15', '0', '1KG', '11000', '', '', '3', '63', '2016-08-16', null);
INSERT INTO `kb_no_resi` VALUES ('2181', 'MALIKATIL BULQIS', '5', ' 888008666462', null, null, '2016-08-15', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2182', 'NENENG/FITRI ', '5', '888008666464', null, null, '2016-08-15', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2183', 'FITRI LESTARI ', '5', '888008666463', null, null, '2016-08-15', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2184', 'YOPHIE ', '5', '888008666465', null, null, '2016-08-15', '0', '1KG', '7000', '', '', '3', '63', '2016-08-16', null);
INSERT INTO `kb_no_resi` VALUES ('2185', 'DINE MERIYANTI ', '5', '888008666466', null, null, '2016-08-15', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2186', 'IVIN MERYTIAWATI ', '5', '888008666447', null, null, '2016-08-15', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2187', 'GIAN BABYSHOP ', '5', '888008666449', null, null, '2016-08-15', '0', '1KG', '28000', '25000', '-3000', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2188', 'ALMAIDAH ZANULI ', '5', '888008666653', null, null, '2016-08-15', '0', '1KG', '20000', '20000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2189', 'EDI KURNIAWAN ', '5', '888008666654', null, null, '2016-08-15', '0', '2KG', '36000', '36000', '0', '3', '66', '2016-08-16', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2190', 'VENNY YUDISTIRA ', '5', '888008666655', null, null, '2016-08-15', '0', '1KG', '33000', '', '', '3', '63', '2016-08-16', null);
INSERT INTO `kb_no_resi` VALUES ('2191', 'IKA KARTIKA ', '5', '888008666662', null, null, '2016-08-15', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2192', 'SRIYANTI ', '5', '888008666656', null, null, '2016-08-15', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2193', 'TRIANA PUJIHARYATI ', '5', '888008666657', null, null, '2016-08-15', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2194', 'CHOIRUDIN BAHRONI ', '5', '888008666660', null, null, '2016-08-15', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-16', '2016-08-16');
INSERT INTO `kb_no_resi` VALUES ('2195', ' SUSI ASHSERA', '1', ' BDOL902310555016', null, null, '2016-08-16', '0', '1KG', '15000', '15000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2196', 'DWI KARSIWI PENI ', '5', 'BDOL902311644516', null, null, '2016-08-16', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2197', 'WAHYUNI SAID, S KEEP', '1', ' BDOL9023118144316', null, null, '2016-08-16', '0', '1KG', '40000', '40000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2198', 'NURUL HUDA ', '3', '15182408601', '0', null, '2016-08-16', '0', '1960GR', '87080', '84000', '-3080', '3', '63', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2199', 'HENI SUCIATI ', '3', '15182408581', '0', null, '2016-08-16', '0', '935GR', '47320', '46000', '-1320', '3', '63', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2200', 'LAILA MUFARRIA ', '3', '15182408594', null, null, '2016-08-16', '0', '2205GR', '71390', '66000', '-5390', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2201', 'TUTTY NURFADILLAH ', '5', '888008666632', null, null, '2016-08-16', '0', '9KG', '90000', '100000', '10000', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2202', 'ANDE YULIANTI ', '5', '888008624146', null, null, '2016-08-16', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2203', 'INA MUTHMAINAH ', '3', '888008666633', null, null, '2016-08-16', '0', '1KG', '18000', '17000', '-1000', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2204', 'LIANAWATI ', '5', '888008666619', null, null, '2016-08-16', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2205', 'RENNI MARTADIRATNA ', '2', '888008666620', null, null, '2016-08-16', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2206', 'AYU NOVITASARI ', '5', '888008666621', null, null, '2016-08-16', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2207', 'DHINI WULAN YARI ', '5', '888008666618', null, null, '2016-08-16', '0', '4KG', '36000', '45000', '9000', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2208', 'RISKA YULIANTI ', '5', '888008666634', null, null, '2016-08-16', '0', '2KG', '18000', '18000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2209', 'RIDHO IMAM NAWAWI ', '5', '888008624129', null, null, '2016-08-16', '0', '3KG', '48000', '48000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2210', 'ITUT WIDYA ASTUTI', '5', ' 888008666617', null, null, '2016-08-16', '0', '5KG', '55000', '55000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2211', 'OBAY YUBARNA ', '5', '888008666635', null, null, '2016-08-16', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2212', 'IDA HAMIDAH  ', '5', '888008666636', null, null, '2016-08-16', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2213', 'FITRIANI  ', '5', '888008624128', null, null, '2016-08-16', '0', '1KG', '20000', '20000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2214', 'DEWI YULIZA  ', '5', '888008624127', null, null, '2016-08-16', '0', '2KG', '22000', '11000', '-11000', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2215', 'KHOIRUNISA  K  ', '3', '888008624130', null, null, '2016-08-16', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2216', 'BPK. SUKIYAT  ', '5', '888008624131', null, null, '2016-08-16', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2217', 'ZAKIYATUL MILDAH  ', '5', '888008624132', null, null, '2016-08-16', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2218', 'YOPIH  ', '5', '888008624133', null, null, '2016-08-16', '0', '1KG', '16000', '56000', '40000', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2219', 'REZKHA ', '5', '888008624134', null, null, '2016-08-16', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2220', 'YUNI FIRDA YANTI  ', '5', '888008624135', null, null, '2016-08-16', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2221', 'YENI AULYANTI  ', '5', '888008624136', null, null, '2016-08-16', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2222', 'BUTIK ADLYN  ', '5', '888008624137', null, null, '2016-08-16', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2223', ' IBU DHINI MEILANI  ', '5', '888008624138', null, null, '2016-08-16', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2224', 'SUNJAYA ', '5', '888008624139', null, null, '2016-08-16', '0', '1KG', '9000', '11000', '2000', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2226', 'BP. HADI  ', '5', '888008624140', null, null, '2016-08-16', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2227', 'TETI LISTIANA  ', '3', '888008624141', null, null, '2016-08-16', '0', '1KG', '9000', '11000', '2000', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2228', 'ELI SUNIAH ', '5', '888008624142', null, null, '2016-08-16', '0', '1KG', '10000', '11000', '1000', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2229', 'ALAM  ', '5', '888008624143', null, null, '2016-08-16', '0', '1KG', '26000', '26000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2230', 'RETNO  8', '5', '88008624144', null, null, '2016-08-16', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2231', 'RETNO WAHYUNI  ', '5', '888008624145', null, null, '2016-08-16', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2232', ' UCI  ', '5', '888007524339', null, null, '2016-08-16', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-18', '2016-08-18');
INSERT INTO `kb_no_resi` VALUES ('2233', 'YOSA TRISTIAMI  ', '5', '888008624676', null, null, '2016-08-18', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2235', 'NAELUR ROHMAH  ', '5', '888008624677', null, null, '2016-08-18', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2236', 'SRI WAHYUNI  ', '3', '888008624711', null, null, '2016-08-18', '0', '1KG', '29000', '29000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2237', 'PENNY  ', '5', '888008624709', null, null, '2016-08-18', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2238', 'INDAH KASYAH ', '5', ' 888008624704', null, null, '2016-08-18', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2239', 'NUR SRI PUSPANTI  ', '5', '888008624710', null, null, '2016-08-18', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2240', 'BUNDA HANA  ', '5', '888008624707', null, null, '2016-08-18', '0', '1KG', '13000', '14000', '1000', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2241', 'WORO  ', '5', '888008624708', null, null, '2016-08-18', '0', '1KG', '10000', '', '', '3', '63', '2016-08-19', null);
INSERT INTO `kb_no_resi` VALUES ('2242', 'MOTE RNDA  ', '5', '888008624706', null, null, '2016-08-18', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2243', 'LIA DAHLIA  ', '5', '888008624695', null, null, '2016-08-18', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2244', 'DIAH BUNDA F3  ', '5', '888008624694', null, null, '2016-08-18', '0', '2KG', '20000', '20000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2245', 'JIHAN MARIA ULFA  ', '5', '888008624705', null, null, '2016-08-18', '0', '2KG', '44000', '44000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2246', 'IBU TUM  ', '5', '888008624689', null, null, '2016-08-18', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2247', 'TOKO KAMIL  ', '5', '888008624703', null, null, '2016-08-18', '0', '1KG', '17000', '17000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2248', 'ITA ROSTATI  ', '3', '888008624702', null, null, '2016-08-18', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2249', 'TATAT RYALITA  ', '5', '888008624701', null, null, '2016-08-18', '0', '1KG', '9000', '18000', '9000', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2250', 'ERI ANISA  ', '5', '888008624698', null, null, '2016-08-18', '0', '1KG', '7000', '7000', '0', '0', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2251', 'DINE METRIYANTI  ', '5', '888008624697', null, null, '2016-08-18', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2252', 'NEVI FATIMAH  ', '5', '888008624690', null, null, '2016-08-18', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2253', 'LILA MAHDI  ', '5', '888008624700', null, null, '2016-08-18', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2254', 'BU KIKI  ', '5', '888008624699', null, null, '2016-08-18', '0', '1.117gr', '11000', '11000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2255', 'MAMA AMZAR  ', '5', '888008624678', null, null, '2016-08-18', '0', '1KG', '11000', '16000', '5000', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2256', 'IRMA NURMALA  ', '5', '888008624693', null, null, '2016-08-18', '0', '2KG', '22000', '11000', '-11000', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2257', 'IBU MULYONO  ', '5', '888008624692', null, null, '2016-08-18', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2258', 'GINA  ', '5', '888008624691', null, null, '2016-08-18', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2259', 'ANIS / ACHYAR  ', '5', '888008624674', null, null, '2016-08-18', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2260', 'DIAN KURNIASIH  ', '5', '888008624673', null, null, '2016-08-18', '0', '1KG', '32000', '32000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2261', 'RINAWATI NAIM  ', '5', '888008624675', null, null, '2016-08-18', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2262', 'AINUN NIKMAH ', '3', '15182409068', null, null, '2016-08-18', '0', '275gr', '20550', '25000', '4450', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2265', 'DWI KARSIWI PENI  ', '1', 'BDOL902314942216', null, null, '2016-08-18', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2266', 'ASPIANA  ', '3', '15182409071', null, null, '2016-08-18', '0', '1040gr', '54600', '33500', '-21100', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2267', 'BAIQ DESI LUTHFIANA  ', '1', 'BDOL902314962016', null, null, '2016-08-18', '0', '1KG', '32000', '32000', '0', '3', '66', '2016-08-19', '2016-08-19');
INSERT INTO `kb_no_resi` VALUES ('2268', 'NOVITA MERIYANTI  ', '3', '15182409464', null, null, '2016-08-19', '0', '905GR', '25650', '25000', '-650', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2269', 'TATAR WAHYUNI  ', '3', '15182409477', null, null, '2016-08-19', '0', '660gr', '65540', '64000', '-1540', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2270', 'URI KARNAYA  ', '3', '15182409480', null, null, '2016-08-19', '0', '1695gr', '44750', '46000', '1250', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2271', 'HERTIK S / KANTIN HEGAR  ', '1', 'BDOD505759549216', null, null, '2016-08-19', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2272', 'EDI SUSANTO  ', '1', 'BDOD505759539416', null, null, '2016-08-19', '0', '1KG', '28000', '22000', '-6000', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2273', 'FARAHJIHAN / BUANA MART  ', '1', 'BDOD505759529616', null, null, '2016-08-19', '0', '1KG', '42000', '33000', '-9000', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2274', 'RISNA HAKIM  ', '1', 'BDOD505759519816', null, null, '2016-08-19', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2275', 'ALAMSYAH ALI / CIPTA KARYA  ', '1', 'BDOD505759501016', null, null, '2016-08-19', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2276', 'NANIK ISYANI  ', '5', '888008538125', null, null, '2016-08-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2277', 'DEDE RUSTIAWATI  ', '5', '888008538135', null, null, '2016-08-19', '0', '1KG', '14000', '11000', '-3000', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2278', 'NOVI  ', '5', '888008538146', null, null, '2016-08-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2279', 'DIAN DWI  ', '5', '888008538145', null, null, '2016-08-19', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2280', 'AINUL USROTI  ', '5', '888008538147 ', null, null, '2016-08-19', '0', '2KG', '22000', '11000', '-11000', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2281', 'LIA MUFLIHA  ', '5', '888008538149', null, null, '2016-08-19', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2282', 'YUNI CHANDRA  ', '5', '888008538150', null, null, '2016-08-19', '0', '3KG', '66000', '88000', '22000', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2283', 'RAMA YANTI  ', '5', '888008538153', null, null, '2016-08-19', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2284', 'REGA / BPK AGUS  ', '5', '888008538127', null, null, '2016-08-19', '0', '1KG', '7000', '', '', '3', '63', '2016-08-20', null);
INSERT INTO `kb_no_resi` VALUES ('2285', 'ERNI  ', '5', '888008538142', null, null, '2016-08-19', '0', '1KG', '11000', '22000', '11000', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2286', 'TOKO YULI PALOM ', '5', ' 888008538140', null, null, '2016-08-19', '0', '1KG', '10000', '11000', '1000', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2287', ' ANI. H. YAKUP ', '5', ' 888008538137', null, null, '2016-08-19', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2288', 'MUTIQOTUL HIDAYATI  ', '5', '888008538136', null, null, '2016-08-19', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2289', 'JAJAT SUDRAJAT  ', '5', '888008538148', null, null, '2016-08-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2290', 'EL VANIA FITRIANA  ', '3', '888008538114', null, null, '2016-08-19', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2291', 'SITI KOMARIAH  ', '5', '888008538138', null, null, '2016-08-19', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2292', 'MAYA (PUSKESMAS MREBET) ', '5', '888008538126', null, null, '2016-08-19', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2293', 'PIPIT FITRIANA MUKTI  ', '5', '888008538133', null, null, '2016-08-19', '0', '1KG', '14000', '14000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2294', 'ETIEK YUNARWATI  ', '5', '888008538144', null, null, '2016-08-19', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2295', 'SENJAYANI  ', '5', '888008538143', null, null, '2016-08-19', '0', '1KG', '26000', '26000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2296', 'BUNDA DHIFA  ', '5', '888008538141', null, null, '2016-08-19', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2297', 'SITY ZULAEHA ', '5', '888008538139', '0', null, '2016-08-19', '0', '1KG', '12000', '11000', '-1000', '3', '63', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2299', 'PUTRI  ', '1', 'BDOL902320754016', null, null, '2016-08-20', '0', '1KG', '22000', '25000', '3000', '3', '66', '2016-08-20', '2016-08-22');
INSERT INTO `kb_no_resi` VALUES ('2300', 'BUDI GUTAMA  ', '5', '888008538621', null, null, '2016-08-20', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2301', 'MOCH. SIROJUDIN  ', '3', '888008538120', null, null, '2016-08-20', '0', '1KG', '33000', '47000', '14000', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2302', 'TIWI KUSTIWI  ', '5', '888008538121', null, null, '2016-08-20', '0', '1KG', '17000', '9000', '-8000', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2303', 'ENDAH SETIAWATI  ', '5', '888008538122', null, null, '2016-08-20', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2304', 'SRI WAHYUNI  ', '5', '888008538123', null, null, '2016-08-20', '0', '1KG', '47000', '36000', '-11000', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2305', 'ELIN  ', '5', '888008538124', null, null, '2016-08-20', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2306', 'ROHAENAH  ', '5', '888008538619', null, null, '2016-08-20', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2307', 'HIKMAWATI .SKM  ', '5', '888008538118', null, null, '2016-08-20', '0', '2KG', '94000', '94000', '0', '3', '66', '2016-08-22', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2308', 'BU LULU NASTITI  ', '5', '888008538620', null, null, '2016-08-20', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2309', 'IIS IRIANY  ', '5', '888008538622', null, null, '2016-08-20', '0', '1KG', '120000', '85000', '-35000', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2310', 'IBU ENI KASRINI  ', '5', '888008538712', null, null, '2016-08-20', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2311', 'YOSHIE APRIYANI  ', '5', '888008538115', null, null, '2016-08-20', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2312', 'WIDA NURUL AZIZAH  ', '5', '888008538618', null, null, '2016-08-20', '0', '1KG', '17000', '17000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2313', 'ENDAH PURBARINI  ', '5', '888008538151', null, null, '2016-08-20', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2314', 'YUSTIKA  ', '5', '888008538119', null, null, '2016-08-20', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2315', 'AGUSTINA WULANDARI  ', '5', '888008538152', null, null, '2016-08-20', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2316', 'NIA KUSMIATI  ', '5', '888008538154', null, null, '2016-08-20', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2317', 'RATNA JUWITA  ', '5', '888008538129', null, null, '2016-08-20', '0', '1KG', '20000', '20000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2318', 'YANTI ', '5', ' 888008538128', null, null, '2016-08-20', '0', '1KG', '17000', '11000', '-6000', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2319', 'LILIS FATIMAH  ', '5', '888008538130', null, null, '2016-08-20', '0', '1KG', '7000', '11000', '4000', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2320', 'YUNIARSIH  ', '5', '888008538131', null, null, '2016-08-20', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2321', 'SANTI NOVRILIANI  ', '5', '888008538116', null, null, '2016-08-20', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2322', 'KHOIRUNNISAK  ', '5', '888008538117', null, null, '2016-08-20', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-22', '2016-08-23');
INSERT INTO `kb_no_resi` VALUES ('2323', 'ISDA YULIANTI ', '3', '15182410198', null, null, '2016-08-22', '0', '1455GR', '42120', '50000', '7880', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2324', 'JOKO PRASETYO ', '1', 'BDOL902323175116', null, null, '2016-08-22', '0', '1KG', '20000', '20000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2325', 'DESY TRIANA ', '1', 'BDOL902323165316', null, null, '2016-08-22', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2326', 'HANIFAH  ', '5', '888008538632', null, null, '2016-08-22', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2327', 'NENI HARIYATI  ', '5', '888008538814', null, null, '2016-08-22', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2328', 'DINI WULANSARI  ', '5', '888008538808', null, null, '2016-08-22', '0', '2KG', '18000', '9000', '-9000', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2329', 'HJ. LENI MARLINA  ', '5', '888008538818', null, null, '2016-08-22', '0', '3KG', '57000', '60000', '3000', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2330', 'TOKO KAMIL  ', '5', '888008538631', null, null, '2016-08-22', '0', '1KG', '18000', '17000', '-1000', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2331', 'SRI WIDYA ASTUTI  ', '5', '888008538630', null, null, '2016-08-22', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2332', 'NANA  ', '5', '888008538811', null, null, '2016-08-22', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2333', 'DAMI SULASTRI  ', '5', '888008538629', null, null, '2016-08-22', '0', '1KG', '9000', '11000', '2000', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2334', 'RAHMAWATI  ', '5', '888008538628', null, null, '2016-08-22', '0', '1KG', '33000', '43000', '10000', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2335', 'LIA DAHLIA  ', '5', ' 888008538627', null, null, '2016-08-22', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2336', 'BIDAN MARLINA  ', '5', '888008538817', null, null, '2016-08-22', '0', '2KG', '14000', '14000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2337', 'DEWI BUNDA KEMBAR  ', '5', '888008538816', null, null, '2016-08-22', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2338', 'TITA APRILIANI  ', '5', '888008538815', null, null, '2016-08-22', '0', '2KG', '18000', '', '', '3', '63', '2016-08-24', null);
INSERT INTO `kb_no_resi` VALUES ('2339', 'MERYADI PRIYASTI  ', '5', '888008538813', null, null, '2016-08-22', '0', '1KG', '19000', '', '', '3', '63', '2016-08-24', null);
INSERT INTO `kb_no_resi` VALUES ('2340', 'LULUS PUTRA  ', '5', '888008538812', null, null, '2016-08-22', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2341', 'DIAN HERDIANA  ', '5', '888008538810', null, null, '2016-08-22', '0', '1KG', '9000', '', '', '3', '63', '2016-08-24', null);
INSERT INTO `kb_no_resi` VALUES ('2342', 'RETNO. W  ', '5', '888008538637', null, null, '2016-08-22', '0', '1KG', '33000', '', '', '3', '63', '2016-08-24', null);
INSERT INTO `kb_no_resi` VALUES ('2343', 'LINDA KARTIKA  ', '5', '888008538639', null, null, '2016-08-22', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2344', 'IBU PIPIT  ', '5', '888008538640', '0', null, '2016-08-22', '0', '1KG', '16000', '16000', '0', '3', '63', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2345', 'YULIAWATI  ', '5', '888008538807', null, null, '2016-08-22', '0', '1KG', '11000', '', '', '3', '63', '2016-08-24', null);
INSERT INTO `kb_no_resi` VALUES ('2346', 'MAI YANTI  ', '5', '888008538638', null, null, '2016-08-22', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2347', 'RISNAWATI  ', '5', '888008538635', null, null, '2016-08-22', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2348', 'TOKO ANTI MAHAL  ', '5', '888008538636', null, null, '2016-08-22', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2349', 'NY. SANTOSO  ', '5', '888008538634', null, null, '2016-08-22', '0', '1KG', '55000', '45000', '-10000', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2350', 'NURHASANAH  ', '5', '888008538633', null, null, '2016-08-22', '0', '1KG', '11000', '', '', '3', '63', '2016-08-24', null);
INSERT INTO `kb_no_resi` VALUES ('2351', 'FAKHRUDIN HARIS  ', '5', '888008538809', null, null, '2016-08-22', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2352', 'AMALIA HARISMAN  ', '5', '888008538819', null, null, '2016-08-22', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2353', 'FATMI  ', '5', '888008538821', null, null, '2016-08-22', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2354', 'NENG YANTI NOVIANTI  ', '5', '888008538820', '0', null, '2016-08-22', '0', '1KG', '9000', '9000', '0', '3', '63', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2355', 'UCI ', '5', ' 888008538822', null, null, '2016-08-22', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2356', 'BAIQ DESI  ', '1', 'BDOL902326273816', null, null, '2016-08-23', '0', '1KG', '32000', '32000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2357', 'FITRIANI ', '3', '15182410747', null, null, '2016-08-23', '0', '490gr', '19490', '23000', '3510', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2359', 'PURWANI  ', '3', '15182410776', null, null, '2016-08-23', '0', '6825gr', '45655', '41915', '-3740', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2360', 'DR. ERNI AISYAH  ', '3', '15182410750', null, null, '2016-08-23', '0', '1220gr', '65420', '84000', '18580', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2361', 'HARIYANTO  ', '5', '888008640477', null, null, '2016-08-23', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2362', 'TOKO YULI PALOM  ', '5', '888008640475', null, null, '2016-08-23', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2363', 'RINAWATI  ', '5', '888008640474', null, null, '2016-08-23', '0', '2KG', '92000', '92000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2364', 'RINA  ', '5', '888008640473', null, null, '2016-08-23', '0', '4KG', '28000', '28000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2365', 'FRANSISCA ', '5', '888008640472', null, null, '2016-08-23', '0', '3KG', '138000', '92000', '-46000', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2366', 'ANDIA  ', '5', '888008640470', null, null, '2016-08-23', '0', '2KG', '66000', '66000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2367', 'BU AGUNG  ', '5', '888008640469', null, null, '2016-08-23', '0', '2KG', '44000', '44000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2368', 'DEWI CATUR  ', '5', '888008640490', null, null, '2016-08-23', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2369', 'NURHASANAH  ', '5', '888008640488', null, null, '2016-08-23', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2370', 'SUMRA SUHAEMI  ', '5', '888008640487', null, null, '2016-08-23', '0', '1KG', '37000', '37000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2371', 'WIENDRA  RINI  ', '5', '888008640486', null, null, '2016-08-23', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2372', 'DANIYAL HUMAIDI  ', '5', '888008640485', null, null, '2016-08-23', '0', '1KG', '47000', '33000', '-14000', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2373', 'TRI ROHMIYATI  ', '5', '888008640484', null, null, '2016-08-23', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2374', 'DELIS NURAHMAN  ', '5', '888008640483', null, null, '2016-08-23', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2375', ' YANTI  ', '5', '888008640482', null, null, '2016-08-23', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2376', 'MISKIYAH  ', '5', '888008640481', null, null, '2016-08-23', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2377', 'JIHAN MARIA  ', '5', '888008640480', null, null, '2016-08-23', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2378', 'MEILINA  ', '5', '888008640478', null, null, '2016-08-23', '0', '1KG', '43000', '43000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2379', 'NURBAETY  ', '5', '888008640476', null, null, '2016-08-23', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2380', 'DEWA  ', '5', '888008640468', null, null, '2016-08-23', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2381', 'LIANAWATI ', '5', '888008640467', null, null, '2016-08-23', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2382', 'ISNIA AYUHANA  ', '5', '888008640507', null, null, '2016-08-23', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2383', 'NANA  ', '5', '888008640508', null, null, '2016-08-23', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2384', 'ANGGRAINI  ', '5', '888008640510', null, null, '2016-08-23', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2385', 'DINI WULANSARI  ', '5', '888008640511', null, null, '2016-08-23', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2386', 'BPK. SUGENG  ', '5', '888008640513', null, null, '2016-08-23', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2387', 'EDI KURNIAWAN  ', '5', '888008640515', null, null, '2016-08-23', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2388', 'NURI ', '5', '888008640516', null, null, '2016-08-23', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2389', 'CHOIR EXPRESS ', '5', '888008640491', null, null, '2016-08-23', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2390', 'NURUL LATIFAH  ', '5', '888008640504', null, null, '2016-08-23', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2391', 'RISMASARI  ', '5', '888008640503', null, null, '2016-08-23', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2392', 'WINA. R  ', '5', '888008640501', null, null, '2016-08-23', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2393', 'DEDEH / OKTA  ', '5', '888008640500', null, null, '2016-08-23', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2394', 'LISTIAWATI  ', '5', '888008640506', null, null, '2016-08-23', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2395', 'DEWI YULIZA  ', '5', '888008640505', null, null, '2016-08-23', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2396', 'YANTI  ', '5', '888008640559', null, null, '2016-08-23', '0', '1KG', '17000', '22000', '5000', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2397', 'LINDA INDRIANI  ', '5', '888008640558', null, null, '2016-08-23', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2398', 'NUNIK FAUZI  ', '5', '888008640557', null, null, '2016-08-23', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2399', 'IBU NINING  ', '5', '888008640560', null, null, '2016-08-23', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2400', 'RESA NOVIANI  ', '5', '888008640489', null, null, '2016-08-23', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-24', '2016-08-24');
INSERT INTO `kb_no_resi` VALUES ('2401', 'YUNI CHANDRA  ', '5', '888008640156', null, null, '2016-08-24', '0', '2KG', '44000', '66000', '22000', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2402', 'MIRNAWATI  ', '5', '888008640148', null, null, '2016-08-24', '0', '2KG', '154000', '132000', '-22000', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2403', 'ARNI ASNINA  ', '5', '888008640166', null, null, '2016-08-24', '0', '4KG', '132000', '84000', '-48000', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2404', 'EVA KUSUMAWATI  ', '3', '888008640159', null, null, '2016-08-24', '0', '3KG', '54000', '36000', '-18000', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2405', 'BUNDA HANA  ', '5', '888008640164', null, null, '2016-08-24', '0', '2KG', '28000', '14000', '-14000', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2406', 'NURMINATUL ASYIAH  ', '5', '888008640168', null, null, '2016-08-24', '0', '1KG', '13000', '13000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2407', 'RINA ANISAH  ', '5', '888008640158', null, null, '2016-08-24', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2408', 'NOVI RIAN SARI  ', '3', '888008640147', null, null, '2016-08-24', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2409', 'PENNY  ', '5', '888008640146', null, null, '2016-08-24', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2410', 'RINDA DANIEL  ', '5', '888008640145', null, null, '2016-08-24', '0', '1.117gr', '18000', '18000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2411', 'LISTIAWATI  ', '5', '888008640144', null, null, '2016-08-24', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2412', 'DWI JAYANI  ', '5', '888008640149', null, null, '2016-08-24', '0', '1KG', '17000', '17000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2413', 'IBU ENI KUSRINI  ', '5', '888008640152', null, null, '2016-08-24', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2414', 'IBU VIVI  ', '5', '888008640194', null, null, '2016-08-24', '0', '10KG', '260000', '286000', '26000', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2415', 'DEVI IMALIA  ', '3', '888008640153', null, null, '2016-08-24', '0', '5KG', '45000', '45000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2416', 'BPK. SUGENG  ', '5', '888008640151', null, null, '2016-08-24', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2417', 'NURHASANAH  ', '5', '888008640160', null, null, '2016-08-24', '0', '1KG', '11000', '10000', '-1000', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2418', 'RIANTI WIDIA SARI  ', '5', '888008640154', null, null, '2016-08-24', '0', '1KG', '42000', '42000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2419', 'ERNI  ', '5', '888008640155', null, null, '2016-08-24', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2420', 'RUMAH VINA  ', '5', '888008640165', null, null, '2016-08-24', '0', '1KG', '19000', '22000', '3000', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2421', 'ANI. H . H YAKUP  ', '5', '888008640169', null, null, '2016-08-24', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2422', 'TOKO YULI PALOM  ', '3', '888008640172', null, null, '2016-08-24', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2423', 'IBU EINDY  ', '5', '888008640161', null, null, '2016-08-24', '0', '1KG', '30000', '30000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2424', 'DINI WULANSARI  ', '3', '888008640173', null, null, '2016-08-24', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2425', 'DEWI YULIZA  ', '5', '888008640174', '0', null, '2016-08-24', '0', '1KG', '11000', '11000', '0', '3', '63', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2426', 'REZA UMI NURJANAH  ', '5', '888008640167', null, null, '2016-08-24', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2427', 'ROSMIATI  ', '5', '888008640163', null, null, '2016-08-24', '0', '1KG', '50000', '33000', '-17000', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2428', 'AFIFATUL KARIMAH  ', '5', '888008640171', null, null, '2016-08-24', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2429', 'SUMIRAH ', '3', '888008640162', null, null, '2016-08-24', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2430', 'ALVINA YANUARITA  ', '5', '888008640150', null, null, '2016-08-24', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2431', 'ASNA ASNADA ', '3', '15182411266', null, null, '2016-08-24', '0', '345GR', '19160', '23000', '3840', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2432', 'FITRI AMELIA ', '3', '15182411279', null, null, '2016-08-24', '0', '1675GR', '42200', '40000', '-2200', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2433', 'MELIYA INDRI SARI ', '3', '15182411282', null, null, '2016-08-24', '0', '1000GR', '66550', '65000', '-1550', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2434', 'NAMIRA ', '3', '15182411295', null, null, '2016-08-24', '0', '2630GR', '80340', '78000', '-2340', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2435', 'INDAH NOOR K ', '1', 'BDOL902329352916', null, null, '2016-08-24', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2436', 'NUR LAELA AMIR ', '1', 'BDOL902329343116', null, null, '2016-08-24', '0', '1KG', '87000', '87000', '0', '3', '66', '2016-08-25', '2016-08-25');
INSERT INTO `kb_no_resi` VALUES ('2437', 'DIAN HERDIANA  ', '5', '888008640914', null, null, '2016-08-25', '0', '1KG', '9000', '11000', '2000', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2438', 'THURMUDI / YANA KAWI  ', '1', 'BDOL902331804116', '0', null, '2016-08-25', '0', '4KG', '112000', '112000', '0', '3', '63', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2439', 'INA MUTHMAINAH  ', '1', 'BDOL902331792716', '0', null, '2016-08-25', '0', '1KG', '17000', '17000', '0', '3', '63', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2440', ' TOKO HALIKA / GAPUR  ', '3', '15182411740', null, null, '2016-08-25', '0', '725gr', '25660', '25000', '-660', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2441', 'MIEDA  ', '3', '15182411711', null, null, '2016-08-25', '0', '2740gr', '37860', '50000', '12140', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2442', 'WIENA  ', '3', '15182411724', null, null, '2016-08-25', '0', '4675gr', '199820', '190000', '-9820', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2443', 'NILDA EFRAYANI  ', '5', '888008640900', null, null, '2016-08-25', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2444', 'NANDALIA  ', '5', '888008640904', null, null, '2016-08-25', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2445', 'DESI FUJASWATI  ', '5', '888008640899', null, null, '2016-08-25', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2446', 'IBU NINING  ', '5', '888008640901', null, null, '2016-08-25', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2447', 'MUTHIYA RAYHANA  ', '5', '888008640908', null, null, '2016-08-25', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2448', 'TRIAWATI  ', '5', '888008640902', null, null, '2016-08-25', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2449', 'NOVIA SANTIA DEWI  ', '5', '888008640894', null, null, '2016-08-25', '0', '1KG', '32000', '32000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2450', 'SUNDARI  ', '5', '888008640923', null, null, '2016-08-25', '0', '1KG', '28000', '22000', '-6000', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2451', 'ANNA MUTHIYA  ', '5', '888008640897', null, null, '2016-08-25', '0', '1KG', '10000', '9000', '-1000', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2452', 'IBU IROS  ', '5', '888008640896', null, null, '2016-08-25', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2453', 'AAN SRI MULYATI  ', '5', '888008640898', null, null, '2016-08-25', '0', '6KG', '66000', '55000', '-11000', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2454', 'LILIK ISMAWATI  ', '5', '888008640910', null, null, '2016-08-25', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2455', 'NURJUMARIAH  ', '5', '888008640907', null, null, '2016-08-25', '0', '1KG', '55000', '55000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2456', 'YOSI INDARTI  ', '5', '888008640909', null, null, '2016-08-25', '0', '1KG', '24000', '24000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2457', 'TUTIK FITRIANI  ', '5', '888008640912', null, null, '2016-08-25', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2458', 'ANI. H. H YAKUP  ', '5', '888008640911', null, null, '2016-08-25', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2459', 'DIANA PURBASARI  ', '5', '888008640913', null, null, '2016-08-25', '0', '1KG', '20000', '20000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2460', 'NI\'MATUL BADRIYAH  ', '5', '888008640916', null, null, '2016-08-25', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2461', 'MIRZA  ', '5', '888008640915', null, null, '2016-08-25', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2462', 'MAYA SARI  ', '5', '888008640917', null, null, '2016-08-25', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2463', 'MARISA DEWI OKTAVIANI  ', '5', '888008640918', null, null, '2016-08-25', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2464', 'DIAN BUNDA F3 ', '5', '888008640920', null, null, '2016-08-25', '0', '1KG', '11000', '10000', '-1000', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2465', 'SRI UTAMI  ', '5', '888008640921', null, null, '2016-08-25', '0', '1KG', '33000', '', '', '3', '63', '2016-08-26', null);
INSERT INTO `kb_no_resi` VALUES ('2466', 'DEWA  ', '5', '888008640919', null, null, '2016-08-25', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2467', 'ISMADIAR  ', '5', '888008640922', null, null, '2016-08-25', '0', '1KG', '11000', '', '', '3', '63', '2016-08-26', null);
INSERT INTO `kb_no_resi` VALUES ('2468', 'AULIA YAMIN  ', '5', '888008640924', null, null, '2016-08-25', '0', '1KG', '26000', '', '', '3', '63', '2016-08-26', null);
INSERT INTO `kb_no_resi` VALUES ('2469', ' IBU IMAROH  ', '5', '888008640925', null, null, '2016-08-25', '0', '1KG', '11000', '10000', '-1000', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2470', 'INDIKA AFINI  ', '5', '888008640926', null, null, '2016-08-25', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2471', 'ZAKIAH  ', '5', '888008640906', null, null, '2016-08-25', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2472', 'UST. AMRULLOH  ', '5', '888008640903', null, null, '2016-08-25', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2473', 'TUTI ISNA ', '5', '888008640905', null, null, '2016-08-25', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-26', '2016-08-26');
INSERT INTO `kb_no_resi` VALUES ('2474', 'TATAR WAHYUNI  ', '3', '15182412136', null, null, '2016-08-26', '0', '205gr', '42550', '32000', '-10550', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2475', 'LILLA  ', '1', 'BDOC105500573116', null, null, '2016-08-26', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2476', 'HERTIK SUHERTIKA  ', '1', 'BDOC105500563316', null, null, '2016-08-26', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2478', 'BPK. KWARTON  ', '5', '888008640875', null, null, '2016-08-26', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2479', 'MINTARSIH  ', '5', '888008640873', null, null, '2016-08-26', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2480', 'IKA DENNY  ', '5', '888008640870', null, null, '2016-08-26', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2481', 'JAJAT SUDRAJAT  ', '5', '888008640523', null, null, '2016-08-26', '0', '6KG', '66000', '66000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2482', 'ARIE FEBRIANTI  ', '5', '888008620526', null, null, '2016-08-26', '0', '1KG', '11000', '10000', '-1000', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2483', 'YESSI OKTAVIANI  ', '5', '888008620522', null, null, '2016-08-26', '0', '1KG', '10000', '11000', '1000', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2484', 'YUANITA NASUTION  ', '5', '888008620525', null, null, '2016-08-26', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2485', 'LENI MARNI  ', '5', '888008620521', null, null, '2016-08-26', '0', '1KG', '42000', '42000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2486', 'SITI ANISA  ', '5', '888008640895', null, null, '2016-08-26', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2487', 'HANA  ', '5', '888008640893', null, null, '2016-08-26', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2488', 'LISA  ', '5', '888008640892', null, null, '2016-08-25', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2489', 'NOVIA HIKMAH  ', '5', '888008640890', null, null, '2016-08-26', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2490', 'INDAH SETYAWATI  ', '5', '888008640891', null, null, '2016-08-26', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2491', 'RIDHO IMAM NAWAWI  ', '5', '888008640889', null, null, '2016-08-26', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2492', 'MAYA NURMAYANTI  ', '5', '888008640887', null, null, '2016-08-26', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2493', 'HERLINDA  ', '3', '888008620520', null, null, '2016-08-26', '0', '2KG', '64000', '64000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2494', 'BUNDA PUTRI  ', '5', '888008640886', null, null, '2016-08-26', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2495', 'ISNANI  ', '5', '888008640869', null, null, '2016-08-26', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2496', ' JUMAATIN ', '5', ' 888008620524', null, null, '2016-08-26', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2498', 'RISSA FAISAL  ', '5', '888008640888', null, null, '2016-08-26', '0', '3KG', '21000', '21000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2499', 'BD. ELLA NURLELA  ', '5', '888008640885', null, null, '2016-08-26', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2500', 'RITA  ', '5', '888008640884', null, null, '2016-08-26', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2501', 'BUNDA HANA  ', '5', '888008640882', null, null, '2016-08-26', '0', '1KG', '13000', '14000', '1000', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2502', 'MUTIA  ', '5', '888008640881', null, null, '2016-08-26', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2503', 'ROSMINI  ', '3', '888008640883', null, null, '2016-08-26', '0', '2KG', '126000', '126000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2504', 'LISTIAWATI  ', '5', '888008640880', null, null, '2016-08-26', '0', '2KG', '11000', '11000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2505', 'FENY / MAMAH DAFA  ', '5', '888008640879', null, null, '2016-08-26', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2506', 'NUNUNG DAMA  ', '5', '888008640878', null, null, '2016-08-26', '0', '1KG', '41000', '41000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2507', 'FARIDA WIDYA WATI  ', '5', '888008640877', null, null, '2016-08-26', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2508', 'KHODIJAH  ', '5', '888008640876', null, null, '2016-08-26', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2509', 'A. ST DJUMHARIJAH (BU RIA )  ', '5', '888008620519', null, null, '2016-08-26', '0', '1KG', '26000', '26000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2510', 'ELY  ', '5', '888008640874', null, null, '2016-08-26', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2511', 'WIWIK IRAWATI  ', '5', '888008640871', null, null, '2016-08-26', '0', '1KG', '36000', '36000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2512', 'WAHYUNINGSIH MULYANI  ', '5', '888008640872', null, null, '2016-08-26', '0', '1KG', '17000', '17000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2513', 'GALUH ZEVA / M. MAHFUDZ ', '2', '030041827780', null, null, '2016-08-26', '0', '1KG', '38000', '38000', '0', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2514', 'NURAINI / MUHAMMAD FAJAR  ', '1', 'BDOC105501115616', null, null, '2016-08-26', '0', '1KG', '63000', '59000', '-4000', '3', '66', '2016-08-27', '2016-08-27');
INSERT INTO `kb_no_resi` VALUES ('2515', 'MAMA LARAS  ', '5', '888008620679', null, null, '2016-08-27', '0', '1KG', '14000', '14000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2516', 'TOKO YULI PALOM ', '5', '888008620662', null, null, '2016-08-27', '0', '6KG', '66000', '55000', '-11000', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2517', 'BP. ISMET NURDIN ', '5', '888008620680', null, null, '2016-08-27', '0', '1KG', '12000', '12000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2518', 'INGGIT ', '5', '888008620668', null, null, '2016-08-27', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2519', 'TRIYANA RISDIANTO ', '5', '888008620672', null, null, '2016-08-27', '0', '1KG', '12000', '11000', '-1000', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2520', 'MILA SANTI ', '5', '888008620676', null, null, '2016-08-27', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2522', 'DESI  ', '5', '888008620681', null, null, '2016-08-27', '0', '1KG', '11000', '', '', '3', '63', '2016-08-29', null);
INSERT INTO `kb_no_resi` VALUES ('2523', 'DINA ROSDIANA ', '5', '888008620665', null, null, '2016-08-27', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2524', 'HENDRIK PRASETYA ', '5', '888008620669', null, null, '2016-08-27', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2525', 'ELA (A\'OZON) ', '5', '888008620673', null, null, '2016-08-27', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2526', 'HIKMAWATI ', '5', '888008620677', null, null, '2016-08-27', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2527', 'NURHASANAH ', '5', '888008620664', null, null, '2016-08-27', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2528', 'DIAH', '5', '888008620700', null, null, '2016-08-27', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2529', 'RATNA/NIZAM ', '5', '888008620684', null, null, '2016-08-27', '0', '1KG', '10000', '', '', '3', '63', '2016-08-29', null);
INSERT INTO `kb_no_resi` VALUES ('2530', 'NENI HARIYANTI ', '5', '888008620682', null, null, '2016-08-27', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2531', 'SEPTI SETYANINGRUM ', '5', '888008620670', null, null, '2016-08-27', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2532', 'TOKO KAMIL ', '5', '888008620666', null, null, '2016-08-27', '0', '1KG', '18000', '17000', '-1000', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2533', 'ROSIDIN  ', '5', '888008620678', null, null, '2016-08-27', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2534', 'DEWI', '5', '888008620683', null, null, '2016-08-27', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2535', 'JIHAN MARIA ULFA ', '5', '888008620674', null, null, '2016-08-27', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2536', 'DEVI DIANTI ', '5', '888008620667', null, null, '2016-08-27', '0', '1KG', '47000', '24000', '-23000', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2537', 'MAHARANI EKA SARI ', '5', '888008620671', null, null, '2016-08-27', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2538', 'NINA', '5', '888008620675', null, null, '2016-08-27', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2539', 'DINI WULANSARI ', '5', '888008620663', null, null, '2016-08-27', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2540', 'ALFIATI  ', '2', '030041827821', null, null, '2016-08-29', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2541', 'SRI BULAN  ', '3', '15182412714', null, null, '2016-08-29', '0', '650gr', '36490', '35500', '-990', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2542', 'MIEDA ', '3', '15182412727', null, null, '2016-08-29', '0', '4265GR', '63030', '45000', '-18030', '3', '66', '2016-08-29', '2016-08-29');
INSERT INTO `kb_no_resi` VALUES ('2543', 'ELIS SHOLIKAH KUSUMA', '5', '888008620661', null, null, '2016-08-29', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2544', 'IKA KUSUMAWATI', '5', '888008644028', null, null, '2016-08-29', '0', '1KG', '12000', '12000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2545', 'GIAN BABY SHOP ', '5', '888008644030', null, null, '2016-08-29', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2546', 'EVA SETYANINGSIH', '5', '888008644013', null, null, '2016-08-29', '0', '2KG', '14000', '14000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2547', 'SELLY RIZTASARI  ', '5', '888008644017', null, null, '2016-08-29', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2548', 'ANI. H . H. YAKUP  ', '5', '888008644021', null, null, '2016-08-29', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2549', 'RISSA FAISAL M  ', '5', '888008644029', '0', null, '2016-08-29', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2550', 'MEILINA  ', '5', '888008620959', null, null, '2016-08-29', '0', '1KG', '43000', '43000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2551', 'KESY SANUSI  ', '5', '888008644009', null, null, '2016-08-29', '0', '1KG', '47000', '94000', '47000', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2552', 'SUSTER RESTU AZIZAH  ', '5', '888008644025', null, null, '2016-08-29', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2553', 'WIDYANINGSIH  ', '5', '888008644010', '0', null, '2016-08-29', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2554', 'MIRZA  ', '5', '888008644007', null, null, '2016-08-29', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2555', 'NUR RAHMI LIANI  ', '5', '888008644015', null, null, '2016-08-29', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2556', 'HAYATI  ', '5', '888008644018', null, null, '2016-08-29', '0', '1KG', '20000', '25000', '5000', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2557', 'YUANITA  ', '5', '888008644022', null, null, '2016-08-29', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2558', 'SUSINITA ', '5', '888008620699', null, null, '2016-08-29', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2559', 'IZA ', '5', '888008644026', null, null, '2016-08-29', '0', '1KG', '12000', '11000', '-1000', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2560', 'PUTRI AULIA  ', '5', '888008644008', null, null, '2016-08-29', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2561', 'IBU MULYONO  ', '5', '888008644004', null, null, '2016-08-29', '0', '1KG', '22000', '19000', '-3000', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2562', 'LAILA MUFARRIHA  ', '5', '888008644012', null, null, '2016-08-29', '0', '1KG', '28000', '22000', '-6000', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2563', 'HJ. ILA  ', '5', '888008644016', null, null, '2016-08-29', '0', '1KG', '26000', '26000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2564', 'BU HARAHAP  ', '5', '888008644024', null, null, '2016-08-29', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2565', 'LISTIAWATI  ', '5', '888008644020', null, null, '2016-08-29', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-30', '2016-08-30');
INSERT INTO `kb_no_resi` VALUES ('2566', 'SYAHIDAN MUNAWIR SAJALI ', '1', 'BDOL902339999516', null, null, '2016-08-30', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2567', 'TANUSI  ', '1', 'BDOL902339989716', null, null, '2016-08-30', '0', '1KG', '17000', '17000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2568', 'KAK NICKMA  ', '3', '15182413080', null, null, '2016-08-30', '0', '790gr', '23430', '22000', '-1430', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2569', 'LINA KARTINI  ', '1', 'BDOC105502154516', '0', null, '2016-08-30', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2570', 'WAHYU TYAS CAHYANINGRUM  ', '1', 'BDOC105502134916', null, null, '2016-08-30', '0', '1KG', '24000', '19000', '-5000', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2571', 'IBU NUR WAHYU SETYANINGSIH  ', '1', 'BDOC105502144716', null, null, '2016-08-30', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2572', 'LIA DAHLIA ', '5', '888008621000', null, null, '2016-08-30', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2573', 'IBU IMAROH ', '5', '888008644398', null, null, '2016-08-30', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2574', 'INDAH KASYAH ', '5', '888008644397', null, null, '2016-08-30', '0', '1KG', '10000', '10000                                                                                                                                                                                                   ', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2575', 'ROSMIATI ', '5', '888008644385', null, null, '2016-08-30', '0', '1KG', '50000', '50000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2576', 'ERNI  ', '5', '888008644382', null, null, '2016-08-30', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2577', 'SITI MALIHATUN  ', '5', '888008644386', null, null, '2016-08-30', '0', '2KG', '32000', '32000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2578', 'WIWIN ', '5', '888008644396', null, null, '2016-08-30', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2579', 'VIVI DAMAYANTI ', '5', '888008644388', null, null, '2016-08-30', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2580', 'DINI WULAN SARI ', '5', '888008644383', null, null, '2016-08-30', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2581', 'NURHIKMAH ', '5', '888008644394', null, null, '2016-08-30', '0', '1KG', '41000', '41000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2582', 'YENI AULYANTI  ', '5', '888008644387', null, null, '2016-08-30', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2583', 'AMALIA KUSUMANINGRUM ', '5', '888008644395', null, null, '2016-08-30', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2584', 'MERYADI PRIYASTI RAHMA ', '5', '888008620998', null, null, '2016-08-30', '0', '1KG', '19000', '19000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2585', 'TUTY NUR FADILAH ', '5', '888008620997', null, null, '2016-08-30', '0', '1KG', '60000', '70000', '10000', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2586', 'SITI MUKARROMAH ', '5', '888008620999', null, null, '2016-08-30', '0', '1KG', '18000', '20000', '2000', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2587', 'TANTI PRIATININGSIH ', '5', '888008644379', null, null, '2016-08-30', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2588', 'HIKMAH ', '5', '888008644389', null, null, '2016-08-30', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2589', 'PUTRI AULIA W ', '5', '888008644393', null, null, '2016-08-30', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2590', 'BEDA MUFKARATI ', '5', '888008644380', null, null, '2016-08-30', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2591', 'YUNIARSIH ', '5', '888008644390', null, null, '2016-08-30', '0', '1KG', '20000', '25000', '5000', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2592', 'SRI WIDYASTUTI ', '5', '888008644381', null, null, '2016-08-30', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2593', 'BU AGUNG ', '5', '888008644384', null, null, '2016-08-30', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2594', 'DEWA  ', '5', '888008644392', null, null, '2016-08-30', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2595', 'NURHASANAH ', '5', '888008644391', null, null, '2016-08-30', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2596', 'JUMAATIN ', '5', '888008620995', null, null, '2016-08-30', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-08-31', '2016-08-31');
INSERT INTO `kb_no_resi` VALUES ('2597', 'AHMAD ROZALI  ', '1', 'BDOL902345482716', null, null, '2016-08-31', '0', '4KG', '68000', '68000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2598', 'AHMAD NUTUL ARIFIN  ', '1', 'BDOL902345463116', null, null, '2016-08-31', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2599', 'BPK. SUKANDAR  ', '1', 'BDOL902345453316', null, null, '2016-08-31', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2600', 'DWI KARSIWI PENI  ', '1', 'BDOL902345472916', null, null, '2016-08-31', '0', '1KG', '22000', '19000', '-3000', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2601', 'MASNAH  ', '5', '888008644853', null, null, '2016-08-31', '0', '1KG', '55000', '47000', '-8000', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2602', 'DOMPOL DWI  ', '5', '888008644852', null, null, '2016-08-31', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2603', 'FITRI YANI ULANSARI  ', '5', '888008644847', null, null, '2016-08-31', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2604', 'DEDE  ', '5', '888008644836', null, null, '2016-08-31', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2605', 'URIP SUMARTIN  ', '5', '888008644843', null, null, '2016-08-31', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2606', 'YANUAR NUR CAHYO  ', '5', '888008644835', null, null, '2016-08-31', '0', '1KG', '11000', '9000', '-2000', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2607', 'NINA  ', '5', '888008644834', null, null, '2016-08-31', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2608', 'LIA DAHLIA  ', '5', '888008644796', null, null, '2016-08-31', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2609', 'IMAS SURYANI  ', '5', '888008644825', null, null, '2016-08-31', '0', '2KG', '18000', '18000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2610', 'MUHAMMAD YUNUS  ', '5', '888008644833', null, null, '2016-08-31', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2611', 'MEIRANI  ', '5', '888008644839', null, null, '2016-08-31', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2612', 'EDI KURNIAWAN  ', '5', '888008644837', null, null, '2016-08-31', '0', '2KG', '36000', '18000', '-18000', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2613', 'DESI ROFIANTI  ', '5', '888008644849', null, null, '2016-08-31', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2614', 'IBU UNI  ', '5', '888008644840', null, null, '2016-08-31', '0', '1KG', '26000', '26000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2615', 'NOVI MULYAWATI  ', '5', '888008644841', null, null, '2016-08-31', '0', '1KG', '14000', '14000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2616', ' BUNDA HANA  ', '5', '888008644838', null, null, '2016-08-31', '0', '2KG', '28000', '14000', '-14000', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2617', 'MUJIASIH  ', '5', '888008644842', null, null, '2016-08-31', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2618', 'DUDY AFFIADY  ', '5', '888008644844', null, null, '2016-08-31', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2619', 'JAJAT SUDRAJAT  ', '5', '888008644845', null, null, '2016-08-31', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2620', 'LUSIA ARISANDI  ', '5', '888008644851', null, null, '2016-08-31', '0', '1KG', '18000', '14000', '-4000', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2621', 'BPK. ROANTA  ', '5', '888008644798', null, null, '2016-08-31', '0', '1KG', '11000', '                  11000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2622', 'WIWI MARWIYAH  ', '5', '888008644848', null, null, '2016-08-31', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2623', 'DEWI YULIZA  ', '5', '888008644846', null, null, '2016-08-31', '0', '2KG', '22000', '11000', '-11000', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2624', 'ARI GUNAWAN  ', '5', '888008644850', null, null, '2016-08-31', '0', '2KG', '92000', '138000', '46000', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2625', 'SUPRIHATIN  ', '5', '888008644831', null, null, '2016-08-31', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2626', 'LINDA HARTATI  ', '5', '888008644854', null, null, '2016-08-31', '0', '1KG', '11000', '20000', '9000', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2627', 'SURYANI RAHMAN  ', '5', '888008644832', null, null, '2016-08-31', '0', '2KG', '192000', '192000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2628', 'RINAWATI / TOKO DHINI  ', '5', '888008644799', null, null, '2016-08-31', '0', '2KG', '92000', '92000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2629', 'DIAN KURNIASIH  ', '5', '888008644805', null, null, '2016-08-31', '0', '1KG', '32000', '32000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2630', 'YUSI ASRI', '5', '888008644809', null, null, '2016-08-31', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2631', 'MURNIATI  ', '5', '888008644830', null, null, '2016-08-31', '0', '1KG', '11000', '10000', '-1000', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2632', 'HAMIDAH  ', '5', '888008644829', null, null, '2016-08-31', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2633', ' JIHAN MARIA ULFAH  ', '5', '888008620996', null, null, '2016-08-31', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-01', '2016-09-02');
INSERT INTO `kb_no_resi` VALUES ('2634', 'RISKA SETYARINI  ', '5', '888008644815', null, null, '2016-08-31', '0', '1KG', '22000', '', '', '3', '63', '2016-09-01', null);
INSERT INTO `kb_no_resi` VALUES ('2635', 'JUNAENY  ', '5', '888008644819', null, null, '2016-08-31', '0', '1KG', '17000', '', '', '3', '63', '2016-09-01', null);
INSERT INTO `kb_no_resi` VALUES ('2636', 'FITRI KABOL  ', '5', '888008644820', null, null, '2016-08-31', '0', '1KG', '22000', '', '', '3', '63', '2016-09-01', null);
INSERT INTO `kb_no_resi` VALUES ('2637', 'ANDANSARI KUSUMADEWI  ', '3', '15182414054', null, null, '2016-09-01', '0', '11410gr', '171655', '148470', '-23185', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2638', 'YUNI ANGGRAENI  ', '1', 'BDOL902349172916', null, null, '2016-09-01', '0', '4KG', '76000', '95000', '19000', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2639', 'INA MUTHMAINAH  ', '1', 'BDOL902349163116', null, null, '2016-09-01', '0', '1KG', '17000', '17000', '0', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2640', 'EMMA MARTINI  ', '5', 'BDOL902349153316', null, null, '2016-09-01', '0', '1KG', '37000', '37000', '0', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2641', 'LIDIA ( RISKI PONSEL) ', '5', 'BDOL902349143516', null, null, '2016-09-01', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2642', 'NURAINI  ', '1', 'BDOL902349114116', null, null, '2016-09-01', '0', '1KG', '63000', '63000', '0', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2643', 'WIWIN  ', '3', '888009535341', null, null, '2016-09-01', '0', '2KG', '32000', '32000', '0', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2644', 'IBU LILIS  ', '5', '888009535340', null, null, '2016-09-01', '0', '11KG', '154000', '140000', '-14000', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2645', 'NURHAKIM  ', '5', '888009535360', null, null, '2016-09-01', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2646', 'BPK. NUR QODARIANTO  ', '5', '888009535362', null, null, '2016-09-01', '0', '1KG', '24000', '24000', '0', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2647', 'SHASA  ', '5', '888009535356', null, null, '2016-09-01', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2648', 'NURMINATUL ASYIAH  ', '5', '888009535358', null, null, '2016-09-01', '0', '1KG', '13000', '13000', '0', '3', '66', '2016-09-02', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2649', 'PIPIT FITRIANI  ', '5', '888009535352', null, null, '2016-09-01', '0', '1KG', '14000', '14000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2650', 'NITI SUHAENITI  ', '5', '888009535354', null, null, '2016-09-01', '0', '1KG', '10000', '11000', '1000', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2651', 'WIEKE ', '5', ' 888009535393', null, null, '2016-09-01', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2652', 'TOKO YULI PALOM  ', '5', '888009535348', null, null, '2016-09-01', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2653', 'DIANA PURBASARI  ', '5', '888009535350', null, null, '2016-09-01', '0', '1KG', '20000', '25000', '5000', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2654', 'KHOIRUL HIKMA  ', '5', '888009535380', null, null, '2016-09-01', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2655', 'WANA  ', '5', '888009535344', null, null, '2016-09-01', '0', '1KG', '26000', '26000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2656', 'RUSMA  ', '5', '888009535342', null, null, '2016-09-01', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2657', 'ANITA KRESTIANA  ', '5', '888009535346', null, null, '2016-09-01', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2658', ' VIKA / BPK. MAD  ', '5', '888009535363', null, null, '2016-09-01', '0', '1KG', '16000', '22000', '6000', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2659', 'BPK. KWARTON  ', '5', '888009535365', null, null, '2016-09-01', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2660', 'FITRIANI  ', '5', '888009535359', null, null, '2016-09-01', '0', '1KG', '53000', '  32000', '-21000', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2661', 'LISTIAWATI  ', '5', '888009535361', null, null, '2016-09-01', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2662', 'DINI WULANSARI  ', '5', '888009535357', null, null, '2016-09-01', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2663', 'SOFI  ', '5', '888009535355', null, null, '2016-09-01', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2664', 'BUNDA HANA  ', '5', '888009535351', null, null, '2016-09-01', '0', '1KG', '14000', '14000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2665', 'HIKMAWATI, SKM  ', '5', '888009535347', null, null, '2016-09-01', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2666', 'TOTO FITRI  ', '5', '888009535353', null, null, '2016-09-01', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2667', 'WIDIANINGSIH  ', '5', '888009535349', null, null, '2016-09-01', '0', '1KG', '18000', '', '', '3', '63', '2016-09-03', null);
INSERT INTO `kb_no_resi` VALUES ('2668', 'DEWI ASTUTI  ', '5', '888009535343', null, null, '2016-09-01', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2669', 'ANY UTAMI ', '3', '15182414343', null, null, '2016-09-01', '0', '915GR', '32880', '32000', '-880', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2670', 'EVA SUKAWATI  ', '5', '888009535395', null, null, '2016-09-02', '0', '1KG', '33000', '36000', '3000', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2671', 'MUJIASIH  ', '5', '888009535735', null, null, '2016-09-02', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2672', 'FATIMAWATI  ', '5', '888009535389', null, null, '2016-09-02', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2673', 'ADE SITI ROHMAH  ', '5', '888009535391', null, null, '2016-09-02', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2674', 'INING SUPRIHATIN  ', '5', '888009535387', null, null, '2016-09-02', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2675', 'ELISA NOVALIANA  ', '5', '888009535381', null, null, '2016-09-02', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2676', 'WINDA HENDRO  ', '5', '888009535379', null, null, '2016-09-02', '0', '1KG', '22000', '22000.', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2677', 'ROCHMAWATI (JIHAN FASHION) ', '5', '888009535373', null, null, '2016-09-02', '0', '1KG', '25000', '22000', '-3000', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2678', 'TERA SUHAIRAH  ', '5', '888009535369', null, null, '2016-09-02', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2679', 'M. SYAHNURI SIREGAR  ', '5', '888009535375', null, null, '2016-09-02', '0', '2KG', '50000', '25000', '-25000', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2680', 'IRMA PUSPITASARI ', '5', ' 888009535371', null, null, '2016-09-02', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2681', 'ASRI  ', '5', '888009535394', null, null, '2016-09-02', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2682', 'JANTI / RUMAH CANTIK BUNDA  ', '5', '888009535742', null, null, '2016-09-02', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2683', 'EKA NURHAYATI  ', '5', '888009535744', null, null, '2016-09-02', '0', '1KG', '11000', '', '', '3', '63', '2016-09-03', null);
INSERT INTO `kb_no_resi` VALUES ('2684', 'FIRDIA. M  ', '5', '888009535386', null, null, '2016-09-02', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2685', 'NOVIA  ', '5', '888009535388', null, null, '2016-09-02', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2686', 'MARHAYA  ', '5', '888009535738', null, null, '2016-09-02', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2687', 'IRMA BUNDA ZAHRA  ', '5', '888009535747', null, null, '2016-09-02', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2688', 'ISNAWATI  ', '5', '888009535745', null, null, '2016-09-02', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2689', 'SITI KHADIJAH  ', '5', '888009535746', null, null, '2016-09-02', '0', '1KG', '20000', '25000', '5000', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2690', 'RATNA  ', '5', '888009535741', null, null, '2016-09-02', '0', '1KG', '13000', '17000', '4000', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2691', 'ZAKIAH  ', '5', '888009535743', null, null, '2016-09-02', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2692', 'YULIANTI  ', '5', '888009535739', null, null, '2016-09-02', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2693', 'NUR ROHAETI  ', '5', '888009535383', null, null, '2016-09-02', '0', '2KG', '34000', '', '', '3', '63', '2016-09-03', null);
INSERT INTO `kb_no_resi` VALUES ('2694', 'JIHAN MARIA ULFA  ', '5', '888009535377', null, null, '2016-09-02', '0', '2KG', '44000', '44000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2695', 'DESI ROSFIANTI  ', '5', '888009535385', null, null, '2016-09-02', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2696', 'ITUT WIDYASTUTI  ', '5', '888009535396', null, null, '2016-09-02', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2697', 'BU UUS  ', '1', 'BDOC105503173816', null, null, '2016-09-02', '0', '2KG', '32000', '32000', '0', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2698', 'WINDY FEBRIONALLIN  ', '3', '15182414447', null, null, '2016-09-02', '0', '875gr', '34320', '33000', '-1320', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2699', 'PARI RANSYAH  ', '3', '15182414450', null, null, '2016-09-02', '0', '1170gr', '52650', '34000', '-18650', '3', '66', '2016-09-03', '2016-09-03');
INSERT INTO `kb_no_resi` VALUES ('2700', 'BPK. AGUS BUDIONO ', '5', '888009527330', null, null, '2016-09-03', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2701', 'SELLY RIZTASARI', '5', '888009535736', null, null, '2016-09-03', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2702', 'DEWI ESTIQOMAH', '5', '888009535737', null, null, '2016-09-03', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2703', 'LISTIAWATI', '5', '888009535740', null, null, '2016-09-03', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2704', 'MUSLIMAH', '5', '888009535364', null, null, '2016-09-03', '0', '1KG', '22000', '', '-22000', '3', '62', '2016-09-05', null);
INSERT INTO `kb_no_resi` VALUES ('2705', 'RATNA KARTIKA SARI', '5', '888009527331', null, null, '2016-09-03', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2706', 'AWANG WANGSIH', '5', '888009527338', null, null, '2016-09-03', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2707', 'MUTHMAINAH', '5', '888009527327', null, null, '2016-09-03', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2708', 'SAFTIANI', '5', '888009527324', null, null, '2016-09-03', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2709', 'MIA', '5', '888009527322', null, null, '2016-09-03', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2710', 'RAISYAH', '5', '888009527336', null, null, '2016-09-03', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2711', 'YULIANTI/PA OBAR YANI', '5', '888009527332', null, null, '2016-09-03', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2712', 'DIAN EKA', '5', '888009527328', null, null, '2016-09-03', '0', '3KG', '66000', '66000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2713', 'LIA AHSANUN', '5', '888009527325', null, null, '2016-09-03', '0', '5KG', '80000', '96000', '16000', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2714', 'LIA DAHLIA ', '5', '888009527326', null, null, '2016-09-03', '0', '2KG', '22000', '11000', '-11000', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2715', 'BU AGUNG', '5', '888009535367', null, null, '2016-09-03', '0', '2KG', '44000', '44000', '0', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2716', 'IMA', '5', '888009527335', null, null, '2016-09-03', '0', '2KG', '22000', '11000', '-11000', '3', '66', '2016-09-05', '2016-09-05');
INSERT INTO `kb_no_resi` VALUES ('2717', 'IRFAN FM', '3', '15182414947', null, null, '2016-09-05', '0', '725GR', '26000', '25000', '-1000', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2718', 'NAMIRA', '3', '15182415531', null, null, '2016-09-05', '0', '1765GR', '53000', '26000', '-27000', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2719', 'EDI KURNIAWAN ', '5', '888009527673', null, null, '2016-09-05', '0', '2KG', '36000', '36000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2720', 'MAHMUDATUL', '3', '15182415544', null, null, '2016-09-05', '0', '725GR', '36000', '35500', '-500', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2721', 'HASAN BASRI', '3', '15182415557', null, null, '2016-09-05', '0', '80GR', '21000', '', '-21000', '3', '62', '2016-09-06', null);
INSERT INTO `kb_no_resi` VALUES ('2722', 'EDI KURNIAWAN', '3', '15182415560', null, null, '2016-09-05', '0', '1240GR', '31000', '', '-31000', '3', '62', '2016-09-06', null);
INSERT INTO `kb_no_resi` VALUES ('2723', 'TOKO KAMIL ', '5', '888009527682', null, null, '2016-09-05', '0', '2KG', '34000', '17000', '-17000', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2724', 'DEVI IMALIA ', '5', '888009527674', null, null, '2016-09-05', '0', '4KG', '36000', '36000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2725', 'ERNY IRAWATI ', '5', '888009527664', null, null, '2016-09-05', '0', '1KG', '26000', '26000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2726', 'SOFI ', '5', '888009527660', null, null, '2016-09-05', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2727', 'SUNENGSIH ', '5', '888009527679', null, null, '2016-09-05', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2728', 'UST. AMRULLAH ', '5', '888009527661', '0', null, '2016-09-05', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2729', 'RINA ', '5', '888009527678', null, null, '2016-09-05', '0', '1KG', '7000', '', '-7000', '3', '62', '2016-09-06', null);
INSERT INTO `kb_no_resi` VALUES ('2730', 'SARJITO ', '5', '888009527665', null, null, '2016-09-05', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2731', 'RAHMI ', '5', '888009527669', null, null, '2016-09-05', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2732', 'SEPTI IRAWATI ', '5', '888009527659', null, null, '2016-09-05', '0', '1KG', '36000', '36000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2733', 'PENNI WIDYASTUTI ', '5', '888009527651', null, null, '2016-09-05', '0', '1KG', '47000', '', '-47000', '3', '62', '2016-09-06', null);
INSERT INTO `kb_no_resi` VALUES ('2734', 'FIRA ', '5', '888009527658', null, null, '2016-09-05', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2735', 'TAJUN NISAK ', '5', '888009527655', null, null, '2016-09-05', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2736', 'IDA HABIBI ', '5', '888009527649', null, null, '2016-09-05', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2737', 'DOMPOL DWI ', '5', '888009527653', null, null, '2016-09-05', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2738', 'DEVI DIANTI ', '5', '888009527657', null, null, '2016-09-05', '0', '1KG', '24000', '24000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2739', 'WIWIN / EDUWART ', '5', '888009527652', null, null, '2016-09-05', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2740', 'RINAWATI ', '5', '888009527656', null, null, '2016-09-05', '0', '1KG', '46000', '46000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2741', 'BUNDA HANA ', '5', '888009527668', null, null, '2016-09-05', '0', '1KG', '14000', '14000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2742', 'WIDYANINGSIH ', '5', '888009527676', null, null, '2016-09-05', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2743', 'DEWI (BUNDA KEMBAR)', '5', '888009527671', null, null, '2016-09-05', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2744', 'LULU ', '5', '888009527672', null, null, '2016-09-05', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2745', 'ISMIYATI ', '5', '888009527667', null, null, '2016-09-05', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2746', 'DEWA ', '5', '888009527675', null, null, '2016-09-05', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2747', 'BPK. SAMADI ', '5', '888009527663', null, null, '2016-09-05', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2748', 'ZUYINA ', '5', '888009527650', null, null, '2016-09-05', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2749', 'YULIANTI ', '5', '888009527654', null, null, '2016-09-05', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2750', 'BPK KRISTIANTO', '5', '888009527690', null, null, '2016-09-05', '0', '2KG', '32000', '32000', '0', '3', '66', '2016-09-06', '2016-09-06');
INSERT INTO `kb_no_resi` VALUES ('2751', 'UMMY KULTSUM AGUSTINI ', '3', '15182416261', null, null, '2016-09-06', '0', '195gr', '18000', '18000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2752', 'NURAINI AULIA ', '3', '15182416274', null, null, '2016-09-06', '0', '950GR', '56000', '55000', '-1000', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2753', 'MARIANA / AFIFAH SHOP ', '3', '15182416287', null, null, '2016-09-06', '0', '4640GR', '121000', '115000', '-6000', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2754', 'BUTIK ADLYN ', '3', '15182416290', null, null, '2016-09-06', '0', '4415GR', '204000', '216000', '12000', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2755', 'WAHYUNING WINDARWATI ', '3', '15182416307', null, null, '2016-09-06', '0', '995GR', '26000', '25000', '-1000', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2756', 'ISDA YULIANTI', '3', '15182416310', '0', null, '2016-09-06', '0', '600GR', '26000', '0', '-26000', '3', '62', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2757', 'ANGGIA MURNI ', '1', 'BDOL902360364616', null, null, '2016-09-06', '0', '1KG', '43000', '43000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2758', 'EDI SUSANTO ', '1', 'BDOL902360354816', null, null, '2016-09-06', '0', '1KG', '36000', '28000', '-8000', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2759', 'EVI AZIZAH ', '1', 'BDOL902360345016', null, null, '2016-09-06', '0', '1KG', '42000', '33000', '-9000', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2760', 'ELOK PUSPITA ', '1', 'BDOL902360335216', null, null, '2016-09-06', '0', '1KG', '28000', '16000', '-12000', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2761', 'HERTIKA SUHERTIKA ', '1', 'BDOL902360325416', null, null, '2016-09-06', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2762', 'TANTI NURINDAH SARI ', '5', '888009477068', null, null, '2016-09-06', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2763', 'MUJIASIH ', '5', '888009477064', null, null, '2016-09-06', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2764', 'AMBU PUTRI ', '5', '888009477063', null, null, '2016-09-06', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2765', 'CECEP DRAJAT MULYADI ', '5', '888009477060', null, null, '2016-09-06', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2766', 'MAYANG NOVI ', '5', '888009477059', null, null, '2016-09-06', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2767', 'LILIK MASLIYAH ', '5', '888009477057', null, null, '2016-09-06', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2768', 'NURHAYANI ', '5', '888009477054', null, null, '2016-09-06', '0', '1KG', '32000', '32000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2769', 'LIA DAHLIA ', '5', '888009477052', null, null, '2016-09-06', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2770', 'LISTIAWATI ', '5', '888009477071', null, null, '2016-09-06', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2771', 'LENI MARNI ', '5', '888009477079', null, null, '2016-09-06', '0', '1KG', '42000', '42000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2772', 'MARIATUL QIBTIYAH ', '5', '888009477075', null, null, '2016-09-06', '0', '2KG', '56000', '', '-56000', '3', '62', '2016-09-07', null);
INSERT INTO `kb_no_resi` VALUES ('2773', 'ARIYANI ', '5', '888009477080', null, null, '2016-09-06', '0', '1KG', '77000', '77000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2774', 'PURI NARDYASTI ', '5', '888009477076', null, null, '2016-09-06', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2775', 'DEWI YUNITA ', '5', '888009477072', null, null, '2016-09-06', '0', '1KG', '42000', '42000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2776', 'ISTIQOMAH ', '5', '888009477078', '0', null, '2016-09-06', '0', '1KG', '19000', '19000', '0', '3', '62', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2777', 'RATNAWATI ', '5', '888009477074', null, null, '2016-09-06', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2778', 'ESA MULYAWATI ', '5', '888009477077', null, null, '2016-09-06', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2779', 'USIK (RURA DESAIN)', '5', '888009477073', null, null, '2016-09-06', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2780', 'BUNDA HANA ', '5', '888009477082', null, null, '2016-09-06', '0', '1KG', '14000', '14000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2781', 'JAJAT SUDRAJAT ', '5', '888009477081', null, null, '2016-09-06', '0', '3KG', '33000', '44000', '11000', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2782', 'CHOIR EXPRESS', '5', '888009477067', null, null, '2016-09-06', '0', '2KG', '44000', '20000', '-24000', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2783', 'TANTI PRIATININGSIH ', '5', '888009477053', null, null, '2016-09-06', '0', '2KG', '14000', '14000', '0', '3', '66', '2016-09-07', '2016-09-07');
INSERT INTO `kb_no_resi` VALUES ('2784', 'GHINA ALZAHRA', '5', '888009477097', null, null, '2016-09-07', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2785', 'DEWI BUNDA KEMBAR', '5', '888009477090', null, null, '2016-09-07', '0', '3KG', '33000', '', '-33000', '3', '62', '2016-09-08', null);
INSERT INTO `kb_no_resi` VALUES ('2786', 'DWI PUTRI MIFTAHUS SA\'ADAH', '5', '888009477098', null, null, '2016-09-07', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2787', 'SYARIFAH RATNA', '5', '888009477103', null, null, '2016-09-07', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2788', 'INA INONK', '5', '888009477055', null, null, '2016-09-07', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2789', 'EKA DWI SUSANTI', '5', '888009477099', null, null, '2016-09-07', '0', '1KG', '11000', '', '-11000', '3', '62', '2016-09-08', null);
INSERT INTO `kb_no_resi` VALUES ('2790', 'AJENG DWI ANJANI', '5', '888009477096', null, null, '2016-09-07', '0', '1KG', '36000', '36000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2791', 'RIANA DEWI', '5', '888009477100', null, null, '2016-09-07', '0', '1KG', '25000', '28000', '3000', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2792', 'DEWI YULIZA', '5', '888009477102', null, null, '2016-09-07', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2793', 'EDY JOKO PURWANTO', '5', '888009477104', null, null, '2016-09-07', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2794', 'ERNI YULASTRI', '5', '888009477101', null, null, '2016-09-07', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2795', 'DESI FUJASWATI', '5', '888009477056', null, null, '2016-09-07', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2796', 'IMAS SURYANI', '5', '888009477058', null, null, '2016-09-07', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2797', 'LUNA', '5', '888009477062', null, null, '2016-09-07', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2798', 'YANTI/WAWAN', '5', '888009477061', null, null, '2016-09-07', '0', '1KG', '11000', '', '-11000', '3', '62', '2016-09-08', null);
INSERT INTO `kb_no_resi` VALUES ('2799', 'IMA SUSILAWATI', '5', '888009477065', null, null, '2016-09-07', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2800', 'LILIE ARIE WAHYUNI', '5', '888009477087', null, null, '2016-09-07', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2801', 'HJ. SITI MISRIYAH', '5', '888009477066', null, null, '2016-09-07', '0', '1KG', '22000', '44000', '22000', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2802', 'DANI INDRAWAN', '5', '888009477069', null, null, '2016-09-07', '0', '1KG', '25000', '24000', '-1000', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2803', 'KIKI AMALIA', '5', '888009477093', null, null, '2016-09-07', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2804', 'ANDE YULIANTI', '5', '888009477070', null, null, '2016-09-07', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2805', 'RESQITA (ICA)', '5', '888009477666', null, null, '2016-09-07', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2806', 'JIHAN MARIA ULFA', '5', '888009527662', null, null, '2016-09-07', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2807', 'RENI GUSTRIANI', '5', '888009477089', null, null, '2016-09-07', '0', '1KG', '9000', '', '-9000', '3', '62', '2016-09-08', null);
INSERT INTO `kb_no_resi` VALUES ('2808', 'NOVIA', '5', '888009477091', null, null, '2016-09-07', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2809', 'YOPIH YUJANAH', '5', '888009477095', null, null, '2016-09-07', '0', '2KG', '32000', '14000', '-18000', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2810', 'IBU FATHONAH', '1', 'BDOL902363633116', null, null, '2016-09-07', '0', '1KG', '87000', '87000', '0', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2811', 'TOKO HALIKA UMMI AZZAM', '3', '181524167790', null, null, '2016-09-07', '0', '500GR', '20550', '25000', '4450', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2812', 'SRI UTAMI', '3', '18152416807', null, null, '2016-09-07', '0', '445GR', '22550', '', '-22550', '3', '62', '2016-09-08', null);
INSERT INTO `kb_no_resi` VALUES ('2813', ' URI KARNAYA', '3', '18152416810', null, null, '2016-09-07', '0', '1055GR', '35280', '23000', '-12280', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2814', 'MEITA DEWI', '3', '18152416823', null, null, '2016-09-07', '0', '435GR', '18550', '20000', '1450', '3', '66', '2016-09-08', '2016-09-08');
INSERT INTO `kb_no_resi` VALUES ('2815', 'ZUYINA AYUNIG', '5', '888009477769', null, null, '2016-09-08', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2816', 'YANTI TREANAWATI ', '5', '888009477772', null, null, '2016-09-08', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2817', 'MEIRANI(MM ALIP) ', '5', '888009477759', null, null, '2016-09-08', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2819', 'PALAH PADILAH ', '5', '888009477464', null, null, '2016-09-08', '0', '1KG', '11000', '9000', '-2000', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2820', 'WIDYANINGSIH ', '5', '888009477471', null, null, '2016-09-08', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2821', 'MEILINDA NOFARI ', '5', '888009477462', null, null, '2016-09-08', '0', '1KG', '43000', '43000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2822', 'YUNIATI/MAMA YASMIN ', '5', '888009477468', null, null, '2016-09-08', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2823', 'INING SUPRIHATIN ', '5', '888009477463', null, null, '2016-09-08', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2824', 'BIN ABDILLAH ', '5', '888009477461', null, null, '2016-09-08', '0', '1KG', '26000', '26000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2825', 'ELIS SHOLIKAH ', '5', '888009477472', null, null, '2016-09-08', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2826', 'RESQITA (ICA) ', '5', '888009477474', null, null, '2016-09-08', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2827', 'NUNIK ERNAWATI ', '5', '888009477473', null, null, '2016-09-08', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2828', 'TOKO YULI PALOM', '5', '888009477469', null, null, '2016-09-08', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2829', 'LEONORA ', '5', '888009477467', null, null, '2016-09-08', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2830', 'BUNDA QOSHMAL ', '5', '888009477460', null, null, '2016-09-08', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2831', 'NOVI HANDAYANI ', '5', '888009477465', null, null, '2016-09-08', '0', '1KG', '42000', '42000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2832', 'TAJUM NISAK', '5', '888009527677 ', null, null, '2016-09-08', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2833', 'YANI EKA ', '5', '888009477770', null, null, '2016-09-08', '0', '4KG', '36000', '27000', '-9000', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2834', 'AULIA RAHMAH ', '5', '888009477466', null, null, '2016-09-08', '0', '2KG', '52000', '78000', '26000', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2835', 'YUNIA ', '1', 'BDOL902366602816', null, null, '2016-09-08', '0', '1KG', '17000', '15000', '-2000', '3', '66', '2016-09-09', '2016-09-09');
INSERT INTO `kb_no_resi` VALUES ('2836', 'BPK SUKIYAT ', '5', '888009477760 ', null, null, '2016-09-09', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-09-09', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2837', 'TITIN (H AHMAD MUNIR)', '5', ' 888009477762', null, null, '2016-09-09', '0', '1KG ', ' 41000', '', '-41000', '3', '64', '2016-09-09', null);
INSERT INTO `kb_no_resi` VALUES ('2838', 'DEVI LESTARI', '5', '888009477763', null, null, '2016-09-09', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-09-09', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2840', 'USIK (RURA DESAIN) ', '5', '888009477938', null, null, '2016-09-09', '0', ' 1KG ', '16000', '', '-16000', '3', '64', '2016-09-09', null);
INSERT INTO `kb_no_resi` VALUES ('2841', 'YENI AULYANTI', '5', ' 888009477765', null, null, '2016-09-09', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-09-09', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2842', 'RAMA YANTI ', '5', '888009477771', null, null, '2016-09-09', '0', ' 2KG ', '20000', '20000', '0', '3', '66', '2016-09-09', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2843', 'JIHAN MARIA ULFAH ', '5', ' 888009477761', null, null, '2016-09-09', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2844', 'SARAH MAESAROH ', '5', '888009477721', null, null, '2016-09-09', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2845', 'RINI NURAINI ', '5', '888009477768', null, null, '2016-09-09', '0', ' 1KG ', '33000', '33000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2846', 'RAHAYU GANIA ', '5', '888009477773', null, null, '2016-09-09', '0', ' 1KG ', '18000', '18000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2847', 'HIKMAWATI SKM ', '5', '888009477757', null, null, '2016-09-09', '0', ' 1KG ', '47000', '47000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2848', 'ROSITA TALIB ', '5', '888009477758', null, null, '2016-09-08', '0', ' 1KG', ' 41000', '41000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2849', 'SRI WAHYUNI ', '5', '888009477774 ', null, null, '2016-09-09', '0', '1KG ', '59000', '59000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2850', 'MALA ', '5', '888009477742', null, null, '2016-09-09', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2851', 'DESI ROSFIANTI ', '5', '888009477981 ', null, null, '2016-09-09', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2852', 'DINDA ', '5', '888009477996 ', null, null, '2016-09-09', '0', '1KG ', '7000', '7000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2853', 'WENTI/TATI ', '5', '888009477998', null, null, '2016-09-09', '0', ' 1KG ', '10000', '11000', '1000', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2854', 'ERNIYAH/EER', '5', ' 888009477987 ', null, null, '2016-09-09', '0', '2KG ', '22000', '22000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2855', 'ARJITO ', '5', '888009477767 ', null, null, '2016-09-09', '0', '2KG', ' 56000', '56000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2856', 'FEBRI HELMIYANTI ', '5', '888009477994', null, null, '2016-09-09', '0', ' 1KG ', '28000', '56000', '28000', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2857', 'IBU EVA PUSPITASARI ', '5', '888009477939', null, null, '2016-09-09', '0', ' 1KG ', '14000', '14000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2858', 'CINTA NUR FADILLAH ', '5', '888009477990', null, null, '2016-09-09', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2859', 'ALIKA  ', '5', '888009477764', null, null, '2016-09-09', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2860', 'ANNISA NUR AZIZAH', '5', ' 888009477766 ', null, null, '2016-09-09', '0', '1KG ', '9000', '9000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2861', 'ERNOVIA ', '3', '15182417537', null, null, '2016-09-09', '0', ' 700GR ', '19050', '18500', '-550', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2862', 'WIWIT CITRA PESONA BUDURAN ', '0', 'ABP95091', null, null, '2016-09-09', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2863', 'BPK. AGUS BUDIYONO', '0', ' ABP95025 ', null, null, '2016-09-09', '0', '1KG ', '16000', '33000', '17000', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2864', 'INA MUTHMAINAH', '1', ' BDOL902369789916 ', null, null, '2016-09-09', '0', '1KG ', '17000', '17000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2865', 'HERTIKA SUHERTIKA/KANTIN HE ', '1', 'BDOL902369770116 ', null, null, '2016-09-09', '0', '1KG ', '7000', '7000', '0', '3', '66', '2016-09-10', '2016-09-10');
INSERT INTO `kb_no_resi` VALUES ('2866', 'MEYI ', '3', '15182417793', null, null, '2016-09-10', '0', '245 GR', '15330', '23000', '7670', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2867', 'LUSI ISTANTI ', '1', 'BDOL902372065016', null, null, '2016-09-10', '0', '1KG', '19000', '16000', '-3000', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2868', 'IBU LILIS NURHAYATI ', '5', '888009477986', null, null, '2016-09-10', '0', '1KG', '14000', '14000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2869', 'SOFI ', '5', '888009477982', null, null, '2016-09-10', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2870', 'FIANY DHARYANTI ', '5', '888009477978', null, null, '2016-09-10', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2871', 'RATNAWATI ', '5', '888009477997', null, null, '2016-09-10', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2872', 'BD. ELLA AURLELA ', '5', '888009477995', null, null, '2016-09-10', '0', '1KG', '11000', '22000', '11000', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2873', 'SAFTIANI ', '5', '888009477999', null, null, '2016-09-10', '0', '2KG', '20000', '20000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2874', 'ANIK DWI KARYAWATI ', '5', '888009477983', null, null, '2016-09-10', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2875', 'NURSASIH JANNAH ', '5', '888009477979', null, null, '2016-09-10', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2876', 'LINA ', '5', '888009477993', null, null, '2016-09-10', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2877', 'DELLY AMELIA ASRIL ', '5', '888009526116', null, null, '2016-09-10', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2878', 'YATI ', '5', '888009478000', null, null, '2016-09-10', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2879', 'NAILUL MURSIDAH ', '5', '888009477937', null, null, '2016-09-10', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2880', 'AI ULFAH ', '5', '888009477939', null, null, '2016-09-10', '0', '1KG', '7000', '9000', '2000', '3', '66', '2016-09-13', '2016-09-13');
INSERT INTO `kb_no_resi` VALUES ('2881', 'SITI MUKAROMAH  ', '5', '888009526235', null, null, '2016-09-13', '0', '1KG', '20000', '20000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2882', 'HILDA MEILIANTI  ', '5', '888009526238', null, null, '2016-09-13', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2883', 'DANIA BASUDIN  ', '5', '888009526239', null, null, '2016-09-13', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2884', 'ANDI FERAWATI  ', '5', '888009526241', null, null, '2016-09-13', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2885', 'MEGA SETYA  ', '5', '888009526243', null, null, '2016-09-13', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2886', 'LIA DAHLIA  ', '5', '888009526229', null, null, '2016-09-13', '0', '2KG', '22000', '11000', '-11000', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2887', 'DESY ROSFIANTI ', '5', '888009526233', null, null, '2016-09-13', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2888', 'GIAN BABY SHOP  ', '5', '888009526236', null, null, '2016-09-13', '0', '1KG', '28000', '20000', '-8000', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2889', ' JIHAN MARIA ULFA  ', '5', '888009526242', null, null, '2016-09-13', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2890', 'SHASA  ', '5', '888009526237', null, null, '2016-09-13', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2891', 'LENA ASTRIA  ', '5', '888009526244', null, null, '2016-09-13', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2892', 'TINI M AKMAL  ', '5', '888009526240', null, null, '2016-09-13', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2893', 'TOKO YULI PALOM  ', '5', '888009526231', null, null, '2016-09-13', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2894', 'RUMAH VINA  ', '5', '888009526234', null, null, '2016-09-13', '0', '2KG', '44000', '22000', '-22000', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2895', 'NURLELA / TRILIAN  ', '5', '888009526232', null, null, '2016-09-13', '0', '2KG', '94000', '94000', '0', '3', '66', '2016-09-14', '2016-09-14');
INSERT INTO `kb_no_resi` VALUES ('2896', 'WIENA HESNIANUR  ', '3', '15182418449 ', null, null, '2016-09-14', '0', '990GR ', '54650', '76000', '21350', '3', '66', '2016-09-14', '2016-09-15');
INSERT INTO `kb_no_resi` VALUES ('2897', 'ROSFITA DEWI ', '5', ' 888009526670  ', null, null, '2016-09-14', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-14', '2016-09-15');
INSERT INTO `kb_no_resi` VALUES ('2898', 'MEGA SETYA NUSANA  ', '5', '888009526671', null, null, '2016-09-14', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-09-14', '2016-09-15');
INSERT INTO `kb_no_resi` VALUES ('2899', 'HARTINI    ', '5', '888009526684', null, null, '2016-09-14', '0', '1KG', '17000', '17000', '0', '3', '66', '2016-09-14', '2016-09-15');
INSERT INTO `kb_no_resi` VALUES ('2900', 'TANTI PRIATININGSIH  ', '5', '8880095266674', null, null, '2016-09-13', '0', '1KG ', ' 7000', '7000', '0', '3', '66', '2016-09-14', '2016-09-15');
INSERT INTO `kb_no_resi` VALUES ('2901', ' IBU LILIS INDARWATI  ', '5', ' 888009526662', null, null, '2016-09-13', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-09-14', '2016-09-15');
INSERT INTO `kb_no_resi` VALUES ('2902', 'NOVITA SUSILOWATI ', '5', '888009526658 ', null, null, '2016-09-14', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-09-14', '2016-09-15');
INSERT INTO `kb_no_resi` VALUES ('2903', 'LIA AHSANUN  ', '5', '888009526680 ', null, null, '2016-09-14', '0', '3KG ', '48000', '48000', '0', '3', '66', '2016-09-14', '2016-09-15');
INSERT INTO `kb_no_resi` VALUES ('2904', 'WANA  ', '5', '888009526667  ', null, null, '2016-09-14', '0', '2KG', '52000', '52000', '0', '3', '66', '2016-09-14', '2016-09-15');
INSERT INTO `kb_no_resi` VALUES ('2905', 'KESY SANUSI  ', '5', '888009526666 ', null, null, '2016-09-14', '0', '1KG ', '47000', '47000', '0', '3', '66', '2016-09-14', '2016-09-15');
INSERT INTO `kb_no_resi` VALUES ('2906', 'NAILA AZIZAH  ', '1', 'BDOL902377432516', null, null, '2016-09-15', '0', '1KG', '28000', '16000', '-12000', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2907', 'MELIYA INDRI SARI  ', '3', '15182418845', null, null, '2016-09-15', '0', '235GR', '54440', '65000', '10560', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2908', 'URI KARNAYA  ', '3', '15182418832', null, null, '2016-09-15', '0', '820GR', '24870', '35280', '10410', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2909', 'MASNAH  ', '1', 'BDOC105508840116', null, null, '2016-09-15', '0', '1KG', '47000', '47000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2910', 'WIWIT CITRA  ', '6', 'ABQ71220', null, null, '2016-09-15', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2911', 'WIDA NURUL AZIZAH  ', '5', '888009477989', null, null, '2016-09-15', '0', '3KG', '51000', '51000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2912', 'IBU FIRMAN  ', '5', '888009477988', null, null, '2016-09-15', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2913', 'LAILA MUFARRIHA  ', '5', '888009526245', null, null, '2016-09-15', '0', '1KG', '28000', '25000', '-3000', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2914', 'IIS  ', '5', '888009526682', null, null, '2016-09-15', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2915', 'ADI NENGSIH  ', '5', '888009526127', null, null, '2016-09-15', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2916', 'DASIH  ', '5', '888009526906', null, null, '2016-09-15', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2917', 'IDA ( TIBI FASHION)  ', '5', '888009526922', null, null, '2016-09-15', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2918', 'GARRY ARDIANSYAH  ', '5', '888009526918', null, null, '2016-09-15', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2919', 'YOPIH  ', '5', '888009477718', null, null, '2016-09-15', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2920', 'DEWI YULIANAWATI  ', '5', '888009526928', null, null, '2016-09-15', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2921', ' LILY NURBAETY  ', '5', '888009526932', null, null, '2016-09-15', '0', '1KG', '9000', '11000', '2000', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2922', 'DIAN EKA  ', '5', '888009477992', null, null, '2016-09-15', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2923', 'DIAH BUNDA F ', '5', '888009526230', null, null, '2016-09-15', '0', '1KG', '10000', '', '', '3', '63', '2016-09-16', null);
INSERT INTO `kb_no_resi` VALUES ('2924', 'KRISYANTO  ', '5', '888009477984', null, null, '2016-09-15', '0', '1KG', '16000', '16000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2925', 'LOLA  ', '5', '888009477991', null, null, '2016-09-15', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2926', 'EMILDA EKTRIAN  ', '5', '888009477985', null, null, '2016-09-15', '0', '1KG', '19000', '33000', '14000', '3', '66', '2016-09-16', '2016-09-16');
INSERT INTO `kb_no_resi` VALUES ('2927', ' YUSI ASRI INSANI ', '5', '888009526678', null, null, '2016-09-16', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2928', 'DWI PUTRI MIFTAHUS SA\'ADAH ', '5', '888009526679', null, null, '2016-09-16', '0', '1KG', '18000', '', '', '3', '63', '2016-09-17', null);
INSERT INTO `kb_no_resi` VALUES ('2929', 'KHOLIFATUL ROSIDA ', '5', '888009526683', null, null, '2016-09-16', '0', '1KG', '18000', '16000', '-2000', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2930', 'AYU NOVITAYARI ', '5', '888009526681', null, null, '2016-09-16', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2931', 'CHANDRA AYU IKA ', '5', '888009526677', null, null, '2016-09-16', '0', '1KG', '18000', '', '', '3', '63', '2016-09-17', null);
INSERT INTO `kb_no_resi` VALUES ('2932', 'YUSINTA ', '5', '888009526228', null, null, '2016-09-16', '0', '1KG', '10000', '', '', '3', '63', '2016-09-17', null);
INSERT INTO `kb_no_resi` VALUES ('2933', 'GHANA SAVIRA ', '5', '888009526687', null, null, '2016-09-16', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2934', 'LUTFI ZAINI ', '5', '888009526923', null, null, '2016-09-16', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2935', 'TEDAVI MEDICAL ', '5', '888009526907', null, null, '2016-09-16', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2936', 'TANTI PRIATININGSIH ', '5', '888009526915', null, null, '2016-09-16', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2937', 'DEWI SITTAH ', '5', '888010317196', null, null, '2016-09-16', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2938', 'YANI IMRONI ', '5', '888010317195', null, null, '2016-09-16', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2939', 'LAILA MUFARIHA ', '5', '888010317188', null, null, '2016-09-16', '0', '1KG', '28000', '25000', '-3000', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2940', 'TRI UTAMI ', '5', '888010317191', null, null, '2016-09-16', '0', '2KG', '66000', '66000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2941', 'DINI WULANSARI  ', '5', '888010317184', null, null, '2016-09-16', '0', '2KG', '18000', '18000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2942', 'TOKO KAMIL  ', '5', '888010317187', null, null, '2016-09-16', '0', '2KG', '34000', '34000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2943', 'DESI FAJASWATI ', '5', '888010317197', null, null, '2016-09-16', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2944', 'DWI KARSIWI PENI  ', '5', '888010317198', null, null, '2016-09-16', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2945', 'SOFI  ', '5', '888010317193', null, null, '2016-09-16', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2946', 'KHIRUNISAK ', '5', '888010317194', null, null, '2016-09-16', '0', '11KG', '242000', '240000', '-2000', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2947', 'ARFA HUSNA ', '5', '888009526685', null, null, '2016-09-16', '0', '2KG', '36000', '', '', '3', '63', '2016-09-17', null);
INSERT INTO `kb_no_resi` VALUES ('2948', 'H TUTY HERAWATI ', '5', '888010317200', null, null, '2016-09-16', '0', '2KG', '20000', '', '', '3', '63', '2016-09-17', null);
INSERT INTO `kb_no_resi` VALUES ('2949', 'NURHASANAH  ', '5', '888010317199', null, null, '2016-09-16', '0', '3KG', '33000', '33000', '0', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2950', 'RISKA YULIANTI ', '3', '888010317201', null, null, '2016-09-16', '0', '2KG', '18000', '9000', '-9000', '3', '66', '2016-09-17', '2016-09-17');
INSERT INTO `kb_no_resi` VALUES ('2951', 'WINDY FEBRIONELLIN ', '3', '15182419091', null, null, '2016-09-16', '0', '1895GR', '81320', '66000', '-15320', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2952', 'DEWI YUNITA   ', '5', '888010317357', '0', null, '2016-09-17', '0', '1KG ', '42000', '42000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2953', 'RINAWATI / TOKO DHINI  ', '5', '888010317162 ', null, null, '2016-09-17', '0', '3KG ', '138000', '184000', '46000', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2954', ' ASRIFA NIDA  ', '5', '888010317368', null, null, '2016-09-07', '0', ' 1KG', ' 22000', '22000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2955', 'IBU LENA  ', '5', '888010317365', null, null, '2016-09-17', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2956', 'SITI KHOLISOH ', '5', ' 888010317364 ', null, null, '2016-09-17', '0', '1KG ', '10000', '10000', '0', '0', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2957', 'BAPAK. M. ADHIM  ', '5', '888010317361', null, null, '2016-09-17', '0', ' 1KG ', '16000', '16000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2958', 'JIHAN MARIA ULFA ', '5', ' 888010317350', null, null, '2016-09-17', '0', ' 1KG', '22000', '22000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2960', 'DEWI YULIZA  ', '5', '888010317366', null, null, '2016-09-17', '0', ' 1KG', ' 11000', '11000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2961', 'UMI ARFA  ', '5', '888010317354 ', null, null, '2016-09-17', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2962', 'ERNI NOVIANTI  ', '5', '888010317360 ', null, null, '2016-09-17', '0', '1KG ', '7000', '7000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2963', 'ODI HARTANTO ', '5', '888010317356 ', null, null, '2016-09-17', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2964', ' IRMA BUNDA ZAHRA  ', '5', '1KG ', null, null, '2016-09-17', '0', '888010317351 ', '10000', '10000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2965', 'NOVIA  ', '5', '888010317355 ', null, null, '2016-09-17', '0', '1KG ', '16000', '16000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2966', 'USIK  ', '5', '888010317363', null, null, '2016-09-17', '0', ' 1KG ', '16000', '16000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2967', ' KURNIA DEWI  ', '5', '888010317352 ', null, null, '2016-09-17', '0', '1KG ', '22000', '19000', '-3000', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2968', ' ISTITHA  ', '5', '888010317359', null, null, '2016-09-17', '0', ' 1KG', ' 47000', '47000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2969', 'ANDANSARI KUSUMADEWI  ', '5', '888010317358 ', null, null, '2016-09-17', '0', '1KG', ' 36000', '36000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2970', 'VA DAMAYANTI  ', '5', '888010317362', null, null, '2016-09-17', '0', ' 1KG ', '25000', '25000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2971', 'MERYADI PRIYASTI  ', '5', '888010317353 ', null, null, '2016-09-17', '0', '1KG ', '19000', '19000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2972', 'DWI MAHITASARI ', '5', ' 888010317192 ', null, null, '2016-09-17', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2973', 'PARIYANSYAH ', '2', ' 030044736202 ', null, null, '2016-09-17', '0', '2KG', ' 70000', '70000', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2974', 'DONI ARTANTO', '5', '  15182419348', null, null, '2016-09-17', '0', ' 2000gr', ' 54640', '54640', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2976', 'MIEDA ', '3', '15182419364 ', null, null, '2016-09-17', '0', 'W: 3615GR, V:2475GR ', '47585', '65000', '17415', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2977', 'DONI ARTANTO ', '3', '151824419351', null, null, '2016-09-17', '0', ' 715GR ', '26880', '26880', '0', '3', '66', '2016-09-17', '2016-09-19');
INSERT INTO `kb_no_resi` VALUES ('2991', 'RUMAH VINA  ', '3', '15182419731', null, null, '2016-09-19', '0', '2530GR ', '78000', '36000', '-42000', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('2992', 'BUTIK ADLYN ', '3', '15182419744 ', null, null, '2016-09-19', '0', '4550GR ', '151960', '180000', '28040', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('2993', 'UTIN SARIFAH  ', '1', 'BDOC105511592216', null, null, '2016-09-19', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('2994', 'RAISYAH  ', '5', '888010317531', null, null, '2016-09-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('2995', 'SITI MUKARROMAH ', '5', '888010317528', null, null, '2016-09-19', '0', '1KG', '20000', '20000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('2996', 'IRMA NURMALA  ', '5', '888010317532', null, null, '2016-09-19', '0', '2KG', '22000', '33000', '11000', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('2997', 'LENY RATNAWIJAYANTI  ', '5', '888010317539', null, null, '2016-09-19', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('2998', 'ELMIA  ', '5', '888010317536', null, null, '2016-09-19', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('2999', 'ANDE YULIANTI  ', '5', '888010317527', null, null, '2016-09-19', '0', '1KG', '18000', '18000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3000', 'MUJIASIH  ', '5', '888010317540', null, null, '2016-09-19', '0', '2KG', '44000', '44000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3001', 'NURHASANAH  ', '5', '888010317515', null, null, '2016-09-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3002', 'IBU DINI  ', '5', '888010317519', null, null, '2016-09-19', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3003', 'RISA  ', '5', '888010317522', null, null, '2016-09-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3004', 'IBU SRI  ', '5', '888010317514', null, null, '2016-09-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3005', 'NIA  ', '5', '888010317518', null, null, '2016-09-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3006', 'AI HASANAH  ', '5', '888010317517', null, null, '2016-09-19', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3007', 'SUSI ASHSERA  ', '5', '888010317523', null, null, '2016-09-19', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3008', ' INTAN DWI KURNIASIH  ', '5', '888010317516', null, null, '2016-09-19', '0', '1KG', '10000', '', '', '3', '63', '2016-09-20', null);
INSERT INTO `kb_no_resi` VALUES ('3009', 'YUNI CHANDRA  ', '5', '888010317543', null, null, '2016-09-19', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3010', 'HARIANTO  ', '5', '888010317520', null, null, '2016-09-19', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3011', 'NOVI HANDAYANI  ', '5', '888010317521', null, null, '2016-09-19', '0', '2KG', '25000', '42000', '17000', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3012', 'DIAN ANGGRAENI  ', '5', '888010317526', null, null, '2016-09-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3013', 'TRI UTAMI  ', '5', '888010317530', null, null, '2016-09-19', '0', '1KG', '33000', '33000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3014', 'NENI HARYATI  ', '5', '888010317533', null, null, '2016-09-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3015', 'LAILA MUFARIHA  ', '5', '888010317529', null, null, '2016-09-19', '0', '1KG', '28000', '25000', '-3000', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3016', 'DELLY AMELIA ', '5', '888010317538', null, null, '2016-09-19', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3017', 'INTAN DEWI HAPSARI  ', '5', '888010317542', null, null, '2016-09-19', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3018', 'DARLIS KANISA  ', '5', '888010317544', null, null, '2016-09-19', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3019', 'RIA NOVITASARI  ', '5', '888010317537', null, null, '2016-09-19', '0', '1KG', '11000', '', '', '3', '63', '2016-09-20', null);
INSERT INTO `kb_no_resi` VALUES ('3020', 'RUNI RIZY  ', '5', '888010317182', null, null, '2016-09-19', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3021', 'ARI GUNAWAN  ', '5', '888010317202', null, null, '2016-09-19', '0', '1KG', '46000', '46000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3022', 'LITA APRIANI  ', '5', '888010317535', null, null, '2016-09-19', '0', '1KG', '43000', '43000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3023', 'LIA DAHLIA  ', '5', '888010317524', null, null, '2016-09-19', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-09-20', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3024', 'NADIA ELLY  ', '5', '888010317534', null, null, '2016-09-19', '0', '1KG', '25000', '25000', '0', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3025', 'BD. ELLA NURLELA  ', '5', '888010317541', null, null, '2016-09-19', '0', '4KG', '44000', '33000', '-11000', '3', '66', '2016-09-20', '2016-09-20');
INSERT INTO `kb_no_resi` VALUES ('3026', 'SITI ZULLAICHA  ', '5', '888010317525', '0', null, '2016-09-19', '0', '5KG', '40000', '40000', '0', '3', '63', '2016-09-20', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3027', 'DR. TUTIK SRI LESTARI ', '6', '030044736342', null, null, '2016-09-20', '0', '1KG', '42000', '33000', '-9000', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3028', 'ERNOVIA  ', '3', '15275900030', null, null, '2016-09-20', '0', '415GR', '18880', '20000', '1120', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3029', 'FITRI AMELIA  ', '3', '15275900043', null, null, '2016-09-20', '0', '1970GR', '50640', '66000', '15360', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3030', 'VIRA ARSY  ', '5', '888010317930', null, null, '2016-09-20', '0', '1KG', '9000', '11000', '2000', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3031', 'EVI KUFIA MAHASANTI  ', '5', '888010317946', null, null, '2016-09-20', '0', '2KG', '52000', '', '', '3', '63', '2016-09-21', null);
INSERT INTO `kb_no_resi` VALUES ('3032', 'FEBTA ARI WAHYUNI ', '5', '888010317942', null, null, '2016-09-20', '0', '1KG', '9000', '', '', '3', '63', '2016-09-21', null);
INSERT INTO `kb_no_resi` VALUES ('3033', 'RISTRA JIWA  ', '5', '888010317938', null, null, '2016-09-20', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3034', 'ANITHA ZUHRIAN ', '5', ' 888010317941', null, null, '2016-09-20', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3035', 'ETIH BUDIARTI  ', '5', '888010317934', null, null, '2016-09-20', '0', '2KG', '18000', '11000', '-7000', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3036', 'DEBBY ANGGRAENI  ', '3', '888010317937', null, null, '2016-09-20', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3037', 'BPK. SUKIYAT  ', '5', '888010317933', null, null, '2016-09-20', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3038', ' IKE JUMAIDAH  ', '5', '888010317947', null, null, '2016-09-20', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3039', 'DINI WULANSARI  ', '5', '888010317943', null, null, '2016-09-20', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3040', 'LILY NURBAETY  ', '5', '888010317944', null, null, '2016-09-20', '0', '1KG', '9000', '', '', '3', '63', '2016-09-21', null);
INSERT INTO `kb_no_resi` VALUES ('3041', 'REFTA LISTIA  ', '5', '888010317939', null, null, '2016-09-20', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3042', 'RENI INDAH PRASTIWI  ', '5', '888010317940', null, null, '2016-09-20', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3043', 'SUSINTA  ', '5', '888010317935', null, null, '2016-09-20', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3044', 'NUR KAMNAH  ', '5', '888010317936', null, null, '2016-09-20', '0', '1KG', '22000', '21000', '-1000', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3045', 'PIPIT FITRIANA  ', '5', '888010317931', null, null, '2016-09-20', '0', '1KG', '14000', '14000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3046', 'NI\'MATUL BADRIYAH  ', '5', '888010317932', null, null, '2016-09-20', '0', '1KG', '22000', '', '', '3', '63', '2016-09-21', null);
INSERT INTO `kb_no_resi` VALUES ('3047', 'LISTIAWATI  ', '5', '888010317948', null, null, '2016-09-20', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3048', 'JIHAN MARIA ULFA  ', '5', '888010317945', null, null, '2016-09-20', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-21', '2016-09-21');
INSERT INTO `kb_no_resi` VALUES ('3049', 'ERNI  ', '5', '888010317929', null, null, '2016-09-20', '0', '1KG', '11000', '', '', '3', '63', '2016-09-21', null);
INSERT INTO `kb_no_resi` VALUES ('3050', 'YUNI KHAIRA ', '3', '15275900303', null, null, '2016-09-21', '0', '3500GR', '50615', '50000', '-615', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3051', 'DWI KARSIWI PENI  ', '1', 'BDOC105513612816', null, null, '2016-09-21', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3052', 'HERTIK SUHERTIKA/KANTIN HEGAR ', '1', 'BDOC105513632416', null, null, '2016-09-21', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3053', 'IBU VIVI  ', '5', '888010279180', null, null, '2016-09-21', '0', '4KG', '104000', '104000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3054', 'NUNIK PURWANTIK ', '5', '888010279170', null, null, '2016-09-21', '0', '2KG', '22000', '22000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3055', 'LULU ', '5', '888010279178', null, null, '2016-09-21', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3056', 'RINAWATI ', '5', '888010279174', '0', null, '2016-09-21', '0', '1KG', '46000', '46000', '0', '3', '63', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3057', 'HARTINI ', '5', '888010279177', null, null, '2016-09-21', '0', '1KG', '17000', '17000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3058', 'EKA MASIH ', '5', '888010279166', null, null, '2016-09-21', '0', '1KG', '16000', '', '', '3', '63', '2016-09-22', null);
INSERT INTO `kb_no_resi` VALUES ('3059', 'LIA DAHLIA  ', '5', '888010279173', null, null, '2016-09-21', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3060', 'DARLIS K NISA ', '5', '888010279169', null, null, '2016-09-21', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3061', 'SRI WIDYASTUTI ', '5', '888010279162', null, null, '2016-09-21', '0', '1KG', '28000', '28000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3062', 'YUNI HENDRA ', '5', '888010279165', null, null, '2016-09-21', '0', '1KG', '41000', '39000', '-2000', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3063', 'ITUT WIDYASTUTI ', '5', '888010279161', null, null, '2016-09-21', '0', '1KG', '11000', '10000', '-1000', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3064', 'ASEP SUHERMAN ', '5', '888010279179', null, null, '2016-09-21', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3065', 'DEWI MAYASARI ', '5', '888010279175', null, null, '2016-09-21', '0', '1KG', '28000', '25000', '-3000', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3066', 'SRI ADINI EKASTARTI ', '5', '888010279167', null, null, '2016-09-21', '0', '1KG', '17000', '18000', '1000', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3067', 'TOKO KAMIL  ', '5', '888010279168', null, null, '2016-09-21', '0', '1KG', '17000', '', '', '3', '63', '2016-09-22', null);
INSERT INTO `kb_no_resi` VALUES ('3068', 'MAMA NADA ', '5', '888010279163', null, null, '2016-09-21', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3069', 'NURHASANAH ', '5', '888010279171', '0', null, '2016-09-21', '0', '2KG', '36000', '36000', '0', '3', '63', '2016-09-22', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3070', 'DEWI YULIANA ', '5', '888010279179', null, null, '2016-09-21', '0', '1KG', '7000', '7000', '0', '3', '66', '2016-09-22', '2016-09-22');
INSERT INTO `kb_no_resi` VALUES ('3071', 'PARI YANSYAH  ', '2', '030044736471', null, null, '2016-09-22', '0', '2KG', '70000', '105000', '35000', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3072', 'ELOK FAZRIANA  ', '6', 'ABR79982', null, null, '2016-09-22', '0', '1KG', '10000', '18000', '8000', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3073', 'TITIN ( H AHMAD MUNIR ) ', '1', 'BDOC105514731716', null, null, '2016-09-22', '0', '2KG', '70000', '104000', '34000', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3074', 'AULIAN ROHMAN  ', '1', 'BDOC105514712116', null, null, '2016-09-22', '0', '1KG', '22000', '22000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3075', 'EKO OKTOVIANTO ', '1', 'BDOC105514721916', null, null, '2016-09-22', '0', '1KG', '28000', '22000', '-6000', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3076', 'URI KARNAYA  ', '3', '15275900585', null, null, '2016-09-22', '0', '1050gr', '35380', '25000', '-10380', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3077', 'WIENA HESNIANUR  ', '3', '15275900572', null, null, '2016-09-22', '0', '1315GR', '80380', '57000', '-23380', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3078', 'IRMA BUNDA ZAHRA  ', '5', '888010279372', null, null, '2016-09-22', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3079', 'BUNDA DIAH  ', '5', '888010279373', null, null, '2016-09-22', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3080', 'RUSMAN SUSANTO  ', '5', '888010279377', null, null, '2016-09-22', '0', '1KG', '22000', '28000', '6000', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3081', 'DEWI YULIZA  ', '5', '888010279363', null, null, '2016-09-22', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3082', 'ANA (LAPAK KECIL AUFA) ', '5', '888010279366', null, null, '2016-09-22', '0', '2KG', '44000', '44000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3083', 'ADINIA  ', '5', '888010279361', null, null, '2016-09-22', '0', '3KG', '57000', '57000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3084', 'IMAS SURYANI  ', '5', '888010279362', null, null, '2016-09-22', '0', '3KG', '27000', '18000', '-9000', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3085', 'BU RETNO  ', '5', '888010279368', null, null, '2016-09-22', '0', '3KG', '72000', '48000', '-24000', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3086', 'DWI PUJI LESTARI  ', '5', '888010279354', null, null, '2016-09-22', '0', '1KG', '18000', '', '', '3', '63', '2016-09-23', null);
INSERT INTO `kb_no_resi` VALUES ('3087', 'DEVI IMALIA ', '5', '888010279359', null, null, '2016-09-22', '0', '1KG', '9000', '9000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3088', 'IBU LILIS  ', '5', '888010279378', null, null, '2016-09-22', '0', '1KG', '14000', '13000', '-1000', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3089', 'TOKO YULI PALOM  ', '5', '888010279375', null, null, '2016-09-22', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3090', 'ZAKIAH  ', '5', '888010279374', null, null, '2016-09-22', '0', '1KG', '10000', '10000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3091', 'MBAK ANIS  ', '5', '888010279355', null, null, '2016-09-22', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3092', 'TINI M AKMAL  ', '5', '888010279371', null, null, '2016-09-22', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3093', 'IKA KUSUMAWATI  ', '5', '888010279370', null, null, '2016-09-22', '0', '1KG', '12000', '11000', '-1000', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3094', 'MEILINA NOFARI  ', '5', '888010279367', null, null, '2016-09-22', '0', '2KG', '86000', '43000', '-43000', '3', '66', '2016-09-23', '2016-09-23');
INSERT INTO `kb_no_resi` VALUES ('3095', 'PARI YANSYAH    ', '2', '030044736471', null, null, '2016-09-23', '0', '2KG', '70000', '105000', '35000', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3097', 'ELOK FAZRIANA   ', '6', 'ABR79982', null, null, '2016-09-23', '0', '1KG ', '10000', '18000', '8000', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3098', 'TITIN ( H AHMAD MUNIR ) ', '1', 'BDOC105514731716 ', null, null, '2016-09-23', '0', '2KG', ' 70000', '104000', '34000', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3099', 'AULIAN ROHMAN  ', '1', 'BDOC105514712116 ', null, null, '2016-09-23', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3100', 'EKO OKTOVIANTO ', '0', ' BDOC105514721916', null, null, '2016-09-23', '0', '1KG ', '28000', '22000', '-6000', '0', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3102', 'URI KARNAYA  ', '3', '15275900585 ', null, null, '2016-09-23', '0', '1050gr ', '35380', '25000', '-10380', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3103', ' WIENA HESNIANUR ', '3', ' 15275900572', null, null, '2016-09-23', '0', ' 1315GR ', '80380', '57000', '-23380', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3104', ' IRMA BUNDZ ZAHRA ', '5', ' 888010279372 ', null, null, '2016-09-23', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3105', ' BUNDA DIAH  ', '5', '888010279373', null, null, '2016-09-23', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3106', 'RUSMAN SUSANTO ', '5', ' 888010279377', null, null, '2016-09-23', '0', ' 1KG ', '22000', '28000', '6000', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3107', 'DEWI YULIZA  ', '5', '888010279363 ', null, null, '2016-09-23', '0', '1KG', ' 11000', '11000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3108', 'ANA (LAPAK KECIL AUFA) ', '3', '888010279366 ', null, null, '2016-09-23', '0', '2KG ', '44000', '44000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3109', 'ADINIA  ', '5', '888010279361 ', null, null, '2016-09-23', '0', '3KG ', '57000', '57000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3110', 'IMAS SURYANI  ', '5', '888010279362 ', null, null, '2016-09-23', '0', '3KG ', '27000', '18000', '-9000', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3111', 'BU RETNO  ', '5', '888010279368 ', null, null, '2016-09-23', '0', '3KG ', '72000', '48000', '-24000', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3112', 'DWI PUJI LESTARI  ', '5', '888010279354', null, null, '2016-09-23', '0', ' 1KG ', '18000', '18000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3113', 'DEVI IMALIA ', '5', '888010279359 ', null, null, '2016-09-23', '0', '1KG ', '9000', '9000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3114', ' IBU LILIS   ', '5', '888010279378 ', null, null, '2016-09-23', '0', '1KG', '14000', '13000', '-1000', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3115', 'TOKO YULI PALOM    ', '5', '888010279375', null, null, '2016-09-23', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3116', 'ZAKIAH  ', '5', '888010279374', null, null, '2016-09-23', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3117', 'MBAK ANIS ', '5', ' 888010279355', null, null, '2016-09-23', '0', ' 1KG', ' 11000', '11000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3118', 'TINI M AKMAL', '5', '  888010279371 ', null, null, '2016-09-23', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3119', 'IKA KUSUMAWATI  ', '5', '888010279370 ', null, null, '2016-09-23', '0', '1KG ', '12000', '11000', '-1000', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3120', 'MEILINA NOFARI  ', '5', '888010279367', null, null, '2016-09-23', '0', ' 2KG', '86000', '43000', '-43000', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3121', 'YUNI ANGGRAENI', '1', ' BDOL902395124116 ', null, null, '2016-09-23', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3122', 'WIDAWATI/MAMA LALA', '1', ' BDOL902395114316', null, null, '2016-09-23', '0', '1KG ', '17000', '17000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3123', 'UTIN SARIFAH', '1', ' BDOL902395104516', null, null, '2016-09-23', '0', ' 1KG', ' 28000', '28000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3124', 'TERA SUHARIAH ', '5', '888010279369', null, null, '2016-09-23', '0', ' 1KG', ' 11000', '11000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3125', 'BUNDA AGUSTINA MALINDA ', '5', '888010279365', null, null, '2016-09-23', '0', ' 1KG ', '33000', '33000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3126', 'VIRA ARSY  ', '5', '888010279353 ', null, null, '2016-09-23', '0', '1KG ', '9000', '9000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3127', ' MAHARANI EKA SARI ', '5', '888010279364', null, null, '2016-09-23', '0', ' 1KG', ' 22000', '22000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3128', ' KAYLA ', '5', '888010279360', null, null, '2016-09-23', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3129', 'ASRI ANTORO', '5', ' 888010279352 ', null, null, '2016-09-23', '0', '1KG', ' 22000', '22000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3130', 'RENY INDRAIYANTI', '5', ' 888010279351', null, null, '2016-09-23', '0', ' 1KG ', '37000', '37000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3131', 'SOLIKIN AO ', '5', '888010279357', null, null, '2016-09-23', '0', ' 1KG', ' 18000', '18000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3132', 'HUSNI AHAD HIDAYAH ', '5', '888010279356 ', null, null, '2016-09-23', '0', '1KG ', '18000', '18000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3133', 'BUNDA NURMA ', '5', '888010279350 ', null, null, '2016-09-23', '0', '1KG ', '19000', '19000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3134', ' NOVI HANDAYANI ', '5', '888010279342', null, null, '2016-09-23', '0', ' 1KG ', '42000', '42000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3135', 'NURHASANAH ', '5', '888010279340 ', null, null, '2016-09-23', '0', '1KG', ' 11000', '11000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3136', 'AAN SRI MULYATI ', '5', '888010279341', null, null, '2016-09-23', '0', ' 2KG ', '22000', '22000', '0', '3', '66', '2016-09-26', '2016-09-26');
INSERT INTO `kb_no_resi` VALUES ('3137', 'SARTIJO', '5', ' 888010280000', null, null, '2016-09-26', '0', ' 1KG', ' 28000', '28000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3138', 'IBU DIANA', '5', ' 888010279738 ', null, null, '2016-09-26', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3139', 'WIWIN SUGIARTO ', '5', '888010279981', null, null, '2016-09-26', '0', ' 1KG ', '18000', '18000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3140', ' EL VANIA FURIYANA', '5', ' 888010279973 ', null, null, '2016-09-26', '0', '1KG ', '22000', '15000', '-7000', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3141', 'ENI PURWANTI', '5', ' 888010279990', null, null, '2016-09-26', '0', ' 1KG', ' 18000', '18000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3142', 'ANDAN SARI', '5', ' 888010279991', null, null, '2016-09-26', '0', ' 1KG ', '36000', '36000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3143', 'PIPIT FITRIANA ', '5', '888010279988 ', null, null, '2016-09-26', '0', '1KG ', '14000', '14000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3144', 'DOMPOL DWI SETYONINGRUM ', '5', '888010279984 ', null, null, '2016-09-26', '0', '1KG', ' 16000', '16000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3145', 'AAN SRI MULYATI ', '5', '888010279684', null, null, '2016-09-26', '0', ' 1KG ', '11000', '22000', '11000', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3146', 'WITA SARI', '5', ' 888010279971', null, null, '2016-09-26', '0', ' 1KG ', '25000', '25000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3147', 'MARIANA/AFIFAH SHOP ', '5', '888010279686 ', null, null, '2016-09-26', '0', '8KG ', '296000', '296000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3148', 'INDRASTUTI ', '1', 'BDOC105518003916 ', null, null, '2016-09-26', '0', '1KG ', '35000', '35000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3149', 'ANGGIA MURNI ', '1', 'BDOC105518023516', null, null, '2016-09-26', '0', ' 1KG', ' 43000', '43000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3150', ' RIDHA AMALIA ', '1', 'BDOC105518013716', null, null, '2016-09-26', '0', ' 1KG', ' 25000', '25000', '0', '3', '66', '2016-09-27', '2016-09-27');
INSERT INTO `kb_no_resi` VALUES ('3151', 'DARLIS K NISA ', '5', '888010279987', null, null, '2016-09-27', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3152', 'ALFIANY MASCHAN ', '5', '888010311250', null, null, '2016-09-27', '0', ' 3KG ', '66000', '44000', '-22000', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3153', 'ANNISA ', '5', '888010311245', null, null, '2016-09-27', '0', ' 2KG', ' 50000', '50000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3154', 'IIY', '5', ' 888010279997', null, null, '2016-09-27', '0', ' 1KG ', '20000', '20000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3155', 'ISMIYATI ', '5', '888010311251 ', null, null, '2016-09-27', '0', '1KG ', '16000', '16000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3156', 'ANI SRI INDRAYATI ', '5', '888010279983 ', null, null, '2016-09-27', '0', '1KG ', '41000', '41000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3157', 'AYU NOVITASARI ', '5', '888010311259 ', null, null, '2016-09-27', '0', '1KG ', '25000', '25000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3158', 'ARIPIN TOYIB ', '5', '888010279995', null, null, '2016-09-27', '0', ' 1KG ', '22000', '22000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3159', 'PURI NARDYASTI ', '5', '8880101279999', null, null, '2016-09-27', '0', ' 1KG', '10000', '10000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3160', 'ACHMAD RAWANGGA', '5', ' 888010311269 ', null, null, '2016-09-27', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3161', 'LINA YULIANAH', '5', ' 888010279993', null, null, '2016-09-27', '0', ' 1KG ', '9000', '9000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3162', 'ANDI FERAWATI', '5', ' 888010279996', null, null, '2016-09-27', '0', ' 1KG', ' 10000', '10000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3163', 'ASNI SELENG ', '5', '888010279989 ', null, null, '2016-09-27', '0', '1KG ', '47000', '47000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3164', 'URIP SUMARTINAH ', '5', '888010279985', null, null, '2016-09-27', '0', ' 1KG ', '16000', '16000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3165', 'MELIANA NOFARI ', '5', '888010279685 ', null, null, '2016-09-27', '0', '1KG ', '43000', '43000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3166', 'NUR HIDAYATUN ', '5', '888010279687 ', null, null, '2016-09-27', '0', '1KG ', '28000', '28000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3167', 'HONIAWATY ', '5', '888010311268 ', null, null, '2016-09-27', '0', '1KG ', '16000', '16000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3168', 'BPK. DASIRUN ', '5', '888010279986 ', null, null, '2016-09-27', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3169', 'BU RETNO ', '5', '888010279982', null, null, '2016-09-27', '0', ' 1KG', ' 24000', '24000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3170', 'SUSILAWATI ', '5', '888010279994', null, null, '2016-09-27', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3171', 'LIA DAHLIA', '5', ' 888010279998', null, null, '2016-09-27', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3172', 'MUKTI INDAH ', '5', '888010311272', null, null, '2016-09-27', '0', ' 1KG', ' 22000', '22000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3173', 'RINA', '5', ' 888010311264', null, null, '2016-09-27', '0', ' 1KG', ' 25000', '25000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3174', 'BPK SUGIANTO', '5', ' 888010279992 ', null, null, '2016-09-27', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3175', 'NI\'MAH (H ROSADI) ', '5', '888010311265', null, null, '2016-09-27', '0', ' 1KG', ' 11000', '11000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3176', 'IRMA NURMALA ', '5', '888010311270', null, null, '2016-09-27', '0', ' 1KG', ' 22000', '22000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3177', 'SELY ', '5', '888010311271', null, null, '2016-09-27', '0', ' 2KG', ' 44000', '44000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3178', ' ELLY DHANY ', '5', '888010311266 ', null, null, '2016-09-27', '0', '9KG ', '90000', '90000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3179', 'TITIN NURHAYATI', '1', ' BDOC105519611016', null, null, '2016-09-27', '0', ' 1KG', ' 11000', '11000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3180', 'INDRAWATI IBRAHIM ', '1', 'BDOC105519620816 ', null, null, '2016-09-27', '0', '1KG ', '47000', '47000', '0', '3', '66', '2016-09-28', '2016-09-28');
INSERT INTO `kb_no_resi` VALUES ('3181', 'ETTY SOERYATI ', '1', 'BDOC105519630616', null, null, '2016-09-27', '0', ' 1KG ', '46000', '40000', '-6000', '3', '66', '2016-09-28', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3182', ' EKA PATMAWATI ', '1', 'BDOC105520931916', null, null, '2016-09-28', '0', ' 1KG ', '28000', '28000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3183', 'ZUYINA AYUNING', '3', ' 15275902101', null, null, '2016-09-28', '0', ' 270GR 17050', '17050', '18000.', '950', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3184', 'YEMMY/ SUGIARTO ', '3', '15275902114', null, null, '2016-09-28', '0', ' 870GR ', '28880', '30000', '1120', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3185', 'NOVITA MERIYANTI', '3', ' 15275902127 ', null, null, '2016-09-28', '0', '775GR ', '26880', '26000', '-880', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3186', '      MALA ', '5', ' 888010311676', null, null, '2016-09-28', '0', ' 5KG ', '55000', '44000', '-11000', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3187', ' LOLA DESTRIA ', '5', '888010311688', null, null, '2016-09-28', '0', ' 2KG ', '38000', '38000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3188', 'MUJI HARTATI ', '5', '888010311681 ', null, null, '2016-09-28', '0', '1KG', ' 16000', '22000', '6000', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3189', 'SUCIANA PUSPITA ', '5', ' 888010311684', null, null, '2016-09-28', '0', ' 2KG', ' 44000', '22000', '-22000', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3190', 'NOVI HANDAYANI ', '5', '888010311679', null, null, '2016-09-28', '0', ' 1KG ', '42000', '42000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3191', 'FAIJAH ', '5', '888010311694', null, null, '2016-09-28', '0', ' 1KG ', '19000', '19000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3192', 'LILY NURBATY ', '5', '888010311668 ', null, null, '2016-09-28', '0', '1KG ', '9000', '11000', '2000', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3193', 'MERYADI PRIYASTI  ', '5', '888010311685', null, null, '2016-09-28', '0', ' 1KG ', '19000', '19000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3194', 'DEWA ', '5', '888010311690 ', null, null, '2016-09-28', '0', '1KG', ' 10000', '10000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3195', 'LIA AHSANUN', '5', ' 888010311680 ', null, null, '2016-09-28', '0', '1KG', ' 16000', '32000', '16000', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3196', 'YOPIH YUJANAH ', '5', '888010311669', null, null, '2016-09-28', '0', ' 1KG ', '16000', '14000', '-2000', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3197', 'RUSMANTO ', '5', '888010311691', null, null, '2016-09-28', '0', ' 1KG', ' 10000', '10000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3198', 'SUHARJO  ', '5', '888010311687 ', null, null, '2016-09-28', '0', '1KG', ' 10000', '20000', '10000', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3199', 'AINUL USROTI', '5', ' 888010311686 ', null, null, '2016-09-28', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3200', ' EKA IRIANINGSIH ', '5', '888010311693', null, null, '2016-09-28', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3201', 'VITA NURYANI ', '5', '888010311689 ', null, null, '2016-09-28', '0', '1KG', ' 10000', '10000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3202', ' BIDAN DWI WAHYU ', '5', '888010311673 ', null, null, '2016-09-28', '0', '2KG', ' 44000', '22000', '-22000', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3203', 'TOKO YULI PALOM    ', '5', ' 888010311692', null, null, '2016-09-28', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3204', 'WIDA NURUL AZIZAH', '5', ' 888010311672 ', null, null, '2016-09-28', '0', '1KG ', '17000', '17000', '0', '3', '66', '2016-09-29', '2016-09-29');
INSERT INTO `kb_no_resi` VALUES ('3205', 'M SYAHMURI ', '6', 'ABS31352 ', null, null, '2016-09-26', '0', '1KG ', '17000', '17000', '0', '3', '66', '2016-09-29', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3206', 'YUNI ANGGRAENI', '1', 'BDOC105522105116', null, null, '2016-09-29', '0', ' 1KG ', '19000', '19000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3207', 'MEILINA NIFARI ', '5', '888010311670', null, null, '2016-09-29', '0', ' 2KG ', '86000', '86000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3208', ' IMA LAILATUL ', '5', '888010329072 ', null, null, '2016-09-29', '0', '1KG', ' 28000', '28000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3209', 'HARYANI ', '5', '888010311677 ', null, null, '2016-09-29', '0', '3KG ', '126000', '84000', '-42000', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3210', 'LIA DAHLIA', '5', ' 888010329071 ', null, null, '2016-09-29', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3211', 'HERTIK DWI ', '5', '888010329069 ', null, null, '2016-09-29', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3212', 'DEWI YULIZA', '5', ' 888010311697 ', null, null, '2016-09-29', '0', '1KG  ', '11000', '11000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3213', 'JIHAN MARIA ', '5', '888010311696 ', null, null, '2016-09-29', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3214', 'RINI WIDIASTUTI', '5', ' 888010311707 ', null, null, '2016-09-29', '0', '1KG ', '28000', '28000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3215', 'DEVI IMALIA ', '5', '888010311933 ', null, null, '2016-09-29', '0', '1KG ', '9000', '9000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3216', 'YULIANTI/PA OBAR ', '5', '888010311701', null, null, '2016-09-29', '0', ' 1KG ', '7000', '7000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3217', 'BD ELLA NURLALA', '5', '1KG ', null, null, '2016-09-29', '0', ' 888010311671 ', '11000', '11000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3218', 'GIAN BABYSHOP', '5', ' 888010311666 ', null, null, '2016-09-29', '0', '1KG', ' 28000', '28000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3219', 'SRI YUMARTI ', '5', '888010311667 ', null, null, '2016-09-29', '0', '1KG ', '55000', '55000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3220', 'KHOIRUNISA ', '5', '888010311665', null, null, '2016-09-29', '0', ' 1KG ', '22000', '22000', '0', '3', '66', '2016-09-30', '2016-09-30');
INSERT INTO `kb_no_resi` VALUES ('3221', 'DIANA PURBASARI', '5', ' 888010329446', null, null, '2016-09-30', '0', ' 1KG ', '20000', '20000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3222', 'DELLY AMELIA ', '5', '888010329449 ', null, null, '2016-09-30', '0', '1KG', ' 10000', '10000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3223', 'URIP ', '5', '888010329436', null, null, '2016-09-30', '0', ' 1KG ', '16000', '16000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3224', 'NURUL SELIANI ', '5', '888010329443 ', null, null, '2016-09-30', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3225', 'BUTIK ADLYN ', '5', '888010329444 ', null, null, '2016-09-30', '0', '1KG', ' 47000', '47000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3226', 'MERYADI PRIYASTI', '5', ' 888010329438 ', null, null, '2016-09-30', '0', '1KG ', '19000', '19000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3227', 'IRES', '5', ' 888010329437 ', null, null, '2016-09-30', '0', '1KG  ', '25000', '25000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3228', ' JAJAT SUDRAJAT', '5', ' 888010329439 ', null, null, '2016-09-30', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3229', 'SUSINTA', '5', ' 888010329053 ', null, null, '2016-09-30', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3230', ' IBU DWI RAHAYU ', '5', '888010329055 ', null, null, '2016-09-30', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3231', 'ISNANI  ', '5', '888010329048 ', null, null, '2016-09-30', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3232', 'LISTIAWATI ', '5', '888010329051', null, null, '2016-09-30', '0', ' 1KG', ' 11000', '11000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3233', 'LIA AHSANUN ', '5', '888010329052', null, null, '2016-09-30', '0', ' 2KG ', '32000', '32000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3234', 'EKA PRASETYANINGSIH ', '5', '888010329050 ', null, null, '2016-09-30', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3235', 'KHOIRUNISA ', '5', '888010329054 ', null, null, '2016-09-30', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3236', 'NENENG HAERANI ', '5', '888010329031 ', null, null, '2016-09-30', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3237', 'DESI DAMATIK ', '5', '888010329047 ', null, null, '2016-09-30', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3238', 'TANTI PRATININGSIH ', '5', '888010329035 ', null, null, '2016-09-30', '0', '1KG ', '7000', '7000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3239', 'DEWI YULIANA WATI ', '5', '888010329039', null, null, '2016-09-30', '0', ' 1KG ', '7000', '7000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3240', 'ERNIYAH/EER ', '5', '888010329043 ', null, null, '2016-09-30', '0', '1KG ', '11000????', '', 'NaN', '3', '64', '2016-10-01', null);
INSERT INTO `kb_no_resi` VALUES ('3241', 'YUNIARSIH ', '5', '888010329029 ', null, null, '2016-09-30', '0', '1KG ', '25000', '25000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3242', 'IKA KARTIKA ', '5', ' 888010329033', null, null, '2016-09-30', '0', ' 1KG ', '25000', '25000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3243', 'WINA RAHMAWATI ', '5', '888010329037 ', null, null, '2016-09-30', '0', '1KG ', '9000', '9000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3244', 'SUCI AYU PRATIWI ', '5', '888010329041', null, null, '2016-09-30', '0', ' 2KG', '20000', '20000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3245', 'DESY LAILY ', '5', '888010329045 ', null, null, '2016-09-30', '0', '1KG', ' 10000', '10000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3246', 'NURIDA ISNAINI ', '5', '888010329030 ', null, null, '2016-09-30', '0', '1KG ', '20000', '26000', '6000', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3247', 'LULU ', '5', '888010329034 ', null, null, '2016-09-30', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3248', 'BPK DASIRUN ', '5', '888010329038 ', null, null, '2016-09-30', '0', '1KG ', '10000', '11000', '1000', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3249', 'DARLIS K. NISA ', '5', '888010329042 ', null, null, '2016-09-30', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3250', 'TOKO YULI PALOM ', '5', '888010329028 ', null, null, '2016-09-30', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3251', 'YULIA FADILAH ', '5', '888010329049 ', null, null, '2016-09-30', '0', '1KG ', '10000', '24000', '14000', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3252', 'TUTY NURFADILAH ', '5', '888010329032', null, null, '2016-09-30', '0', ' 3KG ', '30000', '30000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3253', 'TOKO KAMIL', '5', ' 888010329036 ', null, null, '2016-09-30', '0', '1KG ', '17000', '17000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3254', 'MARFUAH ', '5', '888010329040 ', null, null, '2016-09-30', '0', '1KG ', '22000', '19000', '-3000', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3255', 'YEYEN ', '5', '888010329056 ', null, null, '2016-09-30', '0', '1KG', ' 10000', '10000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3256', 'WIDA ', '5', '888010329044', null, null, '2016-09-30', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3257', 'AHMAD NUJIB ', '5', '888010329046', null, null, '2016-09-30', '0', ' 1KG ', '7000', '7000', '0', '3', '66', '2016-10-01', '2016-10-01');
INSERT INTO `kb_no_resi` VALUES ('3258', 'PIPIT FITRIANI ', '5', '888010329445 ', null, null, '2016-09-30', '0', '1KG', ' 14000', '14000', '0', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3259', 'MIEDA ', '3', '15275902672 ', null, null, '2016-10-01', '0', '4075GR ', '50225', '50000', '-225', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3260', 'URI KARNAYA  ', '3', '15275902669', null, null, '2016-10-01', '0', ' 710GR ', '28550', '25000', '-3550', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3261', 'UYINA AYUNING SAPUTRI', '3', ' 15275902656 ', null, null, '2016-10-01', '0', '460GR ', '17050', '18000', '950', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3262', 'ASMA NIDA  ', '5', 'ABT16047', null, null, '2016-10-01', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3264', 'ERNI  ', '5', '888010311397 ', null, null, '2016-10-01', '0', '2KG ', '22000', '22000', '0', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3265', 'JIHAN MARIA ULFA', '5', ' 888010329555', null, null, '2016-10-01', '0', ' 1KG', ' 22000', '22000', '0', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3266', 'LAILA MUFARIHA  ', '5', '888010329561 ', null, null, '2016-10-01', '0', '2KG ', '56000', '44000', '-12000', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3267', 'ITUT WIDYASTUTI', '5', ' 888010311396 ', null, null, '2016-10-01', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3268', 'ANITA WOTAVIA', '5', ' 888010329560', null, null, '2016-10-01', '0', ' 1KG', ' 16000', '16000', '0', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3269', 'NIA ', '5', '888010329553 ', null, null, '2016-10-01', '0', '1KG', ' 11000', '11000', '0', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3270', 'ATIK WAHYUNINGSIH ', '5', '888010329557', null, null, '2016-10-01', '0', ' 1KG ', '16000', '16000', '0', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3271', 'MAMA RAISYAH ', '5', '888010329556', null, null, '2016-10-01', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3272', 'SOLIKIN AO', '6', ' ABT15997', null, null, '2016-10-01', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-10-03', '2016-10-03');
INSERT INTO `kb_no_resi` VALUES ('3273', 'FAKHATUN ', '1', 'BCOC105526461516 ', null, null, '2016-10-03', '0', '1KG', ' 11000', '11000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3274', 'YUDI SAPUTRA ', '1', 'BDOC105526441916 ', null, null, '2016-10-03', '0', '1KG ', '40000', '40000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3275', 'WINDY FEBRIONELLIN', '3', ' 15275903211', null, null, '2016-10-03', '0', ' 960GR', ' 37550', '80000', '42450', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3276', 'AYU NOVITASARI ', '5', '888010329829 ', null, null, '2016-10-03', '0', '1KG ', '25000', '25000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3277', 'LISNA SARI ', '5', '888010329780', null, null, '2016-10-03', '0', ' 1KG', ' 9000', '9000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3278', 'TANTI PRIANINGSIH ', '5', '888010329813 ', null, null, '2016-10-03', '0', '1KG', ' 7000', '7000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3279', 'FITRIA ULFAH ', '5', '888010329817 ', null, null, '2016-10-03', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3280', 'MERYADI ', '5', '888010329816', null, null, '2016-10-03', '0', ' 1KG ', '19000', '19000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3281', 'AGUS SETIAJI ', '5', '888010329777', null, null, '2016-10-03', '0', ' 1KG ', '33000', '33000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3282', 'CHOIR EXPRESS ', '5', '888010329820 ', null, null, '2016-10-03', '0', '1KG', ' 10000', '10000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3283', 'DEVI IMALIA ', '5', '888010329830 ', null, null, '2016-10-03', '0', '1KG ', '9000', '9000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3284', 'LAILA MUFARIHA ', '5', '888010329826 ', null, null, '2016-10-03', '0', '1KG ', '28000', '28000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3285', 'DWI PUTRI MIFTAHUS SAADAH', '5', ' 888010329827 ', null, null, '2016-10-03', '0', '1KG ', '18000', '18000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3286', 'ANI H, H YAKUP ', '5', '888010329822', null, null, '2016-10-03', '0', ' 2KG ', '20000', '10000', '-10000', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3287', 'DESI ROSFIANTI', '5', ' 888010329823', null, null, '2016-10-03', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3288', 'DINI WULANSARI ', '5', '888010329828', null, null, '2016-10-03', '0', ' 1KG ', '9000', '9000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3289', 'KALILA  ', '5', '888010329821 ', null, null, '2016-10-03', '0', '1KG', ' 10000', '10000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3290', 'PING ', '5', '888010329776 ', null, null, '2016-10-03', '0', '1KG', ' 25000', '25000', '0', '0', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3291', 'DENTI AISYAH ', '5', '888010329824 ', null, null, '2016-10-03', '0', '1KG', ' 11000', '11000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3292', 'YULIANI RATNINGSIH ', '5', '888010329825 ', null, null, '2016-10-03', '0', '1KG ', '9000', '11000', '2000', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3293', 'PAK TUGINO', '5', '  888010329772 ', null, null, '2016-10-03', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3294', 'LILI NURBAETI ', '5', '888010329773 ', null, null, '2016-10-03', '0', '1KG', ' 9000', '9000', '0', '3', '66', '2016-10-04', '2016-10-04');
INSERT INTO `kb_no_resi` VALUES ('3295', 'YUNI CHANDRA ', '5', '888010329770', null, null, '2016-10-04', '0', ' 1KG ', '22000', '22000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3296', 'AJENG PUSPITASARI ', '5', '888010329768', null, null, '2016-10-04', '0', ' 1KG ', '22000', '18000', '-4000', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3297', 'HUSNI AHAD HIDAYAH', '5', ' 888010329767 ', null, null, '2016-10-04', '0', '2KG', ' 36000', '18000', '-18000', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3298', 'RUMAH VINA ', '5', '888010329766 ', null, null, '2016-10-04', '0', '2KG', ' 38000', '44000', '6000', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3299', 'RIZKA BENGKEL MEKANIKA ', '5', '888010329765 ', null, null, '2016-10-04', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3300', 'NURHASANAH', '5', ' 888010329764', null, null, '2016-10-04', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3301', 'LILY NURBAETY ', '5', '888010329763', null, null, '2016-10-04', '0', ' 1KG ', '9000', '11000', '2000', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3302', 'DWI ANA ARIFAH ', '5', '888010329762', null, null, '2016-10-04', '0', ' 1KG ', '22000', '22000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3303', 'MAEMUNAH ', '5', '888010329761', null, null, '2016-10-04', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3304', 'RESQITA (ICA) ', '5', '888010329760', null, null, '2016-10-04', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3305', 'SUSINTA', '5', ' 888010329811', null, null, '2016-10-04', '0', ' 1KG', ' 10000', '10000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3306', 'NITHA ', '5', '888010329771 ', null, null, '2016-10-04', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3307', 'RIA NOPITASARI ', '5', '888010329774', null, null, '2016-10-04', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3308', 'YAYUK', '5', ' 888010329812 ', null, null, '2016-10-04', '0', '1KG ', '53000', '53000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3309', 'MAMA RAISYAH', '5', ' 888010329814 ', null, null, '2016-10-04', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3310', 'FAIZAH ', '5', '888010329815 ', null, null, '2016-10-04', '0', '1KG ', '28000', '28000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3311', 'DWI PUTRI MIFTAHUS SAADAH', '5', ' 888010329818 ', null, null, '2016-10-04', '0', '1KG ', '18000', '18000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3312', 'EMMY DIAN RAMADHANI  ', '5', '888010329819 ', null, null, '2016-10-04', '0', '1KG ', '7000', '6000', '-1000', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3313', 'NAMIRA ', '1', 'BDOC105528291116', null, null, '2016-10-04', '0', ' 1KG ', '35000', '35000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3314', ' HADI ISMANTO ', '1', 'BDOC105528281316 ', null, null, '2016-10-04', '0', '2KG ', '94000', '94000', '0', '3', '66', '2016-10-05', '2016-10-05');
INSERT INTO `kb_no_resi` VALUES ('3315', 'TUWARLAN ', '3', '15275904090 ', null, null, '2016-10-05', '0', '360GR ', '24050', '24000', '-50', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3316', 'MALA ', '5', '888013724505', null, null, '2016-10-05', '0', ' 4KG ', '44000', '44000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3317', 'TOKO YULI PALOM ', '5', ' 888013724517 ', null, null, '2016-10-05', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3318', 'SUCIANA PUSPITAARUM ', '5', '888013724516 ', null, null, '2016-10-05', '0', '1KG', ' 22000', '22000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3319', 'DEWA', '5', ' 888013724515', null, null, '2016-10-05', '0', ' 1KG ', '10000', '11000', '1000', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3320', 'HAKIMAN ', '5', ' 888013724514', null, null, '2016-10-05', '0', ' 1KG ', '10000', '11000', '1000', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3321', 'MUJIASIH ', '5', '888013724513', null, null, '2016-10-05', '0', ' 1KG ', '22000', '22000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3322', 'NUNIK PURWANTI', '5', ' 888013724512 ', null, null, '2016-10-05', '0', '1KG', ' 11000', '11000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3323', 'YULIKA TITI', '5', ' 888013724511 ', null, null, '2016-10-05', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3324', 'BU AGUNG', '5', ' 888013724510', null, null, '2016-10-05', '0', ' 1KG', ' 22000', '22000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3325', 'ASNI SELENA ', '5', '888013724509 ', null, null, '2016-10-05', '0', '2KG ', '94000', '94000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3326', 'DWI MAHITASARI', '5', ' 888013724508 ', null, null, '2016-10-05', '0', '1KG', ' 11000', '11000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3327', 'MAMA IZZA', '5', ' 888013724507 ', null, null, '2016-10-05', '0', '1KG ', '9000', '9000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3328', 'LISTIAWATI ', '5', '888013724506', null, null, '2016-10-05', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3329', 'KOKOM KOMARIAH', '5', ' 888013724504 ', null, null, '2016-10-05', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3330', 'JIHAN MARIA ULFA ', '5', '888013724503', null, null, '2016-10-05', '0', ' 1KG ', '22000', '22000', '0', '3', '66', '2016-10-06', '2016-10-06');
INSERT INTO `kb_no_resi` VALUES ('3331', 'RISNA HAKIM ', '1', 'BDOC105530832116', null, null, '2016-10-06', '0', ' 1.20KG ', '47000', '94000', '47000', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3332', 'TANTI PRIANINGSIH ', '5', '888013724848 ', null, null, '2016-10-06', '0', '1KG ', '7000', '14000', '7000', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3333', 'RAMA YANTI ', '5', '888013724849 ', null, null, '2016-10-06', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3334', 'RAHAYU GAMA ', '5', '888013724845', null, null, '2016-10-06', '0', ' 2KG ', '18000', '36000', '18000', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3335', 'ELLY DANNY', '5', ' 888013724844 ', null, null, '2016-10-06', '0', '2KG', ' 20000', '20000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3336', ' ITUT WIDYASTUTI', '5', ' 888013724841 ', null, null, '2016-10-06', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3337', 'NANI FAISAL', '5', ' 888013724850 ', null, null, '2016-10-06', '0', '1KG', ' 10000', '10000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3338', 'JEPTY MALASARI ', '5', '888013724828 ', null, null, '2016-10-06', '0', '1KG ', '19000', '19000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3339', 'SARTIYO', '5', ' 888013724846', null, null, '2016-10-06', '0', ' 1KG ', '28000', '28000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3340', 'MAMA ANGGUN ', '5', '888013724829', null, null, '2016-10-06', '0', ' 1KG', ' 10000', '10000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3341', 'NURHASANAH', '5', ' 888013724847', null, null, '2016-10-06', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3342', 'YANTI SUSILAWATI', '5', ' 888013724830', null, null, '2016-10-06', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3343', 'NURMIYATI', '5', ' 888013724842', null, null, '2016-10-06', '0', ' 1KG ', '42000', '42000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3344', 'WINA RAHMAWATI ', '5', '888013724843 ', null, null, '2016-10-06', '0', '1KG', ' 9000', '9000', '0', '3', '66', '2016-10-07', '2016-10-07');
INSERT INTO `kb_no_resi` VALUES ('3345', ' IBU VIVI ', '5', '888013652231', null, null, '2016-10-07', '0', ' 6KG ', '156000', '156000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3346', 'INDI PITRIA ', '5', ' 888013652232 ', null, null, '2016-10-07', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3347', 'MERYADI PRIYASTI ', '5', '888013724832', null, null, '2016-10-07', '0', ' 2KG', ' 38000', '38000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3348', 'ARINA DEWI ', '5', '888013724831', null, null, '2016-10-07', '0', ' 1KG ', '22000', '22000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3349', 'IRMA NURMALA ', '3', ' 888013724835', null, null, '2016-10-07', '0', ' 1KG', ' 10000', '11000', '1000', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3350', 'ANNISA ', '5', '888013652235', null, null, '2016-10-07', '0', ' 1KG ', '18000', '18000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3351', 'IKA KUSUMAWATI  ', '5', ' 888013724834', null, null, '2016-10-07', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3352', 'CAHYATI', '5', ' 888013724839', null, null, '2016-10-07', '0', ' 1KG ', '9000', '9000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3353', 'SATIYANI', '5', ' 888013652237 ', null, null, '2016-10-07', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3354', 'NURHASANAH ', '5', '888013652236', null, null, '2016-10-07', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3355', 'MINTARSIH', '5', ' 88801652234', null, null, '2016-10-07', '0', ' 1KG', ' 11000', '11000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3356', 'RAHAYU GANIA ', '5', '888013652233', null, null, '2016-10-07', '0', ' 1KG ', '18000', '018000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3357', 'NANI FAISAL ', '5', '888013724838 ', null, null, '2016-10-07', '0', '1KG ', '10000', '', '-10000', '3', '64', '2016-10-08', null);
INSERT INTO `kb_no_resi` VALUES ('3358', 'NURANISA ', '3', '888013724833 ', null, null, '2016-10-07', '0', '1KG', '11000', '11000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3359', 'BPK. USEP ISMADI ', '5', '888013652238', null, null, '2016-10-07', '0', ' 1KG ', '7000', '7000', '0', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3360', 'TUTY NURFADILAH', '5', ' 888013724837', null, null, '2016-10-07', '0', ' 3KG', ' 30000', '40000', '10000', '3', '66', '2016-10-08', '2016-10-08');
INSERT INTO `kb_no_resi` VALUES ('3361', 'ENDANG ', '5', '888013724836 ', null, null, '2016-10-08', '0', '1KG ', '28000', '28000', '0', '3', '66', '2016-10-10', '2016-10-10');
INSERT INTO `kb_no_resi` VALUES ('3362', 'ENIK ERNAWATI ', '5', '888013652185', null, null, '2016-10-08', '0', ' 1KG ', '33000', '33000', '0', '3', '66', '2016-10-10', '2016-10-10');
INSERT INTO `kb_no_resi` VALUES ('3363', 'NAILUL AZMI', '5', ' 888013652189', null, null, '2016-10-08', '0', ' 1KG ', '25000', '25000', '0', '3', '66', '2016-10-10', '2016-10-10');
INSERT INTO `kb_no_resi` VALUES ('3364', ' SARTIJO', '5', ' 888013724840 ', null, null, '2016-10-08', '0', '1KG ', '28000', '28000', '0', '3', '66', '2016-10-10', '2016-10-10');
INSERT INTO `kb_no_resi` VALUES ('3365', 'ISNANI  ', '5', '888013652181', null, null, '2016-10-08', '0', ' 2KG', ' 44000', '44000', '0', '3', '66', '2016-10-10', '2016-10-10');
INSERT INTO `kb_no_resi` VALUES ('3366', 'NURHASANAH ', '5', '888013652192', null, null, '2016-10-08', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-10', '2016-10-10');
INSERT INTO `kb_no_resi` VALUES ('3367', ' FITRI WAHYUNI', '5', ' 888013652184', null, null, '2016-10-08', '0', ' 1KG ', '47000', '26000', '-21000', '3', '66', '2016-10-10', '2016-10-10');
INSERT INTO `kb_no_resi` VALUES ('3368', 'HJ SITI M ', '5', '888013652180 ', null, null, '2016-10-08', '0', '2KG ', '44000', '70000', '26000', '3', '66', '2016-10-10', '2016-10-10');
INSERT INTO `kb_no_resi` VALUES ('3369', ' TAUFIK R ', '5', '888013652190 ', null, null, '2016-10-08', '0', '1KG ', '9000', '9000', '0', '3', '66', '2016-10-10', '2016-10-10');
INSERT INTO `kb_no_resi` VALUES ('3370', 'PURI NARDYANI ', '3', '888013652188 ', null, null, '2016-10-08', '0', '1KG ', '10000', '11000', '1000', '3', '66', '2016-10-10', '2016-10-10');
INSERT INTO `kb_no_resi` VALUES ('3371', 'EDI SUSANTO', '3', ' 15275905311', null, null, '2016-10-10', '0', ' 625GR ', '30550', '28000', '-2550', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3372', 'PING ', '2', '030044826827 ', null, null, '2016-10-10', '0', '2.50KG ', '66000', '44000', '-22000', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3373', 'INA MUTHMAIMANAH', '1', ' BDOC105534362316 ', null, null, '2016-10-10', '0', '1KG ', '17000', '', '-17000', '3', '64', '2016-10-11', null);
INSERT INTO `kb_no_resi` VALUES ('3374', 'ELLY NURHAYATI ', '5', '888013652804 ', null, null, '2016-10-10', '0', '2KG ', '22000', '33000', '11000', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3376', 'DESI ROSFIANTI ', '5', '888013652803', null, null, '2016-10-10', '0', ' 1KG ', '11000', '22000', '11000', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3377', 'DINI WULAN SARI', '5', ' 888013652800 ', null, null, '2016-10-10', '0', '1KG', ' 9000', '9000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3378', 'HJ ERNI MUCHTARDIANI ', '5', '888013652793', null, null, '2016-10-10', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3379', 'LIA DAHLIA', '5', ' 888013652795', null, null, '2016-10-10', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3380', 'ANI.H, H YAKUP ', '5', '888013652791 ', null, null, '2016-10-10', '0', '1KG  ', ' 10000', '10000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3381', 'SANNY PERMATASARI ', '5', '888013652807', null, null, '2016-10-10', '0', ' 2KG ', '36000', '36000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3382', ' ROSZA MADINA', '5', ' 888013652789', null, null, '2016-10-10', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3383', 'TOKO YULI PALOM ', '5', '888013652805', null, null, '2016-10-10', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3384', 'AINI ', '5', '888013652801 ', null, null, '2016-10-10', '0', '1KG ', '7000', '7000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3385', 'ANITA WOTAVIA ', '5', '888013652798', null, null, '2016-10-10', '0', ' 1KG ', '16000', '16000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3386', 'SUSILAWATI ', '5', '888013652808', null, null, '2016-10-10', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3387', 'BPK SANDI ', '5', '888013652799 ', null, null, '2016-10-10', '0', '1KG ', '11000', '11000', '0', '3', '66', '2016-10-11', '2016-10-11');
INSERT INTO `kb_no_resi` VALUES ('3388', 'LILIS LATIFAH ', '5', '888013652794', null, null, '2016-10-11', '0', ' 1KG ', '9000', '11000', '2000', '3', '66', '2016-10-11', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3390', 'UMAH NURROHMAH', '5', ' 888013687093', null, null, '2016-10-11', '0', ' 1KG ', '18000', '18000', '0', '3', '66', '2016-10-11', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3391', 'RIA NOPITASARI', '5', ' 888013687094', null, null, '2016-10-11', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-11', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3392', 'SUSINTA', '5', ' 888013652796', null, null, '2016-10-11', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-10-11', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3393', ' JIHAN MARIA ULFA ', '5', '888013652792', null, null, '2016-10-11', '0', ' 1KG ', '22000', '22000', '0', '3', '66', '2016-10-11', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3394', 'MEILINA NOFARI', '5', ' 888013652797', null, null, '2016-10-11', '0', ' 1KG ', '43000', '43000', '0', '3', '66', '2016-10-11', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3395', 'PIPIT FITRIANA MUKTI ', '5', '888013652790', null, null, '2016-10-11', '0', ' 1KG ', '14000', '14000', '0', '3', '66', '2016-10-11', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3396', 'ANNISA ', '5', '888013652806 ', null, null, '2016-10-11', '0', '1KG', ' 18000', '18000', '0', '3', '66', '2016-10-11', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3397', 'EDI KURNIAWAN ', '5', '888013652802', null, null, '2016-10-11', '0', ' 1KG ', '18000', '18000', '0', '3', '66', '2016-10-11', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3398', 'URI KARNAYA ', '3', '15275905704 ', null, null, '2016-10-11', '0', '1625GR ', '55880', '50000', '-5880', '3', '66', '2016-10-11', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3399', 'WINDY FEBRIONELLIN', '3', ' 15275906103', null, null, '2016-10-12', '0', ' 280GR ', '34050', '', '-34050', '3', '64', '2016-10-12', null);
INSERT INTO `kb_no_resi` VALUES ('3400', 'ANITA DIAH R', '1', ' BDOC105537799216', null, null, '2016-10-12', '0', ' 1KG ', '19000', '19000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3401', 'WIWI ', '1', 'BDOC105537789416', null, null, '2016-10-12', '0', ' 1KG', ' 47000', '47000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3402', 'TRILITA YULIASTUTI', '1', ' BDOC105537779616', null, null, '2016-10-12', '0', ' 2KG ', '44000', '44000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3403', 'KESY SANUSI  ', '5', '888013687140', null, null, '2016-10-12', '0', ' 1KG ', '47000', '94000', '47000', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3404', 'SITI KOMARIAH ', '5', '888013687448 ', null, null, '2016-10-12', '0', '2KG ', '22000', '22000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3405', 'RINAWATI ', '3', '888013687447', null, null, '2016-10-12', '0', ' 2KG ', '92000', '92000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3406', 'NASRAYATI', '5', ' 888013687141 ', null, null, '2016-10-12', '0', '1KG ', '36000', '36000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3407', 'DINI WULANSARI ', '5', '888013687142', null, null, '2016-10-12', '0', ' 1KG ', '9000', '9000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3408', 'BUNDA ZAKARIA ', '5', '888013687444', null, null, '2016-10-12', '0', ' 1KG ', '10000', '10000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3409', ' KHOIRUNISSA ', '5', '888013687143', null, null, '2016-10-12', '0', ' 1KG', ' 22000', '22000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3410', 'ENDANG SRI RAHAYU ', '5', '888013687138', null, null, '2016-10-12', '0', ' 1KG ', '28000', '28000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3411', 'LUS LUSIANA ', '5', '888013687139', null, null, '2016-10-12', '0', ' 1KG', ' 18000', '18000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3412', 'ENDANG ALWATI ', '5', '888013687446 ', null, null, '2016-10-12', '0', '1KG ', '43000', '43000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3413', 'TOKO YULI PALOM    ', '5', '888013687445 ', null, null, '2016-10-12', '0', '1KG', ' 11000', '11000', '0', '3', '66', '2016-10-12', '2016-10-12');
INSERT INTO `kb_no_resi` VALUES ('3414', 'SOLIKIN AO ', '6', 'ABV56492 ', null, null, '2016-10-13', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3415', ' LEILA FATHIN', '1', ' BDOC105532808816 ', null, null, '2016-10-13', '0', '1KG ', '25000', '25000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3416', 'IBU NINUK SURYANDARI ', '1', 'BDOC105539290616', null, null, '2016-10-13', '0', ' 1KG', ' 11000', '10000', '-1000', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3417', 'LINDA KRISMAYANTI ', '5', '888013687770 ', null, null, '2016-10-13', '0', '1KG', ' 10000', '10000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3418', 'SOPHIE/TOKO RIZKI ', '5', '888013687771', null, null, '2016-10-13', '0', ' 1KG', ' 7000', '7000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3419', 'SELLY', '5', ' 888013687772', null, null, '2016-10-13', '0', ' 1KG', ' 22000', '22000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3420', 'NASIKHATUL MUFIDA ', '5', '888013687144', null, null, '2016-10-13', '0', ' 1KG ', '22000', '22000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3421', 'ANI H, H YAKUP', '5', ' 888013687766 ', null, null, '2016-10-13', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3422', 'FITRIYANI ', '5', '888013687767 ', null, null, '2016-10-13', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3423', 'MAERIA ANTIKA', '5', ' 888013687762 ', null, null, '2016-10-13', '0', '1KG ', '22000', '22000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3424', 'IVA', '5', ' 888013687763 ', null, null, '2016-10-13', '0', '1KG ', '10000', '10000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3425', 'TRI APLIANI', '5', ' 888013687769', null, null, '2016-10-13', '0', ' 1KG ', '25000', '25000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3426', ' CHANDRA BERLIAN ', '5', '888013687768 ', null, null, '2016-10-13', '0', '1KG ', '19000', '19000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3427', 'RIA NOVITASARI/WAWAN', '5', ' 888013687764 ', null, null, '2016-10-13', '0', '1KG ', '11000', '', '-11000', '3', '64', '2016-10-14', null);
INSERT INTO `kb_no_resi` VALUES ('3428', 'SARTIJO ', '5', '888013687765', null, null, '2016-10-13', '0', ' 1KG', ' 28000', '28000', '0', '3', '66', '2016-10-14', '2016-10-14');
INSERT INTO `kb_no_resi` VALUES ('3429', ' ADE/SUMARTINAH ', '5', '888013687761', null, null, '2016-10-13', '0', ' 1KG ', '11000', '11000', '0', '3', '66', '2016-10-14', '2016-10-14');

-- ----------------------------
-- Table structure for `kb_option`
-- ----------------------------
DROP TABLE IF EXISTS `kb_option`;
CREATE TABLE `kb_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website_title` varchar(255) DEFAULT NULL,
  `website_desc` text,
  `company_name` varchar(160) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL,
  `contact_email` varchar(160) DEFAULT NULL,
  `contact_phone` varchar(160) DEFAULT NULL,
  `contact_fax` varchar(160) DEFAULT NULL,
  `contact_cellphone` varchar(160) DEFAULT NULL,
  `meta_title` varchar(160) DEFAULT NULL,
  `meta_author` varchar(160) DEFAULT NULL,
  `meta_desc` text,
  `meta_keywords` text,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `sosmed_fb` varchar(255) DEFAULT NULL,
  `sosmed_twitter` varchar(255) DEFAULT NULL,
  `sosmed_gplus` varchar(255) DEFAULT NULL,
  `sosmed_linkedin` varchar(255) DEFAULT NULL,
  `sosmed_instagram` varchar(255) DEFAULT NULL,
  `bbm_pin` varchar(255) DEFAULT NULL,
  `whatsapp_no` varchar(160) DEFAULT NULL,
  `telegram_no` varchar(160) DEFAULT NULL,
  `google_analytics` text,
  `facebook_pixel` text,
  `template` varchar(255) DEFAULT NULL,
  `gmap_iframe` text,
  `token_fb` varchar(255) DEFAULT NULL,
  `token_twitter` varchar(255) DEFAULT NULL,
  `token_instagram` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_option
-- ----------------------------
INSERT INTO `kb_option` VALUES ('1', 'Render231', 'Render Tech Production', 'Render Tech', 'Jl. Sarirasa No. 130/04', 'aswansetiawan01@gmail.com', '085722864906', '', '085722864906', 'Render Tech', 'Render Tech', 'Render Tech Production', 'Render Tech Production', '/savanacms/uploads/images/logo-savana%20copy.png', '/savanacms/uploads/images/logo-savanas%20copy.jpg', 'https://www.facebook.com/savanatech/', '#', '#', '#', 'https://www.instagram.com/savanatech/', '', '085722864906', '085722864906', '', '', 'rendertech', '<iframe frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15958.507260386861!2d123.0602316!3d0.5613751!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x32792ca7304c80ed%3A0x725fb22cb192a650!2sJalan+Arif+Rahman+Hakim!5e0!3m2!1sid!2s!4v1394182741524\" width=\"100%\" height=\"350\" frameborder=\"1\" style=\"border:1 solid #CCC;\"></iframe>', '', '', '');

-- ----------------------------
-- Table structure for `kb_permission`
-- ----------------------------
DROP TABLE IF EXISTS `kb_permission`;
CREATE TABLE `kb_permission` (
  `id_module` int(11) DEFAULT NULL,
  `id_user_group` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_view` enum('false','true') DEFAULT 'false',
  `is_add` enum('false','true') DEFAULT 'false',
  `is_edit` enum('false','true') DEFAULT 'false',
  `is_delete` enum('false','true') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `id_user_group` (`id_user_group`),
  KEY `id_module` (`id_module`),
  CONSTRAINT `kb_permission_ibfk_2` FOREIGN KEY (`id_user_group`) REFERENCES `kb_user_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kb_permission_ibfk_3` FOREIGN KEY (`id_module`) REFERENCES `kb_modules` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_permission
-- ----------------------------
INSERT INTO `kb_permission` VALUES ('1', '1', '2', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('2', '1', '3', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('3', '1', '4', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('4', '1', '5', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('5', '1', '6', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('6', '1', '7', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('7', '1', '8', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('8', '1', '9', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('11', '1', '10', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('13', '1', '11', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('14', '1', '12', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('15', '1', '13', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('16', '1', '14', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('20', '1', '15', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('21', '1', '16', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('23', '1', '18', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('24', '1', '19', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('25', '1', '20', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('26', '1', '21', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('27', '1', '22', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('26', '9', '23', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('27', '9', '24', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('26', '10', '25', 'true', 'true', 'true', '');
INSERT INTO `kb_permission` VALUES ('27', '10', '26', 'true', 'true', 'true', '');
INSERT INTO `kb_permission` VALUES ('28', '1', '27', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('29', '1', '28', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('29', '10', '29', 'true', 'false', 'true', 'false');
INSERT INTO `kb_permission` VALUES ('28', '9', '30', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('11', '9', '31', 'true', 'true', 'true', 'false');
INSERT INTO `kb_permission` VALUES ('8', '9', '32', 'true', 'true', 'true', 'false');
INSERT INTO `kb_permission` VALUES ('5', '9', '33', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('30', '1', '34', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('12', '1', '35', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission` VALUES ('31', '1', '36', 'true', 'true', 'true', 'true');

-- ----------------------------
-- Table structure for `kb_permission_backup`
-- ----------------------------
DROP TABLE IF EXISTS `kb_permission_backup`;
CREATE TABLE `kb_permission_backup` (
  `id_module` int(11) DEFAULT NULL,
  `id_user_group` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_view` enum('false','true') DEFAULT 'false',
  `is_add` enum('false','true') DEFAULT 'false',
  `is_edit` enum('false','true') DEFAULT 'false',
  `is_delete` enum('false','true') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `id_user_group` (`id_user_group`),
  KEY `id_module` (`id_module`),
  CONSTRAINT `kb_permission_backup_ibfk_2` FOREIGN KEY (`id_user_group`) REFERENCES `kb_user_type_backup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kb_permission_backup_ibfk_3` FOREIGN KEY (`id_module`) REFERENCES `kb_modules` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_permission_backup
-- ----------------------------
INSERT INTO `kb_permission_backup` VALUES ('1', '1', '2', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('2', '1', '3', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('3', '1', '4', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('4', '1', '5', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('5', '1', '6', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('6', '1', '7', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('7', '1', '8', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('8', '1', '9', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('11', '1', '10', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('13', '1', '11', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('14', '1', '12', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('15', '1', '13', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('16', '1', '14', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('20', '1', '15', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('21', '1', '16', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('23', '1', '18', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('24', '1', '19', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('25', '1', '20', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('26', '1', '21', 'true', '', '', '');
INSERT INTO `kb_permission_backup` VALUES ('1', '3', '22', 'true', 'false', 'false', 'false');
INSERT INTO `kb_permission_backup` VALUES ('2', '3', '23', 'true', 'false', 'false', 'false');
INSERT INTO `kb_permission_backup` VALUES ('3', '3', '24', 'true', '', '', '');
INSERT INTO `kb_permission_backup` VALUES ('4', '3', '25', 'true', '', '', '');
INSERT INTO `kb_permission_backup` VALUES ('6', '3', '26', 'true', 'true', 'false', 'false');
INSERT INTO `kb_permission_backup` VALUES ('8', '3', '27', 'true', 'false', 'false', 'false');
INSERT INTO `kb_permission_backup` VALUES ('12', '1', '28', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('27', '1', '29', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('28', '1', '30', 'true', 'true', 'true', 'true');
INSERT INTO `kb_permission_backup` VALUES ('29', '1', '31', 'true', 'true', 'true', 'true');

-- ----------------------------
-- Table structure for `kb_post_category`
-- ----------------------------
DROP TABLE IF EXISTS `kb_post_category`;
CREATE TABLE `kb_post_category` (
  `post_parent` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(160) DEFAULT NULL,
  `seo_url` varchar(255) DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`post_parent`),
  KEY `creator` (`creator`),
  CONSTRAINT `kb_post_category_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `kb_users_backup` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_post_category
-- ----------------------------
INSERT INTO `kb_post_category` VALUES ('1', 'Blog', 'blog', '1', '2016-06-23 11:51:35', null);
INSERT INTO `kb_post_category` VALUES ('2', 'Pricing', 'pricing', '1', '2016-06-23 02:12:11', null);
INSERT INTO `kb_post_category` VALUES ('3', 'Runningtext', 'runningtext', '1', '2016-06-27 03:38:07', null);

-- ----------------------------
-- Table structure for `kb_posts`
-- ----------------------------
DROP TABLE IF EXISTS `kb_posts`;
CREATE TABLE `kb_posts` (
  `id_post` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` bigint(20) NOT NULL,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_parent` int(11) NOT NULL,
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  `post_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_post`),
  KEY `user` (`user`),
  KEY `post_parent` (`post_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_posts
-- ----------------------------
INSERT INTO `kb_posts` VALUES ('1', '1', '2016-06-23 00:00:00', '2016-06-23 11:23:45', '', 'Home', '', 'publish', 'on', '2016-06-23 00:00:00', '2016-10-16 03:40:47', '0', 'page', '', '0', '', 'index', 'home');
INSERT INTO `kb_posts` VALUES ('2', '1', '2016-06-23 00:00:00', '2016-06-23 11:51:58', '<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tellus tincidunt, gravida ante vel, consequat nibh. Nunc vulputate mi sed fermentum bibendum. Nunc nunc nunc, molestie in risus sit amet, eleifend condimentum nisi. Fusce eu laoreet est. Fusce non libero in mauris aliquet vehicula. Vestibulum suscipit ante risus, a lobortis sapien gravida ut. Donec eget pharetra eros. Fusce in diam dapibus, consequat erat ac, convallis tortor. Vivamus vulputate maximus est, ac congue tortor sagittis sed. Pellentesque eget convallis ex. Curabitur eget dui dapibus, molestie lacus at, pellentesque quam. In tempor ut nisl sit amet viverra. Aliquam interdum pellentesque lacinia. Nam quis arcu facilisis, bibendum arcu at, molestie arcu.</p>\r\n<p>\r\n	Donec facilisis urna metus, vel cursus felis sodales vitae. Sed sodales, turpis vel semper imperdiet, mauris mi dignissim velit, quis hendrerit tortor nisl convallis nulla. Donec dignissim felis quis ipsum feugiat porttitor. Phasellus tempus odio consequat, imperdiet magna a, fermentum risus. Aenean dictum eros eu erat faucibus, in scelerisque nisl egestas. Aenean lobortis efficitur nulla quis dignissim. In a urna vitae ex luctus sagittis vel eget ipsum. Suspendisse non vulputate nulla.</p>\r\n<p>\r\n	Quisque vitae justo egestas sapien vulputate dictum at vitae urna. Proin faucibus bibendum ex commodo sodales. Vivamus eleifend eleifend felis, id semper odio viverra a. Donec est enim, aliquet sit amet lorem vitae, dignissim maximus arcu. Aliquam vel egestas risus. Morbi sed purus quis elit commodo mollis a fringilla metus. Praesent id rutrum mi. Aenean pretium sem finibus ante ultrices, quis vulputate tellus sagittis. Mauris sagittis rutrum massa, vitae vehicula sapien laoreet et.</p>\r\n<p>\r\n	Pellentesque at pellentesque leo. Aliquam eu odio mauris. Cras sit amet libero porttitor, consequat nisl sed, facilisis erat. Aliquam rutrum nec odio at semper. Aliquam at sem sed urna hendrerit rutrum ut at velit. Donec ac libero quis sem tincidunt dictum in id ex. Donec eu metus tempor, cursus ipsum a, convallis orci. Nulla aliquet imperdiet nisi id luctus. Nulla quis interdum nisl. Ut a blandit purus, id eleifend mi. Suspendisse potenti.</p>\r\n<p>\r\n	Sed sed sem vitae metus gravida finibus eget in ligula. Integer quis rutrum elit. Sed id tortor vitae lacus porta vestibulum et nec tortor. Etiam imperdiet neque ut mollis vehicula. Vestibulum eu mattis nisi, a sollicitudin dui. Mauris bibendum dictum eleifend. Suspendisse volutpat vel tellus eleifend eleifend. Fusce laoreet est non luctus condimentum.</p>\r\n', 'Lorem Ipsum', '', 'publish', 'on', '2016-06-23 00:00:00', '2016-10-15 10:22:56', '1', 'post', '', '0', '/savanacms/uploads/images/domains-that-never-sleep.png', null, 'lorem-ipsum');
INSERT INTO `kb_posts` VALUES ('3', '1', '2016-06-23 00:00:00', '2016-06-23 11:53:08', '<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tellus tincidunt, gravida ante vel, consequat nibh. Nunc vulputate mi sed fermentum bibendum. Nunc nunc nunc, molestie in risus sit amet, eleifend condimentum nisi. Fusce eu laoreet est. Fusce non libero in mauris aliquet vehicula. Vestibulum suscipit ante risus, a lobortis sapien gravida ut. Donec eget pharetra eros. Fusce in diam dapibus, consequat erat ac, convallis tortor. Vivamus vulputate maximus est, ac congue tortor sagittis sed. Pellentesque eget convallis ex. Curabitur eget dui dapibus, molestie lacus at, pellentesque quam. In tempor ut nisl sit amet viverra. Aliquam interdum pellentesque lacinia. Nam quis arcu facilisis, bibendum arcu at, molestie arcu.</p>\r\n<p>\r\n	Donec facilisis urna metus, vel cursus felis sodales vitae. Sed sodales, turpis vel semper imperdiet, mauris mi dignissim velit, quis hendrerit tortor nisl convallis nulla. Donec dignissim felis quis ipsum feugiat porttitor. Phasellus tempus odio consequat, imperdiet magna a, fermentum risus. Aenean dictum eros eu erat faucibus, in scelerisque nisl egestas. Aenean lobortis efficitur nulla quis dignissim. In a urna vitae ex luctus sagittis vel eget ipsum. Suspendisse non vulputate nulla.</p>\r\n<p>\r\n	Quisque vitae justo egestas sapien vulputate dictum at vitae urna. Proin faucibus bibendum ex commodo sodales. Vivamus eleifend eleifend felis, id semper odio viverra a. Donec est enim, aliquet sit amet lorem vitae, dignissim maximus arcu. Aliquam vel egestas risus. Morbi sed purus quis elit commodo mollis a fringilla metus. Praesent id rutrum mi. Aenean pretium sem finibus ante ultrices, quis vulputate tellus sagittis. Mauris sagittis rutrum massa, vitae vehicula sapien laoreet et.</p>\r\n<p>\r\n	Pellentesque at pellentesque leo. Aliquam eu odio mauris. Cras sit amet libero porttitor, consequat nisl sed, facilisis erat. Aliquam rutrum nec odio at semper. Aliquam at sem sed urna hendrerit rutrum ut at velit. Donec ac libero quis sem tincidunt dictum in id ex. Donec eu metus tempor, cursus ipsum a, convallis orci. Nulla aliquet imperdiet nisi id luctus. Nulla quis interdum nisl. Ut a blandit purus, id eleifend mi. Suspendisse potenti.</p>\r\n<p>\r\n	Sed sed sem vitae metus gravida finibus eget in ligula. Integer quis rutrum elit. Sed id tortor vitae lacus porta vestibulum et nec tortor. Etiam imperdiet neque ut mollis vehicula. Vestibulum eu mattis nisi, a sollicitudin dui. Mauris bibendum dictum eleifend. Suspendisse volutpat vel tellus eleifend eleifend. Fusce laoreet est non luctus condimentum.</p>\r\n', 'Lorem Ipsum 2', '', 'publish', 'on', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'post', '', '0', '/savanacms/uploads/images/domains-that-never-sleep.png', null, 'lorem-ipsum-2');
INSERT INTO `kb_posts` VALUES ('4', '1', '2016-06-23 00:00:00', '2016-06-23 11:53:34', '<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tellus tincidunt, gravida ante vel, consequat nibh. Nunc vulputate mi sed fermentum bibendum. Nunc nunc nunc, molestie in risus sit amet, eleifend condimentum nisi. Fusce eu laoreet est. Fusce non libero in mauris aliquet vehicula. Vestibulum suscipit ante risus, a lobortis sapien gravida ut. Donec eget pharetra eros. Fusce in diam dapibus, consequat erat ac, convallis tortor. Vivamus vulputate maximus est, ac congue tortor sagittis sed. Pellentesque eget convallis ex. Curabitur eget dui dapibus, molestie lacus at, pellentesque quam. In tempor ut nisl sit amet viverra. Aliquam interdum pellentesque lacinia. Nam quis arcu facilisis, bibendum arcu at, molestie arcu.</p>\r\n<p>\r\n	Donec facilisis urna metus, vel cursus felis sodales vitae. Sed sodales, turpis vel semper imperdiet, mauris mi dignissim velit, quis hendrerit tortor nisl convallis nulla. Donec dignissim felis quis ipsum feugiat porttitor. Phasellus tempus odio consequat, imperdiet magna a, fermentum risus. Aenean dictum eros eu erat faucibus, in scelerisque nisl egestas. Aenean lobortis efficitur nulla quis dignissim. In a urna vitae ex luctus sagittis vel eget ipsum. Suspendisse non vulputate nulla.</p>\r\n<p>\r\n	Quisque vitae justo egestas sapien vulputate dictum at vitae urna. Proin faucibus bibendum ex commodo sodales. Vivamus eleifend eleifend felis, id semper odio viverra a. Donec est enim, aliquet sit amet lorem vitae, dignissim maximus arcu. Aliquam vel egestas risus. Morbi sed purus quis elit commodo mollis a fringilla metus. Praesent id rutrum mi. Aenean pretium sem finibus ante ultrices, quis vulputate tellus sagittis. Mauris sagittis rutrum massa, vitae vehicula sapien laoreet et.</p>\r\n<p>\r\n	Pellentesque at pellentesque leo. Aliquam eu odio mauris. Cras sit amet libero porttitor, consequat nisl sed, facilisis erat. Aliquam rutrum nec odio at semper. Aliquam at sem sed urna hendrerit rutrum ut at velit. Donec ac libero quis sem tincidunt dictum in id ex. Donec eu metus tempor, cursus ipsum a, convallis orci. Nulla aliquet imperdiet nisi id luctus. Nulla quis interdum nisl. Ut a blandit purus, id eleifend mi. Suspendisse potenti.</p>\r\n<p>\r\n	Sed sed sem vitae metus gravida finibus eget in ligula. Integer quis rutrum elit. Sed id tortor vitae lacus porta vestibulum et nec tortor. Etiam imperdiet neque ut mollis vehicula. Vestibulum eu mattis nisi, a sollicitudin dui. Mauris bibendum dictum eleifend. Suspendisse volutpat vel tellus eleifend eleifend. Fusce laoreet est non luctus condimentum.</p>\r\n', 'Lorem ipsum 3', '', 'publish', 'on', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'post', '', '0', '/savanacms/uploads/images/domains-that-never-sleep.png', null, 'lorem-ipsum-3');
INSERT INTO `kb_posts` VALUES ('5', '1', '2016-06-23 00:00:00', '2016-06-23 02:12:58', '<ul class=\"p_list\">\r\n	<li>\r\n		Lorem</li>\r\n	<li>\r\n		Ipsum</li>\r\n	<li>\r\n		Dolor</li>\r\n	<li>\r\n		Sit&nbsp;</li>\r\n	<li>\r\n		Amet</li>\r\n</ul>\r\n', 'Pricing 1', '', 'publish', 'on', '2016-06-23 00:00:00', '2016-06-27 01:16:12', '2', 'post', '', '0', '', null, 'pricing-1');
INSERT INTO `kb_posts` VALUES ('6', '1', '2016-06-23 00:00:00', '2016-06-23 02:13:16', '<ul class=\"p_list\">\r\n	<li>\r\n		Lorem</li>\r\n	<li>\r\n		Ipsum</li>\r\n	<li>\r\n		Dolor</li>\r\n	<li>\r\n		Sit&nbsp;</li>\r\n	<li>\r\n		Amet</li>\r\n</ul>\r\n', 'Pricing 2', '', 'publish', 'on', '2016-06-23 00:00:00', '2016-06-27 01:17:56', '2', 'post', '', '0', '', null, 'pricing-2');
INSERT INTO `kb_posts` VALUES ('7', '1', '2016-06-23 00:00:00', '2016-06-23 04:05:16', '<p>\r\n	Render Tech Production berdiri pada tahun 2006, tetapi lebih berkembang pesat pada tahun 2007. Perusahaan ini bukan hanya membuat trend baru Multimedia yang hanya mempercantik saja,tetapi juga merupakan bagian dari pertunjukan itu sendiri. Sesuatu yang membuat perusahaan ini berbeda adalah, inovatif sebagai pemimpin yang membuat trend baru di dalam kepuasan konsumen. Pada tahun 2008 Render Tech Production membuka cabang pertama di kabupaten Bualemo sebuah pemikiran akan persaingan yang masih dimungkinkan bagi pemain daerah untuk bersaing di kota berkembang. Setelah cukup kemampuan dan instruktur untuk bersaing dengan perusahaan percetakan lainnya, perusahaan akhirnya memberanikan diri untuk membuka cabang ketiga dikecamatan Suwawa Tahun 2009. Selain itu juga Render Tech Production mengembangkan produksi Photo wedding dan komunitas pemerintahan swasta. Banyak bentuk produk yang selama ini di Gorontalo belum ada, pemimpin mencoba menciptakannya selain untuk memenuhi kebutuhan masyarakat Gorontalo di bidang Photography dan desain photo dan merupakan perkembangan perusahaan sendiri dalam memenuhi hasil yang maksimal.Bulan April 2009 Render Tech Production memutuskan untuk menjadikan perusahaan&nbsp; (CV) sehingga berubah nama menjadi CV RENDER TECH PRODUCTION. Berikut fasilitas-fasilitas yang tersedia di Render Tech Production :</p>\r\n<ul>\r\n	<li>\r\n		Ruang&nbsp; Percetakan Pas Photo,Wedding,dll.</li>\r\n	<li>\r\n		Ruang Editing Video</li>\r\n	<li>\r\n		Ruang Pas Photo</li>\r\n	<li>\r\n		RuangDesain</li>\r\n	<li>\r\n		Ruang PercetakanBaliho,Spanduk,dll</li>\r\n	<li>\r\n		Ruang Percetakan atau Memprint Photo</li>\r\n</ul>\r\n<p>\r\n	<br />\r\n	Visi dan Misi CV.Render Tech Production : &ldquo;MEMBERIKAN PELAYANAN TEBAIK DENGAN HASIL YANG MAKSIMAL&rdquo;</p>\r\n', 'Tentang Kami', '', 'publish', 'on', '2016-06-23 00:00:00', '2016-11-10 08:35:34', '0', 'page', '', '0', '', 'page_right_sidebar', 'tentang-kami');
INSERT INTO `kb_posts` VALUES ('10', '1', '2016-06-24 00:00:00', '2016-06-24 05:32:44', '', 'Kontak', '', 'publish', 'on', '2016-06-24 00:00:00', '2016-06-29 01:20:12', '0', 'page', '', '0', '', 'contact_fullwidth', 'kontak');
INSERT INTO `kb_posts` VALUES ('11', '1', '2016-06-27 00:00:00', '2016-06-27 03:38:43', '<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tellus tincidunt, gravida ante vel, consequat nibh. Nunc vulputate mi sed fermentum bibendum. Nunc nunc nunc, molestie in risus sit amet, eleifend condimentum nisi.</p>\r\n', 'Lorem Ipsum Runningtext', '', 'publish', 'on', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'post', '', '0', '', null, 'lorem-ipsum-runningtext');
INSERT INTO `kb_posts` VALUES ('12', '1', '2016-06-28 00:00:00', '2016-06-28 12:08:34', '<ul class=\"p_list\">\r\n	<li>\r\n		Lorem</li>\r\n	<li>\r\n		Ipsum</li>\r\n	<li>\r\n		Dolor</li>\r\n	<li>\r\n		Sit&nbsp;</li>\r\n	<li>\r\n		Amet</li>\r\n</ul>\r\n', 'Pricing 3', '', 'publish', 'on', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', 'post', '', '0', '', null, 'pricing-3');
INSERT INTO `kb_posts` VALUES ('14', '1', '2016-07-01 00:00:00', '2016-07-01 02:31:02', '', 'Produk', '', 'publish', 'on', '2016-07-01 00:00:00', '2016-11-10 05:14:35', '0', 'page', '', '0', '', 'product_fullwidth', 'produk');
INSERT INTO `kb_posts` VALUES ('15', '1', '2016-11-10 00:00:00', '2016-11-10 04:12:52', '', 'Register', '', 'publish', 'on', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', 'page', '', '0', '', 'register', 'register');
INSERT INTO `kb_posts` VALUES ('16', '1', '2016-11-10 00:00:00', '2016-11-10 08:36:50', '<p>\r\n	Untuk terus mempermudah metode pembayaran bagi para customer dan calon customer, kini kami menyediakan berbagai alternatif metode pembayaran, yaitu:</p>\r\n<p>\r\n	Mobile Banking<br />\r\n	Internet Banking<br />\r\n	SMS Banking<br />\r\n	Phone Banking<br />\r\n	ATM<br />\r\n	Transfer Bank</p>\r\n', 'Metode Pembayaran', '', 'publish', 'on', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', 'page', '', '0', '', 'page_right_sidebar', 'metode-pembayaran');
INSERT INTO `kb_posts` VALUES ('17', '1', '2016-11-10 00:00:00', '2016-11-10 08:38:38', '<ol>\r\n	<li>\r\n		Pilihlah pesanan yang sesuai dengan yang akan anda cetak, pastikan anda melihat berapa jam pengerjaan produk anda</li>\r\n	<li>\r\n		Klik &quot;Pesan Produk&quot; agar pesanan anda tersimpan dikeranjang belanja</li>\r\n	<li>\r\n		Jika anda telah selesai berbelanja pastikan anda memilih &quot;selesai belanja&quot; agar pesanan anda tertampung dalam daftar pesanan</li>\r\n	<li>\r\n		Isilah form registrasi untuk registrasi pelanggan agar anda menjadi pelanggan tetap dan tidak perlu mendaftar lagi jika ingin melakukan pemesanan</li>\r\n	<li>\r\n		Setelah melakukan proses pesanan pastikan mentransfer dana berdasarkan biaya produk yang telah anda pesan, isilah form &quot;konfirmasi pembayaran&quot; dan lampirkan foto bukti pembayaran anda.</li>\r\n	<li>\r\n		Tunggulah SMS dari perusahaan kami jika pesanan anda telah selesai dan siap dijemput berdasarkan jam kerja yang tertera.</li>\r\n</ol>\r\n', 'Cara Pemesanan', '', 'publish', 'on', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', 'page', '', '0', '', 'page_right_sidebar', 'cara-pemesanan');

-- ----------------------------
-- Table structure for `kb_products`
-- ----------------------------
DROP TABLE IF EXISTS `kb_products`;
CREATE TABLE `kb_products` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `author` bigint(11) DEFAULT NULL,
  `kode_produk` varchar(99) NOT NULL,
  `nama_produk` varchar(99) NOT NULL,
  `lama_pengerjaan` varchar(20) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `deskripsi` text NOT NULL,
  `bestseller` enum('F','T') DEFAULT 'F',
  `featured` enum('F','T') DEFAULT 'F',
  `meta_title` varchar(100) NOT NULL,
  `meta_keywords` varchar(160) NOT NULL,
  `meta_desc` text,
  `seo_url` text,
  `gambar_produk` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id_label` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `author` (`author`),
  KEY `id_label` (`id_label`),
  CONSTRAINT `kb_products_ibfk_1` FOREIGN KEY (`author`) REFERENCES `kb_users_backup` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_products
-- ----------------------------
INSERT INTO `kb_products` VALUES ('1', '1', 'BH', 'Baliho', '3 Hari', '<p>\r\n	Baliho adalah suatu sarana atau media berpromosi yang mempunyai unsur memberitakan informasi event atau kegiatan yang berhubungan dengan masyarakat luas, selain itu baliho juga digunakan untuk mengiklankan suatu produk baru. Dikenalnya baliho merupakan hasil dari kemajuan ilmu pengetahuan dan teknologi khususnya mesin cetak digital yang semakin canggih. Selain baliho kadang masyarakat memberikan informasinya bisa melalui pamflet, brosure, Bulletin, Majalah dan yang lainnya.</p>\r\n', '<p>\r\n	Baliho adalah suatu sarana atau media berpromosi yang mempunyai unsur memberitakan informasi event atau kegiatan yang berhubungan dengan masyarakat luas, selain itu baliho juga digunakan untuk mengiklankan suatu produk baru. Dikenalnya baliho merupakan hasil dari kemajuan ilmu pengetahuan dan teknologi khususnya mesin cetak digital yang semakin canggih. Selain baliho kadang masyarakat memberikan informasinya bisa melalui pamflet, brosure, Bulletin, Majalah dan yang lainnya.</p>\r\n', 'F', 'F', '', '', '', 'baliho', '/render231/uploads/images/LARGE-PRODUK-42852783.jpg', '/render231/uploads/.thumbs/images/LARGE-PRODUK-42852783.jpg', 'publish', '0', '2016-11-13 11:34:06', null);
INSERT INTO `kb_products` VALUES ('2', '1', 'XB', 'X-Banner', '2 Jam', '<p>\r\n	X Banner adalah media yang digunakan untuk menyampaikan informasi, berbentuk banner dengan konstruksi penyangga berbentuk &quot;X&quot; sehingga banner bisa berdiri sendiri. Konstruksi X Banner memiliki beberapa ukuran standart yaitu: 60x160 cm, 80x180 cm, dan 80x200 cm. X Banner pada umumnya berisi tentang suatu produk, layanan, fasilitas umum, profil perusahaan, sekolah, nama produk, perusahaan atau sekedar gambar saja. Isi X Banner di-design semenarik dan se-sederhana mungkin dimaksudkan agar audience tertarik tanpa harus mengerti dulu maksud dari isi X Banner tersebut.</p>\r\n', '<p>\r\n	X Banner adalah media yang digunakan untuk menyampaikan informasi, berbentuk banner dengan konstruksi penyangga berbentuk &quot;X&quot; sehingga banner bisa berdiri sendiri. Konstruksi X Banner memiliki beberapa ukuran standart yaitu: 60x160 cm, 80x180 cm, dan 80x200 cm. X Banner pada umumnya berisi tentang suatu produk, layanan, fasilitas umum, profil perusahaan, sekolah, nama produk, perusahaan atau sekedar gambar saja. Isi X Banner di-design semenarik dan se-sederhana mungkin dimaksudkan agar audience tertarik tanpa harus mengerti dulu maksud dari isi X Banner tersebut.</p>\r\n', 'F', 'F', '', '', '', 'x-banner', '/render231/uploads/images/LARGE-PRODUK-19403076.jpg', '/render231/uploads/.thumbs/images/LARGE-PRODUK-19403076.jpg', 'publish', '0', '2016-11-14 01:35:34', null);
INSERT INTO `kb_products` VALUES ('3', '1', 'SP', 'Spanduk', '2 Jam', '<p>\r\n	Spanduk adalah kain panjang yang dibentangkan dan berisi informasi singkat tentang suatu produk atau peringatan umum. Belakangan ini, spanduk menjadi pilihan media promosi paling favorit karena harganya yang murah namun ukurannya besar sehingga mudah tertangkap oleh target konsumen. Spanduk biasanya dipajang di tepi jalan atau melintang di tengah jalan sehingga banyak terbaca oleh pengguna jalan yang melewatinya.</p>\r\n', '<p>\r\n	Spanduk adalah kain panjang yang dibentangkan dan berisi informasi singkat tentang suatu produk atau peringatan umum. Belakangan ini, spanduk menjadi pilihan media promosi paling favorit karena harganya yang murah namun ukurannya besar sehingga mudah tertangkap oleh target konsumen. Spanduk biasanya dipajang di tepi jalan atau melintang di tengah jalan sehingga banyak terbaca oleh pengguna jalan yang melewatinya.</p>\r\n', 'F', 'F', '', '', '', 'spanduk', '/render231/uploads/images/MEDIUM-PRODUK-78860473.jpg', '/render231/uploads/.thumbs/images/MEDIUM-PRODUK-78860473.jpg', 'publish', '0', '2016-11-14 02:18:35', null);
INSERT INTO `kb_products` VALUES ('4', '1', 'UB', 'Umbul-umbul', '2 Jam', '<p>\r\n	Umbul-umbul adalah suatu media dari komunikasi massa yang berfungsi sebagai media promosi atau sponsor dan penggunaanya terpasang pada tempat-tempat umum dan bersifat strategis. Sedangkan jika dilihat dari bentuknya umbul-umbul bersifat suatu benda yang kecil memanjang dengan kain dan sejenisnya sebagai media tulisannya dan disangga dengan suatu tongkat dan terpasang secara memanjang berdiri.</p>\r\n', '<p>\r\n	Umbul-umbul adalah suatu media dari komunikasi massa yang berfungsi sebagai media promosi atau sponsor dan penggunaanya terpasang pada tempat-tempat umum dan bersifat strategis. Sedangkan jika dilihat dari bentuknya umbul-umbul bersifat suatu benda yang kecil memanjang dengan kain dan sejenisnya sebagai media tulisannya dan disangga dengan suatu tongkat dan terpasang secara memanjang berdiri.</p>\r\n', 'F', 'F', '', '', '', 'umbul-umbul', '/render231/uploads/images/LARGE-PRODUK-933838.jpg', '/render231/uploads/.thumbs/images/LARGE-PRODUK-933838.jpg', 'publish', '0', '2016-11-14 02:19:47', null);

-- ----------------------------
-- Table structure for `kb_products_category`
-- ----------------------------
DROP TABLE IF EXISTS `kb_products_category`;
CREATE TABLE `kb_products_category` (
  `id_prod_category` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(160) DEFAULT NULL,
  `seo_url` text,
  `user_id` bigint(20) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prod_category`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `kb_products_category_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `kb_users_backup` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_products_category
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_products_detail`
-- ----------------------------
DROP TABLE IF EXISTS `kb_products_detail`;
CREATE TABLE `kb_products_detail` (
  `id_detail_produk` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) DEFAULT NULL,
  `id_bahan` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `ukuran` char(25) DEFAULT NULL,
  `satuan` char(15) DEFAULT NULL,
  `berat` varchar(255) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `min_order` int(11) NOT NULL,
  PRIMARY KEY (`id_detail_produk`),
  KEY `id_produk` (`id_produk`),
  CONSTRAINT `kb_products_detail_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `kb_products` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_products_detail
-- ----------------------------
INSERT INTO `kb_products_detail` VALUES ('50', '1', null, '0', '0', '', null, '', '0', '0');
INSERT INTO `kb_products_detail` VALUES ('51', '2', null, '0', '0', '', null, '', '0', '0');
INSERT INTO `kb_products_detail` VALUES ('52', '3', null, '0', '0', '', null, '', '0', '0');
INSERT INTO `kb_products_detail` VALUES ('53', '4', null, '0', '0', '', null, '', '0', '0');

-- ----------------------------
-- Table structure for `kb_reseller_type`
-- ----------------------------
DROP TABLE IF EXISTS `kb_reseller_type`;
CREATE TABLE `kb_reseller_type` (
  `id_typereseller` int(11) NOT NULL AUTO_INCREMENT,
  `nama_type` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_typereseller`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_reseller_type
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_saldo_updated`
-- ----------------------------
DROP TABLE IF EXISTS `kb_saldo_updated`;
CREATE TABLE `kb_saldo_updated` (
  `id_reseller` bigint(11) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  KEY `id_reseller` (`id_reseller`),
  CONSTRAINT `kb_saldo_updated_ibfk_1` FOREIGN KEY (`id_reseller`) REFERENCES `kb_users_backup` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_saldo_updated
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_sales_report`
-- ----------------------------
DROP TABLE IF EXISTS `kb_sales_report`;
CREATE TABLE `kb_sales_report` (
  `id_sales` bigint(11) DEFAULT NULL,
  `month_date_time` datetime DEFAULT NULL,
  `jumlah_jual` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `id_target` int(11) DEFAULT NULL,
  KEY `id_target` (`id_target`),
  CONSTRAINT `kb_sales_report_ibfk_1` FOREIGN KEY (`id_target`) REFERENCES `kb_target_sales` (`id_target`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_sales_report
-- ----------------------------
INSERT INTO `kb_sales_report` VALUES ('2', '2016-05-02 00:00:00', '43', '2016-05-10 10:38:32', '3');
INSERT INTO `kb_sales_report` VALUES ('3', '2016-05-02 00:00:00', '24', '2016-05-10 10:39:06', '3');
INSERT INTO `kb_sales_report` VALUES ('4', '2016-05-02 00:00:00', '18', '2016-05-10 10:39:18', '3');
INSERT INTO `kb_sales_report` VALUES ('5', '2016-05-02 00:00:00', '76', '2016-05-10 10:40:30', '3');
INSERT INTO `kb_sales_report` VALUES ('6', '2016-05-02 00:00:00', '29', '2016-05-10 10:40:47', '3');
INSERT INTO `kb_sales_report` VALUES ('2', '2016-05-03 00:00:00', '59', '2016-05-10 10:41:08', '3');
INSERT INTO `kb_sales_report` VALUES ('3', '2016-05-03 00:00:00', '10', '2016-05-10 10:41:48', '3');
INSERT INTO `kb_sales_report` VALUES ('4', '2016-05-03 00:00:00', '42', '2016-05-10 10:42:04', '3');
INSERT INTO `kb_sales_report` VALUES ('5', '2016-05-03 00:00:00', '24', '2016-05-10 10:42:17', '3');
INSERT INTO `kb_sales_report` VALUES ('6', '2016-05-03 00:00:00', '38', '2016-05-10 10:42:33', '3');
INSERT INTO `kb_sales_report` VALUES ('2', '2016-05-04 00:00:00', '38', '2016-05-10 10:47:30', '3');
INSERT INTO `kb_sales_report` VALUES ('3', '2016-05-04 00:00:00', '63', '2016-05-10 10:47:47', '3');
INSERT INTO `kb_sales_report` VALUES ('4', '2016-05-04 00:00:00', '2', '2016-05-10 10:48:02', '3');
INSERT INTO `kb_sales_report` VALUES ('5', '2016-05-04 00:00:00', '1', '2016-05-10 10:48:22', '3');
INSERT INTO `kb_sales_report` VALUES ('6', '2016-05-04 00:00:00', '20', '2016-05-10 10:48:36', '3');
INSERT INTO `kb_sales_report` VALUES ('2', '2016-05-05 00:00:00', '6', '2016-05-10 10:48:58', '3');
INSERT INTO `kb_sales_report` VALUES ('3', '2016-05-05 00:00:00', '28', '2016-05-10 10:49:19', '3');
INSERT INTO `kb_sales_report` VALUES ('4', '2016-05-05 00:00:00', '20', '2016-05-10 10:49:36', '3');
INSERT INTO `kb_sales_report` VALUES ('5', '2016-05-05 00:00:00', '0', '2016-05-10 10:49:50', '3');
INSERT INTO `kb_sales_report` VALUES ('6', '2016-05-05 00:00:00', '7', '2016-05-10 10:50:13', '3');
INSERT INTO `kb_sales_report` VALUES ('3', '2016-05-06 00:00:00', '4', '2016-05-10 10:50:43', '3');
INSERT INTO `kb_sales_report` VALUES ('2', '2016-05-09 00:00:00', '45', '2016-05-10 10:51:54', '3');
INSERT INTO `kb_sales_report` VALUES ('3', '2016-05-09 00:00:00', '23', '2016-05-10 10:52:06', '3');
INSERT INTO `kb_sales_report` VALUES ('4', '2016-05-09 00:00:00', '33', '2016-05-10 10:52:18', '3');
INSERT INTO `kb_sales_report` VALUES ('5', '2016-05-09 00:00:00', '50', '2016-05-10 10:52:38', '3');
INSERT INTO `kb_sales_report` VALUES ('6', '2016-05-09 00:00:00', '45', '2016-05-10 10:52:50', '3');

-- ----------------------------
-- Table structure for `kb_shopping_cart`
-- ----------------------------
DROP TABLE IF EXISTS `kb_shopping_cart`;
CREATE TABLE `kb_shopping_cart` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `id_bahan` int(11) DEFAULT NULL,
  `id_model` int(11) DEFAULT NULL,
  `panjang` varchar(20) DEFAULT NULL,
  `lebar` varchar(20) DEFAULT NULL,
  `jasa_desain` enum('F','T') DEFAULT NULL,
  `judul` varchar(160) DEFAULT NULL,
  `isi` text,
  `jumlah` int(11) DEFAULT NULL,
  `jumlah_bayar` varchar(160) DEFAULT NULL,
  `tgl_pesan` date DEFAULT NULL,
  `jam_pesan` time DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_target_sales`
-- ----------------------------
DROP TABLE IF EXISTS `kb_target_sales`;
CREATE TABLE `kb_target_sales` (
  `id_target` int(11) NOT NULL AUTO_INCREMENT,
  `qty_target` int(11) DEFAULT NULL,
  `month_target` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `id_admin` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id_target`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_target_sales
-- ----------------------------
INSERT INTO `kb_target_sales` VALUES ('3', '11000', 'Mei 2016', '2016-05-10 10:27:44', '1');
INSERT INTO `kb_target_sales` VALUES ('4', '5000', 'Sep-2016', '2016-09-03 10:34:38', '1');

-- ----------------------------
-- Table structure for `kb_testimonial`
-- ----------------------------
DROP TABLE IF EXISTS `kb_testimonial`;
CREATE TABLE `kb_testimonial` (
  `id_testimonial` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `judul_id` text NOT NULL,
  `judul_en` text NOT NULL,
  `testimonial` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `url` text NOT NULL,
  `approval` enum('true','false') NOT NULL DEFAULT 'false',
  `email` varchar(255) DEFAULT NULL,
  `kota` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id_testimonial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_testimonial
-- ----------------------------
INSERT INTO `kb_testimonial` VALUES ('1', 'John Doe', 'Good', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tellus tincidunt, gravida ante vel, consequat nibh. Nunc vulputate mi sed fermentum bibendum. Nunc nunc nunc, molestie in risus sit amet, eleifend condimentum nisi. ', '', '2016-10-17', '#', 'true', '', '');
INSERT INTO `kb_testimonial` VALUES ('2', 'Elice Doe', 'Nice', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tellus tincidunt, gravida ante vel, consequat nibh. Nunc vulputate mi sed fermentum bibendum. Nunc nunc nunc, molestie in risus sit amet, eleifend condimentum nisi. ', '', '2016-06-23', '#', 'true', null, null);

-- ----------------------------
-- Table structure for `kb_user_detail`
-- ----------------------------
DROP TABLE IF EXISTS `kb_user_detail`;
CREATE TABLE `kb_user_detail` (
  `ID` bigint(11) NOT NULL,
  `name` varchar(160) DEFAULT NULL,
  `address` text,
  `phone` varchar(20) DEFAULT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `user_pic` varchar(255) DEFAULT NULL,
  `fb_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `bbm_pin` varchar(10) DEFAULT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `kb_user_detail_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `kb_users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_user_detail
-- ----------------------------
INSERT INTO `kb_user_detail` VALUES ('1', 'Administrator', 'Cimahi', '0223414312', '085722864906', '/savanacms/uploads/images/logo-savanas%20copy2.jpg', '#', '#', '#', '#', '#', '#');
INSERT INTO `kb_user_detail` VALUES ('2', 'Desoy', '', '', '', '/uploads/images/desoy.jpg', 'https://www.facebook.com/kaosnyabagus/', 'https://twitter.com/kaosnyabagus/', '', '', '5B4B6F93', '0856 4704 4767');
INSERT INTO `kb_user_detail` VALUES ('3', 'Desi', '', '', '', '/uploads/images/desi.jpg', 'https://www.facebook.com/kaosnyabagus/', 'https://twitter.com/kaosnyabagus/', '', '', 'D101F3CC', '0813 8000 2981');
INSERT INTO `kb_user_detail` VALUES ('4', 'Elsa', '', '', '', '/uploads/images/elsa.jpg', 'https://www.facebook.com/kaosnyabagus/', 'https://twitter.com/kaosnyabagus/', '', '', 'D141FCC5', '0813 8000 2982');
INSERT INTO `kb_user_detail` VALUES ('5', 'Erna', '', '', '', '/uploads/images/erna.jpg', 'https://www.facebook.com/kaosnyabagus/', 'https://twitter.com/kaosnyabagus/', '', '', 'D1423FC0', '0813 2000 7224');
INSERT INTO `kb_user_detail` VALUES ('6', 'Reni', '', '', '', '/uploads/images/reni.jpg', 'https://www.facebook.com/kaosnyabagus/', 'https://twitter.com/kaosnyabagus/', '', '', 'D17B9F60', '0813 2000 7223');
INSERT INTO `kb_user_detail` VALUES ('7', 'Gita', '', '', '', '/uploads/images/gita.jpg', 'https://www.facebook.com/kaosnyabagus/', 'https://twitter.com/kaosnyabagus/', '', '', 'D1778CB7', '0812 2230 1226');
INSERT INTO `kb_user_detail` VALUES ('8', 'Yujia', '', '', '', '/uploads/images/yujia.jpg', 'https://www.facebook.com/kaosnyabagus/', 'https://twitter.com/kaosnyabagus/', '', '', 'D18E9764', '0812 2230 1225');
INSERT INTO `kb_user_detail` VALUES ('9', 'Tuti muftiyati', 'Serang-Cilegon', '', '', '', 'AQILA OLSHOP', '', '', '', '5BC582D8', '081210726076');
INSERT INTO `kb_user_detail` VALUES ('10', 'Dewi Dyah', 'Mataram', '', '', '', 'Dhikr Kaos Bagus Keluarga Muslim', '', '', '', '5f6f5c6f', '081917074060');
INSERT INTO `kb_user_detail` VALUES ('11', 'Evi Fatmawati', 'Lampung', '', '', '', 'Qaleesya shop', '', '', '', '5D3A1725', '082319804299');
INSERT INTO `kb_user_detail` VALUES ('12', 'Siti Malihatun', 'Semarang', '', '', '', '', '', '', '', '7fab5571', '081228588444');
INSERT INTO `kb_user_detail` VALUES ('13', 'Suciana Puspita Aroem', 'Demak', '', '', '', 'Lapak Kecil Aufa', '', '', '', '542B3C99', '085727152253');
INSERT INTO `kb_user_detail` VALUES ('14', 'Yuniarsih', 'Batam', '', '', '', 'khanza dhikr collection', '', '', '', 'D0FBDF2E', '081927197100');
INSERT INTO `kb_user_detail` VALUES ('15', 'Lia Dahlia', 'Tangerang', '', '', '', '', '', '', '', '57DDD316', '085759508666');
INSERT INTO `kb_user_detail` VALUES ('16', 'Meryadi Priyasti Rahma', 'Magelang ', '', '', '', 'Nayyara Dhikr Magelang', '', '', '', '5ECA94BF', '085643889797');
INSERT INTO `kb_user_detail` VALUES ('17', 'Namira', 'Bukittinggi', '', '', '', 'de Saujie Colection', '', '', '', '5E772B1B', '081363033444');
INSERT INTO `kb_user_detail` VALUES ('18', 'Ani Faiqoh', 'Sorong', '', '', '', 'Griyaifa Dhikr', '', '', '', '5ED876A7', '085243810084');
INSERT INTO `kb_user_detail` VALUES ('19', 'Anggia Murni', 'Aceh', '', '', '', '', '', '', '', '5F382FE1', '081370129961');
INSERT INTO `kb_user_detail` VALUES ('20', 'Marchsellyna', 'Malang', '', '', '', '', '', '', '', '5F08AC5F', '081233926808');
INSERT INTO `kb_user_detail` VALUES ('21', 'Dyna Rizqyana', 'Makassar', '', '', '', '', '', '', '', '5D91E006', '082139214466');
INSERT INTO `kb_user_detail` VALUES ('22', 'Diah Komala', 'Jakarta', '', '', '', '', '', '', '', '587648b1', '087780923475');
INSERT INTO `kb_user_detail` VALUES ('23', 'Nur Rohati', 'Cilacap', '', '', '', 'D\'izha Shop', '', '', '', '53024eb7', '+65 90356593');
INSERT INTO `kb_user_detail` VALUES ('24', 'Yemmy', 'bengkulu  selatan', '', '', '', '', '', '', '', '5bc762a4', '085267055747');
INSERT INTO `kb_user_detail` VALUES ('25', 'Tini Munani', 'Tangerang', '', '', '', 'Dhikr Kaosku ', '', '', '', '5f62f0d4', '087784732698');
INSERT INTO `kb_user_detail` VALUES ('26', 'Jihan Maria Ulfa', 'Grobogan', '', '', '', '', '', '', '', '53dce250', '081326059895');
INSERT INTO `kb_user_detail` VALUES ('27', 'Tis atin', 'Tuban', '', '', '', 'Jio Store', '', '', '', '5983C810', '082142222816');
INSERT INTO `kb_user_detail` VALUES ('28', 'Sri budi rahayu', 'Magelang', '', '', '', 'Tazkia Muslimah', '', '', '', '5961AF4D', '08122716618');
INSERT INTO `kb_user_detail` VALUES ('29', 'Mala', 'Bekasi', '', '', '', 'maricha shop', '', '', '', '5CDE071C', '087781041513');
INSERT INTO `kb_user_detail` VALUES ('30', 'Irma Nurmala', 'Bekasi', '', '', '', 'Griya Biru Langit', '', '', '', '5f763f97', '082167618336');
INSERT INTO `kb_user_detail` VALUES ('32', 'Ina Agustina ', 'Mojokerto ', '', '', '', 'Dhikrmoker ', '', '', '', '3305d4ee', '085258206795');
INSERT INTO `kb_user_detail` VALUES ('33', 'Risna Hakim', 'Nunukan', '', '', '', '', '', '', '', '-', '082354680661');
INSERT INTO `kb_user_detail` VALUES ('34', 'Riska Yuliyanti', 'Cianjur', '', '', '', 'Gerai Anggoeun', '', '', '', '594372F2', '085721151336');
INSERT INTO `kb_user_detail` VALUES ('35', 'Rina Wati', 'Kutai Timur', '', '', '', '', '', '', '', '-', '082351881089');
INSERT INTO `kb_user_detail` VALUES ('36', 'Leonora', 'Jakarta Timur', '', '', '', 'Dhikr Clothes', '', '', '', '57819fec', '089636103490');
INSERT INTO `kb_user_detail` VALUES ('37', 'Fitri Wahyuni', 'Gowa', '', '', '', 'Elfatih Gallery', '', '', '', '53E4F6FA', '082194394882');
INSERT INTO `kb_user_detail` VALUES ('38', 'Nurida Isnaeni', 'Jambi', '', '', '', 'Griya Kanti', '', '', '', '57A235A6', '082306474671');
INSERT INTO `kb_user_detail` VALUES ('39', 'Yulianti J bt Juhadi', 'Cirebon', '', '', '', '', '', '', '', '2BB4E459', '0818232110');
INSERT INTO `kb_user_detail` VALUES ('40', 'Arfah Husna', 'Aceh', '', '', '', 'Titam Shop', '', '', '', '5740F228', '081362617121');
INSERT INTO `kb_user_detail` VALUES ('42', 'Nadia', 'Belu NTT', '', '', '', '', '', '', '', '5AEB3C41', '082210903140');
INSERT INTO `kb_user_detail` VALUES ('43', 'Mufliha', 'Lamongan', '', '082244906265', '', 'zasyifashop ', '', '', '', '57534E05', '081260658557');
INSERT INTO `kb_user_detail` VALUES ('44', 'Diah bunda F3', 'Kalideres Jakarta Barat', '', '081212256633', '', '', '', '', '', '', '087780923475');
INSERT INTO `kb_user_detail` VALUES ('45', 'Yunie Chandra', 'Malang', '', '', '', 'Griya Muslim Nadvada', '', '', '', '5B3034D9', '081333195120');
INSERT INTO `kb_user_detail` VALUES ('46', 'Verawaty Nento', 'Gorontalo Utara', '', '', '', 'SyifaSyafiq Shop', '', '', '', '56FCBE29', '085256760966');
INSERT INTO `kb_user_detail` VALUES ('47', 'Lia ahsanun iswati', 'Sleman Jogjakarta', '', '', '', 'lia ahsanun', '', '', '', '51736AF6', '081281359309');
INSERT INTO `kb_user_detail` VALUES ('48', 'Dwi Karsiwi Peni', 'Karanganyar Jawa Tengah', '', '', '', 'Griya Dhikr Solo', '', '', '', '5AD8713E', '08164276732');
INSERT INTO `kb_user_detail` VALUES ('49', 'Nur Hasanah', 'Tangerang', '081210922026', '081808141980 ', '', 'ALFA MUSLIM GALLERY', '', '', '', '5BEAF12B', '081210922026');
INSERT INTO `kb_user_detail` VALUES ('50', 'Ariyani', 'Jayapura', '', '', '', 'DHIKR Family', '', '', '', '7EB1AEB8', '08124805555');
INSERT INTO `kb_user_detail` VALUES ('51', 'Khoirunnisak', 'Mojokerto', '', '', '', 'Griya Rahmanda Fashion', '', '', '', '51FED001', '081332712667');
INSERT INTO `kb_user_detail` VALUES ('52', 'Listiawati', 'Kotabaru Karawang', '', '', '', 'alss collection', '', '', '', '5E8416FD', '085324813777');
INSERT INTO `kb_user_detail` VALUES ('53', 'Itut widyastuti', 'Cibubur Depok', '', '', '', 'galery Dhikr clothes', '', '', '', '5733E2CF', '085691457027');
INSERT INTO `kb_user_detail` VALUES ('54', 'siti nurjanah', 'Samarinda', '', '', '', 'janahjanah', '', '', '', '-', '085252500650');
INSERT INTO `kb_user_detail` VALUES ('55', 'Siti Nursila', 'Kutai Timur', '', '', '', 'Toko Tasya', '', '', '', '24D64ACC', '081350541077');
INSERT INTO `kb_user_detail` VALUES ('56', 'Eka meiasih', 'Semarang', '', '', '', 'Nazril colaction', '', '', '', '5239c13d', '085865530039');
INSERT INTO `kb_user_detail` VALUES ('57', 'Dewi yuliza', 'Tangerang', '', '', '', 'Berdikari / ambu Collection', '', '', '', '-', '08129699392');
INSERT INTO `kb_user_detail` VALUES ('58', 'Diana', 'Jatiwaringin Bekasi', '', '', '', 'FEBE dhikr', '', '', '', '7D832BF2', '081314566648');
INSERT INTO `kb_user_detail` VALUES ('59', 'Mintih Hermawanti', 'Cikarang Bekasi', '', '', '', 'Shandy Hijabstore', '', '', '', '26484532', '085781434225');
INSERT INTO `kb_user_detail` VALUES ('60', 'Mamah Dewa', 'Jakarta Utara', '', '', '', 'mama dewa zidane     ', '', '', '', '547d792b  ', '081932552087');
INSERT INTO `kb_user_detail` VALUES ('61', 'Kesy Sanusi. R', 'Jl. Jend. Sudirman Balantang Kec. Malili Kab. Luwu Timut Sulawesi Selatan', '', '081355498855', '', '', '', '', '', '7D76A51C', '081241523281');
INSERT INTO `kb_user_detail` VALUES ('62', 'Ulfah', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kb_user_detail` VALUES ('63', 'Kemala', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kb_user_detail` VALUES ('64', 'Alia', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kb_user_detail` VALUES ('65', 'Astri', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kb_user_detail` VALUES ('66', 'Fitri', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kb_user_detail` VALUES ('67', 'Meilina Nofari', 'Jl. Sukarelawan Komp. Meranti griya asri 2 Blok. DD. 3 rt.4 rw.1 kel. Mentaos kec  Banjarbaru utara Kal-Sel', '', '081349642081', '', 'Meilina Nofari', '', '', 'Meilina Nofari', '', '081349642081');
INSERT INTO `kb_user_detail` VALUES ('68', 'Sovia realolina', 'Jl lintas bengkulu-padang desa pasar baru lubuk pinang kecamatan lubuk pinang kabupaten mukomuko provinsi bengkulu', '+6281364212499', '+6281364212499', null, null, null, null, null, '57F429AF', '81364212499');
INSERT INTO `kb_user_detail` VALUES ('69', 'Eko Putro', 'dsadsad', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `kb_user_detail_backup`
-- ----------------------------
DROP TABLE IF EXISTS `kb_user_detail_backup`;
CREATE TABLE `kb_user_detail_backup` (
  `ID` bigint(11) NOT NULL,
  `name` varchar(160) DEFAULT NULL,
  `address` text,
  `phone` varchar(20) DEFAULT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `user_pic` varchar(255) DEFAULT NULL,
  `fb_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `bbm_pin` varchar(10) DEFAULT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `kb_user_detail_backup_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `kb_users_backup` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_user_detail_backup
-- ----------------------------
INSERT INTO `kb_user_detail_backup` VALUES ('1', 'Administrator', 'Cimahi', '0223414312', '085722864906', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `kb_user_type`
-- ----------------------------
DROP TABLE IF EXISTS `kb_user_type`;
CREATE TABLE `kb_user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(160) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_user_type
-- ----------------------------
INSERT INTO `kb_user_type` VALUES ('1', 'Administrator', '2016-03-02 00:00:00', '2016-03-05 18:27:02');
INSERT INTO `kb_user_type` VALUES ('3', 'Sales', '2016-04-15 21:51:19', null);
INSERT INTO `kb_user_type` VALUES ('4', 'Sub agen', '2016-06-02 10:12:16', null);
INSERT INTO `kb_user_type` VALUES ('6', 'Agen', '2016-06-07 08:35:41', null);
INSERT INTO `kb_user_type` VALUES ('9', 'Staff', '2016-07-27 13:58:07', null);
INSERT INTO `kb_user_type` VALUES ('10', 'administrasi', '2016-07-29 08:11:53', '2016-07-29 08:12:45');

-- ----------------------------
-- Table structure for `kb_user_type_backup`
-- ----------------------------
DROP TABLE IF EXISTS `kb_user_type_backup`;
CREATE TABLE `kb_user_type_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(160) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_user_type_backup
-- ----------------------------
INSERT INTO `kb_user_type_backup` VALUES ('1', 'Administrator', '2016-03-02 00:00:00', '2016-03-05 18:27:02');
INSERT INTO `kb_user_type_backup` VALUES ('3', 'Sales', '2016-04-15 21:51:19', null);
INSERT INTO `kb_user_type_backup` VALUES ('4', 'Sub agen', '2016-06-02 10:12:16', null);
INSERT INTO `kb_user_type_backup` VALUES ('6', 'Agen', '2016-06-07 08:35:41', null);

-- ----------------------------
-- Table structure for `kb_users`
-- ----------------------------
DROP TABLE IF EXISTS `kb_users`;
CREATE TABLE `kb_users` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `user_type` int(11) DEFAULT NULL,
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` varchar(255) NOT NULL,
  `referral_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_type` (`user_type`),
  CONSTRAINT `kb_users_ibfk_2` FOREIGN KEY (`user_type`) REFERENCES `kb_user_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_users
-- ----------------------------
INSERT INTO `kb_users` VALUES ('1', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator', 'superadmin@savana-tech.com', '', '2016-03-02 00:00:00', '', '0', '1', 'Admin', 'administrator', null);
INSERT INTO `kb_users` VALUES ('2', 'desoy', '601f1889667efaebb33b8c12572835da3f027f78', '', 'desoy@kaosnyabagus.com', '', '2016-05-10 08:12:50', 'c968fefccc0058e1bbef3c54cf60084024e722ab', '0', '3', 'Desoy', 'Customer Service', null);
INSERT INTO `kb_users` VALUES ('3', 'desi1', '601f1889667efaebb33b8c12572835da3f027f78', '', 'desi@kaosnyabagus.com', '', '2016-05-10 10:22:13', '575ad1dce46cefa6749e1bd3c73a9631d9883aad', '0', '3', 'Desi1', 'Customer Service', null);
INSERT INTO `kb_users` VALUES ('4', 'elsa', '601f1889667efaebb33b8c12572835da3f027f78', '', 'elsa@kaosnyabagus.com', '', '2016-05-10 10:22:38', 'cbb1d1229a7be2367c5d367d00a15607d9f261f9', '0', '9', 'Elsa', 'Customer Service', null);
INSERT INTO `kb_users` VALUES ('5', 'erna', '601f1889667efaebb33b8c12572835da3f027f78', '', 'erna@kaosnyabagus.com', '', '2016-05-10 10:22:59', '3072e96aff2cfecf8365fe181e368a4a2f455dd3', '0', '3', 'Erna', 'Customer Service', null);
INSERT INTO `kb_users` VALUES ('6', 'reni', '601f1889667efaebb33b8c12572835da3f027f78', '', 'reni@kaosnyabagus.com', '', '2016-05-10 10:23:18', '792357391b32bb6a7f58afb57696f0251b6bc5d7', '0', '3', 'Reni', '', null);
INSERT INTO `kb_users` VALUES ('7', 'gita', '601f1889667efaebb33b8c12572835da3f027f78', '', 'gita@kaosnyabagus.com', '', '2016-05-10 10:25:12', 'bee424d92955045b921fcbb1a937161685d0b0ed', '0', '9', 'Gita', 'Customer Service', null);
INSERT INTO `kb_users` VALUES ('8', 'yujia', '601f1889667efaebb33b8c12572835da3f027f78', '', 'yujia@kaosnyabagus.com', '', '2016-05-10 10:25:31', '9e274885e94298288ca76dd0904dc5adb0c115ae', '0', '3', 'Yujia', 'Customer Service', null);
INSERT INTO `kb_users` VALUES ('9', 'tutimufti', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 08:37:46', '1ea74fc9a0c46e6b656cbfcdf2800d21370ac8f6', '0', '6', 'Tutimufti', '', null);
INSERT INTO `kb_users` VALUES ('10', 'Dewi Dyah', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:02:03', 'b499b6820705ebca576222b9d8870e5b415d6bec', '0', '6', 'Dewi Dyah', '', null);
INSERT INTO `kb_users` VALUES ('11', 'evi fatmawati', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:03:39', '7939f61fe32a41d0875e84bb5a6624209746f83e', '0', '6', 'Evi fatmawati', '', null);
INSERT INTO `kb_users` VALUES ('12', 'Siti Malihatun', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:04:47', '8577443ac276eb1681a50b202ec84d863e06235b', '0', '6', 'Siti Malihatun', '', null);
INSERT INTO `kb_users` VALUES ('13', 'Suciana Puspita Aroem', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:05:56', 'd86b64991a9681240ebe440d8fc6d5ea4085f402', '0', '6', 'Suciana Puspita Aroem', '', null);
INSERT INTO `kb_users` VALUES ('14', 'Yuniarsih', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:07:20', 'b6a9eea2b13539dd441768abdcc91f5b0a9c9a3a', '0', '6', 'Yuniarsih', '', null);
INSERT INTO `kb_users` VALUES ('15', 'Lia Dahlia', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:09:02', 'ca30324c2f2cf672c94db869a36437746ced44aa', '0', '6', 'Lia Dahlia', '', null);
INSERT INTO `kb_users` VALUES ('16', 'Meryadi Priyasti Rahma', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:17:46', '37b36fe2dc0cd20b220af1c3ea43de788736a663', '0', '6', 'Meryadi Priyasti Rahma', '', null);
INSERT INTO `kb_users` VALUES ('17', 'Namira', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:18:40', '7c52a8d2f8cef59028608e39ad36c8450fb2b7dc', '0', '6', 'Namira', '', null);
INSERT INTO `kb_users` VALUES ('18', 'anifaiqoh', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:19:30', 'b934eb43f7f5804c350fa924a58c07315ae36d99', '0', '6', 'Anifaiqoh', '', null);
INSERT INTO `kb_users` VALUES ('19', 'Anggia Murni', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:20:40', 'cfb5776a41dc22341c2a7a1e636073c47436d60c', '0', '6', 'Anggia Murni', '', null);
INSERT INTO `kb_users` VALUES ('20', 'Marchsellyna', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:21:20', '6156c8d7e43ea91f80127a36bc73d41bdc0eca95', '0', '6', 'Marchsellyna', '', null);
INSERT INTO `kb_users` VALUES ('21', 'dyna rizqyana', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 10:22:18', '83c84be96629502cba26ec8ff952d8e74a9047dd', '0', '6', 'Dyna rizqyana', '', null);
INSERT INTO `kb_users` VALUES ('22', 'diahkomala', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 11:00:44', 'dc32374c334800ba77a29e29ac7c0fbfd613713c', '0', '6', 'Diahkomala', '', null);
INSERT INTO `kb_users` VALUES ('23', 'Nur Rohati', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 11:01:41', 'b4d7561d7ca41c90bca3e272cc0eae01941a18b1', '0', '6', 'Nur Rohati', '', null);
INSERT INTO `kb_users` VALUES ('24', 'yemmy', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 11:05:52', 'cbdd29052fa4c94cbc74a421789aeb924f3bf4d4', '0', '6', 'Yemmy', '', null);
INSERT INTO `kb_users` VALUES ('25', 'Tini Munani', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 11:06:54', '9fb478c80c86faa654efdc7f523884b93a337f3b', '0', '6', 'Tini Munani', '', null);
INSERT INTO `kb_users` VALUES ('26', 'Jihan Maria Ulfa', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 11:07:55', '07073fdae9307ded12e31315828087da7e97f0e2', '0', '6', 'Jihan Maria Ulfa', '', null);
INSERT INTO `kb_users` VALUES ('27', 'Tis atin', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 11:08:33', '2e6fe4d3f098fd47659bec0eb8c2d1c34eafe9cd', '0', '6', 'Tis atin', '', null);
INSERT INTO `kb_users` VALUES ('28', 'Sri budi rahayu', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 11:09:23', '9f9b530a77993915089a3625f108da2457965d47', '0', '6', 'Sri budi rahayu', '', null);
INSERT INTO `kb_users` VALUES ('29', 'Mala', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 11:10:02', '3dddd071f96ced7e13af92295110b1bc9a192e59', '0', '6', 'Mala', '', null);
INSERT INTO `kb_users` VALUES ('30', 'irma nurmala', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 11:13:44', '3a57307d73ce3996b5abcc95b61128e359f09ca6', '0', '6', 'Irma nurmala', '', null);
INSERT INTO `kb_users` VALUES ('32', 'ina agustina ', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 12:31:04', '24c9ffe579a03b0fa99917b69231d8996ff79dc4', '0', '6', 'Ina agustina ', '', null);
INSERT INTO `kb_users` VALUES ('33', 'Risna Hakim', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-07 12:31:40', 'a3a6d7c8f0f6a0b6436c9a6732225ae91566b497', '0', '6', 'Risna Hakim', '', null);
INSERT INTO `kb_users` VALUES ('34', 'Riska Yuliyanti', '601f1889667efaebb33b8c12572835da3f027f78', '', 'zikryridwansyah@ymail.com', '', '2016-06-08 14:47:45', 'bb4df2f15ec3b9da0b30dd7632a7b8756f0df281', '0', '6', 'Riska Yuliyanti', '', null);
INSERT INTO `kb_users` VALUES ('35', 'Rina Wati', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-08 14:49:00', '66adf060a154fb54ce679befc99f786b97589f4a', '0', '6', 'Rina Wati', '', null);
INSERT INTO `kb_users` VALUES ('36', 'Leonora', '601f1889667efaebb33b8c12572835da3f027f78', '', 'leonora.cantiq@gmail.com', '', '2016-06-08 14:49:51', '3f0079d2201ae2f1cd4a2ea5b5d402a5a2b6f877', '0', '6', 'Leonora', '', null);
INSERT INTO `kb_users` VALUES ('37', 'Fitri Wahyuni', '601f1889667efaebb33b8c12572835da3f027f78', '', 'uniucchang@gmail.com', '', '2016-06-08 14:51:17', 'dad6d0f6a89807354dc48dff10c33d9e37ecbe90', '0', '6', 'Fitri Wahyuni', '', null);
INSERT INTO `kb_users` VALUES ('38', 'Nurida Isnaeni', '601f1889667efaebb33b8c12572835da3f027f78', '', 'nshafiyyah@yahoo.com', '', '2016-06-08 14:52:46', '21bebb364c8875072996559376027231a1de1d59', '0', '6', 'Nurida Isnaeni', '', null);
INSERT INTO `kb_users` VALUES ('39', 'Yulianti J bt Juhadi', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-08 14:54:56', 'e1de4106daf2bb475ee51976ac5d0c5c44ec08db', '0', '6', 'Yulianti J bt Juhadi', '', null);
INSERT INTO `kb_users` VALUES ('40', 'Arfah Husna', '601f1889667efaebb33b8c12572835da3f027f78', '', 'Arfah_Husna@Yahoo.Com', '', '2016-06-08 14:56:57', '74865cbbe76aeef70f855e5a00a1789eac19240d', '0', '6', 'Arfah Husna', '', null);
INSERT INTO `kb_users` VALUES ('42', 'Nadia', '601f1889667efaebb33b8c12572835da3f027f78', '', 'Nadiasvtr@Gmail.Com', '', '2016-06-08 14:59:16', 'c10bae76ffe0d952127133c667c544d9390d4d3c', '0', '6', 'Nadia', '', null);
INSERT INTO `kb_users` VALUES ('43', 'Mufliha', '601f1889667efaebb33b8c12572835da3f027f78', '', 'zasyifashop@gmail.com ', '', '2016-06-08 15:00:29', '961ce910f4f3e529a1cda3c415b4803389597dfb', '0', '6', 'Mufliha', '', null);
INSERT INTO `kb_users` VALUES ('44', 'Diah bunda F3', '601f1889667efaebb33b8c12572835da3f027f78', '', 'bunda_fathen@yahoo.co.id', '', '2016-06-08 15:03:55', '1ad806b763518badfcfbb1b7a610746dc6e7f36d', '0', '6', 'Diah bunda F3', '', null);
INSERT INTO `kb_users` VALUES ('45', 'Yunie Chandra', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-08 15:08:21', 'ad8b51d4969a9fb2cbc81a70c358d88684341676', '0', '6', 'Yunie Chandra', '', null);
INSERT INTO `kb_users` VALUES ('46', 'Verawaty Nento', '601f1889667efaebb33b8c12572835da3f027f78', '', 'Verawaty.nento@gmail.com', '', '2016-06-08 15:09:27', '134b427c7a102bee8e1089dccb532f38c72fcc79', '0', '6', 'Verawaty Nento', '', null);
INSERT INTO `kb_users` VALUES ('47', 'Lia ahsanun iswati', '601f1889667efaebb33b8c12572835da3f027f78', '', 'lia.ahsanun123@gmail.com', '', '2016-06-08 15:10:53', 'd94cb7ef98d710406422dcd9b1e25ceba4818053', '0', '6', 'Lia ahsanun iswati', '', null);
INSERT INTO `kb_users` VALUES ('48', 'Dwi Karsiwi Peni', '601f1889667efaebb33b8c12572835da3f027f78', '', 'dwipenioke@gmail.com', '', '2016-06-08 15:12:01', '080ee75b30de59dd6ffe26436cfdf5e6315f25a0', '0', '6', 'Dwi Karsiwi Peni', '', null);
INSERT INTO `kb_users` VALUES ('49', 'Nurhasanah', '601f1889667efaebb33b8c12572835da3f027f78', '', 'Nurhasanah806503@Gmail.Com', '', '2016-06-08 15:27:47', 'cb2347ddbc4f3e186d0f7edb40870916efdadc38', '0', '6', 'Nurhasanah', '', null);
INSERT INTO `kb_users` VALUES ('50', 'Ariyani', '601f1889667efaebb33b8c12572835da3f027f78', '', 'anisa_zahran@yahoo.co.id', '', '2016-06-08 15:29:13', '90912f389cb84aef9a2785135efb435038f4ac2c', '0', '6', 'Ariyani', '', null);
INSERT INTO `kb_users` VALUES ('51', 'Khoirunnisak', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-13 08:59:57', '532b8a7125f00e3d4d6970d893a495d5b64fb5a5', '0', '6', 'Khoirunnisak', '', null);
INSERT INTO `kb_users` VALUES ('52', 'Listiawati', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-13 09:06:40', '7b5e690847a83981e99e42d3a705aca089ec1cc1', '0', '6', 'Listiawati', '', null);
INSERT INTO `kb_users` VALUES ('53', 'Itut widyastuti', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-13 09:20:21', '92abbeef6985ae7118c6bb676996c7dbfabce15d', '0', '6', 'Itut widyastuti', '', null);
INSERT INTO `kb_users` VALUES ('54', 'siti nurjanah', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-13 09:21:24', '83692a8fc57bcfbd80a1e1703b3decd8f3494063', '0', '6', 'Siti nurjanah', '', null);
INSERT INTO `kb_users` VALUES ('55', 'Siti Nursila', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-13 09:22:24', '79bfbce1ee7ea4d7e57931d2c18a59288121a4ad', '0', '6', 'Siti Nursila', '', null);
INSERT INTO `kb_users` VALUES ('56', 'Eka meiasih', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-13 09:27:45', '2ef83ebd758b27e9174f6d9d073f4c76ca0dc85e', '0', '6', 'Eka meiasih', '', null);
INSERT INTO `kb_users` VALUES ('57', 'Dewi yuliza', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-13 09:28:27', 'b668dd848cda727379d91e78b331daeb1288db33', '0', '6', 'Dewi yuliza', '', null);
INSERT INTO `kb_users` VALUES ('58', 'Diana', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-13 09:29:07', '003bd41b6a5976ab6629b093868fe32edceadf1d', '0', '6', 'Diana', '', null);
INSERT INTO `kb_users` VALUES ('59', 'Mintih Hermawanti', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-13 09:32:10', '445a33b3a601971791b515af6c30e43f31838e14', '0', '6', 'Mintih Hermawanti', '', null);
INSERT INTO `kb_users` VALUES ('60', 'Mamah Dewa', '601f1889667efaebb33b8c12572835da3f027f78', '', '-', '', '2016-06-13 09:34:51', 'ab1f589fd2ffae3b50b7ed5bec8e96d7ed66f853', '0', '6', 'Mamah Dewa', '', null);
INSERT INTO `kb_users` VALUES ('61', 'kesysanusi', '601f1889667efaebb33b8c12572835da3f027f78', '', 'kesyiful@gmail.com', '', '2016-07-25 13:23:11', 'fbc83d38e3ba6c7aeeee7d6dc2a70af9ba573284', '0', '6', 'Kesysanusi', '', null);
INSERT INTO `kb_users` VALUES ('62', 'ulfah', '601f1889667efaebb33b8c12572835da3f027f78', '', 'leaderkaosnyabagus@gmail.com', '', '2016-07-27 14:00:13', '9b2000d2b4e59f3f8f0d5fbd3f3807436abdfe6c', '0', '9', 'Ulfah', '', null);
INSERT INTO `kb_users` VALUES ('63', 'kemala', '601f1889667efaebb33b8c12572835da3f027f78', '', 'sosmedkaosnyabagus@gmail.com', '', '2016-07-27 14:01:29', '96964f9dea694354656fc333094473c1967a3043', '0', '9', 'Kemala', '', null);
INSERT INTO `kb_users` VALUES ('64', 'alia', '601f1889667efaebb33b8c12572835da3f027f78', '', 'contentkaosnyabagus@gmail.com', '', '2016-07-27 14:02:29', 'f5ce812538268f431cfc0742bbc122d9e3f53de8', '0', '9', 'Alia', '', null);
INSERT INTO `kb_users` VALUES ('65', 'astri', '601f1889667efaebb33b8c12572835da3f027f78', '', 'designkaosnyabagus@gmail.com', '', '2016-07-27 14:03:16', '83da5060ae5ac1e360367e5cc81fc49c94ae86b7', '0', '9', 'Astri', '', null);
INSERT INTO `kb_users` VALUES ('66', 'fitri', '601f1889667efaebb33b8c12572835da3f027f78', '', 'adkeukaosnyabagus@gmail.com', '', '2016-07-29 08:10:41', '04b0ae9dfc2eb590d70efbfc05af290a6d0723a2', '0', '10', 'Fitri', 'Accounting', null);
INSERT INTO `kb_users` VALUES ('67', 'meilina', '601f1889667efaebb33b8c12572835da3f027f78', '', 'meilinanofari@yahoo.com', '', '2016-08-02 14:44:01', 'd6571a12aebae4d11e11eac6fe5ce261953dc3ea', '0', '6', 'Meilina', '', null);
INSERT INTO `kb_users` VALUES ('68', '', '', 'Sovia realolina', 'lolinavia23@gmail.com', '', '2016-10-02 10:25:30', '205038a38f77745aa9c4a2ba165ed6e63a606f25', '0', '4', 'Sovia realolina', '', null);
INSERT INTO `kb_users` VALUES ('69', 'ekoputro', '601f1889667efaebb33b8c12572835da3f027f78', '', 'ekoputro@gmail.com', '', '2016-10-15 13:58:03', '6b24e89a9163fed809a56aaad8e415645e92ddde', '0', '6', 'Ekoputro', '', null);

-- ----------------------------
-- Table structure for `kb_users_backup`
-- ----------------------------
DROP TABLE IF EXISTS `kb_users_backup`;
CREATE TABLE `kb_users_backup` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `user_type` int(11) DEFAULT NULL,
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_type` (`user_type`),
  CONSTRAINT `kb_users_backup_ibfk_2` FOREIGN KEY (`user_type`) REFERENCES `kb_user_type_backup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_users_backup
-- ----------------------------
INSERT INTO `kb_users_backup` VALUES ('1', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator', 'superadmin@savana-tech.com', '', '2016-03-02 00:00:00', '', '0', '1', 'Admin', null);

-- ----------------------------
-- Table structure for `kb_usertypereseller`
-- ----------------------------
DROP TABLE IF EXISTS `kb_usertypereseller`;
CREATE TABLE `kb_usertypereseller` (
  `id_user` bigint(11) DEFAULT NULL,
  `reseller_type` int(11) DEFAULT NULL,
  KEY `id_user` (`id_user`),
  KEY `reseller_type` (`reseller_type`),
  CONSTRAINT `kb_usertypereseller_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `kb_users_backup` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kb_usertypereseller_ibfk_2` FOREIGN KEY (`reseller_type`) REFERENCES `kb_reseller_type` (`id_typereseller`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_usertypereseller
-- ----------------------------

-- ----------------------------
-- Table structure for `kb_widgets`
-- ----------------------------
DROP TABLE IF EXISTS `kb_widgets`;
CREATE TABLE `kb_widgets` (
  `id_widget` int(11) NOT NULL AUTO_INCREMENT,
  `nm_widget` varchar(255) DEFAULT NULL,
  `konten_text_widget` text,
  `konten_text_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `author` int(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_widget`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kb_widgets
-- ----------------------------
INSERT INTO `kb_widgets` VALUES ('5', 'slider_w', '', '1', null, null, '1', '2016-05-18 00:00:00', null);
INSERT INTO `kb_widgets` VALUES ('8', 'product_w', '<h2 style=\"text-align: center;\">\n	Katalog Produk</h2>\n', '0', '', null, '1', '2016-05-19 00:00:00', '2016-06-02 03:42:24');
INSERT INTO `kb_widgets` VALUES ('9', 'post_w', '', '9', '', null, '1', '2016-05-19 00:00:00', null);
INSERT INTO `kb_widgets` VALUES ('10', 'page_w', '', '7', '0', null, '1', '2016-05-19 00:00:00', '2016-06-23 04:06:16');
INSERT INTO `kb_widgets` VALUES ('11', 'testimonial_w', '<h3 style=\"text-align: center;\">\n	Testimonial</h3>\n', '0', '', null, '1', '2016-05-19 00:00:00', '2016-06-02 03:42:53');
INSERT INTO `kb_widgets` VALUES ('12', 'pricing_w', '<p>\r\n	PELUANG USAHA</p>\r\n', '2', '0', null, '1', '2016-05-19 00:00:00', '2016-06-27 01:04:29');
INSERT INTO `kb_widgets` VALUES ('14', 'team_w', '', '3', '', null, '1', '2016-05-21 00:00:00', null);
INSERT INTO `kb_widgets` VALUES ('16', 'runningtext_w', '', '3', '0', null, '1', '2016-05-30 11:10:55', '2016-06-27 03:38:55');
INSERT INTO `kb_widgets` VALUES ('17', 'blog_w', '<h2 style=\"text-align: center;\">\r\n	The amazing Builder</h2>\r\n<p style=\"text-align: center;\">\r\n	Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad&nbsp; voluptate velit esse cillum dolore eu fugiat.</p>\r\n', '1', '', null, '1', '2016-05-30 01:41:14', '2016-06-23 11:52:17');
INSERT INTO `kb_widgets` VALUES ('19', 'bank_w', '<p>\r\n	Bank</p>\r\n', '2', '0', null, '1', '2016-05-31 10:45:43', '2016-06-27 02:19:24');
INSERT INTO `kb_widgets` VALUES ('21', 'delivery_w', '<p>\r\n	Pengiriman</p>\r\n', '3', '0', null, '1', '2016-05-31 03:07:29', '2016-06-27 02:55:37');
INSERT INTO `kb_widgets` VALUES ('22', 'custom_w', '<a class=\"twitter-timeline\" data-widget-id=\"737616268274999296\" href=\"https://twitter.com/kaosnyabagus\">Tweets by @kaosnyabagus</a> <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+\"://platform.twitter.com/widgets.js\";fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");</script>', '0', '', null, '1', '2016-05-31 07:12:21', '2016-06-04 10:19:22');
