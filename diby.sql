/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.13-MariaDB : Database - diby
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`diby` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `diby`;

/*Table structure for table `auth_activation_attempts` */

DROP TABLE IF EXISTS `auth_activation_attempts`;

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_activation_attempts` */

/*Table structure for table `auth_groups` */

DROP TABLE IF EXISTS `auth_groups`;

CREATE TABLE `auth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `auth_groups` */

insert  into `auth_groups`(`id`,`name`,`description`) values 
(1,'admin','administrator'),
(2,'guest','guest');

/*Table structure for table `auth_groups_permissions` */

DROP TABLE IF EXISTS `auth_groups_permissions`;

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`),
  CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_groups_permissions` */

/*Table structure for table `auth_groups_users` */

DROP TABLE IF EXISTS `auth_groups_users`;

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  KEY `group_id_user_id` (`group_id`,`user_id`),
  CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_groups_users` */

insert  into `auth_groups_users`(`group_id`,`user_id`) values 
(1,6),
(1,8),
(2,5),
(2,7);

/*Table structure for table `auth_logins` */

DROP TABLE IF EXISTS `auth_logins`;

CREATE TABLE `auth_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Data for the table `auth_logins` */

insert  into `auth_logins`(`id`,`ip_address`,`email`,`user_id`,`date`,`success`) values 
(65,'::1','feranigifta@gmail.com',5,'2023-03-01 10:28:29',1),
(67,'::1','feranigifta@gmail.com',5,'2023-03-03 07:03:28',1),
(70,'::1','feranigifta@gmail.com',5,'2023-03-03 09:31:31',1),
(75,'::1','admin@gmail.com',6,'2023-03-07 16:48:34',1),
(77,'::1','admin',6,'2023-03-07 18:25:17',0),
(78,'::1','admin@gmail.com',6,'2023-03-07 18:32:20',1),
(79,'::1','admin@gmail.com',6,'2023-03-07 18:37:53',1),
(80,'::1','rahmibinisuga@gmail.com',7,'2023-03-07 18:41:29',1),
(81,'::1','rahmibinisuga@gmail.com',7,'2023-03-07 18:45:13',1),
(82,'::1','admin@gmail.com',6,'2023-03-07 19:00:06',1),
(83,'::1','admin@gmail.com',6,'2023-03-10 07:29:16',1),
(84,'::1','admin@gmail.com',6,'2023-03-10 09:09:09',1),
(85,'::1','admin@gmail.com',6,'2023-03-10 16:46:47',1),
(86,'::1','admin@gmail.com',6,'2023-03-16 10:11:54',1),
(87,'::1','admin@gmail.com',6,'2023-03-16 16:07:09',1),
(88,'::1','admin@gmail.com',6,'2023-03-18 16:51:25',1),
(89,'::1','admin@gmail.com',6,'2023-03-18 17:10:21',1),
(90,'::1','admin@gmail.com',6,'2023-03-18 18:16:38',1),
(91,'::1','admin@gmail.com',6,'2023-03-18 18:37:38',1);

/*Table structure for table `auth_permissions` */

DROP TABLE IF EXISTS `auth_permissions`;

CREATE TABLE `auth_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_permissions` */

/*Table structure for table `auth_reset_attempts` */

DROP TABLE IF EXISTS `auth_reset_attempts`;

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_reset_attempts` */

/*Table structure for table `auth_tokens` */

DROP TABLE IF EXISTS `auth_tokens`;

CREATE TABLE `auth_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_tokens_user_id_foreign` (`user_id`),
  KEY `selector` (`selector`),
  CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `auth_tokens` */

/*Table structure for table `auth_users_permissions` */

DROP TABLE IF EXISTS `auth_users_permissions`;

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  KEY `user_id_permission_id` (`user_id`,`permission_id`),
  CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_users_permissions` */

