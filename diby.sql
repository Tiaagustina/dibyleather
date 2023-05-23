-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Mar 31, 2023 at 06:19 PM
-- Server version: 10.11.2-MariaDB-1:10.11.2+maria~ubu2204
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diby`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'administrator'),
(2, 'guest', 'guest');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 6),
(1, 8),
(2, 5),
(2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(65, '::1', 'feranigifta@gmail.com', 5, '2023-03-01 10:28:29', 1),
(67, '::1', 'feranigifta@gmail.com', 5, '2023-03-03 07:03:28', 1),
(70, '::1', 'feranigifta@gmail.com', 5, '2023-03-03 09:31:31', 1),
(75, '::1', 'admin@gmail.com', 6, '2023-03-07 16:48:34', 1),
(77, '::1', 'admin', 6, '2023-03-07 18:25:17', 0),
(78, '::1', 'admin@gmail.com', 6, '2023-03-07 18:32:20', 1),
(79, '::1', 'admin@gmail.com', 6, '2023-03-07 18:37:53', 1),
(80, '::1', 'rahmibinisuga@gmail.com', 7, '2023-03-07 18:41:29', 1),
(81, '::1', 'rahmibinisuga@gmail.com', 7, '2023-03-07 18:45:13', 1),
(82, '::1', 'admin@gmail.com', 6, '2023-03-07 19:00:06', 1),
(83, '::1', 'admin@gmail.com', 6, '2023-03-10 07:29:16', 1),
(84, '::1', 'admin@gmail.com', 6, '2023-03-10 09:09:09', 1),
(85, '::1', 'admin@gmail.com', 6, '2023-03-10 16:46:47', 1),
(86, '::1', 'admin@gmail.com', 6, '2023-03-16 10:11:54', 1),
(87, '::1', 'admin@gmail.com', 6, '2023-03-16 16:07:09', 1),
(88, '::1', 'admin@gmail.com', 6, '2023-03-18 16:51:25', 1),
(89, '::1', 'admin@gmail.com', 6, '2023-03-18 17:10:21', 1),
(90, '::1', 'admin@gmail.com', 6, '2023-03-18 18:16:38', 1),
(91, '::1', 'admin@gmail.com', 6, '2023-03-18 18:37:38', 1),
(92, '172.21.0.1', 'admin', NULL, '2023-03-31 16:50:57', 0),
(93, '172.21.0.1', 'admin@gmail.com', 6, '2023-03-31 16:51:36', 1),
(94, '172.21.0.1', 'admin@gmail.com', 6, '2023-03-31 16:52:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `meta_text` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `meta_text`, `title`, `image`) VALUES
(3, 'Beli yuk', 'Diby Leather', '1678088808_eb169f7dc03341bc85a0.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

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
  `updated_by` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `slug`, `kategori_id`, `deskripsi`, `harga`, `stok`, `berat`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
('BRG-27131', 'Tas Baru', 'tas-baru', 2, '<p>jdfsljfsdljk</p>', '300000', '200', '12', '2023-03-31 17:48:49', '6', '2023-03-31 17:48:49', '6'),
('BRG-31693', 'Tas Lagi', 'tas-lagi', 2, '<p>jdflsajfdslkfdlsflkjkl</p>', '340000', '20', '10', '2023-03-31 17:57:41', '6', '2023-03-31 17:57:41', '6');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id` int(11) NOT NULL,
  `pesanan_id` varchar(11) DEFAULT NULL,
  `barang_id` varchar(11) DEFAULT NULL,
  `jumlah` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id`, `pesanan_id`, `barang_id`, `jumlah`) VALUES
(35, 'INV-97205', 'BRG-57069', '4'),
(36, 'INV-97205', 'BRG-14279', '5'),
(37, 'INV-86593', 'BRG-57069', '4'),
(38, 'INV-71935', 'BRG-52907', '6'),
(39, 'INV-71935', 'BRG-63701', '9'),
(40, 'INV-37408', 'BRG-10892', '1'),
(41, 'INV-71460', 'BRG-10892', '1'),
(42, 'INV-71460', 'BRG-10892', '1');

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE `gambar` (
  `id` int(11) NOT NULL,
  `barang_id` varchar(11) DEFAULT NULL,
  `nama` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gambar`
