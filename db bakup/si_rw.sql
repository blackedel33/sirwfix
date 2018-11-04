-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2018 at 04:59 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_rw`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'sekretaris', ''),
(4, 'bendahara', ''),
(5, 'rw', '');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tgl_komentar` date NOT NULL,
  `isi` varchar(255) NOT NULL,
  `id_warga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `judul`, `tgl_komentar`, `isi`, `id_warga`) VALUES
(2, 'test 2', '2018-10-04', 'komentar ke pak rw', 2),
(4, 'Wingi Prei', '2018-10-07', 'Aku pingin Prei', 3),
(5, 'judul', '2018-10-08', 'ini komentar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(33, '::1', 'paimanuri@gmail.com', 1541165347),
(34, '::1', 'rw', 1541165449),
(35, '::1', 'paimanuri@gmail.com', 1541165568),
(36, '::1', 'paimanuri@gmail.com', 1541166238),
(37, '::1', 'paimanuri@gmail.com', 1546437435),
(38, '::1', 'paimanuri@gmail.com', 1541167105),
(39, '::1', 'superman@superman.com', 1541167423),
(40, '::1', 'superman@gmail.com', 1541167445),
(41, '::1', 'paimanuri@gmail.com', 1541174079);

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tgl_posting` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `judul`, `tgl_posting`, `keterangan`, `foto`) VALUES
(13, 'Pengumuman bagi seluruh warga RT 900', '2018-10-05', 'Besok diadakan kerja bakti di sekolah. Soalnya sekolah kita sudah terlalu kotor, jadi butuh yang namanya kebersihan.', '1538903250.png'),
(14, 'Makan Bersama', '2018-10-05', 'Besok akan diadakan makan besar pada jam 12.00', ''),
(16, 'Makan Besar', '2018-10-07', 'Besok diadakan makan makan', '1538903347.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pembayaran`
--

CREATE TABLE `tabel_pembayaran` (
  `id_bayar` int(11) NOT NULL,
  `id_warga` int(11) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `nominal` int(11) NOT NULL,
  `denda` int(11) NOT NULL,
  `bulan` int(2) NOT NULL,
  `tahun` int(4) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `foto_bukti` varchar(255) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_pembayaran`
--

INSERT INTO `tabel_pembayaran` (`id_bayar`, `id_warga`, `tgl_bayar`, `nominal`, `denda`, `bulan`, `tahun`, `keterangan`, `foto_bukti`, `status`) VALUES
(1, 1, '2018-10-11', 50000, 0, 1, 2018, 'test', '1539257821.jpg', 'Y'),
(2, 3, '2018-10-11', 50000, 0, 1, 2018, 'momon', '1539258217.jpg', 'Y'),
(3, 3, '2018-10-08', 50000, 0, 2, 2018, 'Saya ingin makan nasi pecel malangs', '1539310343.jpg', 'Y'),
(4, 3, '2018-10-12', 50000, 0, 3, 2018, 'Saya mbayar', '1539314163.jpeg', 'Y'),
(5, 3, '2018-10-12', 50000, 110000, 4, 2018, 'Saya bayar lagi', '1539316219.png', 'Y'),
(6, 1, '2018-11-02', 50000, 60000, 2, 2018, 'Lunassss', '1541166286.png', 'Y'),
(7, 1, '2018-11-02', 50000, 60000, 3, 2018, '', '1541166396.png', 'Y'),
(8, 1, '2018-11-02', 50000, 120000, 4, 2018, '', '1541166654.png', 'Y'),
(9, 1, '2018-11-02', 50000, 60000, 5, 2018, '', '1541166858.png', 'Y'),
(10, 1, '2018-11-02', 50000, 50000, 6, 2018, '', '1541166879.png', 'Y'),
(11, 1, '2018-11-02', 50000, 40000, 7, 2018, '', '1541166896.jpg', 'Y'),
(12, 1, '2018-11-02', 50000, 30000, 8, 2018, '', '1541166935.jpg', 'Y'),
(13, 1, '2018-11-02', 50000, 20000, 9, 2018, '', '1541166950.jpg', 'Y'),
(14, 1, '2018-11-02', 50000, 10000, 10, 2018, '', '1541166965.png', 'Y'),
(15, 1, '2018-11-02', 50000, 0, 11, 2018, '', '1541166982.png', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1539299400, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '::1', 'sekretaris', '$2y$08$X/xBkd.LXktfIriev6p1PukaZTmtme0wFxFckIH1SAJwK.hiHCFuO', NULL, 'seketaris@seketaris.com', NULL, NULL, NULL, NULL, 1538813567, 1538899764, 1, 'seketaris', 'Seketaris', 'ADMIN', '08332348790'),
(3, '::1', 'bendahara', '$2y$08$AkcZQlTDE4OLYCdwrzOlXuTtn9Q0961CqZb.lUrs5M0nTDK2L6kSy', NULL, 'bendahara@bendahara.com', NULL, NULL, NULL, NULL, 1538813766, 1538976686, 1, 'Bendahara', 'bendahara', 'ADMIN', '0834434354'),
(4, '::1', 'rw', '$2y$08$d74W8UnHjm/ecS29gf2yi.vZFIZL1xH/ZR7NprX7yqaP133A2zh12', NULL, 'rw@rw.com', NULL, NULL, NULL, NULL, 1538813816, 1541167739, 1, 'rw', 'rw', 'ADMIN', '084934834589');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(5, 1, 1),
(6, 2, 3),
(9, 3, 4),
(11, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

CREATE TABLE `warga` (
  `id` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warga`
--

INSERT INTO `warga` (`id`, `nik`, `nama`, `jenis_kelamin`, `alamat`, `email`, `password`) VALUES
(1, '356676756788', 'PAIMANURI', 'L', 'Jl. Melati No. 15 RT. 99', 'paimanuri@gmail.com', '4ab7d9d3a2a915753862aa89e6ff319c'),
(3, '377483745876987', 'SUPERMAN', 'L', 'Jl. Melati No. 1 RT. 99', 'superman@gmail.com', '4ab7d9d3a2a915753862aa89e6ff319c');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabel_pembayaran`
--
ALTER TABLE `tabel_pembayaran`
  ADD PRIMARY KEY (`id_bayar`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tabel_pembayaran`
--
ALTER TABLE `tabel_pembayaran`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `warga`
--
ALTER TABLE `warga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