/*Table structure for table `banner` */

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_text` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `banner` */

insert  into `banner`(`id`,`meta_text`,`title`,`image`) values 
(3,'Beli yuk','Diby Leather','1678088808_eb169f7dc03341bc85a0.jpg');

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id` varchar(11) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `deskripsi` longtext DEFAULT NULL,
  `harga` varchar(100) DEFAULT NULL,
  `stok` varchar(10) DEFAULT NULL,
  `berat` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` varchar(10) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `barang` */

insert  into `barang`(`id`,`nama`,`slug`,`kategori_id`,`deskripsi`,`harga`,`stok`,`berat`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
('BRG-03278','asdfgh','asdfgh',1,'<p>hgfdsa</p>','123456','21','1234','2023-03-18 23:53:18','6','2023-03-18 23:53:18','6'),
('BRG-07498','asdfgh','asdfgh',1,'<p>hgfdsa</p>','123456','21','1234','2023-03-19 00:03:50','6','2023-03-19 00:03:50','6'),
('BRG-10982','tassssssssssssssssssssssssssssssssssss','tassssssssssssssssssssssssssssssssssss',0,'<p>asdryui</p>','12345678','1','123','2023-03-19 00:04:39','6','2023-03-19 00:04:39','6'),
('BRG-29861','tas','tas',1,'<p>dfdd</p>','900000','10','500','2023-03-10 16:21:44','6','2023-03-10 16:21:44','6'),
('BRG-37605','Ratna Dwi yuli','ratna-dwi-yuli',1,'<p>fgh</p>','1','3','123','2023-03-19 01:43:12','6','2023-03-19 01:43:12','6'),
('BRG-42956','Sugaa','sugaa',2,'<p>ASDF</p>','WEDF','2','123','2023-03-16 23:08:48','6','2023-03-16 23:08:48','6'),
('BRG-67584','mixmax','mixmax',0,'<p>fgf</p>','900000','10','500','2023-03-10 16:10:29','6','2023-03-10 16:10:29','6'),
('BRG-81039','Rahmi Maulidiyah','rahmi-maulidiyah',2,'<p>asdfg</p>','123456','1','1234','2023-03-19 01:39:05','6','2023-03-19 01:39:05','6'),
('BRG-81547','Tas Kulit Slempang Wanita b2','tas-kulit-slempang-wanita',0,'<p>asdsad</p>','120000','100','500','2023-02-16 16:38:59','1','2023-02-16 16:38:59','1'),
('BRG-83402','Tas Kulit Slempang Wanita 1wi2','tas-kulit-slempang-wanita-1',0,'<p>sadasasdsad</p>','2000000','1000','500','2023-02-16 16:41:52','1','2023-02-16 16:41:52','1');

/*Table structure for table `detail_pesanan` */

DROP TABLE IF EXISTS `detail_pesanan`;

CREATE TABLE `detail_pesanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pesanan_id` varchar(11) DEFAULT NULL,
  `barang_id` varchar(11) DEFAULT NULL,
  `jumlah` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Data for the table `detail_pesanan` */

insert  into `detail_pesanan`(`id`,`pesanan_id`,`barang_id`,`jumlah`) values 
(35,'INV-97205','BRG-57069','4'),
(36,'INV-97205','BRG-14279','5'),
(37,'INV-86593','BRG-57069','4'),
(38,'INV-71935','BRG-52907','6'),
(39,'INV-71935','BRG-63701','9'),
(40,'INV-37408','BRG-10892','1'),
(41,'INV-71460','BRG-10892','1'),
(42,'INV-71460','BRG-10892','1');

/*Table structure for table `gambar` */

DROP TABLE IF EXISTS `gambar`;

CREATE TABLE `gambar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barang_id` varchar(11) DEFAULT NULL,
  `nama` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=latin1;

/*Data for the table `gambar` */

insert  into `gambar`(`id`,`barang_id`,`nama`) values 
(84,'0','1676540690_5efce6c1380a70c563b9.jpg'),
(122,'0','1678439566_c03938ba884335f5ec04.jpg'),
(123,'0','1678439566_654823971b0617af8c02.jpg'),
(124,'0','1678440104_0eb661a704cbba15b1f5.png'),
(125,'0','1678440104_1c07de12557f8d86a93e.png'),
(126,'0','1678440104_acfb14a2b34795426d11.png'),
(127,'0','1678440104_80dc0235e9486248f826.png'),
(128,'0','1678440104_ee1218bab85ec8bad1a5.jpg'),
(129,'0','1678440104_8c696601423288e4a796.jpg'),
(130,'0','1678440104_5baefc66a14bc1c9cf45.jpg'),
(131,'0','1678440104_3903d1c8b963d1d3bee6.jpg'),
(132,'0','1678440104_f11154615a0da1f6d933.jpg'),
(133,'0','1678440104_ca9a70f8e8b7a7edd29e.jpg'),
(134,'0','1678440104_ea5bfc8b700599a6a8e1.jpg'),
(135,'0','1678440104_00c21d31247b6ce54583.jpg'),
(136,'0','1678440104_81ede6a555396005f81a.jpg'),
(137,'0','1678440104_8186aef0502db9464fce.jpg'),
(138,'0','1678440104_03a866a26afceed8d0ab.jpg'),
(139,'0','1678440104_733bdc25c0b24c416323.jpg'),
(174,'0','1678982929_2fc59dab8bc59e5aac60.jpg'),
(175,'0','1679158398_685d5f009bacb3aeaead.png'),
(176,'0','1679158399_ea1e455d02808c17f861.png'),
(177,'0','1679158399_3b817efe63d4344ae86f.jpg'),
(178,'0','1679159030_40b75b4ace47aafe15fc.png'),
(179,'0','1679159030_ffad9c88d523fb57bba5.png'),
(180,'0','1679159030_263c0900b36c8971cc79.jpg'),
(181,'0','1679159080_58b1b8d45554d5e5d023.jpg'),
(182,'0','1679159080_3a1f4c172ed82c33be06.png'),
(183,'0','1679159080_863788359a2300f18b59.jpg'),
(194,'BRG-81039','1679164745_9eb5367c4867c51cb37e.jpg'),
(195,'BRG-81039','1679164745_7ef833cef63ab713b378.jpg'),
(196,'BRG-81039','1679164745_32ad984c57bb14f7f5a0.png'),
(197,'BRG-37605','1679164992_a615dd06820fdb6ec3ff.jpg');

/*Table structure for table `gambar_produk` */

DROP TABLE IF EXISTS `gambar_produk`;

CREATE TABLE `gambar_produk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `barang_id` varchar(11) NOT NULL,
  `nama` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `gambar_produk` */