--

INSERT INTO `gambar` (`id`, `barang_id`, `nama`) VALUES
(231, 'BRG-27131', 'img/BRG-27131/1.png'),
(232, 'BRG-27131', 'img/BRG-27131/10.jpg'),
(233, 'BRG-27131', 'img/BRG-27131/11.jpg'),
(234, 'BRG-27131', 'img/BRG-27131/12.jpg'),
(235, 'BRG-27131', 'img/BRG-27131/13.jpg'),
(236, 'BRG-27131', 'img/BRG-27131/14.jpg'),
(237, 'BRG-27131', 'img/BRG-27131/15.jpg'),
(238, 'BRG-27131', 'img/BRG-27131/16.jpg'),
(239, 'BRG-27131', 'img/BRG-27131/17.jpg'),
(240, 'BRG-27131', 'img/BRG-27131/18.jpg'),
(241, 'BRG-27131', 'img/BRG-27131/19.jpg'),
(242, 'BRG-27131', 'img/BRG-27131/2.png'),
(243, 'BRG-27131', 'img/BRG-27131/20.jpg'),
(244, 'BRG-27131', 'img/BRG-27131/21.jpg'),
(245, 'BRG-27131', 'img/BRG-27131/22.jpg'),
(246, 'BRG-27131', 'img/BRG-27131/23.jpg'),
(247, 'BRG-27131', 'img/BRG-27131/24.jpg'),
(248, 'BRG-27131', 'img/BRG-27131/25.jpg'),
(249, 'BRG-27131', 'img/BRG-27131/26.jpg'),
(250, 'BRG-27131', 'img/BRG-27131/27.png'),
(251, 'BRG-27131', 'img/BRG-27131/28.png'),
(252, 'BRG-27131', 'img/BRG-27131/29.png'),
(253, 'BRG-27131', 'img/BRG-27131/3.png'),
(254, 'BRG-27131', 'img/BRG-27131/30.png'),
(255, 'BRG-27131', 'img/BRG-27131/31.png'),
(256, 'BRG-27131', 'img/BRG-27131/32.jpg'),
(257, 'BRG-27131', 'img/BRG-27131/4.png'),
(258, 'BRG-27131', 'img/BRG-27131/5.jpg'),
(259, 'BRG-27131', 'img/BRG-27131/6.jpg'),
(260, 'BRG-27131', 'img/BRG-27131/7.jpg'),
(261, 'BRG-27131', 'img/BRG-27131/8.jpg'),
(262, 'BRG-27131', 'img/BRG-27131/9.jpg'),
(263, 'BRG-27131', 'img/BRG-27131/index.html'),
(264, 'BRG-31693', 'img/BRG-31693/01.png'),
(265, 'BRG-31693', 'img/BRG-31693/02.png'),
(266, 'BRG-31693', 'img/BRG-31693/03.png'),
(267, 'BRG-31693', 'img/BRG-31693/04.png'),
(268, 'BRG-31693', 'img/BRG-31693/05.jpg'),
(269, 'BRG-31693', 'img/BRG-31693/06.jpg'),
(270, 'BRG-31693', 'img/BRG-31693/07.jpg'),
(271, 'BRG-31693', 'img/BRG-31693/08.jpg'),
(272, 'BRG-31693', 'img/BRG-31693/09.jpg'),
(273, 'BRG-31693', 'img/BRG-31693/10.jpg'),
(274, 'BRG-31693', 'img/BRG-31693/11.jpg'),
(275, 'BRG-31693', 'img/BRG-31693/12.jpg'),
(276, 'BRG-31693', 'img/BRG-31693/13.jpg'),
(277, 'BRG-31693', 'img/BRG-31693/14.jpg'),
(278, 'BRG-31693', 'img/BRG-31693/15.jpg'),
(279, 'BRG-31693', 'img/BRG-31693/16.jpg'),
(280, 'BRG-31693', 'img/BRG-31693/17.jpg'),
(281, 'BRG-31693', 'img/BRG-31693/18.jpg'),
(282, 'BRG-31693', 'img/BRG-31693/19.jpg'),
(283, 'BRG-31693', 'img/BRG-31693/20.jpg'),
(284, 'BRG-31693', 'img/BRG-31693/21.jpg'),
(285, 'BRG-31693', 'img/BRG-31693/22.jpg'),
(286, 'BRG-31693', 'img/BRG-31693/23.jpg'),
(287, 'BRG-31693', 'img/BRG-31693/24.jpg'),
(288, 'BRG-31693', 'img/BRG-31693/25.jpg'),
(289, 'BRG-31693', 'img/BRG-31693/26.jpg'),
(290, 'BRG-31693', 'img/BRG-31693/27.png'),
(291, 'BRG-31693', 'img/BRG-31693/28.png'),
(292, 'BRG-31693', 'img/BRG-31693/29.png'),
(293, 'BRG-31693', 'img/BRG-31693/30.png'),
(294, 'BRG-31693', 'img/BRG-31693/31.png'),
(295, 'BRG-31693', 'img/BRG-31693/32.jpg'),
(296, 'BRG-31693', 'img/BRG-31693/index.html');

-- --------------------------------------------------------

--
-- Table structure for table `gambar_produk`
--

CREATE TABLE `gambar_produk` (
  `id` int(11) UNSIGNED NOT NULL,
  `barang_id` varchar(11) NOT NULL,
  `nama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `gambar_produk`
--

INSERT INTO `gambar_produk` (`id`, `barang_id`, `nama`) VALUES
(19, 'BRG-27131', '1680284929_012b90977c4d701a0bc6.jpg'),
(20, 'BRG-31693', '1680285461_b9de74488d415078cf7b.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'Tas Slempang'),
(2, 'Tas Tangan');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `barang_id` varchar(11) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1675771376, 1),
(2, '2023-03-18-174502', 'App\\Database\\Migrations\\GambarProduk', 'default', 'App', 1679162662, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `rekening` varchar(255) DEFAULT NULL,
  `no_rekening` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `nama`, `rekening`, `no_rekening`) VALUES
(1, 'Tobibi', 'BRI', '21331232');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `user_id`, `total`, `alamat`, `no_telp`, `create_at`) VALUES
('INV-37408', 7, '947000', 'jalan imam bonjol', '08888888888888', '2023-03-08 01:47:26'),
('INV-71460', 7, '1830000', 'jalan imam bonjol', '08888888888888', '2023-03-08 01:57:46'),
('INV-86593', 3, '48044000', 'Gejagan RT 02/RW 12, Gemblegan, Kalikotes, Klaten, Jawa Tengah 57451', '089634815186', '2023-02-16 17:12:04'),
('INV-97205', 2, '49245000', 'Gejagan RT 02/RW 12, Gemblegan, Kalikotes, Klaten, Jawa Tengah 57451', '089634815186', '2023-02-16 16:55:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `fullname`, `user_image`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'feranigifta@gmail.com', 'Fera', NULL, 'default.jpg', '$2y$10$gWLh6b6urBo3pzbCctHK5uVz8rW6OPjTEp9To0mnkHQOYt1Ay/L2W', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-03-01 10:28:20', '2023-03-01 10:28:20', NULL),
(6, 'admin@gmail.com', 'admin', NULL, 'default.jpg', '$2y$10$YracpnfESbWjC1jqjFRtJeUwuevmE57dLASHgJ0cEIzL5Goa3FG.y', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, '2023-03-07 16:14:21', '2023-03-07 16:14:21', NULL),
(7, 'rahmibinisuga@gmail.com', 'binisuga', NULL, 'default.jpg', '$2y$10$.6O49ulRMoCxrul7MLSWouxkg5DjSR/oOmB1KtP0LZZm4oBIfAcBy', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-03-07 18:41:09', '2023-03-07 18:41:09', NULL),
(8, 'admindiby@gmail.com', 'admin2', NULL, 'default.jpg', '$2y$10$QW3/auKJTVYm2gwt4Cu/3uT0saRnyWHTpWzsrB0L3.OXx/A2joRq6', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-03-10 17:46:11', '2023-03-10 17:46:11', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gambar`
--
ALTER TABLE `gambar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gambar_produk`
--
ALTER TABLE `gambar_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `gambar`
--
ALTER TABLE `gambar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `gambar_produk`
--
ALTER TABLE `gambar_produk`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