insert  into `gambar_produk`(`id`,`barang_id`,`nama`) values 
(1,'BRG-90156','1679164354_b44188ada24cf7a5ea97.png'),
(2,'BRG-90156','1679164354_fc5480450f66cde34d70.png'),
(3,'BRG-90156','1679164354_5e8643a37d535502135a.jpg'),
(4,'BRG-90156','1679164354_ba00826f8a451274aefa.jpg'),
(5,'BRG-90156','1679164354_7f0a4715f8ab2dadda33.png'),
(6,'BRG-90156','1679164354_b0d8dae328ca62d56b0d.png'),
(7,'BRG-90156','1679164354_ca6ddbafffb9463a03d1.jpg'),
(8,'BRG-90156','1679164354_975db35d6b9eed29f3a7.png'),
(9,'BRG-81039','1679164745_9eb5367c4867c51cb37e.jpg'),
(10,'BRG-81039','1679164745_7ef833cef63ab713b378.jpg'),
(11,'BRG-81039','1679164745_32ad984c57bb14f7f5a0.png'),
(12,'BRG-81039','1679164745_90e6a68d118f8f89f84c.png'),
(13,'BRG-81039','1679164745_ed1e72ef1e0629cd03cf.png'),
(14,'BRG-81039','1679164745_a5444c767baa381b2fd0.png'),
(15,'BRG-81039','1679164745_c0ec955668f9e81d7eb9.png'),
(16,'BRG-37605','1679164992_bb4022710e1c1739843b.png');

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `kategori` */

insert  into `kategori`(`id`,`nama`) values 
(1,'Tas Slempang'),
(2,'Tas Tangan');

/*Table structure for table `keranjang` */

DROP TABLE IF EXISTS `keranjang`;

CREATE TABLE `keranjang` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `barang_id` varchar(11) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barang_id` (`barang_id`),
  CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `keranjang` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`version`,`class`,`group`,`namespace`,`time`,`batch`) values 
(1,'2017-11-20-223112','Myth\\Auth\\Database\\Migrations\\CreateAuthTables','default','Myth\\Auth',1675771376,1),
(2,'2023-03-18-174502','App\\Database\\Migrations\\GambarProduk','default','App',1679162662,2);

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `rekening` varchar(255) DEFAULT NULL,
  `no_rekening` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `pembayaran` */

insert  into `pembayaran`(`id`,`nama`,`rekening`,`no_rekening`) values 
(1,'Tobibi','BRI','21331232');

/*Table structure for table `pesanan` */

DROP TABLE IF EXISTS `pesanan`;

CREATE TABLE `pesanan` (
  `id` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pesanan` */

insert  into `pesanan`(`id`,`user_id`,`total`,`alamat`,`no_telp`,`create_at`) values 
('INV-37408',7,'947000','jalan imam bonjol','08888888888888','2023-03-08 01:47:26'),
('INV-71460',7,'1830000','jalan imam bonjol','08888888888888','2023-03-08 01:57:46'),
('INV-86593',3,'48044000','Gejagan RT 02/RW 12, Gemblegan, Kalikotes, Klaten, Jawa Tengah 57451','089634815186','2023-02-16 17:12:04'),
('INV-97205',2,'49245000','Gejagan RT 02/RW 12, Gemblegan, Kalikotes, Klaten, Jawa Tengah 57451','089634815186','2023-02-16 16:55:37');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `user_image` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`username`,`fullname`,`user_image`,`password_hash`,`reset_hash`,`reset_at`,`reset_expires`,`activate_hash`,`status`,`status_message`,`active`,`force_pass_reset`,`created_at`,`updated_at`,`deleted_at`) values 
(5,'feranigifta@gmail.com','Fera',NULL,'default.jpg','$2y$10$gWLh6b6urBo3pzbCctHK5uVz8rW6OPjTEp9To0mnkHQOYt1Ay/L2W',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2023-03-01 10:28:20','2023-03-01 10:28:20',NULL),
(6,'admin@gmail.com','admin',NULL,'default.jpg','$2y$10$YracpnfESbWjC1jqjFRtJeUwuevmE57dLASHgJ0cEIzL5Goa3FG.y',NULL,NULL,NULL,NULL,NULL,NULL,2,0,'2023-03-07 16:14:21','2023-03-07 16:14:21',NULL),
(7,'rahmibinisuga@gmail.com','binisuga',NULL,'default.jpg','$2y$10$.6O49ulRMoCxrul7MLSWouxkg5DjSR/oOmB1KtP0LZZm4oBIfAcBy',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2023-03-07 18:41:09','2023-03-07 18:41:09',NULL),
(8,'admindiby@gmail.com','admin2',NULL,'default.jpg','$2y$10$QW3/auKJTVYm2gwt4Cu/3uT0saRnyWHTpWzsrB0L3.OXx/A2joRq6',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2023-03-10 17:46:11','2023-03-10 17:46:11',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
